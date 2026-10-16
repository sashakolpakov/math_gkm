import MarkovOffsetObstructionM58E
/-! Machine-authored af6200bf. Zero-aware support and inward binomial weights. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 1000000

theorem choose_inwardMAF6 (n h k : ℕ) (hk : h < k) :
 (n.choose h:ℤ)*(n.choose k:ℤ) ≤ (n.choose (h+1):ℤ)*(n.choose (k-1):ℤ) := by
 by_cases hn : k ≤ n
 · have hh : h ≤ n := by omega
   have h0 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_succ_right_eq n h)
   have h1 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_succ_right_eq n (k-1))
   rw [show k-1+1=k by omega] at h1
   push_cast at h0 h1
   rw [Nat.cast_sub hh] at h0
   rw [Nat.cast_sub (by omega : k-1 ≤ n)] at h1
   have he : ((k-1:ℕ):ℤ)=(k:ℤ)-1 := by omega
   rw [he] at h1
   have hg : ((h:ℤ)+1)*k*((n.choose (h+1):ℤ)*(n.choose (k-1):ℤ)-
     (n.choose h:ℤ)*(n.choose k:ℤ))=
     ((n:ℤ)+1)*(k-h-1)*(n.choose h:ℤ)*(n.choose (k-1):ℤ) := by
     linear_combination (k:ℤ)*(n.choose (k-1):ℤ)*h0-
       ((h:ℤ)+1)*(n.choose h:ℤ)*h1
   have hp : 0 ≤ ((n:ℤ)+1)*(k-h-1)*(n.choose h:ℤ)*(n.choose (k-1):ℤ) := by
     have : 0 ≤ (k:ℤ)-h-1 := by omega
     positivity
   rw [←hg] at hp
   have hd : 0 < ((h:ℤ)+1)*k := by have : 0 < (k:ℤ) := by omega; positivity
   exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hd).mp hp)
 · rw [Nat.choose_eq_zero_of_lt (by omega : n<k),Int.natCast_zero,mul_zero]
   positivity

theorem lower_term_supportMAF6 (j d i h : ℕ) (hn : lowerTermM58E j d i h ≠ 0) :
 h+2 ≤ i ∧ i ≤ j+h+2 ∧ h ≤ 2*d := by
 have hh : h < i-1 := by
   by_contra hh
   simp [lowerTermM58E,hh] at hn
 have hd : h ≤ 2*d := by
   by_contra hd
   simp [lowerTermM58E,hh,Nat.choose_eq_zero_of_lt (by omega : 2*d<h)] at hn
 have hi : i ≤ j+h+2 := by
   by_contra hi
   simp [lowerTermM58E,hh,lowerCoreM58E,
     Nat.choose_eq_zero_of_lt (by omega : j+i+1<2*i-1-h),
     Nat.choose_eq_zero_of_lt (by omega : j+i<2*i-1-h)] at hn
 exact ⟨by omega,hi,hd⟩

theorem lower_term_highMAF6 (j d i h : ℕ) (hh : 2*d<h) : lowerTermM58E j d i h=0 := by
 unfold lowerTermM58E
 split_ifs <;> simp [Nat.choose_eq_zero_of_lt hh]

theorem lower_term_sumMAF6 (j d i : ℕ) :
 (∑ h∈Finset.range (2*d+1), lowerTermM58E j d i h)=lowerValM58E j d i := by
 have he : lowerValM58E j d i=∑ h∈Finset.range (i-1),lowerTermM58E j d i h := by
   unfold lowerValM58E
   apply Finset.sum_congr rfl
   intro h hh
   rw [lowerTermM58E,if_pos (Finset.mem_range.mp hh)]
   unfold lowerCoreM58E
   ring
 rw [he]
 by_cases hn : 2*d+1 ≤ i-1
 · apply Finset.sum_subset (Finset.range_mono hn)
   intro h hh hn'
   apply lower_term_highMAF6
   simp only [Finset.mem_range] at hn'
   omega
 · symm
   apply Finset.sum_subset (Finset.range_mono (by omega : i-1 ≤ 2*d+1))
   intro h hh hn'
   simp only [Finset.mem_range] at hn'
   simp [lowerTermM58E,hn']

end
end MathGKM.Markov
