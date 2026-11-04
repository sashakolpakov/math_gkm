"""Synthetic clone integrity/metadata/rollback tests; no APFS syscall is invoked."""
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
spec=importlib.util.spec_from_file_location('inactive_clone_tests',HERE/'clone_records.py')
d=importlib.util.module_from_spec(spec);spec.loader.exec_module(d)
c=d.c

class CloneTests(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve()
        self.scope=self.root/'.scratch/concept-driver-20261020-follow-000035';self.scope.mkdir(parents=True)
        (self.root/'.scratch/resources').mkdir()
        self.ops=self.root/'.bootstrap/clone-tests';self.ops.mkdir(parents=True)
        self.source=self.scope/'canonical.json';self.target=self.scope/'target.json'
        self.data=b'SYNTHETIC EXACT DUPLICATE\n'*20000
        for path,mode,stamp in ((self.source,0o400,1790000000000000000),(self.target,0o640,1790000000000001234)):
            path.write_bytes(self.data);path.chmod(mode);os.utime(path,ns=(stamp,stamp))
        real=c.metadata
        def modeled_metadata(path):
            value=real(path)
            if Path(path).is_relative_to(self.scope):value['flags']=32
            return value
        self.realmeta=real;self.realhash=c.hashed
        p=patch.object(c,'metadata',side_effect=modeled_metadata);p.start();self.addCleanup(p.stop)
        p=patch.object(d,'QUALIFIED_COUNT',2);p.start();self.addCleanup(p.stop)
        self.context=self.ops/'context.json';self.put(self.context,dict(schema=d.a.CONTEXT,root=str(self.root),scope=str(self.scope),owned=True,frozen=True,
            mathematical_validity_claim=False,whole_scope_process_liveness_claim=False,research_resume_authorized=False,user_authority='Synthetic freeze only.'))
        self.attestation=dict(schema='math-gkm.frozen-math-record-scopes.v1',root=str(self.root),scopes=[dict(path=str(self.scope),owned=True,frozen=True,
            closure_evidence=dict(path=str(self.context),sha256=c.hashed(self.context)['sha256']))])
        previous=self.ops/'previous';previous.mkdir();finish=previous/'FINISHED.json'
        self.put(finish,dict(schema='math-gkm.byte-preserving-batch.v1',phase='closed',completed=2))
        self.records=[]
        for n,path in enumerate((self.source,self.target)):
            m=c.metadata(path);content=c.hashed(path);journal=previous/f'{n:06d}.json'
            self.put(journal,dict(schema='math-gkm.byte-preserving-file.v1',phase='finished',path=str(path),content=content,replacement=m))
            self.records.append(dict(path=str(path),scope=str(self.scope),content=content,metadata=m,
                journal=dict(path=str(journal),sha256=c.hashed(journal)['sha256']),batch_finished=dict(path=str(finish),sha256=c.hashed(finish)['sha256'])))
        self.journal=self.ops/'clone.json';self.original=c.metadata(self.target);self.canonical=c.metadata(self.source)
    def put(self,path,value):path.write_bytes(c.canonical(value)+b'\n')
    def cloner(self,source,target):shutil.copy2(source,target)  # Explicit model, not physical sharing evidence.
    def go(self,cloner=None):
        with d.a.contexts(self.root,self.attestation):
            return d.clone_one(self.records[0],self.records[1],self.root,self.journal,cloner or self.cloner)
    def phase(self):return json.loads(self.journal.read_bytes())['phase']
    def assert_original(self):self.assertEqual(c.metadata(self.target),self.original);self.assertEqual(self.target.read_bytes(),self.data)
    def test_success_keeps_target_own_metadata_bytes_separate_inode_and_source(self):
        self.go();now=c.metadata(self.target)
        self.assertTrue(c.content_metadata(self.original,now));self.assertEqual(now['flags'],32);self.assertEqual(now['nlink'],1)
        self.assertNotEqual(now['ino'],self.original['ino']);self.assertNotEqual(now['ino'],self.canonical['ino'])
        self.assertEqual(self.target.read_bytes(),self.data);self.assertEqual(c.metadata(self.source),self.canonical)
        self.assertEqual(self.phase(),'finished');self.assertEqual(list(self.scope.glob('.math-gkm-clone-*')),[])
    def test_uncompressed_or_changed_index_metadata_refused(self):
        self.records[1]['metadata']['flags']=0
        with self.assertRaises(c.Hold):self.go()
        self.assertFalse(self.journal.exists());self.assert_original()
    def test_changed_logical_bytes_refused_before_clone(self):
        self.target.write_bytes(b'FOREIGN')
        with self.assertRaises(c.Hold):self.go()
        self.assertFalse(self.journal.exists());self.assertEqual(self.target.read_bytes(),b'FOREIGN')
    def test_wrong_clone_hash_or_size_never_replaces(self):
        def wrong(source,target):target.write_bytes(b'WRONG')
        with self.assertRaises(c.Hold):self.go(wrong)
        self.assert_original();self.assertEqual(self.phase(),'original_retained')
    def test_hardlink_backend_refused_before_canonical_metadata_changes(self):
        with self.assertRaisesRegex(c.Hold,'independent'):self.go(lambda source,target:os.link(source,target))
        self.assert_original();self.assertEqual(c.metadata(self.source),self.canonical)
        self.assertEqual(list(self.scope.glob('.math-gkm-clone-*')),[])
    def test_canonical_change_is_preserved_and_target_not_replaced(self):
        def changed(source,target):
            self.cloner(source,target);source.chmod(0o600);source.write_bytes(b'FOREIGN')
        with self.assertRaises(c.Hold):self.go(changed)
        self.assert_original();self.assertEqual(self.source.read_bytes(),b'FOREIGN')
    def test_failed_postcheck_restores_original(self):
        failed=False
        def bad_hash(path):
            nonlocal failed
            if Path(path)==self.target and self.target.stat().st_ino!=self.original['ino'] and not failed:
                failed=True;return {'sha256':'f'*64,'bytes':len(self.data)}
            return self.realhash(path)
        with patch.object(c,'hashed',side_effect=bad_hash),self.assertRaisesRegex(c.Hold,'post-check'):self.go()
        self.assert_original();self.assertEqual(self.phase(),'rolled_back')
    def test_foreign_backup_is_preserved_without_rollback_over_it(self):
        replace=os.replace
        def mutate(source,target):
            replace(source,target)
            if Path(target)==self.target:next(self.scope.glob('.math-gkm-clone-*.backup')).write_bytes(b'FOREIGN BACKUP')
        with patch.object(d.os,'replace',side_effect=mutate),self.assertRaises(c.Hold):self.go()
        self.assertEqual(self.target.read_bytes(),self.data);self.assertEqual(self.phase(),'needs_reconciliation')
        self.assertEqual(next(self.scope.glob('.math-gkm-clone-*.backup')).read_bytes(),b'FOREIGN BACKUP')
    def test_published_fsync_failure_preserves_original(self):
        real=c.sync_file
        def failed(path):
            if Path(path)==self.target:raise OSError('modeled published fsync failure')
            return real(path)
        with patch.object(c,'sync_file',side_effect=failed),self.assertRaises(OSError):self.go()
        self.assert_original();self.assertEqual(self.phase(),'rolled_back')
    def test_temporary_fsync_failure_preserves_original_before_replace(self):
        with patch.object(c,'sync_file',side_effect=OSError('modeled temporary fsync failure')),self.assertRaises(OSError):self.go()
        self.assert_original();self.assertEqual(self.phase(),'original_retained')
        self.assertEqual(list(self.scope.glob('.math-gkm-clone-*')),[])
    def test_missing_or_changed_original_success_journal_refused(self):
        self.records[1]['journal']['sha256']='f'*64
        with self.assertRaises(c.Hold):self.go()
        self.assertFalse(self.journal.exists());self.assert_original()
    def test_index_scope_and_count_require_exact_qualified_set(self):
        index=dict(schema='math-gkm.qualified-compressed-records.v1',root=str(self.root),record_count=2,source_base_sha256=d.BASE_SHA,records=self.records)
        self.assertEqual(len(d.index_records(index,self.root)),2)
        for changed in ({'record_count':1},{'source_base_sha256':'f'*64}):
            with self.subTest(changed=changed),self.assertRaises(c.Hold):d.index_records({**index,**changed},self.root)
        bad=copy.deepcopy(index);bad['records'][1]['scope']=str(self.root/'.scratch/studies/method-learning-gaussian-20261103')
        with self.assertRaises(c.Hold):d.index_records(bad,self.root)
    def test_groups_require_matching_bytes_distinct_targets_and_minimal_canonical(self):
        records={r['path']:r for r in self.records};group=dict(content=self.records[0]['content'],canonical_path=str(self.source),target_paths=[str(self.target)])
        groups=dict(schema='math-gkm.compressed-clone-groups.v1',root=str(self.root),index_sha256='a'*64,physical_reclaim_claimed=False,groups=[group])
        self.assertEqual(len(d.group_targets(groups,'a'*64,records,self.root)),1)
        for change in ({'canonical_path':str(self.target),'target_paths':[str(self.source)]},{'target_paths':[str(self.source)]},{'content':{'sha256':'f'*64,'bytes':len(self.data)}}):
            with self.subTest(change=change),self.assertRaises(c.Hold):d.group_targets({**groups,'groups':[{**group,**change}]},'a'*64,records,self.root)
    def test_full_batch_records_actual_free_delta_not_file_block_savings(self):
        attestation=self.ops/'attestation.json';self.put(attestation,self.attestation);attestation_pin=c.hashed(attestation)['sha256']
        index=self.ops/'index.json';self.put(index,dict(schema='math-gkm.qualified-compressed-records.v1',root=str(self.root),record_count=2,
            source_base_sha256=d.BASE_SHA,attestation={'path':str(attestation),'sha256':attestation_pin},records=self.records));index_pin=c.hashed(index)['sha256']
        groups=self.ops/'groups.json';self.put(groups,dict(schema='math-gkm.compressed-clone-groups.v1',root=str(self.root),index_sha256=index_pin,
            physical_reclaim_claimed=False,groups=[dict(content=self.records[0]['content'],canonical_path=str(self.source),target_paths=[str(self.target)])]));groups_pin=c.hashed(groups)['sha256']
        review=self.ops/'review.json';self.put(review,dict(schema='math-gkm.compressed-clone-review.v1',approved=True,source_sha256=c.hashed(d.__file__)['sha256'],
            base_sha256=d.BASE_SHA,index_sha256=index_pin,groups_sha256=groups_pin,attestation_sha256=attestation_pin))
        usage=shutil._ntuple_diskusage(100*c.GIB,96*c.GIB,4*c.GIB)
        with patch.object(d.shutil,'disk_usage',return_value=usage):
            result=d.batch(index,index_pin,groups,groups_pin,attestation,attestation_pin,review,c.hashed(review)['sha256'],self.ops/'batch',
                root=self.root,cloner=self.cloner,escalated=True,target_free_gib=20)
        self.assertEqual(result['completed'],1);self.assertEqual(result['observed_free_delta_bytes'],0)
        self.assertFalse(result['per_file_blocks_reclaim_claimed']);self.assertTrue(result['physical_delta_is_observation_not_attribution'])
    def test_default_context_or_invalid_target_never_accesses_inputs(self):
        with self.assertRaises(c.Hold):d.batch(None,None,None,None,None,None,None,None,self.ops/'none',root=self.root)
        for value in (True,12.0,11,33):
            with self.subTest(value=value),self.assertRaises(c.Hold):d.batch(None,None,None,None,None,None,None,None,self.ops/'none',root=self.root,escalated=True,target_free_gib=value)

if __name__=='__main__':unittest.main()
