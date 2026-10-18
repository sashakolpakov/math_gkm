"""Codex/Astra boundary and real-execution regressions; fixtures labeled explicitly."""
import copy
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
from machinery.broker import Broker
from machinery.engine import Engine
from machinery.gate import ProofGate, Rejected
from machinery.process import run
from machinery.trust import ROOT, LEAN, CORE, environment

class BoundaryTests(unittest.TestCase):
    def test_positive_and_real_false(self):
        gate=ProofGate({'root':['forallNat',['eqNat',['natvar',0],['natvar',0]]]})
        r=gate.close_root(gate.contract['root'],['intro','rfl'])
        self.assertFalse(r['authoritative'])
        self.assertFalse(r['root_closed'])
        self.assertEqual(r['axioms'],[])
        with self.assertRaises(Rejected): gate.check('false','trivial')

    def test_actual_shadow_import(self):
        d=Path(tempfile.mkdtemp(dir=ROOT/'.scratch'))
        # A candidate-created Init whose False is inhabited, as in the audit.
        (d/'Init.lean').write_text('prelude\ninductive True : Prop where\n | intro : True\nabbrev False : Prop := True\n')
        r=run([str(LEAN),'-o','Init.olean','Init.lean'],cwd=d,env=environment([CORE]))
        self.assertEqual(r['returncode'],0,r)
        (d/'Exploit.lean').write_text('import Init\ntheorem accepted : False := True.intro\n')
        control=run([str(LEAN),'Exploit.lean'],cwd=d,env=environment([d,CORE]))
        self.assertEqual(control['returncode'],0,control)
        with patch.dict(os.environ, {'LEAN_PATH':str(d), 'LEAN_SYSROOT':str(d)}):
            with self.assertRaises(Rejected): ProofGate({'root':'false'}).close_root('false','trivial')
        (ROOT/'evidence/round2/shadow-control.json').write_text(json.dumps({'counterfeit_compile':r,'vulnerable_control':control,'revised_gate':'rejected'},indent=2))

    def test_forged_receipt_and_source_binding(self):
        gate=ProofGate({})
        receipt=gate.check('true','trivial')
        receipt['source_hash']='forged'
        with self.assertRaises(Rejected): gate.recheck(receipt)

    def test_project_dependencies_and_injection(self):
        gate=ProofGate({})
        with self.assertRaises(Rejected): gate.check('true','trivial',['BadImportedAxiom'])
        with self.assertRaises(Rejected): gate.check('true','by exact True.intro')

    def test_real_refutation_exact_target(self):
        gate=ProofGate({'root':'false'})
        r=gate.close_root(['not','false'],['intro',['var',0]],'refutation')
        self.assertEqual(r['resolution_attempt'],'refutation')
        with self.assertRaises(Rejected): gate.close_root('true','trivial')

class BrokerTests(unittest.TestCase):
    def test_arbitrary_experiment(self):
        r=Broker({}).act({'kind':'experiment','payload':{'tool':'python_pure',
          'program':'def f(n):\n return sum(k*k for k in range(n))\nprint([f(n) for n in range(5)])'}})
        self.assertEqual(r['evidence'],'computation',r)
        self.assertEqual(r['execution']['stdout'].strip(),'[0, 0, 1, 5, 14]')

    def test_failures_record_and_limits_contract(self):
        b=Broker({'limits':{'actions':1}})
        r=b.act({'kind':'proof','payload':{}})
        self.assertEqual(r['evidence'],'execution_failure')
        self.assertEqual(len(b.events),1)
        with self.assertRaises(Rejected): b.act({'kind':'conjecture'})

    def test_mutation_cannot_rewrite_history(self):
        b=Broker({}); action={'kind':'strategy','payload':{'x':[1]}}
        r=b.act(action); before=b.events
        action['payload']['x'].append(2); r['evidence']='forged'
        returned=b.events; returned[0]['result']['evidence']='also forged'
        self.assertEqual(b.events,before)

    def test_citation_is_unverified(self):
        r=Broker({}).act({'kind':'literature','payload':{'query':'x','url':'https://example.com','passage':'x','tool_record':'invented','retrieved_utc':'now'}})
        self.assertEqual(r['evidence'],'pending_hosted_search')

    def test_external_response_binding_and_replay(self):
        from machinery.gate import digest
        b=Broker({}); action={'kind':'literature','payload':{'query':'primary source'}}
        b.act(action)
        response={'kind':'external_observation','payload':{'event_index':0,
          'action_hash':digest(action),'observation':{'text':'transport fixture','origin':'explicit_protocol_fixture'}}}
        r=b.act(response)
        self.assertEqual(r['evidence'],'external_observation_claim')
        self.assertFalse(r['verified'])
        self.assertEqual(b.act(response)['evidence'],'execution_failure')

    def test_forbidden_host_access(self):
        for p in ["import os", "print(open('/etc/passwd').read())", 'print((1).__class__)']:
            r=Broker({}).act({'kind':'experiment','payload':{'tool':'python_pure','program':p}})
            self.assertEqual(r['evidence'],'execution_failure',r)

    def test_real_proof_attempt(self):
        r=Broker({}).act({'kind':'proof','payload':{'target':'true','proof':'trivial'}})
        self.assertEqual(r['evidence'],'bootstrap_proof_check')
        self.assertFalse(r['mathematical_resolution'])

    def test_output_and_timeout(self):
        b=Broker({'limits':{'experiment_seconds':1,'output_bytes':100}})
        r=b.act({'kind':'experiment','payload':{'tool':'python_pure','program':'while True:\n print(123456789)'}})
        self.assertEqual(r['execution']['termination'],'output_limit',r)
        r=run(['/opt/homebrew/bin/python3','-I','-c','import time; time.sleep(5)'],
              cwd=ROOT,env=environment(),timeout=0.1)
        self.assertEqual(r['termination'],'timeout')

    def test_no_complexity_in_context(self):
        a,b=Broker({}),Broker({})
        for broker,k in [(a,1),(b,99999)]:
            broker.act({'kind':'strategy','payload':'next','complexity_audit':k})
        self.assertEqual(a.context(),b.context())

    def test_nested_complexity_not_in_context(self):
        a,b=Broker({}),Broker({})
        for broker,k in [(a,1),(b,99999)]:
            broker.act({'kind':'strategy','payload':{'task':'same','complexity_audit':k}})
        self.assertEqual(a.context(),b.context())

    def test_descendant_group_timeout(self):
        import time
        d=Path(tempfile.mkdtemp(dir=ROOT/'.scratch')); marker=d/'escaped'
        child='import time; from pathlib import Path; time.sleep(0.5); Path('+repr(str(marker))+').write_text("escaped")'
        parent='import subprocess,time; subprocess.Popen(["/opt/homebrew/bin/python3","-I","-c",'+repr(child)+']); time.sleep(5)'
        result=run(['/opt/homebrew/bin/python3','-I','-c',parent],cwd=d,env=environment(),timeout=0.15)
        self.assertEqual(result['termination'],'timeout')
        time.sleep(0.6)
        self.assertFalse(marker.exists())

class EngineTests(unittest.TestCase):
    def test_fixture_feedback_continuation_and_replay(self):
        d=Path(tempfile.mkdtemp(dir=ROOT/'.scratch')); engine=Engine(d)
        req=engine.initialize({'root':'true','limits':{'actions':3}})
        response={'request_id':req['id'],'context_hash':req['context_hash'],
                  'origin':'explicit_protocol_fixture','actions':[{'kind':'experiment','payload':{
                    'tool':'python_pure','program':'print(sum(range(10)))'}}]}
        nxt=engine.consume(response)
        self.assertEqual(nxt['context']['observations'][0]['result']['execution']['stdout'].strip(),'45')
        with self.assertRaises(Rejected): engine.consume(response)
        response={'request_id':nxt['id'],'context_hash':nxt['context_hash'],'origin':'explicit_protocol_fixture',
                  'decision':'fixture chooses a genuine proof attempt after observing computation',
                  'actions':[{'kind':'proof','payload':{'target':'true','proof':'trivial'}}]}
        last=engine.consume(response)
        self.assertEqual(last['context']['observations'][1]['result']['evidence'],'bootstrap_proof_check')

if __name__=='__main__': unittest.main(verbosity=2)
