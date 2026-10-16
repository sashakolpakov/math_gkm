"""Machine-authored finite tests of a new transform, not a theorem."""
from lift_probe_ae9e841e import *
def conv(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
def main():
 out={'status':'finite experiments only','checks':0,'failures':[],'symmetric_pair_failures':[]}
 for j in range(21):
  for t in range(1,2*j+8):
   for r0 in range(t+1):
    ps=[[F(j,v,r) if r>=r0 else 0 for r in range(t+2)] for v in [t-1,t,t+1]]
    a=conv(ps[1],ps[1]);b=conv(ps[0],ps[2])
    for k,(x,y) in enumerate(zip(a,b)):
     out['checks']+=1
     if x<y and len(out['failures'])<10:out['failures'].append([j,t,r0,k,x-y])
   for r in range(t+1):
    for s in range(r,t+2):
     a=F(j,t-1,r)*F(j,t+1,s)+F(j,t-1,s)*F(j,t+1,r)
     b=2*F(j,t,r)*F(j,t,s)
     if a>b and len(out['symmetric_pair_failures'])<5:out['symmetric_pair_failures'].append([j,t,r,s,a,b])
 (O/'lift-lc-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
