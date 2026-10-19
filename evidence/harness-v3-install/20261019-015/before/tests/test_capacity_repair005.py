"""Small parser and simulated metric regressions; no positive math admission."""
import copy
import ctypes
import json
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch
from machinery import proof_audit, resources
from machinery.study_common import ROOT, Invalid, digest


class Parser005(unittest.TestCase):
    def setUp(self):
        self.base=Path(tempfile.mkdtemp(dir=ROOT/'.scratch',prefix='parser005-'))
        self.path=self.base/'declarations.json'
        self.record=dict(returncode=0,termination=None,stdout='GKM_DECLARATIONS_FILE_V1:declarations.json\n')
        c=dict(name='Fixture.used',origin='Fixture',type='type expression',body='body expression')
        self.rows=[dict(name='Root',axioms=['propext'],constants=[c],catalog=[{**c,'name':'Fixture.unused'}]),
                   dict(name='Interface',axioms=[],constants=[],catalog=[])]
    def parse(self):
        return proof_audit.parse_artifact(self.record,('Root','Interface'),self.path)
    def test_complete_catalog_order_body_and_semantic_hash(self):
        self.path.write_text(json.dumps(self.rows))
        with patch.object(Path,'read_text',side_effect=AssertionError('no whole text path')):
            rows=self.parse()
        expected=copy.deepcopy(self.rows)
        for row in expected:
            for c in row['constants']+row['catalog']:
                c['semantic_sha256']=digest(dict(type=c['type'],body=c['body']))
        self.assertEqual(rows,expected)
    def test_finite_size_boundary(self):
        raw=json.dumps(self.rows).encode(); self.path.write_bytes(raw)
        with patch.object(proof_audit,'ARTIFACT_BYTES',len(raw)):
            self.assertEqual(len(self.parse()),2)
        with patch.object(proof_audit,'ARTIFACT_BYTES',len(raw)-1),self.assertRaises(Invalid):
            self.parse()
    def test_marker_exit_path_malformed_order_and_forbidden_premise(self):
        self.path.write_text(json.dumps(self.rows))
        for stdout in ('','GKM_DECLARATIONS_FILE_V1:other.json',self.record['stdout']*2,
                       self.record['stdout']+'GKM_DECLARATIONS_V1:[]'):
            with patch.dict(self.record,stdout=stdout),self.assertRaises(Invalid): self.parse()
        with patch.dict(self.record,returncode=1),self.assertRaises(Invalid): self.parse()
        self.path.write_text('{')
        with self.assertRaises(Invalid): self.parse()
        for rows in (self.rows[::-1],self.rows[:1],[{**self.rows[0],'axioms':['Hidden.generatedPremise']},self.rows[1]]):
            self.path.write_text(json.dumps(rows))
            with self.assertRaises(Invalid): self.parse()
        self.path.unlink(); self.path.symlink_to(self.base/'missing')
        with self.assertRaises(Invalid): self.parse()


class Resource005(unittest.TestCase):
    def setUp(self):
        self.base=Path(tempfile.mkdtemp(dir=ROOT/'.scratch',prefix='metric005-'))
    def test_darwin_charge_rss_absolute_footprint_hard_sustain_and_unavailable(self):
        GiB=resources.GiB
        table={123:dict(ppid=1,rss=6*GiB,command='lean')}
        native=dict(pid=123,birth='birth',phys_footprint_bytes=GiB,resident_bytes=6*GiB)
        with patch.object(resources,'darwin_profile',return_value=True), \
             patch.object(resources,'disk_bytes',return_value=0), \
             patch.object(resources,'process_table',return_value=table), \
             patch.object(resources,'current_process',return_value=dict(identity='birth',ppid=1)), \
             patch.object(resources,'required_os_free_percent',return_value=61), \
             patch.object(resources,'available_memory',return_value=16*GiB), \
             patch.object(resources.shutil,'disk_usage',return_value=SimpleNamespace(free=16*GiB)), \
             patch.object(resources,'native_footprint',side_effect=lambda *_:dict(native)) as metric, \
             patch.object(resources,'cleanup_hold') as hold, \
             patch.object(resources.time,'monotonic',return_value=100) as clock:
            guard=resources.Guard(123,self.base); guard.check(force=True)
            self.assertEqual(guard.samples[-1]['charged_phys_footprint'],GiB)
            self.assertEqual(guard.samples[-1]['rss_sum'],6*GiB)
            table[123]['rss']=9*GiB
            with self.assertRaisesRegex(resources.ResourceFailure,'rss_absolute'): guard.check(force=True)
            table[123]['rss']=6*GiB; native['phys_footprint_bytes']=6*GiB
            with self.assertRaisesRegex(resources.ResourceFailure,'footprint_hard'): guard.check(force=True)
            native['phys_footprint_bytes']=GiB; guard.check(force=True)
            native['phys_footprint_bytes']=4*GiB+1; clock.return_value=101; guard.check(force=True)
            clock.return_value=104
            with self.assertRaisesRegex(resources.ResourceFailure,'footprint_sustained'): guard.check(force=True)
            metric.side_effect=resources.ResourceFailure('monitor_unavailable: simulated native failure')
            with self.assertRaisesRegex(resources.ResourceFailure,'monitor_unavailable'): guard.check(force=True)
            hold.assert_called()
            receipt=guard.receipt()
            self.assertEqual(receipt['peak_rss_observed'],9*GiB)
            self.assertEqual(receipt['peak_charged_phys_footprint_observed'],6*GiB)
            self.assertEqual(receipt['profile']['sha256'],resources.PROFILE_SHA256)
    def test_native_return_and_birth_rechecks(self):
        class Usage(ctypes.Structure):
            _fields_=[('ri_proc_start_abstime',ctypes.c_uint64),('ri_phys_footprint',ctypes.c_uint64),('ri_resident_size',ctypes.c_uint64)]
        def query(pid,flavor,ptr):
            self.assertEqual(flavor,4)
            ptr._obj.ri_proc_start_abstime=1; ptr._obj.ri_phys_footprint=42
            return 0
        lib=SimpleNamespace(proc_pid_rusage=query)
        birth=dict(identity='birth',ppid=1)
        with patch.object(resources,'darwin_rusage_api',return_value=(ctypes,lib,Usage)), \
             patch.object(resources,'current_process',return_value=birth) as current:
            self.assertEqual(resources.native_footprint(123,'birth')['phys_footprint_bytes'],42)
            current.side_effect=[birth,dict(identity='recycled',ppid=1)]
            with self.assertRaisesRegex(resources.ResourceFailure,'birth after'): resources.native_footprint(123,'birth')
            current.side_effect=None; lib.proc_pid_rusage=lambda *_:-1
            with self.assertRaisesRegex(resources.ResourceFailure,'rusage return'): resources.native_footprint(123,'birth')
    def test_no_worker_cap_increase(self):
        for key in ('footprint_hard','footprint_sustained','rss_absolute'):
            with self.assertRaises(resources.ResourceFailure): resources.limits({key:resources.LIMITS[key]+1})
