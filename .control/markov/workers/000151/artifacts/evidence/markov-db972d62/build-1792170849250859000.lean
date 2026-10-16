import MarkovKernelGeneralMDB9
/-! Machine-authored db972d62. Zero-extended binomial sequences and the weight 1,2,2,... . -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 3000000

def nbSeqMDB9 (s : ℕ) (k : ℤ) : ℝ :=
 if k<0 then 0 else ((k.toNat+s).choose s:ℝ)

theorem nbSeq_nonnegMDB9 (s : ℕ) (k : ℤ) : 0≤nbSeqMDB9 s k := by
 unfold nbSeqMDB9; split_ifs <;> positivity

theorem nbSeq_zeroMDB9 (s : ℕ) (k : ℤ) (hk : k<0) : nbSeqMDB9 s k=0 := by
 simp [nbSeqMDB9,hk]

theorem nbSeq_natMDB9 (s k : ℕ) : nbSeqMDB9 s k=((k+s).choose s:ℝ) := by
 simp [nbSeqMDB9]

theorem nbSeq_polyMDB9 (s N : ℕ) (k : ℤ) (hk : k≤N) :
 CoeffSeq (nbPoly6d34 s N) k=nbSeqMDB9 s k := by
 by_cases h : k<0
 · simp [CoeffSeq,nbSeqMDB9,h]
 · simp [CoeffSeq,nbSeqMDB9,h,nbPoly_coeff6d34,show k.toNat≤N by omega]

theorem nbSeq_crossMDB9 (s : ℕ) : CrossLC (nbSeqMDB9 s) := by
 intro i j hij
 have h := nbPoly_cross6d34 s (j+1).toNat i j hij
 rw [nbSeq_polyMDB9 s _ i (by omega),nbSeq_polyMDB9 s _ (j+1) (by omega),
   nbSeq_polyMDB9 s _ (i+1) (by omega),nbSeq_polyMDB9 s _ j (by omega)] at h
 exact h

def chooseSeqMDB9 (r : ℕ) (k : ℤ) : ℝ := nbSeqMDB9 r (k-r)

theorem chooseSeq_crossMDB9 (r : ℕ) : CrossLC (chooseSeqMDB9 r) := by
 simpa only [chooseSeqMDB9,sub_eq_add_neg] using crossLC_shift (nbSeq_crossMDB9 r) (-(r:ℤ))

theorem chooseSeq_nonnegMDB9 (r : ℕ) (k : ℤ) : 0≤chooseSeqMDB9 r k := nbSeq_nonnegMDB9 _ _

theorem chooseSeq_zeroMDB9 (r : ℕ) (k : ℤ) (hk : k<0) : chooseSeqMDB9 r k=0 :=
 nbSeq_zeroMDB9 r _ (by omega)

theorem chooseSeq_natMDB9 (r k : ℕ) : chooseSeqMDB9 r k=(k.choose r:ℝ) := by
 by_cases h : r≤k
 · simp [chooseSeqMDB9,nbSeqMDB9,show ¬(k:ℤ)-r<0 by omega,
     show ((k:ℤ)-r).toNat+r=k by omega]
 · simp [chooseSeqMDB9,nbSeqMDB9,show (k:ℤ)-r<0 by omega,
     Nat.choose_eq_zero_of_lt (by omega : k<r)]

def weightSeqMDB9 (k : ℤ) : ℝ := if k<0 then 0 else if k=0 then 1 else 2

theorem weight_nonnegMDB9 (k : ℤ) : 0≤weightSeqMDB9 k := by
 unfold weightSeqMDB9; split_ifs <;> norm_num

theorem weight_zeroMDB9 (k : ℤ) (hk : k<0) : weightSeqMDB9 k=0 := by simp [weightSeqMDB9,hk]

theorem weight_crossMDB9 : CrossLC weightSeqMDB9 := by
 intro i j hij
 by_cases hi : i<0
 · rw [weight_zeroMDB9 i hi,zero_mul]
   exact mul_nonneg (weight_nonnegMDB9 _) (weight_nonnegMDB9 _)
 · have hj : ¬j<0 := by omega
   have hi1 : ¬i+1<0 := by omega
   have hj1 : ¬j+1<0 := by omega
   simp only [weightSeqMDB9,hi,hj,hi1,hj1,if_false,
     if_neg (show i+1≠0 by omega),if_neg (show j+1≠0 by omega)]
   split_ifs <;> norm_num <;> omega
end
end MathGKM.Markov
