"""Bounded researcher-branch discoveries, pending until paid main rechecking.

No adapter/evaluation input path exists. No selection outcome is an argument.
Source copies are immutable inbox inputs, never accepted main modules by default.
"""
import copy
from pathlib import Path
from .study_common import (Invalid,read,write,sha,digest,inside,atomic_text,retention_room)
from .study_knowledge import SCHEMAS,verify_record,ingest
from .study_transfer import collect

MAX_PENDING=64

def retain(arm,workspace,state,report,receipt,job_key,trial,side,index):
    job=arm.root/'jobs'/job_key
    spec=read(job/'spec.json'); actual=read(job/'receipt.json')
    if (spec['role']!='researcher' or actual.get('role')!='researcher' or
            spec['workspace']!=str(workspace) or actual.get('outcome')!='completed' or
            digest(actual)!=digest(receipt) or digest(actual.get('payload'))!=digest(report)):
        raise Invalid('discovery requires exact researcher-origin receipt')
    origin=dict(arm=arm.mode,trial=trial,side=side,round=index,job_key=job_key,
                receipt_sha256=sha(job/'receipt.json'),spec_sha256=sha(job/'spec.json'))
    library={**state['knowledge'],**state['components']}
    candidates=[]
    for kind in SCHEMAS:
        values=report.get(kind,[])
        if not isinstance(values,list): continue
        for item in values:
            if not isinstance(item,dict): continue
            record=library.get(item.get('id'))
            main_old={**arm.s['research']['knowledge'],**arm.s['research']['components']}.get(item.get('id'))
            if main_old and main_old['proposal_hash']==digest(item): continue
            if not record or record['proposal_hash']!=digest(item): continue
            verify_record(record,workspace)
            candidates.append(dict(kind=kind,proposal=item,record=record,
                                   source_files=record['source_files'],status='pending_paid_main_recheck'))
    claim=report.get('completion')
    if claim:
        try:
            if claim.get('kind') not in ('proof','refutation'): raise Invalid('invalid branch completion kind')
            texts,_=collect(workspace,claim['module'])
            source_files={m.replace('.','/')+'.lean':sha(workspace/(m.replace('.','/')+'.lean')) for m in texts}
            correspondence=inside(workspace,claim['correspondence'])
            source_files[claim['correspondence']]=sha(correspondence)
            candidates.append(dict(kind='completion',claim=claim,
                source_files=source_files,
                status='pending_paid_exact_root_check_and_independent_audit'))
        except (Invalid,KeyError,TypeError,ValueError,OSError) as exc:
            write(arm.root/'pending-discovery-rejections'/f'{digest(origin)}.json',
                dict(origin=origin,status='branch completion claim not retained',reason=str(exc)))
    registry=arm.s['research'].setdefault('pending_discoveries',{})
    for value in candidates:
        core=dict(origin=origin,**copy.deepcopy(value))
        key=digest(core)
        if key not in registry and len(registry)>=MAX_PENDING:
            # Retain branch records honestly; never increase the frozen budget.
            write(arm.root/'pending-discovery-overflow'/f'{key}.json',
                  dict(origin=origin,status='retained only in branch; pending inbox bound',kind=value['kind']))
            continue
        target=arm.workspace/'inbox/discoveries'/key
        source_files={}
        total=0
        for name,expected in core['source_files'].items():
            source=inside(workspace,name)
            if source.is_symlink() or sha(source)!=expected: raise Invalid('discovery source changed')
            size=source.stat().st_size; total+=size
            if size>8*1024**2 or total>128*1024**2: raise Invalid('discovery source bound')
            source_files[name]=str((target/'source'/name).relative_to(arm.workspace))
        target.parent.mkdir(parents=True,exist_ok=True)
        retention_room(arm.root,total)
        # Complete collision validation before any destination copy.
        for name,rel in source_files.items():
            dest=inside(arm.workspace,rel)
            if dest.exists() and (dest.is_symlink() or sha(dest)!=core['source_files'][name]):
                raise Invalid('immutable discovery collision')
        for name,rel in source_files.items():
            dest=inside(arm.workspace,rel)
            if not dest.exists():
                atomic_text(dest,inside(workspace,name).read_text())
                if sha(dest)!=core['source_files'][name]: raise Invalid('discovery changed while copying')
                dest.chmod(0o444)
        entry=dict(binding=key,core=core,source_paths=source_files,
                   manifest=str((target/'manifest.json').relative_to(arm.workspace)),status=core['status'])
        path=target/'manifest.json'
        if path.exists() and read(path)!=entry: raise Invalid('discovery manifest collision')
        if not path.exists(): write(path,entry); path.chmod(0o444)
        if key in registry and registry[key]['core']!=core: raise Invalid('discovery identity collision')
        if key not in registry: registry[key]=entry
    arm.save()

def verify(arm,state,workspace,key):
    entry=state.get('pending_discoveries',{}).get(key)
    if not entry or entry['binding']!=key or digest(entry['core'])!=key:
        raise Invalid('unknown or mutated pending discovery')
    frozen=read(inside(workspace,entry['manifest']))
    if any(frozen[k]!=entry[k] for k in ('binding','core','source_paths','manifest')):
        raise Invalid('pending discovery manifest changed')
    origin=entry['core']['origin']
    if origin['arm']!=arm.mode: raise Invalid('cross-arm discovery forbidden')
    job=arm.root/'jobs'/origin['job_key']
    if sha(job/'receipt.json')!=origin['receipt_sha256'] or sha(job/'spec.json')!=origin['spec_sha256']:
        raise Invalid('discovery origin receipt changed')
    if read(job/'spec.json')['role']!='researcher': raise Invalid('hidden answers cannot be discoveries')
    core=entry['core']
    if core['kind']!='completion':
        record=core['record']
        from .validation_receipts import reuse
        directory=Path(record['validation_bundle']['directory'])
        if sha(directory/'FINISHED.json')!=record['validation_bundle']['finished_sha256']:
            raise Invalid('discovery checked receipt changed')
        result=reuse(directory,record['task'],record['solution'],record['task'].get('required_constants',[]))
        if not result['checked'] or digest(result)!=record['receipt_hash']:
            raise Invalid('discovery lacks actual checked admission')
    for name,rel in entry['source_paths'].items():
        p=inside(workspace,rel)
        if p.is_symlink() or sha(p)!=core['source_files'][name]: raise Invalid('pending discovery source changed')
    return entry

def materialize(arm,state,workspace,key):
    entry=verify(arm,state,workspace,key)
    # Explicit researcher request, with no overwrite of ANY different main file.
    for name,expected in entry['core']['source_files'].items():
        p=inside(workspace,name)
        if p.exists() and (p.is_symlink() or sha(p)!=expected):
            raise Invalid('main source collision; retain pending with a new researcher version')
    for name,rel in entry['source_paths'].items():
        p=inside(workspace,name)
        if not p.exists():
            atomic_text(p,inside(workspace,rel).read_text())
            if sha(p)!=entry['core']['source_files'][name]: raise Invalid('main copy changed')
    return entry

def recheck(arm,state,report,workspace,directory):
    selected=report.get('discovery_rechecks',[])
    if not isinstance(selected,list) or any(not isinstance(k,str) for k in selected) or len(set(selected))!=len(selected):
        raise Invalid('distinct pending discovery ids required')
    count=len(selected)+sum(len(report.get(k,[])) for k in SCHEMAS)
    if count>arm.p.get('knowledge_checks_per_round',6):
        raise Invalid('discovery plus ordinary checks exceed existing per-round envelope')
    for key in selected:
        entry=verify(arm,state,workspace,key)
        if entry['core']['kind']=='completion': raise Invalid('use discovery_completion for exact root gate')
        core=entry['core']
        old={**state['knowledge'],**state['components']}.get(core['proposal']['id'])
        if old and old.get('discovery_provenance',{}).get('binding')==key:
            verify_record(old,workspace)
            continue
        if arm.available()<arm.p['validation_seconds']:
            entry['status']='pending; existing paid allowance unavailable'
            continue
        materialize(arm,state,workspace,key)
        core=entry['core']
        ingest(arm,state,{core['kind']:[core['proposal']]},workspace,directory/key)
        record={**state['knowledge'],**state['components']}.get(core['proposal']['id'])
        if record and record['proposal_hash']==digest(core['proposal']):
            record['discovery_provenance']=dict(binding=key,origin=core['origin'],
                branch_receipt_hash=core['record']['receipt_hash'])
            state['pending_discoveries'][key]['status']='main_admitted_by_ordinary_gate; scope/usefulness/novelty separate'
        # Otherwise remain pending; the normal rejection journal explains why.

def completion_candidate(arm,state,report,workspace):
    key=report.get('discovery_completion')
    if not key: return report.get('completion')
    if report.get('completion'): raise Invalid('ambiguous direct and pending completion')
    entry=verify(arm,state,workspace,key)
    if entry['core']['kind']!='completion': raise Invalid('pending entry is not a completion claim')
    if arm.available()<arm.p['validation_seconds']:
        entry['status']='pending; paid root validation allowance unavailable'
        return None
    materialize(arm,state,workspace,key)
    return entry['core']['claim']
