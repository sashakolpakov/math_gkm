"""Public counters only; never decode research or evaluator payloads."""
import hashlib
import importlib.util
import json
import re
from pathlib import Path
import time
ROOT = Path('/Users/sasha/math_gkm')
STUDY = ROOT/'.scratch/studies/method-learning-gaussian-20261103'
PARSER = ROOT/'.bootstrap/gaussian-native-operator-20261031/public_json_projection.py'
PARSER_SHA = '5743cd057c51ad91066b4f88e8cadb70808f6448bcbe3989a6d6a4640df251ec'

def public_metadata(path):
    # These are newly created, typed PUBLIC owner metadata only.
    if path.is_symlink() or not path.is_file() or path.stat().st_size > 1024**2:
        raise RuntimeError('invalid public goal-owner metadata')
    value = json.loads(path.read_text())
    if not isinstance(value, dict):
        raise RuntimeError('public goal-owner metadata is not an object')
    return value


def selected_study():
    base = ROOT/'.bootstrap/method-learning-gaussian-20261103/continuation'
    pointer = base/'CURRENT.json'
    if not pointer.exists():
        return STUDY, None
    qualified = public_metadata(base/'QUALIFIED.json')
    current = public_metadata(pointer)
    if (current.get('schema') != 'math-gkm.gaussian-goal-current.v1' or
            qualified.get('schema') != 'math-gkm.gaussian-goal-qualified.v1' or
            qualified.get('owner_source_sha256') != hashlib.sha256((base/'owner.py').read_bytes()).hexdigest() or
            qualified.get('epoch_source_sha256') != hashlib.sha256((base/'epoch.py').read_bytes()).hexdigest() or
            current.get('owner_source_sha256') != qualified['owner_source_sha256'] or
            current.get('contract_sha256') != qualified.get('contract_sha256') or
            type(current.get('epoch')) is not int or current['epoch'] < 0 or
            not isinstance(current.get('current_study'), str)):
        raise RuntimeError('goal-owner pointer qualification changed')
    target = Path(current['current_study'])
    parent = ROOT/'.scratch/studies'
    if (target.is_symlink() or not target.is_absolute() or
            target.resolve().parent != parent.resolve() or
            (target != STUDY and not re.fullmatch('method-learning-gaussian-20261103-epoch-[0-9]{4,}', target.name))):
        raise RuntimeError('goal-owner pointer escaped the Gaussian campaign')
    return target, {key: current.get(key) for key in
        ('epoch', 'phase', 'updated_at', 'root_proved')}


def main():
    assert hashlib.sha256(PARSER.read_bytes()).hexdigest() == PARSER_SHA
    spec = importlib.util.spec_from_file_location('method_public_projection', PARSER)
    e = importlib.util.module_from_spec(spec); spec.loader.exec_module(e)
    study, owner = selected_study()
    result = {'observed_at': time.time(), 'study': str(study),
              'original_study': str(STUDY), 'goal_owner': owner,
              'file_observation_only': True, 'arms': {}}
    for mode in ('baseline', 'exploration'):
        path = study/'arms'/mode/'state.json'
        if not path.exists():
            result['arms'][mode] = {'status': 'not_frozen'}
            continue
        assert path.is_file() and not path.is_symlink() and path.stat().st_size <= 32*1024**2
        envelope = e.fields(path.read_bytes().strip())
        body = envelope['state']
        assert e.select(envelope, ('sha256',))['sha256'] == hashlib.sha256(body).hexdigest()
        fields = e.fields(body)
        public = e.select(fields, ('round','phase','status','calls','meta_calls','seconds','failures','policy_trials'))
        for name in ('active', 'active_intent', 'resolution'):
            public[name+'_is_null'] = fields.get(name, b'null') == b'null'
        research = e.fields(fields['research'])
        public['knowledge_count'] = len(e.fields(research.get('knowledge', b'{}')))
        public['component_count'] = len(e.fields(research.get('components', b'{}')))
        public['source_state_sha256'] = hashlib.sha256(body).hexdigest()
        public['state_file_modified_at'] = path.stat().st_mtime
        result['arms'][mode] = public
    print(json.dumps(result, sort_keys=True))

if __name__ == '__main__':
    main()
