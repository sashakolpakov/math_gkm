"""Prepared entrypoint regressions. No execution authorized by construction012.

Mock process records are engineering controls, never mathematical admission.
No fixture is exported to a research seed.
"""
import copy
import hashlib
import json
from contextlib import ExitStack
from pathlib import Path
import re
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch
from machinery import proof_audit as audit, own_feedback, study_policy, study_program
from machinery import study_knowledge, study_transfer, study_completion, completion
from machinery.study_common import ROOT, Invalid, digest, read, sha, write
from tests.test_inspection011 import records, encoded

NONCE='a'*64
PROTOCOL=dict(rounds=2,episode_rounds=1,invention_rounds=1,call_seconds=10,
    knowledge_checks_per_round=6,validation_seconds=10,transport='live')


def completed(raw,nonce=NONCE):
    return dict(returncode=0,termination=None,stderr='',
        stdout=f'GKM_DECLARATIONS_COMPLETE_V3:{nonce}:{len(raw)}:{hashlib.sha256(raw).hexdigest()}\n')


class Entrypoints012(unittest.TestCase):
    def setUp(self):
        self.base=Path(tempfile.mkdtemp(dir=ROOT/'local.scratch',prefix='repair012-'))

    def projected(self,state,category,measured=None):
        state['program']={**study_program.REFERENCE,'code':[dict(op='keep_observations',n=0)]}
        for role in ('proposer','researcher'):
            request=study_policy.request(state,1,PROTOCOL,role)
            self.assertEqual(request['observations'],[])
            feedback=[f for f in request['own_check_feedback'] if f['diagnostic']['category']==category]
            self.assertTrue(feedback,request)
            for f in request['own_check_feedback']:
                if not f['checked']:
                    self.assertNotEqual(f['diagnostic']['category'],'accepted')
                    self.assertEqual(f['diagnostic']['mathematical_conclusion'],'none')
            if measured is not None:
                for key,value in measured.items(): self.assertEqual(feedback[-1]['diagnostic']['measured'][key],value)
            self.assertNotIn('PRIVATE_CANARY',json.dumps(request))

    def ingest(self,mode,checker):
        ws=Path(tempfile.mkdtemp(dir=self.base,prefix=mode+'-'))
        contract=dict(root_file='root.txt',root_declaration='Root',root_sha256='b'*64)
        write(ws/'contract.json',contract)
        state=study_policy.initial(mode); charges=[]
        arm=SimpleNamespace(p=PROTOCOL,stopped=lambda:False,reserve=lambda *v:charges.append(v))
        item=dict(id='engineering',module='MathGKM.Control',statement='unused mock',term='unused mock')
        task=dict(id='engineering',required_constants=[])
        with patch.object(study_knowledge,'bind_task',return_value=task),patch.object(study_knowledge,'check_task',side_effect=checker):
            study_knowledge.ingest(arm,state,dict(mathematical_claims=[item],
                own_check_feedback=[dict(category='accepted',private='PRIVATE_CANARY')]),ws,ws/'attempts')
        self.assertEqual(len(charges),1)
        self.assertFalse(state['knowledge']); self.assertFalse(state['components'])
        return state,ws

    def test_real_parser_typed_limits_ingest_and_future_requests(self):
        raw=encoded(records())
        for mode in ('baseline','exploration'):
            for bound,limit,category,observed in [('ARTIFACT_BYTES',len(raw)-1,'artifact_size_limit',len(raw)),
                    ('LINE_BYTES',16,'record_size_limit',17)]:
                def checker(ws,task,solution,directory,*args,**kwargs):
                    directory.mkdir(parents=True); path=directory/'declarations.json'; path.write_bytes(raw)
                    result=dict(checked=False,status='failed',controller_stage='trusted_premise_inspection')
                    with patch.object(audit,bound,limit):
                        try: audit.parse_artifact(completed(raw),('Root','Interface'),path,nonce=NONCE)
                        except audit.InspectionFailure as exc:
                            self.assertEqual(exc.measured,dict(observed_bytes=observed,limit_bytes=limit))
                            result['controller_diagnostic']=own_feedback.diagnostic(result,exc)
                        else: self.fail('typed parser failure lost')
                    return result
                state,_=self.ingest(mode,checker)
                self.projected(state,category,dict(observed_bytes=observed,limit_bytes=limit))

    def test_valid_same_size_mutations_and_completion_evidence_reject(self):
        original=encoded(records()); record=completed(original)
        variants=[]
        for index,column,value in [(2,3,[1]),(7,2,['Classical.choice']),
                (7,3,['Root','Fixture.unused']),(4,7,0)]:
            rows=records(); rows[index][column]=value; variants.append(encoded(rows))
        # Same-size Expr/body mutations are valid streams with different identities.
        self.assertEqual(len(variants[0]),len(original)); self.assertEqual(len(variants[-1]),len(original))
        for mode in ('baseline','exploration'):
            for raw in variants:
                def checker(ws,task,solution,directory,*args,**kwargs):
                    directory.mkdir(parents=True); path=directory/'declarations.json'; path.write_bytes(raw)
                    with self.assertRaises(Invalid): audit.parse_artifact(record,('Root','Interface'),path,nonce=NONCE)
                    return dict(checked=False,status='rejected')
                state,_=self.ingest(mode,checker); self.projected(state,'unknown')
        path=self.base/'declarations.json'; path.write_bytes(original)
        self.assertEqual(len(audit.parse_artifact(record,('Root','Interface'),path,nonce=NONCE)),2)
        for bad in [dict(record,stdout=''),dict(record,stdout=record['stdout']*2),
                completed(original,'b'*64),dict(record,returncode=1),
                dict(record,stdout='GKM_DECLARATIONS_FILE_V2:declarations.json\n')]:
            with self.assertRaises(Invalid): audit.parse_artifact(bad,('Root','Interface'),path,nonce=NONCE)

    def test_actual_ingest_finish_exception_and_recovery_are_not_accepted(self):
        from machinery import validation_receipts
        for mode in ('baseline','exploration'):
            captured=[]
            def checker(ws,task,solution,directory,*args,**kwargs):
                directory.mkdir(parents=True)
                raw=dict(checked=True,status='raw_stage_success',finished=1,
                    controller_diagnostic=own_feedback.diagnostic(dict(checked=True)))
                data=encoded(records()); path=directory/'source/declarations.json'
                path.parent.mkdir(); path.write_bytes(data)
                rows=audit.parse_artifact(completed(data),('Root','Interface'),path,nonce=NONCE)
                raw.update(declarations=rows,inspection_schema=audit.SCHEMA,
                    declaration_artifact_sha256=sha(path),producer_completion=rows[0]['producer_completion'],
                    checks=[dict(operation='trusted_premise_inspection',**completed(data))])
                write(directory/'result.json',raw); captured.append((directory,sha(directory/'result.json')))
                # Actual finalizer entrypoint, with bounded write failure.
                with patch.object(validation_receipts,'write',side_effect=OSError('PRIVATE_CANARY')):
                    validation_receipts.finish(directory,task,solution,())
            state,ws=self.ingest(mode,checker)
            self.projected(state,'finalization_failure')
            directory,raw_hash=captured[-1]
            self.assertEqual(sha(directory/'result.json'),raw_hash)
            self.assertTrue(any(f.get('raw_result_sha256')==raw_hash for f in state['own_check_feedback']))
            self.assertFalse((directory/'FINISHED.json').exists())

    def test_completion_actual_verify_finish_exception_and_unfinished_no_replay(self):
        from machinery import validation_receipts, retention
        for mode in ('baseline','exploration'):
            ws=self.base/mode; ws.mkdir()
            contract=dict(root_file='Root.lean',root_declaration='Root',correspondence_obligations=[])
            write(ws/'contract.json',contract)
            state=study_policy.initial(mode); charges=[]
            arm=SimpleNamespace(p=PROTOCOL,root=ws,workspace=ws,study=self.base,
                s=dict(round=1,research=state),reserve=lambda *v:charges.append(v),
                stopped=lambda:False,save=lambda:None)
            claim=dict(kind='proof',module='MathGKM.Control',declaration='Control')
            audit_value=dict(bundle_hash='bundle',accepted=True,reviewer='independent',checks={})
            bundle=dict(bundle_hash='bundle',binding={},sources={},order=[])
            rows=[['header',audit.SCHEMA,['ControllerRootCheck']],['expr',0,'nat',[0],[]],
                ['catalog',[]],['decl','ControllerRootCheck','local','theorem',False,[],0,0],
                ['root','ControllerRootCheck',[],['ControllerRootCheck'],1,0,0],['end',1,1,1,0]]
            data=encoded(rows)
            mutate=[False]
            def process(argv,**kwargs):
                if argv[-1]=='ControllerInspect.lean':
                    source=kwargs['cwd']; text=(source/'ControllerInspect.lean').read_text()
                    nonce=re.search(r'COMPLETE_V3:([0-9a-f]{64}):',text)[1]
                    consumed=data.replace(b'"nat",[0]',b'"nat",[1]') if mutate[0] else data
                    self.assertEqual(len(consumed),len(data))
                    (source/'declarations.json').write_bytes(consumed)
                    return completed(data,nonce)
                return dict(returncode=0,termination=None,stdout='',stderr='')
            def source_hash(path):
                return sha(path) if Path(path).name=='declarations.json' else 'b'*64
            # Real verify, exact-root and independent audit branches, simulated
            # process output, then a real saved successful raw result and failure.
            with patch.object(study_completion,'dependency_paths',return_value=[]), \
                 patch.object(study_completion,'sandbox_prefix',return_value=[]), \
                 patch.object(completion,'prepare',return_value=bundle), \
                 patch.object(completion,'environment',return_value={'LEAN_PATH':'/unused'}), \
                 patch.object(completion,'sha',side_effect=source_hash), \
                 patch.object(completion,'run',side_effect=process), \
                 patch.object(retention,'retire_build'), \
                 patch.object(validation_receipts,'finish',side_effect=OSError('PRIVATE_CANARY')):
                with self.assertRaises(OSError): study_completion.check(arm,claim,audit_value)
            self.projected(state,'finalization_failure')
            directory=ws/'completion'/digest(dict(claim=claim,audit=audit_value,round=1))
            raw_hash=sha(directory/'result.json')
            self.assertTrue(read(directory/'result.json')['resolved'])
            self.assertTrue(any(f.get('raw_result_sha256')==raw_hash for f in state['own_check_feedback']))
            with patch.object(completion,'verify',side_effect=AssertionError('no free replay')):
                with self.assertRaises(validation_receipts.UnfinishedReceipt): study_completion.check(arm,claim,audit_value)
            self.projected(state,'unfinished_receipt')
            self.assertEqual(len(charges),1); self.assertNotIn('resolution',arm.s)
            self.assertEqual(sha(directory/'result.json'),raw_hash)
            # A second charged attempt exercises a valid same-size corruption
            # before completion's REAL parser, with unchanged completion output.
            mutate[0]=True
            with patch.object(study_completion,'dependency_paths',return_value=[]), \
                 patch.object(study_completion,'sandbox_prefix',return_value=[]), \
                 patch.object(completion,'prepare',return_value=bundle), \
                 patch.object(completion,'environment',return_value={'LEAN_PATH':'/unused'}), \
                 patch.object(completion,'sha',side_effect=source_hash), \
                 patch.object(completion,'run',side_effect=process), \
                 patch.object(retention,'retire_build'):
                rejected=study_completion.check(arm,{**claim,'declaration':'Changed'},audit_value)
            self.assertFalse(rejected['resolved'])
            self.assertNotIn('declarations',rejected)
            self.assertNotIn('resolution',arm.s)
            self.projected(state,'unknown')
            self.assertEqual(len(charges),2)

    def test_malformed_exception_prose_does_not_become_typed(self):
        path=self.base/'declarations.json'; raw=b'{PRIVATE_CANARY}\n'; path.write_bytes(raw)
        for mode in ('baseline','exploration'):
            def checker(*args,**kwargs):
                try: audit.parse_artifact(completed(raw),('Root',),path,nonce=NONCE)
                except Invalid as exc:
                    self.assertIs(type(exc),Invalid)
                    return dict(checked=False,status='failed',controller_diagnostic=own_feedback.diagnostic({},exc))
            state,_=self.ingest(mode,checker); self.projected(state,'unknown')


class Producer012(Entrypoints012):
    """Prepared bounded producer executions, explicitly NOT run in construction."""
    def clean_utility(self,prelude):
        # A later run_cmd can run despite an earlier declaration error.
        directory,record=self.producer('import Lean\nimport Lean.Meta.Sym.ExprPtr\n'+prelude+
            '\nend MathGKMTrustedInspection013\n')
        self.assertEqual(record['returncode'],0,record)
        self.assertIsNone(record['termination'],record)
        self.assertFalse(record.get('operationally_incomplete'),record)
        self.assertEqual(record['stdout'],'',record)
        self.assertEqual(record['stderr'],'',record)
        return directory,record

    def intended_capacity_failure(self,directory,record,setup,category):
        self.assertEqual(setup['returncode'],0,setup)
        self.assertIsNone(setup['termination'],setup)
        self.assertFalse(setup.get('operationally_incomplete'),setup)
        self.assertEqual(setup['stdout'],'',setup)
        self.assertEqual(setup['stderr'],'',setup)
        self.assertEqual(record['returncode'],1,record)
        self.assertIsNone(record['termination'],record)
        self.assertFalse(record.get('operationally_incomplete'),record)
        failure=audit.failure_artifact(directory/'declarations.json',('Root',),record,nonce=NONCE)
        self.assertIsNotNone(failure,record)
        self.assertEqual(failure['category'],category)
        # Permit only the authenticated token and the exact deliberate IO error.
        # Any other diagnostic (including preceding utility errors) fails closed.
        lines=(record['stdout']+'\n'+record['stderr']).splitlines()
        token='GKM_INSPECTION_FAILURE_V3:'+NONCE+':'
        diagnostics=[line for line in lines if line and not line.startswith(token)]
        self.assertEqual(len(diagnostics),1,record)
        self.assertRegex(diagnostics[0],
            r'^(?:Producer\.lean:[0-9]+:[0-9]+: )?error: trusted inspection did not complete$',record)
        return failure

    def producer(self,text):
        from machinery.process import run
        from machinery.trust import LEAN, CORE, environment
        directory=Path(tempfile.mkdtemp(dir=self.base,prefix='producer-'))
        (directory/'Producer.lean').write_text(text)
        record=run([str(LEAN),'-j','1','Producer.lean'],cwd=directory,
            env={**environment([CORE]),'TMPDIR':str(directory)},timeout=60,output_bytes=1048576)
        write(directory/'RAW_PROCESS_RECORD.json',record)
        return directory,record

    def test_sha256_vectors_chunking_and_completed_producer_consumer(self):
        from machinery.inspection_stream import PRELUDE
        self.clean_utility(PRELUDE)
        vectors=['','abc','x'*55,'x'*56,'x'*63,'x'*64,'x'*65,'λ'*1000]
        for value in vectors:
            literal=json.dumps(value,ensure_ascii=False)
            directory,record=self.producer('import Lean\nimport Lean.Meta.Sym.ExprPtr\n'+PRELUDE+
                '\nopen Lean Elab Command in\nrun_cmd do\n'+
                f'  let bytes := ({literal} : String).toUTF8\n'+
                '  let mut state : Sha := {}\n  for byte in bytes do\n'+
                '    state := shaUpdate state (ByteArray.empty.push byte)\n'+
                '  liftIO <| IO.println (shaFinish state bytes.size)\nend MathGKMTrustedInspection013\n')
            self.assertEqual(record['returncode'],0,record)
            self.assertIsNone(record['termination'])
            self.assertFalse(record.get('operationally_incomplete'),record)
            self.assertEqual(record['stderr'],'',record)
            self.assertEqual(record['stdout'].strip(),hashlib.sha256(value.encode()).hexdigest())
        source=audit.inspector('Lean',('Nat.add',),nonce=NONCE,artifact='declarations.json')
        directory,record=self.producer(source)
        self.assertEqual(record['returncode'],0,record)
        self.assertIsNone(record['termination'],record)
        self.assertFalse(record.get('operationally_incomplete'),record)
        self.assertEqual(record['stderr'],'',record)
        self.assertRegex(record['stdout'],r'\AGKM_DECLARATIONS_COMPLETE_V3:'+NONCE+r':[0-9]+:[0-9a-f]{64}\n\Z')
        rows=audit.parse_artifact(record,('Nat.add',),directory/'declarations.json',nonce=NONCE)
        self.assertEqual(rows[0]['producer_completion']['artifact_sha256'],sha(directory/'declarations.json'))

    def test_producer_actual_record_and_total_bounds_ingest_requests(self):
        from machinery.inspection_stream import PRELUDE
        prelude=PRELUDE.replace('1048576','128').replace('33554432','512')
        setup_directory,setup=self.clean_utility(prelude)
        for mode in ('baseline','exploration'):
            for category,body in [('record_size_limit','emit <| j [s "padding", s (String.ofList (List.replicate 200 \'x\'))]'),
                    ('artifact_size_limit','for _ in [:30] do emit <| j [s "padding", s "01234567890123456789"]')]:
                text='import Lean\nimport Lean.Meta.Sym.ExprPtr\n'+prelude+'''
open Lean Elab Command in
run_cmd do
  let handle ← liftIO <| IO.FS.Handle.mk "declarations.json" IO.FS.Mode.write
  let action : M Unit := do
    emit <| j [s "header", s "math-gkm.inspection-dag.v3", toJson (["Root"] : List String)]
    '''+body+'''
  let _ ← liftIO <| action.run {handle := handle, nonce := "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"}
end MathGKMTrustedInspection013
'''
                directory,record=self.producer(text)
                self.assertNotEqual(record['returncode'],0)
                failure=audit.failure_artifact(directory/'declarations.json',('Root',),record,nonce=NONCE)
                write(directory/'FAILURE_DIAGNOSTIC.json',dict(failure=failure,record_sha256=sha(directory/'RAW_PROCESS_RECORD.json')))
                self.assertIsNotNone(failure,'No authenticated producer failure evidence; inspect '+str(directory/'RAW_PROCESS_RECORD.json'))
                self.assertEqual(record['returncode'],1,record)
                self.assertIsNone(record['termination'],record)
                self.assertEqual(failure['category'],category)
                self.assertEqual(failure['measured']['limit_bytes'],128 if category=='record_size_limit' else 512)
                self.assertGreater(failure['measured']['observed_bytes'],failure['measured']['limit_bytes'])
                write(directory/'CLEAN_SETUP_BINDING.json',dict(
                    source_sha256=sha(setup_directory/'Producer.lean'),
                    record_sha256=sha(setup_directory/'RAW_PROCESS_RECORD.json')))
                # Faithful small control: an unrelated utility declaration error
                # precedes the same real run_cmd; its valid token is insufficient.
                if mode=='baseline' and category=='record_size_limit':
                    broken=text.replace('private def declaration (env : Environment)',
                        'private def unrelated014 : Nat := "utility error"\nprivate def declaration (env : Environment)',1)
                    bad_directory,bad_record=self.producer(broken)
                    bad_failure=audit.failure_artifact(bad_directory/'declarations.json',('Root',),bad_record,nonce=NONCE)
                    write(bad_directory/'FAILURE_DIAGNOSTIC.json',dict(failure=bad_failure,
                        record_sha256=sha(bad_directory/'RAW_PROCESS_RECORD.json')))
                    self.assertIsNotNone(bad_failure,bad_record)
                    self.assertEqual(bad_failure['category'],category)
                    self.assertIn('error:',bad_record['stdout']+bad_record['stderr'])
                    with self.assertRaises(AssertionError):
                        self.intended_capacity_failure(bad_directory,bad_record,setup,category)
                self.assertEqual(self.intended_capacity_failure(directory,record,setup,category),failure)
                def checker(*args,**kwargs):
                    result=dict(checked=False,status='failed',controller_stage='trusted_premise_inspection',
                        checks=[record],trusted_inspector_failure=failure)
                    result['controller_diagnostic']=own_feedback.diagnostic(result)
                    return result
                state,_=self.ingest(mode,checker)
                self.projected(state,category,failure['measured'])
