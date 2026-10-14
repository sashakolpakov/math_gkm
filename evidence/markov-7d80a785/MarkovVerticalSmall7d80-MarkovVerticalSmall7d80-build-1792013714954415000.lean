import MarkovVerticalCertificate7d80
/-! Machine-authored 7d80a785. Small-numerator vertical gap identities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem vertical_b1i0_nonneg7d80 (t : ℝ) (ht : 0 ≤ t) :
 0 ≤ verticalGap7d80 0 (t+3) 1 0 := by
 have he : verticalGap7d80 0 (t+3) 1 0=0 := by
   unfold verticalGap7d80 verticalQ7d80 nextT7955 cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7
   ring
 rw [he]
 all_goals positivity

theorem vertical_b1i1_nonneg7d80 (t : ℝ) (ht : 0 ≤ t) :
 0 ≤ verticalGap7d80 1 (t+2) 1 2 := by
 have he : verticalGap7d80 1 (t+2) 1 2=(13824+t*(33408+t*(29760+t*(12480+t*(2496+t*192))))) := by
   unfold verticalGap7d80 verticalQ7d80 nextT7955 cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7
   ring
 rw [he]
 positivity

theorem vertical_b1i2_nonneg7d80 (t : ℝ) (ht : 0 ≤ t) :
 0 ≤ verticalGap7d80 2 (t+1) 1 0 := by
 have he : verticalGap7d80 2 (t+1) 1 0=(24768+t*(61392+t*(56520+t*(25464+t*(6984+t*(1800+t*(432+t*48))))))) := by
   unfold verticalGap7d80 verticalQ7d80 nextT7955 cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7
   ring
 rw [he]
 positivity

theorem vertical_b2i0_nonneg7d80 (t : ℝ) (ht : 0 ≤ t) :
 0 ≤ verticalGap7d80 0 (t+3) 2 0 := by
 have he : verticalGap7d80 0 (t+3) 2 0=(17280+t*(49536+t*(56856+t*(34428+t*(12000+t*(2424+t*(264+t*12))))))) := by
   unfold verticalGap7d80 verticalQ7d80 nextT7955 cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7
   ring
 rw [he]
 positivity

theorem vertical_b2i1_nonneg7d80 (t : ℝ) (ht : 0 ≤ t) :
 0 ≤ verticalGap7d80 1 (t+2) 2 2 := by
 have he : verticalGap7d80 1 (t+2) 2 2=(51840+t*(125280+t*(115056+t*(55152+t*(16800+t*(3840+t*(624+t*48))))))) := by
   unfold verticalGap7d80 verticalQ7d80 nextT7955 cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7
   ring
 rw [he]
 positivity

theorem vertical_b2i2_nonneg7d80 (t : ℝ) (ht : 0 ≤ t) :
 0 ≤ verticalGap7d80 2 (t+1) 2 0 := by
 have he : verticalGap7d80 2 (t+1) 2 0=(18432+t*(75264+t*(104832+t*(65856+t*(22656+t*(6144+t*(1536+t*192))))))) := by
   unfold verticalGap7d80 verticalQ7d80 nextT7955 cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7
   ring
 rw [he]
 positivity

theorem vertical_small_gap7d80 (i j : ℕ) (b : ℕ) (hb : b=1 ∨ b=2)
 (hd : 3 ≤ i+j) (hc : 2*(b:ℝ) ≤ (i:ℝ)+j+1) :
 0 ≤ verticalGap7d80 i j b (if i=1 then 2 else 0) := by
 rcases i with _ | (_ | (_ | i))
 · have hj : 3 ≤ j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   rcases hb with rfl | rfl
   · simpa [Nat.cast_add,add_comm] using vertical_b1i0_nonneg7d80 k (by positivity)
   · simpa [Nat.cast_add,add_comm] using vertical_b2i0_nonneg7d80 k (by positivity)
 · have hj : 2 ≤ j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   rcases hb with rfl | rfl
   · simpa [Nat.cast_add,add_comm] using vertical_b1i1_nonneg7d80 k (by positivity)
   · simpa [Nat.cast_add,add_comm] using vertical_b2i1_nonneg7d80 k (by positivity)
 · have hj : 1 ≤ j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   rcases hb with rfl | rfl
   · simpa [Nat.cast_add,add_comm] using vertical_b1i2_nonneg7d80 k (by positivity)
   · simpa [Nat.cast_add,add_comm] using vertical_b2i2_nonneg7d80 k (by positivity)
 · have hne : i+1+1+1 ≠ 1 := by omega
   simpa [hne,Nat.cast_add,add_comm,add_left_comm,add_assoc] using vertical_large_nonneg7d80 i j b (by positivity) (by positivity) (by positivity) (by push_cast at hc; linarith)
#print axioms vertical_small_gap7d80
end
end MathGKM.Markov
