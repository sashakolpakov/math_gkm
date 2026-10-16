"""Machine-authored exact source-to-quotient adapters for a=4,5,6."""
from pathlib import Path
from math import gcd
R=Path('/Users/sasha/math_gkm')
for a in range(4,7):
 for r in range(1,a):
  if gcd(a,r)!=1:continue
  tag=f'{a}{r}';mod=f'MarkovThirdSmallBridge{tag}MAE2'
  summ='+\n   '.join(('' if k==0 else f'X^({k}*(n+1))*')+f'sThird{tag}J{k}MAE2 (n+1:ℤ[X]) X' for k in range(4))
  s=f'''import MarkovThirdSmallBlocks{tag}MAE2
import MarkovThirdSmallSourceMAE2
/-! Machine-authored ae257c53. Exact source quotient identity, LC remains unproved. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option maxRecDepth 32768
attribute [local irreducible] frame
theorem sThird{tag}sourceMAE2 (n : ℕ) (rest : List Bool) (hn : 1≤n)
 (ha : (frame rest).mid.a={a-r}) (hb : (frame rest).mid.b={a}) :
 let path := List.replicate n false++true::rest
 (1-X)^6*(6*((frame path).mid.p).coeff 3)=
 X^((frame path).mid.b-3*(n+2))*({summ}) := by
 dsimp only
 simp only [one_mul]
 let path := List.replicate n false++true::rest
 have hi : (frame path).mid.a={a} := by rw [(source_vertical_indicesMDE6 n rest).1,hb]
 have hf := vertical_third_small_clearedMAE2 n rest (by omega) (by omega) hn
 dsimp only at hf
 change 6*(1+X)^(7-(frame path).mid.a)*((frame path).mid.p).coeff 3=
   X^((frame path).mid.b-3*(n+2))*vThirdSeedMEA (X:ℤ[X]) n rest at hf
 rw [hi] at hf
 norm_num only at hf
 have hs := vThirdSeed_four_blocksM115 n rest
 simp only [vThirdNumeratorM115,ha,hb] at hs
 norm_num [Nat.min_def] at hs
 rw ['''+','.join(f'←sThird{tag}block{k}MAE2 (n+1:ℤ[X]) X' for k in range(4))+f'''] at hs
 have hne : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero {7-a} hne)
 linear_combination (1-X)^6*hf+X^((frame path).mid.b-3*(n+2))*hs
end
end MathGKM.Markov
'''
  (R/f'research/{mod}.lean').write_text(s)
print('Eight source bridge candidates written.')
