import MarkovBoundaryLCM831
/-! Machine-authored 831d426f. Interval-support bridges keep all zeros.
Only the d=0 factor's full CrossLC is discharged here. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def bandSeqM831 (d k : ℕ) (r : Bool) : ℤ → ℝ :=
 CoeffSeq ((bandAtM139 d k r).map (Int.castRingHom ℝ))

theorem band_seq_zeroM831 (d k : ℕ) (r : Bool) (i : ℤ)
 (hi : i<0 ∨ (k:ℤ)<i) : bandSeqM831 d k r i=0 := by
 rcases hi with hi|hi
 · simp [bandSeqM831,CoeffSeq,hi]
 · simp only [bandSeqM831,CoeffSeq,if_neg (by omega : ¬i<0),coeff_map,
     bandAtM139,band_Q_tailM139 _ k i.toNat r (by omega),map_zero]

theorem band_seq_nonnegM831 (d k : ℕ) (r : Bool) (i : ℤ) : 0 ≤ bandSeqM831 d k r i := by
 unfold bandSeqM831 CoeffSeq
 split_ifs
 · exact le_rfl
 · simp only [coeff_map,Int.coe_castRingHom]
   exact_mod_cast band_at_nonnegativeM831 d k i.toNat r

theorem band_seq_posM831 (d k : ℕ) (r : Bool) (i : ℤ) (h0 : 0 ≤ i) (hk : i ≤ k) :
 0 < bandSeqM831 d k r i := by
 simp only [bandSeqM831,CoeffSeq,if_neg (by omega : ¬i<0),coeff_map,Int.coe_castRingHom]
 exact_mod_cast band_at_positiveM831 d k i.toNat r (by omega)

theorem band_seq_intervalM831 (d k : ℕ) (r : Bool) : IntervalSupport774 (bandSeqM831 d k r) := by
 intro a b c hab hbc ha hc
 have h0 : 0 ≤ a := by
   by_contra h
   rw [band_seq_zeroM831 d k r a (Or.inl (by omega))] at ha
   linarith
 have h1 : c ≤ k := by
   by_contra h
   rw [band_seq_zeroM831 d k r c (Or.inr (by omega))] at hc
   linarith
 exact band_seq_posM831 d k r b (by omega) (by omega)

theorem band_cross_iff_adjacentM831 (d k : ℕ) (r : Bool) :
 CrossLC (bandSeqM831 d k r) ↔
 ∀ i, (bandAtM139 d k r).coeff i*(bandAtM139 d k r).coeff (i+2) ≤
   (bandAtM139 d k r).coeff (i+1)^2 := by
 constructor
 · intro h i
   have hh := crossLC_adjacent h ((i:ℤ)+1)
   simp only [bandSeqM831,CoeffSeq,add_sub_cancel_right,
     if_neg (by omega : ¬(i:ℤ)<0),if_neg (by omega : ¬(i:ℤ)+1<0),
     if_neg (by omega : ¬(i:ℤ)+1+1<0),Int.toNat_natCast,coeff_map,Int.coe_castRingHom] at hh
   exact_mod_cast hh
 · intro h
   apply crossLC_of_adjacent_interval774 _ (band_seq_nonnegM831 d k r) _ (band_seq_intervalM831 d k r)
   intro i
   by_cases hi : i ≤ 0
   · rw [band_seq_zeroM831 d k r (i-1) (Or.inl (by omega)),zero_mul]
     exact sq_nonneg _
   · have hi0 : 0 ≤ i-1 := by omega
     obtain ⟨m,hm⟩ := Int.eq_ofNat_of_zero_le hi0
     have he : i=(m:ℤ)+1 := by omega
     rw [he]
     simp only [bandSeqM831,CoeffSeq,add_sub_cancel_right,
       if_neg (by omega : ¬(m:ℤ)<0),if_neg (by omega : ¬(m:ℤ)+1<0),
       if_neg (by omega : ¬(m:ℤ)+1+1<0),Int.toNat_natCast,coeff_map,Int.coe_castRingHom]
     exact_mod_cast h m

theorem band_boundary_crossM831 (k : ℕ) (r : Bool) : CrossLC (bandSeqM831 0 k r) :=
 (band_cross_iff_adjacentM831 0 k r).mpr (fun i => boundary_raw_adjacentM831 k i r)

theorem band_boundary_smoothed_crossM831 (k n : ℕ) (r : Bool) :
 CrossLC (CoeffSeq ((1+X)^n*((bandAtM139 0 k r).map (Int.castRingHom ℝ)))) := by
 rw [coeffSeq_binomial_mul]
 exact crossLC_pascal (band_boundary_crossM831 k r) n

end
end MathGKM.Markov
