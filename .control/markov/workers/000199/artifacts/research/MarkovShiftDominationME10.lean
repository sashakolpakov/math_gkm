import MarkovNearChooseME10
import MarkovCentralSourceME10
/-! Machine-authored e108e0e2. Complete shifted correction domination. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000
def templateTermME10 (x T c l : ℕ) : ℤ :=
 ((c+l).choose c:ℤ)*((x+2*c+4).choose (c+3-l):ℤ)*((T+1).choose (c+l+2):ℤ)
def templateMassME10 (x T c : ℕ) : ℤ :=
 ∑ l ∈ range (c+4), templateTermME10 x T c l

theorem template_term_nonnegME10 (x T c l : ℕ) : 0 ≤ templateTermME10 x T c l := by
 unfold templateTermME10
 positivity

theorem template_mass_nonnegME10 (x T c : ℕ) : 0 ≤ templateMassME10 x T c := by
 unfold templateMassME10
 exact sum_nonneg fun l _ => template_term_nonnegME10 x T c l

theorem template_mass_leME10 (x T c : ℕ) :
 4*templateMassME10 x T c ≤ topShortME10 x T c := by
 unfold templateMassME10 topShortME10
 rw [mul_sum]
 apply sum_le_sum
 intro l hl
 unfold templateTermME10
 have h : 0 ≤ ((c+l).choose c:ℤ)*((x+2*c+4).choose (c+3-l):ℤ)*(T.choose (c+l):ℤ) := by positivity
 nlinarith

theorem kernel_same_boundME10 (x T k c D b : ℕ)
 (hT : 3*k ≤ T+1) (hD : D+c ≤ x+2*c+4) (hb : b ≤ c+2) :
 (3:ℤ)^(c+2)*middleKernelMD02 D k c b ≤ 2*templateMassME10 x T c := by
 unfold middleKernelMD02 templateMassME10
 rw [mul_sum]
 calc
  _ ≤ ∑ l ∈ range (b+1), 2*templateTermME10 x T c l := by
   apply sum_le_sum
   intro l hl
   have hl' := mem_range.mp hl
   have hN : (D+c).choose (b-l) ≤ 2*(x+2*c+4).choose (c+3-l) :=
     (Nat.choose_le_choose _ hD).trans (by
       by_cases hl0 : l=0
       · subst l
         exact choose_near_stepME10 _ _ _ (by omega) (by omega) (by omega)
       · have hh := choose_lower_stepM41B (x+2*c+4) (b-l) (c+3-l) (by omega) (by omega)
         omega)
   have hNz : ((D+c).choose (b-l):ℤ) ≤ 2*((x+2*c+4).choose (c+3-l):ℤ) := by exact_mod_cast hN
   have hd := diluted_chooseM41B k c l T hT
   unfold templateTermME10
   calc
    _ = ((c+l).choose c:ℤ)*((D+c).choose (b-l):ℤ)*
      ((3:ℤ)^(c+2)*(k.choose (c+l+2):ℤ)) := by ring
    _ ≤ (((c+l).choose c:ℤ)*(2*((x+2*c+4).choose (c+3-l):ℤ)))*
      ((T+1).choose (c+l+2):ℤ) :=
       mul_le_mul (mul_le_mul_of_nonneg_left hNz (by positivity)) hd (by positivity) (by positivity)
    _ = _ := by ring
  _ = 2*(∑ l ∈ range (b+1),templateTermME10 x T c l) := by rw [mul_sum]
  _ ≤ _ := mul_le_mul_of_nonneg_left
    (sum_le_sum_of_subset_of_nonneg (range_mono (by omega))
      (fun l _ _ => template_term_nonnegME10 x T c l)) (by norm_num)

theorem kernel_shift_boundME10 (x T k c D : ℕ)
 (hT : 3*k ≤ T+1) (hD : D+(c+1) ≤ x+2*c+5) :
 (3:ℤ)^(c+2)*middleKernelMD02 D k (c+1) (c+2) ≤ 6*templateMassME10 x T c := by
 unfold middleKernelMD02
 rw [mul_sum]
 have hsum : (∑ l ∈ range (c+3), templateTermME10 x T c (l+1)) ≤ templateMassME10 x T c := by
   unfold templateMassME10
   conv_rhs => rw [show c+4=(c+3)+1 by omega,sum_range_succ']
   have := template_term_nonnegME10 x T c 0
   linarith
 calc
  _ ≤ ∑ l ∈ range (c+3), 6*templateTermME10 x T c (l+1) := by
   apply sum_le_sum
   intro l hl
   have hl' : l ≤ c+2 := by have := mem_range.mp hl; omega
   have hw : ((c+1+l).choose (c+1):ℤ) ≤ 3*((c+(l+1)).choose c:ℤ) := by
     exact_mod_cast choose_weight_shiftM41B c l hl'
   have hN : (D+(c+1)).choose (c+2-l) ≤ 2*(x+2*c+4).choose (c+2-l) :=
     (Nat.choose_le_choose _ hD).trans (choose_upper_stepM41B _ _ (by omega))
   have hNz : ((D+(c+1)).choose (c+2-l):ℤ) ≤ 2*((x+2*c+4).choose (c+2-l):ℤ) := by exact_mod_cast hN
   have hd := diluted_chooseM41B k c (l+1) T hT
   have he : c+1+l+2=c+(l+1)+2 := by omega
   have he' : c+3-(l+1)=c+2-l := by omega
   rw [he]
   unfold templateTermME10
   rw [he']
   calc
    _ = ((c+1+l).choose (c+1):ℤ)*((D+(c+1)).choose (c+2-l):ℤ)*
      ((3:ℤ)^(c+2)*(k.choose (c+(l+1)+2):ℤ)) := by ring
    _ ≤ (3*((c+(l+1)).choose c:ℤ))*(2*((x+2*c+4).choose (c+2-l):ℤ))*
      ((T+1).choose (c+(l+1)+2):ℤ) :=
       mul_le_mul (mul_le_mul hw hNz (by positivity) (by positivity)) hd (by positivity) (by positivity)
    _ = _ := by ring
  _ = 6*(∑ l ∈ range (c+3), templateTermME10 x T c (l+1)) := by rw [mul_sum]
  _ ≤ _ := mul_le_mul_of_nonneg_left hsum (by norm_num)


theorem central_correction_boundME10 (h k c : ℕ) (r : Bool) :
 (3:ℤ)^(c+2)*correctionShortME10 (h+(if r then 1 else 0)) k c r ≤
 24*topShortME10 h (centralTME10 h k r) c := by
 have hT : 3*k ≤ centralTME10 h k r+1 := by unfold centralTME10; omega
 have h0 := kernel_same_boundME10 h (centralTME10 h k r) k c
 have h1 := kernel_shift_boundME10 h (centralTME10 h k r) k c
 have ht := template_mass_leME10 h (centralTME10 h k r) c
 have hn := template_mass_nonnegME10 h (centralTME10 h k r) c
 unfold correctionShortME10
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,Nat.add_zero] at *
 case false =>
   have ha := h1 (h+c+3) hT (by omega)
   have hb := h0 (h+c+3) (c+1) hT (by omega) (by omega)
   have hc := h1 (h+c+4) hT (by omega)
   have hd := h0 (h+c+3) (c+2) hT (by omega) (by omega)
   nlinarith
 case true =>
   have ha := h0 (h+1+c+2) (c+1) hT (by omega) (by omega)
   have hb := h1 (h+1+c+3) hT (by omega)
   have hc := h1 (h+1+c+2) hT (by omega)
   have hd := h0 (h+1+c+2) (c+2) hT (by omega) (by omega)
   have he := h0 (h+1+c+3) (c+2) hT (by omega) (by omega)
   nlinarith

theorem correction_short_nonnegME10 (e k c : ℕ) (r : Bool) :
 0 ≤ correctionShortME10 e k c r := by
 cases r <;> simp only [correctionShortME10,middleKernelMD02,Bool.false_eq_true,if_false,if_true] <;> positivity

theorem central_exponentialME10 (c : ℕ) (hc : 7 ≤ c) :
 96*(8*(c+4)+1) ≤ (3:ℕ)^(c+2) := by
 induction c,hc using Nat.le_induction with
 | base => norm_num
 | succ c hc ih =>
   rw [show c+1+2=(c+2)+1 by omega,pow_succ]
   nlinarith

theorem central_weak_boundME10 (h k c : ℕ) (r : Bool) (hc : 7 ≤ c) :
 4*(8*((c:ℤ)+4)+1)*correctionShortME10 (h+(if r then 1 else 0)) k c r ≤
 topShortME10 h (centralTME10 h k r) c := by
 have hb := central_correction_boundME10 h k c r
 have he : 96*(8*((c:ℤ)+4)+1) ≤ (3:ℤ)^(c+2) := by exact_mod_cast central_exponentialME10 c hc
 have hn := correction_short_nonnegME10 (h+(if r then 1 else 0)) k c r
 have hm := mul_le_mul_of_nonneg_right he hn
 nlinarith

end
end MathGKM.Markov
