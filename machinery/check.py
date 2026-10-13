"""Codex/Astra round-2 foreground checks. Never overwrites first-round evidence."""
import json
import sys
import time
from .process import run
from .toolchain import ROOT
from .trust import environment, sha


def main():
    records=[]
    for name,args,timeout in [
        ('formal-validation',[sys.executable,'-u','-m','machinery.validate'],180),
        ('tests-final',[sys.executable,'-m','unittest','discover','-s','tests','-p','test_round2.py','-v'],120)]:
        r=run(args,cwd=ROOT,env=environment(),timeout=timeout,output_bytes=1048576)
        (ROOT/f'evidence/round2/{name}.log').write_text(r['stdout']+r['stderr'])
        records.append({'step':name,**r})
        (ROOT/'evidence/round2/checks.json').write_text(json.dumps(records,indent=2)+'\n')
        print(name,r['returncode'],r['termination'],flush=True)
        if r['returncode'] != 0 or r['termination']:
            return 1
    paths=[]
    for directory in ['machinery','MathGKM','tests','contracts','docs/round2']:
        paths += [p for p in (ROOT/directory).glob('*') if p.is_file() and p.suffix in ('.py','.lean','.md','.json')]
    manifest={'origin':'actual authorized Codex/Astra bootstrap turn, round 2',
              'files':{str(p.relative_to(ROOT)):sha(p) for p in paths},
              'authoritative':False,'external_llm_calls':0,'phase':'construction',
              'independent_validation':'pending','wall_clock_limit_seconds':1200}
    (ROOT/'evidence/round2/provenance.json').write_text(json.dumps(manifest,indent=2)+'\n')
    return 0

if __name__=='__main__': raise SystemExit(main())
