"""Synthetic compaction failure tests; no actual old records or ditto calls."""
import copy
import importlib.util
import json
import os
from pathlib import Path
import shutil
import tempfile
import unittest
from unittest.mock import patch

HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('inactive_record_compression',HERE/'compress_records.py')
c=importlib.util.module_from_spec(spec);spec.loader.exec_module(c)

class CompressionTests(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name).resolve();self.scope=self.root/'.scratch/concept-driver-20261020-follow-000001'
        self.path=self.scope/'arms/exploration/inherited/validators/synthetic/source/declarations.json'
        self.path.parent.mkdir(parents=True);self.path.write_bytes(b'SYNTHETIC NO MATHEMATICAL CONTENT\n'*16384)
        self.path.chmod(0o640);os.utime(self.path,ns=(1790000000000000000,1790000000000000000))
        self.marker=self.path.parent.parent/'FINISHED.json';self.marker.write_text('{"synthetic":true}\n')
        (self.root/'.scratch/resources').mkdir(parents=True)
        self.ops=self.root/'.bootstrap/maintenance';self.ops.mkdir(parents=True)
        self.original=self.path.read_bytes();self.original_meta=c.metadata(self.path)
        self.row=dict(path=str(self.path),metadata=self.original_meta,
                      finished=dict(path=str(self.marker),metadata=c.metadata(self.marker)))
        self.compressed=set();self.mode='ok';self.realmeta=c.metadata;self.realhash=c.hashed
        def modeled_metadata(path):
            result=self.realmeta(path)
            if result['ino'] in self.compressed:result.update(flags=32,blocks=8192)
            return result
        p=patch.object(c,'metadata',side_effect=modeled_metadata);p.start();self.addCleanup(p.stop)
        self.journal=self.ops/'file.json'
    def runner(self,source,destination,timeout):
        self.assertGreater(timeout,0);self.assertLessEqual(timeout,30)
        shutil.copy2(source,destination);self.compressed.add(destination.stat().st_ino)
        if self.mode=='empty':destination.write_bytes(b'')
        if self.mode=='bad_hash':
            with destination.open('r+b') as f:f.write(b'X')
            os.utime(destination,ns=(1790000000000000000,1790000000000000000))
        if self.mode=='source_changed':source.write_bytes(b'FOREIGN')
        return 0
    def go(self):return c.compress_one(self.root,self.row,[self.scope],self.journal,runner=self.runner)
    def phase(self):return json.loads(self.journal.read_bytes())['phase']
    def assert_original(self):
        self.assertEqual(self.path.read_bytes(),self.original)
        self.assertEqual(self.realmeta(self.path),self.original_meta)
    def test_success_keeps_all_original_bytes_path_permissions_and_time(self):
        saved=self.go();self.assertGreater(saved,0);self.assertEqual(self.path.read_bytes(),self.original)
        result=c.metadata(self.path)
        self.assertTrue(c.content_metadata(self.original_meta,result));self.assertEqual(result['flags'],32)
        self.assertEqual(self.phase(),'finished');self.assertEqual(list(self.path.parent.glob('.math-gkm-compress-*')),[])
    def test_default_context_empty_copy_cannot_replace_original(self):
        self.mode='empty'
        with self.assertRaisesRegex(c.Hold,'copy failed'):self.go()
        self.assert_original();self.assertEqual(self.phase(),'original_retained')
    def test_hash_mismatch_cannot_replace_original(self):
        self.mode='bad_hash'
        with self.assertRaisesRegex(c.Hold,'copy failed'):self.go()
        self.assert_original()
    def test_source_changed_during_copy_is_preserved(self):
        self.mode='source_changed'
        with self.assertRaisesRegex(c.Hold,'source changed'):self.go()
        self.assertEqual(self.path.read_bytes(),b'FOREIGN');self.assertEqual(self.phase(),'original_retained')
    def test_post_replacement_failed_hash_restores_verified_original(self):
        failed=False
        def bad_post_hash(path):
            nonlocal failed
            if Path(path)==self.path and self.path.stat().st_ino in self.compressed and not failed:
                failed=True;return {'sha256':'f'*64,'bytes':len(self.original)}
            return self.realhash(path)
        with patch.object(c,'hashed',side_effect=bad_post_hash):
            with self.assertRaisesRegex(c.Hold,'post-check'):self.go()
        self.assert_original();self.assertEqual(self.phase(),'rolled_back')
        self.assertEqual(list(self.path.parent.glob('.math-gkm-compress-*')),[])
    def test_foreign_backup_divergence_retains_both_and_requires_reconciliation(self):
        real_replace=os.replace
        def changed_backup(source,destination):
            real_replace(source,destination)
            if Path(destination)==self.path:
                backups=list(self.path.parent.glob('.math-gkm-compress-*.backup'))
                self.assertEqual(len(backups),1);backups[0].write_bytes(b'FOREIGN BACKUP')
        with patch.object(c.os,'replace',side_effect=changed_backup):
            with self.assertRaisesRegex(c.Hold,'backup changed'):self.go()
        self.assertEqual(self.path.read_bytes(),self.original);self.assertEqual(self.phase(),'needs_reconciliation')
        backup=next(self.path.parent.glob('.math-gkm-compress-*.backup'))
        self.assertEqual(backup.read_bytes(),b'FOREIGN BACKUP')
    def test_temporary_fsync_failure_preserves_original_before_any_replace(self):
        with patch.object(c,'sync_file',side_effect=OSError('synthetic fsync failure')):
            with self.assertRaisesRegex(OSError,'fsync failure'):self.go()
        self.assert_original();self.assertEqual(self.phase(),'original_retained')
        self.assertEqual(list(self.path.parent.glob('.math-gkm-compress-*')),[])
    def test_published_fsync_failure_restores_original_before_backup_deletion(self):
        real_sync=c.sync_file
        def fail_published(path):
            if Path(path)==self.path:raise OSError('synthetic published fsync failure')
            return real_sync(path)
        with patch.object(c,'sync_file',side_effect=fail_published):
            with self.assertRaisesRegex(OSError,'published fsync failure'):self.go()
        self.assert_original();self.assertEqual(self.phase(),'rolled_back')
        self.assertEqual(list(self.path.parent.glob('.math-gkm-compress-*')),[])
    def test_full_batch_requires_bound_frozen_scope_and_retains_byte_identical_record(self):
        manifest=self.ops/'manifest.json';c.save(manifest,c.discover(self.root),fresh=True)
        closure=self.ops/'closure.json';c.save(closure,{'synthetic_owned_closed_scope':str(self.scope)},fresh=True)
        attestation=self.ops/'frozen.json'
        c.save(attestation,dict(schema='math-gkm.frozen-math-record-scopes.v1',root=str(self.root),
             scopes=[dict(path=str(self.scope),owned=True,frozen=True,
                 closure_evidence=dict(path=str(closure),sha256=c.hashed(closure)['sha256']))]),fresh=True)
        usage=shutil._ntuple_diskusage(100*c.GIB,96*c.GIB,4*c.GIB)
        with patch.object(c.shutil,'disk_usage',return_value=usage):
            result=c.batch(manifest,c.hashed(manifest)['sha256'],attestation,c.hashed(attestation)['sha256'],
                           self.ops/'batch',root=self.root,runner=self.runner,escalated=True)
        self.assertEqual(result['completed'],1);self.assertGreater(result['saved_bytes'],0)
        self.assertEqual(self.path.read_bytes(),self.original)
        self.assertEqual(json.loads((self.ops/'batch/FINISHED.json').read_bytes())['phase'],'closed')

    def test_aliased_original_refused(self):
        os.link(self.path,self.path.with_name('other-alias'))
        with self.assertRaisesRegex(c.Hold,'metadata changed'):self.go()
        self.assertFalse(self.journal.exists())
    def test_symlink_original_refused(self):
        target=self.path.with_name('actual');self.path.rename(target);self.path.symlink_to(target)
        with self.assertRaisesRegex(c.Hold,'unlinked'):self.go()
    def test_state_and_active_gaussian_paths_are_not_permitted(self):
        for path in [self.scope/'arms/exploration/state.json',self.root/'.scratch/studies/method-learning-gaussian-20261103/source/declarations.json']:
            with self.subTest(path=path):
                with self.assertRaises(c.Hold):c.permitted(self.root,path,[self.scope])
    def test_missing_finished_marker_refused(self):
        self.marker.unlink()
        with self.assertRaises(FileNotFoundError):self.go()
    def test_discovery_returns_only_eligible_finished_metadata(self):
        result=c.discover(self.root)
        self.assertFalse(result['incomplete']);self.assertEqual(result['eligible_files'],1)
        self.assertEqual(result['files'][0]['path'],str(self.path))
        self.assertNotIn('SYNTHETIC NO MATHEMATICAL CONTENT',json.dumps(result))
    def test_discovery_visits_known_large_frozen_scopes_first(self):
        for suffix in ('000019','000026'):
            scope=self.root/('.scratch/concept-driver-20261020-follow-'+suffix)
            path=scope/'arms/exploration/inherited/validators/synthetic/source/declarations.json'
            path.parent.mkdir(parents=True);shutil.copy2(self.path,path)
            (path.parent.parent/'FINISHED.json').write_text('{"synthetic":true}\n')
        result=c.discover(self.root)
        self.assertEqual([Path(row['path']).parts[-8] for row in result['files']],
                         ['concept-driver-20261020-follow-000026','concept-driver-20261020-follow-000019','concept-driver-20261020-follow-000001'])

    def test_discovery_honors_exact_entry_cap(self):
        result=c.discover(self.root,max_entries=1)
        self.assertLessEqual(result['entries'],1);self.assertTrue(result['incomplete'])
    def test_global_heavy_and_scope_locks_are_nonblocking(self):
        import fcntl
        for path in [self.root/'.scratch/resources/heavy.lock',self.scope/'controller.lock']:
            with self.subTest(path=path),path.open('a') as handle:
                fcntl.flock(handle,fcntl.LOCK_EX|fcntl.LOCK_NB)
                with self.assertRaisesRegex(c.Hold,'busy'):
                    with c.locks(self.root,[self.scope]):self.fail('held lease admitted')
    def test_custom_free_space_target_continues_above_default_twelve(self):
        manifest=self.ops/'custom-manifest.json';c.save(manifest,c.discover(self.root),fresh=True)
        closure=self.ops/'custom-closure.json';c.save(closure,{'synthetic_owned_closed_scope':str(self.scope)},fresh=True)
        attestation=self.ops/'custom-frozen.json'
        c.save(attestation,dict(schema='math-gkm.frozen-math-record-scopes.v1',root=str(self.root),
             scopes=[dict(path=str(self.scope),owned=True,frozen=True,
                 closure_evidence=dict(path=str(closure),sha256=c.hashed(closure)['sha256']))]),fresh=True)
        usage=shutil._ntuple_diskusage(100*c.GIB,87*c.GIB,13*c.GIB)
        arguments=(manifest,c.hashed(manifest)['sha256'],attestation,c.hashed(attestation)['sha256'])
        with patch.object(c.shutil,'disk_usage',return_value=usage):
            default=c.batch(*arguments,self.ops/'default-batch',root=self.root,runner=self.runner,escalated=True)
            self.assertEqual(default['completed'],0);self.assertEqual(default['target_free_gib'],12)
            custom=c.batch(*arguments,self.ops/'custom-batch',root=self.root,runner=self.runner,
                           escalated=True,target_free_gib=20)
        self.assertEqual(custom['completed'],1);self.assertEqual(custom['target_free_gib'],20)
        self.assertEqual(self.path.read_bytes(),self.original)
        intent=json.loads((self.ops/'custom-batch/INTENT.json').read_bytes())
        self.assertEqual(intent['target_free_gib'],20)

    def test_invalid_free_space_targets_refused_before_input_access(self):
        for target in (12.0,20.0,True,False,11,33,'20',None):
            with self.subTest(target=target),self.assertRaisesRegex(c.Hold,'integer in 12..32'):
                c.batch(None,None,None,None,self.ops/'invalid-batch',root=self.root,
                        escalated=True,target_free_gib=target)
        self.assertFalse((self.ops/'invalid-batch').exists());self.assert_original()

    def test_batch_requires_escalated_context_declaration(self):
        with self.assertRaisesRegex(c.Hold,'require_escalated'):
            c.batch(None,None,None,None,self.ops/'batch',root=self.root)

if __name__=='__main__':unittest.main()
