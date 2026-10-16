import MarkovPellRatioMA24
import MarkovKernelSequencesMDB9
/-! Machine-authored a24fe23d. Zero-extended summand rows are CrossLC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

def pellSeqMA24 (a j s : ℕ) (q : ℤ) : ℝ :=
 chooseSeqMDB9 (s+1) ((a:ℤ)-q)*nbSeqMDB9 s q*
   CoeffSeq ((1+X:ℝ[X])^(2*s+2)) ((j:ℤ)-q)

theorem pell_seq_nonnegMA24 (a j s : ℕ) (q : ℤ) : 0 ≤ pellSeqMA24 a j s q := by
 unfold pellSeqMA24
 apply mul_nonneg (mul_nonneg (chooseSeq_nonnegMDB9 _ _) (nbSeq_nonnegMDB9 _ _))
 unfold CoeffSeq
 split_ifs
 · exact le_rfl
 · rw [Polynomial.coeff_one_add_X_pow]; positivity

theorem pell_seq_crossMA24 (a j s : ℕ) : CrossLC (pellSeqMA24 a j s) := by
 apply crossLC_product6d34
 · exact crossLC_product6d34 (crossLC_reverse6d34 (chooseSeq_crossMDB9 (s+1)) a)
     (nbSeq_crossMDB9 s) (fun k => chooseSeq_nonnegMDB9 _ _) (nbSeq_nonnegMDB9 s)
 · exact crossLC_reverse6d34 (crossLC_binomial (2*s+2)) j
 · intro k; exact mul_nonneg (chooseSeq_nonnegMDB9 _ _) (nbSeq_nonnegMDB9 _ _)
 · intro k; unfold CoeffSeq; split_ifs
   · exact le_rfl
   · rw [Polynomial.coeff_one_add_X_pow]; positivity

theorem pell_seq_natMA24 (a j s q : ℕ) : pellSeqMA24 a j s q=pellTermMA24 a j s q := by
 by_cases hq : q ≤ j
 · by_cases ha : q ≤ a
   · unfold pellSeqMA24 pellTermMA24 horizontalTerm9a72
     rw [if_pos hq,show (a:ℤ)-q=((a-q:ℕ):ℤ) by omega,chooseSeq_natMDB9,nbSeq_natMDB9]
     simp only [CoeffSeq,if_neg (show ¬(j:ℤ)-q<0 by omega),
       show ((j:ℤ)-q).toNat=j-q by omega,Polynomial.coeff_one_add_X_pow]
     rw [←Nat.choose_symm (show s ≤ q+s by omega)]
     simp [Nat.add_comm,Nat.add_left_comm,Nat.add_assoc]
   · have hz : a-q=0 := by omega
     simp [pellSeqMA24,chooseSeq_zeroMDB9 _ _ (by omega : (a:ℤ)-q<0),
       pellTermMA24,horizontalTerm9a72,hq,hz]
 · simp [pellSeqMA24,CoeffSeq,show (j:ℤ)-q<0 by omega,pellTermMA24,horizontalTerm9a72,hq]

theorem pell_row_inwardMA24 (a j s q r : ℕ) (hqr : q ≤ r) :
 pellTermMA24 a j s q*pellTermMA24 a j s (r+1) ≤
 pellTermMA24 a j s (q+1)*pellTermMA24 a j s r := by
 have h := pell_seq_crossMA24 a j s q r (by exact_mod_cast hqr)
 simpa only [←Nat.cast_add_one,pell_seq_natMA24] using h

theorem pell_row_midpointMA24 (a j s q r : ℕ) :
 pellTermMA24 a j s q*pellTermMA24 a j s r ≤
 pellTermMA24 a j s ((q+r)/2)*pellTermMA24 a j s ((q+r+1)/2) := by
 wlog hqr : q ≤ r generalizing q r
 · simpa only [add_comm,mul_comm] using this r q (by omega)
 let m := (q+r)/2-q
 let n := (q+r+1)/2-q
 have h := crossLC_balanced6d34 (pell_seq_crossMA24 a j s) q m n
 have e0 : (q:ℤ)+m+n=(r:ℤ) := by dsimp [m,n]; omega
 have e1 : (q:ℤ)+m=(((q+r)/2:ℕ):ℤ) := by dsimp [m]; omega
 have e2 : (q:ℤ)+n=(((q+r+1)/2:ℕ):ℤ) := by dsimp [n]; omega
 rw [e0,e1,e2,pell_seq_natMA24,pell_seq_natMA24,pell_seq_natMA24,pell_seq_natMA24] at h
 exact h

end
end MathGKM.Markov
