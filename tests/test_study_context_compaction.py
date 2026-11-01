"""Synthetic prompt metadata controls; no research, compiler or native jobs."""
import copy
import hashlib
import json
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch
from machinery import study, study_context as ctx, study_policy as policy
from machinery.study_common import canonical, digest, read, sha, write, REASONING_EFFORT


def request(role='researcher'):
    raw_source = hashlib.sha256(b'neutral source\n').hexdigest()
    text_digest = digest('neutral source\n')
    paths = {f'MathGKM/NeutralContext{i:04d}.lean': raw_source for i in range(160)}
    contexts = {name: text_digest for name in paths}
    modules = [name[:-5].replace('/', '.') for name in paths]
    records = {}
    for i in range(24):
        identity = f'neutral/~version-{i}'
        records[identity] = dict(id=identity, kind='mathematical_claims',
            claim={'statement':'∀ n : Nat, n = n', 'hypotheses':['n : Nat']},
            task={'statement':'∀ n : Nat, n = n', 'hypotheses':['n : Nat'],
                  'interface_type':'True', 'transport_type':'True',
                  'source_sha256':raw_source, 'target_module':'MathGKM.NeutralTarget',
                  'context_sources':copy.deepcopy(contexts), 'context_modules':modules[:],
                  'required_constants':['MathGKM.Neutral.identity'],
                  'residuals':[{'id':'neutral-residual', 'statement':'True'}],
                  'reduction_root':'Neutral.Root', 'future_semantic_field':{'exact':'keep'}},
            source_files=copy.deepcopy(paths), exports=['MathGKM.Neutral.identity'],
            export_module='MathGKM.Neutral', dependencies=[], receipt_hash='a'*64,
            proposal={'term':'by rfl'}, solution={'term':'by rfl'},
            used_declarations={}, validation_bundle={'directory':'own original bundle'})
    return dict(role=role, round=4, knowledge=records, components={},
        reuse_interfaces=copy.deepcopy(records), agenda=['retained own agenda'],
        proposition_dag={'root':'neutral-root','nodes':{'neutral-root':{
            'constant':'Neutral.Root','statement':'∀ n : Nat, n = n','status':'open'}}},
        remaining_obligations={'neutral-root':{'statement':'∀ n : Nat, n = n','status':'open'}},
        commitment={'selected':{'claim':'neutral prospective claim', 'outcomes':['exact prediction']},
                    'alternatives':[{'claim':'neutral competing claim'}]},
        prospective_binding='b'*64, committed_trial=None,
        concept_driver={'active_episode':{'reference':'c'*64},
                        'committed_plan':{'consequences':[{'prediction':'neutral prospective consequence'}]},
                        'checkpoints':[{'question':'neutral prospective checkpoint'}]},
        research_feedback={'latest':{'source_review':{'findings':[{'finding':'retained diagnosis'}]}},
                           'history':[{'source_review':{'findings':[{'finding':'retained diagnosis'}]}}]},
        program_execution={'input_hash':'d'*64,'program_hash':'e'*64},
        execution_budget={'tool_seconds':1800,'validation_seconds':900})


def body(text):
    return json.loads(text.split('\nREQUEST:\n', 1)[1])


def resolve(value, pointer):
    for name in pointer[1:].split('/'):
        value = value[name.replace('~1','/').replace('~0','~')]
    return value


class MetadataCompactionFixtures(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='gkm-metadata-pure-')
        self.addCleanup(self.temp.cleanup)
        self.base = Path(self.temp.name).resolve()

    def render(self, req):
        return ctx.prepare_prompt(req, self.base, req['role'], policy.prompt)

    def test_existing_four_omissions_are_insufficient_but_new_metadata_index_fits(self):
        req = request()
        legacy = copy.deepcopy(req)
        for field in ['knowledge','components','reuse_interfaces']:
            legacy[field] = {key:{k:v for k,v in record.items() if k not in ctx.INDEX_OMISSIONS}
                             for key,record in legacy[field].items()}
        self.assertGreater(len(policy.prompt(legacy)), 900000)
        text = self.render(req)
        self.assertLessEqual(len(text),900000)
        self.assertEqual(body(text)['own_context']['transport_view']['schema'],
                         'math-gkm.own-library-metadata-index.v1')

    def test_all_semantics_root_predictions_feedback_and_permissions_are_unchanged(self):
        req = request(); original = copy.deepcopy(req)
        view = body(self.render(req))
        self.assertEqual(req,original)
        for field in ['agenda','proposition_dag','remaining_obligations','commitment',
                      'prospective_binding','committed_trial','concept_driver',
                      'research_feedback','program_execution','execution_budget']:
            self.assertEqual(view[field],req[field])
        for key,record in req['knowledge'].items():
            item = view['knowledge'][key]
            self.assertEqual(item['claim'],record['claim'])
            self.assertEqual(item['task'],{k:v for k,v in record['task'].items() if k!='context_sources'})
            for field in ['id','kind','exports','export_module','dependencies','receipt_hash']:
                self.assertEqual(item[field],record[field])
            self.assertNotIn('source_files',item)

    def test_every_deferred_map_has_exact_escaped_pointer_and_distinct_hash_domains(self):
        req = request(); view = body(self.render(req))
        full = self.base/view['own_context']['path']; raw = full.read_bytes()
        self.assertEqual(raw,(canonical(req)+'\n').encode())
        self.assertEqual(hashlib.sha256(raw).hexdigest(),view['own_context']['sha256'])
        self.assertEqual(view['own_context']['request_binding'],digest(req))
        self.assertEqual(read(full),req)
        self.assertEqual(full.stat().st_mode&0o222,0)
        for key,record in req['knowledge'].items():
            item=view['knowledge'][key]; ref=item['full_record']
            self.assertEqual(resolve(req,ref['json_pointer']),record)
            self.assertIn('~1',ref['json_pointer']);self.assertIn('~0',ref['json_pointer'])
            self.assertEqual(ref['record_binding'],digest(record))
            for field,meta in ref['deferred_fields'].items():
                value=record['source_files'] if field=='source_files' else record['task']['context_sources']
                self.assertEqual(resolve(req,meta['json_pointer']),value)
                self.assertEqual(meta['value_binding'],digest(value))
                # Generated references may inherit only their file coordinates
                # from the explicit header; their value binding stays distinct.
                restored = dict(meta)
                if restored.get('own_context_file') is True:
                    self.assertEqual(view['own_context']['transport_view']['file_reference_defaults'],
                                     'math-gkm.own-context-file-reference-defaults.v1')
                    self.assertNotIn('path', restored)
                    self.assertNotIn('sha256', restored)
                    restored.pop('own_context_file')
                    restored.update(path=view['own_context']['path'],
                                    sha256=view['own_context']['sha256'])
                self.assertEqual(restored['path'],view['own_context']['path'])
                self.assertEqual(restored['sha256'],view['own_context']['sha256'])
            self.assertNotEqual(record['source_files'],record['task']['context_sources'])

    def test_exact_selected_aliases_preserve_ids_and_bind_displayed_and_full_records(self):
        req=request();view=body(self.render(req))
        self.assertEqual(set(view['reuse_interfaces']),set(req['reuse_interfaces']))
        for key,original in req['reuse_interfaces'].items():
            alias=view['reuse_interfaces'][key]
            self.assertEqual(alias['id'],original['id'])
            target=resolve(view,alias['library_record']['json_pointer'])
            self.assertEqual(target,view['knowledge'][key])
            self.assertEqual(alias['library_record']['record_binding'],digest(original))
            self.assertEqual(resolve(req,alias['full_record']['json_pointer']),original)

    def test_same_id_different_version_does_not_alias_and_component_alias_is_exact(self):
        req=request();key=next(iter(req['reuse_interfaces']))
        req['reuse_interfaces'][key]['receipt_hash']='f'*64
        component_key=list(req['knowledge'])[1]
        req['components'][component_key]=req['knowledge'].pop(component_key)
        view=body(self.render(req))
        self.assertNotIn('library_record',view['reuse_interfaces'][key])
        self.assertEqual(view['reuse_interfaces'][key]['receipt_hash'],'f'*64)
        self.assertEqual(view['reuse_interfaces'][key]['task'],
                         {k:v for k,v in req['reuse_interfaces'][key]['task'].items() if k!='context_sources'})
        alias=view['reuse_interfaces'][component_key]
        self.assertTrue(alias['library_record']['json_pointer'].startswith('/components/'))
        self.assertEqual(alias['library_record']['record_binding'],digest(req['components'][component_key]))

    def test_component_shadowed_selected_version_aliases_only_exact_component(self):
        req=request();key=next(iter(req['knowledge']))
        component=copy.deepcopy(req['knowledge'][key]);component['receipt_hash']='f'*64
        req['components'][key]=component
        # The interpreter selects from {**knowledge, **components}.
        req['reuse_interfaces'][key]=copy.deepcopy(component)
        view=body(self.render(req));alias=view['reuse_interfaces'][key]
        self.assertEqual(alias['library_record']['json_pointer'],
                         '/components/'+key.replace('~','~0').replace('/','~1'))
        self.assertEqual(alias['library_record']['record_binding'],digest(component))
        self.assertNotEqual(alias['library_record']['record_binding'],digest(req['knowledge'][key]))
        self.assertEqual(resolve(view,alias['library_record']['json_pointer']),view['components'][key])

    def test_repeat_and_different_role_contexts_have_stable_request_specific_bindings(self):
        req=request();first=self.render(req);self.assertEqual(self.render(req),first)
        other=copy.deepcopy(req);other['role']='proposer';second=self.render(other)
        a=body(first)['own_context'];b=body(second)['own_context']
        self.assertNotEqual(a['sha256'],b['sha256']);self.assertNotEqual(a['request_binding'],b['request_binding'])
        self.assertEqual(len(list((self.base/'history/context').iterdir())),2)

    def test_semantic_overflow_fails_closed_before_any_context_file(self):
        req=request();req['remaining_obligations']['neutral-root']['statement']='x'*900001
        with self.assertRaises(ctx.PromptContextLimit):self.render(req)
        self.assertFalse((self.base/'history').exists())

    def test_full_context_bound_and_private_role_restrictions_are_unchanged(self):
        self.assertEqual(ctx.PROMPT_CHAR_LIMIT,900000)
        self.assertEqual(ctx.CONTEXT_BYTE_LIMIT,8*1024**2)
        req=request();req['padding']='x'*(8*1024**2)
        with self.assertRaises(ctx.PromptContextLimit):self.render(req)
        for role in ['reviewer','selector','adapter']:
            with self.subTest(role=role),self.assertRaises(ctx.PromptContextLimit):
                self.render(request(role))
        with self.assertRaises(ctx.PromptContextLimit):
            ctx.prepare_prompt(request('proposer'),self.base,'researcher',policy.prompt)
        self.assertFalse((self.base/'history').exists())

    def test_actual_call_retains_full_request_source_grants_and_cached_identity(self):
        arm=study.Arm.__new__(study.Arm);arm.root=self.base/'arm';arm.root.mkdir()
        arm.workspace=self.base/'workspace';arm.workspace.mkdir();arm.study=self.base
        arm.p=copy.deepcopy(study.DEFAULT);arm.s={'calls':0,'meta_calls':0,'counted_jobs':[],
            'reservations':{}};arm.active_budget=None;arm.fd=0
        arm.ensure_deployment=lambda:None;arm.permitted=lambda *args:True
        reserved=[];arm.reserve=lambda *args:reserved.append(args);arm.save=lambda:None
        arm.consume=lambda job,receipt:receipt
        req=request();original=copy.deepcopy(req);key='round-synthetic'
        def fake_worker(*args,**kwargs):
            write(arm.root/'jobs'/key/'receipt.json',{'outcome':'completed','payload':{}})
            return SimpleNamespace(pid=12345,poll=lambda:0)
        arm.recover=lambda:read(arm.root/'jobs'/key/'receipt.json')
        with patch('machinery.study_bridge.event'),patch('machinery.study.subprocess.Popen',side_effect=fake_worker) as popen:
            study.Arm.call(arm,key,'researcher',req)
            self.assertEqual(popen.call_count,1)
        job=arm.root/'jobs'/key
        self.assertEqual(read(job/'request.json'),{**original,'model':arm.p['model'],
            'reasoning_effort':REASONING_EFFORT,'request_id':key})
        source_map={n:h for r in original['knowledge'].values() for n,h in r['source_files'].items()}
        self.assertEqual(read(job/'spec.json')['retained_sources'],source_map)
        view=body((job/'prompt.txt').read_text())
        self.assertEqual(view['program_execution'],original['program_execution'])
        self.assertEqual(req,original);self.assertEqual(len(reserved),1)
        with patch('machinery.study.subprocess.Popen',side_effect=AssertionError('cached call replay')):
            self.assertEqual(study.Arm.call(arm,key,'researcher',req),{'outcome':'completed','payload':{}})
        self.assertEqual(len(reserved),1)


if __name__=='__main__':unittest.main()
