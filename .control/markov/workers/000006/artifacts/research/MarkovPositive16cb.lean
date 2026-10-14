import MarkovMatrix16cb

/-! Machine-authored worker 16cb07ce. Universal coefficient nonnegativity
for the explicit quotient. This is not a log-concavity theorem. -/
namespace MathGKM.Markov
noncomputable section

def PolyNonneg16 (P : BiPoly) : Prop := ∀ i j, 0 ≤ coeff P i j
theorem poly_add_nonneg16 {P Q : BiPoly} (hp : PolyNonneg16 P)
    (hq : PolyNonneg16 Q) : PolyNonneg16 (P+Q) := by
  intro i j
  exact add_nonneg (hp i j) (hq i j)
theorem poly_mul_nonneg16 {P Q : BiPoly} (hp : PolyNonneg16 P)
    (hq : PolyNonneg16 Q) : PolyNonneg16 (P*Q) := by
  intro i j
  simp only [coeff,Polynomial.coeff_mul,Polynomial.finsetSum_coeff]
  apply Finset.sum_nonneg
  intro ab hab
  apply Finset.sum_nonneg
  intro cd hcd
  exact mul_nonneg (hp ab.1 cd.1) (hq ab.2 cd.2)
theorem poly_one_nonneg16 : PolyNonneg16 1 := by
  intro i j
  by_cases hi : i=0 <;> by_cases hj : j=0 <;>
    simp [coeff,Polynomial.coeff_one,hi,hj]
theorem poly_U_nonneg16 : PolyNonneg16 U := by
  intro i j
  by_cases hi : 1=i <;> by_cases hj : j=0 <;>
    simp [coeff,U,Polynomial.coeff_X,Polynomial.coeff_one,hi,hj]
theorem poly_V_nonneg16 : PolyNonneg16 V := by
  intro i j
  by_cases hi : i=0 <;> by_cases hj : 1=j <;>
    simp [coeff,V,Polynomial.coeff_C,Polynomial.coeff_X,hi,hj]

def MatNonneg16 (m : Mat16 BiPoly) : Prop :=
  PolyNonneg16 m.a ∧ PolyNonneg16 m.b ∧ PolyNonneg16 m.c ∧ PolyNonneg16 m.d
theorem mat_mul_nonneg16 {x y : Mat16 BiPoly} (hx : MatNonneg16 x)
    (hy : MatNonneg16 y) : MatNonneg16 (mm16 x y) := by
  obtain ⟨xa,xb,xc,xd⟩ := hx
  obtain ⟨ya,yb,yc,yd⟩ := hy
  exact ⟨poly_add_nonneg16 (poly_mul_nonneg16 xa ya) (poly_mul_nonneg16 xb yc),
    poly_add_nonneg16 (poly_mul_nonneg16 xa yb) (poly_mul_nonneg16 xb yd),
    poly_add_nonneg16 (poly_mul_nonneg16 xc ya) (poly_mul_nonneg16 xd yc),
    poly_add_nonneg16 (poly_mul_nonneg16 xc yb) (poly_mul_nonneg16 xd yd)⟩

theorem mat_pair_nonneg16 (path : List Bool) (xy : Mat16 BiPoly × Mat16 BiPoly)
    (hx : MatNonneg16 xy.1) (hy : MatNonneg16 xy.2) :
    let out := path.foldl matPairStep16 xy
    MatNonneg16 out.1 ∧ MatNonneg16 out.2 := by
  induction path generalizing xy with
  | nil => exact ⟨hx,hy⟩
  | cons r rs ih =>
    cases r
    · exact ih _ hx (mat_mul_nonneg16 hx hy)
    · exact ih _ (mat_mul_nonneg16 hx hy) hy

/-- Every coefficient of the explicit two-variable quotient is nonnegative. -/
theorem quotient_coeff_nonneg16 (path : List Bool) :
    PolyNonneg16 (qTree16 U V (1 : BiPoly) path).2.1 := by
  rw [quotient_matrix16]
  have hA : MatNonneg16 (matA16 U V) :=
    ⟨poly_one_nonneg16,poly_one_nonneg16,poly_U_nonneg16,
      poly_add_nonneg16 poly_U_nonneg16 poly_V_nonneg16⟩
  have hB : MatNonneg16 (matB16 U V) :=
    ⟨poly_add_nonneg16 poly_one_nonneg16 poly_V_nonneg16,
      poly_one_nonneg16,poly_U_nonneg16,poly_U_nonneg16⟩
  have h := mat_pair_nonneg16 path (matA16 U V,matB16 U V) hA hB
  exact (mat_mul_nonneg16 h.1 h.2).2.1

/-- Source-linked existence of a positive integral blowup quotient. -/
theorem source_positive_quotient16 (path : List Bool) :
    ∃ Q : BiPoly, PolyNonneg16 Q ∧
      evalTriDe6 U V ((U+V)^2) (numerator4b5 (frame path).mid) =
        (U+V)^((frame path).mid.a+(frame path).mid.b-1)*Q := by
  refine ⟨(qTree16 U V (1 : BiPoly) path).2.1,quotient_coeff_nonneg16 path,?_⟩
  simpa using source_quotient16 U V (1 : BiPoly) path

#print axioms quotient_coeff_nonneg16
#print axioms source_positive_quotient16
end
end MathGKM.Markov
