import MathGKM.Round104CornerA
import MathGKM.Round100CornerModelA

/- Machine-authored r106. Universal actual corner-defect correspondence.
The color-two identity uses the retained raw corner equality and zero tail.
Ordered transport additionally uses the earlier raw corner sign through r104.
No noncorner or arbitrary-path claim is made here. -/
namespace ActualCornerR106
open Polynomial MatchingProjectionR64 NeighborSupportR100 OrderedCornerR104
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 1800000

theorem coefficient_monomial (N sigma i j a b : ℕ) (hd : i+j+a+b=N) :
    (B N sigma i j).coeff a = C (((B N sigma i j).coeff a).coeff b)*X^b := by
  ext k
  rw [coeff_C_mul_X_pow]
  by_cases hk : k=b
  · subst k; simp
  · rw [if_neg hk]
    by_contra hn
    have := NeighborSupportR100.coefficient_degree N sigma i j a k hn
    omega

theorem choose_pred (n : ℕ) (hn : 1≤n) : n.choose (n-1)=n := by
  rw [← Nat.choose_symm (show n-1≤n by omega)]
  simpa [Nat.sub_sub_self hn] using Nat.choose_one_right n

theorem choose_two (n : ℕ) (hn : 2≤n) : n.choose (n-2)=n.choose 2 := by
  rw [← Nat.choose_symm (show n-2≤n by omega),Nat.sub_sub_self hn]

theorem low_rows (n : ℕ) (hn : 4≤n) :
    (B (2*n) 1 0 n).coeff 0=X^n ∧
    (B (2*n) 1 1 n).coeff 0=C (2*(n:ℤ))*X^(n-1) ∧
    (B (2*n) 1 2 n).coeff 0=C (6*(n.choose 2:ℤ))*X^(n-2) ∧
    (B (2*n) 1 0 n).coeff 1=0 ∧
    (B (2*n) 1 1 n).coeff 1=C ((n:ℤ)-1)*X^(n-2) ∧
    (B (2*n) 1 2 n).coeff 1=C (4*((n:ℤ)-1)*((n:ℤ)-2))*X^(n-3) := by
  have hz (i b : ℕ) : ((B (2*n) 1 i n).coeff 0).coeff b =
      SparseRankR89.count 0 n i n b := by
    simpa [SparseRankR89.isolated,SparseRankR89.cells] using
      SparseRankR89.zero_count n 1 i n b (by omega)
  have ho (i b : ℕ) : ((B (2*n) 1 i n).coeff 1).coeff b =
      ((n:ℤ)-1)*SparseCoupledR90.shifted 2 (n-2) i n b := by
    have h := SparseCoupledR90.one_count_one (n-2) i n b
    rw [show 2*(n-2)+4=2*n by omega] at h
    convert h using 1 <;> push_cast [Nat.cast_sub (show 2≤n by omega)] <;> ring
  have hb1 : n-1≤n := by omega
  have hb2 : n-2≤n := by omega
  have hb3 : n-3≤n-2 := by omega
  have hsub1 : n-(n-1)=1 := by omega
  have hsub2 : n-(n-2)=2 := by omega
  have hsub3 : (n-2)-(n-3)=1 := by omega
  refine ⟨?_,?_,?_,?_,?_,?_⟩
  · rw [coefficient_monomial (2*n) 1 0 n 0 n (by omega),hz]
    simp [SparseRankR89.count,show n+n=2*n by omega]
  · rw [coefficient_monomial (2*n) 1 1 n 0 (n-1) (by omega),hz]
    simp [SparseRankR89.count,hb1,hsub1,choose_pred n (by omega),
      show 1+n+(n-1)=2*n by omega]
    ring
  · rw [coefficient_monomial (2*n) 1 2 n 0 (n-2) (by omega),hz]
    norm_num [SparseRankR89.count,hb2,hsub2,choose_two n (by omega),
      show 2+n+(n-2)=2*n by omega,show Nat.choose 4 2=6 by decide]
    ring
  · rw [coefficient_monomial (2*n) 1 0 n 1 (n-1) (by omega),ho]
    simp [SparseCoupledR90.shifted]
  · rw [coefficient_monomial (2*n) 1 1 n 1 (n-2) (by omega),ho]
    simp [SparseCoupledR90.shifted,SparseRankR89.count,hb2,
      show n+(n-2)=2+2*(n-2) by omega]
  · rw [coefficient_monomial (2*n) 1 2 n 1 (n-3) (by omega),ho]
    have hc : (n-2).choose (n-3)=n-2 := by
      convert choose_pred (n-2) (by omega) using 1 <;> congr 1 <;> omega
    simp [SparseCoupledR90.shifted,SparseRankR89.count,hb3,hsub3,hc,
      show n-3≤n by omega,show 1+n+(n-3)=2+2*(n-2) by omega,
      Nat.cast_sub (show 2≤n by omega)]
    ring

theorem mul_cpow (x y : ℤ) (a b : ℕ) :
    (C x*X^a)*(C y*X^b) = C (x*y)*X^(a+b) := by
  calc
    _ = (C x*C y)*(X^a*X^b) := by ring
    _ = _ := by rw [← map_mul,← pow_add]

theorem low_defect (n : ℕ) (hn : 4≤n) :
    (defect (2*n) 1 0 n).coeff 0=C ((n:ℤ)*((n:ℤ)+3))*X^(2*n-2) ∧
    (defect (2*n) 1 0 n).coeff 1=C (8*((n:ℤ)-1))*X^(2*n-3) := by
  rcases low_rows n hn with ⟨h00,h10,h20,h01,h11,h21⟩
  have hc := CornerR42.choose2 n (by omega)
  constructor
  · simp only [defect,pow_two,coeff_sub,mul_coeff_zero]
    rw [h00,h10,h20]
    conv_lhs => lhs; rw [mul_cpow]
    rw [show X^n*(C (6*(n.choose 2:ℤ))*X^(n-2)) =
      C (6*(n.choose 2:ℤ))*X^(n+(n-2)) by
        simpa using mul_cpow 1 (6*(n.choose 2:ℤ)) n (n-2)]
    rw [show n-1+(n-1)=2*n-2 by omega,show n+(n-2)=2*n-2 by omega,
      ← sub_mul,← map_sub]
    congr 2
    nlinarith
  · simp only [defect,pow_two,coeff_sub,mul_coeff_one]
    rw [h00,h10,h20,h01,h11,h21]
    simp only [zero_mul,mul_zero,add_zero,zero_add]
    rw [mul_cpow,mul_cpow,
      show X^n*(C (4*((n:ℤ)-1)*((n:ℤ)-2))*X^(n-3)) =
        C (4*((n:ℤ)-1)*((n:ℤ)-2))*X^(n+(n-3)) by
          simpa using mul_cpow 1 (4*((n:ℤ)-1)*((n:ℤ)-2)) n (n-3)]
    rw [show n-1+(n-2)=2*n-3 by omega,show n-2+(n-1)=2*n-3 by omega,
      show n+(n-3)=2*n-3 by omega]
    rw [← add_mul,← sub_mul,← map_add,← map_sub]
    congr 2
    ring

def d (n a : ℕ) : ℤ := pooledDelta (2*n) 1 n 0 (2*n-2) a

theorem d_zero (n : ℕ) (hn : 4≤n) : d n 0=(n:ℤ)*((n:ℤ)+3) := by
  have h := defect_coeff (2*n) 1 n 0 0 (2*n-2)
  change ((defect (2*n) 1 0 n).coeff 0).coeff (2*n-2)=d n 0 at h
  rw [(low_defect n hn).1] at h
  rw [coeff_C_mul_X_pow,if_pos rfl] at h
  exact h.symm

theorem d_one (n : ℕ) (hn : 4≤n) : d n 1=8*((n:ℤ)-1) := by
  have h := defect_coeff (2*n) 1 n 0 1 (2*n-2-1)
  have he : 2*n-2-1=2*n-3 := by omega
  change ((defect (2*n) 1 0 n).coeff 1).coeff (2*n-2-1)=d n 1 at h
  rw [he] at h
  rw [(low_defect n hn).2] at h
  rw [coeff_C_mul_X_pow,if_pos rfl] at h
  exact h.symm

theorem d_tail (n a : ℕ) (ha : 2<a) : d n a=0 := corner_tail n (2*n-2) a ha

theorem d_total (n : ℕ) (hn : 4≤n) :
    2*(∑ a ∈ Finset.range (2*n-2+1), d n a)=(n:ℤ)^2+33*(n:ℤ)-32 := by
  have h := (NeighborOriginalR100.original_margins n n 0 (2*n-2) (by omega) (by omega)).2
  have hm := (Accepteda9625695d66c9988d543ca6d.obligation n (by omega)).2.2.2.1
  change (∑ a ∈ Finset.range (2*n-2+1), d n a)=_ at h
  rw [h]
  exact hm

theorem d_two (n : ℕ) (hn : 4≤n) : 2*d n 2= -(n:ℤ)^2+11*(n:ℤ)-16 := by
  have he : (∑ a ∈ Finset.range 3, d n a) =
      ∑ a ∈ Finset.range (2*n-2+1), d n a := by
    apply Finset.sum_subset (Finset.range_mono (by omega))
    intro a _ ha
    apply d_tail
    have : ¬a<3 := by simpa using ha
    omega
  have ht := d_total n hn
  rw [← he] at ht
  simp only [Finset.sum_range_succ,Finset.sum_range_zero,zero_add] at ht
  rw [d_zero n hn,d_one n hn] at ht
  nlinarith

def Correspondence : Prop := ∀ n : ℕ, 4≤n →
    d n 0=(n:ℤ)*((n:ℤ)+3) ∧ d n 1=8*((n:ℤ)-1) ∧
    2*d n 2= -(n:ℤ)^2+11*(n:ℤ)-16 ∧ (∀ a, 2<a → d n a=0) ∧
    2*(∑ a ∈ Finset.range (2*n-2+1), d n a)=(n:ℤ)^2+33*(n:ℤ)-32

theorem correspondence : Correspondence := by
  intro n hn
  exact ⟨d_zero n hn,d_one n hn,d_two n hn,fun a ha => d_tail n a ha,d_total n hn⟩

theorem no_local_flow (n : ℕ) (hn : 26≤n) :
    ¬∃ T, NeighborFlowR100.Feasible (2*n-2) (d n) T := by
  rintro ⟨T,hT⟩
  have h := NeighborFlowR100.corner_model_necessary (n:ℤ) (2*n-2) (d n) T
    (by exact_mod_cast (show 2≤n by omega)) (by omega) hT
    (d_one n (by omega)) (d_two n (by omega)) (d_tail n 3 (by omega))
  have hz : (26:ℤ)≤n := by exact_mod_cast hn
  nlinarith [sq_nonneg ((n:ℤ)-26)]

theorem ordered_flow (n : ℕ) (hn : 2≤n) :
    ∃ T, OrderedCompensationR104.Feasible (2*n-2) (d n) T := by
  exact (OrderedCompensationR104.prefix_iff_transport _ _).mp (corner_prefix n hn)

def Separator : Prop := ∀ n : ℕ, 26≤n →
    (∃ T, OrderedCompensationR104.Feasible (2*n-2) (d n) T) ∧
    (¬∃ T, NeighborFlowR100.Feasible (2*n-2) (d n) T)

theorem separator : Separator := by
  intro n hn
  exact ⟨ordered_flow n (by omega),no_local_flow n hn⟩

end
end ActualCornerR106
#print axioms ActualCornerR106.correspondence
#print axioms ActualCornerR106.separator
