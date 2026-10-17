import MarkovBandRecurrenceM139
/-! Machine-authored 139fed75. Uniform degree bounds and exact constant
coefficient for the correction factor. Positivity of other slots is open. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

theorem fib_band_degreeM139 (n j : ℕ) : (fibBandM139 n j).natDegree ≤ j := by
 unfold fibBandM139
 apply natDegree_sum_le_of_forall_le
 intro s hs
 have hsj : s ≤ j := by have := mem_range.mp hs; omega
 rw [mul_assoc]
 apply (natDegree_C_mul_le _ _).trans
 apply natDegree_mul_le.trans
 have hA : (X+1:Polynomial ℤ).natDegree=1 := by compute_degree
 simp only [natDegree_pow,natDegree_X,hA,mul_one]
 omega

theorem band_gain_degreeM139 (q k : ℕ) (r : Bool) :
 (bandGainM139 q r k).natDegree ≤ k := by
 cases k with
 | zero => cases r <;> norm_num [bandGainM139]
 | succ k =>
   have hmul (n : ℕ) : ((X+1)*fibBandM139 n k).natDegree ≤ k+1 := by
     apply natDegree_mul_le.trans
     have h := fib_band_degreeM139 n k
     have hA : (X+1:Polynomial ℤ).natDegree=1 := by compute_degree
     rw [hA]
     omega
   cases r <;> simp only [bandGainM139,Bool.false_eq_true,if_false,if_true]
   · apply natDegree_add_le_of_degree_le
     · exact natDegree_add_le_of_degree_le ((fib_band_degreeM139 q k).trans (by omega)) (fib_band_degreeM139 (q+1) (k+1))
     · exact hmul (q+1)
   · exact natDegree_add_le_of_degree_le
       (natDegree_add_le_of_degree_le (fib_band_degreeM139 q (k+1)) (fib_band_degreeM139 (q+1) (k+1))) (hmul q)

theorem band_gain_constantM139 (q k : ℕ) (r : Bool) :
 (bandGainM139 q r k).coeff 0=3*(k:ℤ)+(if r then 2 else 1) := by
 cases k with
 | zero => cases r <;> norm_num [bandGainM139]
 | succ k =>
   cases r <;> simp [bandGainM139,coeff_zero_mul,fib_band_constantM139] <;> ring

theorem band_Q_degreeM139 (q k : ℕ) (r : Bool) : (bandQM139 q r k).natDegree ≤ k := by
 have h4 (j : ℕ) : (4*bandGainM139 q r j).natDegree ≤ j := by
   exact (show (C (4:ℤ)*bandGainM139 q r j).natDegree ≤ _ from natDegree_C_mul_le _ _).trans
     (band_gain_degreeM139 q j r)
 have hA : ((2:Polynomial ℤ)*(1-X)).natDegree ≤ 1 := by compute_degree
 have hB : ((X+1:Polynomial ℤ)^2).natDegree ≤ 2 := by compute_degree
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · exact h4 0
   · rw [bandQM139]
     apply natDegree_add_le_of_degree_le (h4 1)
     have h := natDegree_mul_le_of_le hA (ih 0 (by omega))
     simpa using h
   · rw [bandQM139]
     have h1 := natDegree_mul_le_of_le hA (ih (k+1) (by omega))
     have h2 := natDegree_mul_le_of_le hB (ih k (by omega))
     have h1' : (2*(1-X)*bandQM139 q r (k+1)).natDegree ≤ k+2 := by omega
     have h2' : ((X+1)^2*bandQM139 q r k).natDegree ≤ k+2 := by omega
     exact (natDegree_sub_le _ _).trans
       (max_le (natDegree_add_le_of_degree_le (h4 (k+2)) h1') h2')

theorem band_Q_constantM139 (q k : ℕ) (r : Bool) :
 (bandQM139 q r k).coeff 0=
 if r then 2*((k:ℤ)+1)*((k:ℤ)+2)^2 else 2*((k:ℤ)+1)^2*((k:ℤ)+2) := by
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · cases r <;> norm_num [bandQM139,bandGainM139]
   · have h0 := ih 0 (by omega)
     rw [bandQM139]
     simp [coeff_zero_mul,band_gain_constantM139,h0]
   · have h0 := ih k (by omega)
     have h1 := ih (k+1) (by omega)
     rw [bandQM139]
     simp only [coeff_add,coeff_sub,coeff_zero_mul,coeff_zero_pow]
     simp only [coeff_ofNat_mul] at *
     simp [band_gain_constantM139,h0,h1]
     cases r <;> simp <;> ring

theorem band_Q_tailM139 (q k i : ℕ) (r : Bool) (hi : k < i) :
 (bandQM139 q r k).coeff i=0 :=
 coeff_eq_zero_of_natDegree_lt ((band_Q_degreeM139 q k r).trans_lt hi)

end
end MathGKM.Markov
