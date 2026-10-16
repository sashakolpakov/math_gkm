"""Machine-authored finite tests of a uniform candidate proof structure.
No scan establishes a universal sign claim or changes the root.
"""
from pathlib import Path
import json,hashlib,time
from newton_probe_0d346fa7 import C,lower,upper,newton
O=Path('evidence/markov-4f4ac079')
def K(i,j,m):
 return sum((1 if k==0 else 2)*C(j-k+i,i)*C(m-k,i-2) for k in range(min(j,m)+1))
def main():
 t=time.monotonic();out={'status':'finite exact tests only','formula_tests':0,'shape_tests':0,
  'zero_triples':0,'vertical_tests':0,'failures':[]}
 for i in range(2,25):
  for j in range(25):
   for d in range(12):
    out['formula_tests']+=1
    if lower(j,d,i)!=K(i,j,j+2*d):out['failures'].append(['lower',i,j,d])
    if d:
     out['formula_tests']+=1
     if upper(j,d,i)!=K(i,j+2*d,j):out['failures'].append(['upper',i,j,d])
  a={(j,m):K(i,j,m) for j in range(34) for m in range(34)}
  for j in range(32):
   for m in range(32):
    gaps=[a[j+1,m]**2-a[j,m]*a[j+2,m],a[j,m+1]**2-a[j,m]*a[j,m+2],
      a[j,m]*a[j+1,m+1]-a[j+1,m]*a[j,m+1]]
    out['shape_tests']+=3
    if min(gaps)<0:out['failures'].append(['shape',i,j,m,gaps])
    v=[a[j,m+2],a[j+1,m+1],a[j+2,m]]
    out['vertical_tests']+=1;out['zero_triples']+=int(0 in v)
    if v[1]**2<v[0]*v[2]:out['failures'].append(['antidiagonal',i,j,m,v])
 out['bounds']={'i':[2,24],'formula_j_or_N':[0,24],'formula_d':[0,11],
  'shape_j_m':[0,31]}
 out['seconds']=time.monotonic()-t
 out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
 (O/'kernel-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
