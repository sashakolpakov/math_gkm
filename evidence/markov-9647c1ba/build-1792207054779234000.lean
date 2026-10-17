import MarkovThirdMarginCertificateM964
import MarkovThirdOutputM964
/-! Machine-authored 9647c1ba. Uniform multiplicative bounds for the actual
third correction; the second terminal coefficient uses its binomial factor j. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000

def thirdBoundM964 (d s : ℕ) (r : Bool) : ℝ :=
 (thirdCM964 r:ℝ)*d/(s+1)+thirdLM964 d r

theorem third_bound_nonnegM964 (d s : ℕ) (r : Bool) : 0 ≤ thirdBoundM964 d s r := by
 unfold thirdBoundM964; positivity

theorem third_extra_boundM964 (d s n : ℕ) (r : Bool) :
 thirdExtraM964 d (s+n) r ≤ thirdBoundM964 d s r := by
 unfold thirdExtraM964 absorbedExtraM418 thirdBoundM964
 apply add_le_add _ le_rfl
 apply div_le_div₀ (by positivity)
 · apply mul_le_mul_of_nonneg_left _ (Nat.cast_nonneg _)
   exact_mod_cast Nat.sub_le d (s+n)
 · positivity
 · push_cast; linarith [Nat.cast_nonneg (α:=ℝ) n]

theorem third_second_slot_boundM964 (d s : ℕ) (r : Bool) :
 (thirdVM964 d r:ℝ) ≤ thirdBoundM964 d s r*thirdJM964 d r := by
 have hL : (thirdLM964 d r:ℝ) ≤ thirdBoundM964 d s r := by
   unfold thirdBoundM964
   have h : (0:ℝ) ≤ (thirdCM964 r:ℝ)*d/(s+1) := by positivity
   linarith
 have h := mul_le_mul_of_nonneg_right hL (Nat.cast_nonneg (thirdJM964 d r))
 have hd : (0:ℝ) ≤ d := Nat.cast_nonneg d
 have hp : (thirdVM964 d r:ℝ) ≤ (thirdLM964 d r:ℝ)*thirdJM964 d r := by
   cases r <;> simp [thirdVM964,thirdLM964,thirdJM964] <;> nlinarith
 exact hp.trans h

theorem base_choose_tenM964 (j s : ℕ) (hs : 7 ≤ s) :
 thirdMarginBaseM964 j ≤ ((s+j+3).choose j:ℚ) := by
 have hm := Nat.choose_le_choose j (by omega : j+10 ≤ s+j+3)
 have he := Nat.ascFactorial_eq_factorial_mul_choose j 10
 have heq : ((j:ℚ)+1)*((j:ℚ)+2)*((j:ℚ)+3)*((j:ℚ)+4)*((j:ℚ)+5)*
     ((j:ℚ)+6)*((j:ℚ)+7)*((j:ℚ)+8)*((j:ℚ)+9)*((j:ℚ)+10)=
     3628800*((j+10).choose 10:ℚ) := by
   exact_mod_cast (by simpa [Nat.ascFactorial_succ,Nat.factorial,
     Nat.mul_assoc,Nat.mul_comm,Nat.mul_left_comm] using he)
 have hs' : (j+10).choose 10=(j+10).choose j := by
   simpa using (Nat.choose_symm (show 10 ≤ j+10 by omega)).symm
 rw [hs'] at heq
 have hmq : ((j+10).choose j:ℚ) ≤ ((s+j+3).choose j:ℚ) := by exact_mod_cast hm
 unfold thirdMarginBaseM964
 linarith

theorem third_margin_rationalM964 (d s : ℕ) (r : Bool) (hs : 7 ≤ s) (hd : s ≤ d+1) :
 let j := thirdJM964 d r
 let B : ℚ := (s+j+3).choose j
 let U := thirdBoundNumeratorM964 s d r/((s:ℚ)+1)
 (2*B*U+U^2)*(liftTermMAE9 j (s+1) 0:ℚ)^2 ≤
 B^2*(((s+1+j+3).choose j:ℚ)^2-((s+j+3).choose j:ℚ)*((s+2+j+3).choose j:ℚ)) := by
 let j := thirdJM964 d r
 let B : ℚ := (s+j+3).choose j
 let U := thirdBoundNumeratorM964 s d r/((s:ℚ)+1)
 let F : ℚ := B^2*(s+j+4)/(((s:ℚ)+1)^2*(s+4)^2*(s+5)^2*(s+6)^2)
 have hj : (j:ℚ)=(d:ℚ)+(if r then 9 else 8) := by cases r <;> simp [j,thirdJM964]
 have hB := base_choose_tenM964 j s hs
 rw [hj] at hB
 have hd' : (s:ℚ)-1 ≤ d := by exact_mod_cast (show (s:ℤ)-1 ≤ d by omega)
 have H := third_margin_nonnegM964 s d B r (by exact_mod_cast hs) hd' hB
 have hF : 0 ≤ F := by dsimp [F]; positivity
 have hp := mul_nonneg hF H
 have hj2 : 2 ≤ j := by dsimp [j,thirdJM964]; split_ifs <;> omega
 rcases cut_kernel_valuesMFEE j s hj2 with ⟨_,h10,_,_,_⟩
 have h1 := base_choose_stepMFEE j s
 have h2 := base_choose_twoMFEE j s
 have he : B^2*(((s+1+j+3).choose j:ℚ)^2-
     ((s+j+3).choose j:ℚ)*((s+2+j+3).choose j:ℚ))-
     (2*B*U+U^2)*(liftTermMAE9 j (s+1) 0:ℚ)^2=
   F*thirdMarginScalarM964 s d B r := by
   rw [h10,h1,h2]
   dsimp [F,U,B,thirdMarginScalarM964,cutNext0MFEE,liftWeightMAE9,liftDenMAE9]
   rw [←hj]
   push_cast
   field_simp
   <;> ring
 change (2*B*U+U^2)*(liftTermMAE9 j (s+1) 0:ℚ)^2 ≤ _
 linarith

theorem third_bound_castM964 (d s : ℕ) (r : Bool) :
 ((thirdBoundNumeratorM964 s d r/((s:ℚ)+1):ℚ):ℝ)=thirdBoundM964 d s r := by
 unfold thirdBoundNumeratorM964 thirdBoundM964 thirdCM964 thirdLM964
 have hs : (s:ℝ)+1≠0 := by positivity
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;> push_cast
   <;> field_simp <;> ring

theorem third_robust_marginM964 (d s : ℕ) (r : Bool) (hs : 7 ≤ s) (hd : s ≤ d+1) :
 let j := thirdJM964 d r
 let B : ℝ := (s+j+3).choose j
 (B+thirdBoundM964 d s r)^2*kernelScaleMA64 j s ≤
 B^2*kernelScaleMA64 j s+(B+thirdBoundM964 d s r)^2*topGapMA64 j s := by
 let j := thirdJM964 d r
 let B : ℝ := (s+j+3).choose j
 have h := (Rat.cast_le (K:=ℝ)).mpr (third_margin_rationalM964 d s r hs hd)
 have hu := third_bound_castM964 d s r
 push_cast at h hu
 rw [hu] at h
 have hscale : kernelScaleMA64 (thirdJM964 d r) s=(liftTermMAE9 (thirdJM964 d r) (s+1) 0:ℝ)^2 := by
   rw [kernelScaleMA64,complete_coeffMA64]
 rw [←hscale] at h
 change (2*B*thirdBoundM964 d s r+thirdBoundM964 d s r^2)*kernelScaleMA64 j s ≤
   B^2*topGapMA64 j s at h
 have hN := top_gap_nonnegMA64 j s
 have hU := third_bound_nonnegM964 d s r
 have hB : 0 ≤ B := by dsimp [B]; positivity
 have hmore := mul_nonneg hN (show 0 ≤ 2*B*thirdBoundM964 d s r+thirdBoundM964 d s r^2 by positivity)
 change (B+thirdBoundM964 d s r)^2*kernelScaleMA64 j s ≤ _
 nlinarith only [h,hmore]

end
end MathGKM.Markov
