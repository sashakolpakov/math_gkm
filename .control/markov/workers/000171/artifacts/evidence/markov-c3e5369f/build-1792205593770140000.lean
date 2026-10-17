import MarkovSecondMarginCertificateMC3E
import MarkovPerturbKernelMC3E
/-! Machine-authored c3e5369f. Exact scalar bounds for the actual two residues. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000

def secondJMC3E (d : ℕ) (r : Bool) : ℕ := d+(if r then 6 else 5)
def secondExtraMC3E (d t : ℕ) (r : Bool) : ℝ :=
 absorbedExtraM418 d t (if r then 36 else 24)+(if r then 8*d+24 else 4*d+12)

theorem base_choose_sevenMC3E (j t : ℕ) (ht : 4 ≤ t) :
 secondMarginBaseMC3E j ≤ ((t+j+3).choose j:ℚ) := by
 have hm := Nat.choose_le_choose j (by omega : j+7 ≤ t+j+3)
 have he := Nat.ascFactorial_eq_factorial_mul_choose j 7
 have heq : ((j:ℚ)+1)*((j:ℚ)+2)*((j:ℚ)+3)*((j:ℚ)+4)*((j:ℚ)+5)*((j:ℚ)+6)*((j:ℚ)+7)=
     5040*((j+7).choose 7:ℚ) := by
   exact_mod_cast (by simpa [Nat.ascFactorial_succ,Nat.factorial,
     Nat.mul_assoc,Nat.mul_comm,Nat.mul_left_comm] using he)
 have hs : (j+7).choose 7=(j+7).choose j := by
   simpa using (Nat.choose_symm (show 7 ≤ j+7 by omega)).symm
 rw [hs] at heq
 have hmq : ((j+7).choose j:ℚ) ≤ ((t+j+3).choose j:ℚ) := by exact_mod_cast hm
 unfold secondMarginBaseMC3E
 linarith

theorem second_extra_nonnegMC3E (d t : ℕ) (r : Bool) : 0 ≤ secondExtraMC3E d t r := by
 cases r <;> unfold secondExtraMC3E absorbedExtraM418 <;> positivity

theorem second_extra_monoMC3E (d t s : ℕ) (r : Bool) :
 secondExtraMC3E d (t+s) r ≤ secondExtraMC3E d t r := by
 have hd : ((d-(t+s):ℕ):ℝ) ≤ ((d-t:ℕ):ℝ) := by exact_mod_cast (show d-(t+s) ≤ d-t by omega)
 have ht : (t:ℝ)+1 ≤ (t+s:ℕ)+1 := by push_cast; linarith [Nat.cast_nonneg (α:=ℝ) s]
 have h (c : ℝ) (hc : 0 ≤ c) : absorbedExtraM418 d (t+s) c ≤ absorbedExtraM418 d t c := by
   unfold absorbedExtraM418
   exact div_le_div₀ (by positivity) (mul_le_mul_of_nonneg_left hd hc) (by positivity) ht
 cases r <;> simp only [secondExtraMC3E,Bool.false_eq_true,if_false,if_true]
 · exact add_le_add (h 24 (by norm_num)) le_rfl
 · exact add_le_add (h 36 (by norm_num)) le_rfl

theorem second_margin_rationalMC3E (d t : ℕ) (r : Bool) (ht : 4 ≤ t) (hd : t ≤ d) :
 let j := secondJMC3E d r
 let u := secondBoundNumeratorMC3E t d r/((t:ℚ)+1)
 2*u*(liftTermMAE9 j (t+2) 0:ℚ)+u^2 ≤
 ((t+1+j+3).choose j:ℚ)^2-((t+j+3).choose j:ℚ)*((t+2+j+3).choose j:ℚ) := by
 let j := secondJMC3E d r
 have hj : (j:ℚ)=(d:ℚ)+(if r then 6 else 5) := by cases r <;> simp [j,secondJMC3E]
 have hB := base_choose_sevenMC3E j t ht
 rw [hj] at hB
 have h := second_margin_nonnegMC3E t d ((t+j+3).choose j) r
   (by exact_mod_cast ht) (by exact_mod_cast hd) hB
 have h1 := base_choose_stepMFEE j t
 have h2 := base_choose_twoMFEE j t
 have hL := cut_last_zero_valueM418 j t
 change 2*(secondBoundNumeratorMC3E t d r/((t:ℚ)+1))*(liftTermMAE9 j (t+2) 0:ℚ)+
   _ ≤ _
 have he : ((t+1+j+3).choose j:ℚ)^2-
   ((t+j+3).choose j:ℚ)*((t+2+j+3).choose j:ℚ)-
   (2*(secondBoundNumeratorMC3E t d r/((t:ℚ)+1))*(liftTermMAE9 j (t+2) 0:ℚ)+
     (secondBoundNumeratorMC3E t d r/((t:ℚ)+1))^2)=
   secondMarginValueMC3E t d ((t+j+3).choose j) r := by
   rw [h1,h2,hL]
   unfold secondMarginValueMC3E cutLast0M418 liftWeightMAE9 liftDenMAE9
   rw [←hj]
   push_cast
   field_simp
   <;> ring
 linarith

theorem second_border_rationalMC3E (d t : ℕ) (r : Bool) (ht : 4 ≤ t) (hd : t ≤ d) :
 let j := secondJMC3E d r
 (secondBoundNumeratorMC3E t d r/((t:ℚ)+1))*((j:ℚ)*(t+j+5)/(t+5))*(liftTermMAE9 j (t+1) 0:ℚ)^2 ≤
 (((t+1+j+3).choose j:ℚ)^2-((t+j+3).choose j:ℚ)*((t+2+j+3).choose j:ℚ))*
   (liftTermMAE9 j (t+1) 1:ℚ) := by
 let j := secondJMC3E d r
 let B : ℚ := ((t+j+3).choose j:ℚ)
 let F : ℚ := B^2*j*(t+j+4)^2/((t+1)*(t+4)^3*(t+5)^3*(t+6)^2*(t+7))
 have hj : (j:ℚ)=(d:ℚ)+(if r then 6 else 5) := by cases r <;> simp [j,secondJMC3E]
 have hB := base_choose_sevenMC3E j t ht
 rw [hj] at hB
 have hF : 0 ≤ F := by dsimp [F]; positivity
 have hs := second_border_nonnegMC3E t d B r
   (by exact_mod_cast ht) (by exact_mod_cast hd) hB
 have hp := mul_nonneg hF hs
 have hj1 : 2 ≤ j := by dsimp [j,secondJMC3E]; split_ifs <;> omega
 rcases cut_kernel_valuesMFEE j t hj1 with ⟨_,h10,h11,_,_⟩
 have h1 := base_choose_stepMFEE j t
 have h2 := base_choose_twoMFEE j t
 have he : (((t+1+j+3).choose j:ℚ)^2-
   ((t+j+3).choose j:ℚ)*((t+2+j+3).choose j:ℚ))*(liftTermMAE9 j (t+1) 1:ℚ)-
   (secondBoundNumeratorMC3E t d r/((t:ℚ)+1))*((j:ℚ)*(t+j+5)/(t+5))*(liftTermMAE9 j (t+1) 0:ℚ)^2=
   F*secondBorderScalarMC3E t d B r := by
   rw [h10,h11,h1,h2]
   dsimp [F,B,secondBorderScalarMC3E,cutNext0MFEE,cutNext1MFEE,liftWeightMAE9,liftDenMAE9]
   rw [←hj]
   field_simp
   <;> ring
 dsimp only
 linarith

theorem second_extra_castMC3E (d t : ℕ) (r : Bool) (hd : t ≤ d) :
 ((secondBoundNumeratorMC3E t d r/((t:ℚ)+1):ℚ):ℝ)=secondExtraMC3E d t r := by
 unfold secondBoundNumeratorMC3E secondExtraMC3E absorbedExtraM418
 rw [Nat.cast_sub hd]
 have ht : (t:ℝ)+1≠0 := by positivity
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;> push_cast
   <;> field_simp <;> ring

theorem second_kernel_marginMC3E (d t : ℕ) (r : Bool) (ht : 4 ≤ t) (hd : t ≤ d) :
 2*secondExtraMC3E d t r*(completeLiftMA64 (secondJMC3E d r) (t+2)).coeff 0+
   secondExtraMC3E d t r^2 ≤ topGapMA64 (secondJMC3E d r) t := by
 have h := (Rat.cast_le (K:=ℝ)).mpr (second_margin_rationalMC3E d t r ht hd)
 rw [second_extra_castMC3E d t r hd] at h
 push_cast at h
 rw [complete_coeffMA64]
 exact h

theorem second_border_marginMC3E (d t : ℕ) (r : Bool) (ht : 4 ≤ t) (hd : t ≤ d) :
 secondExtraMC3E d t r*borderRatioMA64 (secondJMC3E d r) t*kernelScaleMA64 (secondJMC3E d r) t ≤
 topGapMA64 (secondJMC3E d r) t*(liftTermMAE9 (secondJMC3E d r) (t+1) 1:ℝ) := by
 have h := (Rat.cast_le (K:=ℝ)).mpr (second_border_rationalMC3E d t r ht hd)
 rw [second_extra_castMC3E d t r hd] at h
 push_cast at h
 unfold borderRatioMA64 kernelScaleMA64 topGapMA64
 rw [complete_coeffMA64]
 exact h

end
end MathGKM.Markov
