"""Synthetic archive-classification/closure controls, no real records or child."""
import copy
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('inactive_archival_extension',HERE/'archival_records.py')
a=importlib.util.module_from_spec(spec);spec.loader.exec_module(a)
c=a.c

class ArchiveTests(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve()
        self.scope=self.root/'.scratch/concept-driver-20261020-follow-000035';self.scope.mkdir(parents=True)
        self.bootstrap=self.root/'.bootstrap/concept-driver-20261020';self.bootstrap.mkdir(parents=True)
        self.ops=self.root/'.bootstrap/new-maintenance';self.ops.mkdir()
        (self.root/'.scratch/resources').mkdir()
        self.path=self.scope/'arms/exploration/state.json';self.path.parent.mkdir(parents=True)
        self.path.write_bytes(b'SYNTHETIC RECORD, NOT MATHEMATICS\n'*16384)
        self.context=self.ops/'context.json'
        self.value=dict(schema=a.CONTEXT,root=str(self.root),scope=str(self.scope),owned=True,frozen=True,
             mathematical_validity_claim=False,whole_scope_process_liveness_claim=False,research_resume_authorized=False,
             user_authority='Synthetic explicit freeze for this fixture only.')
        self.write(self.context,self.value)
        self.attestation=dict(schema='math-gkm.frozen-math-record-scopes.v1',root=str(self.root),
             scopes=[dict(path=str(self.scope),owned=True,frozen=True,closure_evidence=dict(path=str(self.context),sha256=c.hashed(self.context)['sha256']))])
    def write(self,path,value):path.write_bytes(c.canonical(value)+b'\n')
    def bind(self):return a.bind_manifest(a.discover([self.scope],self.root),self.attestation,self.root)
    def test_both_exact_frozen_scope_types_are_allowed(self):
        for scope in (self.scope,self.bootstrap):self.assertEqual(a.scope_path(self.root,scope),scope)
    def test_foreign_gaussian_and_nearby_bootstrap_scopes_rejected(self):
        for p in [self.root/'.scratch/studies/method-learning-gaussian-20261103',self.root/'.bootstrap/concept-driver-20261021',self.root/'.scratch/paired-v3-live-20261018-study-0004']:
            p.mkdir(parents=True)
            with self.subTest(path=p),self.assertRaises(c.Hold):a.scope_path(self.root,p)
    def test_archival_json_does_not_require_or_assert_finished_proof(self):
        self.assertFalse((self.path.parent/'FINISHED.json').exists())
        manifest=self.bind();row=manifest['files'][0]
        self.assertEqual(row['finished']['path'],str(self.context));self.assertEqual(row['path'],str(self.path))
    def test_context_must_be_explicitly_loaded(self):
        with self.assertRaisesRegex(c.Hold,'not loaded'):a.permitted(self.root,self.path,[self.scope])
    def test_untyped_old_finished_context_is_not_accepted(self):
        self.value['schema']='math-gkm.frozen-validator-record-context.v1';self.write(self.context,self.value)
        self.attestation['scopes'][0]['closure_evidence']['sha256']=c.hashed(self.context)['sha256']
        with self.assertRaisesRegex(c.Hold,'typed archival'):self.bind()
    def test_scope_validity_or_liveness_claim_cannot_expand_context(self):
        for field in ('frozen','mathematical_validity_claim','whole_scope_process_liveness_claim','research_resume_authorized'):
            value=copy.deepcopy(self.value);value[field]=False if field=='frozen' else True;self.write(self.context,value)
            self.attestation['scopes'][0]['closure_evidence']['sha256']=c.hashed(self.context)['sha256']
            with self.subTest(field=field),self.assertRaises(c.Hold):self.bind()
    def test_context_cannot_authorize_a_different_scope(self):
        self.value['scope']=str(self.bootstrap);self.write(self.context,self.value)
        self.attestation['scopes'][0]['closure_evidence']['sha256']=c.hashed(self.context)['sha256']
        with self.assertRaisesRegex(c.Hold,'typed archival'):self.bind()
    def test_source_native_current_and_dependency_paths_excluded(self):
        for suffix in ('x.py','x.lean','x.olean','source/x.json','machinery/x.json','native/x.json','gaussian/x.json','notes-20261104/x.json','.lake/x.json'):
            p=self.scope/suffix;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(b'x'*300000)
            with self.subTest(path=p),self.assertRaises(c.Hold):a.classify(self.root,p,[self.scope])
    def test_all_requested_data_suffixes_classified(self):
        for suffix in ('.json','.jsonl','.log','.txt'):
            p=self.scope/('record'+suffix);p.write_bytes(b'x'*300000)
            self.assertEqual(a.classify(self.root,p,[self.scope])[0],self.scope)
    def test_symlink_and_multiple_link_records_excluded(self):
        p=self.scope/'alias.json';p.symlink_to(self.path)
        with self.assertRaises(c.Hold):a.classify(self.root,p,[self.scope])
        import os
        os.link(self.path,self.scope/'hard-alias.json')
        with self.assertRaises(c.Hold):a.classify(self.root,self.path,[self.scope])
    def test_unchanged_64MiB_and_compression_flag_bounds(self):
        actual=c.metadata(self.path)
        for changed in ({'size':64*1024**2+1},{'blocks':64*1024**2+1},{'flags':32}):
            with self.subTest(changed=changed),patch.object(c,'metadata',return_value={**actual,**changed}),self.assertRaises(c.Hold):
                a.classify(self.root,self.path,[self.scope])
    def test_candidate_metadata_is_rechecked_before_binding(self):
        candidates=a.discover([self.scope],self.root);self.path.write_bytes(b'foreign')
        with self.assertRaises(c.Hold):a.bind_manifest(candidates,self.attestation,self.root)
    def test_context_hash_changes_are_refused(self):
        self.context.write_bytes(b'{}')
        with self.assertRaisesRegex(c.Hold,'input changed'):self.bind()
    def test_reviewer_must_bind_exact_source_base_manifest_and_attestation(self):
        manifest_path=self.ops/'manifest.json';attestation_path=self.ops/'attestation.json';review_path=self.ops/'review.json'
        self.write(manifest_path,self.bind());self.write(attestation_path,self.attestation)
        review=dict(schema=a.REVIEW,approved=True,source_sha256=c.hashed(a.__file__)['sha256'],base_sha256=a.BASE_SHA,
                    manifest_sha256=c.hashed(manifest_path)['sha256'],attestation_sha256=c.hashed(attestation_path)['sha256'])
        args=(manifest_path,c.hashed(manifest_path)['sha256'],attestation_path,c.hashed(attestation_path)['sha256'])
        for field in ('source_sha256','base_sha256','manifest_sha256','attestation_sha256'):
            bad={**review,field:'f'*64};self.write(review_path,bad)
            with self.subTest(field=field),patch.object(c,'batch',side_effect=AssertionError('must refuse before primitive')),self.assertRaises(c.Hold):
                a.batch(*args,review_path,c.hashed(review_path)['sha256'],self.ops/'output',root=self.root,escalated=True)
        self.write(review_path,review)
        with patch.object(c,'batch',return_value={'phase':'closed','completed':0}) as primitive:
            result=a.batch(*args,review_path,c.hashed(review_path)['sha256'],self.ops/'output',root=self.root,escalated=True,target_free_gib=20)
        self.assertEqual(result['phase'],'closed');self.assertEqual(primitive.call_args.kwargs['target_free_gib'],20)
        self.assertEqual(primitive.call_args.kwargs['escalated'],True)
    def test_bootstrap_archival_lock_fences_every_existing_old_follow_controller(self):
        import fcntl
        with (self.scope/'controller.lock').open('a') as handle:
            fcntl.flock(handle,fcntl.LOCK_EX|fcntl.LOCK_NB)
            with self.assertRaisesRegex(c.Hold,'busy'):
                with a.locks(self.root,[self.bootstrap]):self.fail('old follow controller fence omitted')

    def test_reviewed_full_archival_batch_uses_unchanged_byte_preservation_primitive(self):
        import shutil
        manifest_path=self.ops/'full-manifest.json';attestation_path=self.ops/'full-attestation.json';review_path=self.ops/'full-review.json'
        self.write(manifest_path,self.bind());self.write(attestation_path,self.attestation)
        self.write(review_path,dict(schema=a.REVIEW,approved=True,source_sha256=c.hashed(a.__file__)['sha256'],base_sha256=a.BASE_SHA,
             manifest_sha256=c.hashed(manifest_path)['sha256'],attestation_sha256=c.hashed(attestation_path)['sha256']))
        original=self.path.read_bytes();copies=set();real_metadata=c.metadata
        def modeled_metadata(path):
            value=real_metadata(path)
            if value['ino'] in copies:value.update(flags=32,blocks=8192)
            return value
        def copied(source,destination,timeout):
            self.assertLessEqual(timeout,30);shutil.copy2(source,destination);copies.add(destination.stat().st_ino);return 0
        usage=shutil._ntuple_diskusage(100*c.GIB,96*c.GIB,4*c.GIB)
        with patch.object(c,'metadata',side_effect=modeled_metadata),patch.object(c.shutil,'disk_usage',return_value=usage):
            result=a.batch(manifest_path,c.hashed(manifest_path)['sha256'],attestation_path,c.hashed(attestation_path)['sha256'],
                review_path,c.hashed(review_path)['sha256'],self.ops/'full-batch',root=self.root,runner=copied,escalated=True,target_free_gib=20)
        self.assertEqual(result['completed'],1);self.assertEqual(self.path.read_bytes(),original)
        journal=json.loads((self.ops/'full-batch/000000.json').read_bytes())
        self.assertEqual(journal['phase'],'finished');self.assertEqual(journal['finished']['path'],str(self.context))
        self.assertEqual(list(self.path.parent.glob('.math-gkm-compress-*')),[])

    def test_discovery_is_metadata_only_and_honors_entry_cap(self):
        with patch.object(Path,'read_bytes',side_effect=AssertionError('payload read forbidden')):
            result=a.discover([self.scope],self.root,max_entries=1)
        self.assertLessEqual(result['entries'],1);self.assertTrue(result['incomplete'])
    def test_pinned_v2_file_is_unchanged(self):self.assertEqual(c.hashed(a.BASE)['sha256'],a.BASE_SHA)

if __name__=='__main__':unittest.main()
