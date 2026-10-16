import MathGKM.Markov
/-! Machine-authored request 6e1369de. Finite binomial identities for central rows. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 2000000

theorem hockeyM6E1 (n k : ℕ) :
 (∑ t ∈ range (n+1), t.choose k)=(n+1).choose (k+1) := by
 induction n with
 | zero => cases k <;> simp
 | succ n ih =>
   rw [sum_range_succ,ih]
   exact (Nat.choose_succ_succ' (n+1) k).symm

theorem binconvM6E1 (n r s : ℕ) :
 (∑ t ∈ range (n+1), t.choose r*(n-t).choose s)=(n+1).choose (r+s+1) := by
 induction n generalizing r s with
 | zero =>
   cases r <;> cases s <;> simp
 | succ n ih =>
   cases r with
   | zero =>
     simp only [Nat.choose_zero_right,one_mul,Nat.zero_add]
     rw [← sum_range_reflect (fun t => t.choose s) (n+1+1)]
     simpa using hockeyM6E1 (n+1) s
   | succ r =>
     rw [sum_range_succ']
     simp only [Nat.choose_zero_succ,zero_mul,add_zero]
     have he : (∑ t ∈ range (n+1), (t+1).choose (r+1)*(n+1-(t+1)).choose s)=
       (∑ t ∈ range (n+1), t.choose r*(n-t).choose s)+
       (∑ t ∈ range (n+1), t.choose (r+1)*(n-t).choose s) := by
       simp_rw [Nat.add_sub_add_right,Nat.choose_succ_succ,add_mul,sum_add_distrib]
     rw [he,ih,ih]
     simpa [Nat.add_assoc] using (Nat.choose_succ_succ' (n+1) (r+s+1)).symm

theorem choose_productM6E1 (t l b : ℕ) :
 (t+l).choose l*t.choose b=(t+l).choose (l+b)*(l+b).choose l := by
 have h := Nat.choose_mul (n:=t+l) (k:=l+b) (s:=l) (by omega)
 simpa using h.symm

end
end MathGKM.Markov
