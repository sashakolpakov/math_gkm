import MarkovMomentSupportM37B
/-! Machine-authored 37bf1d20. Sharpness obstruction for a source-independent
support argument. This is explicitly not a Markov-source counterexample. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

theorem symmetric_two_point_gapM37B (H w : ℝ) :
 let A := (H-w)/2
 let B := (H+w)/2
 let W := (2:ℝ)
 let U := A+B
 let V := A^2+B^2
 U*(H*W-U)-H*(W*V-U^2)=H*(H-w^2) := by
 dsimp only
 ring

theorem symmetric_two_point_iffM37B (H w : ℝ) (hH : 0 < H) :
 let A := (H-w)/2
 let B := (H+w)/2
 H*(2*(A^2+B^2)-(A+B)^2) ≤ (A+B)*(2*H-(A+B)) ↔ w^2 ≤ H := by
 dsimp only
 have h := symmetric_two_point_gapM37B H w
 dsimp only at h
 rw [←sub_nonneg]
 have he : ((H-w)/2+(H+w)/2)*(2*H-((H-w)/2+(H+w)/2))-
   H*(2*(((H-w)/2)^2+((H+w)/2)^2)-((H-w)/2+(H+w)/2)^2)=H*(H-w^2) := by
   convert h using 1 <;> ring
 rw [he,mul_nonneg_iff_of_pos_left hH,sub_nonneg]

theorem generic_support_counterexampleM37B :
 let Q : ℝ[X] := (1+X)^12*(1+X^4)
 Q.coeff 8^2 < Q.coeff 7*Q.coeff 9 := by
 dsimp only
 have he : (1+(X:ℝ[X]))=X+1 := by ring
 rw [he,mul_add,mul_one]
 norm_num [coeff_add,coeff_mul_X_pow',coeff_X_add_one_pow,Nat.choose]

end
end MathGKM.Markov
