"""Machine-authored next-direction experiment. Failed certificates are not root refutations."""
from pathlib import Path
import json,time,sys
sys.path.insert(0,'research')
from upper_probe_v2_2b34268b import S
O=Path('evidence/markov-ec6f4b83')
out={'status':'finite proposed summand certificates only','variants':{}}
start=time.monotonic()
for direction in ['vertical','diagonal']:
 for shift in range(4):
  z={'checks':0,'failures':[],'zero_lhs':0}
  for N in range(3 if direction=='vertical' else 1,12):
   for d in range(1 if direction=='vertical' else 3,12):
    for i in range(1,N+4):
     for h in range(i+4):
      for k in range(i+4):
       a,b=min(h+shift,k),max(h+shift,k)-shift
       if direction=='vertical':
        lhs=S(N,d,i,h)*S(N-2,d+2,i,k)
        rhs=S(N-1,d+1,i,a)*S(N-1,d+1,i,b)
       else:
        lhs=S(N,d,i,h)*S(N+2,d-2,i+2,k)
        rhs=S(N+1,d-1,i+1,a)*S(N+1,d-1,i+1,b)
       z['checks']+=1;z['zero_lhs']+=int(lhs==0)
       if lhs>rhs and len(z['failures'])<6:z['failures'].append({'N':N,'d':d,'i':i,'h':h,'k':k,'lhs':lhs,'rhs':rhs})
  out['variants'][direction+str(shift)]=z
  (O/'directions-probe.json').write_text(json.dumps(out,indent=2)+'\n')
out['seconds']=time.monotonic()-start
(O/'directions-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
