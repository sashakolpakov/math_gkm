"""Machine-authored support-aware third-row certificates; generation is not proof."""
from middle_polynomial_probe_f8d0715b import raw,add,mul,scale,F
from math import comb
from pathlib import Path
import json,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-6c0f2afd'
def substitute(p,k,off):
 q={}
 for (a,b),v in p.items():
  for z in range(a+1):q[(z,0)]=q.get((z,0),F(0))+v*k**b*comb(a,z)*off**(a-z)
 return {z:v for z,v in q.items() if v}
def run():
 rows=[];start=time.monotonic()
 for lo,hi in [(6,9),(10,13),(14,16)]:
  src='''import MarkovMiddleFixedDepthM6C0
/-! Machine-authored 6c0f2afd. Complete third middle row: fixed-column
univariate certificates on the exact nonzero support, all denominators. -/
namespace MathGKM.Markov
set_option maxHeartbeats 400000000
set_option maxRecDepth 1000000
'''
  for c in range(lo,hi+1):
   for r in [False,True]:
    off=max(0,c+2-(6+(5 if r else 4)))
    a,b,d=[substitute(raw(j,r),2,off) for j in range(c,c+3)]
    g=add(mul(b,b),scale(mul(a,d),-1));bad=[(z,str(v)) for z,v in g.items() if v<0]
    rows.append(dict(c=c,r=r,shift=off,terms=len(g),negative=bad,coefficients=[[z[0],str(v)] for z,v in sorted(g.items())]))
    assert not bad,(c,r,bad)
    s='true' if r else 'false'
    src+=f'''
theorem third_dense_{c}_{s}M6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (fixedTwoExprM6C0 {c} {s})) := by decide +kernel
'''
   src+=f'''
theorem middle_two_{c}_nonnegM6C0 (x : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r {c} x 2 := by
 cases r
 · exact fixed_two_transferM6C0 {c} false third_dense_{c}_falseM6C0 x
 · exact fixed_two_transferM6C0 {c} true third_dense_{c}_trueM6C0 x
'''
  src+='\nend MathGKM.Markov\n'
  (R/'research'/f'MarkovMiddleThirdBatch{lo}M6C0.lean').write_text(src)
 (O/'third-coefficient-candidates.json').write_text(json.dumps(dict(rows=rows,seconds=time.monotonic()-start,status='Exact coefficient generation; Lean validation separate.'),indent=2))
 print(json.dumps(dict(cases=len(rows),seconds=time.monotonic()-start)))
if __name__=='__main__':run()
