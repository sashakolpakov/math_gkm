import MarkovBaseCurvatureM09F
import MarkovCorrectionBudgetM09F
import MarkovSharpTransportMBE3
/-! Machine-authored 09fffb56. The sharp scalar follows from two uniform
coefficient budgets. The clamped regime is unconditional. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem top_scalar_of_budgetsM09F (d k s : ℕ) (r : Bool) (hs : 3 ≤ s)
 (hj : 5 ≤ bandJMBE3 d k r) (hsj : s ≤ bandJMBE3 d k r)
 (h0 : ((s+9).choose 4:ℝ)*transposedBudgetMBE3 d k s r ≤ (s+3)*bandBaseMBE3 d k s r)
 (h2 : ((s+11).choose 4:ℝ)*transposedBudgetMBE3 d k (s+2) r ≤ (s+5)*bandBaseMBE3 d k (s+2) r) :
 bandTopMBE3 d k s r*bandTopMBE3 d k (s+2) r ≤ bandBaseMBE3 d k (s+1) r^2 := by
 let D : ℝ := ((s+9).choose 4:ℝ)
 let E : ℝ := ((s+11).choose 4:ℝ)
 let j := bandJMBE3 d k r
 have hD : 0 < D := by dsimp [D]; exact_mod_cast Nat.choose_pos (by omega : 4 ≤ s+9)
 have hE : 0 < E := by dsimp [E]; exact_mod_cast Nat.choose_pos (by omega : 4 ≤ s+11)
 have hT0 : D*bandTopMBE3 d k s r ≤ (D+(s+3))*bandBaseMBE3 d k s r := by
   unfold bandTopMBE3; dsimp [D]; linarith
 have hT2 : E*bandTopMBE3 d k (s+2) r ≤ (E+(s+5))*bandBaseMBE3 d k (s+2) r := by
   unfold bandTopMBE3; dsimp [E]; linarith
 have hprod := mul_le_mul hT0 hT2
   (mul_nonneg hE.le (band_top_posMBE3 _ _ _ _).le)
   (mul_nonneg (by positivity) (band_base_posMBE3 _ _ _ _).le)
 have hscalar := budget_scalarM09F j s hs hj hsj
 have hb := mul_le_mul_of_nonneg_right hscalar
   (mul_nonneg (band_base_posMBE3 d k s r).le (band_base_posMBE3 d k (s+2) r).le)
 have hcurv := base_curvatureM09F j s
 change bandBaseMBE3 d k s r*bandBaseMBE3 d k (s+2) r*(s+7)*(s+j+4) ≤
   bandBaseMBE3 d k (s+1) r^2*(s+6)*(s+j+5) at hcurv
 have hc := mul_le_mul_of_nonneg_right hcurv (mul_nonneg hD.le hE.le)
 have hh := mul_le_mul_of_nonneg_right hprod (show (0:ℝ) ≤ (s+6)*(s+j+5) by positivity)
 apply (mul_le_mul_iff_of_pos_right (show 0 < D*E*(s+6)*(s+j+5) by positivity)).mp
 dsimp [D,E] at *
 nlinarith only [hh,hb,hc]

theorem top_scalar_clampedM09F (d k s : ℕ) (r : Bool) (hs : 3 ≤ s)
 (hsj : s ≤ bandJMBE3 d k r) (hd : d ≤ s) :
 bandTopMBE3 d k s r*bandTopMBE3 d k (s+2) r ≤ bandBaseMBE3 d k (s+1) r^2 := by
 by_cases hk : k=0
 · subst k
   have he (t : ℕ) (ht : d ≤ t) : transposedBudgetMBE3 d 0 t r=0 := by
     unfold transposedBudgetMBE3 absorbedExtraM418 correctionTermM657
     simp only [Nat.sub_eq_zero_of_le ht,Nat.cast_zero,mul_zero,zero_div,zero_add,
       show 0+(t+1)+3=t+4 by omega,show 0+(t+1)+2=t+3 by omega,
       show t+1+1+3=t+5 by omega,
       Nat.choose_eq_zero_of_lt (show t+4 < t+5 by omega),
       Nat.choose_eq_zero_of_lt (show t+3 < t+5 by omega),Int.cast_zero,add_zero]
   rw [bandTopMBE3,bandTopMBE3,he s hd,he (s+2) (by omega),add_zero,add_zero]
   exact_mod_cast lift_zero_column_lcMFEE (bandJMBE3 d 0 r) s
 · have hj : 5 ≤ bandJMBE3 d k r := by unfold bandJMBE3; split_ifs <;> omega
   apply top_scalar_of_budgetsM09F d k s r hs hj hsj
   · exact band_budget_clampedM09F d k s r hs hd
   · simpa only [show s+2+9=s+11 by omega,Nat.cast_add,Nat.cast_ofNat,
       show (s:ℝ)+2+3=s+5 by ring] using
       band_budget_clampedM09F d k (s+2) r (by omega) (by omega)

theorem robust_cut_clampedM09F (HM : SharpCompleteMarginMBE3)
 (d k s : ℕ) (r : Bool) (hs : 3 ≤ s) (hsj : s ≤ bandJMBE3 d k r)
 (hd : d ≤ s) (h n : ℕ) :
 0 ≤ ((cutPolyMFEE h (liftPolyM7E2 (bandJMBE3 d k r) (s+1)))^2-
   cutPolyMFEE h (bandKernelM657 d k s r)*cutPolyMFEE h (bandKernelM657 d k (s+2) r)).coeff n :=
 band_robust_cutMBE3 HM d k s r hsj (top_scalar_clampedM09F d k s r hs hsj hd) h n

end
end MathGKM.Markov
