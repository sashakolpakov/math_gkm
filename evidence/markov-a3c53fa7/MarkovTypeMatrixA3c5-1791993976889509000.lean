import MarkovDeformedSourceA3c5
/-! Machine-authored a3c53fa7. Positive C-site weighting of the Pell core.
Parameter one is the literal source. Other parameters are deformations. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

def typeA3 : Mat16 BiPoly := ⟨V,1,U*V,U+1⟩
def typeC3 (t : ℤ) : Mat16 BiPoly := ⟨V+C (C t),1,U*V,U⟩
def typeB3 (t : ℤ) := mm16 typeA3 (typeC3 t)
def typeMat3 (t : ℤ) : ℕ → Mat16 BiPoly
 | 0 => typeA3
 | n+1 => mm16 (typeB3 t) (typeMat3 t n)
def typeScalar3 (m : Mat16 BiPoly) : BiPoly := V*m.a+U*V*m.b+m.c+U*m.d

theorem typeScalar_rec3 (t : ℤ) (m : Mat16 BiPoly) :
 typeScalar3 (mm16 (typeB3 t) (mm16 (typeB3 t) m))=
 ((U+V)^2+U+C (C t)*V)*typeScalar3 (mm16 (typeB3 t) m)-
 C (C t)*U*V*typeScalar3 m := by
 simp only [typeScalar3,typeB3,typeA3,typeC3,mm16]
 ring

theorem typeP_matrix3 (t : ℤ) (n : ℕ) :
 typeP3 t (n+1)=typeScalar3 (typeMat3 t n) := by
 induction n using Nat.twoStepInduction with
 | zero => simp only [typeP3,typeMat3,typeScalar3,typeA3]; ring
 | one => simp only [typeP3,typeMat3,typeScalar3,typeB3,typeA3,typeC3,mm16]; ring
 | more n h0 h1 =>
   rw [show n+2+1=(n+1)+2 by omega,typeP3,h0,h1]
   exact (typeScalar_rec3 t (typeMat3 t n)).symm

/-- No source modification: the weighted matrix equals the literal source
exactly at weight one. -/
theorem source_type_matrix3 (n : ℕ) :
 (frame (List.replicate n true)).mid.p=typeScalar3 (typeMat3 1 n) := by
 rw [← typeP_matrix3,typeP_source3]
 rfl

theorem type_matrix_triple_failure3 (n : ℕ) :
 coeff (typeScalar3 (typeMat3 2 (n+39))) (n+40) 1^2 <
 coeff (typeScalar3 (typeMat3 2 (n+39))) (n+40) 0 *
 coeff (typeScalar3 (typeMat3 2 (n+39))) (n+40) 2 := by
 rw [← typeP_matrix3]
 have he : n+39+1=n+40 := by omega
 rw [he]
 -- The gap identity is used directly, not a numerical experiment.
 have h := typeP_gap3 2 (n+37)
 rw [show n+37+3=n+40 by omega] at h
 push_cast at h
 have hn : (0:ℤ)≤n := Int.natCast_nonneg n
 nlinarith [sq_nonneg (n:ℤ)]

#print axioms typeP_matrix3
#print axioms source_type_matrix3
#print axioms type_matrix_triple_failure3
end
end MathGKM.Markov
