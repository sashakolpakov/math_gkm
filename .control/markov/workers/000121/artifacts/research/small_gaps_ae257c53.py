"""Machine-authored exact small-quotient gap exploration; symbolic checks are not Lean proofs."""
from small_blocks_ae257c53 import *
from generate_all_lc_1152282d import specs,sp,u
from explore_allrun_refined_1152282d import value
def main():
 rows=[]
 for a in range(4,7):
  for r in range(1,a):
   if gcd(a,r)!=1:continue
   bs=blocks(a,r)
   for _ in range(7-a):bs=[divplus(d) for d in bs]
   for case,q,j,_,_ in specs:
    hs={}
    for band,d in enumerate(bs):
     for (i,k),c in d.items():hs[band,k]=hs.get((band,k),sp.poly(0))+c*q**i
    cs=[value(hs,q,j+h) for h in [-1,0,1]]
    gap=cs[1]**2-cs[0]*cs[2]
    neg=[[[*k],str(c)] for k,c in gap.items() if c<0]
    rows.append(dict(a=a,r=r,case=case,terms=len(gap),negative_coefficients=len(neg),examples=neg[:3]))
 out=dict(status='Exact symbolic candidate only; raw/source adapters and integer chamber coverage must be checked in Lean before use',charts=len(rows),nonnegative_charts=sum(z['negative_coefficients']==0 for z in rows),rows=rows)
 (O/'small-gap-candidates.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='rows'}))
if __name__=='__main__':main()
