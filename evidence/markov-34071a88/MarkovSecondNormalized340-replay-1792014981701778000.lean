import MarkovSecondCertificate340
/-! Machine-authored 34071a88. Algebraic envelope for the source second row. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem second_gap_bernstein340 (k N m t : ℝ) :
 (2*m)^2*secondGap340 k N m t =
 (2*m-t)^2*secondGap340 k N m 0+
 t*(2*m-t)*secondMid340 k N m+t^2*secondGap340 k N m (2*m) := by
 unfold secondGap340 secondMid340 secondNorm340
 ring

theorem second_gap_zero340 (k N : ℕ) (m : ℝ) (hm : 0 ≤ m)
 (hN : 4 ≤ N) (hk : 1 ≤ k) (hend : k+2 ≤ N) :
 0 ≤ secondGap340 k N m 0 := by
 rcases k with _ | (_ | (_ | k))
 · omega
 · have h := second_zero_one340 0 (N-4 : ℝ) m (by norm_num) (by linarith [show (4:ℝ) ≤ N by exact_mod_cast hN]) hm
   convert h using 1 <;> congr 1 <;> norm_num <;> ring
 · have h := second_zero_two340 0 (N-4 : ℝ) m (by norm_num) (by linarith [show (4:ℝ) ≤ N by exact_mod_cast hN]) hm
   convert h using 1 <;> congr 1 <;> norm_num <;> ring
 · have hn : (k:ℝ)+5 ≤ N := by exact_mod_cast hend
   have h := second_zero_large340 k (N-k-5 : ℝ) m (by positivity) (by linarith) hm
   convert h using 1 <;> congr 1 <;> push_cast <;> ring

theorem second_gap_edges340 (k N : ℕ) (m : ℝ) (hm : 0 ≤ m)
 (hN : 4 ≤ N) (hk : 1 ≤ k) (hend : k+2 ≤ N)
 (hlo : (N:ℝ)-1 ≤ 2*m) (hhi : m ≤ (N:ℝ)-1) :
 0 ≤ secondMid340 k N m ∧ 0 ≤ secondGap340 k N m (2*m) := by
 rcases k with _ | (_ | (_ | k))
 · omega
 · constructor
   · have h := second_middle_one340 0 (N-4 : ℝ) m (by norm_num) (by linarith [show (4:ℝ) ≤ N by exact_mod_cast hN]) hm (by linarith) (by linarith)
     convert h using 1 <;> congr 1 <;> norm_num <;> ring
   · have h := second_upper_one340 0 (N-4 : ℝ) m (by norm_num) (by linarith [show (4:ℝ) ≤ N by exact_mod_cast hN]) hm (by linarith) (by linarith)
     convert h using 1 <;> congr 1 <;> norm_num <;> ring
 · constructor
   · have h := second_middle_two340 0 (N-4 : ℝ) m (by norm_num) (by linarith [show (4:ℝ) ≤ N by exact_mod_cast hN]) hm (by linarith) (by linarith)
     convert h using 1 <;> congr 1 <;> norm_num <;> ring
   · have h := second_upper_two340 0 (N-4 : ℝ) m (by norm_num) (by linarith [show (4:ℝ) ≤ N by exact_mod_cast hN]) hm (by linarith) (by linarith)
     convert h using 1 <;> congr 1 <;> norm_num <;> ring
 · have hn : (k:ℝ)+5 ≤ N := by exact_mod_cast hend
   constructor
   · have h := second_middle_large340 k (N-k-5 : ℝ) m (by positivity) (by linarith) hm (by linarith) (by linarith)
     convert h using 1 <;> congr 1 <;> push_cast <;> ring
   · have h := second_upper_large340 k (N-k-5 : ℝ) m (by positivity) (by linarith) hm (by linarith) (by linarith)
     convert h using 1 <;> congr 1 <;> push_cast <;> ring

theorem second_normalized_lc340 (k N : ℕ) (m t : ℝ) (hm : 0 ≤ m)
 (hN : 4 ≤ N) (hk : 1 ≤ k) (hend : k+2 ≤ N)
 (ht : 0 ≤ t) (htm : t ≤ 2*m) (hhi : m ≤ (N:ℝ)-1)
 (hsource : (N:ℝ)-1 ≤ 2*m ∨ t=0) :
 secondNorm340 k N m t*secondNorm340 (k+2) N m t ≤
 secondNorm340 (k+1) N m t^2 := by
 have h0 := second_gap_zero340 k N m hm hN hk hend
 rcases hsource with hlo | hz
 · obtain ⟨hmid,hmax⟩ := second_gap_edges340 k N m hm hN hk hend hlo hhi
   have hNR : (4:ℝ) ≤ N := by exact_mod_cast hN
   have hmp : 0 < (2*m)^2 := by apply sq_pos_of_pos; linarith
   have he := second_gap_bernstein340 k N m t
   have hp : 0 ≤ (2*m-t)^2*secondGap340 k N m 0+
       t*(2*m-t)*secondMid340 k N m+t^2*secondGap340 k N m (2*m) := by
     have : 0 ≤ 2*m-t := by linarith
     positivity
   rw [← he] at hp
   have hh := (mul_nonneg_iff_of_pos_left hmp).mp hp
   simpa only [secondGap340,Nat.cast_add,Nat.cast_ofNat,Nat.cast_one,sub_nonneg] using hh
 · subst t
   simpa only [secondGap340,Nat.cast_add,Nat.cast_ofNat,Nat.cast_one,sub_nonneg] using h0

#print axioms second_normalized_lc340
end
end MathGKM.Markov
