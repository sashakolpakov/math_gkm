"""Two focused retirement-policy tests; no network, proofs or project changes."""
import hashlib
import io
import json
from pathlib import Path
import platform
import sys
import tarfile
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

import repro


class RetiredCacheTests(unittest.TestCase):
    def test_known_retired_release_refuses_before_network_or_destination_writes(self):
        with tempfile.TemporaryDirectory(prefix='math-gkm-cache-retirement-',dir='/private/tmp') as d:
            root=Path(d);manifest=root/'recovery.json';destination=root/'absent'
            # Deliberately incompatible platform: the retirement diagnosis must come first.
            for repository in ('sashakolpakov/math_gkm','https://github.com/sashakolpakov/math_gkm.git'):
                manifest.write_text(json.dumps({'repository':repository,'tag':'recovery-cache-2026-10-17','platform':'not-this-host'}))
                args=SimpleNamespace(recovery_manifest=manifest,destination=destination,historical_copies=False)
                with self.subTest(repository=repository),patch.object(repro.urllib.request,'urlopen') as network,patch.object(Path,'mkdir',side_effect=AssertionError('destination write before refusal')):
                    with self.assertRaisesRegex(ValueError,'retired.*bootstrap.*--dependencies build'):
                        repro.recover(args)
                    network.assert_not_called()
                self.assertFalse(destination.exists())

    def test_unknown_or_unretired_policy_preserves_legacy_recovery(self):
        with tempfile.TemporaryDirectory(prefix='math-gkm-cache-retirement-',dir='/private/tmp') as d:
            root=Path(d);archive=root/'fixture.tar.gz';payload=b'ordinary optional fixture bytes'
            digest=hashlib.sha256(payload).hexdigest()
            with tarfile.open(archive,'w:gz') as tar:
                row=tarfile.TarInfo('objects/'+digest);row.size=len(payload);tar.addfile(row,io.BytesIO(payload))
            policy=root/'policy.json';manifest=root/'recovery.json'
            rows=[('other-release',1,'retired'),('recovery-cache-2026-10-17',1,'active'),('recovery-cache-2026-10-17',999,'retired')]
            for index,(tag,schema,status) in enumerate(rows):
                policy.write_text(json.dumps({'schema':schema,'releases':[{'repository':'sashakolpakov/math_gkm','tag':'recovery-cache-2026-10-17','status':status}]}))
                spec={'schema':1,'repository':'sashakolpakov/math_gkm','tag':tag,'public_source_commit':'a'*40,'platform':sys.platform+'-'+platform.machine(),'lean_toolchain':'fixture-toolchain','assets':[{'name':'fixture.tar.gz','size':archive.stat().st_size,'sha256':repro.sha(archive),'objects':[digest]}],'objects':{digest:{'sha256':digest,'size':len(payload),'asset':'fixture.tar.gz','current_paths':['fixture/A.bin'],'restore_paths':['fixture/A.bin']}}}
                manifest.write_text(json.dumps(spec));destination=root/('destination-'+str(index))
                args=SimpleNamespace(recovery_manifest=manifest,destination=destination,historical_copies=False)
                with self.subTest(tag=tag,schema=schema,status=status),patch.object(repro,'RETIRED_CACHE_POLICY',policy),patch.object(repro.urllib.request,'urlopen',side_effect=lambda *a,**kw:archive.open('rb')) as network:
                    repro.recover(args)
                    network.assert_called_once()
                self.assertEqual((destination/'fixture/A.bin').read_bytes(),payload)
                self.assertEqual(repro.load(destination/'RECOVERY.json')['status'],'hash_verified_files_restored')


if __name__=='__main__':unittest.main()
