"""Executes the Lean protocol step used by the controller (experimental bridge).
No Python reimplementation of acceptance. Lean/IO/compiler remain trusted.
"""
import json
import tempfile
from pathlib import Path
from .process import run
from .trust import ROOT, LEAN, CORE, environment, sha
from .gate import Rejected


def transition(state, command):
    directory=Path(tempfile.mkdtemp(prefix='protocol-',dir=ROOT/'.scratch'))
    path=directory/'invocation.json'
    path.write_text(json.dumps({'state':state,'command':command}))
    source=ROOT/'MathGKM/Protocol.lean'
    before=sha(source)
    env = environment([CORE])
    env['TMPDIR'] = str(directory)
    r=run([str(LEAN),'--run',str(source),str(path)],cwd=directory,
          env=env,timeout=30,scope=directory)
    if r['returncode'] != 0 or r['termination'] or before != sha(source):
        raise Rejected('Lean protocol transition failed: '+r['stdout']+r['stderr'])
    return json.loads(r['stdout'])
