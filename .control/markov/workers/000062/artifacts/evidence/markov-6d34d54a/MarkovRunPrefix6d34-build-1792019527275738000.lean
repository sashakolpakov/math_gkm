import MarkovRunLayer6d34
import MarkovPellHorizontalSum9a72
import MarkovWindowFormula6d34
/-! Machine-authored 6d34. Literal repeated-B cut polynomial coefficients,
including indices beyond the degree. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

theorem maskDegree_B_bound6d34 (m : List (Bool × Bool))
    (h : ∀ rb ∈ m,rb.1=true) (d : ℕ) :
    maskDegree07a7 d m≤d+m.length+(m.map Prod.snd).count true-1 := by
  induction m generalizing d with
  | nil => simp [maskDegree07a7]
  | cons rb rs ih =>
    obtain ⟨r,b⟩ := rb
    have hr : r=true := h (r,b) (by simp)
    subst r
    have ht : ∀ rb ∈ rs,rb.1=true := by intro rb hb; exact h rb (by simp [hb])
    have h1 := ih ht 1
    have hd := ih ht (d+1)
    cases b <;> simp only [maskDegree07a7,if_true,if_false,Bool.false_eq_true,
      List.length_cons,List.map_cons,List.count_cons] <;> simp at * <;> omega

theorem cut_run_degree6d34 (n s j : ℕ) (hj : n+s<j) :
    (cutCoeffA27 (X:ℝ[X]) X 1 (List.replicate n true) s).coeff j=0 := by
  rw [←cutMasks_sumFe01,Polynomial.coeff_list_sum_map]
  apply List.sum_eq_zero
  intro c hc
  obtain ⟨m,hm,rfl⟩ := List.mem_map.mp hc
  obtain ⟨hw,hs⟩ := cutMasks_specFe01 _ _ _ hm
  have hl : m.length=n := by simpa using congrArg List.length hw
  have hb : ∀ rb ∈ m,rb.1=true := by
    intro rb hr
    have hh : rb.1 ∈ m.map Prod.fst := List.mem_map_of_mem hr
    rw [hw] at hh
    exact (List.mem_replicate.mp hh).2
  have hd := maskDegree_B_bound6d34 m hb 1
  rw [hl,hs] at hd
  apply Polynomial.coeff_eq_zero_of_natDegree_lt
  rw [mask_natDegree07a7]
  omega

theorem cut_run_raw6d34 (n s i j : ℕ) (hij : i+j=n+s+2) :
    (cutCoeffA27 (X:ℝ[X]) X 1 (List.replicate (n+1) true) (s+1)).coeff j=
      (coeff (frame (List.replicate n true)).mid.p i j : ℝ) := by
  have h := sourceTerms_coeffFe01 (List.replicate n true) i j (s+1)
    (by rw [(right_labels650 n).1]; omega)
  simpa only [sourceTermsFe01,central_right0618,←List.replicate_succ',
    cutMasks_sumFe01] using h.symm

def runPrefixPoly6d34 (n s : ℕ) : ℝ[X] :=
  (1+X)^(2*s+2)*∑ q ∈ range (n+2),
    monomial q (((n+1-q).choose (s+1) : ℝ)*((s+q).choose q : ℝ))

theorem runPrefix_coeff6d34 (n s j : ℕ) :
    (runPrefixPoly6d34 n s).coeff j=
      ∑ q ∈ range (n+2),(horizontalTerm9a72 (n+1) j q s : ℝ) := by
  unfold runPrefixPoly6d34
  rw [Finset.mul_sum,Polynomial.finsetSum_coeff]
  apply sum_congr rfl
  intro q hq
  rw [←Polynomial.C_mul_X_pow_eq_monomial,←mul_assoc,Polynomial.coeff_mul_X_pow']
  by_cases hj : q≤j
  · simp [hj,Polynomial.coeff_mul_C,Polynomial.coeff_one_add_X_pow,
      horizontalTerm9a72]
    ring
  · simp [hj,horizontalTerm9a72]

theorem runPrefix_exact6d34 (n s : ℕ) (hs : s≤n) :
    cutCoeffA27 (X:ℝ[X]) X 1 (List.replicate (n+1) true) (s+1)=
      runPrefixPoly6d34 n s := by
  ext j
  rw [runPrefix_coeff6d34]
  by_cases hj : j≤n+s+2
  · rw [cut_run_raw6d34 n s (n+s+2-j) j (by omega),
      right_horizontal_sum_fixed9a72 n _ j s hs (by omega)]
    simp
  · rw [cut_run_degree6d34 _ _ j (by omega)]
    symm
    apply sum_eq_zero
    intro q hq
    by_cases hqs : n+1-q<s+1
    · simp [horizontalTerm9a72,Nat.choose_eq_zero_of_lt hqs]
    · have hqj : q≤j := by omega
      have hjq : 2*s+2<j-q := by omega
      simp [horizontalTerm9a72,hqj,Nat.choose_eq_zero_of_lt hjq]

#print axioms runPrefix_exact6d34
end
end MathGKM.Markov
