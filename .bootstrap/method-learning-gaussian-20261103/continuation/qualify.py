"""Execute the neutral continuation controls against exact source hashes."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile
import time

ROOT = Path('/Users/sasha/math_gkm')
HERE = Path(__file__).resolve().parent
SUITES = ('test_epoch.py', 'test_epoch_adversarial.py', 'test_owner.py',
          'test_finalize.py', 'test_status_public.py')

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def sources():
    result = {p.name: sha(p) for p in sorted(HERE.glob('*.py'))}
    result['../status_public.py'] = sha(HERE.parent/'status_public.py')
    return result

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, default=HERE/'TEST_EXECUTION.json')
    args=parser.parse_args()
    before=sources(); records=[]; passed=True
    environment={**os.environ, 'PYTHONDONTWRITEBYTECODE':'1', 'PYTHONPATH':str(ROOT)}
    for name in SUITES:
        started=time.monotonic()
        error=None
        with tempfile.TemporaryFile(mode='w+b') as log:
            try:
                code=subprocess.run([sys.executable, str(HERE/name), '-q'], cwd=ROOT,
                    env=environment, stdin=subprocess.DEVNULL, stdout=log,
                    stderr=subprocess.STDOUT, timeout=300).returncode
            except (subprocess.TimeoutExpired, OSError) as exc:
                code=None; error=type(exc).__name__
            log.seek(0,2); size=log.tell(); log.seek(max(0,size-32768))
            tail=log.read().decode('utf-8', errors='replace')
        match=re.search(r'Ran (\d+) tests?',tail)
        count=int(match.group(1)) if match else None
        records.append({'suite':name,'returncode':code,'test_count':count,
            'elapsed_seconds':time.monotonic()-started,'output_tail':tail,'error':error})
        print(name, code, count, flush=True)
        if code!=0 or count is None:
            passed=False
            break
    unchanged=sources()==before
    passed=passed and unchanged and len(records)==len(SUITES)
    result={'schema':'math-gkm.gaussian-continuation-tests.v1',
        'passed':passed, 'source_unchanged_during_tests':unchanged,
        'sources':before,'finished_at':time.time(),'suites':records,
        'test_count':sum(r['test_count'] or 0 for r in records),
        'scope':'Neutral synthetic continuation/finalization controls; no new mathematical proof or comparative result.'}
    output=args.output; output.parent.mkdir(parents=True,exist_ok=True)
    temporary=output.with_name(output.name+'.next')
    temporary.write_text(json.dumps(result,sort_keys=True,indent=2)+'\n')
    os.replace(temporary,output)
    return 0 if passed else 1

if __name__=='__main__':
    raise SystemExit(main())
