import MarkovFibonacciLayers7d90
import MarkovOneCutRaw320f
/-! Machine-authored 320fe46f. Increasing geometric degree weights do NOT
preserve comparisons across cut counts. The raw source remains log-concave. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem source13_degree320 {R : Type*} [CommRing R] (y z : R) :
 degreeCoeff07a7 y z y 1 1 (central28 [false]++[true]) 0=1 ∧
 degreeCoeff07a7 y z y 1 1 (central28 [false]++[true]) 1=2*z*(1+y) ∧
 degreeCoeff07a7 y z y 1 1 (central28 [false]++[true]) 2=z^3*(1+y)^3 := by
 have hw : central28 [false]=[false] := central_left7d 1
 rw [hw]
 norm_num [degreeCoeff07a7,cutFactorA27,cutChargeA27]
 constructor <;> ring

theorem source13_weighted_gaps320 (z : ℝ) :
 let p := fun s => degreeCoeff07a7 X (C z) X 1 1 (central28 [false]++[true]) s
 (p 1).coeff 0^2-(p 0).coeff 0*(p 2).coeff 0=z^2*(4-z) ∧
 (p 1).coeff 1^2-(p 0).coeff 0*(p 2).coeff 2=z^2*(4-3*z) := by
 obtain ⟨h0,h1,h2⟩ := source13_degree320 (X:ℝ[X]) (C z)
 dsimp only
 rw [h0,h1,h2]
 have hp : (2:ℝ[X])*C z*(1+X)=C (2*z)+C (2*z)*X := by simp; ring
 have hq : (C z:ℝ[X])^3*(1+X)^3=
     C (z^3)+C (3*z^3)*X+C (3*z^3)*X^2+C (z^3)*X^3 := by simp; ring
 rw [hp,hq]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow]
 constructor <;> ring

theorem source13_increasing_failures320 :
 (5:ℝ)^2*(4-5)=-25 ∧ (2:ℝ)^2*(4-3*2)=-8 ∧
 (1:ℝ)^2*(4-1)=3 ∧ (1:ℝ)^2*(4-3*1)=1 := by norm_num

theorem source13_polygon320 :
 (frame [false]).mid.a=1 ∧ (frame [false]).mid.b=3 ∧
 InPolygon 1 3 1 0 ∧ InPolygon 1 3 2 0 ∧ InPolygon 1 3 3 0 ∧
 InPolygon 1 3 1 1 ∧ InPolygon 1 3 1 2 := by
 norm_num [frame,initial,advance,InPolygon]

#print axioms source13_weighted_gaps320
#print axioms source13_polygon320
end
end MathGKM.Markov
