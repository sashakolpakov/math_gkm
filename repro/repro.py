#!/usr/bin/env python3
"""Portable, isolated proof reproduction and cache recovery.

Commands execute tools only when invoked; imports have no side effects.
See README.md for tested profiles and cold-bootstrap limitations.
"""
import argparse, hashlib, json, os, platform, re, shutil, subprocess, sys, tarfile, tempfile, urllib.parse, urllib.request
from pathlib import Path, PurePosixPath

MARKER = '.repro-workspace.json'
def sha(path):
    h=hashlib.sha256()
    with Path(path).open('rb') as f:
        for b in iter(lambda:f.read(1048576),b''): h.update(b)
    return h.hexdigest()
def load(path): return json.loads(Path(path).read_text())
def save(path,value): Path(path).write_text(json.dumps(value,indent=2,sort_keys=True)+'\n')
def relative(name):
    p=PurePosixPath(name)
    if not name or p.is_absolute() or '..' in p.parts or '.'==name or '\\' in name or p.parts[0]=='.git':
        raise ValueError('unsafe relative path: '+name)
    return p
def contained(root,name):
    root=Path(root).resolve();p=root.joinpath(*relative(name).parts)
    if not p.resolve().is_relative_to(root):raise ValueError('path escapes workspace: '+name)
    return p
def execute(argv,cwd,env=None,timeout=300):
    p=subprocess.run(list(map(str,argv)),cwd=cwd,env=env,text=True,capture_output=True,timeout=timeout)
    if p.returncode: raise RuntimeError(json.dumps({'argv':list(map(str,argv)),'returncode':p.returncode,'stdout':p.stdout,'stderr':p.stderr}))
    return p.stdout
def ordered(profile,inputs):
    seen=set();active=set();out=[]
    def visit(n):
        if n in seen:return
        if n in active:raise ValueError('cyclic source imports: '+n)
        if n not in inputs:raise ValueError('missing project input: '+n)
        active.add(n)
        for d in inputs[n]['imports']:
            if d in inputs:visit(d)
        active.remove(n);seen.add(n);out.append(n)
    for n in profile['modules']:visit(n)
    return out
def preflight(root,manifest,profile):
    order=ordered(manifest['profiles'][profile],manifest['sources'])
    for n in order:
        row=manifest['sources'][n];p=contained(root,row['path'])
        if not p.is_file() or p.is_symlink() or sha(p)!=row['sha256']:raise ValueError('missing/changed source: '+row['path'])
    for row in manifest['fixed_inputs']:
        p=contained(root,row['path'])
        if not p.is_file() or p.is_symlink() or sha(p)!=row['sha256']:raise ValueError('missing/changed input: '+row['path'])
    return order
def checkout_exact(url,revision,destination,parent,paths=None):
    if not re.fullmatch('[0-9a-f]{40}',revision):raise ValueError('exact Git commit required')
    execute(['git','init','--quiet',destination],parent)
    execute(['git','remote','add','origin',url],destination)
    fetch=['git','fetch','--depth','1']
    if paths is not None:
        paths=sorted(set(paths))
        for name in paths:
            relative(name)
            if any(c in name for c in '*?[]!\n\r'):raise ValueError('unsupported sparse path')
        execute(['git','config','core.sparseCheckout','true'],destination)
        execute(['git','config','core.sparseCheckoutCone','false'],destination)
        execute(['git','config','remote.origin.promisor','true'],destination)
        execute(['git','config','remote.origin.partialclonefilter','blob:none'],destination)
        (Path(destination)/'.git/info/sparse-checkout').write_text(''.join('/'+p+'\n' for p in paths))
        fetch.append('--filter=blob:none')
    execute(fetch+['origin',revision],destination,timeout=1800)
    execute(['git','checkout','--detach','FETCH_HEAD'],destination)
    if execute(['git','rev-parse','HEAD'],destination).strip()!=revision:raise ValueError('commit mismatch')
def bootstrap(args,manifest):
    root=Path(args.workspace).absolute()
    if root.exists():raise ValueError('bootstrap requires a new, absent workspace')
    paths=[r['path'] for r in manifest['sources'].values()]+[r['path'] for r in manifest['fixed_inputs']]+['.gitignore']
    checkout_exact(manifest['repository'],manifest['published_commit'],root,root.parent,paths)
    tc=manifest['toolchain']
    lean=Path(execute([args.elan,'run','--install',tc,args.elan,'which','lean'],root,timeout=1800).strip()).resolve()
    prefix=lean.parent.parent;checker=prefix/'bin/leanchecker';lake=prefix/'bin/lake'
    for p in [lean,checker,lake]:
        if not p.is_file():raise ValueError('missing pinned executable: '+str(p))
    lock=contained(root,'lake-manifest.json');lock_hash=sha(lock)
    for dep in manifest['packages']:
        path=contained(root,'.lake/packages/'+dep['name']);path.parent.mkdir(parents=True,exist_ok=True)
        if path.exists():raise ValueError('unexpected dependency destination: '+str(path))
        checkout_exact(dep['url'],dep['rev'],path,root)
    env=os.environ.copy();env['PATH']=str(prefix/'bin')+os.pathsep+env.get('PATH','')
    if args.dependencies=='cache':execute([lake,'exe','cache','get'],root,env,timeout=3600)
    elif args.dependencies=='build':execute([lake,'build','Mathlib'],root,env,timeout=86400)
    if sha(lock)!=lock_hash:raise ValueError('bootstrap changed dependency lock')
    for dep in manifest['packages']:
        if execute(['git','rev-parse','HEAD'],root/'.lake/packages'/dep['name']).strip()!=dep['rev']:raise ValueError('bootstrap changed dependency revision')
    (root/'.scratch').mkdir(exist_ok=True)
    save(root/MARKER,{'published_commit':manifest['published_commit'],'toolchain':tc,'lean':str(lean),'leanchecker':str(checker),'core':str(prefix/'lib/lean'),'dependencies':args.dependencies,'manifest_sha256':sha(args.manifest),'purpose':'isolated reproduction only; never live research/controller'})
    print(root)
def prepare(args,manifest):
    """Copy an exact closed profile; reuse explicitly supplied dependency binaries."""
    root=Path(args.workspace).absolute();source=Path(args.source).resolve()
    if root.exists():raise ValueError('prepare requires a new, absent workspace')
    order=preflight(source,manifest,args.profile)
    tc=Path(args.toolchain_dir).resolve();packages=Path(args.packages_dir).resolve()
    for p in [tc/'bin/lean',tc/'bin/leanchecker',tc/'lib/lean']:
        if not p.exists():raise ValueError('missing explicit toolchain path: '+str(p))
    expected_version=manifest['toolchain'].split(':')[-1].removeprefix('v')
    version=execute([tc/'bin/lean','--version'],source).strip()
    if not re.search(r'\bversion\s+'+re.escape(expected_version)+r'\b',version):raise ValueError('explicit toolchain version mismatch')
    builds=[];missing_builds=[]
    for p in manifest['packages']:
        dep=packages/p['name']
        if execute(['git','rev-parse','HEAD'],dep).strip()!=p['rev']:raise ValueError('explicit dependency revision mismatch')
        b=dep/'.lake/build/lib/lean'
        if b.is_dir():builds.append(str(b.resolve()))
        else:missing_builds.append(p['name'])
    root.mkdir(parents=True)
    paths={manifest['sources'][n]['path'] for n in order}|{r['path'] for r in manifest['fixed_inputs']}
    for name in sorted(paths):
        dest=contained(root,name);dest.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(contained(source,name),dest)
    (root/'.scratch').mkdir()
    preflight(root,manifest,args.profile)
    save(root/MARKER,{'published_commit':manifest['published_commit'],'toolchain':manifest['toolchain'],'lean':str(tc/'bin/lean'),'leanchecker':str(tc/'bin/leanchecker'),'core':str(tc/'lib/lean'),'package_build_paths':builds,'missing_package_builds':missing_builds,'dependencies':'explicit_existing','manifest_sha256':sha(args.manifest),'purpose':'isolated closed-profile smoke test; existing dependency binaries reused, not a cold bootstrap','source_origin':str(source),'copied_profile':args.profile,'toolchain_version_output':version})
    print(root)
def audit_axiom_prints(profile,records):
    results=[];allowed={'propext','Classical.choice','Quot.sound'}
    for module,expected in profile.get('axiom_prints',{}).items():
        record=next(r for r in records if r['module']==module and r['operation']=='compile')
        rows=re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]",record['stdout'])
        if sorted(n for n,_ in rows)!=sorted(expected):raise ValueError('axiom-print declaration coverage mismatch: '+module)
        for name,axioms in rows:
            if not {a.strip() for a in axioms.split(',') if a.strip()}<=allowed:raise ValueError('unexpected axiom: '+name)
        results.append({'module':module,'declarations':len(rows),'allowed_axioms':sorted(allowed)})
    return results
def run_profile(args,manifest):
    root=Path(args.workspace).resolve();marker=load(root/MARKER)
    if marker['manifest_sha256']!=sha(args.manifest):raise ValueError('workspace/manifest mismatch')
    if marker['dependencies']=='none':raise ValueError('bootstrap dependencies with cache or build before running')
    order=preflight(root,manifest,args.profile)
    out=Path(tempfile.mkdtemp(prefix='run-'+args.profile+'-',dir=root/'.scratch'));build=out/'build';build.mkdir()
    packages=[Path(p) for p in marker['package_build_paths']] if 'package_build_paths' in marker else [root/'.lake/packages'/p['name']/'.lake/build/lib/lean' for p in manifest['packages']]
    # Some pinned packages (e.g. Cli) are not imported by a profile and have no
    # compiled library. Lean itself rejects any actually missing required import.
    imports=[build]+[p for p in packages if p.is_dir()]+[Path(marker['core'])]
    if not all(p.is_dir() for p in imports):raise ValueError('missing dependency build directory')
    env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join(map(str,imports));env['LEAN_SYSROOT']=str(Path(marker['core']).parent.parent)
    records=[];built={};report=out/'result.json'
    save(report,{'status':'running','profile':args.profile,'records':records,'historical_validation_unchanged':True})
    try:
        for operation in ['compile','kernel_replay']:
            for n in order:
                row=manifest['sources'][n];target=contained(build,n.replace('.','/')+'.olean');target.parent.mkdir(parents=True,exist_ok=True)
                if operation=='kernel_replay' and (not target.is_file() or sha(target)!=built[n]):raise ValueError('compiled object changed before replay: '+n)
                cmd=[marker['lean'],'-j','1','-o',str(target),row['path']] if operation=='compile' else [marker['leanchecker'],n]
                stdout=execute(cmd,root,env,args.timeout)
                if not target.is_file() or target.is_symlink() or target.stat().st_size==0:raise ValueError('missing/empty ordinary compiled output: '+n)
                digest=sha(target)
                if operation=='compile':built[n]=digest
                elif digest!=built[n]:raise ValueError('compiled object changed during replay: '+n)
                records.append({'module':n,'operation':operation,'argv':cmd,'stdout':stdout,'returncode':0,'object_sha256':digest})
                save(report,{'status':'running','profile':args.profile,'records':records,'historical_validation_unchanged':True})
        preflight(root,manifest,args.profile)
        axioms=audit_axiom_prints(manifest['profiles'][args.profile],records)
        save(report,{'status':'passed_declared_profile_checks','profile':args.profile,'records':records,'axiom_checks':axioms,'scope':manifest['profiles'][args.profile]['scope'],'historical_validation_unchanged':True})
    except Exception as e:
        save(report,{'status':'failed','profile':args.profile,'records':records,'error':str(e),'historical_validation_unchanged':True});raise
    print(report)
def recover(args):
    spec=load(args.recovery_manifest);dest=Path(args.destination).absolute()
    if spec.get('schema')!=1:raise ValueError('unsupported recovery schema')
    if not re.fullmatch('[0-9a-f]{40}',spec['public_source_commit']):raise ValueError('exact public source commit required')
    if spec['platform']!=sys.platform+'-'+platform.machine():raise ValueError('cache platform mismatch')
    if dest.exists() and not (dest/MARKER).is_file():raise ValueError('destination must be new or an isolated bootstrap workspace')
    if dest.exists():
        marker=load(dest/MARKER)
        if marker['toolchain']!=spec['lean_toolchain'] or marker['published_commit']!=spec['public_source_commit']:raise ValueError('cache/workspace pin mismatch')
    dest.mkdir(parents=True,exist_ok=True)
    repository=spec['repository']
    if re.fullmatch('[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+',repository):repository='https://github.com/'+repository
    base=repository.removesuffix('.git').rstrip('/')+'/releases/download/'+urllib.parse.quote(spec['tag'],safe='')+'/'
    if not base.startswith('https://github.com/'):raise ValueError('GitHub HTTPS release URL required')
    restored=[];seen=set()
    try:
        for asset in spec['assets']:
            name=asset['name']
            if '/' in name or '\\' in name:raise ValueError('unsafe asset name')
            with tempfile.TemporaryDirectory(prefix='download-',dir=dest) as tmp:
                archive=Path(tmp)/'asset'
                with urllib.request.urlopen(base+urllib.parse.quote(name,safe=''),timeout=60) as src, archive.open('xb') as f:shutil.copyfileobj(src,f)
                if archive.stat().st_size!=asset['size'] or sha(archive)!=asset['sha256']:raise ValueError('asset hash/size mismatch')
                payload=Path(tmp)/'payload';payload.mkdir();members={}
                for digest in asset['objects']:
                    if not re.fullmatch('[0-9a-f]{64}',digest) or digest in seen:raise ValueError('invalid/duplicate object digest')
                    row=spec['objects'][digest]
                    if row['sha256']!=digest or row['asset']!=name:raise ValueError('object/asset binding mismatch')
                    members['objects/'+digest]={'bytes':row['size'],'sha256':digest};seen.add(digest)
                extract_checked(archive,payload,members)
                for digest in asset['objects']:
                    row=spec['objects'][digest]
                    paths=row['restore_paths'] if args.historical_copies else row['current_paths']
                    for rel in paths:
                        path=contained(dest,rel)
                        if path.exists():
                            if path.is_symlink() or not path.is_file() or path.stat().st_size!=row['size'] or sha(path)!=digest:raise ValueError('refusing mismatched existing target: '+rel)
                        else:
                            path.parent.mkdir(parents=True,exist_ok=True)
                            with (payload/'objects'/digest).open('rb') as src,path.open('xb') as f:shutil.copyfileobj(src,f)
                        restored.append(rel)
        if seen!=set(spec['objects']):raise ValueError('incomplete object coverage')
        save(dest/'RECOVERY.json',{'manifest_sha256':sha(args.recovery_manifest),'public_source_commit':spec['public_source_commit'],'lean_toolchain':spec['lean_toolchain'],'status':'hash_verified_files_restored','restored_paths':restored,'historical_copies':args.historical_copies,'validation_status':'unchanged; no code executed','metadata_limit':'Restores exact bytes only; original uid/gid/atime/mtime/inode are not reconstructed by this schema'})
    except Exception:
        # Leave a clearly failed recovery directory for diagnosis; never replace originals.
        save(dest/'RECOVERY_FAILED.json',{'status':'incomplete; do not use as authenticated restoration'});raise
def extract_checked(archive,dest,members):
    seen=set()
    with tarfile.open(archive,'r:*') as tar:
        for member in tar:
            if not member.isfile():raise ValueError('only ordinary archive files accepted')
            name=member.name;path=contained(dest,name)
            if name in seen or name not in members:raise ValueError('duplicate/unlisted archive member')
            row=members[name]
            if member.size!=row['bytes']:raise ValueError('member size mismatch')
            path.parent.mkdir(parents=True,exist_ok=True)
            with tar.extractfile(member) as src,path.open('xb') as out:shutil.copyfileobj(src,out)
            if sha(path)!=row['sha256']:raise ValueError('member hash mismatch')
            if 'mode' in row:os.chmod(path,row['mode'] & 0o777)
            seen.add(name)
    if seen!=set(members):raise ValueError('missing archive members')
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--manifest',default=str(Path(__file__).with_name('manifest.json')))
    sub=p.add_subparsers(dest='command',required=True)
    b=sub.add_parser('bootstrap');b.add_argument('--workspace',required=True);b.add_argument('--elan',default='elan');b.add_argument('--dependencies',choices=['none','cache','build'],default='cache')
    s=sub.add_parser('prepare');s.add_argument('--source',required=True);s.add_argument('--workspace',required=True);s.add_argument('--profile',required=True);s.add_argument('--toolchain-dir',required=True);s.add_argument('--packages-dir',required=True)
    r=sub.add_parser('run');r.add_argument('--workspace',required=True);r.add_argument('--profile',required=True);r.add_argument('--timeout',type=int,default=300)
    v=sub.add_parser('verify');v.add_argument('--workspace',required=True);v.add_argument('--profile',required=True)
    q=sub.add_parser('recover');q.add_argument('--recovery-manifest',required=True);q.add_argument('--destination',required=True);q.add_argument('--historical-copies',action='store_true')
    a=p.parse_args()
    if a.command=='recover':recover(a);return
    m=load(a.manifest)
    if a.command=='bootstrap':bootstrap(a,m)
    elif a.command=='prepare':prepare(a,m)
    elif a.command=='run':run_profile(a,m)
    else:print(json.dumps({'profile':a.profile,'source_count':len(preflight(a.workspace,m,a.profile)),'scope':'static source/input hashes only'}))
if __name__=='__main__':main()
