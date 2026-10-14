import MarkovDegree21a

/-! Machine-authored worker 21afc594. Explicit homogeneous coefficient recovery.
Variables are outer u, middle v, inner w. No coefficient normalization. -/
namespace MathGKM.Markov
noncomputable section
abbrev TriPoly21a := Polynomial (Polynomial (Polynomial ℤ))

def liftRow21a (d i : ℕ) (q : Polynomial ℤ) : Polynomial (Polynomial ℤ) :=
  q.sum fun j a => Polynomial.monomial j (Polynomial.monomial (d-i-j) a)

def homogenize21a (d : ℕ) (P : BiPoly) : TriPoly21a :=
  P.sum fun i q => Polynomial.monomial i (liftRow21a d i q)

theorem liftRow_coeff_21a (d i j : ℕ) (q : Polynomial ℤ) :
    (liftRow21a d i q).coeff j = Polynomial.monomial (d-i-j) (q.coeff j) := by
  classical
  simp only [liftRow21a, Polynomial.sum_def, Polynomial.finsetSum_coeff,
    Polynomial.coeff_monomial]
  rw [Finset.sum_ite_eq']
  split_ifs with h
  · rfl
  · have hz : q.coeff j = 0 := by simpa only [Polynomial.mem_support_iff, not_not] using h
    simp [hz]

theorem homogenize_coeff_21a (d i : ℕ) (P : BiPoly) :
    (homogenize21a d P).coeff i = liftRow21a d i (P.coeff i) := by
  classical
  simp only [homogenize21a, Polynomial.sum_def, Polynomial.finsetSum_coeff,
    Polynomial.coeff_monomial]
  rw [Finset.sum_ite_eq']
  split_ifs with h
  · rfl
  · have hz : P.coeff i = 0 := by simpa only [Polynomial.mem_support_iff, not_not] using h
    simp [hz, liftRow21a, Polynomial.sum_def]

theorem raw_homogeneous_coeff_21a (d i j k : ℕ) (P : BiPoly) :
    (((homogenize21a d P).coeff i).coeff j).coeff k =
      if d-i-j = k then coeff P i j else 0 := by
  rw [homogenize_coeff_21a, liftRow_coeff_21a, Polynomial.coeff_monomial]
  rfl

theorem raw_coeff_recovered_21a (d i j : ℕ) (P : BiPoly) :
    (((homogenize21a d P).coeff i).coeff j).coeff (d-i-j) = coeff P i j := by
  simp [raw_homogeneous_coeff_21a]

theorem homogeneous_support_21a {d : ℕ} {P : BiPoly}
    (h : DegreeBound21a P d) (i j k : ℕ)
    (hc : (((homogenize21a d P).coeff i).coeff j).coeff k ≠ 0) :
    i+j+k = d := by
  rw [raw_homogeneous_coeff_21a] at hc
  split_ifs at hc with hk
  · have hbound : i+j ≤ d := by
      by_contra hn
      exact hc (h i j (by omega))
    omega
  · exact (hc rfl).elim

theorem homogenize_injective_21a (d : ℕ) : Function.Injective (homogenize21a d) := by
  intro P Q h
  apply Polynomial.ext
  intro i
  apply Polynomial.ext
  intro j
  have hh := congrArg (fun R : TriPoly21a => ((R.coeff i).coeff j).coeff (d-i-j)) h
  simpa only [raw_coeff_recovered_21a, coeff] using hh

def dehomogenize21a : TriPoly21a →+* BiPoly :=
  Polynomial.mapRingHom (Polynomial.mapRingHom (Polynomial.evalRingHom (1 : ℤ)))

theorem dehomogenize_homogenize_21a (d : ℕ) (P : BiPoly) :
    dehomogenize21a (homogenize21a d P) = P := by
  apply Polynomial.ext
  intro i
  apply Polynomial.ext
  intro j
  change (((homogenize21a d P).map
    (Polynomial.mapRingHom (Polynomial.evalRingHom (1 : ℤ)))).coeff i).coeff j = _
  rw [Polynomial.coeff_map]
  change (((homogenize21a d P).coeff i).map (Polynomial.evalRingHom (1 : ℤ))).coeff j = _
  rw [Polynomial.coeff_map]
  rw [homogenize_coeff_21a, liftRow_coeff_21a]
  simp

def IsHomogeneous21a (d : ℕ) (Q : TriPoly21a) : Prop :=
  ∀ i j k, ((Q.coeff i).coeff j).coeff k ≠ 0 → i+j+k = d

theorem homogeneous_row_21a {d : ℕ} {Q : TriPoly21a}
    (h : IsHomogeneous21a d Q) (i j : ℕ) :
    (Q.coeff i).coeff j = Polynomial.monomial (d-i-j)
      (((Q.coeff i).coeff j).coeff (d-i-j)) := by
  apply Polynomial.ext
  intro k
  rw [Polynomial.coeff_monomial]
  split_ifs with hk
  · rw [hk]
  · by_contra hc
    have hh := h i j k hc
    omega

theorem homogeneous_reconstruction_21a {d : ℕ} {Q : TriPoly21a}
    (h : IsHomogeneous21a d Q) :
    homogenize21a d (dehomogenize21a Q) = Q := by
  apply Polynomial.ext
  intro i
  apply Polynomial.ext
  intro j
  rw [homogenize_coeff_21a, liftRow_coeff_21a]
  have heval : Polynomial.eval 1 ((Q.coeff i).coeff j) =
      ((Q.coeff i).coeff j).coeff (d-i-j) := by
    conv_lhs => rw [homogeneous_row_21a h i j]
    simp
  change Polynomial.monomial (d-i-j)
    (((Q.map (Polynomial.mapRingHom (Polynomial.evalRingHom (1 : ℤ)))).coeff i).coeff j) = _
  rw [Polynomial.coeff_map]
  change Polynomial.monomial (d-i-j)
    (((Q.coeff i).map (Polynomial.evalRingHom (1 : ℤ))).coeff j) = _
  rw [Polynomial.coeff_map]
  change Polynomial.monomial (d-i-j) (Polynomial.eval 1 ((Q.coeff i).coeff j)) = _
  rw [heval]
  exact (homogeneous_row_21a h i j).symm

theorem homogeneous_specialization_injective_21a {d : ℕ} {Q R : TriPoly21a}
    (hq : IsHomogeneous21a d Q) (hr : IsHomogeneous21a d R)
    (h : dehomogenize21a Q = dehomogenize21a R) : Q = R := by
  rw [← homogeneous_reconstruction_21a hq, ← homogeneous_reconstruction_21a hr, h]

/-- Signed Laurent exponents avoid endpoint truncation. -/
def laurentExponent21a (a b i j : ℕ) : ℤ × ℤ × ℤ :=
  (1 - (a : ℤ) + 2*i, 1 - (b : ℤ) + 2*j,
   (a : ℤ) + b - 1 - 2*i - 2*j)

theorem laurent_exponent_injective_21a (a b : ℕ) :
    Function.Injective (fun ij : ℕ × ℕ => laurentExponent21a a b ij.1 ij.2) := by
  intro ij mn h
  have hx := congrArg Prod.fst h
  have hy := congrArg (fun t : ℤ × ℤ × ℤ => t.2.1) h
  simp only [laurentExponent21a] at hx hy
  apply Prod.ext <;> omega

theorem laurent_total_degree_21a (a b i j : ℕ) :
    (laurentExponent21a a b i j).1 + (laurentExponent21a a b i j).2.1 +
      (laurentExponent21a a b i j).2.2 = 1 := by
  simp only [laurentExponent21a]
  ring

theorem frame_homogeneous_21a (path : List Bool) (i j k : ℕ)
    (hc : (((homogenize21a ((frame path).mid.a + (frame path).mid.b - 1)
      (frame path).mid.p).coeff i).coeff j).coeff k ≠ 0) :
    i+j+k = (frame path).mid.a + (frame path).mid.b - 1 :=
  homogeneous_support_21a (degree_frame_21a path).2.1 i j k hc

#print axioms raw_homogeneous_coeff_21a
#print axioms raw_coeff_recovered_21a
#print axioms homogeneous_support_21a
#print axioms homogenize_injective_21a
#print axioms dehomogenize_homogenize_21a
#print axioms homogeneous_reconstruction_21a
#print axioms homogeneous_specialization_injective_21a
#print axioms laurent_exponent_injective_21a
#print axioms laurent_total_degree_21a
#print axioms frame_homogeneous_21a
end
end MathGKM.Markov
