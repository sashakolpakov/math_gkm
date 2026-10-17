import MarkovBinomialDilationM41B
/-! Machine-authored 41b38611. The complete middle correction is exponentially
small relative to the positive top sum. No log-concavity premise is used. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

def templateTermM41B (x T c l : ℕ) : ℤ :=
 ((c+l).choose c:ℤ)*((x+2*c+8).choose (c+3-l):ℤ)*((T+1).choose (c+l+2):ℤ)
def templateMassM41B (x T c : ℕ) : ℤ :=
 ∑ l ∈ range (c+4), templateTermM41B x T c l

theorem template_term_nonnegM41B (x T c l : ℕ) : 0 ≤ templateTermM41B x T c l := by
 unfold templateTermM41B
 positivity

theorem template_mass_nonnegM41B (x T c : ℕ) : 0 ≤ templateMassM41B x T c := by
 unfold templateMassM41B
 exact sum_nonneg fun l _ => template_term_nonnegM41B x T c l

theorem template_mass_leM41B (x T c : ℕ) :
 4*templateMassM41B x T c ≤ topShortSumMEB6 x T c := by
 unfold templateMassM41B topShortSumMEB6
 rw [mul_sum]
 apply sum_le_sum
 intro l hl
 unfold templateTermM41B
 have h : 0 ≤ ((c+l).choose c:ℤ)*((x+2*c+8).choose (c+3-l):ℤ)*(T.choose (c+l):ℤ) := by positivity
 nlinarith

theorem diluted_chooseM41B (k c l T : ℕ) (hT : 3*k ≤ T+1) :
 (3:ℤ)^(c+2)*(k.choose (c+l+2):ℤ) ≤ ((T+1).choose (c+l+2):ℤ) := by
 have hp : (3:ℕ)^(c+2) ≤ 3^(c+l+2) := Nat.pow_le_pow_right (by omega) (by omega)
 have h := (Nat.mul_le_mul_right (k.choose (c+l+2)) hp).trans
   (choose_dilation_leM41B 3 k (c+l+2) (T+1) hT)
 exact_mod_cast h

theorem kernel_same_boundM41B (x T k c D b : ℕ)
 (hT : 3*k ≤ T+1) (hD : D+c ≤ x+2*c+8) (hb : b ≤ c+2) :
 (3:ℤ)^(c+2)*middleKernelMD02 D k c b ≤ templateMassM41B x T c := by
 unfold middleKernelMD02 templateMassM41B
 rw [mul_sum]
 calc
  _ ≤ ∑ l ∈ range (b+1), templateTermM41B x T c l := by
   apply sum_le_sum
   intro l hl
   have hl' := mem_range.mp hl
   have hN : (D+c).choose (b-l) ≤ (x+2*c+8).choose (c+3-l) :=
     (Nat.choose_le_choose _ hD).trans (choose_lower_stepM41B _ _ _ (by omega) (by omega))
   have hNz : ((D+c).choose (b-l):ℤ) ≤ ((x+2*c+8).choose (c+3-l):ℤ) := by exact_mod_cast hN
   have hd := diluted_chooseM41B k c l T hT
   unfold templateTermM41B
   calc
    _ = ((c+l).choose c:ℤ)*((D+c).choose (b-l):ℤ)*
      ((3:ℤ)^(c+2)*(k.choose (c+l+2):ℤ)) := by ring
    _ ≤ _ := mul_le_mul (mul_le_mul_of_nonneg_left hNz (by positivity)) hd (by positivity) (by positivity)
  _ ≤ _ := sum_le_sum_of_subset_of_nonneg (range_mono (by omega))
    (fun l _ _ => template_term_nonnegM41B x T c l)

theorem kernel_shift_boundM41B (x T k c D : ℕ)
 (hT : 3*k ≤ T+1) (hD : D+(c+1) ≤ x+2*c+9) :
 (3:ℤ)^(c+2)*middleKernelMD02 D k (c+1) (c+2) ≤ 6*templateMassM41B x T c := by
 unfold middleKernelMD02
 rw [mul_sum]
 have hsum : (∑ l ∈ range (c+3), templateTermM41B x T c (l+1)) ≤ templateMassM41B x T c := by
   unfold templateMassM41B
   rw [show c+4=(c+3)+1 by omega,sum_range_succ']
   have := template_term_nonnegM41B x T c 0
   linarith
 calc
  _ ≤ ∑ l ∈ range (c+3), 6*templateTermM41B x T c (l+1) := by
   apply sum_le_sum
   intro l hl
   have hl' : l ≤ c+2 := by have := mem_range.mp hl; omega
   have hw : ((c+1+l).choose (c+1):ℤ) ≤ 3*((c+(l+1)).choose c:ℤ) := by
     exact_mod_cast choose_weight_shiftM41B c l hl'
   have hN : (D+(c+1)).choose (c+2-l) ≤ 2*(x+2*c+8).choose (c+2-l) :=
     (Nat.choose_le_choose _ hD).trans (choose_upper_stepM41B _ _ (by omega))
   have hNz : ((D+(c+1)).choose (c+2-l):ℤ) ≤ 2*((x+2*c+8).choose (c+2-l):ℤ) := by exact_mod_cast hN
   have hd := diluted_chooseM41B k c (l+1) T hT
   have he : c+1+l+2=c+(l+1)+2 := by omega
   have he' : c+3-(l+1)=c+2-l := by omega
   rw [he]
   unfold templateTermM41B
   rw [he']
   calc
    _ = ((c+1+l).choose (c+1):ℤ)*((D+(c+1)).choose (c+2-l):ℤ)*
      ((3:ℤ)^(c+2)*(k.choose (c+(l+1)+2):ℤ)) := by ring
    _ ≤ (3*((c+(l+1)).choose c:ℤ))*(2*((x+2*c+8).choose (c+2-l):ℤ))*
      ((T+1).choose (c+(l+1)+2):ℤ) :=
       mul_le_mul (mul_le_mul hw hNz (by positivity) (by positivity)) hd (by positivity) (by positivity)
    _ = _ := by ring
  _ = 6*(∑ l ∈ range (c+3), templateTermM41B x T c (l+1)) := by rw [mul_sum]
  _ ≤ _ := mul_le_mul_of_nonneg_left hsum (by norm_num)

theorem correction_exponential_boundM41B (x k c : ℕ) (r : Bool) :
 (3:ℤ)^(c+2)*middleCorrMD02 x k r c ≤ 21*middleTemplateMD02 x k r c := by
 have hT : 3*k ≤ x+3*k+middleBaseMD02 r+1 := by omega
 have h0 := kernel_same_boundM41B x (x+3*k+middleBaseMD02 r) k c
 have h1 := kernel_shift_boundM41B x (x+3*k+middleBaseMD02 r) k c
 have ht := template_mass_leM41B x (x+3*k+middleBaseMD02 r) c
 have hn := template_mass_nonnegM41B x (x+3*k+middleBaseMD02 r) c
 unfold middleCorrMD02 middleTemplateMD02 correctionShortMD02
 cases r <;> simp only [middleBaseMD02,Bool.false_eq_true,if_false,if_true] at *
 all_goals
   have he : x+4-2=x+2 := by omega
   have he' : x+5-2=x+3 := by omega
   simp only [he,he']
 case false =>
   have ha := h1 (x+2+c+5) hT (by omega)
   have hb := h0 (x+2+c+5) (c+1) hT (by omega) (by omega)
   have hc := h1 (x+2+c+6) hT (by omega)
   have hd := h0 (x+2+c+5) (c+2) hT (by omega) (by omega)
   nlinarith
 case true =>
   have ha := h0 (x+3+c+4) (c+1) hT (by omega) (by omega)
   have hb := h1 (x+3+c+5) hT (by omega)
   have hc := h1 (x+3+c+4) hT (by omega)
   have hd := h0 (x+3+c+4) (c+2) hT (by omega) (by omega)
   have he := h0 (x+3+c+5) (c+2) hT (by omega) (by omega)
   nlinarith

end
end MathGKM.Markov
