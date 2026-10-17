import MarkovAbsorbedCompleteMA64
/-! Machine-authored a646848d. Every coefficient strictly above the cut
border is nonnegative; the exact border remains explicit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

theorem absorbed_above_borderMA64 (d j t h k : ℕ) (c : ℝ)
 (ht : 4 ≤ t) (htd : t<d) (hj : d+2 ≤ j) (hc : 0 ≤ c) (hc8 : c ≤ 8)
 (hh : h ≤ t) (hk : t+h<k) : 0 ≤ (absorbedGapMF8F d j t h c).coeff k := by
 let H := j+h-t
 have hH : H+t=j+h := by dsimp [H]; omega
 have h0 := absorbed_common_shiftMA64 d j t h 0 H c hH hh
 have h1 := absorbed_common_shiftMA64 d j t h 1 H c hH hh
 have h2 := absorbed_common_shiftMA64 d j t h 2 H c hH hh
 simp only [Nat.add_zero,pow_zero,one_mul,pow_one] at h0 h1
 have he : X^(2*j)*absorbedGapMF8F d j t h c=
   X^(2*t)*((cutPolyMFEE H (X*absorbedCompleteMA64 d j c (t+1)))^2-
     cutPolyMFEE H (absorbedCompleteMA64 d j c t)*
       cutPolyMFEE H (X^2*absorbedCompleteMA64 d j c (t+2))) := by
   rw [absorbedGapMF8F,show 2*j=j+j by omega,show 2*t=t+t by omega,pow_add,pow_add]
   calc
    _ = (X^j*cutPolyMFEE h (absorbedLiftM418 d j c (t+1)))^2-
      (X^j*cutPolyMFEE h (absorbedLiftM418 d j c t))*
        (X^j*cutPolyMFEE h (absorbedLiftM418 d j c (t+2))) := by ring
    _ = _ := by rw [h0,h1,h2]; ring
 have hv := congrArg (fun P : ℝ[X] => P.coeff (2*j+k)) he
 rw [coeff_X_pow_mul',if_pos (by omega),show 2*j+k-2*j=k by omega,
   coeff_X_pow_mul',if_pos (by omega)] at hv
 rw [hv]
 apply le_trans _ (cut_gap_ge_fullMF8F _ _ _ (j+1) H (2*j+k-2*t)
   (absorbed_complete_nonnegMA64 d j t · c hc) ?_ ?_ (by dsimp [H]; omega))
 · have hx : (X*absorbedCompleteMA64 d j c (t+1))^2-
     absorbedCompleteMA64 d j c t*(X^2*absorbedCompleteMA64 d j c (t+2))=
     X^2*(absorbedCompleteMA64 d j c (t+1)^2-
       absorbedCompleteMA64 d j c t*absorbedCompleteMA64 d j c (t+2)) := by ring
   rw [hx,coeff_X_pow_mul']
   split_ifs
   · exact absorbed_complete_gapMA64 d j t _ c ht htd hj hc hc8
   · exact le_rfl
 · intro i
   rw [coeff_X_pow_mul']
   split_ifs
   · exact absorbed_complete_nonnegMA64 d j (t+2) _ c hc
   · exact le_rfl
 · intro i hi
   cases i with
   | zero => omega
   | succ i => rw [coeff_X_mul]; exact absorbed_complete_tailMA64 d j (t+1) i c (by omega)

theorem absorbed_middle_iff_borderMA64 : AbsorbedMiddleM418 ↔ AbsorbedBorderMarginMF8F := by
 constructor
 · intro H
   exact (absorbed_middle_iff_uncut_marginMF8F.mp H).2
 · intro H
   apply absorbed_middle_iff_bandMF8F.mpr
   intro d t h k r ht hd hh hk hku
   by_cases he : k=t+h
   · subst k
     exact absorbed_border_iff_marginMF8F.mpr H d t h r ht hd hh
   · apply absorbed_above_borderMA64 d (absorbedSourceJM418 d r) t h k
       (correctionConstantMDB2 r) ht hd
     · cases r <;> simp [absorbedSourceJM418]
     · cases r <;> norm_num [correctionConstantMDB2]
     · cases r <;> norm_num [correctionConstantMDB2]
     · omega
     · omega

theorem first_correction_of_borderMA64 (H : AbsorbedBorderMarginMF8F)
 (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r i (q+1)*threeRawM9E2 q r (i+2) (q+1) ≤
 threeRawM9E2 q r (i+1) (q+1)^2 :=
 all_first_correction_of_absorbedM418 (absorbed_middle_iff_borderMA64.mpr H) q i r hq

end
end MathGKM.Markov
