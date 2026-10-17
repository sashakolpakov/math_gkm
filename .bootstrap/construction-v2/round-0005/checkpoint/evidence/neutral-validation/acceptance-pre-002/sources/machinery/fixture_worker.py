"""EXPLICIT DETERMINISTIC TRANSPORT FIXTURE. No mathematical discovery or LLM."""
import json
from pathlib import Path
import sys
import time
from .engine import atomic


def main():
    directory = Path(sys.argv[1])
    request = json.loads((directory/'request.json').read_text())
    mode = request.get('fixture_mode', 'feedback')
    if mode == 'timeout':
        time.sleep(request['seconds']+5)
    if mode == 'missing':
        return
    if mode == 'malformed':
        (directory/'final.json').write_text('{broken')
        return
    if mode == 'killed':
        sys.exit(9)
    previous = request['feedback']
    report = {'request_id': request['id'],
        'summary': 'EXPLICIT FIXTURE: observed '+str(len(previous))+' previous observations',
        'agenda': ['fixture next decision after '+(previous[-1]['outcome'] if previous else 'initial state')],
        'actions': ['fixture observation only'],
        'observations': ['fixture result 17' if not previous else 'feedback consumed: '+previous[-1]['request_id']],
        'completion': None}
    if mode == 'false_completion':
        report['completion'] = {'kind': 'proof', 'module': 'MathGKM.MarkovExamples',
            'declaration': 'True.intro', 'correspondence': 'A finite scan supposedly solves everything.'}
    atomic(directory/'final.json', report)
    print(json.dumps({'type': 'turn.completed', 'usage': {'input_tokens': 10, 'output_tokens': 5},
                      'fixture': True}), flush=True)


if __name__ == '__main__':
    main()
