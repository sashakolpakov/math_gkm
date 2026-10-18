"""Bounded process-group runner with immutable logs and source drift checks.

Usage: python tools/run.py LABEL CAP COMMAND [ARGS...]
No shell, no hosted services. Run only explicitly selected neutral commands.
"""
from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import sys
import time

root = Path.cwd()
out = root/'evidence/neutral-validation/maintenance-path-sol-20261018'
label, cap, *argv = sys.argv[1:]
cap = int(cap)
if not label.replace('-', '').isalnum() or not 1 <= cap <= 900 or not argv:
    raise ValueError('simple label, 1..900 seconds, explicit argv required')
checkpoint = next(out/name/'manifest.json' for name in ('final', 'tooling-pretest', 'pretest')
                  if (out/name/'manifest.json').exists())
manifest = json.loads(checkpoint.read_text())
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
def unchanged():
    return all(sha(root/n) == h for n, h in manifest.items())
if not unchanged():
    raise RuntimeError('source changed since pretest checkpoint')
env = {**os.environ, 'PATH': '/opt/homebrew/bin:'+str(Path.home()/'.elan/bin')+':/usr/bin:/bin:/usr/sbin:/sbin',
       'GIT_CONFIG_NOSYSTEM': '1', 'GIT_CONFIG_GLOBAL': '/dev/null', 'TMPDIR': str(root/'.scratch')}
log = out/(label+'.log')
start = time.monotonic()
with log.open('xb') as stream:
    child = subprocess.Popen(argv, stdout=stream, stderr=subprocess.STDOUT,
                             env=env, start_new_session=True)
    timeout = False
    # Persist enough information for handoff while the child is still running.
    with (out/(label+'-started.json')).open('x') as f:
        json.dump({'pid': child.pid, 'argv': argv, 'cap_seconds': cap,
                   'started': time.time(), 'source_manifest': str(checkpoint.relative_to(root)),
                   'source_manifest_sha256': sha(checkpoint)}, f, indent=2)
    try:
        child.wait(timeout=cap)
    except subprocess.TimeoutExpired:
        timeout = True
        os.killpg(child.pid, signal.SIGKILL)
        child.wait()
record = {'argv': argv, 'returncode': child.returncode, 'timeout': timeout,
          'cap_seconds': cap, 'elapsed_seconds': time.monotonic()-start,
          'source_postcheck': unchanged(), 'log': str(log.relative_to(root)),
          'log_sha256': sha(log)}
with (out/(label+'.json')).open('x') as f:
    json.dump(record, f, indent=2)
    f.write('\n')
log.chmod(0o444)
(out/(label+'.json')).chmod(0o444)
print(json.dumps(record))
print(log.read_text()[-12000:])
sys.exit(124 if timeout else child.returncode if record['source_postcheck'] else 125)
