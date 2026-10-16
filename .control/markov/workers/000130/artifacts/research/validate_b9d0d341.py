"""Machine-authored bounded foreground validation with immutable receipts."""
from pathlib import Path
import json,subprocess,os,time,hashlib,sys,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-b9d0d341'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin',LEAN_PATH=str(O)+':'+json.loads((O/'inherited-lean-path.json').read_text()))
binary='/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean'
def run(mods,mode='build',timeout=120):
 stamp=f'{mode}-{time.time_ns()}'; sources={m:sha(R/'research'/f'{m}.lean') for m in mods}
 if mode=='build':
  assert len(mods)==1
  p=R/'research'/f'{mods[0]}.lean'; (O/f'{stamp}.lean').write_bytes(p.read_bytes())
  cmd=[binary,'-j','1','-o',str(O/f'{mods[0]}.olean'),str(p)]
 else:
  declared={m:re.findall(r'^(?:theorem|def|abbrev)\s+(\w+)',(R/'research'/f'{m}.lean').read_text(),re.M) for m in mods}
  assert all(n.endswith('MB9D') for ns in declared.values() for n in ns),declared
  cmd=[binary,'-s','131072','--run',str(R/'research/ReplayIsolatedMB9D.lean'),*mods]
 t=time.monotonic()
 try:
  p=subprocess.run(cmd,cwd=R,env=env,text=True,capture_output=True,timeout=timeout);d=dict(returncode=p.returncode,stdout=p.stdout,stderr=p.stderr)
 except subprocess.TimeoutExpired as e:d=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
 d.update(modules=sources,mode=mode,command=cmd,seconds=time.monotonic()-t,limits='Inherited compiled imports reused; not fresh whole-source rebuild.')
 if mode!='build':d.update(checker_sha256=sha(R/'research/ReplayIsolatedMB9D.lean'),declared_names=declared,isolation_scope='Every explicitly declared mathematical name is suffixed MB9D; all such names must be absent from the imported environment. Inherited compiler-generated equation duplicates retain the ordinary Lean replay handling.')
 p=O/f'{stamp}.json';p.write_text(json.dumps(d,indent=2)+'\n')
 print(json.dumps(dict(receipt=str(p.relative_to(R)),returncode=d.get('returncode'),timeout=d.get('timeout',False),seconds=d['seconds'],stdout=(d['stdout'][-2500:] if d.get('returncode')!=0 else ''))),flush=True)
 return d
if __name__=='__main__':
 d=run(sys.argv[3:],sys.argv[1],int(sys.argv[2]));sys.exit(d.get('returncode',1))
