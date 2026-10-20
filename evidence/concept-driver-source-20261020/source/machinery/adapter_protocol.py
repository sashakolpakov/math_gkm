"""Adapter-only shape validation. Proof acceptance belongs to ordinary checks."""
import hashlib
import json
import re

LIMIT = 4 * 1024**2
MODULE = re.compile(r'[A-Za-z_][A-Za-z_0-9]*(?:\.[A-Za-z_][A-Za-z_0-9]*)*\Z')


class AdapterProtocolError(ValueError):
    """Bounded diagnostic with no submitted content."""
    def __init__(self, code):
        self.code = code
        super().__init__('adapter_protocol:' + code)


def fail(code):
    raise AdapterProtocolError(code)


def pairs(items):
    result = {}
    for key, value in items:
        if key in result:
            fail('duplicate_json_key')
        result[key] = value
    return result


def constant(_):
    fail('invalid_json')


def encoded(value):
    try:
        raw = json.dumps(value, sort_keys=True, separators=(',', ':'),
                         ensure_ascii=False, allow_nan=False).encode('utf-8')
    except (ValueError, TypeError, UnicodeError, RecursionError):
        fail('invalid_json_value')
    if len(raw) > LIMIT:
        fail('input_too_large')
    return raw


def load(raw):
    try:
        if isinstance(raw, str):
            raw = raw.encode('utf-8')
        if not isinstance(raw, bytes):
            fail('invalid_serialized_type')
        if len(raw) > LIMIT:
            fail('input_too_large')
        return json.loads(raw, object_pairs_hook=pairs, parse_constant=constant)
    except (UnicodeError, ValueError, TypeError, RecursionError) as exc:
        if isinstance(exc, AdapterProtocolError):
            raise
        fail('invalid_json')


def expected_ids(ids):
    if not isinstance(ids, (list, tuple)) or any(type(i) is not str or not i for i in ids):
        fail('invalid_expected_ids')
    if len(set(ids)) != len(ids):
        fail('duplicate_expected_ids')
    return set(ids)


def validate_solutions(solutions, expected):
    """Validate a complete task map before choosing an intake form."""
    if type(solutions) is not dict:
        fail('solutions_object_required')
    if set(solutions) != expected:
        fail('task_ids_mismatch')
    for entry in solutions.values():
        if type(entry) is not dict:
            fail('entry_object_required')
        if 'status' in entry or 'reason' in entry:
            if (set(entry) != {'status', 'reason'} or entry.get('status') != 'bounded_non_solution'
                    or type(entry.get('reason')) is not str or not entry['reason'].strip()):
                fail('invalid_decline')
        else:
            if set(entry) != {'module', 'term', 'interface_term', 'transport_term'}:
                fail('invalid_proof_fields')
            if any(type(v) is not str or not v.strip() for v in entry.values()):
                fail('invalid_proof_strings')
            if not MODULE.fullmatch(entry['module']):
                fail('invalid_module')


def normalize(value, ids):
    """Validate serialized/dictionary intake without rewriting proof strings."""
    expected = expected_ids(ids)
    serialized = isinstance(value, (str, bytes))
    if serialized:
        parsed = load(value)
        raw = value.encode('utf-8') if isinstance(value, str) else value
        value = parsed
    else:
        raw = encoded(value)
    if type(value) is not dict:
        fail('object_required')
    candidates = []
    if set(value) == {'solutions'}:
        candidates.append((value['solutions'], 'canonical'))
    if set(value) == expected:
        candidates.append((value, 'legacy_direct'))
    valid, errors = [], []
    for solutions, shape in candidates:
        try:
            validate_solutions(solutions, expected)
        except AdapterProtocolError as exc:
            errors.append(exc.code)
        else:
            valid.append((solutions, shape))
    if len(valid) > 1:
        fail('ambiguous_shape')
    if not valid:
        fail(errors[0] if errors else
             ('mixed_wrapper_keys' if 'solutions' in value else 'task_ids_mismatch'))
    solutions, shape = valid[0]
    canonical = {'solutions': solutions}
    return canonical, {'schema': 'adapter-intake.v1', 'input_shape': shape,
        'raw_encoding': 'serialized' if serialized else 'canonical_dictionary',
        'raw_sha256': hashlib.sha256(raw).hexdigest(),
        'canonical_sha256': hashlib.sha256(encoded(canonical)).hexdigest()}


def decode_final(raw, request_id, ids):
    """Validate existing envelope, preserving the original final artifact."""
    final = load(raw)
    if (type(final) is not dict or set(final) != {'request_id', 'payload_json'}
            or type(final.get('request_id')) is not str
            or type(final.get('payload_json')) is not str):
        fail('invalid_envelope')
    if final['request_id'] != request_id:
        fail('request_mismatch')
    payload, provenance = normalize(final['payload_json'], ids)
    provenance['final_sha256'] = hashlib.sha256(raw).hexdigest()
    return payload, provenance


def intake(receipt, tasks):
    """Revalidate fixture/direct consumer dictionaries with the same contract."""
    if (type(receipt) is not dict or type(tasks) is not list
            or any(type(task) is not dict or 'id' not in task for task in tasks)):
        fail('invalid_intake')
    ids = [task['id'] for task in tasks]
    expected_ids(ids)
    if receipt.get('outcome') != 'completed':
        fail('report_unavailable')
    return normalize(receipt.get('payload'), ids)
