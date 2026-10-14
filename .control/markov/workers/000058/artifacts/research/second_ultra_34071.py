"""Machine-authored symbolic search for source second-row strengthening."""
from second_certificate_a27f import P,poly,vs,raw,rat_sub,rec,norm
import json,pathlib,time
s,r,m,t=vs;N=s+r+2
def diff(p,i):
 q=P()
 for e,c in p.items():
  if e[i]:
   f=list(e);f[i]-=1;q[tuple(f)]=c*e[i]
 return q
cases={};start=time.monotonic()
for name,p in [('G0',raw.sub([s,r,m,0])),('Gmax',raw.sub([s,r,m,2*m])),('negative_deriv0',-diff(raw,3).sub([s,r,m,0])),('negative_derivmax',-diff(raw,3).sub([s,r,m,2*m]))]:
 p=rat_sub(p,2,(N-1)*(m+1),m+2)
 for suffix,sub in [('s1',[1,r+1,m,t]),('s2',[2,r,m,t]),('s3',[s+3,r,m,t])]:
  z=p.sub(sub);cases[name+'_'+suffix]=rec(z);print(name,suffix,len(z),sum(c<0 for c in z.values()),flush=True)
out=pathlib.Path('evidence/markov-34071a88/second-ultra-symbolic.json');out.write_text(json.dumps(dict(cases=cases,seconds=time.monotonic()-start),indent=2)+'\n')
