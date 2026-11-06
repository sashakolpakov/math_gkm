import MathGKM.ResearchSemantics
import MathGKM.Markov

/- Machine-authored round91. A direct two-allocation central comparison.
The two weighted bounds are explicit premises; no rank log-concavity is assumed. -/
namespace SparseCentralR91
set_option maxHeartbeats 1000000

theorem scalar_central (x i A B M : ℤ)
    (hx : 0 ≤ x) (hi : 0 ≤ i) (him : i ≤ 2*x+1) (hM : 0 ≤ M)
    (hA : (x+1)*(2*x+1)*(2*x-i+3)*A  ≤ 
      (x+2)*(2*x+3)*(2*x-i+1)*M)
    (hB : (i+2)*(x+1)*(2*x+1)*B  ≤  x*i*(2*x+3)*M) :
    A+B ≤ 2*M := by
  let V := 4*(x+1)*(i-x)^2+4*(x+2)*i+2*x*(2*x^2+6*x+3)
  have hV : 0 ≤ V := by dsimp [V]; positivity
  have h0 := mul_nonneg hV hM
  have h1 := mul_nonneg (show 0 ≤ i+2 by omega) (sub_nonneg.mpr hA)
  have h2 := mul_nonneg (show 0 ≤ 2*x-i+3 by omega) (sub_nonneg.mpr hB)
  have he : (i+2)*(x+1)*(2*x+1)*(2*x-i+3)*(2*M-A-B) =
      V*M + (i+2)*((x+2)*(2*x+3)*(2*x-i+1)*M-
        (x+1)*(2*x+1)*(2*x-i+3)*A) +
      (2*x-i+3)*(x*i*(2*x+3)*M-(i+2)*(x+1)*(2*x+1)*B) := by
    dsimp [V]
    ring
  have hp : 0<(i+2)*(x+1)*(2*x+1)*(2*x-i+3) := by
    apply mul_pos
    · apply mul_pos
      · apply mul_pos <;> omega
      · omega
    · omega
  have hn : 0 ≤ (i+2)*(x+1)*(2*x+1)*(2*x-i+3)*(2*M-A-B) := by
    rw [he]
    linarith
  have hh := (mul_nonneg_iff_of_pos_left hp).mp hn
  omega

end SparseCentralR91
#print axioms SparseCentralR91.scalar_central
