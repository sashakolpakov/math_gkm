import MathGKM.Round80RankA

/- Machine-authored r96. The committed complementary allocation blocks.
All statements are equalities or conditional comparisons; no Counting premise.
The beta sum includes every allocation, and Finset removes repeated alpha splits. -/
namespace ComplementaryAllocationR96
open Polynomial MatchingProjectionR64 FullFiberRankR80
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 2000000

def S (a c : ℕ) : Finset ℕ := {c,a-c}
def f (N sigma r j p q : ℕ) : ℤ := ((B N sigma r j).coeff p).coeff q
def allocation (N sigma j L a b p r : ℕ) : ℤ :=
  ∑ q ∈ Finset.range (b+1), f N sigma r j p q * f N sigma (L-r) j (a-p) (b-q)
def G (N sigma j L a b c r : ℕ) : ℤ :=
  if r≤L then ∑ p ∈ S a c, allocation N sigma j L a b p r else 0

theorem allocation_coeff (N sigma j L a b p r : ℕ) :
    allocation N sigma j L a b p r =
      (((B N sigma r j).coeff p * (B N sigma (L-r) j).coeff (a-p)).coeff b) := by
  rw [Polynomial.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  rfl

theorem alpha_partition (a : ℕ) (h : ℕ → ℤ) :
    (∑ c ∈ Finset.range (a/2+1), ∑ p ∈ S a c, h p) =
      ∑ p ∈ Finset.range (a+1), h p := by
  classical
  have hm : ∀ p ∈ Finset.range (a+1), min p (a-p) ∈ Finset.range (a/2+1) := by
    intro p hp
    simp only [Finset.mem_range] at *
    omega
  have hf : ∀ c ∈ Finset.range (a/2+1),
      (Finset.range (a+1)).filter (fun p => min p (a-p)=c) = S a c := by
    intro c hc
    simp only [Finset.mem_range] at hc
    ext p
    simp only [Finset.mem_filter,Finset.mem_range,S,Finset.mem_insert,Finset.mem_singleton]
    omega
  calc
    _ = ∑ c ∈ Finset.range (a/2+1),
        ∑ p ∈ (Finset.range (a+1)).filter (fun p => min p (a-p)=c), h p := by
      apply Finset.sum_congr rfl
      intro c hc
      rw [hf c hc]
    _ = _ := Finset.sum_fiberwise_of_maps_to hm h

theorem above (N sigma j L a b c r : ℕ) (hr : L<r) : G N sigma j L a b c r=0 := by
  simp [G,show ¬r≤L by omega]

theorem partition (N sigma j L a b r : ℕ) :
    (rankPoly N sigma j L a b).coeff r =
      ∑ c ∈ Finset.range (a/2+1), G N sigma j L a b c r := by
  classical
  by_cases hr : r≤L
  · simp only [G,if_pos hr]
    rw [alpha_partition,FullFiberRankR80.projected_coeff N sigma j L a b r hr]
    rw [Polynomial.coeff_mul,Polynomial.finsetSum_coeff,
      Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
    apply Finset.sum_congr rfl
    intro p hp
    exact (allocation_coeff N sigma j L a b p r).symm
  · rw [rank_coeff,card_above N sigma j L a b r (by omega)]
    simp [G,hr]

theorem allocation_reflection (N sigma j L a b p r : ℕ) (hr : r≤L) (hp : p≤a) :
    allocation N sigma j L a b p (L-r) = allocation N sigma j L a b (a-p) r := by
  rw [allocation_coeff,allocation_coeff,
    show L-(L-r)=r by omega,show a-(a-p)=p by omega,mul_comm]

theorem reflection (N sigma j L a b c r : ℕ) (hc : c≤a/2) (hr : r≤L) :
    G N sigma j L a b c (L-r)=G N sigma j L a b c r := by
  classical
  simp only [G,if_pos hr,if_pos (show L-r≤L by omega)]
  apply Finset.sum_bij (fun p _ => a-p)
  · intro p hp
    simp only [S,Finset.mem_insert,Finset.mem_singleton] at *
    omega
  · intro p hp q hq he
    simp only [S,Finset.mem_insert,Finset.mem_singleton] at hp hq
    omega
  · intro p hp
    refine ⟨a-p,?_,?_⟩
    · simp only [S,Finset.mem_insert,Finset.mem_singleton] at *
      omega
    · simp only [S,Finset.mem_insert,Finset.mem_singleton] at hp
      omega
  · intro p hp
    apply allocation_reflection N sigma j L a b p r hr
    simp only [S,Finset.mem_insert,Finset.mem_singleton] at hp
    omega

theorem conditional_central (N sigma j i a b : ℕ)
    (h : ∀ c, c≤a/2 → G N sigma j (2*i+2) a b c i ≤
      G N sigma j (2*i+2) a b c (i+1)) :
    (PairConvolutionR78.P N sigma j (2*i+2) a b i).card ≤
      (PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card := by
  have hh : (rankPoly N sigma j (2*i+2) a b).coeff i ≤
      (rankPoly N sigma j (2*i+2) a b).coeff (i+1) := by
    rw [partition,partition]
    apply Finset.sum_le_sum
    intro c hc
    exact h c (by simpa only [Finset.mem_range,Nat.lt_succ_iff] using hc)
  simp only [rank_coeff] at hh
  exact_mod_cast hh

theorem interface :
    (∀ N sigma j L a b r, (rankPoly N sigma j L a b).coeff r =
      ∑ c ∈ Finset.range (a/2+1), G N sigma j L a b c r) ∧
    (∀ N sigma j L a b c r, c≤a/2 → r≤L →
      G N sigma j L a b c (L-r)=G N sigma j L a b c r) ∧
    (∀ N sigma j L a b c r, L<r → G N sigma j L a b c r=0) :=
  ⟨partition,reflection,above⟩

end
end ComplementaryAllocationR96
#print axioms ComplementaryAllocationR96.interface
#print axioms ComplementaryAllocationR96.conditional_central
