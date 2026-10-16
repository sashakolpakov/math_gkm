import MathGKM.Markov
/-! Machine-authored request 6e1369de. Finite binomial identities for central rows. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 2000000

theorem hockeyM6E1 (n k : ℕ) :
 (∑ t ∈ range (n+1), t.choose k)=(n+1).choose (k+1) := by
 induction n with
 | zero => cases k <;> simp [Nat.choose_succ_succ]
 | succ n ih =>
   rw [sum_range_succ,ih]
   simpa [add_comm] using (Nat.choose_succ_succ' (n+1) k).symm

theorem binconvM6E1 (n r s : ℕ) :
 (∑ t ∈ range (n+1), t.choose r*(n-t).choose s)=(n+1).choose (r+s+1) := by
 induction n generalizing r s with
 | zero =>
   cases r <;> cases s <;> simp [Nat.choose_succ_succ,Nat.add_assoc]
 | succ n ih =>
   cases r with
   | zero =>
     simp only [Nat.choose_zero_right,one_mul,Nat.zero_add]
     have h := sum_range_reflect (fun t => t.choose s) (n+1+1)
     simpa using h.trans (hockeyM6E1 (n+1) s)
   | succ r =>
     rw [sum_range_succ']
     simp only [Nat.choose_zero_succ,zero_mul,add_zero]
     have he : (∑ t ∈ range (n+1), (t+1).choose (r+1)*(n+1-(t+1)).choose s)=
       (∑ t ∈ range (n+1), t.choose r*(n-t).choose s)+
       (∑ t ∈ range (n+1), t.choose (r+1)*(n-t).choose s) := by
       simp_rw [Nat.add_sub_add_right,Nat.choose_succ_succ,add_mul,sum_add_distrib]
     rw [he,ih,ih]
     convert (Nat.choose_succ_succ' (n+1) (r+s+1)).symm using 1 <;>
       congr 2 <;> omega

theorem choose_productM6E1 (t l b : ℕ) :
 (t+l).choose l*t.choose b=(t+l).choose (l+b)*(l+b).choose l := by
 have h := Nat.choose_mul (n:=t+l) (k:=l+b) (s:=l) (by omega)
 simpa using h.symm

theorem shifted_binconvM6E1 (n l b r s : ℕ) (hl : l ≤ r) (hb : b ≤ s) :
 (∑ t ∈ range (n+1), (t+l).choose r*(n-t+b).choose s)=
 (n+l+b+1).choose (r+s+1) := by
 let f := fun t : ℕ => t.choose r*(n+l+b-t).choose s
 have hfull := binconvM6E1 (n+l+b) r s
 change (∑ t ∈ range (n+l+b+1), f t)=_ at hfull
 have hn : n+l+b+1=l+(n+1)+b := by omega
 rw [hn,sum_range_add,sum_range_add] at hfull
 have hzero : (∑ t ∈ range l, f t)=0 := by
   apply sum_eq_zero
   intro t ht
   dsimp [f]
   rw [Nat.choose_eq_zero_of_lt (by have := mem_range.mp ht; omega),zero_mul]
 have htail : (∑ t ∈ range b, f (l+(n+1)+t))=0 := by
   apply sum_eq_zero
   intro t ht
   dsimp [f]
   rw [Nat.choose_eq_zero_of_lt (by have := mem_range.mp ht; omega : n+l+b-(l+(n+1)+t)<s),mul_zero]
 rw [hzero,htail,zero_add,add_zero] at hfull
 rw [←hfull]
 apply sum_congr rfl
 intro t ht
 dsimp [f]
 have ht' := mem_range.mp ht
 congr 2 <;> omega

end
end MathGKM.Markov
