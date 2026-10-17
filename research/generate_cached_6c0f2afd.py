"""Machine-authored explicit intermediate coefficient tables, checked in Lean.
Python mirrors list shapes only to supply candidate data, not trusted assertions.
"""
from fractions import Fraction as F
from functools import cache
from math import comb
from pathlib import Path
import json,sys,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-6c0f2afd'
def add(a,b,op):
 return tuple(op(x,y) for x,y in zip(a,b))+a[len(b):]+b[len(a):]
def mul(a,b,z,ad,mu):
 if not a:return ()
 return add(tuple(mu(a[0],v) for v in b),(z,)+mul(a[1:],b,z,ad,mu),ad)
za=F(0);ad=lambda a,b:a+b;mu=lambda a,b:a*b
@cache
def ua(a,b):return add(a,b,ad)
@cache
def um(a,b):return mul(a,b,za,ad,mu)
@cache
def ba(a,b):return add(a,b,ua)
@cache
def bm(a,b):return mul(a,b,(),ua,um)
def cn(a):return ((F(a),),)
X=((),(F(1),));K=((F(0),F(1)),)
@cache
def cp(e,n):
 if n==0:return cn(1)
 return bm(bm(cp(e,n-1),ba(e,cn(1-n))),cn(F(1,n)))
def esum(xs):
 p=cn(0)
 for x in xs:p=ba(p,x)
 return p
def top(d,t,i):
 return esum(bm(bm(cn(comb(i+l,i)),cp(ba(d,cn(2*i+8)),i+3-l)),ba(cp(t,i+l),bm(cn(4),cp(ba(t,cn(1)),i+l+2)))) for l in range(i+4))
def ker(d,k,a,b):
 return esum(bm(bm(cn(comb(a+l,a)),cp(ba(d,cn(a)),b-l)),cp(k,a+l+2)) for l in range(b+1))
def corr(d,k,c,r):
 terms=[(1,c+4,c,c+1),(2,c+5,c+1,c+2),(1,c+4,c+1,c+2),(1,c+4,c,c+2),(1,c+5,c,c+2)] if r else [(2,c+5,c+1,c+2),(1,c+5,c,c+1),(1,c+6,c+1,c+2),(1,c+5,c,c+2)]
 # Exactly match the left-associated expression, without an extra zero summand.
 polys=[bm(cn(w),ker(ba(d,cn(o)),k,a,b)) if w!=1 else ker(ba(d,cn(o)),k,a,b) for w,o,a,b in terms]
 p=polys[0]
 for q in polys[1:]:p=ba(p,q)
 return bm(cn(4),p)
def raw(i,r,shift):
 t=ba(K,cn(shift))
 return ba(top(X,ba(ba(X,bm(cn(3),t)),cn(5 if r else 4)),i),corr(ba(X,cn(3 if r else 2)),t,i,r))
def lit(p):return '['+','.join('['+','.join(str(v.numerator) if v.denominator==1 else f'({v.numerator}/{v.denominator})' for v in row)+']' for row in p)+']'
def run(c,shift):
 src='''import MarkovMiddleExpressionM6C0
import MarkovMiddleFiveResidualMF8D
/-! Machine-authored 6c0f2afd. Checked intermediate arrays prevent repeated
normalization. The array equalities and final sign use kernel reduction. -/
namespace MathGKM.Markov
set_option maxHeartbeats 400000000
set_option maxRecDepth 1000000
set_option compiler.extract_closed false
'''
 rows=[]
 for r in [False,True]:
  s='true' if r else 'false';names=[]
  for j in range(c,c+3):
   p=raw(j,r,shift);name=f'middle_data_{c}_{j}_{s}M6C0';names.append(name)
   src+=f'\ndef {name} : DenseQM6C0 := {lit(p)}\n\ntheorem {name}_eqM6C0 : exprDenseM6C0 (middleExprM6C0 {shift} {s} {j})={name} := by decide +kernel\n'
   rows.append(dict(i=j,r=r,shift=shift,rows=len(p),entries=sum(map(len,p))))
  a,b,d=names
  src+=f'''
theorem middle_cached_{c}_{s}M6C0 :
 denseNonnegM6C0 (exprDenseM6C0 (middleGapExprM6C0 {shift} {s} {c})) := by
 change denseNonnegM6C0 (denseQAddM6C0
   (denseQMulM6C0 (exprDenseM6C0 (middleExprM6C0 {shift} {s} {c+1})) (exprDenseM6C0 (middleExprM6C0 {shift} {s} {c+1})))
   (denseQMulM6C0 [[-1]] (denseQMulM6C0 (exprDenseM6C0 (middleExprM6C0 {shift} {s} {c})) (exprDenseM6C0 (middleExprM6C0 {shift} {s} {c+2})))))
 rw [{a}_eqM6C0,{b}_eqM6C0,{d}_eqM6C0]
 decide +kernel
'''
 src+=f'''
theorem middle_cached_{c}_shiftM6C0 (x k : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r {c} x (k+{shift}) := by
 cases r
 · exact middle_gap_dense_transferM6C0 {shift} {c} false middle_cached_{c}_falseM6C0 x k
 · exact middle_gap_dense_transferM6C0 {shift} {c} true middle_cached_{c}_trueM6C0 x k

theorem middle_cached_{c}_nonnegM6C0 (x k : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r {c} x k := by
 by_cases hk : {shift} ≤ k
 · simpa only [Nat.sub_add_cancel hk] using middle_cached_{c}_shiftM6C0 x (k-{shift}) r
 · exact middle_gap_first_two_baseMF8D x k {c} r (by omega)
end MathGKM.Markov
'''
 (R/'research'/f'MarkovMiddleCachedC{c+3}M6C0.lean').write_text(src)
 (O/f'cached-data-{c}.json').write_text(json.dumps(dict(rows=rows,status='Candidate arrays, mathematical acceptance requires Lean.'),indent=2))
 print(json.dumps(dict(c=c,shift=shift,bytes=len(src),rows=rows)),flush=True)
if __name__=='__main__':run(int(sys.argv[1]),int(sys.argv[2]))
