"""Verify/restore this source-only operations packet. Never starts a machine.

Existing different files are never overwritten. Live STATUS, process IDs, locks,
STOP files, private evaluator inputs and active research are never restored.
"""
import argparse
import hashlib
import json
from pathlib import Path
import os

BASE=Path(__file__).resolve().parent
DEFAULT_ROOT=Path('/Users/sasha/math_gkm')


def sha(path):
    h=hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda:stream.read(1024**2),b''):h.update(block)
    return h.hexdigest()


def relative(value):
    p=Path(value)
    if p.is_absolute() or '..' in p.parts or not p.parts:raise RuntimeError('unsafe manifest path')
    return p


def load_manifest():
    manifest=json.loads((BASE/'MANIFEST.json').read_text())
    for name,record in manifest['files'].items():
        path=BASE/relative(name)
        if path.is_symlink() or not path.resolve().is_relative_to(BASE) or not path.is_file():
            raise RuntimeError('nonregular packet file '+name)
        if path.stat().st_size!=record['bytes'] or sha(path)!=record['sha256']:
            raise RuntimeError('packet binding changed '+name)
    return manifest


def destination(root,name):
    result=root/relative(name)
    if result.is_symlink() or not result.resolve().is_relative_to(root.resolve()):
        raise RuntimeError('restore target aliases outside selected root')
    return result


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command',choices=('verify-packet','check','restore'))
    parser.add_argument('--root',type=Path,default=DEFAULT_ROOT)
    args=parser.parse_args();manifest=load_manifest();root=args.root.resolve()
    if args.command=='verify-packet':
        print(json.dumps({'verified_files':len(manifest['files']),'bytes':sum(v['bytes'] for v in manifest['files'].values()),'processes_launched':0},sort_keys=True));return
    missing=[];conflicts=[]
    for name,record in manifest['files'].items():
        target=record.get('restore_to')
        if not target:continue
        dest=destination(root,target)
        if dest.exists():
            if not dest.is_file() or sha(dest)!=record['sha256']:conflicts.append(target)
        else:missing.append((name,target))
    if conflicts:raise RuntimeError('existing files differ; preserved without overwrite: '+', '.join(conflicts))
    if args.command=='check':
        print(json.dumps({'matching':not missing,'missing':[target for _,target in missing],'processes_launched':0},sort_keys=True))
        raise SystemExit(1 if missing else 0)
    for name,target in missing:
        dest=destination(root,target);dest.parent.mkdir(parents=True,exist_ok=True)
        # Exclusive destination creation; never clobber a writer or current state.
        with (BASE/name).open('rb') as source,dest.open('xb') as out:
            for block in iter(lambda:source.read(1024**2),b''):out.write(block)
            out.flush();os.fsync(out.fileno())
        if sha(dest)!=manifest['files'][name]['sha256']:raise RuntimeError('restored content changed')
    print(json.dumps({'restored_files':len(missing),'already_matching':sum(bool(v.get('restore_to')) for v in manifest['files'].values())-len(missing),'research_launched':False,'live_status_created':False,'private_inputs_restored':False},sort_keys=True))


if __name__=='__main__':main()
