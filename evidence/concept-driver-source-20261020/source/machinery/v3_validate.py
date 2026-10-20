"""Post-review sequential runner. Never called during construction.

The supervisor must supply a protected review binding the exact source manifest.
The runner bounds its owned test tree; child validators obtain the shared heavy
lease themselves, so the outer observer does not reserve a second compiler.
"""
import argparse
import json
import os
from pathlib import Path
import time
from .study_common import ROOT,PYTHON,Invalid,read,sha,write
from .process import run

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--manifest',type=Path,required=True)
    p.add_argument('--label',required=True)
    p.add_argument('--review',type=Path,default=ROOT/'.bootstrap/construction-v3-review.json',
        help='independent supervisor review, created after auditing the exact frozen manifest')
    p.add_argument('--seconds',type=int,default=1800)
    p.add_argument('tests',nargs='+')
    a=p.parse_args()
    if not 1<=a.seconds<=1800 or not a.label.replace('-','').isalnum(): raise Invalid('invalid bounded run label/time')
    manifest=read(a.manifest)
    review=read(a.review)
    if review.get('accepted') is not True or review.get('manifest_sha256')!=sha(a.manifest):
        raise Invalid('independent source review does not bind these bytes')
    def changed(): return [n for n,h in manifest['files_sha256'].items() if sha(ROOT/n)!=h]
    if changed(): raise Invalid('source mismatch before validation')
    out=ROOT/'.scratch/v3-validation'/a.label
    out.mkdir(parents=True,exist_ok=False)
    argv=[PYTHON,'-m','unittest','-v',*a.tests]
    write(out/'intent.json',dict(argv=argv,manifest_sha256=sha(a.manifest),allocated_seconds=a.seconds))
    start=time.monotonic(); reason=None; result={}
    try:
        env={**os.environ,'PATH':'/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',
            'TMPDIR':str(ROOT/'.scratch'),'GIT_CONFIG_NOSYSTEM':'1','GIT_CONFIG_GLOBAL':'/dev/null','PYTHONDONTWRITEBYTECODE':'1'}
        result=run(argv,cwd=ROOT,env=env,timeout=a.seconds,output_bytes=8*1024**2,
            scope=ROOT/'.scratch',tree_only=True,log_path=out/'run.log')
        reason=result.get('termination')
    except (OSError,ValueError,KeyboardInterrupt) as exc:
        reason=type(exc).__name__+': '+str(exc)
    finally:
        write(out/'result.json',dict(returncode=result.get('returncode'),termination=reason,
            resources=result.get('resources'),
            worker_tree_wall_seconds=time.monotonic()-start,allocated_seconds=a.seconds,
            controller_wall_overlaps=True,provider_usage='raw receipts only; no normalization',
            log_sha256=sha(out/'run.log') if (out/'run.log').exists() else None,source_mismatches_after=changed(),
            scope='finite neutral evidence; never campaign activation or D1-D3 proof'))
    return 1 if reason or changed() else result.get('returncode',1)

if __name__=='__main__': raise SystemExit(main())
