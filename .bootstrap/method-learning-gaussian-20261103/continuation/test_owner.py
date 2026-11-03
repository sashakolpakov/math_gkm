"""Synthetic operation controls. No research/model/compiler/private-state calls."""
import copy
import contextlib
import importlib.util
from pathlib import Path
import tempfile
import sys
import unittest
from unittest.mock import patch

SOURCE=Path(__file__).with_name('owner.py')
spec=importlib.util.spec_from_file_location('goal_owner_under_test',SOURCE)
owner=importlib.util.module_from_spec(spec);spec.loader.exec_module(owner)
sys.path.insert(0,str(owner.ROOT))


def row(round=8,status='finite_budget_finished; root_open',calls=3,active=False,closed=True):
    return {'round':round,'phase':'research','status':status,'calls':calls,'meta_calls':1,
        'failures':0,'active_is_null':not active,'active_intent_is_null':not active,
        'resolution_is_null':True,'state_file_sha256':'a'*64,'all_job_receipts_numeric':closed,
        'knowledge_count':0,'components_count':0}


class Fake:
    def __init__(self,initial,prove_after=1):
        self.initial=str(initial);self.rows={self.initial:{m:row() for m in ('baseline','exploration')}}
        self.ends={self.initial:8};self.migrations=[];self.curations=[];self.runs=[];self.recoveries=[]
        self.prove_after=prove_after;self.resource_ready=True;self.on_run=None;self.finalizations=[];self.finalize_code=0;self.on_finalize=None;self.more_finalizations=[]
    def public(self,study):return copy.deepcopy(self.rows[str(study)])
    def verify(self,study):pass
    def proof(self,study,modes):
        if len(self.migrations)>=self.prove_after:return {'proved':True,'bundle_hash':'f'*64,'receipt_sha256':'e'*64}
        return None
    def finalize(self,study,both):
        self.finalizations.append((str(study),both))
        return self.on_finalize(study,both) if self.on_finalize else self.finalize_code
    def finalization_pending(self,study):
        return self.more_finalizations.pop(0) if self.more_finalizations else False
    def headroom(self):return self.resource_ready
    def protocol(self,study):return {'rounds':self.ends[str(study)]}
    def recover(self,study):
        self.recoveries.append(str(study))
        for value in self.rows[str(study)].values():value.update(active_is_null=True,active_intent_is_null=True)
        return 0
    def run(self,study,both):
        self.runs.append((str(study),both))
        if self.on_run:return self.on_run(study,both)
        for mode in ('baseline','exploration') if both else ('exploration',):
            self.rows[str(study)][mode]=row(round=self.ends[str(study)])
        return 0
    def curate(self,directory):self.curations.append(Path(directory));return directory
    def migrate(self,parent,destination,curation):
        self.migrations.append((Path(parent),Path(destination),Path(curation)))
        start=self.ends[str(parent)];self.ends[str(destination)]=start+8
        self.rows[str(destination)]={'baseline':row(round=0,status='ready',calls=0),
            'exploration':row(round=start,status='ready',calls=0)}
        return {'study':str(destination),'start_round':start,'end_round':start+8,'provenance_path':'synthetic-provenance.json'}


class GoalOwnerTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory(prefix='gaussian-owner-neutral-')
        self.addCleanup(self.tmp.cleanup);self.base=Path(self.tmp.name)
        self.study=self.base/'initial';self.config={'initial_study':str(self.study),
            'successor_root':str(self.base/'studies'),'contract_sha256':'c'*64,
            'owner_source_sha256':'d'*64,'initial_binding':str(self.base/'binding.json'),
            'initial_binding_sha256':'b'*64,'implementation_sha256':'e'*64,'profile_sha256':'f'*64}
        owner.STOPPING=False
    def build(self,prove_after=1):
        backend=Fake(self.study,prove_after)
        instance=owner.Owner(self.config,self.base/'runtime',backend)
        return instance,backend
    def binding(self):
        source=self.base/'actual-owner.py';source.write_text('public synthetic owner source\n')
        return {'schema':owner.BINDING_SCHEMA,'study':str(self.study),
            'owner_source':{'path':str(source),'sha256':owner.sha(source)},
            'expected_closed_phase':'resumed_both_arms_20261103_closed','registered_at':100,
            'status_path':str(self.base/'startup.json'),'implementation_sha256':'e'*64,
            'profile_sha256':'f'*64,'contract_sha256':'c'*64}
    def status(self):
        return {'phase':'resumed_both_arms_20261103_closed','study':str(self.study),
            'returncode':0,'actual_numeric_exit_observed':True,'observed_at':101}
    def test_stale_wrongphase_and_inflight_status_cannot_become_handoff(self):
        binding=self.binding();status=self.status()
        for value in [{**status,'observed_at':99},{**status,'phase':'running_both_arms_closed'},
                      {**status,'phase':'resumed_both_arms_20261103'}]:
            self.assertIsNone(owner.registered_exit(binding,value))
        self.assertEqual(owner.registered_exit(binding,status),0)
    def test_handoff_requires_numeric_actual_exit_and_unchanged_actual_owner(self):
        binding=self.binding();status=self.status()
        for change in [{'returncode':None},{'returncode':True},{'actual_numeric_exit_observed':False},
                       {'study':str(self.base/'another')}]:
            with self.subTest(change=change),self.assertRaises(owner.Hold):
                owner.registered_exit(binding,{**status,**change})
        Path(binding['owner_source']['path']).write_text('changed')
        with self.assertRaises(owner.Hold):owner.registered_exit(binding,status)
    def test_registered_handoff_consumes_real_closed_event_not_old_state(self):
        instance,backend=self.build();binding=self.binding()
        owner.write(self.base/'binding.json',binding)
        instance.c['initial_binding_sha256']=owner.sha(self.base/'binding.json')
        owner.write(self.base/'startup.json',self.status())
        self.assertEqual(instance.await_registered_owner_closed(),0)
        receipt=owner.public_json(instance.output/'INITIAL_CLOSED.json')
        self.assertTrue(receipt['actual_numeric_exit_observed'])
        self.assertEqual(receipt['registration_sha256'],instance.c['initial_binding_sha256'])
    def test_waiting_registered_owner_refreshes_public_pointer_without_research_reads(self):
        instance,backend=self.build();binding=self.binding()
        owner.write(self.base/'binding.json',binding)
        instance.c['initial_binding_sha256']=owner.sha(self.base/'binding.json')
        backend.public=unittest.mock.Mock(side_effect=AssertionError('waiting heartbeat must not inspect research'))
        with patch.object(instance,'stopping',side_effect=[False,False,True]), \
             patch.object(owner.time,'monotonic',side_effect=[20,40]),patch.object(owner.time,'sleep'), \
             patch.object(instance,'checkpoint',wraps=instance.checkpoint) as heartbeat:
            self.assertIsNone(instance.await_registered_owner_closed())
        self.assertEqual(heartbeat.call_count,2)
        pointer=owner.public_json(instance.output/'CURRENT.json')
        self.assertEqual(pointer['phase'],'waiting_initial_closure')
        self.assertEqual(pointer['current_study'],str(self.study));self.assertFalse(pointer['root_proved'])

    def test_handoff_refuses_job_without_its_numeric_receipt(self):
        instance,backend=self.build();binding=self.binding()
        owner.write(self.base/'binding.json',binding);owner.write(self.base/'startup.json',self.status())
        instance.c['initial_binding_sha256']=owner.sha(self.base/'binding.json')
        backend.rows[str(self.study)]['baseline']['all_job_receipts_numeric']=False
        with self.assertRaises(owner.Hold):instance.await_registered_owner_closed()
        self.assertFalse((instance.output/'INITIAL_CLOSED.json').exists())
    def test_more_than_eight_epochs_continue_until_exact_backend_proof(self):
        instance,backend=self.build(prove_after=10)
        with patch.object(instance,'await_registered_owner_closed',return_value=0):
            self.assertEqual(instance.run(),0)
        self.assertEqual(len(backend.migrations),10)
        self.assertEqual(len(backend.curations),10)
        self.assertTrue(instance.state['root_proved'])
        self.assertEqual(instance.state['phase'],'theorem_proved')
        self.assertTrue(all(not both for _,both in backend.runs))
        self.assertEqual(backend.ends[str(backend.migrations[-1][1])],88)
        pointer=owner.public_json(instance.output/'CURRENT.json')
        self.assertEqual(pointer['schema'],'math-gkm.gaussian-goal-current.v1')
        self.assertEqual(pointer['epoch'],10)
        self.assertEqual(pointer['current_study'],str(backend.migrations[-1][1]))
    def test_finite_open_boundary_does_not_claim_theorem(self):
        instance,backend=self.build(prove_after=10)
        self.assertTrue(instance.continue_until_boundary(self.study,True,0))
        self.assertFalse(instance.state['root_proved'])
        self.assertEqual(instance.state['phase'],'epoch_closed_root_open')
    def test_independent_finalization_can_close_original_goal_before_migration(self):
        instance,backend=self.build(prove_after=100)
        backend.proof=lambda *_: ({'proved':True,'bundle_hash':'f'*64,'receipt_sha256':'e'*64}
                                 if backend.finalizations else None)
        with patch.object(instance,'await_registered_owner_closed',return_value=0):
            self.assertEqual(instance.run(),0)
        self.assertEqual(backend.finalizations,[(str(self.study),True)])
        self.assertTrue(instance.state['root_proved']);self.assertFalse(backend.migrations)
        self.assertFalse(backend.curations);self.assertFalse(backend.runs)
    def test_finalization_rejection_is_no_theorem_and_does_not_halt_goal(self):
        instance,backend=self.build(prove_after=2)
        with patch.object(instance,'await_registered_owner_closed',return_value=0):
            self.assertEqual(instance.run(),0)
        self.assertEqual(len(backend.migrations),2)
        self.assertGreaterEqual(len(backend.finalizations),2)
        self.assertTrue(instance.state['root_proved'])
    def test_finalization_operation_uncertainty_is_not_replayed_or_migrated(self):
        instance,backend=self.build(prove_after=100);backend.finalize_code=2
        with self.assertRaises(owner.Hold):instance.continue_until_boundary(self.study,True,0)
        self.assertEqual(backend.finalizations,[(str(self.study),True)])
        self.assertFalse(instance.state['root_proved']);self.assertFalse(backend.runs)
        self.assertFalse(backend.migrations)

    def test_all_eligible_exact_bundles_are_drained_before_epoch_migration(self):
        instance,backend=self.build(prove_after=100);backend.more_finalizations=[True,True,False]
        self.assertTrue(instance.continue_until_boundary(self.study,True,0))
        self.assertEqual(backend.finalizations,[(str(self.study),True)]*3)
        self.assertFalse(instance.state['root_proved']);self.assertFalse(backend.runs)
        self.assertFalse(backend.migrations);self.assertFalse(backend.more_finalizations)
    def test_later_independent_bundle_can_prove_goal_after_first_rejection(self):
        instance,backend=self.build(prove_after=100);backend.more_finalizations=[True]
        backend.proof=lambda *_: ({'proved':True,'bundle_hash':'f'*64,'receipt_sha256':'e'*64}
                                 if len(backend.finalizations)>=2 else None)
        with patch.object(instance,'await_registered_owner_closed',return_value=0):
            self.assertEqual(instance.run(),0)
        self.assertEqual(len(backend.finalizations),2)
        self.assertTrue(instance.state['root_proved']);self.assertFalse(backend.migrations)

    def test_counts_and_exit_zero_do_not_substitute_for_root(self):
        instance,backend=self.build(prove_after=100)
        for value in backend.rows[str(self.study)].values():value['knowledge_count']=100000
        self.assertTrue(instance.continue_until_boundary(self.study,True,0))
        self.assertFalse(instance.state['root_proved'])
    def test_truthy_unchecked_completion_metadata_cannot_close_goal(self):
        instance,backend=self.build()
        for claim in [{'proved':False,'bundle_hash':'f'*64}, {'proved':True},
                      {'proved':1,'bundle_hash':'f'*64,'receipt_sha256':'e'*64}]:
            backend.proof=lambda *_:claim
            with self.subTest(claim=claim),self.assertRaises(owner.Hold):
                instance.continue_until_boundary(self.study,True,0)
            self.assertFalse(instance.state['root_proved'])

    def test_nonfinite_handoff_clocks_are_not_fresh_exit_evidence(self):
        binding=self.binding();status=self.status()
        for value in [float('nan'),float('inf'),True,-1,None]:
            with self.subTest(value=value),self.assertRaises(owner.Hold):
                owner.registered_exit({**binding,'registered_at':value},status)

    def test_closed_failed_receipt_is_reconciled_without_replaying_job(self):
        instance,backend=self.build(prove_after=100)
        backend.rows[str(self.study)]['baseline']=row(round=1,status='running',active=True)
        self.assertTrue(instance.continue_until_boundary(self.study,True,1))
        self.assertEqual(backend.recoveries,[str(self.study)])
        self.assertEqual(backend.runs,[(str(self.study),True)])
        self.assertFalse(instance.state['root_proved'])
    def test_partial_recovery_resumes_native_before_finite_finalizer_precondition(self):
        instance,backend=self.build(prove_after=100)
        backend.rows[str(self.study)]['baseline']=row(round=2,status='running',active=True)
        backend.rows[str(self.study)]['exploration']=row(round=0,status='ready')
        from types import SimpleNamespace
        specification=importlib.util.spec_from_file_location('real_finalizer_precondition',SOURCE.with_name('finalize.py'))
        real_finalizer=importlib.util.module_from_spec(specification);specification.loader.exec_module(real_finalizer)
        def native_boundary(mode):
            value=backend.rows[str(self.study)][mode]
            return SimpleNamespace(s={**value,'active':None,'active_intent':None,'resolution':None},
                p={'rounds':backend.ends[str(self.study)]},root=self.study/'arms'/mode)
        with self.assertRaises(real_finalizer.common.Invalid):real_finalizer.closed(native_boundary('baseline'))
        def strict_finalize(study,both):
            for mode in ('baseline','exploration') if both else ('exploration',):
                real_finalizer.closed(native_boundary(mode))
            self.assertEqual(len(backend.runs),1)
            return 0
        backend.on_finalize=strict_finalize
        self.assertTrue(instance.continue_until_boundary(self.study,True,1))
        self.assertEqual(backend.recoveries,[str(self.study)])
        self.assertEqual(backend.runs,[(str(self.study),True)])
        self.assertEqual(backend.finalizations,[(str(self.study),True)])

    def test_missing_receipt_prevents_recovery_and_process_adoption(self):
        instance,backend=self.build()
        backend.rows[str(self.study)]['baseline']=row(round=1,status='running',active=True,closed=False)
        with self.assertRaises(owner.Hold):instance.continue_until_boundary(self.study,True,1)
        self.assertFalse(backend.recoveries);self.assertFalse(backend.runs)
    def test_identical_failed_continuation_is_not_retried_forever(self):
        instance,backend=self.build(prove_after=100)
        backend.rows[str(self.study)]['baseline']=row(round=1,status='running')
        backend.on_run=lambda *_:1
        with self.assertRaises(owner.Hold):instance.continue_until_boundary(self.study,True,1)
        self.assertEqual(len(backend.runs),1)
    def test_operational_block_not_reset_or_pretended_completed(self):
        instance,backend=self.build()
        backend.rows[str(self.study)]['baseline']=row(round=1,status='operationally_blocked')
        with self.assertRaises(owner.Hold):instance.continue_until_boundary(self.study,True,0)
        self.assertFalse(backend.runs);self.assertFalse(instance.state['root_proved'])
    def test_host_headroom_wait_does_not_disable_guards_or_launch_models(self):
        instance,backend=self.build();backend.resource_ready=False
        (instance.output).mkdir(parents=True);(instance.output/'STOP').write_text('user stop')
        self.assertFalse(instance.ensure_headroom());self.assertFalse(backend.runs)
        self.assertEqual(instance.state['phase'],'waiting_host_headroom')
    def test_native_stop_request_is_never_cleared_by_goal_owner(self):
        instance,backend=self.build()
        self.study.mkdir();(self.study/'STOP.json').write_text('user stop')
        self.assertTrue(instance.stopping())
        self.assertFalse(instance.continue_until_boundary(self.study,True,0))
        self.assertFalse(backend.runs)
        native=owner.Native(self.config,self.base/'unused')
        with patch.object(native,'command',return_value=0) as command:
            native.run(self.study,False)
        self.assertNotIn('--resume',command.call_args.args[1])
        self.assertTrue((self.study/'STOP.json').exists())

    def test_existing_owner_checkpoint_is_not_automatically_replayed(self):
        instance,backend=self.build();instance.checkpoint('research_running')
        with self.assertRaises(owner.Hold):instance.run()
        self.assertFalse(backend.runs)
    def test_native_command_uses_only_its_fresh_handle_and_preserves_uncertain_intent(self):
        native=owner.Native(self.config,self.base/'commands-fixture')
        child=unittest.mock.Mock()
        child.poll.return_value=0;child.wait.return_value=2
        with patch.object(native,'check_inputs'), patch.object(owner.subprocess,'Popen',return_value=child) as spawn:
            self.assertEqual(native.command('neutral',['synthetic','no-model'],self.study),2)
        self.assertEqual(spawn.call_count,1)
        result=owner.public_json(native.output/'commands/000000/EXIT.json')
        self.assertEqual(result['returncode'],2);self.assertTrue(result['owned_handle'])
        replay=owner.Native(self.config,native.output)
        with patch.object(replay,'check_inputs'), patch.object(owner.subprocess,'Popen',side_effect=AssertionError('must not replay')):
            with self.assertRaises(owner.Hold):replay.command('neutral',['synthetic'],self.study)


class PaidActionInputTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory(prefix='gaussian-input-pins-')
        self.addCleanup(self.tmp.cleanup);self.base=Path(self.tmp.name)
        self.profile=self.base/'profile.json';owner.write(self.profile,{'rounds':8,'arm_seconds':600000})
        self.epoch=self.base/'epoch.py';self.epoch.write_text('raise AssertionError("must not import changed source")')
        self.finalizer=self.base/'finalize.py';self.finalizer.write_text('raise AssertionError("synthetic unused finalizer")')
        self.contract={'id':'neutral-full-goal'};self.contract_path=self.base/'contract.json'
        owner.write(self.contract_path,self.contract)
        self.implementation={'neutral':'fixed'}
        self.config={'profile_path':str(self.profile),'profile_sha256':owner.sha(self.profile),
            'owner_source_sha256':owner.sha(SOURCE),'epoch_source':{'path':str(self.epoch),'sha256':owner.sha(self.epoch)},
            'finalization_source':{'path':str(self.finalizer),'sha256':owner.sha(self.finalizer)},
            'contract_path':str(self.contract_path),'contract_sha256':owner.digest(self.contract),
            'implementation_sha256':owner.digest(self.implementation)}
        self.native=owner.Native(self.config,self.base/'runtime')
    def test_changed_profile_contract_or_source_refused_before_paid_process(self):
        from machinery import study_common
        with patch.object(study_common,'implementation',return_value=self.implementation), \
             patch.object(study_common,'authorize_live'):
            self.native.check_inputs()
            self.profile.write_text('{"rounds":800}')
            with patch.object(owner.subprocess,'Popen',side_effect=AssertionError('no paid call')):
                with self.assertRaises(owner.Hold):self.native.command('research',['synthetic'],self.base/'study')
            self.assertFalse((self.base/'runtime/commands').exists())
            owner.write(self.profile,{'rounds':8,'arm_seconds':600000})
            owner.write(self.contract_path,{'id':'different goal'})
            with self.assertRaises(owner.Hold):self.native.command('research',['synthetic'],self.base/'study')
            owner.write(self.contract_path,self.contract);self.epoch.write_text('changed epoch source')
            with self.assertRaises(owner.Hold):self.native.migrate(self.base/'a',self.base/'b',self.base/'curation')
    def test_modified_fixed_finalizer_is_refused_before_any_paid_child(self):
        from machinery import study_common
        self.finalizer.write_text('changed fixed allowance or verifier')
        with patch.object(study_common,'implementation',return_value=self.implementation), \
             patch.object(study_common,'authorize_live'), \
             patch.object(owner.subprocess,'Popen',side_effect=AssertionError('must not pay')):
            with self.assertRaises(owner.Hold):self.native.finalize(self.base/'study',True)
        self.assertFalse(self.native.finalizations)
    def test_finalizer_cli_has_separate_source_bound_allowance_and_own_outputs(self):
        with patch.object(self.native,'command',return_value=0) as command:
            self.assertEqual(self.native.finalize(self.base/'study',True),0)
        kind,argv,study=command.call_args.args
        self.assertEqual(kind,'finalization');self.assertIn('--source-sha256',argv)
        self.assertEqual(argv[argv.index('--arms')+1],'both')
        self.assertEqual(self.native.finalizations,[(str(self.base/'study'),self.native.output/'finalizations/000000')])

    def test_successor_prompt_changes_only_two_methodological_sentences(self):
        from machinery import study_curate
        original=study_curate.PROMPT;changed=owner.successor_prompt(original)
        self.assertNotEqual(original,changed)
        self.assertIn('after prior acquisition',changed)
        self.assertIn('no acquired method, prior research artifacts',changed)
        self.assertIn('Supply no',study_curate.layout_prompt({'method':8,'assessment':2,'final':2}))
        for text in ['No research trial has run and you have no trial artifacts or answers.',
                     'Your selection precedes both arms and must be retained even when unfavorable.']:
            with self.assertRaises(owner.Hold):owner.successor_prompt(original.replace(text,''))
            with self.assertRaises(owner.Hold):owner.successor_prompt(original+text)
    def test_static_curator_wrapper_records_context_before_unchanged_native_api(self):
        from machinery import study_curate
        directory=self.base/'curation';seen=[]
        original=study_curate.PROMPT
        def curate(path,transport,seconds,contract,**kwargs):
            context=owner.public_json(directory.with_name(directory.name+'.context.json'))
            self.assertFalse(context['acquired_method_inputs_supplied'])
            self.assertTrue(context['input_separation_only'])
            self.assertFalse(context['statistical_independence_claimed'])
            self.assertEqual(context['original_prompt_sha256'],owner.hashlib.sha256(original.encode()).hexdigest())
            self.assertEqual(context['effective_prompt_sha256'],owner.hashlib.sha256(study_curate.PROMPT.encode()).hexdigest())
            self.assertEqual(study_curate.PROMPT,owner.successor_prompt(original))
            seen.append((transport,seconds,contract,kwargs));path.mkdir()
            owner.write(path/'provenance.json',{'synthetic':True})
            return {'suite':str(path/'suite.json'),'provenance':str(path/'provenance.json')}
        def command(kind,argv,study):
            self.assertEqual(kind,'curation')
            with patch.object(owner.sys,'argv',['-c']+argv[3:]),patch.object(study_curate,'curate',side_effect=curate):
                try:exec(compile(argv[2],'<static curator wrapper>','exec'),{'__name__':'neutral_wrapper'})
                finally:study_curate.PROMPT=original
            return 0
        with patch.object(self.native,'command',side_effect=command):
            self.assertEqual(self.native.curate(directory),directory)
        self.assertEqual(len(seen),1);self.assertEqual(seen[0][0:2],('live',1800))
        self.assertEqual(seen[0][3]['layout'],{'method':8,'assessment':2,'final':2})
    def test_stop_callback_is_forwarded_to_running_curation_child(self):
        directory=self.base/'curation';directory.mkdir()
        native=owner.Native({},self.base/'stopping-runtime');native.owner_stopping=lambda:True
        child=unittest.mock.Mock();child.poll.side_effect=[None,0,0];child.wait.return_value=0
        with patch.object(native,'check_inputs'),patch.object(owner.subprocess,'Popen',return_value=child), \
             patch.object(owner.time,'sleep'):
            self.assertEqual(native.command('curation',['synthetic'],directory),0)
        self.assertTrue((directory/'STOP.json').exists())
        child.send_signal.assert_called_once_with(owner.signal.SIGINT)
    def test_duplicate_activation_preserves_existing_goal_checkpoint_and_pointer(self):
        config={**self.config,'initial_study':str(self.base/'initial')}
        path=self.base/'owner-config.json';owner.write(path,{})
        output=self.base/'owner-runtime';old={'current_study':'synthetic_successor','epoch':9}
        owner.write(output/'OWNER_CHECKPOINT.json',old);owner.write(output/'CURRENT.json',old)
        before=(owner.sha(output/'OWNER_CHECKPOINT.json'),owner.sha(output/'CURRENT.json'))
        with patch.object(owner,'ROOT',self.base),patch.object(owner,'validate_config',return_value=config), \
             patch.object(owner.sys,'argv',['owner.py','--config',str(path),'--output',str(output)]), \
             patch.object(owner.subprocess,'Popen',side_effect=AssertionError('no new effects')):
            self.assertEqual(owner.main(),2)
        self.assertEqual((owner.sha(output/'OWNER_CHECKPOINT.json'),owner.sha(output/'CURRENT.json')),before)

    def test_finite_candidate_drain_flag_requires_own_source_bound_boolean(self):
        study=self.base/'study';output=self.base/'owned-finalizer'
        self.native.finalizations=[(str(study),output)]
        summary={'source_sha256':self.config['finalization_source']['sha256'],
            'implementation_sha256':self.config['implementation_sha256'],'more_eligible':True}
        owner.write(output/'summary.json',summary)
        self.assertTrue(self.native.finalization_pending(study))
        for patch_value in ({'more_eligible':1},{'more_eligible':'yes'},
                            {'source_sha256':'a'*64},{'implementation_sha256':'b'*64}):
            owner.write(output/'summary.json',{**summary,**patch_value})
            with self.subTest(value=patch_value),self.assertRaises(owner.Hold):
                self.native.finalization_pending(study)

    def test_external_pointer_needs_provenance_and_shared_exact_finished_gate(self):
        from types import SimpleNamespace
        from machinery import study_common
        study=self.base/'study';study.mkdir();output=self.base/'owned-finalizer'
        self.native.finalizations=[(str(study),output)]
        result={'proved':True,'refuted':False,'bundle_hash':'f'*64,'receipt_sha256':'e'*64}
        owner.write(output/'OWNER_COMPLETION.json',{'study':str(study),'arm':'exploration',
            'validation_directory':str(output/'validation')})
        independent=SimpleNamespace(verified_resolution=unittest.mock.Mock(return_value=result))
        with patch.object(owner,'verify_resolution',return_value={'proved':False,'refuted':False}), \
             patch.object(self.native,'finalizer_module',return_value=independent), \
             patch.object(study_common,'read',return_value=self.contract), \
             patch.object(owner,'verify_finished_resolution',return_value=result) as shared:
            self.assertEqual(self.native.proof(study,('exploration',)),result)
            self.assertEqual(shared.call_count,1)
        with patch.object(owner,'verify_resolution',return_value={'proved':False,'refuted':False}), \
             patch.object(self.native,'finalizer_module',return_value=independent), \
             patch.object(study_common,'read',return_value=self.contract), \
             patch.object(owner,'verify_finished_resolution',side_effect=owner.Hold('not genuine')):
            with self.assertRaises(owner.Hold):self.native.proof(study,('exploration',))
        owner.write(output/'OWNER_COMPLETION.json',{'study':str(study),'arm':'baseline',
            'validation_directory':str(output/'validation')})
        with patch.object(owner,'verify_resolution',return_value={'proved':False,'refuted':False}), \
             patch.object(self.native,'finalizer_module',return_value=independent):
            with self.assertRaises(owner.Hold):self.native.proof(study,('exploration',))

    def test_proof_current_source_verification_never_races_native_owner(self):
        import fcntl
        study=self.base/'locked-study';study.mkdir()
        with (study/'controller.lock').open('a') as live_owner:
            fcntl.flock(live_owner,fcntl.LOCK_EX|fcntl.LOCK_NB)
            with patch.object(owner,'verify_resolution',side_effect=AssertionError('must acquire native lock first')):
                with self.assertRaises(BlockingIOError):self.native.proof(study,('exploration',))

    def test_resource_failure_during_host_operation_gets_public_reconciliation(self):
        from machinery.resources import ResourceFailure
        config={**self.config,'initial_study':str(self.base/'initial')}
        path=self.base/'owner-config.json';owner.write(path,{})
        keeper=unittest.mock.Mock();keeper.poll.return_value=None;keeper.wait.return_value=0
        output=self.base/'owner-runtime'
        with patch.object(owner,'ROOT',self.base),patch.object(owner,'validate_config',return_value=config), \
             patch.object(owner.sys,'argv',['owner.py','--config',str(path),'--output',str(output)]), \
             patch.object(owner.subprocess,'Popen',return_value=keeper), \
             patch.object(owner.Owner,'run',side_effect=ResourceFailure('synthetic pressure')):
            self.assertEqual(owner.main(),2)
        current=owner.public_json(output/'CURRENT.json');checkpoint=owner.public_json(output/'OWNER_CHECKPOINT.json')
        self.assertEqual(current['phase'],'needs_reconciliation');self.assertFalse(current['root_proved'])
        self.assertEqual(checkpoint['error_class'],'ResourceFailure')


class ActualFinalizerOwnerIntegrationTests(unittest.TestCase):
    def test_real_helper_verdict_and_shared_owner_gate_agree_on_real_finished_fixture(self):
        specification=importlib.util.spec_from_file_location('real_finalization_fixture',SOURCE.with_name('test_finalize.py'))
        fixtures=importlib.util.module_from_spec(specification);specification.loader.exec_module(fixtures)
        case=fixtures.FinalizeTests('test_exact_candidate_independent_audit_native_receipt_and_unchanged_arm')
        case.setUp();self.addCleanup(case.doCleanups)
        study=case.fixture['study'];contract=case.fixture['contract']
        fixtures.common.write(study/'seed/contract.json',contract)
        self.assertTrue(case.go()['resolved'])
        expected=case.fixture['contract_sha256']
        self.assertNotEqual(expected,fixtures.common.sha(case.fixture['workspace']/'contract.json'))
        native=owner.Native({'contract_sha256':expected,
            'finalization_source':{'path':str(SOURCE.with_name('finalize.py')),'sha256':case.source}},case.base/'owner')
        native.finalizations=[(str(study),case.output)]
        verdict=native.proof(study,('exploration',))
        self.assertEqual(verdict,case.verified());self.assertTrue(verdict['proved'])
        pointer=fixtures.common.read(case.output/'OWNER_COMPLETION.json')
        self.assertEqual(verdict['receipt_sha256'],fixtures.common.sha(Path(pointer['validation_directory'])/'result.json'))
        self.assertNotEqual(verdict['receipt_sha256'],pointer['finished_sha256'])
        native.c['contract_sha256']=fixtures.common.sha(case.fixture['workspace']/'contract.json')
        with self.assertRaises(fixtures.common.Invalid):native.proof(study,('exploration',))


class ExactResolutionTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory(prefix='gaussian-resolution-neutral-')
        self.addCleanup(self.tmp.cleanup);self.study=Path(self.tmp.name)
        self.path=self.study/'arms/exploration/completion/checked/result.json'
        self.path.parent.mkdir(parents=True);self.path.write_text('{"synthetic":true}')
        self.contract={'id':'neutral-full-goal','correspondence_obligations':['meaning','scope']}
        self.expected=owner.digest(self.contract)
        self.claim={'kind':'proof','module':'Neutral','declaration':'root','correspondence':'research/meaning.md'}
        self.result={'resolved':True,'lean_exact_root_checked':True,'finished':1,'bundle_hash':'f'*64,
            'binding':{'contract_hash':self.expected,'claim':self.claim},
            'audit':{'accepted':True,'reviewer':'independent fixture reviewer','bundle_hash':'f'*64,
                     'checks':{'meaning':'Exact original meaning is preserved.','scope':'The full universal scope is checked.'}}}
        self.state={'resolution':self.result,'resolution_receipt':str(self.path.relative_to(self.study))}
    @contextlib.contextmanager
    def checked(self,reused=None,prepared='f'*64):
        from machinery import completion,study_common,validation_receipts
        def read(path,*args,**kwargs):
            if Path(path)==self.study/'seed/contract.json':return copy.deepcopy(self.contract)
            if Path(path)==self.path:return copy.deepcopy(self.result)
            raise AssertionError('unexpected synthetic read')
        with patch.object(study_common,'load_state',return_value=self.state), \
             patch.object(study_common,'read',side_effect=read), \
             patch.object(validation_receipts,'reuse',return_value=copy.deepcopy(self.result) if reused is None else reused) as reuse, \
             patch.object(completion,'prepare',return_value={'bundle_hash':prepared}):
            yield reuse
    def verify(self):return owner.verify_resolution(self.study,'exploration',self.expected)
    def test_finished_exact_goal_and_every_correspondence_check_are_required(self):
        with self.checked() as reuse:
            result=self.verify();self.assertTrue(result['proved']);self.assertFalse(result['refuted'])
            self.assertEqual(reuse.call_count,1);self.assertEqual(result['receipt_sha256'],owner.sha(self.path))
    def test_missing_finished_or_exact_root_or_contract_cannot_be_proof(self):
        original=copy.deepcopy(self.result)
        for key,value in [('resolved',False),('lean_exact_root_checked',False),('finished',None)]:
            self.result=copy.deepcopy(original)
            if value is None:self.result.pop(key)
            else:self.result[key]=value
            self.state['resolution']=self.result
            with self.subTest(key=key),self.checked(),self.assertRaises(owner.Hold):self.verify()
        self.result=copy.deepcopy(original);self.result['binding']['contract_hash']='a'*64
        self.state['resolution']=self.result
        with self.checked(),self.assertRaises(owner.Hold):self.verify()
    def test_reviewer_praise_without_complete_independent_correspondence_fails(self):
        original=copy.deepcopy(self.result)
        for change in [{'accepted':False},{'reviewer':None},{'bundle_hash':'a'*64},
                       {'checks':{'meaning':'Scope is missing.'}},{'checks':{'meaning':'Meaning is checked.','scope':1}},
                       {'checks':{'meaning':'Meaning is checked.','scope':True}},
                       {'checks':{'meaning':'Meaning is checked.','scope':'   '}}]:
            self.result=copy.deepcopy(original);self.result['audit'].update(change);self.state['resolution']=self.result
            with self.subTest(change=change),self.checked(),self.assertRaises(owner.Hold):self.verify()
    def test_changed_finished_receipt_or_source_bundle_is_rejected(self):
        from machinery import completion
        before=completion.ROOT
        with self.checked(reused={'resolved':True}),self.assertRaises(owner.Hold):self.verify()
        with self.checked(prepared='b'*64),self.assertRaises(owner.Hold):self.verify()
        self.assertEqual(completion.ROOT,before)
    def test_refutation_remains_distinct_from_the_requested_proof(self):
        self.claim['kind']='refutation'
        with self.checked():
            result=self.verify();self.assertFalse(result['proved']);self.assertTrue(result['refuted'])
        native=owner.Native({'contract_sha256':self.expected},self.study/'operations')
        with patch.object(owner,'verify_resolution',return_value=result),self.assertRaises(owner.Refuted):
            native.proof(self.study,('exploration',))
    def test_no_resolution_or_other_arm_receipt_does_not_close_goal(self):
        self.state['resolution']=None
        with self.checked():self.assertEqual(self.verify(),{'proved':False,'refuted':False})
        self.state['resolution']=self.result
        self.state['resolution_receipt']='arms/baseline/completion/other/result.json'
        with self.checked(),self.assertRaises(owner.Hold):self.verify()


if __name__=='__main__':unittest.main()
