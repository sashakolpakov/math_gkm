import MathGKM.MarkovLeftCoefficients0002

/-! Machine-authored round-0002 inequality attempt, bounded to 210 seconds. -/
namespace MathGKM.Markov.LeftBranch0001

theorem choose_ratio (n k : ℕ) (hk : k ≤ n) :
    (n.choose (k+1) : ℚ) / (n.choose k : ℚ) =
      ((n : ℚ)-k)/(k+1) := by
  have hp : (0 : ℚ) < n.choose k := by exact_mod_cast Nat.choose_pos hk
  apply (div_eq_div_iff (ne_of_gt hp) (by positivity : (k : ℚ)+1 ≠ 0)).2
  have he := congrArg (fun x : ℕ => (x : ℚ)) (Nat.choose_succ_right_eq n k)
  push_cast [Nat.cast_sub hk] at he
  simpa only [mul_comm] using he

theorem choose_upper_ratio (n k : ℕ) (hk : k ≤ n) :
    ((n+1).choose k : ℚ) / (n.choose k : ℚ) =
      ((n : ℚ)+1)/(n+1-k) := by
  have hp : (0 : ℚ) < n.choose k := by exact_mod_cast Nat.choose_pos hk
  have hkn : (k : ℚ) ≤ n := by exact_mod_cast hk
  have hd : (n : ℚ)+1-k ≠ 0 := by linarith
  apply (div_eq_div_iff (ne_of_gt hp) hd).2
  have he := congrArg (fun x : ℕ => (x : ℚ)) (Nat.choose_mul_succ_eq n k)
  push_cast [Nat.cast_sub (show k ≤ n+1 by omega)] at he
  nlinarith only [he]

theorem choose_lc (n k : ℕ) (hk : k+2 ≤ n) :
    (n.choose k : ℤ) * n.choose (k+2) ≤ (n.choose (k+1) : ℤ)^2 := by
  have ha : (0 : ℚ) < n.choose k := by exact_mod_cast Nat.choose_pos (by omega : k ≤ n)
  have hb : (0 : ℚ) < n.choose (k+1) := by exact_mod_cast Nat.choose_pos (by omega : k+1 ≤ n)
  have hr : (n.choose (k+2) : ℚ)/(n.choose (k+1) : ℚ) ≤
      (n.choose (k+1) : ℚ)/(n.choose k : ℚ) := by
    rw [show k+2 = (k+1)+1 by omega, choose_ratio n (k+1) (by omega), choose_ratio n k (by omega)]
    apply (div_le_div_iff₀ (by positivity) (by positivity)).2
    have hkn : (k : ℚ)+2 ≤ n := by exact_mod_cast hk
    push_cast
    nlinarith
  have he := (div_le_div_iff₀ hb ha).1 hr
  have : (n.choose k : ℚ) * n.choose (k+2) ≤ (n.choose (k+1) : ℚ)^2 := by nlinarith only [he]
  exact_mod_cast this

theorem choose_upper_lc (n k : ℕ) (hk : k ≤ n) :
    (n.choose k : ℤ) * (n+2).choose k ≤ ((n+1).choose k : ℤ)^2 := by
  have ha : (0 : ℚ) < n.choose k := by exact_mod_cast Nat.choose_pos hk
  have hb : (0 : ℚ) < (n+1).choose k := by exact_mod_cast Nat.choose_pos (by omega : k ≤ n+1)
  have hr : ((n+2).choose k : ℚ)/((n+1).choose k : ℚ) ≤
      ((n+1).choose k : ℚ)/(n.choose k : ℚ) := by
    rw [show n+2 = (n+1)+1 by omega, choose_upper_ratio (n+1) k (by omega), choose_upper_ratio n k hk]
    have hkn : (k : ℚ) ≤ n := by exact_mod_cast hk
    push_cast
    apply (div_le_div_iff₀ (by linarith) (by linarith)).2
    nlinarith
  have he := (div_le_div_iff₀ hb ha).1 hr
  have : (n.choose k : ℚ) * (n+2).choose k ≤ ((n+1).choose k : ℚ)^2 := by nlinarith only [he]
  exact_mod_cast this

theorem product_lc (a b c d e f : ℤ) (hd : 0 ≤ d) (hf : 0 ≤ f)
    (h1 : a*c ≤ b^2) (h2 : d*f ≤ e^2) : (a*d)*(c*f) ≤ (b*e)^2 := by
  have h := mul_le_mul h1 h2 (mul_nonneg hd hf) (sq_nonneg b)
  nlinarith only [h]

theorem formula_horizontal (n i j : ℕ) (hi : 1 ≤ i) (hn : i+j+2 ≤ n) :
    rawFormula n i j * rawFormula n (i+2) j ≤ rawFormula n (i+1) j^2 := by
  rw [rawFormula_in _ _ _ (by omega) (by omega),
    rawFormula_in _ _ _ (by omega) (by omega), rawFormula_in _ _ _ (by omega) (by omega)]
  have h1 := choose_upper_lc (i+j) j (by omega)
  have h2 := choose_lc (n-j-1) (i-1) (by omega)
  convert product_lc _ _ _ _ _ _ (by positivity) (by positivity) h1 h2 using 1 <;>
    congr 4 <;> omega

theorem formula_vertical (n i j : ℕ) (hi : 1 ≤ i) (hn : i+j+2 ≤ n) :
    rawFormula n i j * rawFormula n i (j+2) ≤ rawFormula n i (j+1)^2 := by
  rw [rawFormula_in _ _ _ (by omega) (by omega),
    rawFormula_in _ _ _ (by omega) (by omega), rawFormula_in _ _ _ (by omega) (by omega)]
  rw [← Nat.choose_symm_add, ← Nat.choose_symm_add, ← Nat.choose_symm_add]
  have h1 := choose_upper_lc (i+j) i (by omega)
  have h2 := choose_upper_lc (n-j-3) (i-1) (by omega)
  have h2' : (((n-j-3)+2).choose (i-1) : ℤ) * (n-j-3).choose (i-1) ≤
      (((n-j-3)+1).choose (i-1) : ℤ)^2 := by nlinarith only [h2]
  convert product_lc _ _ _ _ _ _ (by positivity) (by positivity) h1 h2' using 1 <;>
    congr 4 <;> omega

theorem formula_diagonal (n i j : ℕ) (hi : 1 ≤ i) (hn : i+j+2 ≤ n) :
    rawFormula n i (j+2) * rawFormula n (i+2) j ≤ rawFormula n (i+1) (j+1)^2 := by
  rw [rawFormula_in _ _ _ (by omega) (by omega),
    rawFormula_in _ _ _ (by omega) (by omega), rawFormula_in _ _ _ (by omega) (by omega)]
  have e1 : n-(j+2)-1 = n-j-3 := by omega
  have e2 : n-(j+1)-1 = (n-j-3)+1 := by omega
  have e3 : n-j-1 = (n-j-3)+2 := by omega
  rw [e1, e2, e3]
  rw [← Nat.choose_symm (show i-1 ≤ n-j-3 by omega),
    ← Nat.choose_symm (show i+2-1 ≤ n-j-3+2 by omega),
    ← Nat.choose_symm (show i+1-1 ≤ n-j-3+1 by omega)]
  have h1 := choose_lc (i+j+2) j (by omega)
  have h1' : ((i+j+2).choose (j+2) : ℤ) * (i+j+2).choose j ≤
      ((i+j+2).choose (j+1) : ℤ)^2 := by nlinarith only [h1]
  have h2 := choose_upper_lc (n-j-3) (n-i-j-2) (by omega)
  convert product_lc _ _ _ _ _ _ (by positivity) (by positivity) h1' h2 using 1 <;>
    congr 4 <;> omega

theorem formula_weakLC : FormulaWeakLC := by
  intro n hn
  refine ⟨?_, ?_, ?_⟩
  · intro i j h0 h1 h2
    simp only [InPolygon, one_mul, Nat.add_sub_cancel_left] at h0 h1 h2
    have hi : 1 ≤ i := by nlinarith [h0.1, h2.2]
    exact formula_horizontal n i j hi (by omega)
  · intro i j h0 h1 h2
    simp only [InPolygon, one_mul, Nat.add_sub_cancel_left] at h0 h1 h2
    have hi : 1 ≤ i := by nlinarith [h0.1, h2.2]
    exact formula_vertical n i j hi (by omega)
  · intro i j h0 h1 h2
    simp only [InPolygon, one_mul, Nat.add_sub_cancel_left] at h0 h1 h2
    by_cases hi : 1 ≤ i
    · exact formula_diagonal n i j hi (by omega)
    · have ei : i = 0 := by omega
      subst i
      have en : n = j+2 := by nlinarith [h0.1, h0.2]
      subst n
      rw [rawFormula_zero, rawFormula_one, rawFormula_in _ _ _ (by omega) (by omega)]
      simp only [ite_true, show j+1 < j+2 by omega, Nat.reduceLT, Nat.add_sub_cancel,
        Nat.choose_self, Nat.cast_one, mul_one, one_mul]
      rw [← Nat.choose_symm (show j ≤ 2+j by omega)]
      have he : 2+j-j = 2 := by omega
      rw [he]
      have hb := Nat.choose_le_pow (2+j) 2
      have ez : j+2-j-1 = 1 := by omega
      simp only [ez, Nat.reduceAdd, Nat.reduceSub, Nat.choose_self, Nat.cast_one, mul_one]
      have hb' : ((2+j).choose 2 : ℤ) ≤ ((2+j : ℕ) : ℤ)^2 := by exact_mod_cast hb
      convert hb' using 1 <;> push_cast <;> ring

#print axioms choose_lc
#print axioms choose_upper_lc
#print axioms formula_weakLC
end MathGKM.Markov.LeftBranch0001
