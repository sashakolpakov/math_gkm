"""Machine-authored f8f306c0. Reproduce the finite relaxed-edge diagnostic."""
from absorbed_structure_f8f306c0 import C,L,F
from pathlib import Path
import json,time
start=time.monotonic();bad=[];cnt=0
for t in range(4,21):
 for j in range(2,31):
  fac=F(j+1,C(t+j+3,j))
  a=[[fac*L(j,t+r,m) for m in range(j+1)] for r in range(3)]
  a[0][0]+=F(8*j,t+1);a[1][0]+=F(8*j,t+1)
  for m in range(2,j+1):
   A,B,D=a
   gap=A[m-1]*D[1]/(B[m]*B[0])-A[m-2]*D[2]/(B[m-1]*B[1])-A[0]*D[m]/(B[1]*B[m-1])
   cnt+=1
   if gap<0:bad.append([t,j,m,str(gap)])
out={'status':'finite exact rational experiment, not a proof','t_range':[4,20],
 'j_range':[2,30],'m_range':'2 through j','B_relaxation':'j+1',
 'correction_upper_bounds':'both replaced by 8*j/(t+1)',
 'checks':cnt,'failures':bad,'seconds':time.monotonic()-start}
Path('evidence/markov-f8f306c0/relaxed-edge-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
