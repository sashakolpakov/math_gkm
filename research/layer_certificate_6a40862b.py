"""Generate a reviewable exact polynomial certificate, then check in Lean."""
import layer_symbolic_6a40862b as p
import json,pathlib
from fractions import Fraction as F
p.N=4
x,d,e,h=[p.var(i) for i in range(4)]
q=x;r=p.add(q,d,p.const(2));j=r;s=p.scale(p.add(d,e,p.const(2)),F(1,2));a=p.add(s,r,h)
n0,d0=p.pair(a,j,s,q,r);n1,d1=p.pair(a,j,s,p.add(q,p.const(1)),p.add(r,p.const(-1)))
v=p.sub(p.mul(n0,d1),p.mul(n1,d0))
def divide(f,g):
 f=f.copy();out={};gm=max(g);gc=g[gm]
 while f:
  fm=max(f);fc=f[fm]
  if any(a<b for a,b in zip(fm,gm)):return None
  m=tuple(a-b for a,b in zip(fm,gm));c=fc/gc;out[m]=c
  f=p.sub(f,p.mul({m:c},g))
 return out
factors=[]
for name,z in [('x',x),('d',d),('e',e),('h',h),('d+e',p.add(d,e))]:
 for shift in range(0,6):
  fac=p.add(z,p.const(shift))
  while v and (w:=divide(v,fac)) is not None:
   factors.append((name,shift));v=w
print(json.dumps(dict(terms=len(v),negative=sum(c<0 for c in v.values()),factors=factors)))
pathlib.Path('evidence/markov-6a40862b/reduced-certificate.json').write_text(json.dumps(dict(factors=factors,terms=[[m,str(c)] for m,c in sorted(v.items())]),indent=2)+'\n')
def scalar(c):
 return str(c.numerator) if c.denominator==1 else f'({c.numerator}/{c.denominator}:ℝ)'
def horner(poly,vs):
 if not vs:return scalar(next(iter(poly.values()),F(0)))
 groups={}
 for m,c in poly.items():groups.setdefault(m[0],{})[m[1:]]=c
 hi=max(groups,default=0)
 ans=horner(groups.get(hi,{}),vs[1:])
 for k in reversed(range(hi)):
  ans=f'({horner(groups.get(k,{}),vs[1:])} + {vs[0]} * {ans})'
 return ans
src='''import Mathlib
/-! Machine-authored 6a40862b. Exact nonnegative certificate for the rational
centered-layer comparison. It does not assert positivity of the aggregate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 0
set_option maxRecDepth 100000
def layerAN6 (s j q : ℝ) := (2*s-j+q)*(2*s-1-j+q)
def layerAD6 (a s q : ℝ) := (a-s-q+1)*(s+q-1)
def layerBN6 (a s q : ℝ) := (a-s-q)*(s+q)
def layerBD6 (s j q : ℝ) := (2*s+2-j+q)*(2*s+1-j+q)
def layerN6 (a j s q r : ℝ) :=
 layerAN6 s j q * layerBN6 a s r * layerAD6 a s r * layerBD6 s j q +
 layerAN6 s j r * layerBN6 a s q * layerAD6 a s q * layerBD6 s j r
def layerD6 (a j s q r : ℝ) :=
 layerAD6 a s q * layerBD6 s j q * layerAD6 a s r * layerBD6 s j r
'''
# Split the positive polynomial by x power to keep each positivity proof small.
groups={}
for m,c in v.items():groups.setdefault(m[0],{})[m[1:]]=c
for k,g in sorted(groups.items()):
 src+=f'def layerC6_{k} (d e h : ℝ) : ℝ := '+horner(g,['d','e','h'])+'\n'
 src+=f'theorem layerC6_{k}_nonneg (d e h : ℝ) (hd : 0≤d) (he : 0≤e) (hh : 0≤h) : 0≤layerC6_{k} d e h := by\n unfold layerC6_{k}\n positivity\n'
expr=' + '.join(f'x^{k} * layerC6_{k} d e h' for k in sorted(groups))
src+=f'def layerCert6 (x d e h : ℝ) := {expr}\n'
src+='theorem layerCert6_nonneg (x d e h : ℝ) (hx : 0≤x) (hd : 0≤d) (he : 0≤e) (hh : 0≤h) : 0≤layerCert6 x d e h := by\n'
for k in sorted(groups):src+=f' have h{k} := layerC6_{k}_nonneg d e h hd he hh\n'
src+=' unfold layerCert6\n positivity\n'
src+='''theorem layer_certificate_identity6 (x d e h : ℝ) :
 let s := (d+e+2)/2
 let r := x+d+2
 let a := s+r+h
 layerN6 a r s x r * layerD6 a r s (x+1) (r-1) -
 layerN6 a r s (x+1) (r-1) * layerD6 a r s x r =
 (d+1)*(e+2)*(d+e+3)*layerCert6 x d e h := by
 dsimp only
 unfold layerN6 layerD6 layerAN6 layerAD6 layerBN6 layerBD6 layerCert6
'''
src+=' unfold '+' '.join(f'layerC6_{k}' for k in sorted(groups))+'\n ring\n'
src+='''theorem layer_cleared_monotone6 (a j s q r : ℝ)
 (hq : 0≤q) (hqr : q+2≤r) (hrj : r≤j) (hj : j≤2*s+q)
 (ha : s+r≤a) :
 layerN6 a j s (q+1) (r-1) * layerD6 a j s q r ≤
 layerN6 a j s q r * layerD6 a j s (q+1) (r-1) := by
 let x := q+(j-r)/2
 let d := r-q-2
 let e := 2*s-j+q
 let h := a-s-r
 have hx : 0≤x := by dsimp [x]; linarith
 have hd : 0≤d := by dsimp [d]; linarith
 have he : 0≤e := by dsimp [e]; linarith
 have hh : 0≤h := by dsimp [h]; linarith
 have hp := layerCert6_nonneg x d e h hx hd he hh
 have hi := layer_certificate_identity6 x d e h
 have ht : 0≤(d+1)*(e+2)*(d+e+3)*layerCert6 x d e h := by positivity
 rw [← hi] at ht
 have heq :
   (let s' := (d+e+2)/2; let r' := x+d+2; let a' := s'+r'+h;
    layerN6 a' r' s' x r' * layerD6 a' r' s' (x+1) (r'-1) -
    layerN6 a' r' s' (x+1) (r'-1) * layerD6 a' r' s' x r') =
   layerN6 a j s q r * layerD6 a j s (q+1) (r-1) -
   layerN6 a j s (q+1) (r-1) * layerD6 a j s q r := by
   dsimp [x,d,e,h,layerN6,layerD6,layerAN6,layerAD6,layerBN6,layerBD6]
   ring
 rw [heq] at ht
 linarith
#print axioms layer_certificate_identity6
#print axioms layer_cleared_monotone6
end
end MathGKM.Markov
'''
pathlib.Path('research/MarkovLayerCertificate6a40.lean').write_text(src)
