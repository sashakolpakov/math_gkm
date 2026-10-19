"""Pure synthetic protocol wiring; no processes, models or proof verification."""
import ast
import copy
import hashlib
import json
from pathlib import Path
import tempfile
import types
import unittest
from unittest.mock import Mock, patch
from contextlib import ExitStack

from machinery import adapter_protocol as ap
from machinery import study, study_worker as worker, study_transfer as transfer
from machinery.study_common import read, write

ROOT = Path(__file__).resolve().parents[1]
IDS = ['task_alpha', 'task_beta']
ENTRY = dict(module='Opaque.Proposal', term='  opaque proposal α\n\t',
             interface_term='opaque interface\r\n', transport_term='opaque transport \\ " ')
TASKS = [dict(id=i, hypotheses=['opaque hypothesis'], context_sources={'opaque': 'context'},
              context_modules=['Opaque.Context']) for i in IDS]


class ProtocolTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(dir=ROOT/'.scratch/protocol016')
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)

    def proposal(self):
        return {'solutions': {i: copy.deepcopy(ENTRY) for i in IDS}}

    def envelope(self, value):
        return json.dumps(dict(request_id='synthetic', payload_json=(value if isinstance(value, str)
                           else json.dumps(value, ensure_ascii=False)))).encode()

    def consume(self, payload, tasks=TASKS):
        arm = types.SimpleNamespace(p={'validation_seconds': 1, 'transport': 'fixture'},
                                    reserve=Mock(), stopped=lambda: False)
        checker = Mock(return_value={'checked': False, 'status': 'synthetic_unverified'})
        with patch.object(transfer, 'check_task', checker):
            result = transfer.adapter_checks(arm, {'outcome': 'completed', 'payload': payload},
                tasks, tasks, self.root, 'before', self.root, 'synthetic', {}, {'files': {}},
                {'files': {}}, {'files': {}})
        return result, checker

    def worker_receipt(self, value, role='adapter', tasks=TASKS):
        spec = dict(request_id='synthetic', role=role, workspace=str(self.root), transport='fixture',
                    model='gpt-6.1-sol', output_bytes=65536, stop=str(self.root/'STOP'), seconds=1,
                    usage_semantics='synthetic')
        write(self.root/'spec.json', spec)
        write(self.root/'request.json', {'tasks': tasks})
        raw = self.envelope(value)
        (self.root/'final.json').write_bytes(raw)
        (self.root/'prompt.txt').write_text('opaque synthetic prompt')
        process = Mock(returncode=0, pid=123)
        guard = Mock()
        guard.receipt.return_value = {'monitor': 'synthetic stub'}
        with ExitStack() as stack:
            for name, replacement in [('inventory', Mock(return_value={})),
                ('command', Mock(return_value=[])), ('Guard', Mock(return_value=guard)),
                ('child_exited', Mock(return_value=True)), ('cleanup_private_group', Mock()),
                ('events', Mock(return_value=[]))]:
                stack.enter_context(patch.object(worker, name, replacement))
            stack.enter_context(patch.object(worker.subprocess, 'Popen', return_value=process))
            stack.enter_context(patch.object(worker.selectors, 'DefaultSelector'))
            stack.enter_context(patch.object(worker.os, 'set_blocking'))
            stack.enter_context(patch.object(worker.os, 'read', return_value=b''))
            stack.enter_context(patch.object(worker.signal, 'getsignal', return_value=worker.signal.SIG_DFL))
            worker._execute(self.root, None)
        self.assertEqual((self.root/'final.json').read_bytes(), raw)
        return read(self.root/'receipt.json'), raw

    def test_actual_prompt_worker_receipt_consumer(self):
        # Evaluate the actual write_text argument used by Arm.call; no controller is run.
        tree = ast.parse((ROOT/'machinery/study.py').read_text())
        call = next(n for n in ast.walk(tree) if isinstance(n, ast.Call)
                    and isinstance(n.func, ast.Attribute) and n.func.attr == 'write_text'
                    and "prompt.txt" in ast.unparse(n.func))
        expr = compile(ast.Expression(call.args[0]), '<actual prompt>', 'eval')
        req = dict(request_id='synthetic', tasks=TASKS)
        prompt = eval(expr, dict(role='adapter', prompt_req=req, policy=study.policy,
                                canonical=study.canonical))
        for text in ('request_id', 'payload_json', '{"solutions":', 'interface_term', 'transport_term',
                     'bounded_non_solution', 'nonempty'):
            self.assertIn(text, prompt)
        for role in ('proposer', 'researcher', 'reviewer', 'selector'):
            self.assertEqual(eval(expr, dict(role=role, prompt_req=req, prompt=lambda r: 'unchanged')),
                             'unchanged')
        for direct in (False, True):
            with self.subTest(direct=direct):
                value = self.proposal()
                if direct:
                    value = value['solutions']
                receipt, raw = self.worker_receipt(value)
                self.assertEqual(receipt['outcome'], 'completed')
                provenance = receipt['adapter_protocol']
                self.assertEqual(provenance['input_shape'], 'legacy_direct' if direct else 'canonical')
                self.assertEqual(provenance['final_sha256'], hashlib.sha256(raw).hexdigest())
                inner = json.loads(raw)['payload_json'].encode()
                self.assertEqual(provenance['raw_sha256'], hashlib.sha256(inner).hexdigest())
                self.assertEqual(provenance['canonical_sha256'], hashlib.sha256(ap.encoded(self.proposal())).hexdigest())
                (checks, _, error), checker = self.consume(receipt['payload'])
                self.assertIsNone(error)
                self.assertEqual(checker.call_count, 2)
                for actual, original in zip(checker.call_args_list, TASKS):
                    self.assertIs(actual.args[1], original)
                    self.assertEqual(actual.args[2], ENTRY)
                    for key in ('term', 'interface_term', 'transport_term'):
                        self.assertEqual(actual.args[2][key].encode(), ENTRY[key].encode())
                self.assertFalse(any(c['checked'] for c in checks))
                # Each invocation gets fresh synthetic journals, never a replay.
                for journal in (self.root/'reservations').glob('*.json'):
                    journal.unlink()

    def test_direct_dictionary_and_declines(self):
        for direct in (False, True):
            value = self.proposal()
            value['solutions'][IDS[0]] = {'status': 'bounded_non_solution', 'reason': 'opaque decline'}
            expected = copy.deepcopy(value)
            if direct:
                value = value['solutions']
            canonical, provenance = ap.normalize(value, IDS)
            self.assertEqual(canonical, expected)
            self.assertEqual(provenance['raw_encoding'], 'canonical_dictionary')
            receipt, _ = self.worker_receipt(value)
            self.assertEqual(receipt['outcome'], 'completed')
            self.assertEqual(receipt['payload'], expected)
            (_, _, error), checker = self.consume(value)
            self.assertIsNone(error)
            self.assertEqual(checker.call_args_list[0].args[2], expected['solutions'][IDS[0]])
            for journal in (self.root/'reservations').glob('*.json'):
                journal.unlink()

    def test_invalid_shapes_never_call_checker(self):
        bad = [None, [], '[]', {}, {'solutions': None}, {'solutions': []},
               {'solutions': {}, IDS[0]: ENTRY}, {IDS[0]: ENTRY},
               {'solutions': {**self.proposal()['solutions'], 'opaque_unknown': ENTRY}}]
        for entry in (None, [], 'opaque', {}, {'module': 'Opaque.Proposal'},
                      {**ENTRY, 'extra': 'opaque'}, {**ENTRY, 'module': '../Opaque'},
                      {**ENTRY, 'module': 'Opaque..Proposal'}, {**ENTRY, 'module': 1},
                      {**ENTRY, 'term': ''}, {**ENTRY, 'interface_term': ' '},
                      {**ENTRY, 'transport_term': False},
                      {'status': 'bounded_non_solution'}, {'status': 'other', 'reason': 'opaque'},
                      {'status': 'bounded_non_solution', 'reason': ''},
                      {'status': 'bounded_non_solution', 'reason': []},
                      {'status': 'bounded_non_solution', 'reason': 'opaque', **ENTRY}):
            value = self.proposal()
            value['solutions'][IDS[0]] = entry
            bad.extend([value, value['solutions']])
        for value in bad:
            with self.subTest(value_type=type(value).__name__):
                (_, _, error), checker = self.consume(value)
                self.assertIsNotNone(error)
                checker.assert_not_called()
                self.assertLess(len(error), 64)
                self.assertNotIn('task_alpha', error)
                self.assertNotIn('opaque', error)

    def test_duplicates_envelope_and_bounded_errors(self):
        duplicate_inner = '{"solutions":{},"solutions":{}}'
        duplicate_entry = '{"task_alpha":{"module":"Opaque","module":"Opaque"},"task_beta":{}}'
        for raw in (self.envelope(duplicate_inner), self.envelope(duplicate_entry),
                    b'{"request_id":"synthetic","request_id":"synthetic","payload_json":"{}"}',
                    b'[]', b'{}', b'{"request_id":"synthetic","payload_json":{}}',
                    b'{"request_id":"other","payload_json":"{}"}', self.envelope('NaN'),
                    self.envelope('{'), self.envelope({'solutions': {}, 'extra': None})):
            with self.assertRaises(ap.AdapterProtocolError) as ctx:
                ap.decode_final(raw, 'synthetic', IDS)
            self.assertLess(len(str(ctx.exception)), 90)
        with self.assertRaises(ap.AdapterProtocolError) as ctx:
            ap.normalize(self.proposal(), [IDS[0], IDS[0]])
        self.assertEqual(ctx.exception.code, 'duplicate_expected_ids')
        (_, _, error), checker = self.consume(self.proposal(), [TASKS[0], TASKS[0]])
        self.assertEqual(error, 'duplicate_expected_ids')
        checker.assert_not_called()
        for receipt, tasks in ((None, TASKS), ({}, None), ({}, [{}])):
            with self.assertRaises(ap.AdapterProtocolError):
                ap.intake(receipt, tasks)
        receipt, _ = self.worker_receipt(duplicate_inner)
        self.assertIn('adapter_protocol:duplicate_json_key', receipt['outcome'])
        self.assertIsNone(receipt['payload'])

    def test_solutions_task_id_forms_and_provenance(self):
        for ids in (['solutions'], ['task_alpha', 'solutions']):
            tasks = [dict(TASKS[0], id=i) for i in ids]
            for direct in (False, True):
                for decline in (False, True):
                    canonical = {'solutions': {i: copy.deepcopy(ENTRY) for i in ids}}
                    if decline:
                        canonical['solutions']['solutions'] = {
                            'status': 'bounded_non_solution', 'reason': '  opaque decline α\n'}
                    value = canonical['solutions'] if direct else canonical
                    for intake in (value, json.dumps(value, ensure_ascii=False),
                                   json.dumps(value, ensure_ascii=False).encode()):
                        with self.subTest(ids=ids, direct=direct, decline=decline,
                                          kind=type(intake).__name__):
                            actual, provenance = ap.normalize(intake, ids)
                            self.assertEqual(actual, canonical)
                            self.assertEqual(provenance['input_shape'],
                                             'legacy_direct' if direct else 'canonical')
                            raw = (ap.encoded(value) if type(intake) is dict else
                                   intake.encode() if type(intake) is str else intake)
                            self.assertEqual(provenance['raw_sha256'], hashlib.sha256(raw).hexdigest())
                            self.assertEqual(provenance['canonical_sha256'],
                                             hashlib.sha256(ap.encoded(canonical)).hexdigest())
                    receipt, raw = self.worker_receipt(value, tasks=tasks)
                    self.assertEqual(receipt['outcome'], 'completed')
                    self.assertEqual(receipt['payload'], canonical)
                    self.assertEqual(receipt['adapter_protocol']['input_shape'],
                                     'legacy_direct' if direct else 'canonical')
                    self.assertEqual(receipt['adapter_protocol']['final_sha256'],
                                     hashlib.sha256(raw).hexdigest())
                    for payload in (value, receipt['payload']):
                        (checks, _, error), checker = self.consume(payload, tasks)
                        self.assertIsNone(error)
                        self.assertEqual(checker.call_count, len(ids))
                        for call, task in zip(checker.call_args_list, tasks):
                            self.assertIs(call.args[1], task)
                            self.assertEqual(call.args[2], canonical['solutions'][task['id']])
                            for key, text in call.args[2].items():
                                self.assertEqual(text.encode(), canonical['solutions'][task['id']][key].encode())
                        self.assertFalse(any(c['checked'] for c in checks))
                        for journal in (self.root/'reservations').glob('*.json'):
                            journal.unlink()

    def test_solutions_task_id_invalid_forms_never_call_checker(self):
        entries = [None, [], 'opaque', {}, {'solutions': ENTRY, 'unknown': ENTRY},
                   {**ENTRY, 'term': False}, {**ENTRY, 'module': '../Opaque'},
                   {**ENTRY, 'extra': 'opaque'},
                   {'status': 'bounded_non_solution', 'reason': ' '},
                   {'status': 'bounded_non_solution', 'reason': []},
                   {'status': 'bounded_non_solution', 'reason': 'opaque', **ENTRY}]
        for ids in (['solutions'], ['task_alpha', 'solutions']):
            tasks = [dict(TASKS[0], id=i) for i in ids]
            good = {i: copy.deepcopy(ENTRY) for i in ids}
            bad = [None, [], {}, {'solutions': good, 'extra': ENTRY},
                   {'solutions': {**good, 'unknown': ENTRY}},
                   {**good, 'unknown': ENTRY}, {'solutions': {'task_alpha': ENTRY}}]
            for entry in entries:
                direct = {**good, 'solutions': entry}
                bad.extend([direct, {'solutions': direct}])
            if len(ids) > 1:
                bad.extend([{'solutions': ENTRY}, {'solutions': {'solutions': ENTRY}},
                            {'solutions': good, 'task_alpha': ENTRY}])
            for value in bad:
                for payload in (value, json.dumps(value)):
                    with self.subTest(ids=ids, value=value):
                        (_, _, error), checker = self.consume(payload, tasks)
                        self.assertIsNotNone(error)
                        checker.assert_not_called()
                        with self.assertRaises(ap.AdapterProtocolError):
                            ap.decode_final(self.envelope(payload), 'synthetic', ids)
            duplicate = '{"solutions":{},"solutions":{}}'
            with self.assertRaises(ap.AdapterProtocolError) as ctx:
                ap.decode_final(self.envelope(duplicate), 'synthetic', ids)
            self.assertEqual(ctx.exception.code, 'duplicate_json_key')

    def test_other_role_decoding_unchanged(self):
        receipt, _ = self.worker_receipt('{"opaque":1,"opaque":2}', role='reviewer')
        self.assertEqual(receipt['outcome'], 'completed')
        self.assertEqual(receipt['payload'], {'opaque': 2})
        self.assertNotIn('adapter_protocol', receipt)


if __name__ == '__main__':
    unittest.main()
