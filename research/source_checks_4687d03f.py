"""Machine-authored finite direct source recurrence comparisons. Not universal proofs."""
from pathlib import Path
import json,time
from three_probe_9e205206 import frame
from column_five_4687d03f import vals,lc3,lc4
O=Path('/Users/sasha/math_gkm/evidence/markov-4687d03f')
def main():
 t=time.monotonic();out={'status':'finite exact source experiments only','q_max':30,
 'sources':0,'column_formula_checks':0,'horizontal_triples':0,'vertical_triples':0,
 'diagonal_triples':0,'polygon_memberships':0,'failures':[]}
 for q in range(1,31):
  for r in [False,True]:
   a,n,p=frame([False]*(q-1)+[True,r]);assert a==3 and n==3*q+(1 if r else 2)
   out['sources']+=1;v=vals(n,q)
   for j in range(q+1):
    for i,w in [(3,lc3(j)),(4,lc4(n,j)),(5,v[j])]:
     out['column_formula_checks']+=1
     if p.get((i,j),0)!=w:out['failures'].append(['formula',q,r,i,j,str(w),p.get((i,j),0)])
    triples=[('horizontal',[(3,j),(4,j),(5,j)])]
    if j+2<=q:
     triples+=[('vertical',[(5,j),(5,j+1),(5,j+2)]),('diagonal',[(3,j+2),(4,j+1),(5,j)])]
    for name,pts in triples:
     out[name+'_triples']+=1
     for i,k in pts:
      assert a*n<=n*i+a*k and i+k<=a+n-1
      out['polygon_memberships']+=1
     co=[p.get(pt,0) for pt in pts]
     if co[0]*co[2]>co[1]**2:out['failures'].append([name,q,r,j,co])
     if name!='horizontal' and co[0]*co[2]==co[1]**2:out['failures'].append(['not_strict',name,q,r,j,co])
 out['seconds']=time.monotonic()-t
 (O/'source-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
