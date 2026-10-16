"""Machine-authored generator of explicit Lean ring certificates.
Python output is untrusted; Lean must check every identity and inequality.
"""
from poly_probe_0d346fa7 import *
from functools import reduce
from math import lcm,gcd
R=Path('research')
def expr(p):
 den=reduce(lcm,(v.denominator for v in p.values()),1)
 terms=[]
 for (a,b),v in sorted(p.items()):
  c=int(v*den);assert c>=0
  terms.append(str(c)+(' * x'+('^'+str(a) if a!=1 else '') if a else '')+(' * y'+('^'+str(b) if b!=1 else '') if b else ''))
 return '(\n   '+' +\n   '.join(terms)+'\n  ) / '+str(den)
def main():
 source='''import MarkovVerticalPolyM0D3
/-! Machine-authored 0d346fa7. Exact rational gap certificates. Python generated
the proposed identities; ordinary Lean ring normalization proves them. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000
set_option maxRecDepth 4096
'''
 specs=[]
 specs.append(('lower',gap(L(X,add(Y,const(2)),4),L(add(X,one),add(Y,one),4),L(add(X,const(2)),Y,4)),
 'lowerPolynomialM0D3 4 (x+1) (y+1)^2 -\n+  lowerPolynomialM0D3 4 x (y+2)*lowerPolynomialM0D3 4 (x+2) y'))
 specs.append(('upper',gap(U(add(X,const(4)),add(Y,one),4),U(add(X,const(3)),add(Y,const(2)),4),U(add(X,const(2)),add(Y,const(3)),4)),
 'upperPolynomialM0D3 4 (x+3) (y+2)^2 -\n+  upperPolynomialM0D3 4 (x+4) (y+1)*upperPolynomialM0D3 4 (x+2) (y+3)'))
 q=add(X,const(3))
 specs.append(('cross_one',gap(L(add(q,const(-1)),one,4),L(q,{},4),U(add(q,const(-1)),one,4)),
 'lowerPolynomialM0D3 4 (x+3) 0^2 -\n+  lowerPolynomialM0D3 4 (x+2) 1*upperPolynomialM0D3 4 (x+2) 1'))
 q=add(X,const(4))
 specs.append(('cross_two',gap(L(q,{},4),U(add(q,const(-1)),one,4),U(add(q,const(-2)),const(2),4)),
 'upperPolynomialM0D3 4 (x+3) 1^2 -\n+  lowerPolynomialM0D3 4 (x+4) 0*upperPolynomialM0D3 4 (x+2) 2'))
 for name,p,lhs in specs:
  lhs=lhs.replace('\n+','\n')
  args='(x y : ℚ)' if name in ['lower','upper'] else '(x : ℚ)'
  source+=f'\ndef {name}GapFourM0D3 {args} : ℚ := {expr(p)}\n'
  source+=f'\ntheorem {name}_gap_fourM0D3 {args} :\n+ {lhs} = {name}GapFourM0D3 x'+(' y' if name in ['lower','upper'] else '')+' := by\n'
  source=source.replace('\n+','\n')
  source+=f''' unfold {name}GapFourM0D3
 norm_num [lowerPolynomialM0D3,upperPolynomialM0D3,Finset.sum_range_succ,
   choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.choose]
 ring
'''
  source+=f'\ntheorem {name}_gap_four_nonnegM0D3 {args} (hx : 0 ≤ x)'+(' (hy : 0 ≤ y)' if name in ['lower','upper'] else '')+' :\n+ 0 ≤ '+lhs+' := by\n'
  source=source.replace('\n+','\n')
  source+=f' rw [{name}_gap_fourM0D3]\n unfold {name}GapFourM0D3\n positivity\n'
 source+='\nend\nend MathGKM.Markov\n'
 (R/'MarkovFourCertificateM0D3.lean').write_text(source)
 print('Generated',len(source),'bytes; identities still require Lean validation.')
if __name__=='__main__':main()
