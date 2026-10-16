import MarkovPellHorizontalSum9a72
/-! Machine-authored a24fe23d. Exact Pell summand support and ratio equations.
These are raw-sum constituents; no closure of LC under addition is assumed. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def pellTermMA24 (a j s q : ℕ) : ℝ := (horizontalTerm9a72 a j q s : ℝ)

theorem pell_term_nonnegMA24 (a j s q : ℕ) : 0 ≤ pellTermMA24 a j s q := by
 unfold pellTermMA24 horizontalTerm9a72
 split_ifs <;> positivity

theorem pell_term_posMA24 (a j s q : ℕ) :
 0 < pellTermMA24 a j s q ↔ s+q+1 ≤ a ∧ q ≤ j ∧ j ≤ 2*s+2+q := by
 by_cases hq : q ≤ j
 · simp only [pellTermMA24,horizontalTerm9a72,if_pos hq,Int.cast_mul,Int.cast_natCast]
   have h1 : 0 ≤ ((a-q).choose (s+1) : ℝ) := by positivity
   have h2 : 0 < ((s+q).choose q : ℝ) := by exact_mod_cast Nat.choose_pos (by omega : q ≤ s+q)
   have h3 : 0 ≤ ((2*s+2).choose (j-q) : ℝ) := by positivity
   have he : 0 < ((a-q).choose (s+1):ℝ)*((s+q).choose q:ℝ)*((2*s+2).choose (j-q):ℝ) ↔
       0 < ((a-q).choose (s+1):ℝ) ∧ 0 < ((2*s+2).choose (j-q):ℝ) := by
     constructor
     · intro h
       exact ⟨pos_of_mul_pos_left (pos_of_mul_pos_left h h3) h2.le,
         pos_of_mul_pos_right h (mul_nonneg h1 h2.le)⟩
     · rintro ⟨hh,hz⟩; exact mul_pos (mul_pos hh h2) hz
   rw [he]
   constructor
   · rintro ⟨hh,hz⟩
     have hc1 : s+1 ≤ a-q := by
       by_contra hn
       rw [Nat.choose_eq_zero_of_lt (by omega : a-q<s+1)] at hh
       norm_num at hh
     have hc3 : j-q ≤ 2*s+2 := by
       by_contra hn
       rw [Nat.choose_eq_zero_of_lt (by omega : 2*s+2<j-q)] at hz
       norm_num at hz
     omega
   · rintro ⟨ha,_,hj⟩
     exact ⟨by exact_mod_cast Nat.choose_pos (by omega : s+1 ≤ a-q),
       by exact_mod_cast Nat.choose_pos (by omega : j-q ≤ 2*s+2)⟩
 · simp [pellTermMA24,horizontalTerm9a72,hq]

theorem choose_down_topMA24 (n k : ℕ) (hk : k ≤ n) :
 ((n:ℝ)+1-k)*((n+1).choose k:ℝ)=((n:ℝ)+1)*(n.choose k:ℝ) := by
 have h := Nat.choose_mul_succ_eq n k
 have h' := congrArg (fun t : ℕ => (t:ℝ)) h
 push_cast at h'
 rw [Nat.cast_sub (by omega : k ≤ n+1)] at h'
 push_cast at h'
 nlinarith only [h']

theorem pell_term_q_stepMA24 (a j s q : ℕ)
 (ha : s+q+2 ≤ a) (hq : q+1 ≤ j) (hj : j ≤ 2*s+2+q) :
 ((a:ℝ)-q)*(q+1)*(2*s+3-j+q)*pellTermMA24 a j s (q+1)=
 ((a:ℝ)-q-s-1)*(s+q+1)*(j-q)*pellTermMA24 a j s q := by
 have e0 : a-q=(a-(q+1))+1 := by omega
 have e1 : j-q=(j-(q+1))+1 := by omega
 have h0 := choose_down_topMA24 (a-(q+1)) (s+1) (by omega)
 rw [←e0] at h0
 have h1 := congrArg (fun n : ℕ => (n:ℝ)) (Nat.add_one_mul_choose_eq (s+q) q)
 have h2 := congrArg (fun n : ℕ => (n:ℝ)) (Nat.choose_succ_right_eq (2*s+2) (j-(q+1)))
 push_cast at h1 h2
 rw [Nat.cast_sub (by omega : j-(q+1) ≤ 2*s+2)] at h2
 rw [←e1] at h2
 have ea : ((a-(q+1):ℕ):ℝ)=(a:ℝ)-q-1 := by rw [Nat.cast_sub (by omega : q+1 ≤ a)]; push_cast; ring
 have ej : ((j-(q+1):ℕ):ℝ)=(j:ℝ)-q-1 := by rw [Nat.cast_sub hq]; push_cast; ring
 rw [ea] at h0
 rw [ej] at h2
 push_cast at h0 h2
 unfold pellTermMA24 horizontalTerm9a72
 rw [if_pos (by omega : q+1 ≤ j),if_pos (by omega : q ≤ j)]
 push_cast
 have hp := congrArg₂ (fun x y : ℝ => x*y) (congrArg₂ (fun x y : ℝ => x*y) h0.symm h1.symm) h2.symm
 simp only [Nat.add_assoc] at hp
 convert hp using 1 <;> ring

end
end MathGKM.Markov
