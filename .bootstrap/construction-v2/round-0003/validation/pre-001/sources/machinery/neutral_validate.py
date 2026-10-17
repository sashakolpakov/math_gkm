"""Bounded neutral validation with exact-byte pre/post checks and durable logs."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import time

root = Path.cwd()
checkpoint, label, *tests = sys.argv[1:]
manifest_path = root/'evidence/neutral-validation'/checkpoint/'SOURCE_MANIFEST.json'
manifest = json.loads(manifest_path.read_text())
def mismatches():
    return [p for p,h in manifest['files_sha256'].items()
            if hashlib.sha256((root/p).read_bytes()).hexdigest() != h]
if mismatches():
    raise SystemExit('source changed before execution: '+repr(mismatches()))
command = ['/opt/homebrew/bin/python3', '-m', 'unittest', '-v', *tests]
out = root/'evidence/neutral-validation'
log = out/(label+'.log')
start = time.time()
with log.open('x') as handle:
    handle.write('COMMAND '+json.dumps(command)+'\nMANIFEST '+str(manifest_path)+'\n')
    handle.flush()
    try:
        result = subprocess.run(command, stdout=handle, stderr=subprocess.STDOUT,
            cwd=root, timeout=720, env={**__import__('os').environ, 'TMPDIR': str(root/'.scratch'),
                                      'PYTHONDONTWRITEBYTECODE': '1'})
        code = result.returncode
    except subprocess.TimeoutExpired:
        code = 124
record = {'command': command, 'started': start, 'elapsed_seconds': time.time()-start,
    'returncode': code, 'manifest_sha256': hashlib.sha256(manifest_path.read_bytes()).hexdigest(),
    'source_mismatches_after': mismatches(), 'log': str(log.relative_to(root)),
    'log_sha256': hashlib.sha256(log.read_bytes()).hexdigest(),
    'scope': 'neutral tests; deterministic roles explicitly fixtures; no live model or Markov research'}
(out/(label+'.json')).write_text(json.dumps(record, indent=2)+'\n')
print(json.dumps(record), flush=True)
sys.exit(code if code else bool(record['source_mismatches_after']))
