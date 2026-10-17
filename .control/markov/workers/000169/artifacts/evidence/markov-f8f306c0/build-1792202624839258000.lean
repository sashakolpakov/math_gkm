import MarkovBoundaryClosedMF8F
/-! Machine-authored f8f306c0. For the affected high coefficients, cutting
below the boundary removes only nonpositive summands. Thus only the uncut
gap and a single coefficient per cut remain as exact auxiliary obligations. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem cut_gap_ge_fullMF8F (A B C : ℝ[X]) (n h k : ℕ)
 (hA : ∀ i, 0 ≤ A.coeff i) (hC : ∀ i, 0 ≤ C.coeff i)
 (hB : ∀ i, n<i → B.coeff i=0) (hk : n+h ≤ k) :
 (B^2-A*C).coeff k ≤ ((cutPolyMFEE h B)^2-cutPolyMFEE h A*cutPolyMFEE h C).coeff k := by
 rw [cut_gap_coeffMFEE,coeff_sub,pow_two,coeff_mul,coeff_mul,←sum_sub_distrib]
 apply sum_le_sum
 intro p hp
 have hp' := mem_antidiagonal.mp hp
 split_ifs with hh
 · exact le_rfl
 · have hz : B.coeff p.1*B.coeff p.2=0 := by
     have hh' : ¬(h ≤ p.1 ∧ h ≤ p.2) := by simpa only [le_min_iff] using hh
     by_cases hi : p.1<h
     · rw [hB p.2 (by omega),mul_zero]
     · rw [hB p.1 (by omega),zero_mul]
   rw [hz,zero_sub]
   exact neg_nonpos.mpr (mul_nonneg (hA _) (hC _))

theorem absorbed_cut_ge_uncutMF8F (d j t h k : ℕ) (c : ℝ)
 (hc : 0 ≤ c) (hk : t+h<k) :
 (absorbedGapMF8F d j t 0 c).coeff k ≤ (absorbedGapMF8F d j t h c).coeff k := by
 unfold absorbedGapMF8F
 simp only [cut_zeroMAD5]
 apply cut_gap_ge_fullMF8F _ _ _ (t+1) h k
 · exact fun i => absorbed_nonnegM418 d j t i c hc
 · exact fun i => absorbed_nonnegM418 d j (t+2) i c hc
 · exact fun i hi => absorbed_coeff_tailM418 d j (t+1) i c hi
 · omega

def AbsorbedUncutMF8F : Prop := ∀ d t k : ℕ, ∀ r : Bool,
 4 ≤ t → t<d → t ≤ k → k ≤ 2*t+2 →
 0 ≤ (absorbedGapMF8F d (absorbedSourceJM418 d r) t 0
   (correctionConstantMDB2 r)).coeff k

def AbsorbedBorderMF8F : Prop := ∀ d t h : ℕ, ∀ r : Bool,
 4 ≤ t → t<d → h<t →
 0 ≤ (absorbedGapMF8F d (absorbedSourceJM418 d r) t h
   (correctionConstantMDB2 r)).coeff (t+h)

theorem absorbed_middle_iff_two_testsMF8F :
 AbsorbedMiddleM418 ↔ AbsorbedUncutMF8F ∧ AbsorbedBorderMF8F := by
 constructor
 · intro H
   constructor
   · intro d t k r ht hd _ _
     exact H d t 0 k r ht hd (by omega)
   · intro d t h r ht hd hh
     exact H d t h (t+h) r ht hd (by omega)
 · rintro ⟨HU,HB⟩
   apply absorbed_middle_iff_bandMF8F.mpr
   intro d t h k r ht hd hh hk hku
   by_cases he : k=t+h
   · subst k
     exact HB d t h r ht hd hh
   · apply le_trans (HU d t k r ht hd (by omega) hku)
     apply absorbed_cut_ge_uncutMF8F
     · cases r <;> norm_num [correctionConstantMDB2]
     · omega

theorem all_first_correction_of_two_testsMF8F
 (HU : AbsorbedUncutMF8F) (HB : AbsorbedBorderMF8F)
 (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r i (q+1)*threeRawM9E2 q r (i+2) (q+1) ≤
 threeRawM9E2 q r (i+1) (q+1)^2 :=
 all_first_correction_of_absorbedM418
   (absorbed_middle_iff_two_testsMF8F.mpr ⟨HU,HB⟩) q i r hq

theorem root_of_two_tests_and_remainingMF8F
 (HU : AbsorbedUncutMF8F) (HB : AbsorbedBorderMF8F)
 (hb : ThreeBeyondCorrectionM418) (h4 : OtherFourM9E2) : Conjecture63 :=
 root_of_absorbed_and_remainingM418
   (absorbed_middle_iff_two_testsMF8F.mpr ⟨HU,HB⟩) hb h4

end
end MathGKM.Markov
