"""Synthetic alias-format regressions; no model, compiler or native process.

Uses normal repository imports, synthetic values and an isolated temporary
directory. No operational helper, study state or actual request fixture is read.
"""
import copy
import json
from pathlib import Path
import tempfile
import unittest

from machinery import study_context as ctx, study_policy as policy
from machinery.study_common import canonical, digest, sha


LIBRARIES = ('knowledge', 'components', 'reuse_interfaces')


def record(size=26000):
    task = {
        'statement': '∀ n : Nat, n = n\n/- SYNTHETIC English explanation: ' + 'α'*size + ' -/',
        'hypotheses': ['n : Nat', 'h : n = n'],
        'interface_type': 'True', 'transport_type': '∀ n : Nat, n = n',
        'english_scope': 'Synthetic identity for every natural n, including zero.',
        'required_constants': ['MathGKM.Neutral.identity'],
        'context_sources': {'MathGKM/Neutral.lean': 'b'*64},
        'future_typed_condition': {'domain': 'Nat', 'premises': ['n = n']},
    }
    return {
        'claim': {key: copy.deepcopy(task[key]) for key in ('statement', 'hypotheses')},
        'task': task, 'source_files': {'MathGKM/Neutral.lean': 'a'*64},
        'exports': ['MathGKM.Neutral.identity'], 'export_module': 'MathGKM.Neutral',
        'dependencies': [], 'receipt_hash': 'c'*64,
        'proposal': {}, 'solution': {}, 'validation_bundle': {}, 'used_declarations': [],
    }


def resolve(value, pointer):
    for token in pointer[1:].split('/'):
        token = token.replace('~1', '/').replace('~0', '~')
        value = value[int(token)] if isinstance(value, list) else value[token]
    return value


def generated_file_references(view):
    for field in LIBRARIES:
        for item in view.get(field, {}).values():
            full = item['full_record']
            yield full
            for name in ('source_files', 'task.context_sources'):
                if name in full.get('deferred_fields', {}):
                    yield full['deferred_fields'][name]


class AliasLosslessness(unittest.TestCase):
    def test_large_claim_aliases_preserve_inline_types_and_exact_saved_request(self):
        request = {'role': 'researcher', **{field: {} for field in LIBRARIES},
                   'remaining_obligations': {'neutral': {'statement': '∀ n : Nat, n = n'}}}
        for index in range(20):
            field = LIBRARIES[index % len(LIBRARIES)]
            request[field][f'neutral/~漢字-{index}'] = record()
        original = copy.deepcopy(request)
        self.assertGreater(len(policy.prompt(request)), 900000)
        with tempfile.TemporaryDirectory(prefix='gkm-alias-synthetic-') as directory:
            workspace = Path(directory).resolve()
            rendered = ctx.prepare_prompt(request, workspace, 'researcher', policy.prompt)
            view = json.loads(rendered.split('\nREQUEST:\n', 1)[1])
            self.assertEqual((ctx.PROMPT_CHAR_LIMIT, ctx.CONTEXT_BYTE_LIMIT), (900000, 16*1024**2))
            self.assertLessEqual(len(rendered), ctx.PROMPT_CHAR_LIMIT)
            header = view['own_context']; full = workspace/header['path']
            expected = (canonical(original)+'\n').encode('utf-8')
            self.assertLessEqual(len(expected), ctx.CONTEXT_BYTE_LIMIT)
            self.assertEqual(full.read_bytes(), expected)
            self.assertEqual(sha(full), header['sha256'])
            self.assertEqual(header['request_binding'], digest(original))
            self.assertEqual(full.stat().st_mode & 0o222, 0)
            self.assertEqual(view['remaining_obligations'], original['remaining_obligations'])
            self.assertEqual(len(header['transport_view']['exact_claim_aliases']), 20)
            for field in LIBRARIES:
                for identity, before in original[field].items():
                    item = view[field][identity]; alias = item['claim']['own_context_alias']
                    self.assertEqual(alias['schema'], 'math-gkm.own-request-exact-projection-alias.v1')
                    self.assertEqual(alias['projection_fields'], ['statement', 'hypotheses'])
                    self.assertEqual(alias['value_binding'], digest(before['claim']))
                    self.assertEqual((alias['path'], alias['sha256']), (header['path'], header['sha256']))
                    self.assertIn('~1', alias['json_pointer']); self.assertIn('~0', alias['json_pointer'])
                    self.assertEqual(resolve(original, alias['json_pointer']), before['claim'])
                    inline = resolve(view, alias['inline_json_pointer'])
                    restored = {key: inline[key] for key in alias['projection_fields']}
                    self.assertEqual(canonical(restored), canonical(before['claim']))
                    self.assertEqual(item['task'], {key: value for key, value in before['task'].items()
                                                    if key != 'context_sources'})
                    for name in ('exports', 'export_module', 'dependencies', 'receipt_hash'):
                        self.assertEqual(item[name], before[name])
                    for ref in item['full_record']['deferred_fields'].values():
                        self.assertEqual(ref['value_binding'], digest(resolve(original, ref['json_pointer'])))
            self.assertTrue(all(ref.get('own_context_file') is True for ref in generated_file_references(view)))
            self.assertEqual(ctx.prepare_prompt(request, workspace, 'researcher', policy.prompt), rendered)
        self.assertEqual(request, original)

    def test_claims_with_extra_meaning_or_canonically_different_conditions_stay_literal(self):
        for variant in ('extra_english', 'bool_int', 'displayed_task'):
            with self.subTest(variant=variant):
                item = record(3000)
                if variant == 'extra_english':
                    item['claim']['english_scope'] = 'This extra condition must stay literal.'
                if variant == 'bool_int':
                    item['claim']['hypotheses'] = [True]; item['task']['hypotheses'] = [1]
                    self.assertEqual(item['claim']['hypotheses'], item['task']['hypotheses'])
                request = {'knowledge': {'neutral/~id': item}}
                view = copy.deepcopy(request)
                view['own_context'] = {'transport_view': {'interpretation': 'Synthetic metadata.'}}
                if variant == 'displayed_task':
                    view['knowledge']['neutral/~id']['task']['statement'] += ' DISPLAYED VARIANT'
                before = copy.deepcopy(view); original = copy.deepcopy(request)
                ctx._compact_exact_claim_aliases(view, request, 'history/context/synthetic.json', 'd'*64)
                self.assertEqual(canonical(view), canonical(before))
                self.assertEqual(request, original)

    def test_file_header_defaults_roundtrip_only_generated_reference_positions(self):
        path = 'history/context/' + 'a'*64 + '.json'; pin = 'b'*64
        view = {'own_context': {'path': path, 'sha256': pin,
                               'transport_view': {'interpretation': 'Synthetic metadata.'}}}
        for field in LIBRARIES:
            identity = 'neutral/~漢字'; item = record(0)
            pointer = '/' + field + '/neutral~1~0漢字'
            def reference(suffix='', binding='record_binding'):
                return {'path': path, 'sha256': pin, 'json_pointer': pointer+suffix,
                        binding: digest([field, suffix]), 'extra_metadata': ['keep', True, 1]}
            full = reference()
            full['deferred_fields'] = {'source_files': reference('/source_files', 'value_binding'),
                'task.context_sources': reference('/task/context_sources', 'value_binding'),
                'unknown_position': reference('/unknown', 'value_binding')}
            item['full_record'] = full; item['unrelated_reference'] = reference()
            view[field] = {identity: item}
        before = copy.deepcopy(view)
        ctx._compact_context_file_references(view)
        self.assertLess(len(canonical(view)), len(canonical(before)))
        self.assertEqual(view['own_context']['transport_view']['file_reference_defaults'],
                         'math-gkm.own-context-file-reference-defaults.v1')
        restored = copy.deepcopy(view)
        for ref in generated_file_references(restored):
            self.assertIs(ref.pop('own_context_file'), True)
            self.assertNotIn('path', ref); self.assertNotIn('sha256', ref)
            ref.update(path=path, sha256=pin)
        for field in LIBRARIES:
            self.assertEqual(canonical(restored[field]), canonical(before[field]))
        once = copy.deepcopy(view)
        ctx._compact_context_file_references(view)
        self.assertEqual(view, once)


if __name__ == '__main__':
    unittest.main()
