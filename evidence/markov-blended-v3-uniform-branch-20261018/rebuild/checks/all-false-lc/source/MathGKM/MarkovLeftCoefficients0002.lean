import MathGKM.MarkovLeftCoefficientTargets0001

/-! Machine-authored round-0002 coefficient proof attempt. No new premises. -/
namespace MathGKM.Markov.LeftBranch0001
noncomputable section

theorem coeff_step_00 (n : ℕ) : coeff (Q (n+2)) 0 0 = coeff (Q (n+1)) 0 0 := by
  simp [Q, S, U, V, coeff, add_mul]

theorem coeff_step_0s (n j : ℕ) :
    coeff (Q (n+2)) 0 (j+1) = coeff (Q (n+1)) 0 j +
      coeff (Q (n+1)) 0 (j+1) - coeff (Q n) 0 j := by
  simp [Q, S, U, V, coeff, add_mul, Polynomial.coeff_X_mul]

theorem coeff_step_s0 (n i : ℕ) :
    coeff (Q (n+2)) (i+1) 0 = coeff (Q (n+1)) i 0 +
      coeff (Q (n+1)) (i+1) 0 := by
  simp [Q, S, U, V, coeff, add_mul, Polynomial.coeff_X_mul]

theorem coeff_step_ss (n i j : ℕ) :
    coeff (Q (n+2)) (i+1) (j+1) = coeff (Q (n+1)) i (j+1) +
      coeff (Q (n+1)) (i+1) j + coeff (Q (n+1)) (i+1) (j+1) -
      coeff (Q n) (i+1) j := by
  simp [Q, S, U, V, coeff, add_mul, Polynomial.coeff_X_mul]

theorem rawFormula_zero (n j : ℕ) : rawFormula n 0 j = if j = n then 1 else 0 := by
  simp [rawFormula]

theorem rawFormula_out (n i j : ℕ) (hi : 0 < i) (h : n < i+j) :
    rawFormula n i j = 0 := by
  simp [rawFormula, Nat.ne_of_gt hi, Nat.not_le.mpr h]

theorem rawFormula_in (n i j : ℕ) (hi : 0 < i) (h : i+j ≤ n) :
    rawFormula n i j = ((i+j).choose j : ℤ) * ((n-j-1).choose (i-1) : ℤ) := by
  simp [rawFormula, Nat.ne_of_gt hi, h]

theorem rawFormula_one (n j : ℕ) :
    rawFormula n 1 j = if j < n then (j+1 : ℕ) else 0 := by
  by_cases h : j < n
  · simp [rawFormula, show 1+j ≤ n by omega, h, Nat.add_comm,
      Nat.choose_succ_self_right]
  · simp [rawFormula, show ¬1+j ≤ n by omega, h]

theorem rawFormula_unrestricted (n i j : ℕ) (hi : 0 < i) (hj : j < n) :
    rawFormula n i j = ((i+j).choose j : ℤ) * ((n-j-1).choose (i-1) : ℤ) := by
  by_cases h : i+j ≤ n
  · exact rawFormula_in n i j hi h
  · rw [rawFormula_out n i j hi (by omega), Nat.choose_eq_zero_of_lt (show n-j-1 < i-1 by omega)]
    simp

theorem raw_step_00 (n : ℕ) : rawFormula (n+2) 0 0 = rawFormula (n+1) 0 0 := by
  simp [rawFormula]

theorem raw_step_0s (n j : ℕ) :
    rawFormula (n+2) 0 (j+1) = rawFormula (n+1) 0 j +
      rawFormula (n+1) 0 (j+1) - rawFormula n 0 j := by
  simp only [rawFormula_zero]
  split_ifs <;> omega

theorem raw_step_s0 (n i : ℕ) :
    rawFormula (n+2) (i+1) 0 = rawFormula (n+1) i 0 +
      rawFormula (n+1) (i+1) 0 := by
  cases i with
  | zero => simp [rawFormula_one, rawFormula_zero]
  | succ i =>
    rw [rawFormula_unrestricted _ _ _ (by omega) (by omega),
      rawFormula_unrestricted _ _ _ (by omega) (by omega),
      rawFormula_unrestricted _ _ _ (by omega) (by omega)]
    simp [Nat.choose_succ_succ, Nat.cast_add]

theorem raw_step_ss (n i j : ℕ) :
    rawFormula (n+2) (i+1) (j+1) = rawFormula (n+1) i (j+1) +
      rawFormula (n+1) (i+1) j + rawFormula (n+1) (i+1) (j+1) -
      rawFormula n (i+1) j := by
  cases i with
  | zero =>
    simp only [Nat.zero_add, rawFormula_one, rawFormula_zero]
    split_ifs <;> push_cast <;> omega
  | succ i =>
    by_cases hj : j < n
    · rw [rawFormula_unrestricted _ _ _ (by omega) (by omega),
        rawFormula_unrestricted _ _ _ (by omega) (by omega),
        rawFormula_unrestricted _ _ _ (by omega) (by omega),
        rawFormula_unrestricted _ _ _ (by omega) (by omega),
        rawFormula_unrestricted _ _ _ (by omega) hj]
      have h1 : n+2-(j+1)-1 = (n-j-1)+1 := by omega
      have h2 : n+1-(j+1)-1 = n-j-1 := by omega
      have h3 : n+1-j-1 = (n-j-1)+1 := by omega
      simp only [h1, h2, h3, Nat.succ_sub_one, Nat.add_sub_cancel]
      rw [Nat.choose_succ_succ' (n-j-1) i]
      have hc := Nat.choose_succ_succ' (i+1+j) j
      have he : i+1+1+(j+1) = (i+1+j)+1+1 := by omega
      have he' : i+1+(j+1) = (i+1+j)+1 := by omega
      simp only [he, he']
      rw [Nat.choose_succ_succ' ((i+1+j)+1) j]
      push_cast
      ring
    · rw [rawFormula_out _ _ _ (by omega) (by omega),
        rawFormula_out _ _ _ (by omega) (by omega),
        rawFormula_out _ _ _ (by omega) (by omega),
        rawFormula_out _ _ _ (by omega) (by omega),
        rawFormula_out _ _ _ (by omega) (by omega)]
      norm_num

theorem coefficient_bridge : CoefficientBridge := by
  intro n
  induction n using Nat.twoStepInduction with
  | zero =>
    intro i j
    cases i with
    | zero => simp [Q, coeff, rawFormula, Polynomial.coeff_one]
    | succ i => simp [Q, coeff, rawFormula, Polynomial.coeff_one, show ¬i+1+j ≤ 0 by omega]
  | one =>
    intro i j
    cases i with
    | zero => simp [Q, U, V, coeff, rawFormula, Polynomial.coeff_X, eq_comm]
    | succ i =>
      cases j with
      | zero =>
        cases i <;> simp [Q, U, V, coeff, rawFormula, Polynomial.coeff_X, Polynomial.coeff_one]
      | succ j =>
        have h : ¬i+1+(j+1) ≤ 1 := by omega
        cases i <;> simp [Q, U, V, coeff, rawFormula, Polynomial.coeff_X, Polynomial.coeff_one,
          h]
  | more n hn hn1 =>
    intro i j
    cases i with
    | zero =>
      cases j with
      | zero => rw [coeff_step_00, hn1, raw_step_00]
      | succ j => rw [coeff_step_0s, hn1, hn1, hn, raw_step_0s]
    | succ i =>
      cases j with
      | zero => rw [coeff_step_s0, hn1, hn1, raw_step_s0]
      | succ j => rw [coeff_step_ss, hn1, hn1, hn1, hn, raw_step_ss]

#print axioms coefficient_bridge
#print axioms raw_step_ss
end
end MathGKM.Markov.LeftBranch0001
