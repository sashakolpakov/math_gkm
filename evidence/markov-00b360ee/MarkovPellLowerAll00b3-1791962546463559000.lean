import MarkovPellHorizontalSum9a72
/-! Machine-authored request 00b360ee. Exact positive lower-excess coefficients
with all boundary coordinates retained. No log-concavity conclusion. -/
namespace MathGKM.Markov
noncomputable section

theorem sum_range_agree00b3 (f : ℕ → ℤ) (m n : ℕ)
 (hm : ∀ k, m ≤ k → f k=0) (hn : ∀ k, n ≤ k → f k=0) :
 (∑ k ∈ Finset.range m, f k) = ∑ k ∈ Finset.range n, f k := by
 have ext (a : ℕ) (ha : a ≤ m+n) (hz : ∀ k, a ≤ k → f k=0) :
     (∑ k ∈ Finset.range a, f k) = ∑ k ∈ Finset.range (m+n), f k := by
   apply Finset.sum_subset (Finset.range_mono ha)
   intro k _ hk
   exact hz k (by simpa using hk)
 exact (ext m (by omega) hm).trans (ext n (by omega) hn).symm

def lowerTerm00b3 (s i j k : ℕ) : ℤ :=
 if k ≤ j then
   ((i+k-(s+1)).choose (s+1) : ℤ)*((s+j-k).choose s : ℤ)*
     ((2*s+2).choose k : ℤ)
 else 0

def lowerCoeff00b3 (s i j : ℕ) : ℤ :=
 ∑ k ∈ Finset.range (2*s+3), lowerTerm00b3 s i j k

theorem right_lower_all00b3 (n i j s : ℕ)
 (hs : s ≤ n) (hij : i+j=n+s+2) :
 coeff (frame (List.replicate n true)).mid.p i j=lowerCoeff00b3 s i j := by
 rw [right_horizontal_sum_fixed9a72 n i j s hs hij]
 have hr : (∑ q ∈ Finset.range (n+2), horizontalTerm9a72 (n+1) j q s) =
     ∑ q ∈ Finset.range (j+1), horizontalTerm9a72 (n+1) j q s := by
   apply sum_range_agree00b3
   · intro q hq
     have hz : n+1-q=0 := by omega
     simp [horizontalTerm9a72,hz]
   · intro q hq
     simp [horizontalTerm9a72,show ¬ q ≤ j by omega]
 rw [hr,← Finset.sum_range_reflect _ (j+1)]
 have he : (∑ k ∈ Finset.range (j+1), horizontalTerm9a72 (n+1) j (j+1-1-k) s) =
     ∑ k ∈ Finset.range (j+1), lowerTerm00b3 s i j k := by
   apply Finset.sum_congr rfl
   intro k hk
   have hkj : k ≤ j := by have := Finset.mem_range.mp hk; omega
   have e0 : j+1-1-k=j-k := by omega
   have e1 : n+1-(j-k)=i+k-(s+1) := by omega
   have e2 : s+(j-k)=s+j-k := by omega
   have e3 : j-(j-k)=k := by omega
   simp only [e0,horizontalTerm9a72,lowerTerm00b3,if_pos hkj,
     if_pos (show j-k ≤ j by omega),e1,e2,e3]
   rw [← Nat.choose_symm (show j-k ≤ s+j-k by omega)]
   rw [show s+j-k-(j-k)=s by omega]
 rw [he,lowerCoeff00b3]
 apply sum_range_agree00b3
 · intro k hk
   simp [lowerTerm00b3,show ¬ k ≤ j by omega]
 · intro k hk
   have hz : (2*s+2).choose k=0 := Nat.choose_eq_zero_of_lt (by omega)
   simp [lowerTerm00b3,hz]

theorem lowerCoeff_nonneg00b3 (s i j : ℕ) : 0 ≤ lowerCoeff00b3 s i j := by
 apply Finset.sum_nonneg
 intro k _
 unfold lowerTerm00b3
 split_ifs <;> positivity

#print axioms right_lower_all00b3
end
end MathGKM.Markov
