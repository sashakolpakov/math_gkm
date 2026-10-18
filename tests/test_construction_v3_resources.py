"""Sequential bounded host observations and explicitly simulated limit samples.
Not run during construction. Failures retain their workspace and raw receipts.
"""
import os
from pathlib import Path
import subprocess
import tempfile
import unittest
from types import SimpleNamespace
from unittest.mock import patch
from machinery import resources
from machinery.process import run
from machinery.study_common import ROOT,PYTHON,sha,write
from machinery.event_stream import events

class Resources(unittest.TestCase):
    def setUp(self):
        self.base=Path(tempfile.mkdtemp(dir=ROOT/'.scratch',prefix='v3-resources-'))
        print('RETAINED',self.base,flush=True)
        self.env={**os.environ,'TMPDIR':str(self.base),'GIT_CONFIG_NOSYSTEM':'1','GIT_CONFIG_GLOBAL':'/dev/null'}
    def test_stream_hash_and_event_parser(self):
        source=self.base/'large.olean'
        with source.open('wb') as f:
            for _ in range(32): f.write(b'x'*1048576)
        with patch.object(Path,'read_bytes',side_effect=AssertionError('must stream')):
            self.assertEqual(len(sha(source)),64)
        log=self.base/'events.jsonl'
        with log.open('wb') as f:
            f.write(b'x'*1048577+b'\n{"usage":{"calls":1}}\n')
        observed=list(events(log))
        self.assertEqual(observed[0]['type'],'usage_parse_failure')
        self.assertEqual(observed[1]['usage']['calls'],1)
    @patch.object(resources, 'darwin_profile', return_value=False)
    def test_simulated_disk_rss_process_and_monitor_failure(self, _linux_metric):
        table={123:dict(ppid=1,rss=1,identity='owned',command='python')}
        with patch.object(resources,'disk_bytes',return_value=0),patch.object(resources,'process_table',return_value=table), \
             patch.object(resources,'current_process',side_effect=lambda p: {k:table[p][k] for k in ('identity','ppid')} if p in table else None), \
             patch.object(resources,'cleanup_hold'), \
             patch.object(resources,'available_memory',return_value=16*resources.GiB), \
             patch.object(resources.shutil,'disk_usage',return_value=SimpleNamespace(free=16*resources.GiB)):
            guard=resources.Guard(123,self.base)
            guard.check(force=True)
            table[123]['rss']=6*resources.GiB
            with self.assertRaisesRegex(resources.ResourceFailure,'rss_hard'): guard.check(force=True)
            table[123]['rss']=1
            for n in range(124,149): table[n]=dict(ppid=123,rss=1,identity='owned child',command='python')
            with self.assertRaisesRegex(resources.ResourceFailure,'process_limit'): guard.check(force=True)
            table.clear(); table[123]=dict(ppid=1,rss=1,identity='owned',command='python')
            with patch.object(resources,'disk_bytes',return_value=2*resources.GiB):
                with self.assertRaisesRegex(resources.ResourceFailure,'disk_growth'): guard.check(force=True)
            with patch.object(resources.shutil,'disk_usage',return_value=SimpleNamespace(free=4*resources.GiB)):
                with self.assertRaisesRegex(resources.ResourceFailure,'disk_headroom'): guard.check(force=True)
            with patch.object(resources,'process_table',side_effect=resources.ResourceFailure('monitor_unavailable')):
                with self.assertRaisesRegex(resources.ResourceFailure,'monitor_unavailable'): guard.check(force=True)
        with patch.object(resources.shutil,'disk_usage',return_value=SimpleNamespace(free=7*resources.GiB)):
            with self.assertRaisesRegex(resources.ResourceFailure,'admission_disk'):
                with resources.admission(): self.fail('must refuse before launch')
    def test_owned_cleanup_checks_identity_not_unrelated_pid(self):
        guard=object.__new__(resources.Guard); guard.owned={111:'original',222:'gone'}
        table={111:dict(identity='recycled'),333:dict(identity='unrelated')}
        with patch.object(resources,'current_process',side_effect=lambda p: table.get(p)),patch.object(resources.os,'kill') as kill:
            guard.cleanup(); kill.assert_not_called()
    def test_actual_bounded_host_timeout_output_crash_and_cleanup(self):
        unrelated=subprocess.Popen([PYTHON,'-c','import time; time.sleep(20)'],start_new_session=True)
        try:
            crash=run([PYTHON,'-c','raise SystemExit(7)'],cwd=self.base,env=self.env,timeout=5)
            write(self.base/'crash.json',crash)
            self.assertEqual(crash['returncode'],7,crash)
            timeout=run([PYTHON,'-c','import subprocess,time; subprocess.Popen(["/bin/sleep","10"]); time.sleep(10)'],cwd=self.base,env=self.env,timeout=1)
            write(self.base/'timeout.json',timeout)
            self.assertEqual(timeout['termination'],'timeout',timeout)
            output=run([PYTHON,'-c','import sys; sys.stdout.write("x"*100000)'],cwd=self.base,env=self.env,timeout=5,output_bytes=1024)
            write(self.base/'output.json',output)
            self.assertEqual(output['termination'],'output_limit',output)
            self.assertIsNone(unrelated.poll(),'guard killed an unrelated process')
            for sample in timeout.get('resources',{}).get('last_samples',[]):
                self.assertLessEqual(sample['compilers'],1)
        finally:
            unrelated.kill(); unrelated.wait()
