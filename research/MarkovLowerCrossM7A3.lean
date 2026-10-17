import MarkovLowerClosedM7A3
import MarkovCross774
/-! Machine-authored 7a344181. Full zero-extended CrossLC for the smoothed
lower-row polynomial. This does NOT assert LowerRowShapeMFFD for the residual
rowHMFFD before multiplication by its binomial factor. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

def outputSeqM7A3 (d j : ℕ) (k : ℤ) : ℝ :=
 if k<0 then 0 else (liftOutputMAE9 d j k.toNat : ℝ)

theorem output_seq_zeroM7A3 (d j : ℕ) (k : ℤ)
 (hk : k<0 ∨ (d+j:ℕ)<k) : outputSeqM7A3 d j k=0 := by
 rcases hk with hk|hk
 · simp [outputSeqM7A3,hk]
 · simp only [outputSeqM7A3,if_neg (by omega : ¬k<0)]
   rw [lift_output_tailMAE9 d j k.toNat (by omega),Int.cast_zero]

theorem output_seq_nonnegM7A3 (d j : ℕ) (k : ℤ) : 0 ≤ outputSeqM7A3 d j k := by
 unfold outputSeqM7A3
 split_ifs
 · exact le_rfl
 · exact_mod_cast lift_output_nonnegMAE9 d j k.toNat

theorem output_seq_posM7A3 (d j : ℕ) (k : ℤ) (h0 : 0 ≤ k) (h1 : k ≤ (d+j:ℕ)) :
 0 < outputSeqM7A3 d j k := by
 simp only [outputSeqM7A3,if_neg (by omega : ¬k<0)]
 exact_mod_cast lift_output_positiveMAE9 d j k.toNat (by omega)

theorem output_seq_adjacentM7A3 (d j : ℕ) (k : ℤ) :
 outputSeqM7A3 d j (k-1)*outputSeqM7A3 d j (k+1) ≤ outputSeqM7A3 d j k^2 := by
 by_cases hk : k ≤ 0
 · rw [output_seq_zeroM7A3 d j (k-1) (Or.inl (by omega)),zero_mul]
   exact sq_nonneg _
 · have h := lift_output_lcM7A3 d j (k-1).toNat
   have h1 : k.toNat=(k-1).toNat+1 := by omega
   have h2 : (k+1).toNat=(k-1).toNat+2 := by omega
   simp only [outputSeqM7A3,if_neg (by omega : ¬k-1<0),
     if_neg (by omega : ¬k+1<0),if_neg (by omega : ¬k<0),h1,h2]
   exact_mod_cast h

theorem output_seq_intervalM7A3 (d j : ℕ) : IntervalSupport774 (outputSeqM7A3 d j) := by
 intro a k b hak hkb ha hb
 have ha0 : 0 ≤ a := by
   by_contra h
   rw [output_seq_zeroM7A3 d j a (Or.inl (by omega))] at ha
   exact (lt_irrefl _ ha)
 have hb1 : b ≤ (d+j:ℕ) := by
   by_contra h
   rw [output_seq_zeroM7A3 d j b (Or.inr (by omega))] at hb
   exact (lt_irrefl _ hb)
 exact output_seq_posM7A3 d j k (by omega) (by omega)

theorem output_seq_crossM7A3 (d j : ℕ) : CrossLC (outputSeqM7A3 d j) :=
 crossLC_of_adjacent_interval774 _ (output_seq_nonnegM7A3 d j)
   (output_seq_adjacentM7A3 d j) (output_seq_intervalM7A3 d j)

theorem lower_row_seqM7A3 (d j : ℕ) (k : ℤ) :
 CoeffSeq ((lowerRowMFFD (2*j+1+d) j).map (Int.castRingHom ℝ)) k =
 outputSeqM7A3 d j (k-3) := by
 by_cases hk : k<0
 · simp [CoeffSeq,outputSeqM7A3,hk,show k-3<0 by omega]
 simp only [CoeffSeq,if_neg hk,Polynomial.coeff_map,Int.coe_castRingHom]
 by_cases h3 : k<3
 · rw [output_seq_zeroM7A3 d j (k-3) (Or.inl (by omega))]
   simp [lowerRowMFFD,Polynomial.coeff_X_pow_mul',show ¬3 ≤ k.toNat by omega]
 · simp only [outputSeqM7A3,if_neg (by omega : ¬k-3<0)]
   have he : k.toNat=(k-3).toNat+3 := by omega
   rw [he]
   exact_mod_cast lower_row_liftMAE9 d j (k-3).toNat

theorem lower_row_polynomial_crossM7A3 (n j : ℕ) (hn : 2*j+1 ≤ n) :
 CrossLC (CoeffSeq ((lowerRowMFFD n j).map (Int.castRingHom ℝ))) := by
 have h := crossLC_shift (output_seq_crossM7A3 (n-2*j-1) j) (-3)
 have he : 2*j+1+(n-2*j-1)=n := by omega
 have hs : CoeffSeq ((lowerRowMFFD n j).map (Int.castRingHom ℝ)) =
   fun k => outputSeqM7A3 (n-2*j-1) j (k+(-3)) := by
   ext k
   simpa only [he,sub_eq_add_neg] using lower_row_seqM7A3 (n-2*j-1) j k
 rw [hs]
 exact h

end
end MathGKM.Markov
