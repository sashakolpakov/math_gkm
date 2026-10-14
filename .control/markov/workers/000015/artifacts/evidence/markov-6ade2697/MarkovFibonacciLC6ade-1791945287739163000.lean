import MarkovFibonacciFormula6ade
import MarkovBinomialLC6ade
import MarkovReduction18

/-! Machine-authored request 6ade2697. All three raw inequalities for the
entire numerator-one source subfamily. This does not resolve Conjecture63. -/
namespace MathGKM.Markov
noncomputable section

theorem fib_coeff_at6 (n i j k : ℕ) (h : i+1+j+k=n) :
    coeff (fib6 n) (i+1) j=
      ((i+k).choose i : ℤ)*((i+1+j).choose j : ℤ) := by
  subst n; exact fib_formula6 i j k

theorem fib_coeff_sym6 (n i j k : ℕ) (h : i+1+j+k=n) :
    coeff (fib6 n) (i+1) j=
      ((i+k).choose k : ℤ)*((i+1+j).choose (i+1) : ℤ) := by
  rw [fib_coeff_at6 n i j k h,Nat.choose_symm_add,
    ← Nat.choose_symm_add (a:=i+1) (b:=j)]

theorem fib_horizontal6 (i j k : ℕ) :
    coeff (fib6 (i+3+j+k)) (i+1) j*coeff (fib6 (i+3+j+k)) (i+3) j ≤
      coeff (fib6 (i+3+j+k)) (i+2) j^2 := by
  rw [fib_coeff_at6 _ i j (k+2) (by omega),
    fib_coeff_at6 _ (i+2) j k (by omega),
    fib_coeff_at6 _ (i+1) j (k+1) (by omega)]
  have h := lc_product6
    ((i+k+2).choose i) ((i+k+2).choose (i+1)) ((i+k+2).choose (i+2))
    ((i+j+1).choose j) ((i+j+2).choose j) ((i+j+3).choose j)
    (by positivity) (by positivity) (by positivity)
    (choose_raw_lc1998 _ _) (by simpa [Nat.add_assoc] using choose_upper_lc6 (i+j+1) j)
  convert h using 1 <;> congr 2 <;> omega

theorem fib_vertical6 (i j k : ℕ) :
    coeff (fib6 (i+3+j+k)) (i+1) j*coeff (fib6 (i+3+j+k)) (i+1) (j+2) ≤
      coeff (fib6 (i+3+j+k)) (i+1) (j+1)^2 := by
  rw [fib_coeff_at6 _ i j (k+2) (by omega),
    fib_coeff_at6 _ i (j+2) k (by omega),
    fib_coeff_at6 _ i (j+1) (k+1) (by omega)]
  rw [← Nat.choose_symm_add (a:=i+1) (b:=j),
    ← Nat.choose_symm_add (a:=i+1) (b:=j+2),
    ← Nat.choose_symm_add (a:=i+1) (b:=j+1)]
  have h := lc_product6
    ((i+k+2).choose i) ((i+k+1).choose i) ((i+k).choose i)
    ((i+j+1).choose (i+1)) ((i+j+2).choose (i+1)) ((i+j+3).choose (i+1))
    (by positivity) (by positivity) (by positivity)
    (by simpa [mul_comm] using choose_upper_lc6 (i+k) i)
    (by simpa [Nat.add_assoc] using choose_upper_lc6 (i+j+1) (i+1))
  convert h using 1 <;> congr 2 <;> omega

theorem fib_diagonal6 (i j k : ℕ) :
    coeff (fib6 (i+3+j+k)) (i+1) (j+2)*coeff (fib6 (i+3+j+k)) (i+3) j ≤
      coeff (fib6 (i+3+j+k)) (i+2) (j+1)^2 := by
  rw [fib_coeff_sym6 _ i (j+2) k (by omega),
    fib_coeff_sym6 _ (i+2) j k (by omega),
    fib_coeff_sym6 _ (i+1) (j+1) k (by omega)]
  have h := lc_product6
    ((i+k).choose k) ((i+k+1).choose k) ((i+k+2).choose k)
    ((i+j+3).choose (i+1)) ((i+j+3).choose (i+2)) ((i+j+3).choose (i+3))
    (by positivity) (by positivity) (by positivity)
    (choose_upper_lc6 _ _) (by simpa [Nat.add_assoc] using choose_raw_lc1998 (i+j+3) (i+1))
  convert h using 1 <;> congr 2 <;> omega

theorem fib_weakLC6 (b : ℕ) : WeakLC 1 b (fib6 b) := by
  constructor
  · intro i j h0 h1 h2
    have hi : 0<i := by
      unfold InPolygon at h0 h2
      by_contra h; have : i=0 := by omega
      simp [this] at h0 h2; omega
    obtain ⟨r,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : i≠0)
    have ht : r+3+j≤b := by unfold InPolygon at h2; omega
    obtain ⟨k,hk⟩ : ∃ k, b=r+3+j+k := ⟨b-(r+3+j),by omega⟩
    subst b; exact fib_horizontal6 r j k
  constructor
  · intro i j h0 h1 h2
    have hi : 0<i := by
      unfold InPolygon at h0 h2
      by_contra h; have : i=0 := by omega
      simp [this] at h0 h2; omega
    obtain ⟨r,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : i≠0)
    have ht : r+3+j≤b := by unfold InPolygon at h2; omega
    obtain ⟨k,hk⟩ : ∃ k, b=r+3+j+k := ⟨b-(r+3+j),by omega⟩
    subst b; exact fib_vertical6 r j k
  · intro i j h0 h1 h2
    cases i with
    | zero =>
      have hb : b=j+2 := by unfold InPolygon at h0; simp at h0; omega
      subst b
      have htop (r s : ℕ) (h : r+s=j+2) :
          coeff (fib6 (j+2)) r s=((j+2).choose r : ℤ) := by
        rw [← h]; exact fib_top6 r s
      rw [htop 0 (j+2) (by omega),htop 2 j (by omega),htop 1 (j+1) (by omega)]
      exact choose_raw_lc1998 _ 0
    | succ r =>
      have ht : r+3+j≤b := by unfold InPolygon at h2; omega
      obtain ⟨k,hk⟩ : ∃ k, b=r+3+j+k := ⟨b-(r+3+j),by omega⟩
      subst b; exact fib_diagonal6 r j k

theorem source_one_weakLC6 (path : List Bool) (ha : (frame path).mid.a=1) :
    WeakLC (frame path).mid.a (frame path).mid.b (frame path).mid.p := by
  obtain ⟨n,rfl⟩ := source_one_spine274 path ha
  rw [left_spine_a274,spine_b6,source_fib6]
  exact fib_weakLC6 _

#print axioms fib_horizontal6
#print axioms fib_vertical6
#print axioms fib_diagonal6
#print axioms source_one_weakLC6
end
end MathGKM.Markov
