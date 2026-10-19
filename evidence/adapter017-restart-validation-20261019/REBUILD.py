"""Recheck the recorded fresh neutral proposals. No hosted model or study run."""
from pathlib import Path
import argparse,hashlib,json,os,shutil,sys,time,runpy
P=Path(__file__).resolve().parent
R=P.parents[1]
sys.path.insert(0,str(R))

def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()

def child(out):
    from machinery.study_common import read,write,dependencies,inventory,implementation,digest
    from machinery.study_transfer import check_task
    from machinery.validation_receipts import reuse
    runpy.run_path(str(P/'verify.py'),run_name='__main__')
    core=json.loads((P/'CORE_PREREQUISITES.json').read_text())
    for n,h in {**core['protected_files'],**core['applied_files']}.items():
        if sha(R/n)!=h:raise RuntimeError('canonical production prerequisite differs: '+n)
    if digest(implementation())!=core['implementation_sha256']:raise RuntimeError('implementation differs')
    workspace=out/'workspace';workspace.mkdir()
    source=P/'neutral/workspace'
    for src in source.rglob('*'):
        if src.is_file():
            dest=workspace/src.relative_to(source);dest.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(src,dest)
    (workspace/'.scratch').mkdir(exist_ok=True);dependencies(workspace)
    tasks=read(P/'neutral/tasks.json');receipt=read(P/'neutral/jobs/neutral-adapter-live017/receipt.json')
    proposals=receipt['payload']['solutions'];frozen=read(P/'neutral/jobs/neutral-adapter-live017/before.json')
    output=[]
    for task in tasks:
        solution=proposals[task['id']];directory=out/'checks'/task['id']
        result=check_task(workspace,task,solution,directory,300,live=True,frozen_files=frozen)
        expected=task['id']=='solutions'
        if result.get('checked') is not expected or result.get('valid_attempt') is not True:
            raise RuntimeError('neutral outcome differs')
        if not expected and result.get('status')!='bounded_valid_non_solution':raise RuntimeError('decline was treated as proof')
        if not result['checks'] or any(x['returncode'] or x.get('termination') for x in result['checks']):raise RuntimeError('gate incomplete')
        if {x['operation'] for x in result['checks']}!={'compile','kernel_replay','trusted_premise_inspection'}:raise RuntimeError('gate stage missing')
        if reuse(directory,task,solution,())!=json.loads(json.dumps(result)):raise RuntimeError('fresh FINISHED binding differs')
        output.append({'id':task['id'],'checked':result['checked'],'valid_attempt':result['valid_attempt'],'status':result['status'],'FINISHED_sha256':sha(directory/'FINISHED.json')})
    write(out/'REBUILT.json',{'scope':'Recorded neutral engineering only; no model call or study score','checks':output})
    print(json.dumps(output))

if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--out',required=True);parser.add_argument('--child',action='store_true');args=parser.parse_args()
    out=(R/args.out).resolve()
    if not out.is_relative_to((R/'.scratch').resolve()):raise SystemExit('fresh output must be under repository .scratch')
    if args.child:child(out)
    else:
        if out.exists():raise SystemExit('refuse existing output; never replay uncertain work')
        out.mkdir(parents=True)
        from machinery.process import run
        from machinery.study_common import write,PYTHON
        result=run([PYTHON,'-B',str(Path(__file__).resolve()),'--out',str(out),'--child'],cwd=R,env={**os.environ,'PYTHONDONTWRITEBYTECODE':'1','TMPDIR':str(out)},timeout=720,output_bytes=1048576,scope=out,tree_only=True,log_path=out/'outer.log')
        write(out/'OUTER_RESULT.json',result)
        raise SystemExit(result['returncode'] or bool(result.get('termination')))
