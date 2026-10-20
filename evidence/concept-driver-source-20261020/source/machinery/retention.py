"""Recoverable, attempt-owned compiled artifact retirement; never source GC."""
import shutil
import os
from .study_common import ROOT,sha,write,read

def retire_build(directory,result):
    build=directory/'build'
    if not build.exists(): return
    source=directory/'source'
    if 'finished' not in result: raise ValueError('cannot retire output before finished validator result')
    pins={}
    for name in ('lean-toolchain','lakefile.toml','lake-manifest.json'):
        dest=directory/'rebuild-pins'/name
        dest.parent.mkdir(exist_ok=True)
        if not dest.exists(): shutil.copyfile(ROOT/name,dest)
        pins[name]=sha(dest)
        if result.get('pin_hashes',{}).get(name)!=pins[name]: raise ValueError('rebuild pins changed')
    # Flush exact retained source and pin bytes before deleting any objects.
    for p in list(source.rglob('*'))+list((directory/'rebuild-pins').iterdir()):
        if p.is_symlink(): raise ValueError('retention source cannot be a symlink')
        if p.is_file():
            with p.open('rb') as retained: os.fsync(retained.fileno())
    recipe=dict(source_files={str(p.relative_to(source)):sha(p) for p in source.rglob('*.lean')},
        pins=pins,result_sha256=sha(directory/'result.json'),
        binaries=result.get('binary_hashes'),dependency_paths=result.get('dependency_paths'),
        environment=result.get('launch_environment'),commands=[{k:r[k] for k in ('operation','argv') if k in r} for r in result['checks']],
        rebuild='Recreate build directory, preserve module order and pinned LEAN_PATH, rerun recorded compile/replay/inspector argv under a new charged attempt. Never reuse an uncertain attempt ID.')
    path=directory/'REBUILD.json'
    if path.exists() and read(path)!=recipe: raise ValueError('rebuild recipe changed')
    if not path.exists(): write(path,recipe)
    if build.is_symlink() or not build.resolve().is_relative_to(directory.resolve()):
        raise ValueError('compiled cleanup escaped owned attempt')
    objects={}
    for p in build.rglob('*'):
        if p.is_symlink(): raise ValueError('symlink in compiled cleanup')
        if p.is_dir(): continue
        rel=p.relative_to(build)
        if not p.is_file() or not (p.name.endswith(('.olean','.olean.private','.olean.server','.ilean','.trace','.c','.c.o','.o','.bc'))):
            raise ValueError('unclassified retained build file: '+str(rel))
        objects[str(rel)]=sha(p)
    write(directory/'retired-objects.json',dict(objects=objects,recipe_sha256=sha(path)))
    shutil.rmtree(build)
