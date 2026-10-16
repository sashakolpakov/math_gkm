"""Machine-authored exact symbolic small-column quotient candidate.
Polynomial division is computed exactly; these tables are not Lean theorems.
"""
from generate_7584c5d0 import *
def divide(p):
 deg=max(e[4] for e in p)
 cs=[sp.P({e[:4]+(0,0):c for e,c in p.items() if e[4]==k}) for k in range(deg+1)]
 ds=[cs[0]]
 for c in cs[1:-1]:ds.append(c-ds[-1])
 assert cs[-1]==ds[-1]
 return sum((c*v**k for k,c in enumerate(ds)),sp.poly(0))
def main():
 out=[]
 for aa,rr in [(2,1),(3,1),(3,2),(4,1),(4,3)]:
  hs=[p.subst([aa,rr,max(2*rr-aa,0),q,v,0]) for p in H]
  if aa==2:hs[0]+=2*v*(1-v)**4
  js=[]
  for p in hs:
   original=p
   for _ in range(5-aa):p=divide(p)
   assert p*(1+v)**(5-aa)==original
   js.append(p)
  out.append(dict(a=aa,r=rr,dividing_power=5-aa,blocks=[expr(p) for p in js],degrees=[max(e[4] for e in p) for p in js]))
 result=dict(status='Exact symbolic candidates, not Lean quotient identities or LC proofs',formula='For a=3,4: (1-v)^4 * 2 raw_column = v^(b-2q-2)*(J0+v^q J1+v^(2q) J2). For a=2,r=1 the experimental +2v correction predicts (1-v)^4 * 2v raw_column=J0+v^q J1+v^(2q)J2.',cases=out)
 (O/'small-sparse-candidates.json').write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
