"""Schema 2 regression SOURCES; construction011 deliberately does not run these.

Synthetic records exercise encoding only, never mathematical admission.
Actual kernel/closure positives remain in the unchanged integration controls.
"""
import copy
import io
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
from machinery import proof_audit as audit
from machinery.study_common import ROOT, Invalid, digest


def records():
    return [
        ['header',audit.SCHEMA,['Root','Interface']],
        ['expr',0,'sort',[['zero']],[]],
        ['expr',1,'nat',[0],[]],
        ['decl','Fixture.used','Fixture','definition',False,[],0,1],
        ['decl','Fixture.unused','Fixture','definition',False,[],0,1],
        ['catalog',['Fixture.used','Fixture.unused']],
        ['decl','Root','local','theorem',False,[],0,1],
        ['root','Root',['propext'],['Root','Fixture.used'],2,1,0],
        ['decl','Interface','local','theorem',False,[],0,1],
        ['root','Interface',[],['Interface'],1,0,0],
        ['end',2,4,2,2]]


def encoded(rows):
    return ''.join(json.dumps(row,separators=(',',':'))+'\n' for row in rows).encode()


class Compact011(unittest.TestCase):
    def parse(self,rows):
        return audit._stream(io.BytesIO(encoded(rows)),('Root','Interface'))

    def test_complete_used_unused_and_all_identity_fields(self):
        baseline=self.parse(records())
        self.assertEqual([c['name'] for c in baseline[0]['catalog']],['Fixture.used','Fixture.unused'])
        for index,value in ((3,'opaque'),(4,True),(5,[['str',['anonymous'],'u']]),(6,1),(7,None)):
            changed=records(); changed[4][index]=value
            self.assertNotEqual(baseline[0]['catalog'][1]['semantic_sha256'],
                self.parse(changed)[0]['catalog'][1]['semantic_sha256'])
        changed=records(); changed[1][3]=[['succ',['zero']]]
        self.assertNotEqual(baseline[0]['catalog'][1]['semantic_sha256'],
            self.parse(changed)[0]['catalog'][1]['semantic_sha256'])

    def test_expr_exact_fields_and_sharing_independent_identity(self):
        names=[['str',['anonymous'],'x'],['str',['anonymous'],'y']]
        h=['a'*64,'b'*64]
        self.assertNotEqual(audit._node('lam',[names[0],'default'],[0,1],h),
            audit._node('lam',[names[1],'default'],[0,1],h))
        self.assertNotEqual(audit._node('lam',[names[0],'default'],[0,1],h),
            audit._node('lam',[names[0],'implicit'],[0,1],h))
        self.assertEqual(audit._node('app',[],[0,0],h),audit._node('app',[],[0,1],[h[0],h[0]]))
        for tag,fields,refs in [('letE',[names[0],True],[0,0,1]),
                ('proj',[names[0],0],[0]),('string',['x'],[]),
                ('const',[names[0],[['zero']]],[]),
                ('mdata',[[names[0],['syntax',['atom',['none'],'x']]]],[0])]:
            changed=copy.deepcopy(fields)
            if tag=='letE': changed[1]=False
            elif tag=='proj': changed[1]=1
            elif tag=='string': changed[0]='y'
            elif tag=='const': changed[1]=[['succ',['zero']]]
            else: changed[0][1][1][2]='y'
            self.assertNotEqual(audit._node(tag,fields,refs,h),audit._node(tag,changed,refs,h))

    def test_duplicate_conflicting_missing_truncated_corrupt_and_cross_schema(self):
        bad=[]
        for index in (1,3,5,7,10):
            rows=records(); rows.insert(index,copy.deepcopy(rows[index])); bad.append(rows)
        rows=records(); rows[0][1]='math-gkm.inspection.v1'; bad.append(rows)
        rows=records(); rows[-1][1]+=1; bad.append(rows)
        rows=records(); rows[7][2]=['Hidden.axiom']; bad.append(rows)
        rows=records(); rows[2][4]=[7]; bad.append(rows)
        rows=records(); rows[5][1]=['Fixture.used']; bad.append(rows)
        for rows in bad:
            with self.subTest(rows=rows),self.assertRaises(Invalid): self.parse(rows)
        for data in (encoded(records())[:-1],encoded(records())[:-10],b'garbage\n',encoded(records())+b'[]\n'):
            with self.assertRaises((Invalid,ValueError)):
                audit._stream(io.BytesIO(data),('Root','Interface'))

    def test_exact_count_boundary_and_oversize(self):
        rows=records(); rows[7][4:]=[200000,200000,1]
        self.assertEqual(self.parse(rows)[0]['traversal']['distinct_nodes'],200000)
        rows[7][4]=200001
        with self.assertRaises(Invalid): self.parse(rows)
        with patch.object(audit,'ARTIFACT_BYTES',len(encoded(records()))-1),self.assertRaises(Invalid):
            self.parse(records())


class Feedback011(unittest.TestCase):
    def test_operational_classes_and_private_canary(self):
        from machinery.own_feedback import diagnostic
        cases=[('timeout','timeout'),('output_limit','output_limit'),
            ('resource_guard: PRIVATE_ADAPTER_CANARY','resource_termination')]
        for termination,expected in cases:
            result=dict(checked=False,controller_stage='trusted_premise_inspection',
                checks=[dict(termination=termination,returncode=-9,stderr='PRIVATE_ADAPTER_CANARY')])
            value=diagnostic(result)
            self.assertEqual(value['category'],expected)
            self.assertNotIn('PRIVATE_ADAPTER_CANARY',json.dumps(value))
        for token,category in [('dependency_node_limit','dependency_node_limit'),
                ('dependency_edge_limit','dependency_edge_limit'),('forbidden_axiom','premise_rejection'),
                ('missing_required','required_constant_rejection')]:
            value=diagnostic(dict(controller_stage='trusted_premise_inspection',checks=[dict(
                returncode=1,termination=None,stderr='PRIVATE_ADAPTER_CANARY')],trusted_inspector_failure=token))
            self.assertEqual(value['category'],category)
        self.assertEqual(diagnostic({})['category'],'unknown')

    def test_actual_request_projection_both_roles_and_metadata_spoof(self):
        from machinery import own_feedback,study_policy
        workspace=Path(tempfile.mkdtemp(dir=ROOT/'.scratch',prefix='feedback011-'))
        protocol=dict(rounds=2,episode_rounds=1,invention_rounds=1,call_seconds=10,
            knowledge_checks_per_round=6,validation_seconds=10)
        for mode in ('baseline','exploration'):
            state=study_policy.initial(mode)
            own_feedback.retain(state,workspace,dict(checked=False,controller_stage='trusted_premise_inspection',
                controller_diagnostic=own_feedback.diagnostic({},audit.InspectionFailure(
                    'artifact_size_limit',observed_bytes=33554433,limit_bytes=33554432))),
                kind='mathematical_claims',proposal_hash='a'*64)
            for role in ('proposer','researcher'):
                request=study_policy.request(state,1,protocol,role)
                self.assertEqual(request['own_check_feedback'][-1]['diagnostic']['category'],'artifact_size_limit')
                self.assertTrue((workspace/request['own_check_feedback'][-1]['projection_path']).is_file())
                self.assertNotIn('PRIVATE_ADAPTER_CANARY',json.dumps(request))
            study_policy.record(state,dict(agenda=[],hypotheses=[],findings=[],
                own_check_feedback=[{'category':'accepted','private':'PRIVATE_ADAPTER_CANARY'}]),workspace,1,protocol)
            self.assertEqual(state['own_check_feedback'][-1]['diagnostic']['category'],'artifact_size_limit')
