import MarkovTopSupportMB3E
/-! Machine-authored 55cf20d2. Exact fourth upper-template coefficient.
The weighted finite sum is telescoped without changing raw coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

def weightedChooseM55C (a k m : ℕ) : ℤ :=
 ((a+m+1).choose (k+2):ℤ)-((a+1).choose (k+2):ℤ)-m*(a.choose (k+1):ℤ)

theorem weighted_choose_sumM55C (a k m : ℕ) :
 (∑ s ∈ range m, ((m:ℤ)-s)*((a+s).choose k:ℤ))=weightedChooseM55C a k m :=
 choose_weighted_generalMB3E a k m

theorem choose_linearM55C (a s k : ℕ) (hk : k ≤ a) :
 (s:ℤ)*((a+s).choose k:ℤ)=
 (k+1)*((a+s).choose (k+1):ℤ)+((k:ℤ)-a)*((a+s).choose k:ℤ) := by
 have h := Nat.choose_succ_right_eq (a+s) k
 have hh := congrArg (fun z : ℕ => (z:ℤ)) h
 simp only [Nat.cast_mul,Nat.cast_sub (by omega : k ≤ a+s)] at hh
 push_cast at hh
 nlinarith

theorem weighted_choose_linearM55C (a k m : ℕ) (hk : k ≤ a) :
 (∑ s ∈ range m, ((m:ℤ)-s)*s*((a+s).choose k:ℤ))=
 (k+1)*weightedChooseM55C a (k+1) m+((k:ℤ)-a)*weightedChooseM55C a k m := by
 rw [←weighted_choose_sumM55C,←weighted_choose_sumM55C,mul_sum,mul_sum,←sum_add_distrib]
 apply sum_congr rfl
 intro s hs
 have h := choose_linearM55C a s k hk
 linear_combination ((m:ℤ)-s)*h

theorem top_fourth_coeffM55C (n t : ℕ) (hn : 2*t ≤ n) (ht : 3 ≤ t) :
 (topTemplateMB3E n t).coeff 4=
 ((t:ℤ)-3)*((n+6-t).choose 4:ℤ)+4*(
 5*weightedChooseM55C (n-2*t+9) 5 (t-3)+
 (4-((n-2*t+9:ℕ):ℤ))*weightedChooseM55C (n-2*t+9) 4 (t-3)) := by
 have he := top_positive_formulaMB3E n t 1 hn
 simp only [topPositiveMB3E,if_pos ht,Nat.choose_one_right] at he
 rw [show 1+3=4 by omega,show n+5-t+1=n+6-t by omega,Nat.cast_sub ht] at he
 rw [he]
 congr 1
 congr 1
 let f : ℕ → ℤ := fun s => ((t:ℤ)-s)*
   (if 3 ≤ s then ((s-3:ℕ):ℤ)*((n-2*t+s+6).choose 4:ℤ) else 0)
 have hs := sum_range_add f 3 (t-3)
 rw [show 3+(t-3)=t by omega] at hs
 have hz : (∑ s ∈ range 3, f s)=0 := by norm_num [f,sum_range_succ]
 rw [hz,zero_add] at hs
 change (∑ s ∈ range t, f s)=_
 rw [hs]
 have heq : (∑ s ∈ range (t-3), f (3+s))=
   ∑ s ∈ range (t-3), (((t-3:ℕ):ℤ)-s)*s*((n-2*t+9+s).choose 4:ℤ) := by
   apply sum_congr rfl
   intro s hs
   dsimp [f]
   rw [if_pos (by omega : 3 ≤ 3+s),show 3+s-3=s by omega,Nat.cast_sub ht]
   push_cast
   rw [show n-2*t+(3+s)+6=n-2*t+9+s by omega]
   ring
 rw [heq,weighted_choose_linearM55C _ 4 _ (by omega)]
 norm_num

end
end MathGKM.Markov
