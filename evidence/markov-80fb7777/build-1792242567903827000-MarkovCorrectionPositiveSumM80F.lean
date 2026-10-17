import MarkovMiddlePositiveM99A
/-! Machine-authored 80fb7777. Uniform positive finite-sum representation
of the actual middle correction, not an addition closure for log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 7000000

def weightedCorrectionM80F (f : ℕ → Polynomial ℤ) (k : ℕ) : Polynomial ℤ :=
 ∑ s ∈ range k, C ((k:ℤ)-1-s)*f s

theorem weighted_correction_stepM80F (f : ℕ → Polynomial ℤ) (k : ℕ) :
 weightedCorrectionM80F f (k+2)-2*weightedCorrectionM80F f (k+1)+
 weightedCorrectionM80F f k=f k := by
 have hstep (n : ℕ) : weightedCorrectionM80F f (n+1)=
   weightedCorrectionM80F f n+∑ s ∈ range n, f s := by
   unfold weightedCorrectionM80F
   rw [sum_range_succ]
   simp only [Nat.cast_add,Nat.cast_one]
   have he : ((n:ℤ)+1-1-n)=0 := by ring
   rw [he,map_zero,zero_mul,add_zero,←sum_add_distrib]
   apply sum_congr rfl
   intro s hs
   rw [show (n:ℤ)+1-1-s=((n:ℤ)-1-s)+1 by ring,map_add,map_one]
   ring
 rw [show k+2=(k+1)+1 by omega,hstep (k+1),hstep k,sum_range_succ]
 ring

def positiveCorrectionM80F (d k : ℕ) (r : Bool) : Polynomial ℤ :=
 (if r then 8 else 4)*X+12*C (k:ℤ)*X+
 C (k:ℤ)*(if r then 8*C ((d:ℤ)+3) else 4*C ((d:ℤ)+4))*X^2+
 4*X*weightedCorrectionM80F (fun s => middleGainM99A (d+2*s+4) (s+2) r) k

theorem positive_correction_formulaM80F (d k : ℕ) (r : Bool) :
 middleAtM99A d k r=positiveCorrectionM80F d k r := by
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · simp [middleAtM99A,middleCorrectionM99A,middle_gain_topM99A,
       positiveCorrectionM80F,weightedCorrectionM80F]
   · simp only [middleAtM99A,Nat.mul_one]
     rw [middle_correction_oneM99A (d+2+2) r (by omega)]
     cases r <;> simp [positiveCorrectionM80F,weightedCorrectionM80F,sum_range_succ] <;> ring
   · have h := middle_at_diagonalM99A d k r
     rw [ih k (by omega),ih (k+1) (by omega)] at h
     have hs := weighted_correction_stepM80F
       (fun s => middleGainM99A (d+2*s+4) (s+2) r) k
     simp only [positiveCorrectionM80F,Nat.cast_add,Nat.cast_ofNat,map_add,map_ofNat] at h ⊢
     linear_combination h+4*X*hs

theorem correction_positive_sumM80F (q k : ℕ) (r : Bool) (hq : 2*k+2 ≤ q) :
 middleCorrectionM99A q r k=positiveCorrectionM80F (q-(2*k+2)) k r := by
 have h := positive_correction_formulaM80F (q-(2*k+2)) k r
 simpa only [middleAtM99A,show q-(2*k+2)+2*k+2=q by omega] using h

theorem correction_sum_terms_nonnegM80F (d k s c : ℕ) (r : Bool) (hs : s<k) :
 0 ≤ (C ((k:ℤ)-1-s)*middleGainM99A (d+2*s+4) (s+2) r).coeff c := by
 rw [coeff_C_mul]
 apply mul_nonneg
 · omega
 · exact gain_coeff_nonnegM99A _ _ _ r

end
end MathGKM.Markov
