"""Neutral tests only: no actual study, model, compiler or clone operation."""
import ast
import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import shutil
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch
HERE=Path(__file__).resolve().parent

def load(path,name):
    spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m

p=load(HERE/'prepared.py','prepared_helper_tested')
b=load(HERE/'bridge.py','prepared_bridge_tested')
o=load(HERE/'owner.py','prepared_owner_tested')
oldtests=load(HERE.parent/'continuation/test_continuation.py','prepared_history_neutral_fixtures')

def put(path,value):
    path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(value,sort_keys=True,separators=(',',':'))+'\n');return path

def ref(path):return {'path':str(path),'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}

class ExactSuffix(unittest.TestCase):
    def test_postfreeze_suffix_matches_pinned_original_except_explicit_provenance(self):
        original=ast.parse(p.ORIGIN.read_text());new=ast.parse((HERE/'prepared.py').read_text())
        a=next(x for x in original.body if isinstance(x,ast.FunctionDef) and x.name=='migrate').body[-1].body
        fun=next(x for x in new.body if isinstance(x,ast.FunctionDef) and x.name=='finish_prepared')
        outer=next(x for x in fun.body if isinstance(x,ast.With));inner=next(x for x in outer.body if isinstance(x,ast.With));z=inner.body
        def suffix(nodes):
            start=next(i for i,x in enumerate(nodes) if isinstance(x,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='fresh_seal' for t in x.targets));return copy.deepcopy(nodes[start:])
        aa=suffix(a);zz=suffix(z)
        zz=[x for x in zz if not (isinstance(x,ast.Assign) and any(isinstance(t,ast.Subscript) and isinstance(t.value,ast.Name) and t.value.id=='provenance' and isinstance(t.slice,ast.Constant) and t.slice.value=='prepared_resume' for t in x.targets))]
        for node in zz:
            if isinstance(node,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='marker' for t in node.targets):
                drop={'migration_origin_source_sha256','prepared_handoff','prepared_resume_binding'}
                pairs=[(k,v) for k,v in zip(node.value.keys,node.value.values) if not isinstance(k,ast.Constant) or k.value not in drop]
                node.value.keys=[k for k,v in pairs];node.value.values=[v for k,v in pairs]
        self.assertEqual(ast.dump(ast.Module(body=aa,type_ignores=[])),ast.dump(ast.Module(body=zz,type_ignores=[])))
    def test_no_new_freeze_or_model_entrypoint(self):
        tree=ast.parse((HERE/'prepared.py').read_text())
        calls=[x for x in ast.walk(tree) if isinstance(x,ast.Call)]
        self.assertFalse(any(isinstance(x.func,ast.Attribute) and x.func.attr in ('freeze','preflight','require_deployment','call') for x in calls))
    def test_original_helpers_are_unmodified_objects(self):
        for name in ('copy_finished','copy_jobs','copy_snapshot','copy_method_state','namespace_applications'):
            self.assertIs(getattr(p,name),getattr(p.E,name))

class PreparedBoundary(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve();self.arm=self.root/'arm';(self.arm/'workspace').mkdir(parents=True)
    def check(self):
        with patch.object(p.common,'inventory',return_value={}),patch.object(p.common,'verify_snapshot',return_value={'files':{}}):p.pristine_workspace(self.arm)
    def test_pristine_boundary_accepts(self):self.check()
    def test_partial_workspace_history_refuses(self):
        (self.arm/'workspace/history').mkdir()
        with self.assertRaises(p.common.Invalid):self.check()
    def test_epoch_copy_temp_ignored_by_inventory_still_refuses(self):
        (self.arm/'workspace/source.lean.epoch-copy').write_text('neutral temporary')
        with self.assertRaises(p.common.Invalid):self.check()
    def test_existing_exact_copy_needs_no_effect_or_new_headroom(self):
        source=self.root/'source';target=self.root/'target';source.write_text('neutral bytes');target.write_text('neutral bytes');budget=p.E.CopyBudget()
        with patch.object(p.E,'headroom',side_effect=AssertionError('no copy needed')),patch.object(p.E,'clone_file',side_effect=AssertionError('no clone')):
            budget.file(source,target,p.common.sha(source))
        self.assertEqual((budget.files,budget.bytes),(0,0))
    def test_changed_copy_never_reuses_wrong_bytes(self):
        source=self.root/'source';target=self.root/'target';source.write_text('neutral bytes');target.write_text('different')
        with self.assertRaises(p.common.Invalid):p.E.CopyBudget().file(source,target)
    def test_reviewer_uncertainty_is_not_main_history(self):
        self.assertIsNotNone(p.E.MAIN_JOB.fullmatch('plan-0007'));self.assertIsNone(p.E.MAIN_JOB.fullmatch('review-source-v1-8'))

class MixedHistory(unittest.TestCase):
    def setUp(self):
        self.fixture=oldtests.Settlement('test_original_certified_uncertainty_settled_but_not_numeric');self.fixture.setUp();self.addCleanup(self.fixture.doCleanups)
        self.f=self.fixture;self.root=self.f.root
        q=patch.object(b,'ROOT',self.root);q.start();self.addCleanup(q.stop)
        self.first=self.f.make_successor();self.source=self.root/'.bootstrap/prepared-source.py';self.source.write_text('neutral separately qualified source')
        self.before_seal=put(self.root/'.bootstrap/before-seal.json',{'neutral':'pristine seal'})
        self.before_states={mode:put(self.root/'.bootstrap'/f'before-{mode}.json',{'neutral':'zero-call before state'}) for mode in ('baseline','exploration')}
        h={'schema':'math-gkm.gaussian-prepared-epoch-handoff.v1','study':str(self.f.origin),'destination':str(self.first),'arm':'exploration',
            'prepared_seal':{'archive':ref(self.before_seal)},'prepared_states':{mode:{'archive':ref(path)} for mode,path in self.before_states.items()},
            'deployment_receipt':{'path':str(self.root/'.bootstrap/ready-receipt'),'sha256':'a'*64}}
        self.hp=put(self.root/'.bootstrap/prepared-handoff.json',h);self.binding={'prepared_source':ref(self.source),'handoff':ref(self.hp)}
        self.resume={'schema':'math-gkm.prepared-epoch-resume.v1','handoff':ref(self.hp),'helper_source_sha256':ref(self.source)['sha256'],
            'original_migration_source_sha256':b.EPOCH_SHA,'prepared_seal_sha256':ref(self.before_seal)['sha256'],
            'prepared_state_sha256':{mode:ref(path)['sha256'] for mode,path in self.before_states.items()},
            'deployment_receipt_sha256':'a'*64,'preflight_replayed':False,'curation_replayed':False,'model_calls':0}
        self.reseal_first()
    def reseal_first(self,parent=None):
        path=self.first/'CONTINUATION_PROVENANCE.json';value=json.loads(path.read_bytes());value['prepared_resume']=self.resume
        if parent is not None:value['parent_study']=str(parent)
        put(path,value);seal=put(self.first/'seal.json',{'continuation_provenance_sha256':ref(path)['sha256']})
        put(self.first/'MIGRATION_FINISHED.json',{'schema':'math-gkm.closed-own-epoch.v1','source_sha256':ref(self.source)['sha256'],
            'migration_origin_source_sha256':b.EPOCH_SHA,'prepared_handoff':ref(self.hp),'prepared_resume_binding':b.digest(self.resume),'provenance_sha256':ref(path)['sha256']})
        put(self.first/'arms/exploration/state.json',{'neutral':'continued own history'})
    def verify(self,study=None,binding=None):
        study=study or self.first
        return b.certified_uncertainty(study,'exploration',study/'arms/exploration/jobs'/self.f.key,self.f.g,prepared_binding=self.binding if binding is None else binding)
    def make_later(self):
        child=self.root/'.scratch/studies/later';job=child/'arms/exploration/jobs'/self.f.key;job.mkdir(parents=True)
        for name in ('spec.json','request.json','receipt.json'):shutil.copyfile(self.f.job/name,job/name)
        provenance=put(child/'CONTINUATION_PROVENANCE.json',{'schema':'math-gkm.closed-own-epoch.v1','arm':'exploration','parent_study':str(self.first),
            'parent_state_sha256':ref(self.first/'arms/exploration/state.json')['sha256'],'parent_seal_sha256':ref(self.first/'seal.json')['sha256'],
            'inherited_main_jobs':[{'key':self.f.key,'path':str(job),'receipt_hash':self.f.g['receipt_binding']}]})
        put(child/'seal.json',{'continuation_provenance_sha256':ref(provenance)['sha256']})
        put(child/'MIGRATION_FINISHED.json',{'schema':'math-gkm.closed-own-epoch.v1','source_sha256':b.EPOCH_SHA,'provenance_sha256':ref(provenance)['sha256']})
        return child
    def test_exact_new_first_edge_is_accepted(self):self.assertTrue(self.verify())
    def test_later_original_ccce_edge_traverses_prepared_first_edge(self):self.assertTrue(self.verify(self.make_later()))
    def test_old_history_verifier_is_unchanged_and_rejects_new_source(self):
        with self.assertRaises(oldtests.h.Hold):oldtests.h.certified_uncertainty(self.first,'exploration',self.first/'arms/exploration/jobs'/self.f.key,self.f.g)
        self.assertEqual(oldtests.h.EPOCH_SHA,b.EPOCH_SHA)
    def test_new_edge_requires_explicit_qualified_binding(self):
        with self.assertRaises(b.Hold):self.verify(binding={})
    def test_wrong_prepared_parent_refuses(self):
        self.reseal_first(self.root/'.scratch/studies/foreign')
        with self.assertRaises(b.Hold):self.verify()
    def test_replayed_preflight_flag_refuses(self):
        self.resume['preflight_replayed']=True;self.reseal_first()
        with self.assertRaises(b.Hold):self.verify()
    def test_mutated_immutable_prepared_source_refuses(self):
        self.source.write_text('changed')
        with self.assertRaises(b.Hold):self.verify()

class Lifecycle(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup);self.root=Path(self.temp.name).resolve();self.parent=self.root/'parent';self.parent.mkdir();self.curation=self.root/'paid';self.curation.mkdir()
        self.c={'parent_study':str(self.parent),'successor_root':str(self.root/'studies'),'owner_source_sha256':'d'*64,'contract_sha256':'c'*64,
            'profile_sha256':'e'*64,'revision_finished':{'sha256':'f'*64},'prepared_handoff':{'sha256':'a'*64}}
        o.P.S.O.B.STOPPING=False
    def test_existing_prepared_destination_starts_inheritance_not_setup(self):
        dest=Path(self.c['successor_root'])/(o.DESTINATION_PREFIX+'0001');dest.mkdir(parents=True)
        backend=oldtests.Fake(self.parent,1);backend.rows[str(self.parent)]['exploration']=oldtests.row(8,numeric=False)
        backend.transition_result.update(curation=str(self.curation),next_destination=str(dest))
        owner=o.Owner(self.c,self.root/'runtime',backend);self.assertEqual(owner.run(),0)
        self.assertEqual(backend.migrations,[(str(self.parent),str(dest))]);self.assertFalse(backend.curations)
        self.assertTrue(all(study!=str(self.parent) for study,_ in backend.runs+backend.finalizations))
        pointer=o.public_json(self.root/'runtime/CURRENT.json');self.assertEqual(pointer['prepared_handoff_sha256'],'a'*64);self.assertEqual(pointer['schema'],o.CURRENT_SCHEMA)
    def test_later_fresh_epochs_still_use_original_ccce(self):
        c={**self.c,'epoch_source':{'sha256':p.ORIGIN_SHA}};backend=o.Native(c,self.root/'runtime');backend.prepared_completed=True
        with patch.object(o.P.S.O.B.Native,'migrate',return_value={'neutral':'old fresh path'}) as called:
            self.assertEqual(backend.migrate(self.parent,self.root/'next',self.curation),{'neutral':'old fresh path'})
        self.assertIs(called.call_args.args[0],backend);self.assertEqual(backend.c['epoch_source']['sha256'],p.ORIGIN_SHA)
    def test_curator_identity_is_new_physical_owner(self):
        c={**self.c};backend=o.Native(c,self.root/'runtime');argv=['python','-c','neutral','out','goal',str(o.P.S.PREDECESSOR),c['owner_source_sha256']]
        with patch.object(o.P.S.O.B.Native,'command',return_value=0) as called:backend.command('curation',argv,self.parent)
        self.assertEqual(called.call_args.args[2][-2:],[str(HERE/'owner.py'),c['owner_source_sha256']])



class PreparedCompletion(unittest.TestCase):
    def test_neutral_prepared_transfer_finishes_without_freeze_model_or_clone(self):
        from contextlib import ExitStack
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory).resolve();parent=root/'parent';dest=root/'dest';curation=root/'paid'
            contract={'neutral':'same goal'};suite={'neutral':'fresh opaque panel'};provenance={'neutral':'completed paid selection'}
            for base in (parent,dest):put(base/'seed/contract.json',contract)
            put(curation/'suite.json',suite);put(curation/'provenance.json',provenance)
            profile={'rounds':8};protocol={'rounds':8,'episode_rounds':2};expected={**p.study.DEFAULT,**profile,'rounds':16}
            put(dest/'protocol.json',expected)
            seal={'seed':{},'suite':p.common.digest(suite),'curation':provenance,'deployment_preflight':{'neutral':'already successful'}}
            put(parent/'seal.json',{'seed':{},'suite':'different old panel'});put(dest/'seal.json',seal);put(dest/'audit/plan.json',{})
            research={'knowledge':{},'components':{},'pending_discoveries':{},'policy':{}}
            old={'round':8,'phase':'research','status':'finite_budget_finished; root_open','active':None,'active_intent':None,'resolution':None,'receipts':[],
                'receipt_hashes':{},'research':research,'reviewed_rounds':[]}
            def state(path,value):put(path,{'state':value,'sha256':p.common.digest(value)})
            state(parent/'arms/exploration/state.json',old);(parent/'arms/exploration/workspace').mkdir()
            initial={'files':{},'policy':{},'admitted_modules':[]};initial['binding']=p.common.digest(initial)
            put(parent/'arms/exploration/snapshots/initial/manifest.json',initial)
            before={}
            for mode in ('baseline','exploration'):
                arm=dest/'arms'/mode;(arm/'workspace').mkdir(parents=True);put(arm/'snapshots/initial/manifest.json',initial)
                value={'round':0,'calls':0,'meta_calls':0,'status':'ready','active':None,'active_intent':None,'resolution':None,'research':research}
                state(arm/'state.json',value);archive=root/f'before-{mode}.json';archive.write_bytes((arm/'state.json').read_bytes());before[mode]={'current':ref(arm/'state.json'),'archive':ref(archive)}
            archive=root/'before-seal.json';archive.write_bytes((dest/'seal.json').read_bytes())
            ready=put(dest/'deployment-preflight/receipt.json',{'ready':True})
            handoff=put(root/'handoff.json',{'schema':'math-gkm.gaussian-prepared-epoch-handoff.v1','study':str(parent),'destination':str(dest),'arm':'exploration',
                'prepared_seal':{'current':ref(dest/'seal.json'),'archive':ref(archive)},'prepared_states':before,'deployment_receipt':ref(ready)})
            def snapshot(study,arm,ws,target,research,admitted):
                put(target/'manifest.json',initial);return {'reusable':False}
            with ExitStack() as stack:
                stack.enter_context(patch.object(p,'ROOT',root));stack.enter_context(patch.object(p.E,'headroom',return_value={}))
                stack.enter_context(patch.object(p.E,'clone_file',side_effect=AssertionError('no clone expected')))
                stack.enter_context(patch.object(p.study,'freeze',side_effect=AssertionError('paid preflight must never replay')))
                stack.enter_context(patch.object(p.study,'verify',side_effect=lambda path:protocol if Path(path)==parent else expected))
                stack.enter_context(patch.object(p.study,'validate_protocol',return_value=None))
                stack.enter_context(patch.object(p.study,'Arm',return_value=SimpleNamespace(admitted=lambda _:[])))
                stack.enter_context(patch.object(p,'required_snapshots',return_value=['initial']))
                stack.enter_context(patch.object(p.snapshot_routing,'ENABLED',True));stack.enter_context(patch.object(p.snapshot_routing,'freeze_snapshot',side_effect=snapshot))
                stack.enter_context(patch.object(p.study_observer,'checkpoint',return_value=None))
                import machinery.study_deployment as deployment
                stack.enter_context(patch.object(deployment,'reuse_deployment',return_value={'ready':True,'reused':True}))
                result=p.finish_prepared(parent,dest,curation=curation,profile=profile,contract_path=parent/'seed/contract.json',
                    handoff=ref(handoff),expected_source_sha256=ref(HERE/'prepared.py')['sha256'])
            marker=json.loads((dest/'MIGRATION_FINISHED.json').read_bytes());prov=json.loads((dest/'CONTINUATION_PROVENANCE.json').read_bytes())
            self.assertEqual(marker['source_sha256'],ref(HERE/'prepared.py')['sha256']);self.assertNotEqual(marker['source_sha256'],p.ORIGIN_SHA)
            self.assertEqual(marker['migration_origin_source_sha256'],p.ORIGIN_SHA);self.assertFalse(prov['prepared_resume']['preflight_replayed'])
            self.assertEqual(result['start_round'],8);self.assertEqual(result['end_round'],16)
            sourcecopy=root/'prepared-source.py';sourcecopy.write_bytes((HERE/'prepared.py').read_bytes())
            bridgecopy=root/'bridge-source.py';bridgecopy.write_bytes((HERE/'bridge.py').read_bytes())
            binding={'prepared_source':ref(sourcecopy),'handoff':ref(handoff)}
            with patch.object(b,'ROOT',root):self.assertTrue(b.prepared_marker(dest,marker,binding,b.projection()))
            c={'parent_study':str(parent),'prepared_source':ref(sourcecopy),'bridge_source':ref(bridgecopy),'prepared_handoff':ref(handoff),
               'profile_path':str(root/'profile'),'contract_path':str(parent/'seed/contract.json')}
            transition={'next_destination':str(dest),'curation':str(curation),'prepared_binding':binding}
            backend=o.Native(c,root/'operator');backend.check_inputs=lambda:None;backend.transition=lambda:transition
            def modules(path,name):return SimpleNamespace(finish_prepared=lambda *args,**kwargs:result) if name=='qualified_finish_prepared' else b
            with patch.object(o,'ROOT',root),patch.object(b,'ROOT',root),patch.object(o,'load',side_effect=modules):
                with patch.object(b,'prepared_marker',side_effect=RuntimeError('neutral rejected provenance')):
                    with self.assertRaises(RuntimeError):backend.migrate(parent,dest,curation)
                self.assertFalse(backend.prepared_completed);self.assertTrue(backend.bootstrap_parent_pending)
                self.assertEqual(backend.migrate(parent,dest,curation),result)
                self.assertTrue(backend.prepared_completed);self.assertFalse(backend.bootstrap_parent_pending)

class LargeSeal(unittest.TestCase):
    def test_only_selected_deployment_is_decoded_from_realistic_large_seal(self):
        with tempfile.TemporaryDirectory() as directory:
            path=Path(directory)/'seal.json';binding={'receipt':'neutral-existing','receipt_sha256':'a'*64,'ready':True}
            put(path,{'dependencies':{'private_canary':'x'*(5*1024**2)},'deployment_preflight':binding})
            with self.assertRaises(o.Hold):o.public_json(path)
            original=json.loads
            def guarded(data,*args,**kw):
                text=data.decode() if isinstance(data,bytes) else str(data)
                if 'private_canary' in text and text.lstrip().startswith(('{','[')):raise AssertionError('large dependency object decoded')
                return original(data,*args,**kw)
            with patch.object(json,'loads',guarded):self.assertEqual(o.deployment_from_archive(path),binding)



class HandoffEvolution(unittest.TestCase):
    def test_actual_handoff_keeps_before_archives_but_not_stale_current_pins(self):
        with tempfile.TemporaryDirectory() as directory:
            root=Path(directory).resolve();parent=root/'parent';dest=root/'studies'/(o.DESTINATION_PREFIX+'0001');curation=root/'paid'
            predecessor=put(root/'predecessor.json',{'neutral':'old paid config'});oldout=root/'old-owner'
            checkpoint=put(oldout/'OWNER_CHECKPOINT.json',{'epoch':0,'phase':'needs_reconciliation','error_class':'ResourceFailure','root_proved':False,
                'current_study':str(parent),'pending_successor':str(dest),'pending_curation':str(curation)})
            prepared_source=put(root/'source.json',{'neutral':'qualified helper'})
            h={'schema':o.HANDOFF_SCHEMA,'study':str(parent),'destination':str(dest),'arm':'exploration','contract_sha256':o.P.S.CONTRACT_SHA,
                'implementation_sha256':'a'*64,'predecessor_owner':{'path':str(o.PREDECESSOR),'sha256':o.PREDECESSOR_SHA},
                'predecessor_config':ref(predecessor),'predecessor_output':str(oldout),'checkpoint':ref(checkpoint),'curation':str(curation),
                'owner_exit':{'actual_numeric_exit_observed':True,'returncode':2,'owned_tool_handle':'closed-neutral','completion_reference':'actual neutral closed event'},
                'preflight_replay_authorized':False,'curation_replay_authorized':False}
            for key,name in (('seal','seal.json'),('protocol','protocol.json')):h[key]=ref(put(parent/name,{'neutral':'parent'}))
            for key,name in (('prepared_seal','seal.json'),('prepared_protocol','protocol.json')):
                current=put(dest/name,{'neutral':'pristine'});archive=root/f'before-{name}';archive.write_bytes(current.read_bytes());h[key]={'current':ref(current),'archive':ref(archive)}
            for group,base in (('parent_states',parent),('prepared_states',dest)):
                h[group]={}
                for mode in ('baseline','exploration'):
                    state={'round':0 if group=='prepared_states' else 8,'calls':0 if group=='prepared_states' else 37,'meta_calls':0,
                        'status':'ready' if group=='prepared_states' else 'finite_budget_finished; root_open','phase':'research','active':None,'active_intent':None,'resolution':None}
                    current=put(base/'arms'/mode/'state.json',{'state':state,'sha256':o.digest(state)});archive=root/f'{group}-{mode}.json';archive.write_bytes(current.read_bytes());h[group][mode]={'current':ref(current),'archive':ref(archive)}
            result=put(dest/'deployment-preflight/result.json',{'ready':True,'neutral':True,'hosted_model_calls':0,'elapsed_seconds':1457,'budget_seconds':1800})
            receipt=put(dest/'deployment-preflight/receipt.json',{'ready':True,'result_sha256':ref(result)['sha256']});h.update(deployment_result=ref(result),deployment_receipt=ref(receipt))
            hp=put(root/'handoff.json',h);c={'parent_study':str(parent),'successor_root':str(root/'studies'),'contract_sha256':o.P.S.CONTRACT_SHA,
                'implementation_sha256':'a'*64,'prepared_predecessor_config':ref(predecessor),'prepared_handoff':ref(hp),'prepared_source':ref(prepared_source)}
            transition={'curation':str(curation),'next_destination':str(dest)}
            with patch.object(o,'ROOT',root),patch.object(o.P,'configuration',return_value={}),patch.object(o.P,'verify_adoption',return_value=transition):
                o.verify_handoff(c,initial=True,native_checks=False)
                put(dest/'seal.json',{'neutral':'continued seal'});put(dest/'arms/exploration/state.json',{'state':{'round':8,'calls':1},'sha256':o.digest({'round':8,'calls':1})})
                o.verify_handoff(c,initial=False,native_checks=False)
                with self.assertRaises(o.Hold):o.verify_handoff(c,initial=True,native_checks=False)
                put(Path(h['prepared_seal']['archive']['path']),{'neutral':'changed before archive'})
                with self.assertRaises(o.Hold):o.verify_handoff(c,initial=False,native_checks=False)

if __name__=='__main__':unittest.main()
