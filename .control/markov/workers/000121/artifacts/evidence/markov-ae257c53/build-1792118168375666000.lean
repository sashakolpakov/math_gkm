import MarkovThirdSmallBlocks41MAE2
import MarkovThirdSmallSourceMAE2
/-! Machine-authored ae257c53. Exact source quotient identity, LC remains unproved. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
attribute [local irreducible] frame
theorem sThird41sourceMAE2 (n : ℕ) (rest : List Bool) (hn : 1≤n)
 (ha : (frame rest).mid.a=3) (hb : (frame rest).mid.b=4) :
 let path := List.replicate n false++true::rest
 (1-X)^6*(6*((frame path).mid.p).coeff 3)=
 X^((frame path).mid.b-3*(n+2))*(sThird41J0MAE2 (n+1:ℤ[X]) X+
   X^(1*(n+1))*sThird41J1MAE2 (n+1:ℤ[X]) X+
   X^(2*(n+1))*sThird41J2MAE2 (n+1:ℤ[X]) X+
   X^(3*(n+1))*sThird41J3MAE2 (n+1:ℤ[X]) X) := by
 dsimp only
 simp only [one_mul]
 let path := List.replicate n false++true::rest
 have hi : (frame path).mid.a=4 := by rw [(source_vertical_indicesMDE6 n rest).1,hb]
 have hf := vertical_third_small_clearedMAE2 n rest (by omega) (by omega) hn
 dsimp only at hf
 change 6*(1+X)^(7-(frame path).mid.a)*((frame path).mid.p).coeff 3=
   X^((frame path).mid.b-3*(n+2))*vThirdSeedMEA (X:ℤ[X]) n rest at hf
 rw [hi] at hf
 norm_num only at hf
 have hs := vThirdSeed_four_blocksM115 n rest
 simp only [vThirdNumeratorM115,ha,hb] at hs
 norm_num only [Nat.min_def] at hs
 rw [←sThird41block0MAE2 (n+1:ℤ[X]) X,←sThird41block1MAE2 (n+1:ℤ[X]) X,←sThird41block2MAE2 (n+1:ℤ[X]) X,←sThird41block3MAE2 (n+1:ℤ[X]) X] at hs
 have hne : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero 3 hne)
 linear_combination (1-X)^6*hf+X^((frame path).mid.b-3*(n+2))*hs
end
end MathGKM.Markov
