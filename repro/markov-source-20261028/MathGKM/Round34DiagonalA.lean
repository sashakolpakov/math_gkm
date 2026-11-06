import MathGKM.Accepted59e4dda788038a4fc60ede37
import MathGKM.Acceptedd712fd5ef8560e5a5e527557

/-! Machine-authored round34: original constant-right diagonal consumer.
    All total-degree layers and raw zero coefficients are retained. -/
namespace RightDiagonalR34
open MathGKM.Markov RightR30 RightLayersR31 RightExpansionR31 SmoothingR32
noncomputable section
set_option maxHeartbeats 2000000

theorem residual_hom (n h : ℕ) (hn : h≤n) : Hom (residual n h) (n-h) := by
  intro i j hc
  have he := grade_residual n h hn
  rw [Polynomial.C_mul_X_pow_eq_monomial] at he
  have hx := congrArg (fun Q : Polynomial BiPoly => coeff (Q.coeff (n-h)) i j) he
  rw [Acceptedb8df3e2c5c06edf954fe0b4e.obligation.2.1,
    Polynomial.coeff_monomial,if_pos rfl] at hx
  by_contra hij
  rw [if_neg hij] at hx
  exact hc hx.symm

theorem layer_recover (P : BiPoly) (m i j : ℕ) (hij : i+j=m) :
    coeff P i j=coeff ((grade P).coeff m) i j := by
  have hc := Acceptedb8df3e2c5c06edf954fe0b4e.obligation.2.1 P m i j
  simpa only [if_pos hij] using hc.symm

theorem diagonal_raw (k i j : ℕ) :
    coeff (M k) i (j+2)*coeff (M k) (i+2) j≤coeff (M k) (i+1) (j+1)^2 := by
  let n := k+1
  let m := i+j+2
  by_cases hout : (m < n ∨ 2 * n < m)
  · have hz := Acceptedb8df3e2c5c06edf954fe0b4e.obligation.2.2.2.2 k m hout
    have hc := layer_recover (M k) m i (j+2) (by dsimp [m]; omega)
    rw [hz] at hc
    have hzero : coeff (M k) i (j+2)=0 := hc.trans (by simp [coeff])
    rw [hzero,zero_mul]
    exact sq_nonneg _
  by_cases hcorner : m=n
  · have hc := layer_recover (M k) n i (j+2) (by dsimp [m,n] at *; omega)
    rw [Acceptedb8df3e2c5c06edf954fe0b4e.obligation.2.2.1 k] at hc
    have hzero : coeff (M k) i (j+2)=0 := by
      rw [hc]
      by_cases hi : i=k+1 <;>
        simp [coeff,U,Polynomial.coeff_X_pow,hi,Polynomial.coeff_one]
    rw [hzero,zero_mul]
    exact sq_nonneg _
  · let h := m-n
    have hh : 1≤h := by dsimp [h]; omega
    have hn : h≤n := by dsimp [h]; omega
    have he : m=2*h+(n-h) := by omega
    have hf : (grade (M k)).coeff m=T^(2*h)*residual n h := by
      have hx := Acceptedb8df3e2c5c06edf954fe0b4e.obligation.2.2.2.1 k h hh hn
      have hm : k+1+h=m := by dsimp [h,n] at *; omega
      rw [hm] at hx
      exact hx
    have cone := (Accepted59e4dda788038a4fc60ede37.obligation n h hh hn).2.1
    exact (Acceptedd712fd5ef8560e5a5e527557.obligation
      (M k) (residual n h) (2*h) (n-h) m he (residual_hom n h hn) hf
      cone.1 cone.2.2 cone.2.1).2.2 i j rfl

theorem original_diagonal : ∀ k : ℕ,
    let E := (frame (List.replicate k true)).mid
    ∀ i j : ℕ,
      InPolygon E.a E.b i (j+2) →
      InPolygon E.a E.b (i+1) (j+1) →
      InPolygon E.a E.b (i+2) j →
      coeff E.p i (j+2)*coeff E.p (i+2) j≤coeff E.p (i+1) (j+1)^2 := by
  intro k
  dsimp only
  intro i j _ _ _
  exact diagonal_raw k i j

end
end RightDiagonalR34

#print axioms RightDiagonalR34.residual_hom
#print axioms RightDiagonalR34.diagonal_raw
#print axioms RightDiagonalR34.original_diagonal
