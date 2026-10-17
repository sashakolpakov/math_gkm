import MarkovCorrectionFactorMDB2
import MarkovPositiveRowsMDAB
import MarkovCross774
/-! Machine-authored db238071. Exact support supplies the no-internal-zero
bridge for the augmented correction residual. Its adjacent inequalities remain
an explicit unproved premise. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

theorem correction_residual_zero_coeffMDB2 (q : ℕ) (r : Bool) :
 (correctionResidualMDB2 q r).coeff 0=correctionConstantMDB2 r := by
 simp [correctionResidualMDB2]

theorem correction_residual_succ_coeffMDB2 (q k : ℕ) (r : Bool) :
 (correctionResidualMDB2 q r).coeff (k+1)=
 (rowHMFFD (sourceNME9C q r) (q+1)).coeff k := by
 rw [correctionResidualMDB2,coeff_add,coeff_C,
   if_neg (by omega : k+1≠0),coeff_X_mul,zero_add]

theorem correction_residual_posMDB2 (q k : ℕ) (r : Bool)
 (hq : 2 ≤ q) (hk : k ≤ q+2) : 0 < (correctionResidualMDB2 q r).coeff k := by
 cases k with
 | zero => rw [correction_residual_zero_coeffMDB2]; cases r <;> norm_num [correctionConstantMDB2]
 | succ k =>
   rw [correction_residual_succ_coeffMDB2]
   apply rowH_coeff_posMDAB _ _ _ _ (by omega)
   cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] <;> omega

theorem correction_residual_tailMDB2 (q k : ℕ) (r : Bool) (hk : q+2<k) :
 (correctionResidualMDB2 q r).coeff k=0 := by
 cases k with
 | zero => omega
 | succ k => rw [correction_residual_succ_coeffMDB2,rowH_tailMFFD _ _ _ (by omega)]

def correctionSeqMDB2 (q : ℕ) (r : Bool) : ℤ → ℝ :=
 CoeffSeq ((correctionResidualMDB2 q r).map (Int.castRingHom ℝ))

theorem correction_seq_zeroMDB2 (q : ℕ) (r : Bool) (k : ℤ)
 (hk : k<0 ∨ (q:ℤ)+2<k) : correctionSeqMDB2 q r k=0 := by
 rcases hk with hk|hk
 · simp [correctionSeqMDB2,CoeffSeq,hk]
 · simp only [correctionSeqMDB2,CoeffSeq,if_neg (by omega : ¬ k<0),coeff_map,
     correction_residual_tailMDB2 q k.toNat r (by omega),map_zero]

theorem correction_seq_posMDB2 (q : ℕ) (r : Bool) (hq : 2 ≤ q) (k : ℤ)
 (hk0 : 0 ≤ k) (hkq : k ≤ (q:ℤ)+2) : 0 < correctionSeqMDB2 q r k := by
 simp only [correctionSeqMDB2,CoeffSeq,if_neg (by omega : ¬ k<0),coeff_map,Int.coe_castRingHom]
 exact_mod_cast correction_residual_posMDB2 q k.toNat r hq (by omega)

theorem correction_seq_nonnegMDB2 (q : ℕ) (r : Bool) (hq : 2 ≤ q) (k : ℤ) :
 0 ≤ correctionSeqMDB2 q r k := by
 by_cases h0 : 0 ≤ k
 · by_cases hqk : k ≤ (q:ℤ)+2
   · exact (correction_seq_posMDB2 q r hq k h0 hqk).le
   · rw [correction_seq_zeroMDB2 q r k (Or.inr (by omega))]
 · rw [correction_seq_zeroMDB2 q r k (Or.inl (by omega))]

theorem correction_seq_intervalMDB2 (q : ℕ) (r : Bool) (hq : 2 ≤ q) :
 IntervalSupport774 (correctionSeqMDB2 q r) := by
 intro i k j hik hkj hi hj
 have hi0 : 0 ≤ i := by
   by_contra h
   rw [correction_seq_zeroMDB2 q r i (Or.inl (by omega))] at hi
   exact (lt_irrefl _ hi)
 have hjq : j ≤ (q:ℤ)+2 := by
   by_contra h
   rw [correction_seq_zeroMDB2 q r j (Or.inr (by omega))] at hj
   exact (lt_irrefl _ hj)
 exact correction_seq_posMDB2 q r hq k (by omega) (by omega)

theorem correction_cross_iff_adjacentMDB2 (q : ℕ) (r : Bool) (hq : 2 ≤ q) :
 CrossLC (correctionSeqMDB2 q r) ↔
 ∀ k : ℤ, correctionSeqMDB2 q r (k-1)*correctionSeqMDB2 q r (k+1) ≤
   correctionSeqMDB2 q r k^2 := by
 constructor
 · intro h k; exact crossLC_adjacent h k
 · intro h
   exact crossLC_of_adjacent_interval774 _ (correction_seq_nonnegMDB2 q r hq) h
     (correction_seq_intervalMDB2 q r hq)

end
end MathGKM.Markov
