"""Synthetic receipt/worker lifecycle controls; no models, compiler or theorem.

The genuine prepare, FINISHED finish/reuse and worker decoder APIs run. Source
and checker outcomes are explicit fixtures, never mathematical evidence.
"""
import copy
import importlib.util
import io
from pathlib import Path
import tempfile
import subprocess
import unittest
from unittest.mock import patch

from machinery import study,study_common as common,validation_receipts,inspection_profiles

HERE=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('gaussian_finalize_under_test',HERE/'finalize.py')
finalize=importlib.util.module_from_spec(spec);spec.loader.exec_module(finalize)
PRIVATE='PRIVATE_EVALUATOR_CANARY_NOT_FOR_AUDITOR'
IMPL={'synthetic-source':'0'*64}


def make_finished(directory, contract, claim, bundle, *, audit=None, resolved=False):
    directory.mkdir(parents=True,exist_ok=True)
    common.write(directory/'source/declarations.json',{'fixture':'SYNTHETIC checker artifact, not a Lean run'})
    artifact=directory/'source/declarations.json';profile=inspection_profiles.resolve()
    evidence=dict(schema=profile.completion_schema,nonce='a'*64,artifact_bytes=artifact.stat().st_size,artifact_sha256=common.sha(artifact))
    marker=f"GKM_DECLARATIONS_COMPLETE_V3:{evidence['nonce']}:{evidence['artifact_bytes']}:{evidence['artifact_sha256']}"
    checks=[dict(operation=op,module=module,returncode=0,termination=None,stdout='')
        for op in ('compile','kernel_replay') for module in bundle['order']+['ControllerCompletion']]
    checks.append(dict(operation='trusted_premise_inspection',returncode=0,termination=None,stdout=marker+'\n'))
    result=dict(resolved=resolved,kind=claim['kind'],lean_exact_root_checked=True,finished=1,
        bundle_hash=bundle['bundle_hash'],binding=bundle['binding'],checks=checks,
        inspection_schema=profile.inspection_schema,producer_completion=evidence,
        declaration_artifact_sha256=common.sha(artifact),binary_hashes={},pin_hashes={},
        declarations=[dict(name='ControllerRootCheck',artifact_bytes=evidence['artifact_bytes'],artifact_sha256=evidence['artifact_sha256'],producer_completion=evidence)])
    if audit is not None:result['audit']=audit
    common.write(directory/'result.json',result)
    validation_receipts.finish(directory,{'contract':contract,'claim':claim,'audit':audit},claim,())
    return result


def make_fixture(base):
    base=Path(base).resolve();root=base/'study';workspace=root/'arms/exploration/workspace'
    source=workspace/'MathGKM/Neutral.lean';source.parent.mkdir(parents=True)
    source.write_text('namespace Neutral\ndef Goal : Prop := True\ntheorem claim : Goal := True.intro\ntheorem claim2 : Goal := True.intro\nend Neutral\n')
    contract=dict(schema='SYNTHETIC',root_file='MathGKM/Neutral.lean',root_sha256=common.sha(source),
        root_declaration='Neutral.Goal',root_meaning='True, synthetic fixture.',
        provenance_file='research/definition-provenance.json',seed_sources=['evidence/target.md'],
        correspondence_obligations=['Check the exact fixture definition.','Check every universal quantifier.'],primary_citations=[])
    common.write(workspace/'contract.json',contract)
    common.write(workspace/'research/definition-provenance.json',{'classification':'SYNTHETIC definition'})
    (workspace/'evidence').mkdir();(workspace/'evidence/target.md').write_text('Synthetic target source.')
    (workspace/'research/correspondence.md').write_text('Synthetic correspondence.')
    for name in ('lean-toolchain','lakefile.toml','lake-manifest.json'):(workspace/name).write_text('SYNTHETIC pin\n')
    (workspace/'.lake/packages').mkdir(parents=True)
    private=root/'evaluation/private-panel.json';common.write(private,{'answer':PRIVATE})
    protocol=dict(transport='live',rounds=1,validation_seconds=600)
    common.write(root/'protocol.json',protocol)
    claim=dict(kind='proof',module='MathGKM.Neutral',declaration='Neutral.claim',correspondence='research/correspondence.md')
    job=root/'arms/exploration/jobs/round-0000'
    common.write(job/'spec.json',dict(role='researcher',workspace=str(workspace),request_id='round-0000'))
    receipt=dict(role='researcher',request_id='round-0000',outcome='completed',payload={'completion':claim})
    common.write(job/'receipt.json',receipt)
    state=dict(active=None,active_intent=None,resolution=None,status='finite_budget_finished; root_open',round=1,phase='research',
        receipts=[str(job)],receipt_hashes={str(job):common.digest(receipt)},research={},calls=1,seconds=17)
    common.save_state(root/'arms/exploration/state.json',state)
    bundle=finalize.prepare(workspace,contract,claim)
    key=common.digest({'claim':claim,'audit':None,'round':0})
    directory=root/'arms/exploration/completion'/key
    checked=make_finished(directory,contract,claim,bundle)
    common.write(root/'arms/exploration/completion-claims/round-0000.json',{'claim':claim,'result':checked})
    return dict(study=root,workspace=workspace,contract=contract,claim=claim,bundle=bundle,directory=directory,protocol=protocol,
        contract_sha256=common.digest(contract),implementation_sha256=common.digest(IMPL))


class PrimaryResponse(io.BytesIO):
    def geturl(self):return 'https://arxiv.org/pdf/2603.22226v1'


class FinalizeTests(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup)
        self.base=Path(self.temp.name)
        self.fixture=make_fixture(self.base)
        self.output=self.base/'outputs/0000'
        self.source=common.sha(HERE/'finalize.py')
        self.launches=0;self.accepted=True;self.bad_payload=None;self.native_resolved=True;self.during_review=None
        self.patchers=[patch.object(study,'verify',return_value=self.fixture['protocol']),
            patch.object(common,'implementation',return_value=IMPL),
            patch.object(finalize,'run',side_effect=self.worker),
            patch.object(finalize,'sandbox_prefix',side_effect=self.sandbox),
            patch.object(finalize,'dependency_paths',return_value=[]),
            patch.object(finalize.completion,'verify',side_effect=self.native)]
        for p in self.patchers:p.start();self.addCleanup(p.stop)

    def sandbox(self,directory,dependencies):
        self.assertTrue(directory.is_dir())
        (directory/'validator.sb').write_text('SYNTHETIC containment profile')
        return []

    def worker(self,argv,**kwargs):
        self.launches+=1
        job=Path(argv[-1]);spec=common.read(job/'spec.json');workspace=Path(spec['workspace'])
        actual_inventory=common.inventory(workspace)
        self.assertTrue(all(actual_inventory.get(name)==expected for name,expected in spec['retained_sources'].items()))
        self.assertNotIn('contract.json',spec['retained_sources'])
        for path in workspace.rglob('*'):
            if path.is_file() and not path.is_symlink():self.assertNotIn(PRIVATE,path.read_text())
        payload=dict(accepted=self.accepted,bundle_hash=common.read(job/'request.json')['bundle_hash'],reviewer=spec['request_id'],
            checks={key:'Synthetic independent explanation.' for key in self.fixture['contract']['correspondence_obligations']},
            primary_sources=[],summary='Synthetic audit only.')
        if self.bad_payload:self.bad_payload(payload,spec,job)
        common.write(job/'final.json',dict(request_id=spec['request_id'],payload_json=common.canonical(payload)))
        common.write(job/'receipt.json',dict(request_id=spec['request_id'],role=finalize.ROLE,transport='live',model=finalize.MODEL,
            reasoning_effort='high',outcome='completed',returncode=0,elapsed_seconds=2.5,usage_raw=[],payload=payload))
        if self.during_review:self.during_review()
        return dict(returncode=0,termination=None)

    def native(self,contract,claim,directory,*,audit,stop):
        self.assertFalse(stop())
        bundle=finalize.prepare(self.fixture['workspace'],contract,claim)
        return make_finished(directory,contract,claim,bundle,audit=audit,resolved=self.native_resolved)

    def go(self):
        return finalize.finalize(self.fixture['study'],arms='exploration',output=self.output,
            contract_sha256=self.fixture['contract_sha256'],implementation_sha256=self.fixture['implementation_sha256'])

    def verified(self):
        return finalize.verified_resolution(self.fixture['study'],self.output,
            expected_contract=self.fixture['contract_sha256'],expected_source=self.source)

    def test_exact_candidate_independent_audit_native_receipt_and_unchanged_arm(self):
        state=self.fixture['study']/'arms/exploration/state.json';before=state.read_bytes()
        result=self.go();self.assertTrue(result['resolved']);self.assertEqual(self.launches,1)
        checked=self.verified();self.assertTrue(checked['proved']);self.assertFalse(checked['refuted'])
        pointer=common.read(self.output/'OWNER_COMPLETION.json')
        self.assertEqual(checked['receipt_sha256'],common.sha(Path(pointer['validation_directory'])/'result.json'))
        self.assertNotEqual(checked['receipt_sha256'],pointer['finished_sha256'])
        self.assertEqual(state.read_bytes(),before)
        costs=common.read(pointer['costs_path']);self.assertEqual(costs['model_elapsed_seconds'],2.5)
        self.assertEqual(costs['validation_budget_seconds'],600)

    def test_semantic_contract_digest_despite_serialized_newline(self):
        self.assertNotEqual(common.sha(self.fixture['workspace']/'contract.json'),self.fixture['contract_sha256'])
        self.assertTrue(self.go()['resolved'])

    def test_no_claim_no_model(self):
        (self.fixture['study']/'arms/exploration/completion-claims/round-0000.json').unlink()
        self.assertFalse(self.go()['resolved']);self.assertEqual(self.launches,0)
        self.assertEqual(self.verified(),dict(proved=False,refuted=False))

    def test_raw_exact_flag_without_finished_never_calls_auditor(self):
        (self.fixture['directory']/'FINISHED.json').unlink()
        with self.assertRaises(common.Invalid):self.go()
        self.assertEqual(self.launches,0)

    def test_rejection_is_cached_and_no_native_proof(self):
        self.accepted=False;self.assertFalse(self.go()['resolved']);self.assertEqual(self.launches,1)
        self.output=self.base/'outputs/0001'
        result=self.go();self.assertEqual(result['status'],'cached_independent_rejection');self.assertEqual(self.launches,1)
        self.assertEqual(self.verified(),dict(proved=False,refuted=False))

    def test_partial_worker_attempt_never_replayed(self):
        def crash(*args,**kwargs):raise common.Invalid('SYNTHETIC partial worker')
        with patch.object(finalize,'run',side_effect=crash):
            with self.assertRaises(common.Invalid):self.go()
        self.output=self.base/'outputs/0001'
        with self.assertRaisesRegex(common.Invalid,'never replayed'):self.go()
        self.assertEqual(self.launches,0)

    def test_boolean_blank_and_missing_explanations_rejected(self):
        for bad in (True,'',{},None):
            with self.subTest(bad=bad):
                self.output=self.base/'outputs'/str(len(list((self.base/'outputs').glob('*')))) if (self.base/'outputs').exists() else self.output
                # Independent ledger isolates each synthetic input-negative trial.
                ledger=self.base/('ledger-'+str(bad))
                self.bad_payload=lambda payload,spec,job:payload['checks'].__setitem__(self.fixture['contract']['correspondence_obligations'][0],bad)
                with self.assertRaisesRegex(common.Invalid,'STRING'):
                    finalize.finalize(self.fixture['study'],arms='exploration',output=self.output,ledger=ledger,
                        contract_sha256=self.fixture['contract_sha256'],implementation_sha256=self.fixture['implementation_sha256'])

    def test_native_unresolved_is_never_published(self):
        self.native_resolved=False
        self.assertFalse(self.go()['resolved']);self.assertFalse((self.output/'OWNER_COMPLETION.json').exists())

    def test_reviewer_identity_mismatch_rejected(self):
        self.bad_payload=lambda payload,spec,job:payload.__setitem__('reviewer','researcher-round-0000')
        with self.assertRaises(common.Invalid):self.go()

    def test_current_source_changed_during_review_rejected(self):
        self.during_review=lambda:(self.fixture['workspace']/'research/correspondence.md').write_text('Changed input')
        with self.assertRaises(common.Invalid):self.go()

    def test_owner_rejects_changed_finished_bundle(self):
        self.go();pointer=common.read(self.output/'OWNER_COMPLETION.json')
        (Path(pointer['validation_directory'])/'source/declarations.json').write_text('changed')
        with self.assertRaises(common.Invalid):self.verified()

    def test_owner_rejects_mutated_auditor_receipt(self):
        self.go();pointer=common.read(self.output/'OWNER_COMPLETION.json')
        path=Path(pointer['auditor']['job'])/'receipt.json';receipt=common.read(path);receipt['role']='researcher';common.write(path,receipt)
        with self.assertRaises(common.Invalid):self.verified()

    def test_original_main_job_role_cannot_be_adapter(self):
        job=self.fixture['study']/'arms/exploration/jobs/round-0000'
        spec=common.read(job/'spec.json');spec['role']='adapter';common.write(job/'spec.json',spec)
        with self.assertRaises(common.Invalid):self.go()
        self.assertEqual(self.launches,0)

    def add_round(self,index,*,exact=True,claim=None):
        root=self.fixture['study'];workspace=self.fixture['workspace'];armroot=root/'arms/exploration'
        claim=claim or self.fixture['claim']
        job=armroot/'jobs'/f'round-{index:04d}'
        common.write(job/'spec.json',dict(role='researcher',workspace=str(workspace),request_id=job.name))
        receipt=dict(role='researcher',request_id=job.name,outcome='completed',payload={'completion':claim})
        common.write(job/'receipt.json',receipt)
        state=common.load_state(armroot/'state.json');state['round']=index+1
        state['receipts'].append(str(job));state['receipt_hashes'][str(job)]=common.digest(receipt)
        common.save_state(armroot/'state.json',state)
        self.fixture['protocol']['rounds']=index+1;common.write(root/'protocol.json',self.fixture['protocol'])
        contract=self.fixture['contract']
        key=common.digest(dict(claim=claim,audit=None,round=index));directory=armroot/'completion'/key
        result=make_finished(directory,contract,claim,finalize.prepare(workspace,contract,claim))
        if not exact:
            result['lean_exact_root_checked']=False
            common.write(directory/'result.json',result)
            validation_receipts.finish(directory,{'contract':contract,'claim':claim,'audit':None},claim,())
        common.write(armroot/'completion-claims'/f'round-{index:04d}.json',dict(claim=claim,result=result))

    def test_genuine_failed_completion_is_skipped_before_eligible_candidate(self):
        self.add_round(1,exact=False)
        self.assertTrue(self.go()['resolved']);self.assertEqual(self.launches,1)

    def test_one_paid_attempt_even_with_multiple_current_candidates(self):
        self.add_round(1);self.accepted=False
        result=self.go();self.assertEqual(result['reviewed'],1);self.assertEqual(self.launches,1)

    def test_drain_signal_finds_other_bundle_without_repeating_rejections(self):
        self.add_round(1,claim={**self.fixture['claim'],'declaration':'Neutral.claim2'})
        self.accepted=False;first=self.go()
        self.assertTrue(first['more_eligible']);self.assertEqual(first['new_attempts'],1)
        self.output=self.base/'outputs/0001';second=self.go()
        self.assertFalse(second['more_eligible']);self.assertEqual(second['new_attempts'],1)
        self.output=self.base/'outputs/0002';third=self.go()
        self.assertFalse(third['more_eligible']);self.assertEqual(third['new_attempts'],0)
        self.assertEqual(self.launches,2)

    def test_cached_native_unresolved_does_not_block_other_current_bundle(self):
        self.add_round(1,claim={**self.fixture['claim'],'declaration':'Neutral.claim2'})
        self.native_resolved=False;first=self.go();self.assertTrue(first['more_eligible'])
        self.output=self.base/'outputs/0001';self.native_resolved=True
        self.assertTrue(self.go()['resolved']);self.assertTrue(self.verified()['proved'])

    def test_generated_input_collision_rejected(self):
        arm=study.Arm(self.fixture['study'],'exploration',None)
        value=dict(bundle=self.fixture['bundle'],claim={**self.fixture['claim'],'correspondence':'bundle.json'})
        with self.assertRaisesRegex(common.Invalid,'collides'):
            finalize.stage(arm,value,self.base/'bad-stage')

    def test_real_bounded_wrapper_uses_fixed_funding_and_fresh_sandbox(self):
        arm=study.Arm(self.fixture['study'],'exploration',None);arm.p['validation_seconds']=1800
        def checker(contract,claim,directory,*,audit,stop):
            finalize.completion.run(['synthetic-checker'],timeout=1800,env={},cwd=directory,output_bytes=1)
            return {'SYNTHETIC':'not mathematical evidence'}
        with patch.object(finalize.completion,'verify',side_effect=checker),patch.object(finalize.completion,'run',return_value={}) as launch:
            result,costs=finalize.validate_native(arm,dict(claim=self.fixture['claim']),{},self.base/'bounded-check')
        self.assertLessEqual(launch.call_args.kwargs['timeout'],600)
        self.assertEqual(launch.call_args.kwargs['env']['TMPDIR'],str(self.base/'bounded-check'))
        self.assertEqual(costs['validation_budget_seconds'],600)

    def test_rejection_feedback_delivered_only_after_both_comparison_arms_closed(self):
        root=self.fixture['study'];state=common.load_state(root/'arms/exploration/state.json')
        common.save_state(root/'arms/baseline/state.json',state)
        self.accepted=False;result=self.go()
        self.assertEqual(result['feedback']['delivery'],'own_source_note_after_comparison')
        note=common.read(result['feedback']['path']);self.assertFalse(note['audit']['accepted'])
        self.assertTrue(all(isinstance(value,str) for value in note['audit']['checks'].values()))

    def test_changed_worker_role_is_rejected(self):
        def change(payload,spec,job):
            spec['role']='researcher';common.write(job/'spec.json',spec)
        self.bad_payload=change
        with self.assertRaises(common.Invalid):self.go()

    def test_direct_cli_import_without_pythonpath_or_cwd_help(self):
        result=subprocess.run([common.PYTHON,str(HERE/'finalize.py'),'--help'],cwd=self.base,
            env={'PATH':'/usr/bin:/bin','PYTHONSAFEPATH':'1','PYTHONDONTWRITEBYTECODE':'1'},
            capture_output=True,text=True,timeout=20)
        self.assertEqual(result.returncode,0,result.stderr)
        self.assertIn('--contract-sha256',result.stdout)

    def test_successor_own_source_feedback_does_not_wait_for_dormant_baseline(self):
        root=self.fixture['study']
        common.save_state(root/'arms/baseline/state.json',dict(active=None,status='ready'))
        common.write(root/'CONTINUATION_PROVENANCE.json',dict(schema='math-gkm.closed-own-epoch.v1',arm='exploration'))
        common.write(root/'seal.json',dict(continuation_provenance_sha256=common.sha(root/'CONTINUATION_PROVENANCE.json')))
        common.write(root/'MIGRATION_FINISHED.json',dict(provenance_sha256=common.sha(root/'CONTINUATION_PROVENANCE.json'),seal_sha256=common.sha(root/'seal.json')))
        self.accepted=False;result=self.go()
        self.assertEqual(result['feedback']['delivery'],'own_source_note_after_comparison')

    def test_primary_retrieval_exact_url_bytes_and_bounds(self):
        contract=dict(primary_citations=[dict(url='https://arxiv.org/pdf/2603.22226v1',version='v1')])
        target=self.base/'primary-stage';target.mkdir()
        with patch.object(finalize.urllib.request,'urlopen',return_value=PrimaryResponse(b'%PDF-SYNTHETIC')) as call,patch.object(finalize,'headroom'):
            rows=finalize.primary_inputs(contract,target)
        self.assertEqual(rows[0]['sha256'],common.sha(target/rows[0]['artifact']))
        call.assert_called_once_with(contract['primary_citations'][0]['url'],timeout=30)
        contract['primary_citations'][0]['url']='https://arxiv.org/pdf/2603.22226'
        with self.assertRaises(common.Invalid):finalize.primary_inputs(contract,self.base/'invalid')


if __name__=='__main__':unittest.main()
