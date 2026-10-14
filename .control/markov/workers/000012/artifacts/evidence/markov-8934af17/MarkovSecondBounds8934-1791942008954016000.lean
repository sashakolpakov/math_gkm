import MarkovCubicBounds5a7

/-! Machine-authored worker 8934af17. Certificates for the second horizontal
cubic. The support condition is explicit and is not assumed universally. -/
namespace MathGKM.Markov
noncomputable section

def secondB8934 (m : ℝ) := 9*m^2+13*m+6
def secondC8934 (n m : ℝ) := 6*m^2+6*m*n+8*m+6*n+6
def secondD8934 (n m : ℝ) := (m+n+2)*(m+n+1)

theorem second_cert8934 (m y : ℝ) (hm : 0 ≤ m) (hy : 0 ≤ y) :
    0 ≤ secondB8934 m^2-8*m*secondC8934 (2*m) m ∧
    0 ≤ secondC8934 (m+y) m^2-secondB8934 m*secondD8934 (m+y) m := by
  unfold secondB8934 secondC8934 secondD8934
  constructor <;> ring_nf <;> positivity

theorem second_inequalities8934 (n m s : ℝ) (hm : 0 ≤ m) (hn : m ≤ n)
    (hs : 0 ≤ s) (hsu : s ≤ 2*m) (hz : n ≤ 2*m ∨ s=0) :
    0 ≤ 4*s ∧ 0 < secondB8934 m ∧ 0 < secondC8934 n m ∧
    0 ≤ secondD8934 n m ∧
    (4*s)*secondC8934 n m ≤ secondB8934 m^2 ∧
    secondB8934 m*secondD8934 n m ≤ secondC8934 n m^2 ∧
    (4*s)*secondD8934 n m ≤ secondB8934 m*secondC8934 n m := by
  have hn0 : 0 ≤ n := le_trans hm hn
  have hB : 0 < secondB8934 m := by unfold secondB8934; positivity
  have hC : 0 < secondC8934 n m := by unfold secondC8934; positivity
  have hD : 0 ≤ secondD8934 n m := by unfold secondD8934; positivity
  have hc := second_cert8934 m (n-m) hm (sub_nonneg.mpr hn)
  rw [show m+(n-m)=n by ring] at hc
  have h1 : (4*s)*secondC8934 n m ≤ secondB8934 m^2 := by
    rcases hz with hz | hz
    · have hCup : secondC8934 n m ≤ secondC8934 (2*m) m := by
        unfold secondC8934
        nlinarith [mul_nonneg hm (sub_nonneg.mpr hz)]
      have hmul := mul_le_mul_of_nonneg_left hCup (show 0 ≤ 8*m by positivity)
      have hs' := mul_le_mul_of_nonneg_right (show 4*s ≤ 8*m by linarith) hC.le
      linarith [hc.1]
    · rw [hz]; simpa using sq_nonneg (secondB8934 m)
  have h2 : secondB8934 m*secondD8934 n m ≤ secondC8934 n m^2 := by linarith [hc.2]
  have h3 : (4*s)*secondD8934 n m ≤ secondB8934 m*secondC8934 n m := by
    have hh := mul_le_mul h1 h2 (mul_nonneg hB.le hD) (sq_nonneg (secondB8934 m))
    apply le_of_mul_le_mul_right (a := secondB8934 m*secondC8934 n m) ?_ (mul_pos hB hC)
    nlinarith [hh]
  exact ⟨by positivity,hB,hC,hD,h1,h2,h3⟩

#print axioms second_inequalities8934
end
end MathGKM.Markov
