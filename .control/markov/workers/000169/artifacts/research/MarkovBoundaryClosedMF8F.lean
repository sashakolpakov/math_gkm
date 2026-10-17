import MarkovBoundarySource20MF8F
import MarkovBoundarySource21MF8F
import MarkovBoundarySource30MF8F
import MarkovBoundarySource31MF8F
import MarkovAbsorbedLocalMF8F
/-! Machine-authored f8f306c0. Close the h=t band for both actual correction
parameter relations, including the clamped d=t+1 endpoint. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem absorbed_boundary_sourceMF8F (d t k : ℕ) (r : Bool)
 (ht : 4 ≤ t) (hd : t<d) :
 0 ≤ (absorbedGapMF8F d (absorbedSourceJM418 d r) t t
   (correctionConstantMDB2 r)).coeff k := by
 obtain ⟨v,rfl⟩ := Nat.exists_eq_add_of_le ht
 by_cases he : d=4+v+1
 · subst d
   cases r
   · simpa [absorbedGapMF8F,absorbedSourceJM418,correctionConstantMDB2,
       Nat.add_comm,Nat.add_left_comm,Nat.add_assoc] using absorbed_boundary_case21MF8F v 0 k
   · simpa [absorbedGapMF8F,absorbedSourceJM418,correctionConstantMDB2,
       Nat.add_comm,Nat.add_left_comm,Nat.add_assoc] using absorbed_boundary_case31MF8F v 0 k
 · have hle : 4+v+2 ≤ d := by omega
   obtain ⟨g,rfl⟩ := Nat.exists_eq_add_of_le hle
   cases r
   · simpa [absorbedGapMF8F,absorbedSourceJM418,correctionConstantMDB2,
       Nat.add_comm,Nat.add_left_comm,Nat.add_assoc] using absorbed_boundary_case20MF8F v g k
   · simpa [absorbedGapMF8F,absorbedSourceJM418,correctionConstantMDB2,
       Nat.add_comm,Nat.add_left_comm,Nat.add_assoc] using absorbed_boundary_case30MF8F v g k

def AbsorbedInteriorBandMF8F : Prop := ∀ d t h k : ℕ, ∀ r : Bool,
 4 ≤ t → t<d → h<t → t+h ≤ k → k ≤ 2*t+2 →
 0 ≤ (absorbedGapMF8F d (absorbedSourceJM418 d r) t h
   (correctionConstantMDB2 r)).coeff k

theorem absorbed_middle_iff_bandMF8F : AbsorbedMiddleM418 ↔ AbsorbedInteriorBandMF8F := by
 constructor
 · intro H d t h k r ht hd hh _ _
   exact H d t h k r ht hd (by omega)
 · intro H d t h k r ht hd hh
   change 0 ≤ (absorbedGapMF8F d (absorbedSourceJM418 d r) t h
     (correctionConstantMDB2 r)).coeff k
   by_cases he : h=t
   · subst h
     exact absorbed_boundary_sourceMF8F d t k r ht hd
   by_cases hl : k<t+h
   · exact absorbed_gap_low_nonnegMF8F _ _ _ _ _ _ hl
   by_cases hu : 2*t+2<k
   · rw [absorbed_gap_high_zeroMF8F _ _ _ _ _ _ hu]
   · exact H d t h k r ht hd (by omega) (by omega) (by omega)

theorem all_first_correction_of_bandMF8F (H : AbsorbedInteriorBandMF8F)
 (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r i (q+1)*threeRawM9E2 q r (i+2) (q+1) ≤
 threeRawM9E2 q r (i+1) (q+1)^2 :=
 all_first_correction_of_absorbedM418 (absorbed_middle_iff_bandMF8F.mpr H) q i r hq

theorem root_of_band_and_remainingMF8F (H : AbsorbedInteriorBandMF8F)
 (hb : ThreeBeyondCorrectionM418) (h4 : OtherFourM9E2) : Conjecture63 :=
 root_of_absorbed_and_remainingM418 (absorbed_middle_iff_bandMF8F.mpr H) hb h4

end
end MathGKM.Markov
