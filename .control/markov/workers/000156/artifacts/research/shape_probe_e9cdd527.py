"""Machine-authored exact tests of a proposed lower-region kernel shape.
These test a sufficient strengthening, not Conjecture63 itself."""
from pathlib import Path
import json,time
from sparse_probe_96ada19b import solve
O=Path('/Users/sasha/math_gkm/evidence/markov-e9cdd527')
def main():
 t=time.monotonic();B=20;I=24
 out={'status':'finite exact sufficient-shape experiment only','bounds':{'j_d':B,'i':I},'counts':[0,0,0],'failures':[[],[],[]]}
 arr={(q,r):solve(q,r,I,q) for q in range(1,2*B+5) for r in [False,True]}
 for r in [False,True]:
  for i in range(3,I+1):
   def h(j,d):return arr[j+d,r][i,j]
   for j in range(B+1):
    for d in range(B+1):
     if j+d==0:continue
     a,b,c=h(j,d),h(j+1,d),h(j+2,d)
     e,f=h(j,d+1),h(j,d+2);g=h(j+1,d+1)
     for k,z in enumerate([b*b-a*c,e*e-a*f,a*g-b*e]):
      out['counts'][k]+=1
      if z<0 and len(out['failures'][k])<16:out['failures'][k].append({'r':r,'i':i,'j':j,'d':d,'gap':z,'a_b_c_e_f_g':[a,b,c,e,f,g]})
 out['seconds']=time.monotonic()-t
 (O/'shape-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
