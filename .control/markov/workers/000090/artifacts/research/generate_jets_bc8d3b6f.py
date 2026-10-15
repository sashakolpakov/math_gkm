"""Machine-authored factored rational normalizations for component jets."""
from generate_bc8d3b6f import *
from math import lcm
def rat_expr(a):
 scale=lcm(*(v.denominator for v in a.p.values()))
 num=expr(a.p,['N','Z','C','R','Q','T','U','x'],scale)
 return num,scale,a.d
def main():
 for e in range(4):
  text=header
  for k in range(5 if e in [1,3] else 4):
   a=z.jet(e,k) if k<4 else jet4(e)
   body,scale,d=rat_expr(a);name=f'jetNum{e}{k}BC'
   text+=f'\ndef {name} {{A : Type*}} [CommRing A] (N Z x : A) : A :=\n {body}\n'
   old=f'closedJetBDEE {e} {k}' if k<4 else ('closedB4N6604' if e==1 else 'closedD4N6604')
   orig=f'jetClosed{e}{k}BDEE' if k<4 else f'jetClosed{e}{k}N6604'
   text+=f'''theorem jet_normalize_{e}{k}BC (n : ℕ) :
 {old} n=jetNum{e}{k}BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   ({scale}*(1-runXBDEE)^{d}) := by
 change runEmbedBDEE ({orig} n)/({6 if k<4 else 24}*(1-runXBDEE)^{2*k+1})=_
 unfold {orig} {name} runXBDEE
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring
'''
  text+='end\nend MathGKM.Markov\n'
  (R/f'research/MarkovJetNorm{e}BC.lean').write_text(text)
if __name__=='__main__':main()
