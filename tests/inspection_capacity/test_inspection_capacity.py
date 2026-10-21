"""Offline encoding/source/binding controls; synthetic streams are not proofs."""
import copy
import hashlib
import importlib.util
import io
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
from machinery import proof_audit as audit, inspection_stream, own_feedback
from machinery import validation_receipts as receipts
from machinery.study_common import ROOT, Invalid, digest, sha, write
from tests.test_inspection011 import records, encoded

NONCE = 'a'*64
LIVE_ROOT = ROOT
TEST_HOME = Path(__file__).resolve().parent
CONTROL_HOME = TEST_HOME if (TEST_HOME/'neutral_producer_controls.py').is_file() else TEST_HOME.parent
BASELINE_HASHES = {
    'proof_audit.py':'1c836ec67bdd37ce05dc80d35a34d5d9cf4b526c552afc2f5e83d653323753ba',
    'inspection_stream.py':'cb0ff86634236920531ea15f5151ad94ad0782a908ead12ce88f83ee647c4ab3',
    'own_feedback.py':'1d5bda9d3ce3f4957b13e7f5efcf554ef3ae059d802500465042f50ff30a8d69'}


def baseline_path(filename):
    overlay = os.environ.get('MATH_GKM_CAPACITY_STAGE')
    roots = ([Path(overlay).expanduser().resolve()/'baseline/machinery'] if overlay else []) + [
        CONTROL_HOME/'baseline/machinery',LIVE_ROOT/'evidence/concept-driver-source-20261020/source/machinery']
    path = next((root/filename for root in roots if (root/filename).is_file()),None)
    if path is None or sha(path)!=BASELINE_HASHES[filename]:
        raise RuntimeError('Missing or changed historical source: '+filename)
    return path


def original_module(name, filename):
    spec = importlib.util.spec_from_file_location(name, baseline_path(filename))
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def completed(raw, nonce=NONCE):
    return dict(returncode=0, termination=None, stderr='',
        stdout=f'GKM_DECLARATIONS_COMPLETE_V3:{nonce}:{len(raw)}:{hashlib.sha256(raw).hexdigest()}\n')


def counts(nodes, edges, duplicates=None):
    rows = records()
    rows[7][4:] = [nodes, edges, edges-nodes+1 if duplicates is None else duplicates]
    return rows


class EdgeCapacity(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.old = original_module('machinery._capacity_old_audit', 'proof_audit.py')
        cls.old_stream = original_module('machinery._capacity_old_stream', 'inspection_stream.py')

    def parse(self, rows, module=audit):
        return module._stream(io.BytesIO(encoded(rows)), ('Root', 'Interface'))

    def test_only_raw_edge_capacity_changes(self):
        self.assertEqual(audit.EDGE_LIMIT, 2_000_000)
        self.assertEqual(audit.WORK_LIMIT, 200_000)
        self.assertEqual(audit.DECL_LIMIT, self.old.DECL_LIMIT)
        self.assertEqual(audit.NODE_LIMIT, self.old.NODE_LIMIT)
        self.assertEqual(audit.ARTIFACT_BYTES, self.old.ARTIFACT_BYTES)
        self.assertEqual(audit.LINE_BYTES, self.old.LINE_BYTES)
        self.assertEqual((audit.SCHEMA, audit.IDENTITY_SCHEMA), (self.old.SCHEMA, self.old.IDENTITY_SCHEMA))

    def test_below_old_bound_has_identical_complete_parsed_records(self):
        for rows in (records(), counts(2, 200_000)):
            self.assertEqual(self.parse(rows), self.parse(rows, self.old))

    def test_raw_edges_and_duplicates_above_old_bound_reach_new_bound(self):
        for edges in (200_001, 1_999_999, 2_000_000):
            rows = counts(2, edges)
            with self.assertRaises(Invalid): self.parse(rows, self.old)
            traversal = self.parse(rows)[0]['traversal']
            self.assertEqual(traversal, dict(distinct_nodes=2, edges=edges, duplicate_edges=edges-1))
        with self.assertRaises(Invalid): self.parse(counts(2, 2_000_001))

    def test_distinct_node_bound_remains_independent(self):
        self.assertEqual(self.parse(counts(200_000, 2_000_000))[0]['traversal']['distinct_nodes'], 200_000)
        with self.assertRaises(Invalid): self.parse(counts(200_001, 2_000_000))

    def test_edge_duplicate_accounting_cannot_be_faked(self):
        for rows in (counts(2, 200_001, 200_001), counts(2, 200_001, 200_002),
                     counts(2, 200_001, 199_999), counts(0, 0, 0)):
            with self.assertRaises(Invalid): self.parse(rows)
        for column, bad in ((4, True), (5, 200_001.0), (6, -1)):
            rows = counts(2, 200_001); rows[7][column] = bad
            with self.assertRaises(Invalid): self.parse(rows)

    def test_other_limits_and_premise_checks_still_reject(self):
        rows = counts(2, 200_001)
        bad = copy.deepcopy(rows); bad[7][2] = ['Forbidden.late']
        with self.assertRaises(Invalid): self.parse(bad)
        bad = copy.deepcopy(rows); bad[6][7] = None
        with self.assertRaises(Invalid): self.parse(bad)
        for field, bound in (('DECL_LIMIT', 3), ('NODE_LIMIT', 1), ('WORK_LIMIT', 1),
                             ('LINE_BYTES', 16), ('ARTIFACT_BYTES', len(encoded(rows))-1)):
            with self.subTest(field=field), patch.object(audit, field, bound), self.assertRaises(Invalid):
                self.parse(rows)

    def test_producer_source_is_exact_old_source_with_only_edge_bound_changed(self):
        args = ('MathGKM.Neutral', ('Root', 'Interface'), ('Neutral.required',), ('MathGKM.Neutral',), NONCE)
        old = self.old_stream.program(*args)
        new = inspection_stream.program(*args)
        self.assertEqual(old.count('if edges >= 200000 then'), 1)
        self.assertEqual(new, old.replace('if edges >= 200000 then', 'if edges >= 2000000 then', 1))
        self.assertEqual(inspection_stream.PRELUDE, self.old_stream.PRELUDE)
        for fragment in ('info.type.getUsedConstants.toList', 'body.getUsedConstants.toList',
                         'deps := deps ++ v.ctors', 'if enqueued.contains dep then duplicates := duplicates+1',
                         'unless enqueued.contains n do fail "missing_required"',
                         'if todo.size >= 200000', 'if catalog.size >= 200000',
                         '(← get).decls >= 200000', 'if depth > 4096', 'if id >= 1000000'):
            self.assertIn(fragment, new)

    def test_program_reads_shared_fresh_attempt_edge_bound(self):
        with patch.object(audit, 'EDGE_LIMIT', 17):
            text = inspection_stream.program('Lean', ('Root',), (), (), NONCE)
        self.assertIn('if edges >= 17 then fail "dependency_edge_limit"', text)
        self.assertIn('if todo.size >= 200000 then fail "dependency_node_limit"', text)
        self.assertNotIn('deps.eraseDups', text)

    def test_fresh_feedback_uses_shared_cap_without_changing_other_caps(self):
        result = dict(controller_stage='trusted_premise_inspection',
                      trusted_inspector_failure='dependency_edge_limit')
        with patch.object(audit, 'EDGE_LIMIT', 37):
            diagnostic = own_feedback.diagnostic(result)
        self.assertEqual(diagnostic['measured']['limit_edges'], 37)
        self.assertEqual(diagnostic['mathematical_conclusion'], 'none')
        for category, key, bound in (('dependency_node_limit','limit_nodes',200_000),
                ('catalog_node_limit','limit_nodes',200_000),('expression_node_limit','limit_nodes',1_000_000)):
            self.assertEqual(own_feedback.diagnostic(dict(result,trusted_inspector_failure=category))['measured'][key], bound)

    def test_prepared_actual_controls_refuse_execution_without_quiescent_authorization(self):
        import os
        path = CONTROL_HOME/'neutral_producer_controls.py'
        spec = importlib.util.spec_from_file_location('capacity_prepared_only', path)
        module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
        with patch.dict(os.environ, {'GKM_CAPACITY_QUIESCENT':'not-authorized'}), self.assertRaisesRegex(RuntimeError, 'quiescence'):
            module.ActualNeutralProducerControls.setUpClass()

    def test_published_baselines_work_without_disposable_stage(self):
        path = CONTROL_HOME/'neutral_producer_controls.py'
        spec = importlib.util.spec_from_file_location('capacity_portable_baseline',path)
        module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
        with tempfile.TemporaryDirectory() as tmp, patch.object(module,'OVERLAY',None), patch.object(module,'HOME',Path(tmp)):
            for filename,expected in BASELINE_HASHES.items():
                resolved = module.baseline_path(filename)
                self.assertEqual(resolved,LIVE_ROOT/'evidence/concept-driver-source-20261020/source/machinery'/filename)
                self.assertEqual(sha(resolved),expected)

    def test_repo_paths_validate_explicit_root_cwd_and_installed_fixture_layout(self):
        spec = importlib.util.spec_from_file_location('capacity_portable_paths',CONTROL_HOME/'run_pure_capacity_tests.py')
        runner = importlib.util.module_from_spec(spec); spec.loader.exec_module(runner)
        with patch.dict(os.environ,{'MATH_GKM_CAPACITY_REPO':str(LIVE_ROOT)}):
            self.assertEqual(runner.resolve_repo(),LIVE_ROOT)
        with tempfile.TemporaryDirectory() as tmp, patch.dict(os.environ,{'MATH_GKM_CAPACITY_REPO':tmp}):
            with self.assertRaises(RuntimeError): runner.resolve_repo()
        environment = dict(os.environ); environment.pop('MATH_GKM_CAPACITY_REPO',None)
        with patch.dict(os.environ,environment,clear=True),patch.object(runner.os,'getcwd',return_value=str(LIVE_ROOT)):
            self.assertEqual(runner.resolve_repo(),LIVE_ROOT)
        # This is the final published relative layout; no disposable-stage path is encoded.
        with tempfile.TemporaryDirectory() as tmp:
            destination = Path(tmp)/'tests/inspection_capacity'
            (destination/'controls/MathGKM').mkdir(parents=True)
            source = CONTROL_HOME/'controls/MathGKM/InspectionCapacityNeutral.lean'
            target = destination/'controls/MathGKM/InspectionCapacityNeutral.lean'
            target.write_bytes(source.read_bytes())
            self.assertEqual(sha(target),sha(source))
            text = (CONTROL_HOME/'neutral_producer_controls.py').read_text()
            self.assertNotIn('/Users/sasha',text)
            self.assertNotIn('math-gkm-inspection-capacity-',text)
            relocated = destination/'neutral_producer_controls.py'; relocated.write_text(text)
            spec = importlib.util.spec_from_file_location('capacity_relocated_producer',relocated)
            module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
            self.assertEqual(module.HOME,destination)
            self.assertTrue((module.HOME/'controls/MathGKM/InspectionCapacityNeutral.lean').is_file())
            with patch.object(module,'OVERLAY',None):
                for filename in BASELINE_HASHES: self.assertTrue(module.baseline_path(filename).is_file())

    def test_historical_recorded_diagnostic_is_retained_not_relabeled(self):
        with tempfile.TemporaryDirectory() as tmp:
            workspace = Path(tmp)
            historical = dict(checked=False, controller_stage='trusted_premise_inspection',
                controller_diagnostic=dict(schema=own_feedback.SCHEMA,
                    stage='trusted_premise_inspection', category='dependency_edge_limit',
                    measured={'limit_edges':200_000}, mathematical_conclusion='none'))
            before = copy.deepcopy(historical); state = {}
            retained = own_feedback.retain(state, workspace, historical,
                kind='mathematical_claims', proposal_hash='b'*64)
            self.assertEqual(historical, before)
            self.assertEqual(retained['diagnostic']['measured']['limit_edges'], 200_000)
            self.assertFalse(retained['checked'])


class CompletionBindings(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.base = Path(self.temp.name)
        self.directory = self.base/'validation'
        source = self.directory/'source'; source.mkdir(parents=True)
        raw = encoded(counts(2, 200_001))
        self.path = source/'declarations.json'; self.path.write_bytes(raw)
        self.process = completed(raw)
        parsed = audit.parse_artifact(self.process, ('Root','Interface'), self.path, nonce=NONCE)
        (source/'Inspector.lean').write_text(inspection_stream.program('Lean', ('Root',), (), (), NONCE))
        (self.base/'binary').write_bytes(b'neutral nonexecutable identity')
        (self.base/'pin').write_bytes(b'neutral pinned input')
        result = dict(checked=True, finished=1, inspection_schema=audit.SCHEMA,
            declarations=parsed, producer_completion=parsed[0]['producer_completion'],
            declaration_artifact_sha256=sha(self.path),
            binary_hashes={str(self.base/'binary'):sha(self.base/'binary')},
            pin_hashes={'pin':sha(self.base/'pin')},
            checks=[dict(operation='trusted_premise_inspection',**self.process)])
        write(self.directory/'result.json', result)
        self.task = {'id':'neutral synthetic fixture'}; self.solution = {'term':'not executed'}
        receipts.finish(self.directory, self.task, self.solution, ())

    def reuse(self):
        with patch.object(receipts, 'ROOT', self.base):
            return receipts.reuse(self.directory, self.task, self.solution, ())

    def test_complete_new_cap_stream_can_be_finished_and_exactly_reused(self):
        self.assertTrue(self.reuse()['checked'])

    def test_nonce_and_same_size_stream_hash_are_still_required(self):
        with self.assertRaises(Invalid):
            audit.parse_artifact(self.process, ('Root','Interface'), self.path, nonce='c'*64)
        raw = self.path.read_bytes(); changed = raw.replace(b'"nat",[0]',b'"nat",[1]',1)
        self.assertEqual(len(raw), len(changed)); self.assertNotEqual(raw, changed)
        self.path.write_bytes(changed)
        with self.assertRaises(Invalid): audit.parse_artifact(self.process, ('Root','Interface'), self.path, nonce=NONCE)
        with self.assertRaises(Invalid): self.reuse()

    def test_original_inspector_source_is_still_finished_bound(self):
        source = self.directory/'source/Inspector.lean'
        source.write_text(source.read_text()+'\n-- altered source\n')
        with self.assertRaises(Invalid): self.reuse()

    def test_missing_or_rebound_finished_marker_is_never_reusable(self):
        marker = self.directory/'FINISHED.json'; saved = marker.read_bytes()
        marker.unlink()
        with self.assertRaises(receipts.UnfinishedReceipt): self.reuse()
        marker.write_bytes(saved)
        value = json.loads(saved); value['files_binding'] = '0'*64; write(marker,value)
        with self.assertRaises(Invalid): self.reuse()

    def test_exact_task_required_constants_binary_and_pin_bindings_remain(self):
        with self.assertRaises(Invalid):
            receipts.reuse(self.directory, {'changed':True}, self.solution, ())
        with self.assertRaises(Invalid):
            receipts.reuse(self.directory, self.task, self.solution, ('Missing.required',))
        for name in ('binary','pin'):
            path = self.base/name; saved = path.read_bytes(); path.write_bytes(saved+b' changed')
            with self.assertRaises(Invalid): self.reuse()
            path.write_bytes(saved)
