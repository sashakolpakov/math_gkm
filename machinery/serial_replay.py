"""PROPOSED / UNRUN. Catalogue-only serial official-worker orchestration.

The caller supplies a separately qualified source-pinned engine, unchanged
process.run, sandbox prefix, STOP callback, and original aggregate remaining().
No engine discovery/enable flag, role call, resource override or budget funding.
"""
import hashlib
import json
import math
import os
from pathlib import Path
import re
import secrets
import stat
import time

SCHEMA='math-gkm.catalogue-serial-engine.v1'
WORKER_SHA256='4a1a5a15aa9296ca7fa05bc6fae5413962b27b718ab9acf1b50b6c461bbe7464'
OFFICIAL_SHA256='eb5dee411837629f09c5c18d63cc833d30335a46048bc586642742e90aa65d5f'
NAME=re.compile(r'[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*')
HEX=re.compile(r'[0-9a-f]{64}')
MAX_PREFIXES=10000
MAX_OCCURRENCES=100000
MAX_CAPTURE=16*1024**2
MAX_INPUT=1024**2
MAX_TRACE=1024**2
MAX_BATCH=32

class InvalidReplay(ValueError):pass

def need(ok,message):
    if not ok:raise InvalidReplay(message)

def canonical(value):return json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False,allow_nan=False).encode()
def digest(value):return hashlib.sha256(canonical(value)).hexdigest()
def _sha(body):return hashlib.sha256(body).hexdigest()
def _pairs(pairs):
    out={}
    for key,value in pairs:
        need(key not in out,'duplicate JSON key');out[key]=value
    return out

def _json(body):
    try:return json.loads(body,object_pairs_hook=_pairs,parse_constant=lambda _:(_ for _ in ()).throw(InvalidReplay('nonfinite JSON')))
    except (UnicodeError,json.JSONDecodeError) as exc:raise InvalidReplay('invalid replay JSON') from exc

def _read(path,maximum=MAX_CAPTURE):
    path=Path(path);need(not path.is_symlink(),'replay artifact symlink')
    fd=os.open(path,os.O_RDONLY|os.O_NOFOLLOW|os.O_CLOEXEC)
    with os.fdopen(fd,'rb') as src:
        a=os.fstat(src.fileno());need(stat.S_ISREG(a.st_mode) and a.st_nlink==1 and not a.st_mode&0o022 and a.st_size<=maximum,'unsafe/bounded replay file')
        body=src.read(maximum+1);b=os.fstat(src.fileno());named=path.stat()
    frame=lambda s:(s.st_dev,s.st_ino,s.st_size,s.st_mode,s.st_mtime_ns,s.st_ctime_ns)
    need(len(body)<=maximum and frame(a)==frame(b)==frame(named),'replay file changed')
    return body

def _pointer(row,maximum=64*1024**2):
    need(type(row) is dict and set(row)=={'path','sha256'} and type(row['path']) is str and HEX.fullmatch(row['sha256']),'invalid engine pointer')
    path=Path(row['path']);need(path.is_absolute(),'engine pointer must be absolute')
    body=_read(path,maximum);need(_sha(body)==row['sha256'],'engine pointer changed');return body

def _worker(body):
    start=b'unsafe def replayFromImports (module : Name) : IO Unit := do\n'
    need(body.count(start)==1,'official worker entry changed')
    part=body.split(start,1)[1].split(b'\nunsafe def replayFromFresh ',1)[0]
    return start+part.rstrip()+b'\n'

def engine_identity(engine):
    need(type(engine) is dict and set(engine)=={'schema','executable','source','official_source','interface_source','official_worker_sha256','toolchain'} and engine['schema']==SCHEMA,'engine schema changed')
    need(engine['official_worker_sha256']==WORKER_SHA256,'official worker identity changed')
    executable=_pointer(engine['executable']);source=_pointer(engine['source'],MAX_INPUT)
    official=_pointer(engine['official_source'],MAX_INPUT);interface=_pointer(engine['interface_source'],MAX_INPUT)
    need(Path(engine['interface_source']['path']).resolve()==Path(__file__).resolve() and interface==_read(__file__,MAX_INPUT),'interface source identity changed')
    need(_sha(official)==OFFICIAL_SHA256 and _sha(_worker(official))==WORKER_SHA256,'official checker source changed')
    need(source.count(_worker(official))==1,'driver worker differs from official source')
    toolchain=engine['toolchain'];need(type(toolchain) is dict and set(toolchain)=={'root','lean','checker'},'toolchain identity changed')
    root=Path(toolchain['root']);need(root.is_absolute(),'toolchain root must be absolute')
    need(Path(toolchain['lean']['path'])==root/'bin/lean' and Path(toolchain['checker']['path'])==root/'bin/leanchecker','toolchain binary paths changed')
    _pointer(toolchain['lean']);_pointer(toolchain['checker'])
    return json.loads(canonical(engine))

def _sync_parent(path):
    fd=os.open(Path(path).parent,os.O_RDONLY)
    try:os.fsync(fd)
    finally:os.close(fd)

def _write(path,body,mode=0o444):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True)
    fd=os.open(path,os.O_WRONLY|os.O_CREAT|os.O_EXCL|os.O_NOFOLLOW|os.O_CLOEXEC,0o600)
    with os.fdopen(fd,'wb') as out:out.write(body);out.flush();os.fchmod(out.fileno(),mode);os.fsync(out.fileno())
    _sync_parent(path)

def _artifact(root,path,artifacts,maximum=MAX_CAPTURE):
    path=Path(path);rel=str(path.relative_to(root));need('..' not in Path(rel).parts,'artifact escaped replay directory')
    body=_read(path,maximum)
    with path.open('rb') as src:os.fchmod(src.fileno(),0o444);os.fsync(src.fileno())
    _sync_parent(path);need(_read(path,maximum)==body,'artifact changed before retention')
    row={'path':rel,'sha256':_sha(body),'bytes':len(body)};artifacts[rel]={k:row[k] for k in ('sha256','bytes')};return row

def _load_artifact(root,row,maximum=MAX_CAPTURE):
    need(type(row) is dict and set(row)=={'path','sha256','bytes'} and HEX.fullmatch(row['sha256']),'invalid artifact pointer')
    rel=Path(row['path']);need(not rel.is_absolute() and '..' not in rel.parts and str(rel)==row['path'],'unsafe artifact path')
    path=root/rel;need(path.resolve().is_relative_to(root.resolve()),'artifact outside replay directory')
    body=_read(path,maximum);need(len(body)==row['bytes'] and _sha(body)==row['sha256'],'retained replay artifact changed');return body

def _prefixes(prefixes):
    need(type(prefixes) in (list,tuple) and 0<len(prefixes)<=MAX_PREFIXES,'prefix count bound')
    out=list(prefixes)
    need(all(type(p) is str and len(p)<=4096 and NAME.fullmatch(p) for p in out),'invalid original prefix')
    return out

def _components(value):
    need(type(value) is list and 0<len(value)<=64 and all(type(x) is str and 0<len(x.encode())<=4096 for x in value),'invalid captured module')
    return tuple(value)

def _expand(prefixes,modules):
    need(type(modules) is list and len(modules)<=500000,'enumeration bound')
    names=[_components(m) for m in modules];groups=[];total=0
    for prefix in prefixes:
        target=tuple(prefix.split('.'));seen=set();first=[]
        for name in names:
            if name[:len(target)]==target and name not in seen:seen.add(name);first.append(list(name))
        need(first,'original prefix has no target');targets=list(reversed(first));total+=len(targets)
        need(total<=MAX_OCCURRENCES,'worker occurrence bound');groups.append({'prefix':prefix,'targets':targets})
    return groups

def _search_path(env,identity):
    need(type(env) is dict and all(type(k) is str and type(v) is str for k,v in env.items()),'invalid validator environment')
    need(env.get('LEAN_SYSROOT')==identity['toolchain']['root'] and env.get('LEAN_PATH'),'exact toolchain environment required')
    return env['LEAN_PATH'].split(':')+[str(Path(env['LEAN_SYSROOT'])/'lib/lean')]

def _good(record,mode,nonce):
    need(type(record) is dict and type(record.get('returncode')) is int and record.get('returncode')==0 and not record.get('termination') and not record.get('operationally_incomplete'),'serial replay process incomplete')
    need(record.get('stdout')==f'GKM_SERIAL_REPLAY_V1:{mode}:{nonce}\n','missing/extra serial completion marker')

def _batch(request,request_row,capture_row,sp,prefix_index,prefix,offset,workers):
    return {'schema':'math-gkm.serial-replay-batch.v1','nonce':request['nonce'],'engine':request['engine'],
        'request_sha256':request_row['sha256'],'enumeration_sha256':capture_row['sha256'],
        'search_path':sp,'prefix_index':prefix_index,'prefix':prefix,'offset':offset,'workers':workers}

def _verify(root,receipt,prefixes,identity,*,receipt_exists=True):
    need(type(receipt) is dict and receipt.get('schema')=='math-gkm.serial-replay-receipt.v1' and receipt.get('checked') is True,'unfinished serial replay receipt')
    need(receipt['engine']==identity and receipt['prefixes']==prefixes,'replay engine/prefix binding changed')
    artifacts=receipt['artifacts'];need(type(artifacts) is dict,'invalid artifact map')
    actual={str(p.relative_to(root)) for p in root.rglob('*') if p.is_file() or p.is_symlink()}
    need(actual==set(artifacts)|({'receipt.json'} if receipt_exists else set()),'missing/extra serial artifacts')
    for name,row in artifacts.items():_load_artifact(root,{'path':name,**row},64*1024**2)
    for key,rel in (('executable','engine/leanchecker'),('source','engine/SerialReplay.lean'),('official_source','engine/LeanChecker.lean'),('interface_source','engine/serial_replay.py')):
        need(artifacts[rel]['sha256']==identity[key]['sha256'],'staged engine identity changed')
    request_row=receipt['request'];request=_json(_load_artifact(root,request_row,MAX_INPUT))
    need(request['schema']=='math-gkm.serial-replay-request.v1' and request['engine']==identity and request['prefixes']==prefixes and HEX.fullmatch(request['nonce']),'input request binding changed')
    need(request['search_path']==_search_path(request['environment'],identity),'search path request changed')
    capture_row=receipt['enumeration'];capture=_json(_load_artifact(root,capture_row,MAX_CAPTURE))
    need(set(capture)=={'schema','request','search_path','scanned_path_count','modules','groups'} and capture['schema']=='math-gkm.serial-replay-enumeration.v1' and capture['request']==request and capture['search_path']==request['search_path'],'enumeration binding changed')
    need(type(capture['scanned_path_count']) is int and 0<capture['scanned_path_count']<=500000,'invalid scanned path count')
    groups=_expand(prefixes,capture['modules']);need(capture['groups']==groups,'prefix expansion/order/multiplicity changed')
    records=receipt['process_records'];need(type(records) is list and records,'process records missing')
    first=records[0];need(first['phase']=='enumerate' and first['prefix_index'] is None and first['batch_index'] is None and first['trace']==capture_row,'enumeration process binding changed')
    need(type(request.get('launcher_prefix')) is list and all(type(x) is str for x in request['launcher_prefix']) and Path(request['cwd']).is_absolute(),'invocation context changed')
    def argv(record,mode,input_row,output_row):
        expected=request['launcher_prefix']+[str(root/'engine/leanchecker'),mode,str(root/input_row['path']),str(root/output_row['path'])]
        need(record.get('argv')==expected,'qualified engine invocation/plan/trace binding changed')
    argv(first['record'],'enumerate',request_row,capture_row)
    _good(first['record'],'enumerate',request['nonce']);successes=[];batch_index=0
    size=receipt['batch_workers'];need(type(size) is int and 1<=size<=MAX_BATCH,'batch worker bound changed')
    for index,group in enumerate(groups):
        indices=[]
        for offset in range(0,len(group['targets']),size):
            workers=group['targets'][offset:offset+size]
            expected_plan=_batch(request,request_row,capture_row,capture['search_path'],index,group['prefix'],offset,workers)
            need(batch_index+1<len(records),'missing replay batch');row=records[batch_index+1]
            need(row['phase']=='replay' and row['prefix_index']==index and row['batch_index']==batch_index,'extra/reordered replay batch')
            plan=_json(_load_artifact(root,row['plan'],MAX_INPUT));need(plan==expected_plan,'batch input plan changed')
            lines=_load_artifact(root,row['trace'],MAX_TRACE).splitlines();need(len(lines)==len(workers)+2,'partial/extra worker trace')
            decoded=[_json(line) for line in lines]
            need(decoded[0]=={'kind':'header','plan':plan},'trace plan/nonce/source binding changed')
            for local,module in enumerate(workers):need(decoded[local+1]=={'kind':'worker','index':local,'module':module},'missing/extra/failed/reordered worker')
            need(decoded[-1]=={'kind':'complete','worker_count':len(workers)},'batch completion missing')
            argv(row['record'],'replay',row['plan'],row['trace'])
            _good(row['record'],'replay',request['nonce']);indices.append(batch_index);batch_index+=1
        successes.append({'prefix_index':index,'prefix':group['prefix'],'worker_count':len(group['targets']),'batch_indices':indices,'complete':True})
    need(len(records)==batch_index+1 and receipt['prefix_successes']==successes,'logical prefix completion changed')
    return successes

def verify(directory,*,prefixes,engine):
    root=Path(directory);need(root.is_absolute() and not root.is_symlink(),'replay artifact root must be absolute/nonaliased')
    identity=engine_identity(engine);prefixes=_prefixes(prefixes)
    receipt_body=_read(root/'receipt.json',64*1024**2);receipt=_json(receipt_body)
    successes=_verify(root,receipt,prefixes,identity)
    return {'schema':'math-gkm.serial-replay-result.v1','checked':True,
        'receipt':{'path':str(root/'receipt.json'),'sha256':_sha(receipt_body)},
        'prefix_successes':successes,'process_records':receipt['process_records'],
        'elapsed_seconds':receipt['elapsed_seconds'],'failure':None}

def run(directory,prefixes,*,engine,cwd,env,launcher_prefix,remaining,invoke,stop=lambda:False,batch_workers=32):
    """One NEW attempt; partial attempts are never automatically replayed.

    `directory` is the fresh non-build serial-replay artifact directory. Every
    original prefix shares one fixed <=1800 deadline across its chunks. All work,
    including enumeration/preparation/verification, consumes caller remaining().
    The staged executable basename is leanchecker for unchanged resource.Guard.
    """
    started=time.monotonic();root=Path(directory);prefixes=_prefixes(prefixes)
    need(root.is_absolute() and not root.is_symlink() and Path(cwd).is_absolute(),'absolute replay root/cwd required')
    need(type(launcher_prefix) in (list,tuple) and all(type(x) is str for x in launcher_prefix),'invalid sandbox launcher prefix')
    need(type(batch_workers) is int and 1<=batch_workers<=MAX_BATCH,'invalid batch size')
    root.mkdir(parents=False,exist_ok=False);artifacts={};records=[];successes=[];identity=None
    receipt={'schema':'math-gkm.serial-replay-receipt.v1','checked':False,'prefixes':prefixes,
        'batch_workers':batch_workers,'artifacts':artifacts,'process_records':records,'prefix_successes':successes}
    try:
        identity=engine_identity(engine);receipt['engine']=identity;sp=_search_path(env,identity)
        staged={}
        for key,rel in (('executable','engine/leanchecker'),('source','engine/SerialReplay.lean'),('official_source','engine/LeanChecker.lean'),('interface_source','engine/serial_replay.py')):
            data=_pointer(engine[key]);path=root/rel;_write(path,data,0o555 if key=='executable' else 0o444)
            staged[key]=path;artifacts[rel]={'sha256':_sha(data),'bytes':len(data)}
        def call(mode,input_path,output_path,metadata,deadline=None):
            need(not stop(),'validation stopped; serial replay incomplete')
            left=remaining();need(type(left) in (int,float) and math.isfinite(left) and left>0,'aggregate validation exhausted')
            for key,path in staged.items():need(_sha(_read(path,64*1024**2))==identity[key]['sha256'],'staged engine changed before execution')
            need(not output_path.exists() and not output_path.is_symlink(),'trace output already exists')
            need(not stop(),'validation stopped before native replay')
            left=remaining();need(type(left) in (int,float) and math.isfinite(left) and left>0,'aggregate validation exhausted')
            timeout=min(1800.,left,deadline-time.monotonic() if deadline is not None else 1800.)
            need(timeout>0,'original prefix deadline exhausted')
            record=invoke(list(launcher_prefix)+[str(staged['executable']),mode,str(input_path),str(output_path)],
                          cwd=cwd,env=dict(env),timeout=timeout,output_bytes=1048576)
            row={**metadata,'trace':None,'record':record};records.append(row)
            for key,path in staged.items():need(_sha(_read(path,64*1024**2))==identity[key]['sha256'],'staged engine changed during execution')
            return row
        request={'schema':'math-gkm.serial-replay-request.v1','nonce':secrets.token_hex(32),'engine':identity,
                 'prefixes':prefixes,'environment':dict(env),'search_path':sp,
                 'cwd':str(cwd),'launcher_prefix':list(launcher_prefix)}
        request_path=root/'request.json';_write(request_path,canonical(request)+b'\n')
        request_row=_artifact(root,request_path,artifacts,MAX_INPUT);receipt['request']=request_row
        capture_path=root/'enumeration.json'
        first_prefix_start=time.monotonic();first_left=remaining()
        need(type(first_left) in (int,float) and math.isfinite(first_left) and first_left>0,'aggregate exhausted before enumeration')
        first_prefix_end=first_prefix_start+min(1800.,first_left)
        row=call('enumerate',request_path,capture_path,{'phase':'enumerate','prefix_index':None,'batch_index':None},first_prefix_end)
        _good(row['record'],'enumerate',request['nonce']);capture_row=_artifact(root,capture_path,artifacts,MAX_CAPTURE)
        row['trace']=capture_row;receipt['enumeration']=capture_row;capture=_json(_load_artifact(root,capture_row))
        need(capture.get('request')==request and capture.get('search_path')==sp,'enumeration input/search path changed')
        groups=_expand(prefixes,capture['modules']);need(capture.get('groups')==groups,'enumeration expansion mismatch')
        batch_index=0
        for index,group in enumerate(groups):
            need(not stop(),'validation stopped before original prefix')
            left=remaining();need(type(left) in (int,float) and math.isfinite(left) and left>0,'aggregate exhausted before prefix')
            prefix_end=first_prefix_end if index==0 else time.monotonic()+min(1800.,left);indices=[]
            for offset in range(0,len(group['targets']),batch_workers):
                workers=group['targets'][offset:offset+batch_workers]
                plan=_batch(request,request_row,capture_row,sp,index,group['prefix'],offset,workers)
                plan_path=root/f'batch-{batch_index:05d}.json';trace_path=root/f'batch-{batch_index:05d}.jsonl'
                _write(plan_path,canonical(plan)+b'\n');plan_row=_artifact(root,plan_path,artifacts,MAX_INPUT)
                row=call('replay',plan_path,trace_path,{'phase':'replay','prefix_index':index,'batch_index':batch_index,'plan':plan_row},prefix_end)
                _good(row['record'],'replay',request['nonce']);row['trace']=_artifact(root,trace_path,artifacts,MAX_TRACE)
                indices.append(batch_index);batch_index+=1
            need(time.monotonic()<prefix_end and remaining()>0 and not stop(),'original prefix expired/stopped before completion')
            successes.append({'prefix_index':index,'prefix':group['prefix'],'worker_count':len(group['targets']),'batch_indices':indices,'complete':True})
        need(remaining()>0 and not stop(),'validation exhausted/stopped before serial completion')
        need(engine_identity(engine)==identity,'qualified engine changed during replay')
        receipt['checked']=True
        _verify(root,{**receipt},prefixes,identity,receipt_exists=False)
        need(remaining()>0 and not stop(),'validation exhausted/stopped during serial verification')
        receipt['elapsed_seconds']=time.monotonic()-started
    except Exception as exc:
        receipt['checked']=False;receipt['elapsed_seconds']=time.monotonic()-started
        receipt['failure']=type(exc).__name__+': serial replay incomplete; no checked result'
    _write(root/'receipt.json',canonical(receipt)+b'\n')
    pointer={'path':str(root/'receipt.json'),'sha256':_sha(_read(root/'receipt.json',64*1024**2))}
    if receipt['checked']:
        return {'schema':'math-gkm.serial-replay-result.v1','checked':True,'receipt':pointer,
            'prefix_successes':successes,'process_records':records,'elapsed_seconds':receipt['elapsed_seconds'],'failure':None}
    return {'schema':'math-gkm.serial-replay-result.v1','checked':False,'receipt':pointer,
        'prefix_successes':successes,'process_records':records,'elapsed_seconds':receipt['elapsed_seconds'],'failure':receipt['failure']}
