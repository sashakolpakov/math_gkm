"""Split exact certificate checking by the degree-four x coefficient identity."""
import layer_symbolic_6a40862b as p
from fractions import Fraction as F
from pathlib import Path
p.N=4
x,d,e,h=[p.var(i) for i in range(4)]
r=p.add(x,d,p.const(2));s=p.scale(p.add(d,e,p.const(2)),F(1,2));a=p.add(s,r,h)
n0,d0=p.pair(a,r,s,x,r);n1,d1=p.pair(a,r,s,p.add(x,p.const(1)),p.add(r,p.const(-1)))
def sc(c):return str(c.numerator) if c.denominator==1 else f'({c.numerator}/{c.denominator}:ℝ)'
def horner(poly,vs):
 if not vs:return sc(next(iter(poly.values()),F(0)))
 groups={}
 for m,c in poly.items():groups.setdefault(m[0],{})[m[1:]]=c
 hi=max(groups,default=0);ans=horner(groups.get(hi,{}),vs[1:])
 for k in reversed(range(hi)):ans=f'({horner(groups.get(k,{}),vs[1:])} + {vs[0]} * {ans})'
 return ans
src='''import MarkovLayerPositive6a40
/-! Machine-authored 6a40862b. Split exact certificate identity. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 0
set_option maxRecDepth 100000
'''
for name,poly in [('n0',n0),('d0',d0),('n1',n1),('d1',d1)]:
 groups={}
 for m,c in poly.items():groups.setdefault(m[0],{})[m[1:]]=c
 for k in range(3):src+=f'def lc6_{name}_{k} (d e h : ℝ) := {horner(groups.get(k,{}),["d","e","h"])}\n'
 fun='layerN6' if name[0]=='n' else 'layerD6'
 args='x (x+d+2)' if name[1]=='0' else '(x+1) (x+d+1)'
 src+=f'''theorem expand6_{name} (x d e h : ℝ) :
 {fun} ((d+e+2)/2+(x+d+2)+h) (x+d+2) ((d+e+2)/2) {args} =
 lc6_{name}_0 d e h + x*lc6_{name}_1 d e h + x^2*lc6_{name}_2 d e h := by
 unfold {fun} layerAN6 layerAD6 layerBN6 layerBD6 lc6_{name}_0 lc6_{name}_1 lc6_{name}_2
 ring
'''
for k in range(5):
 terms=[f'(lc6_n0_{i} d e h * lc6_d1_{k-i} d e h - lc6_n1_{i} d e h * lc6_d0_{k-i} d e h)' for i in range(3) if 0<=k-i<3]
 src+=f'theorem coeff_identity6_{k} (d e h : ℝ) : '+ ' + '.join(terms)+f' = (d+1)*(e+2)*(d+e+3)*layerC6_{k} d e h := by\n'
 src+=' unfold '+' '.join(f'lc6_{n}_{i}' for n in ['n0','d0','n1','d1'] for i in range(3))+f' layerC6_{k}\n ring\n'
src+='''theorem layer_certificate_identity6 (x d e h : ℝ) :
 let s := (d+e+2)/2
 let r := x+d+2
 let a := s+r+h
 layerN6 a r s x r * layerD6 a r s (x+1) (r-1) -
 layerN6 a r s (x+1) (r-1) * layerD6 a r s x r =
 (d+1)*(e+2)*(d+e+3)*layerCert6 x d e h := by
 dsimp only
 rw [show x+d+2-1=x+d+1 by ring,expand6_n0,expand6_d0,expand6_n1,expand6_d1]
 unfold layerCert6
 linear_combination (coeff_identity6_0 d e h) + x*(coeff_identity6_1 d e h) +
   x^2*(coeff_identity6_2 d e h) + x^3*(coeff_identity6_3 d e h) + x^4*(coeff_identity6_4 d e h)
#print axioms layer_certificate_identity6
end
end MathGKM.Markov
'''
Path('research/MarkovLayerIdentity6a40.lean').write_text(src)
