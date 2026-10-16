"""Machine-authored staged exact identities for smaller Lean normalization tasks."""
from poly_probe_0d346fa7 import *
from fractions import Fraction as F
from functools import reduce
from math import lcm
R=Path('research');O=Path('evidence/markov-29509309')
def expr(p):
 den=reduce(lcm,(v.denominator for v in p.values()),1)
 return '(\n  '+' +\n  '.join('('+str(int(v*den))+')'+(' * x'+(f'^{a}' if a!=1 else '') if a else '')+(' * y'+(f'^{b}' if b!=1 else '') if b else '') for (a,b),v in sorted(p.items()))+'\n ) / '+str(den)
def main():
 for name,fn in [('lower',L),('upper',U)]:
  module='MarkovEight'+name.title()+'PolyM295'
  src=f'''import MarkovVerticalPolyM0D3
/-! Machine-authored 29509309. Exact intermediate polynomial identity. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 8192
def {name}EightPolyM295 (x y : ℚ) : ℚ := {expr(fn(X,Y,8))}
theorem {name}_eight_polyM295 (x y : ℚ) :
 {name}PolynomialM0D3 8 x y = {name}EightPolyM295 x y := by
 unfold {name}EightPolyM295
 norm_num [{name}PolynomialM0D3,Finset.sum_range_succ,
   choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.choose]
 trace "coefficient expression expanded"
 ring
end
end MathGKM.Markov
'''
  (R/f'{module}.lean').write_text(src)
  print(module,len(src))
if __name__=='__main__':main()
