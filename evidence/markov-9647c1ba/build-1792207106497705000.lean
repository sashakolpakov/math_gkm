import MarkovThirdMarginsM964
/-! Machine-authored 9647c1ba. Third correction row for all starting columns
at least ten, including the endpoint correction and zero tails. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem third_output_lcM964 (d t : ℕ) (r : Bool) (ht : 6 ≤ t) :
 thirdOutputM964 d t r*thirdOutputM964 d (t+2) r ≤ thirdOutputM964 d (t+1) r^2 := by
 by_cases hd : d<t
 · rw [third_output_tailM964 d t r hd,third_output_tailM964 d (t+1) r (by omega),
     third_output_tailM964 d (t+2) r (by omega)]
   exact lift_output_lcM7A3 d (thirdJM964 d r) (t+1)
 · have hf : CrossLC (zchooseM37B d) := by
     have he : zchooseM37B d=CoeffSeq ((1+X)^d) := by ext k; exact zchoose_coeffM37B d k
     rw [he]; exact crossLC_binomial d
   have hp (k : ℤ) : 0 ≤ zchooseM37B d k := by
     unfold zchooseM37B; split_ifs <;> positivity
   have hcut : ∀ h k, 0 ≤ ((cutPolyMFEE h (twinLiftM964 (thirdJM964 d r) (t+1)
       (thirdExtraM964 d (t+1+1) r) (thirdVM964 d r)))^2-
       cutPolyMFEE h (twinLiftM964 (thirdJM964 d r) t (thirdExtraM964 d (t+1) r) (thirdVM964 d r))*
       cutPolyMFEE h (twinLiftM964 (thirdJM964 d r) (t+2) (thirdExtraM964 d (t+2+1) r) (thirdVM964 d r))).coeff k := by
     intro h k
     apply twin_all_cutsM964 _ _ _ _ _ _
       ((t+1+thirdJM964 d r+3).choose (thirdJM964 d r)) (thirdBoundM964 d (t+1) r)
     · unfold thirdJM964; split_ifs <;> omega
     · exact_mod_cast Nat.choose_pos (show thirdJM964 d r ≤ t+1+thirdJM964 d r+3 by omega)
     · exact third_bound_nonnegM964 d (t+1) r
     · exact third_extra_nonnegM964 d (t+1) r
     · exact third_extra_nonnegM964 d (t+1+1) r
     · exact third_extra_nonnegM964 d (t+2+1) r
     · positivity
     · exact third_extra_boundM964 d (t+1) 0 r
     · exact third_extra_boundM964 d (t+1) 2 r
     · exact third_second_slot_boundM964 d (t+1) r
     · exact le_rfl
     · exact third_robust_marginM964 d (t+1) r (by omega) (by omega)
   have hh := weighted_value_lcMFEE _ _ _ hcut (zchooseM37B d) hf hp
   simp only [third_weighted_outputM964] at hh
   exact_mod_cast hh

theorem source_third_highM964 (d i : ℕ) (r : Bool) (hi : 10 ≤ i) :
 threeRawM9E2 (thirdQM964 d r) r i (thirdJM964 d r)*
 threeRawM9E2 (thirdQM964 d r) r (i+2) (thirdJM964 d r) ≤
 threeRawM9E2 (thirdQM964 d r) r (i+1) (thirdJM964 d r)^2 := by
 have h := third_output_lcM964 d (i-4) r (by omega)
 rw [←source_third_outputM964,←source_third_outputM964,←source_third_outputM964] at h
 convert h using 1 <;> congr 2 <;> omega

end
end MathGKM.Markov
