import MarkovThirdTwoIntegralMF8
import MarkovThirdSparseM115
/-! Machine-authored f8ca2c8b. Cleared two-letter correction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option linter.unusedSimpArgs false

def vTwoCorrectionMF8 (n : ℕ) : ℤ[X] :=
 X^(n+3)*(vDJMF8 n+vDJMF8 (n+1)-X-1)-X^2*vFJMDE6 (n+1)^2-X^3*vFJMDE6 n^2
def vTwoSparseMF8 {R : Type*} [CommRing R] (q x t : R) : R :=
 (1-x)^4*(t*x^2*((1+x)^2*(q-(q+1)*x+t*x)+
 (1+x)^2*(q+1-(q+2)*x+t*x^2)-(1-x)^2*(x+1))-
 x^2*(2-t*x-t*x^2)^2-x^3*(2-t-t*x)^2)

theorem vTwoCorrection_sparseMF8 (n : ℕ) :
 (1-X)^6*vTwoCorrectionMF8 n=vTwoSparseMF8 (n+1:ℤ[X]) X (X^(n+1)) := by
 have he : (1-X)^6*vTwoCorrectionMF8 n=(1-X)^4*(X^(n+3)*
   ((1-X)^2*vDJMF8 n+(1-X)^2*vDJMF8 (n+1)-(1-X)^2*(X+1))-
   X^2*((1-X)*vFJMDE6 (n+1))^2-X^3*((1-X)*vFJMDE6 n)^2) := by
   unfold vTwoCorrectionMF8; ring
 rw [he,vDJclosedMF8,vDJclosedMF8,(vJet_closedMDE6 n).2.2,(vJet_closedMDE6 (n+1)).2.2]
 simp only [vTwoSparseMF8,Nat.cast_add,Nat.cast_one,pow_add,pow_succ]
 ring

attribute [local irreducible] frame
theorem vertical_two_third_clearedMF8 (n : ℕ) :
 let path := List.replicate n false++[true]
 (1+X)^5*(6*X^(n+3)*((frame path).mid.p).coeff 3)=
 vThirdSeedMEA (X:ℤ[X]) n []+6*vTwoCorrectionMF8 n := by
 dsimp only
 let path := List.replicate n false++[true]
 have hi : (frame path).mid.a=2 := by
   rw [(source_vertical_indicesMDE6 n []).1]
   norm_num [frame,initial]
 have hc := vertical_all_order_clearedM9E1 path 3
 rw [hi] at hc
 norm_num only at hc
 rw [add_comm X 1] at hc
 have hf := vertical_two_third_residualMF8 n
 dsimp only at hf
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ hn
 dsimp only [vTwoCorrectionMF8]
 linear_combination 6*X^(n+3)*hc+(1+X)*hf
end
end MathGKM.Markov
