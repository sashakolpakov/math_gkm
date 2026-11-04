"""Synthetic transaction qualification. No live study, model or compiler.

Real opaque E1 rebinding, filesystem CAS/locks, and FINISHED receipt reuse run.
Native verification process boundaries are replaced with explicit fixture data.
"""
import copy
import fcntl
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from machinery import inspection_profiles, study_common as common, validation_receipts
from machinery.study_knowledge import verify_record

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('inactive_revision_under_test', HERE/'revision.py')
r = importlib.util.module_from_spec(spec); spec.loader.exec_module(r)
PRIVATE = 'PRIVATE_SYNTHETIC_RESEARCH_CONTENT_MUST_NOT_BE_PUBLISHED'


def put(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(r.canonical(value)+b'\n')
    return r.sha(path)


def finished_fixture(directory, task, solution):
    # Synthetic producer result, never represented as an actual Lean proof.
    artifact = directory/'source/declarations.json'
    put(artifact, {'synthetic':True})
    profile = inspection_profiles.resolve()
    evidence = dict(schema=profile.completion_schema, nonce='a'*64,
                    artifact_bytes=artifact.stat().st_size, artifact_sha256=r.sha(artifact))
    marker = f"GKM_DECLARATIONS_COMPLETE_V3:{evidence['nonce']}:{evidence['artifact_bytes']}:{evidence['artifact_sha256']}"
    result = dict(checked=True, finished=1, inspection_schema=profile.inspection_schema,
        producer_completion=evidence, declaration_artifact_sha256=r.sha(artifact), binary_hashes={}, pin_hashes={},
        declarations=[dict(name='Synthetic', artifact_bytes=evidence['artifact_bytes'],
                           artifact_sha256=evidence['artifact_sha256'], producer_completion=evidence)],
        checks=[dict(operation='trusted_premise_inspection', returncode=0, termination=None, stdout=marker+'\n')])
    put(directory/'result.json', result)
    validation_receipts.finish(directory, task, solution, [])
    return result


class RevisionTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(); self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()/'root'; self.root.mkdir()
        self.study = self.root/'.scratch/studies/synthetic-gaussian'
        self.base = self.root/'.bootstrap/source-transition'; self.base.mkdir(parents=True)
        (self.study/'arms').mkdir(parents=True)
        (self.root/'.scratch/resources').mkdir(parents=True)
        (self.root/'machinery').mkdir(); (self.root/'MathGKM').mkdir()
        (self.root/'config').mkdir()
        (self.root/'config/study-base-permissions.json').write_text('{}\n')
        (self.root/'MathGKM/Root.lean').write_text('-- Synthetic root source, no compiler run.\n')
        for name in ('study_context.py', 'study_bridge.py', 'study.py', 'resources.py'):
            (self.root/'machinery'/name).write_text('# Synthetic old source '+name+'\n')
        self.old = r.source_vector(self.root); self.new = dict(self.old)
        changes = {}
        for name in ('study_context.py','study_bridge.py'):
            source = self.base/'candidate'/name; source.parent.mkdir(exist_ok=True)
            source.write_text('# Synthetic reviewed changed source '+name+'\n')
            relative = 'machinery/'+name; self.new[relative] = r.sha(source)
            changes[relative] = dict(path=str(source), sha256=r.sha(source), old_sha256=self.old[relative])
        self.contract = {'synthetic_exact_goal':'True'}
        put(self.study/'protocol.json', {'transport':'live','validation_seconds':600,'rounds':8})
        put(self.study/'seed/contract.json', self.contract)
        neutral = self.base/'old-neutral'
        put(neutral/'result.json', {'ready':True,'synthetic':True})
        receipt = {'files':{'result.json':r.sha(neutral/'result.json')}}
        put(neutral/'RECEIPT.json', receipt)
        old_binding = dict(ready=True, receipt=str(neutral/'RECEIPT.json'), receipt_sha256=r.sha(neutral/'RECEIPT.json'))
        put(self.study/'seal.json', {'implementation':self.old,'deployment_preflight':old_binding,'immutable':'old'})
        self.authority = self.root/'.bootstrap/study-authorization.json'
        put(self.authority, dict(implementation_sha256=r.digest(self.old), contract_sha256=r.digest(self.contract), user_explicit_ok=True,
                                operational_recovery={'legacy':'unchanged'}, unrelated='preserve'))
        self.records = {}; self.native_calls = []; self.fail_new_verify = False; self.foreign = False
        self.bad_deployment = False; self.bad_evidence = False
        for mode in ('baseline','exploration'):
            arm = self.study/'arms'/mode; workspace = arm/'workspace'
            source = workspace/'MathGKM/Claim.lean'; source.parent.mkdir(parents=True)
            source.write_text('-- Synthetic receipt source, never a mathematical assertion.\n')
            task, solution = {'synthetic':'task'}, {'synthetic':'solution'}
            directory = arm/'checks/synthetic-finished'
            result = finished_fixture(directory, task, solution)
            record = {'source_files':{'MathGKM/Claim.lean':r.sha(source)},
                      'validation_bundle':{'directory':str(directory),'finished_sha256':r.sha(directory/'FINISHED.json')},
                      'task':task,'solution':solution,'receipt_hash':r.digest(result)}
            self.records[mode] = record
            state = dict(seal_hash=r.digest(json.loads((self.study/'seal.json').read_bytes())), active=None,active_intent=None,
                status='running', round=7, calls=31, seconds=12345, receipts=[],
                research={'private':PRIVATE,'knowledge':{'synthetic':record},'components':{}},
                protocol_state={'pending':False,'inflight':False,'count':31}, reservations={'call-plan-0007':1800})
            common.save_state(arm/'state.json', state)
        self.job = self.study/'arms/exploration/jobs/plan-0007'
        put(self.job/'spec.json', {'role':'proposer','readonly':True,'request_id':'plan-0007','seconds':1800})
        put(self.job/'request.json', {'private_request':PRIVATE})
        (self.job/'prompt.txt').write_text(PRIVATE)
        put(self.job/'receipt.json', {'outcome':'uncertain_effects_not_replayed','payload':None,
                                     'role':'proposer','elapsed_seconds':1800,'request_id':'plan-0007'})
        obs = dict(schema='math-gkm.closed-prelaunch-proposer-observation.v1',study=str(self.study),arm='exploration',
                   logical_round=7,failed_request_id='plan-0007',old_implementation_sha256=r.digest(self.old),
                   watchdog_popen_reached=False,model_started=False,cleanup_verified=True)
        for key,code in (('old_owner_exit',2),('old_native_exit',1),('native_recovery_exit',0)):
            obs[key] = dict(actual_numeric_exit_observed=True,returncode=code,completion_reference='synthetic-owned-exit')
        put(self.base/'observation.json', obs)
        put(self.base/'qualification.json', dict(accepted=True,implementation_sha256=r.digest(self.new),
                                               independent_source_review=True,tests_passed=True))
        evidence = {name:{'path':str(self.base/(name+'.json')),'sha256':r.sha(self.base/(name+'.json'))}
                    for name in ('observation','qualification')}
        names = [self.study/'seal.json',self.study/'protocol.json',self.study/'seed/contract.json',self.authority]
        names += [self.study/name for name in r.ARM_STATES]
        names += [self.job/name for name in ('spec.json','request.json','prompt.txt','receipt.json')]
        self.config = dict(schema=r.SCHEMA,authorized=True,root=str(self.root),study=str(self.study),authority=str(self.authority),
            arm='exploration',logical_round=7,failed_request_id='plan-0007',next_request_id='plan-0007-repair-1',
            old_implementation=self.old,implementation=self.new,changes=changes,evidence=evidence,
            projection={'path':str(r.PARSER),'sha256':r.PARSER_SHA}, contract_sha256=r.digest(self.contract),
            before_files={str(path):r.sha(path) for path in names},scientific_status='revised_source_history_no_causal_learning_claim')
        self.config_path = self.base/'CONFIG.json'; self.reconfig()
        self.output = self.base/'transaction'
        self.patchers = [patch.object(r,'ROOT',self.root),patch.object(common,'ROOT',self.root)]
        for item in self.patchers:item.start();self.addCleanup(item.stop)
        outer = self
        class SyntheticNative:
            def __init__(self,c,output):self.c=c
            def verify(self,implementation):
                outer.native_calls.append(('verify',r.digest(implementation)))
                if implementation == outer.new and outer.fail_new_verify:
                    if outer.foreign:
                        statepath = outer.study/'arms/exploration/state.json'
                        statepath.write_bytes(statepath.read_bytes()+b' ')
                    raise r.Hold('synthetic failed native check')
                arms = {}
                for mode in ('baseline','exploration'):
                    verify_record(outer.records[mode],outer.study/'arms'/mode/'workspace')
                    state = common.load_state(outer.study/'arms'/mode/'state.json')
                    arms[mode] = dict(accepted_count=1, accepted_binding=r.digest(outer.records[mode]),
                                     research_binding=r.digest(state['research']))
                return dict(verified=True,arms=arms,contract_sha256=r.digest(outer.contract),
                            protocol_sha256=r.sha(outer.study/'protocol.json'))
            def material(self,implementation):
                return dict(request_binding=r.digest(json.loads((outer.job/'request.json').read_bytes())),
                    receipt_binding=r.digest(json.loads((outer.job/'receipt.json').read_bytes())),
                    recovery_projection_sha256='1'*64,workspace_binding='2'*64)
            def deployment(self,implementation,path):
                return dict(verified=not outer.bad_deployment,binding=json.loads(Path(path).read_bytes()),
                            implementation_sha256=r.digest(implementation))
            def evidence(self,implementation,path):
                return {'verified':not outer.bad_evidence}
        self.native = SyntheticNative
        self.originals = {name:Path(name).read_bytes() for name in self.config['before_files']}
        self.old_source = {name:(self.root/name).read_bytes() for name in self.old}
        self.deployment = self.base/'new-deployment-binding.json'
        put(self.deployment, {'ready':True,'receipt':'synthetic-new-receipt','receipt_sha256':'3'*64})

    def reconfig(self):
        self.pin = put(self.config_path,self.config)
    def prepare(self):return r.prepare(self.config_path,self.pin,self.output,self.native)
    def install(self):return r.install(self.config_path,self.pin,self.output,self.native)
    def finish(self):return r.finalize(self.config_path,self.pin,self.output,self.deployment,r.sha(self.deployment),self.native)
    def installed(self):self.prepare();self.install()
    def assert_original(self):
        for name,data in self.originals.items():self.assertEqual(Path(name).read_bytes(),data)
        for name,data in self.old_source.items():self.assertEqual((self.root/name).read_bytes(),data)

    def test_complete_transition_preserves_math_accounting_history_and_private_canary(self):
        self.installed(); finished=self.finish()
        self.assertEqual(finished['phase'],'finalized_not_launched')
        seal=json.loads((self.study/'seal.json').read_bytes())
        self.assertEqual(seal['implementation'],self.new)
        authority=json.loads(self.authority.read_bytes())
        self.assertEqual(authority['operational_recovery'],{'legacy':'unchanged'})
        self.assertIn('prelaunch_recovery',authority)
        for mode in ('baseline','exploration'):
            old=json.loads(self.originals[str(self.study/'arms'/mode/'state.json')])['state']
            new=common.load_state(self.study/'arms'/mode/'state.json')
            self.assertNotEqual(new.pop('seal_hash'),old.pop('seal_hash'));self.assertEqual(new,old)
        self.assertNotIn('returncode',json.loads((self.job/'receipt.json').read_bytes()))
        for name in ('spec.json','request.json','prompt.txt','receipt.json'):
            path=self.job/name;self.assertEqual(path.read_bytes(),self.originals[str(path)])
        for name in ('PREPARED.json','GRANT.json','FINISHED.json','TRANSACTION.json'):
            self.assertNotIn(PRIVATE,(self.output/name).read_text())
        record=json.loads((self.output/'PREPARED.json').read_bytes())
        for name,row in record['backups'].items():self.assertEqual(r.sha(row['path']),record['expected'][name])

    def test_prepare_selects_small_deployment_from_large_dependency_seal(self):
        seal_path=self.study/'seal.json';seal=json.loads(seal_path.read_bytes())
        sentinel='NEUTRAL_LARGE_DEPENDENCY_TOKEN'
        files={f'neutral/Module{index:05d}.olean':'a'*64 for index in range(70000)}
        files[sentinel]='b'*64
        seal['dependencies']={'binaries':{},'trees':{'neutral':{
            'path':'/__neutral__/dependency','files_sha256':'c'*64,'files':files}}}
        put(seal_path,seal);large_seal=seal_path.read_bytes()
        self.assertGreater(len(large_seal),4*1024**2)
        self.assertLess(len(large_seal),8*1024**2)
        for mode in ('baseline','exploration'):
            path=self.study/'arms'/mode/'state.json';state=common.load_state(path)
            state['seal_hash']=r.digest(seal);common.save_state(path,state)
            self.config['before_files'][str(path)]=r.sha(path)
        self.config['before_files'][str(seal_path)]=r.sha(seal_path);self.reconfig()
        with self.assertRaisesRegex(r.Hold,'bounded artifact exceeded'):r.metadata(seal_path)
        original_loads=json.loads
        def guarded_loads(data,*args,**kwargs):
            text=data.decode() if isinstance(data,bytes) else data
            if len(text)>4*1024**2 and sentinel in text:
                raise AssertionError('large dependency token must remain opaque')
            return original_loads(data,*args,**kwargs)
        with patch.object(r.json,'loads',side_effect=guarded_loads):result=self.prepare()
        self.assertEqual(result['phase'],'prepared')
        self.assertEqual(seal_path.read_bytes(),large_seal)
        record=json.loads((self.output/'PREPARED.json').read_bytes())
        backup=Path(record['backups'][str(seal_path)]['path'])
        self.assertEqual(backup.read_bytes(),large_seal)

    def test_original_authority_must_bind_old_implementation(self):
        value=json.loads(self.authority.read_bytes());value['implementation_sha256']='f'*64
        put(self.authority,value);self.config['before_files'][str(self.authority)]=r.sha(self.authority);self.reconfig()
        with self.assertRaisesRegex(r.Hold,'original authority'):self.prepare()
        self.assertFalse(self.output.exists());self.assertEqual(r.source_vector(self.root),self.old)

    def test_original_authority_requires_explicit_boolean_user_authorization(self):
        value=json.loads(self.authority.read_bytes());value['user_explicit_ok']=1
        put(self.authority,value);self.config['before_files'][str(self.authority)]=r.sha(self.authority);self.reconfig()
        with self.assertRaisesRegex(r.Hold,'original authority'):self.prepare()
        self.assertFalse(self.output.exists());self.assertEqual(r.source_vector(self.root),self.old)

    def test_original_authority_must_bind_unchanged_exact_contract(self):
        value=json.loads(self.authority.read_bytes());value['contract_sha256']='f'*64
        put(self.authority,value);self.config['before_files'][str(self.authority)]=r.sha(self.authority);self.reconfig()
        with self.assertRaisesRegex(r.Hold,'original authority'):self.prepare()
        self.assertFalse(self.output.exists());self.assertEqual(r.source_vector(self.root),self.old)

    def tamper_stage(self,change):
        path=self.output/'TRANSACTION.json';value=json.loads(path.read_bytes());change(value)
        path.chmod(0o600);put(path,value);path.chmod(0o400)

    def test_finalize_rejects_stage_widening_to_a_state_path(self):
        self.installed()
        path=self.study/'arms/exploration/state.json'
        self.tamper_stage(lambda value:value['own_writes'].update({str(path):r.sha(path)}))
        with self.assertRaisesRegex(r.Hold,'stage widens'):self.finish()
        self.assertEqual(path.read_bytes(),self.originals[str(path)])
        self.assertFalse((self.output/'GRANT.json').exists())

    def test_maintenance_rejects_stage_widening_to_authority(self):
        self.installed()
        self.tamper_stage(lambda value:value['own_writes'].update({str(self.authority):r.sha(self.authority)}))
        with self.assertRaisesRegex(r.Hold,'stage widens'):
            with r.maintenance_fence(self.config_path,self.pin,self.output):self.fail('invalid stage admitted')
        self.assertEqual(self.authority.read_bytes(),self.originals[str(self.authority)])

    def test_finalize_rejects_stage_source_hash_replacement(self):
        self.installed()
        path=str(self.root/'machinery/study_context.py')
        self.tamper_stage(lambda value:value['own_writes'].update({path:'f'*64}))
        with self.assertRaisesRegex(r.Hold,'stage widens'):self.finish()
        self.assertFalse((self.output/'GRANT.json').exists())

    def test_maintenance_rejects_stage_missing_a_configured_source_write(self):
        self.installed()
        self.tamper_stage(lambda value:value['own_writes'].pop(str(self.root/'machinery/study_bridge.py')))
        with self.assertRaisesRegex(r.Hold,'stage widens'):
            with r.maintenance_fence(self.config_path,self.pin,self.output):self.fail('incomplete stage admitted')

    def test_unsettled_work_rejected_before_backup(self):
        path=self.study/'arms/exploration/state.json';s=common.load_state(path);s['active']='unsettled';common.save_state(path,s)
        self.config['before_files'][str(path)]=r.sha(path);self.reconfig()
        with self.assertRaisesRegex(r.Hold,'unsettled'):self.prepare()
        self.assertFalse(self.output.exists())

    def test_unreviewed_guard_change_refused(self):
        self.config['implementation']['machinery/resources.py']='a'*64;self.reconfig()
        with self.assertRaisesRegex(r.Hold,'unreviewed'):self.prepare()
        self.assert_original()

    def test_bad_source_qualification_refused(self):
        path=self.base/'qualification.json';q=json.loads(path.read_bytes());q['implementation_sha256']='f'*64
        put(path,q);self.config['evidence']['qualification']['sha256']=r.sha(path);self.reconfig()
        with self.assertRaisesRegex(r.Hold,'qualification'):self.prepare()
        self.assert_original()

    def test_unclosed_owner_observation_refused(self):
        path=self.base/'observation.json';q=json.loads(path.read_bytes());q['old_owner_exit']['actual_numeric_exit_observed']=False
        put(path,q);self.config['evidence']['observation']['sha256']=r.sha(path);self.reconfig()
        with self.assertRaisesRegex(r.Hold,'actual closed'):self.prepare()
        self.assert_original()

    def test_claimed_model_launch_refused(self):
        path=self.base/'observation.json';q=json.loads(path.read_bytes());q['model_started']=True
        put(path,q);self.config['evidence']['observation']['sha256']=r.sha(path);self.reconfig()
        with self.assertRaisesRegex(r.Hold,'prelaunch observation'):self.prepare()

    def test_controller_lock_blocks_without_creating_output(self):
        with (self.study/'controller.lock').open('a') as handle:
            fcntl.flock(handle,fcntl.LOCK_EX|fcntl.LOCK_NB)
            with self.assertRaisesRegex(r.Hold,'not quiescent'):self.prepare()
        self.assertFalse(self.output.exists());self.assert_original()

    def test_heavy_lock_blocks_without_creating_output(self):
        with (self.root/'.scratch/resources/heavy.lock').open('a') as handle:
            fcntl.flock(handle,fcntl.LOCK_EX|fcntl.LOCK_NB)
            with self.assertRaisesRegex(r.Hold,'not quiescent'):self.prepare()
        self.assertFalse(self.output.exists());self.assert_original()

    def test_cleanup_hold_blocks(self):
        put(self.root/'.scratch/resources/UNRESOLVED_CLEANUP.json',{'synthetic':True})
        with self.assertRaisesRegex(r.Hold,'cleanup hold'):self.prepare()
        self.assertFalse(self.output.exists());self.assert_original()

    def test_prepare_detects_genuine_finished_bundle_tamper(self):
        path=Path(self.records['baseline']['validation_bundle']['directory'])/'source/declarations.json'
        path.write_text('tampered')
        with self.assertRaisesRegex(common.Invalid,'artifact changed'):self.prepare()
        self.assert_original()

    def test_install_refuses_changed_pinned_request(self):
        self.prepare();(self.job/'request.json').write_text('{}')
        with self.assertRaisesRegex(r.Hold,'preserved file'):self.install()
        self.assertEqual(r.source_vector(self.root),self.old)

    def test_archive_tamper_refuses_install(self):
        self.prepare();record=json.loads((self.output/'PREPARED.json').read_bytes())
        backup=Path(record['backups'][str(self.study/'seal.json')]['path']);backup.chmod(0o600);backup.write_text('{}')
        with self.assertRaisesRegex(r.Hold,'archive'):self.install()
        self.assert_original()

    def test_install_is_maintenance_gap_with_old_seal_and_auth(self):
        self.installed();self.assertEqual(r.source_vector(self.root),self.new)
        self.assertEqual((self.study/'seal.json').read_bytes(),self.originals[str(self.study/'seal.json')])
        self.assertEqual(self.authority.read_bytes(),self.originals[str(self.authority)])
        self.assertEqual(json.loads((self.output/'TRANSACTION.json').read_bytes())['phase'],'source_installed_maintenance')
        with self.assertRaisesRegex(r.Hold,'explicit requested phase'):self.install()

    def test_maintenance_fence_keeps_controller_and_releases_heavy(self):
        self.installed()
        with r.maintenance_fence(self.config_path,self.pin,self.output):
            with (self.study/'controller.lock').open('a') as other:
                with self.assertRaises(BlockingIOError):fcntl.flock(other,fcntl.LOCK_EX|fcntl.LOCK_NB)
            with (self.root/'.scratch/resources/heavy.lock').open('a') as heavy:
                fcntl.flock(heavy,fcntl.LOCK_EX|fcntl.LOCK_NB)
                fcntl.flock(heavy,fcntl.LOCK_UN)
            self.assertEqual((self.study/'seal.json').read_bytes(),self.originals[str(self.study/'seal.json')])

    def test_maintenance_fence_detects_foreign_source_change(self):
        self.installed()
        with self.assertRaisesRegex(r.Hold,'preserved file'):
            with r.maintenance_fence(self.config_path,self.pin,self.output):
                (self.root/'machinery/study_context.py').write_text('# foreign change')

    def test_missing_deployment_does_not_reseal(self):
        self.installed();self.bad_deployment=True
        with self.assertRaisesRegex(r.Hold,'new exact-source deployment'):self.finish()
        self.assertEqual((self.study/'seal.json').read_bytes(),self.originals[str(self.study/'seal.json')])
        self.assertEqual(self.authority.read_bytes(),self.originals[str(self.authority)])

    def test_new_authority_is_published_only_after_successful_reuse_verification(self):
        self.installed(); observed=[]; outer=self; original_native=self.native
        class ObservingNative(original_native):
            def verify(self,implementation):
                if implementation==outer.new:observed.append(outer.authority.read_bytes())
                return super().verify(implementation)
        self.native=ObservingNative
        self.finish()
        self.assertEqual(observed,[self.originals[str(self.authority)]])
        self.assertEqual(json.loads(self.authority.read_bytes())['implementation_sha256'],r.digest(self.new))

    def test_failed_reuse_with_foreign_state_never_publishes_new_authority(self):
        self.installed(); self.fail_new_verify=True; self.foreign=True
        observed=[]; outer=self; original_native=self.native
        class ObservingNative(original_native):
            def verify(self,implementation):
                if implementation==outer.new:observed.append(outer.authority.read_bytes())
                return super().verify(implementation)
        self.native=ObservingNative
        with self.assertRaisesRegex(r.Hold,'synthetic failed'):self.finish()
        self.assertEqual(observed,[self.originals[str(self.authority)]])
        self.assertEqual(self.authority.read_bytes(),self.originals[str(self.authority)])
        self.assertEqual(json.loads((self.output/'TRANSACTION.json').read_bytes())['phase'],'needs_reconciliation')
        self.assertFalse((self.output/'FINISHED.json').exists())

    def test_foreign_authority_before_activation_is_preserved_without_success(self):
        self.installed(); outer=self; original_native=self.native
        foreign=r.canonical({'foreign_operator_write':True})+b'\n'
        class ForeignAuthorityNative(original_native):
            def verify(self,implementation):
                result=super().verify(implementation)
                if implementation==outer.new:outer.authority.write_bytes(foreign)
                return result
        self.native=ForeignAuthorityNative
        with self.assertRaisesRegex(r.Hold,'preserved file'):self.finish()
        self.assertEqual(self.authority.read_bytes(),foreign)
        self.assertEqual(json.loads((self.output/'TRANSACTION.json').read_bytes())['phase'],'needs_reconciliation')
        self.assertFalse((self.output/'FINISHED.json').exists())

    def test_final_validation_failure_rolls_back_only_known_own_writes(self):
        self.installed();self.fail_new_verify=True
        with self.assertRaisesRegex(r.Hold,'synthetic failed'):self.finish()
        self.assert_original()
        self.assertEqual(json.loads((self.output/'TRANSACTION.json').read_bytes())['phase'],'finalize_failed_rolled_back')
        self.assertFalse((self.output/'FINISHED.json').exists())

    def test_foreign_divergence_prevents_rollback_and_requires_reconciliation(self):
        self.installed();self.fail_new_verify=True;self.foreign=True
        with self.assertRaisesRegex(r.Hold,'synthetic failed'):self.finish()
        self.assertEqual(json.loads((self.output/'TRANSACTION.json').read_bytes())['phase'],'needs_reconciliation')
        self.assertTrue((self.study/'arms/exploration/state.json').read_bytes().endswith(b' '))
        self.assertEqual(r.source_vector(self.root),self.new)
        self.assertFalse((self.output/'FINISHED.json').exists())

    def test_new_deployment_cannot_reuse_unpinned_input(self):
        self.installed()
        with self.assertRaisesRegex(r.Hold,'input pin'):
            r.finalize(self.config_path,self.pin,self.output,self.deployment,'0'*64,self.native)
        self.assertEqual((self.study/'seal.json').read_bytes(),self.originals[str(self.study/'seal.json')])

    def test_old_deployment_artifact_tamper_detected_before_install(self):
        self.prepare();(self.base/'old-neutral/result.json').write_text('tampered')
        with self.assertRaisesRegex(r.Hold,'preserved file'):self.install()
        self.assertEqual(r.source_vector(self.root),self.old)

    def test_opaque_state_rebinding_is_exact_outside_single_field(self):
        projection=r.parser(self.config)
        path=self.study/'arms/exploration/state.json';original=path.read_bytes()
        old=r.state_fields(original,projection)
        revised=r.rebind_state(original,json.loads(old['seal_hash']),'9'*64,projection)
        new=r.state_fields(revised,projection)
        self.assertEqual({k:v for k,v in old.items() if k!='seal_hash'},
                         {k:v for k,v in new.items() if k!='seal_hash'})
        self.assertIn(PRIVATE.encode(),revised)

    def test_old_snapshot_global_ledger_mismatch_uses_fresh_exact_input(self):
        from machinery import snapshot_routing
        from types import SimpleNamespace
        source=self.base/'synthetic-snapshot';source.mkdir()
        arm=SimpleNamespace(root=self.study/'arms/exploration',study=self.study)
        with patch.object(snapshot_routing,'_epoch',return_value='synthetic'), \
             patch.object(snapshot_routing,'_sealed',return_value=({}, {'formal':{'common':{'implementation':'old'}}})), \
             patch.object(snapshot_routing,'_common_inputs',return_value={'implementation':'new'}):
            chosen,reason,binding=snapshot_routing._select(arm,source)
        self.assertEqual(chosen,source);self.assertEqual(reason,'fresh_B_unknown_or_legacy_seal');self.assertIsNone(binding)


if __name__=='__main__':
    unittest.main()
