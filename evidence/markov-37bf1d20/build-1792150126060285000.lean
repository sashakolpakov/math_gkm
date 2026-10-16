import MarkovBinomialVarianceMAC3
import MathGKM.MarkovLogConcavity
/-! Machine-authored request 37bf1d20. Zero-extended binomial identities at
every integer index, including both endpoints. No source sign assertion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

def zchooseM37B (n : ℕ) (k : ℤ) : ℝ :=
 if k < 0 then 0 else (n.choose k.toNat : ℝ)

theorem zchoose_natM37B (n k : ℕ) : zchooseM37B n k = n.choose k := by
 simp [zchooseM37B]

theorem zchoose_negM37B (n : ℕ) (k : ℤ) (hk : k<0) : zchooseM37B n k=0 := by
 simp [zchooseM37B,hk]

theorem zchoose_raiseM37B (n : ℕ) (k : ℤ) :
 (k:ℝ)*zchooseM37B (n+1) k = (n+1:ℝ)*zchooseM37B n (k-1) := by
 by_cases hk : k<0
 · rw [zchoose_negM37B _ _ hk,zchoose_negM37B _ _ (by omega)]
   ring
 · lift k to ℕ using (by omega : 0≤k)
   cases k with
   | zero => norm_num [zchooseM37B]
   | succ k =>
     have he : ((k+1:ℕ):ℤ)-1=(k:ℤ) := by omega
     rw [show (k.succ:ℤ)=((k+1:ℕ):ℤ) by rfl,he,zchoose_natM37B,zchoose_natM37B]
     have h := Nat.add_one_mul_choose_eq n k
     have he' : (k+1)*(n+1).choose (k+1)=(n+1)*n.choose k := by omega
     exact_mod_cast he'

theorem zchoose_keepM37B (n : ℕ) (k : ℤ) :
 ((n+1:ℝ)-(k:ℝ))*zchooseM37B (n+1) k = (n+1:ℝ)*zchooseM37B n k := by
 by_cases hk : k<0
 · rw [zchoose_negM37B _ _ hk,zchoose_negM37B _ _ hk]; ring
 · lift k to ℕ using (by omega : 0≤k)
   rw [zchoose_natM37B,zchoose_natM37B]
   by_cases hkn : k≤n+1
   · have h := Nat.choose_mul_succ_eq n k
     have hc : (n.choose k:ℝ)*(n+1)=((n+1).choose k:ℝ)*(n+1-k) := by
       exact_mod_cast (show n.choose k*(n+1)=(n+1).choose k*(n+1-k) from h)
     push_cast at *
     nlinarith only [hc]
   · rw [Nat.choose_eq_zero_of_lt (by omega : n+1<k),Nat.choose_eq_zero_of_lt (by omega : n<k)]
     simp

theorem zchoose_threeM37B (n : ℕ) (k : ℤ) :
 zchooseM37B (n+2) k*(k:ℝ)*((k:ℝ)-1) =
   (n+1:ℝ)*(n+2)*zchooseM37B n (k-2) ∧
 zchooseM37B (n+2) k*(k:ℝ)*((n+2:ℝ)-(k:ℝ)) =
   (n+1:ℝ)*(n+2)*zchooseM37B n (k-1) ∧
 zchooseM37B (n+2) k*((n+2:ℝ)-(k:ℝ))*((n+2:ℝ)-(k:ℝ)-1) =
   (n+1:ℝ)*(n+2)*zchooseM37B n k := by
 have h1 := zchoose_raiseM37B (n+1) k
 have h2 := zchoose_raiseM37B n (k-1)
 have h3 := zchoose_keepM37B n (k-1)
 have h4 := zchoose_keepM37B (n+1) k
 have h5 := zchoose_keepM37B n k
 simp only [Nat.cast_add,Nat.cast_one,Int.cast_sub,Int.cast_one,
   show k-1-1=k-2 by omega] at h1 h2 h3 h4 h5
 constructor
 · linear_combination ((k:ℝ)-1)*h1+(n+2:ℝ)*h2
 constructor
 · linear_combination ((n+2:ℝ)-(k:ℝ))*h1+(n+2:ℝ)*h3
 · linear_combination ((n+2:ℝ)-(k:ℝ)-1)*h4+(n+2:ℝ)*h5

theorem zchoose_coeffM37B (n : ℕ) (k : ℤ) :
 zchooseM37B n k=CoeffSeq ((1+X)^n) k := by
 by_cases hk : k<0
 · simp [zchooseM37B,CoeffSeq,hk]
 · simp [zchooseM37B,CoeffSeq,hk,add_comm (1:ℝ[X]) X,coeff_X_add_one_pow]

end
end MathGKM.Markov
