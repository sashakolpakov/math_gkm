import MarkovMarginCertificateMA64
import MarkovCompleteMarginMA64
/-! Machine-authored a646848d. Exact binomial and scalar transports. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def perturbBoundMA64 (j t : ℕ) : ℝ := 8*((j:ℝ)-t-2)/(t+1)

theorem kernel_margin_rationalMA64 (j t : ℕ) (ht : 4 ≤ t) (hj : t+3 ≤ j) :
 2*(8*((j:ℚ)-t-2)/(t+1))*(liftTermMAE9 j (t+2) 0:ℚ)+
   (8*((j:ℚ)-t-2)/(t+1))^2 ≤
 ((t+1+j+3).choose j:ℚ)^2-((t+j+3).choose j:ℚ)*((t+2+j+3).choose j:ℚ) := by
 have h := margin_nonnegMA64 t j ((t+j+3).choose j)
   (by exact_mod_cast ht) (by exact_mod_cast hj) (base_choose_fiveMA64 j t (by omega))
 have h1 := base_choose_stepMFEE j t
 have h2 := base_choose_twoMFEE j t
 have hL := cut_last_zero_valueM418 j t
 have h4 : (t:ℚ)+4≠0 := by positivity
 have h5 : (t:ℚ)+5≠0 := by positivity
 have h6 : (t:ℚ)+6≠0 := by positivity
 have h7 : (t:ℚ)+7≠0 := by positivity
 have h01 : (t:ℚ)+1≠0 := by positivity
 have he : ((t+1+j+3).choose j:ℚ)^2-
   ((t+j+3).choose j:ℚ)*((t+2+j+3).choose j:ℚ)-
   (2*(8*((j:ℚ)-t-2)/(t+1))*(liftTermMAE9 j (t+2) 0:ℚ)+
     (8*((j:ℚ)-t-2)/(t+1))^2)=marginValueMA64 t j ((t+j+3).choose j) := by
   rw [h1,h2,hL]
   unfold marginValueMA64 cutLast0M418 liftWeightMAE9 liftDenMAE9
   push_cast
   field_simp
   <;> ring
 linarith

theorem kernel_marginMA64 (j t : ℕ) (ht : 4 ≤ t) (hj : t+3 ≤ j) :
 2*perturbBoundMA64 j t*(completeLiftMA64 j (t+2)).coeff 0+
   perturbBoundMA64 j t^2 ≤ topGapMA64 j t := by
 rw [complete_coeffMA64]
 unfold perturbBoundMA64 topGapMA64
 exact_mod_cast kernel_margin_rationalMA64 j t ht hj

theorem absorbed_extra_boundMA64 (d j t s : ℕ) (c : ℝ)
 (hc : 0 ≤ c) (hc8 : c ≤ 8) (ht : t ≤ d) (hj : d+2 ≤ j) :
 absorbedExtraM418 d (t+s) c ≤ perturbBoundMA64 j t := by
 have hnum : c*((d-(t+s):ℕ):ℝ) ≤ 8*((j:ℝ)-t-2) := by
   have hs : ((d-(t+s):ℕ):ℝ) ≤ ((d-t:ℕ):ℝ) := by exact_mod_cast (show d-(t+s) ≤ d-t by omega)
   have hd : ((d-t:ℕ):ℝ)=(d:ℝ)-t := by exact_mod_cast (Nat.sub_add_cancel ht)
   have hjr : (d:ℝ)+2 ≤ j := by exact_mod_cast hj
   calc
    _ ≤ 8*((d-(t+s):ℕ):ℝ) := mul_le_mul_of_nonneg_right hc8 (by positivity)
    _ ≤ 8*((d-t:ℕ):ℝ) := mul_le_mul_of_nonneg_left hs (by norm_num)
    _ ≤ _ := by rw [hd]; linarith
 have hnon : 0 ≤ (j:ℝ)-t-2 := by
   have htr : (t:ℝ) ≤ d := by exact_mod_cast ht
   have hjr : (d:ℝ)+2 ≤ j := by exact_mod_cast hj
   linarith
 unfold absorbedExtraM418 perturbBoundMA64
 calc
  _ ≤ (8*((j:ℝ)-t-2))/((t+s:ℕ)+1) := div_le_div_of_nonneg_right hnum (by positivity)
  _ ≤ _ := by
    apply div_le_div_of_nonneg_left (by positivity) (by positivity)
    push_cast
    positivity

theorem complete_absorbed_nonnegMA64 (d j t m : ℕ) (c : ℝ)
 (ht : 4 ≤ t) (htd : t<d) (hj : d+2 ≤ j) (hc : 0 ≤ c) (hc8 : c ≤ 8) :
 0 ≤ ((completeLiftMA64 j (t+1)+C (absorbedExtraM418 d (t+1) c))^2-
   (completeLiftMA64 j t+C (absorbedExtraM418 d t c))*
   (completeLiftMA64 j (t+2)+C (absorbedExtraM418 d (t+2) c))).coeff m := by
 apply complete_perturb_nonnegMA64 j t m _ _ _ (perturbBoundMA64 j t)
 · unfold absorbedExtraM418; positivity
 · unfold absorbedExtraM418; positivity
 · unfold absorbedExtraM418; positivity
 · unfold perturbBoundMA64
   have hh : (t:ℝ)+3 ≤ j := by exact_mod_cast (show t+3 ≤ j by omega)
   have : 0 ≤ (j:ℝ)-t-2 := by linarith
   positivity
 · simpa using absorbed_extra_boundMA64 d j t 0 c hc hc8 (by omega) hj
 · exact absorbed_extra_boundMA64 d j t 2 c hc hc8 (by omega) hj
 · exact kernel_marginMA64 j t ht (by omega)

end
end MathGKM.Markov
