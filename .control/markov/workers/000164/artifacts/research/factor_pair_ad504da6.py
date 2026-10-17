"""Machine-authored bounded Singular factorization experiment; not a proof."""
from pathlib import Path
import ast,subprocess,time,json,os,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-ad504da6'
a=ast.literal_eval((R/'evidence/markov-fee405c8/pair-factored-extrep.txt').read_text().replace('\\\n',''))
names={1:'x',2:'g',3:'z',4:'T'}
terms=[]
for k in range(0,len(a),2):
 mon,c=a[k:k+2]; term=[str(c)]
 for i in range(0,len(mon),2):term.append(names[mon[i]]+'^'+str(mon[i+1]))
 terms.append('*'.join(term))
src='// Machine-authored ad504da6. Experimental factorization only.\nring r=0,(x,g,z,T),dp;\npoly p='+'+'.join(terms)+';\nlist f=factorize(p);\nf;\nquit;\n'
p=R/'research/pair_factor_ad504da6.sing';p.write_text(src)
cmd=['/opt/homebrew/bin/Singular','--no-rc','-q',str(p)]
t=time.monotonic()
try:
 p=subprocess.run(cmd,cwd=R,capture_output=True,text=True,timeout=120,env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null'))
 d=dict(returncode=p.returncode,stdout=p.stdout,stderr=p.stderr)
except subprocess.TimeoutExpired as e:d=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
d.update(command=cmd,seconds=time.monotonic()-t,status='computer algebra experiment only')
(O/'singular-factorization.json').write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps({k:v for k,v in d.items() if k not in ['stdout','stderr']}));print(d['stdout'][:1500]);print(d['stderr'][:1000])
