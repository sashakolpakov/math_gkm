"""Codex/Astra: rebuild every project import in fresh tree; provisional evidence."""
import json
from pathlib import Path
import tempfile
from . import toolchain
from .trust import ROOT, sha


def main():
    toolchain.BUILD=Path(tempfile.mkdtemp(prefix='validation-',dir=ROOT/'.scratch'))
    names=['MathGKM.Foundations','MathGKM.Machine','MathGKM','MathGKM.Driver',
           'MathGKM.Audit','MathGKM.Gluing','MathGKM.Protocol','MathGKM.AgohExercise',
           'MathGKM.Round2Audit']
    sources={name:sha(ROOT/(name.replace('.','/')+'.lean')) for name in names}
    records=[]
    for name in names:
        for operation in [toolchain.compile_module,toolchain.replay]:
            r=operation(name)
            records.append({'module':name,'operation':operation.__name__,**r})
            (ROOT/'evidence/round2/formal-validation.json').write_text(json.dumps({
                'status':'provisional_rebuild_and_replay','authoritative':False,
                'build_tree':str(toolchain.BUILD),'source_hashes':sources,'records':records},indent=2)+'\n')
            print(name,operation.__name__,r['returncode'],flush=True)
            if r['returncode'] != 0 or r['termination']:
                print(r['stdout'],r['stderr'])
                return 1
    if any(sha(ROOT/(name.replace('.','/')+'.lean')) != h for name,h in sources.items()):
        raise RuntimeError('source changed during validation')
    return 0

if __name__=='__main__': raise SystemExit(main())
