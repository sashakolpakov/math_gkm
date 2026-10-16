"""Machine-authored third-column small-source identity, preserving literal coefficients."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
s=(R/'research/MarkovThirdSourceMEA.lean').read_text()
start=s.index('theorem vertical_third_seed_factorMEA')
end=s.index('theorem vertical_third_all_run_factorMEA')
t=s[start:end].replace('vertical_third_seed_factorMEA','vertical_third_seed_factor_smallMAE2')
t=t.replace('(ha : 7 ≤ (frame rest).mid.b)', '(ha : 4 ≤ (frame rest).mid.b) (hn : 1 ≤ n)')
t=t.replace('have hb : 3*(n+2) ≤ b := by dsimp [b,path]; omega','have hr := (frame_reduced rest).2.1\n have hb : 3*(n+2) ≤ b := by dsimp [b,path]; omega')
header='''import MarkovThirdSourceMEA
/-! Machine-authored ae257c53. Small-numerator third-column identities only.
No quotient log-concavity is asserted. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame
'''
tail='''theorem vertical_third_small_clearedMAE2 (n : ℕ) (rest : List Bool)
 (ha : 4 ≤ (frame rest).mid.b) (hb : (frame rest).mid.b ≤ 7) (hn : 1 ≤ n) :
 let path := List.replicate n false++true::rest
 6*(1+X)^(7-(frame path).mid.a)*((frame path).mid.p).coeff 3=
 X^((frame path).mid.b-3*(n+2))*vThirdSeedMEA (X:ℤ[X]) n rest := by
 dsimp only
 let path := List.replicate n false++true::rest
 let a := (frame path).mid.a
 have hi : a=(frame rest).mid.b := (source_vertical_indicesMDE6 n rest).1
 have hc := vertical_all_order_clearedM9E1 path 3
 have hf := vertical_third_seed_factor_smallMAE2 n rest ha hn
 dsimp only at hf
 have hp : 6*(1+X)^6*((frame path).mid.p).coeff 3=
   (1+X)^(a-1)*(X^((frame path).mid.b-3*(n+2))*vThirdSeedMEA (X:ℤ[X]) n rest) := by
   rw [add_comm X 1] at hc
   linear_combination 6*hc+(1+X)^(a-1)*hf
 have hne : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero (a-1) hne)
 have he : (1+X:ℤ[X])^6=(1+X)^(a-1)*(1+X)^(7-a) := by
   rw [←pow_add]; congr 1; omega
 rw [he] at hp
 linear_combination hp
end
end MathGKM.Markov
'''
(R/'research/MarkovThirdSmallSourceMAE2.lean').write_text(header+t+tail)
