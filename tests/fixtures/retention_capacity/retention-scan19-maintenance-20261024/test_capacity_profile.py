"""UNRUN pure controls: selected frozen AST + synthetic memory-only fixtures.
Never imports machinery/helper/guard modules, calls native/lease/controller APIs,
or reads actual study state, requests, roles, proof sources or receipts.
"""
import ast,copy,hashlib,json,math,re,types,unittest
from pathlib import Path
STAGE=Path('/private/tmp/math-gkm-retention-scan19-source-20261024-v2')
PINS={
 'retention_scan_guard.py':'35682dc8884b97d0750a47517d4486e00afd15b922cc6c8b8930ee2e78ebd0f2',
 'continue_machine.candidate.py':'d77660596fd2b529b21267f16b6d2765339af9cce1dd618a4dc3143686fa65f0',
 'follow.candidate.py':'29f1317520fbc3575e7f3ae703a98ad02ee0ded249d6e3aefffd32fa40c2d016',
 'core-only/CORE_MAPS.json':'84efdb13e4c8599887328725ccb0270f3b4571bd9f0627d1b8dab39e09779806'}

def frozen(name):
 data=(STAGE/name).read_bytes()
 if hashlib.sha256(data).hexdigest()!=PINS[name]:raise AssertionError('frozen source differs')
 return data

def selected(name,functions,constants=(),extra=None):
 tree=ast.parse(frozen(name));body=[]
 for node in tree.body:
  if isinstance(node,ast.FunctionDef) and node.name in functions:body.append(node)
  elif isinstance(node,ast.Assign) and all(isinstance(t,ast.Name) and t.id in constants for t in node.targets):body.append(node)
 ns={'Path':Path,'hashlib':hashlib,'json':json,'math':math,'re':re,'__name__':'pure_capacity_controls'}
 if extra:ns.update(extra)
 exec(compile(ast.Module(body=body,type_ignores=[]),'<selected-frozen-pure-source>','exec'),ns)
 return ns

def guard():
 return selected('retention_scan_guard.py',{'need','canonical','digest','finite','is_hash','reviewed','_value_end','_fields','_state_without_seal','state_frames','_select','_idle','tip_map','_registry_projection','remaining_deadline','operation_scope'},
 {'ROOT','OPS','PACKET','STUDY','OLD_VERIFY_PACKET','OLD_CORE','NEW_CORE','OLD_RESOURCES','NEW_RESOURCES','CLEANUP'})

def fields(g,value):return g['_fields'](g['canonical'](value))
def protocol():return {'rounds':84,'call_seconds':1800,'adaptation_seconds':1800,'validation_seconds':1800,'arm_seconds':216000,'max_calls':64,'meta_calls':32}
def meta():return {'seconds':10000,'protocol_attempts':6,'protocol_reserved_seconds':180,'budget_pools':{'synthetic':{'cap':1200,'spent':100}}}
def old_intent(g):return {'schema':'math-gkm.study19-administrative-resume-intent.v1','study':str(g['STUDY']),'audit_wall_time_only':1000000.,'guard':{'schema':'math-gkm.study19-administrative-guard.v1','guard_started_monotonic':5000.,'deadline_monotonic':10000.,'conservative_epoch_deadline_wall':1005000.,'duration_seconds':5000.}}

class CapacityProfileControls(unittest.TestCase):
 def test_exact_one_file_map_and_negative_deltas(self):
  g=guard();maps=json.loads(frozen('core-only/CORE_MAPS.json'));base=maps['old_implementation'];target=maps['implementation']
  cfg={'old_core':g['OLD_CORE'],'new_core':g['NEW_CORE'],'old_implementation':base,'implementation':target,'changes':{'machinery/resources.py':[g['OLD_RESOURCES'],g['NEW_RESOURCES']]}}
  self.assertEqual(g['tip_map'](base,cfg),target);self.assertEqual(sum(base[k]!=target[k] for k in base),1)
  for mutate in ('extra_path','wrong_before','other_source','wrong_digest'):
   bad=copy.deepcopy(cfg)
   if mutate=='extra_path':bad['changes']['extra.py']=['0'*64,'1'*64]
   elif mutate=='wrong_before':bad['changes']['machinery/resources.py'][0]='0'*64
   elif mutate=='other_source':bad['implementation']['machinery/study.py']='0'*64
   else:bad['new_core']='0'*64
   with self.subTest(mutate=mutate),self.assertRaises(RuntimeError):g['tip_map'](base,bad)

 def test_opaque_private_state_only_seal_hash_changes(self):
  g=guard();oldseal={'implementation':{'synthetic':'before'}};newseal={'implementation':{'synthetic':'after'}}
  before={'seal_hash':g['digest'](oldseal),'round':82,'private':{'opaque':'é文','array':[True,1,None,{'x':'unchanged'}]},'counters':{'funded':43200,'spent':0}}
  after={**before,'seal_hash':g['digest'](newseal)}
  b={k:fields(g,before) for k in ('baseline','exploration')};a={k:fields(g,after) for k in b}
  g['state_frames'](b,a,oldseal,newseal)
  self.assertEqual(g['_state_without_seal'](b['exploration']),g['_state_without_seal'](a['exploration']))
  for key,value in [('round',83),('private',{'opaque':'rewritten'}),('counters',{'funded':43200,'spent':1}),('seal_hash','0'*64)]:
   bad=copy.deepcopy(a);bad['exploration']=fields(g,{**after,key:value})
   with self.subTest(key=key),self.assertRaises(RuntimeError):g['state_frames'](b,bad,oldseal,newseal)

 def test_registry_projection_binds_physical_spans_and_count(self):
  g=guard();knowledge={f'synthetic{i}':{'token':i} for i in range(100)};state=fields(g,{'research':{'knowledge':knowledge,'components':{},'private_unselected':'not decoded'}})
  result=g['_registry_projection'](state)
  self.assertEqual(result['knowledge']['count'],100);self.assertEqual(result['components']['count'],0)
  self.assertEqual(result['knowledge']['sha256'],g['digest'](knowledge))
  changed=copy.deepcopy(knowledge);changed['synthetic0']['token']=True
  self.assertNotEqual(g['_registry_projection'](fields(g,{'research':{'knowledge':changed,'components':{}}})),result)

 def test_idle_tokens_do_not_conflate_false_zero_or_empty(self):
  g=guard()
  for protocol_state in (None,{}, {'pending':None,'inflight':False},{'inflight':None}):
   self.assertTrue(g['_idle'](fields(g,{'active':None,'active_intent':None,'resolution':None,'protocol_state':protocol_state})))
  for state in ({'active':False},{'active_intent':{}},{'resolution':0},{'protocol_state':{'pending':False}},{'protocol_state':{'inflight':0}},{'protocol_state':{'inflight':{}}}):
   self.assertFalse(g['_idle'](fields(g,state)))

 def test_remaining_guard_never_extends_old_monotonic_deadline(self):
  g=guard();old=old_intent(g);old['guard']['deadline_monotonic']=8500.
  r=g['remaining_deadline'](protocol(),meta(),old,3000,6000.,1001000.)
  self.assertEqual(r['deadline_monotonic'],8500.);self.assertEqual(r['additional_paid_allowance'],0)

 def test_remaining_guard_also_clamps_original_wall_ceiling(self):
  g=guard();old=old_intent(g);old['guard']['conservative_epoch_deadline_wall']=1003400.
  r=g['remaining_deadline'](protocol(),meta(),old,3000,6000.,1001000.)
  self.assertEqual(r['deadline_monotonic'],8400.)
  old['guard']['conservative_epoch_deadline_wall']=1005000.;old['audit_wall_time_only']=1000000.;old['guard']['duration_seconds']=3400.
  self.assertEqual(g['remaining_deadline'](protocol(),meta(),old,3000,6000.,1001000.)['deadline_monotonic'],8400.)

 def test_remaining_guard_rejects_extra_original_resource_allowance(self):
  g=guard();m={'seconds':216000,'protocol_attempts':258,'protocol_reserved_seconds':7740,'budget_pools':{}};old=old_intent(g);old['guard'].update(deadline_monotonic=20000.,duration_seconds=15000.,conservative_epoch_deadline_wall=1020000.)
  self.assertEqual(g['remaining_deadline'](protocol(),m,old,3700,6000.,1001000.)['remaining_resource_seconds'],3700)
  with self.assertRaises(RuntimeError):g['remaining_deadline'](protocol(),m,old,3701,6000.,1001000.)

 def test_remaining_guard_rejects_bad_limits_types_and_expired_bound(self):
  g=guard()
  for which in ('bool','per_role','bad_protocol_accounting','spent','expired','wall_backwards'):
   p=protocol();m=meta();old=old_intent(g);requested=3000;wall=1001000.
   if which=='bool':requested=True
   elif which=='per_role':p['call_seconds']=1801
   elif which=='bad_protocol_accounting':m['protocol_reserved_seconds']=0
   elif which=='spent':m['budget_pools']['synthetic']['spent']=1201
   elif which=='expired':old['guard']['deadline_monotonic']=6100.
   else:wall=999999.
   with self.subTest(which=which),self.assertRaises(RuntimeError):g['remaining_deadline'](p,m,old,requested,6000.,wall)

 def test_reviewers_typed_distinct_and_nonempty(self):
  g=guard();self.assertTrue(g['reviewed'](['root','independent']))
  for value in ('ab',['a','a'],['a',''],['a',None],[{},{}],None):self.assertFalse(g['reviewed'](value))

 def test_new_api_selects_capacity_profile_before_import_and_preserves_freshness(self):
  maps=json.loads(frozen('core-only/CORE_MAPS.json'));events=[];cfg={'implementation':maps['implementation']}
  module_names=('study','study_common','study_observer','study_knowledge','validation_receipts','resources','study_discoveries','study_deployment')
  modules=types.SimpleNamespace(**{n:object() for n in module_names})
  class FakeGuard:
   def config(self):events.append('capacity_config');return cfg
   def coherent_api(self,a):events.append('capacity_coherence');return cfg
  guard_object=FakeGuard();root=Path('/Users/sasha/math_gkm');fake_sys=types.SimpleNamespace(modules={},path=[])
  def fake_import(name,globals=None,locals=None,fromlist=(),level=0):
   if name!='machinery':raise AssertionError('unexpected import')
   events.append('pure_fake_import');return modules
  builtins_copy=dict(vars(__import__('builtins')));builtins_copy['__import__']=fake_import
  extra={'ROOT':root,'API':None,'PT_FRESH_API':False,'sys':fake_sys,'read':lambda p:{'implementation_sha256':'996d37b699ebeff1f2966ab19268ded7c9b370f4c84362da76e99de23adce2ce'},'pt_is_new':lambda value:True,'cs19_selected':lambda value:value=='996d37b699ebeff1f2966ab19268ded7c9b370f4c84362da76e99de23adce2ce','cs19_guard':lambda:guard_object,'ca19_selected':lambda value:False,'ca19_guard':lambda:(_ for _ in ()).throw(AssertionError('old current guard invoked')),'sha':lambda p:cfg['implementation'][str(p.relative_to(root))],'pt_require':lambda ok,message:None if ok else (_ for _ in ()).throw(RuntimeError(message)),'__builtins__':builtins_copy}
  ns=selected('continue_machine.candidate.py',{'api'},extra=extra);a=ns['api']();self.assertTrue(ns['PT_FRESH_API']);self.assertEqual(a['common'],modules.study_common);self.assertEqual(events[0],'capacity_config');self.assertEqual(events[-1],'capacity_coherence')
  ns['API']=None;fake_sys.modules['machinery.resources']=object()
  with self.assertRaises(RuntimeError):ns['api']()

 def test_new_follower_dispatch_uses_distinct_grant_and_actual_outer_handles(self):
  calls=[];token=(object(),object());ops=types.SimpleNamespace(retention_scan19_resume_deadline=lambda study,state,owned_outer:(calls.append((study,state,owned_outer)) or 12345.))
  ns=selected('follow.candidate.py',{'resume_current'},extra={'ops':ops});grant={'schema':'math-gkm.retention-scan19-resume.v1','next_sequence':20};old={'schema':'math-gkm.administrative-current-resume.v1','literal_old_grant':True};state={'retention_scan19_resume':grant,'current_resume':old}
  self.assertEqual(ns['resume_current']('synthetic-study',state,owned_outer=token),12345.);self.assertIs(calls[0][2],token);self.assertEqual(state['current_resume'],old)

 def test_old_operation_scope_is_separate_and_exact(self):
  g=guard()
  for kind in ('old_immutable_bindings','old_study_verify'):self.assertEqual(g['operation_scope'](kind),g['OLD_VERIFY_PACKET'])
  for kind in ('new_neutral_readiness','new_study_verify','old_effects'):self.assertEqual(g['operation_scope'](kind),g['PACKET'])
  with self.assertRaises(RuntimeError):g['operation_scope']('arbitrary-ROOT-report')

 def test_exact_profile_rejects_all_old_cores(self):
  ns=selected('continue_machine.candidate.py',{'cs19_selected'},{'CS19_CORE'})
  self.assertTrue(ns['cs19_selected']('996d37b699ebeff1f2966ab19268ded7c9b370f4c84362da76e99de23adce2ce'))
  for core in ('ef2a7656a54fade2d64256ea2ee527f25795f3e90bb1a0ca0c16045e69e10dbe','85279fecd3a6705733f6173559846deaff25cf234549762c595bae8a059b077a','67aedf1e4c4bd8bf26b318b92540209f35d268e4145434e19ea171a58a92edc5','0'*64):self.assertFalse(ns['cs19_selected'](core))

if __name__=='__main__':unittest.main(verbosity=2)
