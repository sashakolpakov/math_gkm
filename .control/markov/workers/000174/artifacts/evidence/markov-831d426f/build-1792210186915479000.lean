import MarkovFibCoeffM831
import MarkovBinomialLC6ade
import MarkovCross774
/-! Machine-authored 831d426f. All-coefficient positivity, exact interval
support and raw log-concavity of the forcing Fibonacci factors. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem fib_band_nonnegM831 (n j m : ℕ) : 0 ≤ (fibBandM139 n j).coeff m := by
 rw [fib_band_closed_coeffM831]
 positivity

theorem fib_band_pos_iffM831 (n j m : ℕ) :
 0 < (fibBandM139 n j).coeff m ↔ m ≤ j := by
 rw [fib_band_closed_coeffM831]
 constructor
 · intro h
   by_contra hm
   rw [Nat.choose_eq_zero_of_lt (by omega : j+1 < m+1)] at h
   norm_num at h
 · intro hm
   apply mul_pos
   · exact_mod_cast Nat.choose_pos (show m+1 ≤ j+1 by omega)
   · exact_mod_cast Nat.choose_pos (show m ≤ n-j-1+m+1 by omega)

theorem fib_band_adjacentM831 (n j m : ℕ) :
 (fibBandM139 n j).coeff m*(fibBandM139 n j).coeff (m+2) ≤
   (fibBandM139 n j).coeff (m+1)^2 := by
 simp only [fib_band_closed_coeffM831]
 have h1 := choose_raw_lc1998 (j+1) (m+1)
 have h2 := choose_upper_lc6 (n-j-1+m+1) (n-j-1+1)
 have hs (t : ℕ) : (n-j-1+t+1).choose t=(n-j-1+t+1).choose (n-j-1+1) := by
   rw [←Nat.choose_symm (show t ≤ n-j-1+t+1 by omega)]
   congr 1 <;> omega
 rw [hs m,hs (m+2),hs (m+1)]
 convert lc_product6 _ _ _ _ _ _ (by positivity) (by positivity) (by positivity) h1 h2 using 1 <;>
   congr 2 <;> omega

def fibBandSeqM831 (n j : ℕ) : ℤ → ℝ :=
 CoeffSeq ((fibBandM139 n j).map (Int.castRingHom ℝ))

theorem fib_band_seq_nonnegM831 (n j : ℕ) (i : ℤ) : 0 ≤ fibBandSeqM831 n j i := by
 unfold fibBandSeqM831 CoeffSeq
 split_ifs
 · exact le_rfl
 · simp only [coeff_map,Int.coe_castRingHom]
   exact_mod_cast fib_band_nonnegM831 n j i.toNat

theorem fib_band_seq_pos_iffM831 (n j : ℕ) (i : ℤ) :
 0 < fibBandSeqM831 n j i ↔ 0 ≤ i ∧ i ≤ j := by
 by_cases hi : i < 0
 · simp [fibBandSeqM831,CoeffSeq,hi,show ¬0 ≤ i by omega]
 · simp only [fibBandSeqM831,CoeffSeq,hi,if_false,coeff_map,Int.coe_castRingHom]
   have h : 0 < ((fibBandM139 n j).coeff i.toNat:ℝ) ↔ i.toNat ≤ j := by
     rw [Int.cast_pos,fib_band_pos_iffM831]
   rw [h]
   omega

theorem fib_band_crossM831 (n j : ℕ) : CrossLC (fibBandSeqM831 n j) := by
 apply crossLC_of_adjacent_interval774 _ (fib_band_seq_nonnegM831 n j)
 · intro i
   by_cases hi : i ≤ 0
   · have hz : fibBandSeqM831 n j (i-1)=0 := by
       simp [fibBandSeqM831,CoeffSeq,show i-1<0 by omega]
     rw [hz,zero_mul]; exact sq_nonneg _
   · have hi0 : 0 ≤ i-1 := by omega
     obtain ⟨m,hm⟩ := Int.eq_ofNat_of_zero_le hi0
     have h := fib_band_adjacentM831 n j m
     have he : i=(m:ℤ)+1 := by omega
     rw [he]
     simp only [fibBandSeqM831,CoeffSeq,add_sub_cancel_right,
       if_neg (by omega : ¬(m:ℤ)<0),if_neg (by omega : ¬(m:ℤ)+1<0),
       if_neg (by omega : ¬(m:ℤ)+1+1<0),Int.toNat_natCast,coeff_map,Int.coe_castRingHom]
     exact_mod_cast h
 · intro a b c hab hbc ha hc
   rw [fib_band_seq_pos_iffM831] at ha hc ⊢
   omega

end
end MathGKM.Markov
