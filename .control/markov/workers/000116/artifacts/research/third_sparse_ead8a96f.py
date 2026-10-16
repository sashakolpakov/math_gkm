"""Machine-authored sparse numerator exploration. Interpolation is not proof.
Produces a candidate to be proved from run-jet recurrences, with exact held-out
checks. It does not add a Lean assertion or close a source/English bridge.
"""
from third_seed_ead8a96f import *
from fractions import Fraction
def mul_uni(p,q):
 r=[Fraction(0)]*(len(p)+len(q)-1)
 for i,a in enumerate(p):
  for j,b in enumerate(q):r[i+j]+=a*b
 return r
def fit(vals):
 out=[Fraction(0)]*4
 for i,y in enumerate(vals):
  p=[Fraction(y)];den=1
  for j in range(4):
   if i!=j:p=mul_uni(p,[-(16+j),1]);den*=i-j
  for j,c in enumerate(p):out[j]+=c/den
 return out
def sparse(q):return (1-x)**6*seed(q)
def main():
 start=time.monotonic();samples=[sparse(q) for q in range(16,20)]
 rows=[]
 for q,N in zip(range(16,20),samples):
  row={}
  for k,c0 in N.items():
   band,off=divmod(k[5],q)
   assert band<=3
   row[k[:5]+(band,off)]=c0
  rows.append(row)
 keys=set().union(*(set(row) for row in rows))
 table={key:fit([row.get(key,0) for row in rows]) for key in keys}
 failures=[];comparisons=0
 for q in list(range(1,16))+list(range(20,33)):
  pred=sp.poly(0)
  for key,cs in table.items():
   v=sum(c0*q**i for i,c0 in enumerate(cs))
   pred+=sp.P({key[:5]+(key[5]*q+key[6],):v})
  actual=sparse(q);comparisons+=len(set(pred)|set(actual))
  if pred!=actual:failures.append(q)
 out=dict(status='Degree-three interpolation candidate with exact held-out checks; NOT a universal identity',training_q=list(range(16,20)),held_out_q=list(range(1,16))+list(range(20,33)),failures=failures,coefficient_comparisons=comparisons,formula='(1-x)^6*N3=sum_{band=0}^3 x^(band*q)*J_band(a,b,c,d,e,q,x). Rows are [five count exponents, band, x offset], followed by ascending rational coefficients in q.',blocks=[sum(k[5]==band for k in table) for band in range(4)],max_offsets=[max(k[6] for k in table if k[5]==band) for band in range(4)],table=[[list(k),[str(c0) for c0 in cs]] for k,cs in sorted(table.items())],seconds=time.monotonic()-start)
 (O/'third-sparse-candidate.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='table'}))
if __name__=='__main__':main()
