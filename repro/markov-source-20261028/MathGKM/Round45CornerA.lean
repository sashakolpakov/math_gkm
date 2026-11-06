import MathGKM.Round45CapacityA
import MathGKM.Round42CornerA
import MathGKM.Round44TransportA

/-! Machine-authored round45. The corner is a partition case only, and does
not discharge the positive-layer applicability obligation. -/
namespace DistanceTwoR45
open MathGKM.Markov
open scoped BigOperators
noncomputable section

theorem monomial_indicator (s a : ℕ) (x : ℤ) :
    Polynomial.monomial s (if s=a then x else 0) =
      if s=a then Polynomial.monomial a x else 0 := by
  split_ifs with h
  · subst s; rfl
  · simp

theorem corner_groups (n l : ℕ) (hn : 4 ≤ n) :
    GroupedR40.group n n 0 0 1 l =
      (if l=2*n-4 then ((n-1:ℕ):ℤ)^2-3*((n-2).choose 2 : ℤ) else 0) +
      (if l=2*n-3 then 4*(n:ℤ)*((n-1:ℕ):ℤ)-8*((n-1).choose 2 : ℤ) else 0) +
      (if l=2*n-2 then 4*(n:ℤ)^2-6*(n.choose 2 : ℤ) else 0) := by
  have w0 (s : ℕ) := (CornerR42.weights n s hn).1
  have w1 (s : ℕ) : MidpointR36.W n n 1 s =
      (if s=n-2 then ((n-1:ℕ):ℤ) else 0) +
      (if s=n-1 then 2*(n:ℤ) else 0) := by
    rw [(CornerR42.weights n s hn).2.1]
    split_ifs <;> first | omega | ring
  have w2 (s : ℕ) : MidpointR36.W n n 2 s =
      (if s=n-4 then 3*((n-2).choose 2 : ℤ) else 0) +
      (if s=n-3 then 8*((n-1).choose 2 : ℤ) else 0) +
      (if s=n-2 then 6*(n.choose 2 : ℤ) else 0) := by
    rw [(CornerR42.weights n s hn).2.2]
    split_ifs <;> first | omega | ring
  have p0 : GroupedR40.encode n (MidpointR36.W n n 0) = Polynomial.monomial n (1:ℤ) := by
    unfold GroupedR40.encode
    simp_rw [w0]
    simp [apply_ite]
  have p1 : GroupedR40.encode n (MidpointR36.W n n 1) =
      Polynomial.monomial (n-2) ((n-1:ℕ):ℤ) + Polynomial.monomial (n-1) (2*(n:ℤ)) := by
    unfold GroupedR40.encode
    simp_rw [w1,map_add]
    simp_rw [monomial_indicator]
    simp [Finset.sum_add_distrib,
      show n-2<n+1 by omega,show n-1<n+1 by omega]
  have p2 : GroupedR40.encode n (MidpointR36.W n n 2) =
      Polynomial.monomial (n-4) (3*((n-2).choose 2 : ℤ)) +
      Polynomial.monomial (n-3) (8*((n-1).choose 2 : ℤ)) +
      Polynomial.monomial (n-2) (6*(n.choose 2 : ℤ)) := by
    unfold GroupedR40.encode
    simp_rw [w2,map_add]
    simp_rw [monomial_indicator]
    simp [Finset.sum_add_distrib,
      show n-4<n+1 by omega,show n-3<n+1 by omega,show n-2<n+1 by omega]
  have hg := GroupedR40.grouped_coeff n (MidpointR36.W n n 0)
    (MidpointR36.W n n 1) (MidpointR36.W n n 2) l
  change _ = GroupedR40.group n n 0 0 1 l at hg
  rw [←hg,p0,p1,p2]
  simp [GroupedR40.Defect,pow_two,add_mul,mul_add,Polynomial.monomial_mul_monomial,
    show n-2+(n-2)=2*n-4 by omega,
    show n-2+(n-1)=2*n-3 by omega,
    show n-1+(n-2)=2*n-3 by omega,
    show n-1+(n-1)=2*n-2 by omega,
    show n+(n-4)=2*n-4 by omega,
    show n+(n-3)=2*n-3 by omega,
    show n+(n-2)=2*n-2 by omega,Polynomial.coeff_add,Polynomial.coeff_sub,Polynomial.coeff_monomial,Nat.mul_comm,eq_comm]
  split_ifs <;> ring

theorem corner_capacity_large (n : ℕ) (hn : 4 ≤ n) :
    DistanceTwoR44.Capacity (2*n) (GroupedR40.group n n 0 0 1) := by
  intro l hl he
  have c0 := CornerR42.choose2 n (by omega)
  have c1 := CornerR42.choose2 (n-1) (by omega)
  have c2 := CornerR42.choose2 (n-2) (by omega)
  have nz : (4:ℤ) ≤ n := by exact_mod_cast hn
  push_cast [Nat.cast_sub (show 1 ≤ n by omega),Nat.cast_sub (show 2 ≤ n by omega)] at c0 c1 c2
  have g := corner_groups n l hn
  by_cases h4 : l=2*n-4
  · subst l
    refine ⟨by omega,?_⟩
    have h2 : 2*n-4+2=2*n-2 := by omega
    rw [h2,corner_groups n (2*n-2) hn]
    simp only [ite_true,if_pos rfl,if_neg (show ¬2*n-2=2*n-4 by omega),
      if_neg (show ¬2*n-2=2*n-3 by omega),zero_add]
    rw [corner_groups n (2*n-4) hn]
    simp only [ite_true,if_pos rfl,if_neg (show ¬2*n-4=2*n-3 by omega),
      if_neg (show ¬2*n-4=2*n-2 by omega),add_zero]
    push_cast [Nat.cast_sub (show 1 ≤ n by omega)]
    nlinarith [sq_nonneg (n:ℤ)]
  · by_cases h3 : l=2*n-3
    · subst l
      rw [corner_groups n (2*n-3) hn] at he
      simp only [ite_true,if_pos rfl,if_neg (show ¬2*n-3=2*n-4 by omega),
        if_neg (show ¬2*n-3=2*n-2 by omega),zero_add,add_zero] at he
      push_cast [Nat.cast_sub (show 1 ≤ n by omega)] at he
      nlinarith
    · by_cases h2 : l=2*n-2
      · subst l
        rw [corner_groups n (2*n-2) hn] at he
        simp only [ite_true,if_pos rfl,if_neg (show ¬2*n-2=2*n-4 by omega),
          if_neg (show ¬2*n-2=2*n-3 by omega),zero_add] at he
        nlinarith [sq_nonneg (n:ℤ)]
      · simp [h4,h3,h2] at g
        omega

theorem corner_capacity (n : ℕ) (hn : 1 ≤ n) :
    DistanceTwoR44.Capacity (2*n) (GroupedR40.group n n 0 0 1) := by
  by_cases h4 : 4 ≤ n
  · exact corner_capacity_large n h4
  have hc : n=1 ∨ n=2 ∨ n=3 := by omega
  rcases hc with rfl | rfl | rfl <;>
    intro l hl he <;> interval_cases l <;>
    norm_num [GroupedR40.group,MidpointR36.W,RenewalR28.mc,
      Finset.sum_range_succ,Nat.choose] at he

end
end DistanceTwoR45
#print axioms DistanceTwoR45.corner_capacity_large

#print axioms DistanceTwoR45.corner_capacity
