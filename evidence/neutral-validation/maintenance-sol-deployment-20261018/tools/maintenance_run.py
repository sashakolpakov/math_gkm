import hashlib
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

label, cap, *argv = sys.argv[1:]
out = Path('evidence/neutral-validation/maintenance-sol-deployment-20261018')
log = out/(label+'.log')
if log.exists():
    raise FileExistsError(log)
start = time.monotonic()
with log.open('xb') as stream:
    p = subprocess.Popen(argv, stdout=stream, stderr=subprocess.STDOUT, start_new_session=True)
    timed_out = False
    try:
        p.wait(timeout=int(cap))
    except subprocess.TimeoutExpired:
        timed_out = True
        os.killpg(p.pid, signal.SIGKILL)
        p.wait()
record = {'argv': argv, 'returncode': p.returncode, 'timeout': timed_out,
    'cap_seconds': int(cap), 'elapsed_seconds': time.monotonic()-start,
    'log': str(log), 'log_sha256': hashlib.sha256(log.read_bytes()).hexdigest()}
(out/(label+'.json')).write_text(json.dumps(record, indent=2)+'\n')
print(json.dumps(record))
print(log.read_text()[-14000:])
sys.exit(p.returncode if not timed_out else 124)
