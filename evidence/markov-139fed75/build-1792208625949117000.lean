import MarkovBandShapeM139
/-! Machine-authored 139fed75. Highest coefficient of the uniform factor. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem fib_band_topM139 (n j : ℕ) (hn : 2*j+1 ≤ n) :
 (fibBandM139 n j).coeff j=(n.choose j:ℤ) := by
 have h := fib_band_coeffM139 n j (n-2*j-1+j) hn
 have hd : ((X+1:Polynomial ℤ)^(n-2*j-1)).natDegree ≤ n-2*j-1 := by
   have ha : (X+1:Polynomial ℤ).natDegree ≤ 1 := by compute_degree
   simpa using natDegree_pow_le_of_le (n-2*j-1) ha
 rw [coeff_mul_add_eq_of_natDegree_le hd (fib_band_degreeM139 n j),coeff_X_add_one_pow,
   Nat.choose_self,Nat.cast_one,one_mul] at h
 simpa only [show n-2*j-1+j=n-j-1 by omega,
   show n-2*j-1+j+j+1=n by omega,Nat.choose_self,Nat.cast_one,one_mul] using h

theorem band_gain_topM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 (bandGainM139 q r k).coeff k=
 if r then 2*((q+1).choose k:ℤ) else ((q+2).choose k:ℤ) := by
 cases k with
 | zero => cases r <;> norm_num [bandGainM139]
 | succ k =>
   have hqk : 2*(k+1)+1 ≤ q := by cases r <;> simp_all [sourceNME9C] <;> omega
   have hz (n : ℕ) : (fibBandM139 n k).coeff (k+1)=0 :=
     coeff_eq_zero_of_natDegree_lt ((fib_band_degreeM139 n k).trans_lt (by omega))
   have hm (n : ℕ) : ((X+1)*fibBandM139 n k).coeff (k+1)=(fibBandM139 n k).coeff k := by
     have ha : (X+1:Polynomial ℤ).natDegree ≤ 1 := by compute_degree
     rw [show k+1=1+k by omega,coeff_mul_add_eq_of_natDegree_le ha (fib_band_degreeM139 n k)]
     simp [coeff_one]
   cases r <;> simp only [bandGainM139,Bool.false_eq_true,if_false,if_true,coeff_add,hm,hz]
   · rw [fib_band_topM139 (q+1) (k+1) (by omega),fib_band_topM139 (q+1) k (by omega)]
     rw [show q+2=(q+1)+1 by omega,Nat.choose_succ_succ]
     push_cast
     ring
   · rw [fib_band_topM139 q (k+1) hqk,fib_band_topM139 (q+1) (k+1) (by omega),
       fib_band_topM139 q k (by omega),Nat.choose_succ_succ]
     push_cast
     ring

end
end MathGKM.Markov
