"""Bounded neutral validation with exact-byte pre/post checks and durable logs."""
import json
import os
from pathlib import Path
import sys
import time
if not __package__:
    sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from machinery.study_common import sha
from machinery.process import run

root = Path.cwd()
checkpoint, label, *tests = sys.argv[1:]
manifest_path = root/'evidence/neutral-validation'/checkpoint/'SOURCE_MANIFEST.json'
manifest = json.loads(manifest_path.read_text())
def mismatches():
    return [p for p,h in manifest['files_sha256'].items()
            if sha(root/p) != h]
if mismatches():
    raise SystemExit('source changed before execution: '+repr(mismatches()))
command = ['/opt/homebrew/bin/python3', '-m', 'unittest', '-v', *tests]
out = root/'evidence/neutral-validation'
log = out/(label+'.log')
start = time.time()
result=run(command,cwd=root,timeout=720,output_bytes=8*1024**2,tree_only=True,
    scope=root/'.scratch',log_path=log,env={**os.environ,'TMPDIR':str(root/'.scratch'),
        'PATH':'/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin','PYTHONDONTWRITEBYTECODE':'1'})
code=124 if result.get('termination') else result['returncode']
record = {'command': command, 'started': start, 'elapsed_seconds': time.time()-start,
    'returncode': code, 'termination':result.get('termination'),'resources':result.get('resources'),
    'manifest_sha256': sha(manifest_path),
    'source_mismatches_after': mismatches(), 'log': str(log.relative_to(root)),
    'log_sha256': sha(log) if log.exists() else None,
    'scope': 'neutral tests; deterministic roles explicitly fixtures; no live model or Markov research'}
(out/(label+'.json')).write_text(json.dumps(record, indent=2)+'\n')
print(json.dumps(record), flush=True)
sys.exit(code if code else bool(record['source_mismatches_after']))
