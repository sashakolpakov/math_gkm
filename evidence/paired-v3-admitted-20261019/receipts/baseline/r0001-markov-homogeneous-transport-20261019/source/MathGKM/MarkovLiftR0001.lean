import MathGKM.MarkovHomogeneityR0001

/-! Machine-authored 2026-10-19. Outer variable u, middle v, inner w.
This constructs a lift; it does not identify the published source family. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

abbrev TriPoly := Polynomial (Polynomial (Polynomial ℤ))

def liftHomogeneous (P : BiPoly) (d : ℕ) : TriPoly :=
  P.sum fun i pi => monomial i (pi.sum fun j c => monomial j (monomial (d-i-j) c))

def triCoeff (T : TriPoly) (i j k : ℕ) : ℤ := ((T.coeff i).coeff j).coeff k

def specializeW (T : TriPoly) : BiPoly :=
  T.map (Polynomial.mapRingHom (Polynomial.evalRingHom (1 : ℤ)))

theorem lift_coeff_uv (P : BiPoly) (d i j : ℕ) :
    ((liftHomogeneous P d).coeff i).coeff j = monomial (d-i-j) (coeff P i j) := by
  classical
  by_cases hi : P.coeff i = 0
  · simp [liftHomogeneous, Polynomial.sum, Polynomial.coeff_monomial, coeff, hi]
  · by_cases hj : (P.coeff i).coeff j = 0
    · simp [liftHomogeneous, Polynomial.sum, Polynomial.coeff_monomial, coeff, hi, hj]
    · simp [liftHomogeneous, Polynomial.sum, Polynomial.coeff_monomial, coeff, hi, hj]

theorem lift_coeff (P : BiPoly) (d i j k : ℕ) :
    triCoeff (liftHomogeneous P d) i j k =
      if k = d-i-j then coeff P i j else 0 := by
  rw [triCoeff, lift_coeff_uv, Polynomial.coeff_monomial]
  simp only [eq_comm]

theorem specialize_lift (P : BiPoly) (d : ℕ) :
    specializeW (liftHomogeneous P d) = P := by
  classical
  ext i j
  simp only [specializeW, Polynomial.coeff_map, Polynomial.coe_mapRingHom]
  rw [lift_coeff_uv]
  simp [Polynomial.coe_evalRingHom, coeff]

theorem lift_homogeneous (P : BiPoly) (d : ℕ) (hP : DegreeBound P d) :
    ∀ i j k, triCoeff (liftHomogeneous P d) i j k ≠ 0 → i+j+k = d := by
  intro i j k h
  rw [lift_coeff] at h
  split_ifs at h with hk
  · have hij := hP i j h
    omega
  · exact (h rfl).elim

theorem lift_transport (P : BiPoly) (d : ℕ) (hP : DegreeBound P d) :
    specializeW (liftHomogeneous P d) = P ∧
    (∀ i j, i+j ≤ d → triCoeff (liftHomogeneous P d) i j (d-i-j) = coeff P i j) ∧
    (∀ i j, d < i+j → coeff P i j = 0) ∧
    (∀ i j k, triCoeff (liftHomogeneous P d) i j k ≠ 0 → i+j+k = d) := by
  refine ⟨specialize_lift P d, ?_, ?_, lift_homogeneous P d hP⟩
  · intro i j hij
    simp [lift_coeff]
  · intro i j hij
    by_contra hn
    have := hP i j hn
    omega

theorem frame_lift_transport (p : List Bool) :
    ∀ L ∈ [(frame p).lo, (frame p).mid, (frame p).hi],
      let d := L.a+L.b-1
      specializeW (liftHomogeneous L.p d) = L.p ∧
      (∀ i j, i+j ≤ d → triCoeff (liftHomogeneous L.p d) i j (d-i-j) = coeff L.p i j) ∧
      (∀ i j, d < i+j → coeff L.p i j = 0) ∧
      (∀ i j k, triCoeff (liftHomogeneous L.p d) i j k ≠ 0 → i+j+k = d) := by
  intro L hL
  have hb := frame_bound p
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hL
  rcases hL with rfl | rfl | rfl
  · exact lift_transport _ _ hb.1
  · exact lift_transport _ _ hb.2.1
  · exact lift_transport _ _ hb.2.2

#print axioms frame_lift_transport
end
end MathGKM.Markov
