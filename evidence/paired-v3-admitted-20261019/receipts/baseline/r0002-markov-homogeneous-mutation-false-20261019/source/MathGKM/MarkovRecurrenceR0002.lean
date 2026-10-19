import MathGKM.Acceptedcb1615e51542ac6eb2dd5748
import MathGKM.Acceptedf9f6dde28a842e02dcb86480

/-! Machine-authored 2026-10-19, round 2. Homogeneous mutation bridge.
This is a path recurrence, not an independent source-family audit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def u : TriPoly := X
def v : TriPoly := C X
def w : TriPoly := C (C X)
def H (L : Label) : TriPoly := liftHomogeneous L.p (L.a+L.b-1)

theorem hom_add {P Q : TriPoly} {d : ℕ} (hp : HomogeneousAt P d)
    (hq : HomogeneousAt Q d) : HomogeneousAt (P+Q) d := by
  intro i j k h
  by_cases ha : triCoeff P i j k = 0
  · apply hq i j k
    simp only [triCoeff] at ha
    simpa [triCoeff, ha] using h
  · exact hp i j k ha

theorem hom_sub {P Q : TriPoly} {d : ℕ} (hp : HomogeneousAt P d)
    (hq : HomogeneousAt Q d) : HomogeneousAt (P-Q) d := by
  intro i j k h
  by_cases ha : triCoeff P i j k = 0
  · apply hq i j k
    simp only [triCoeff] at ha
    simpa [triCoeff, ha] using h
  · exact hp i j k ha

theorem hom_mul {P Q : TriPoly} {d e : ℕ} (hp : HomogeneousAt P d)
    (hq : HomogeneousAt Q e) : HomogeneousAt (P*Q) (d+e) := by
  classical
  intro i j k h
  by_contra hd
  apply h
  simp only [triCoeff, Polynomial.coeff_mul, Polynomial.finsetSum_coeff]
  apply Finset.sum_eq_zero
  intro ab hab
  apply Finset.sum_eq_zero
  intro cd hcd
  apply Finset.sum_eq_zero
  intro ef hef
  have hab' := Finset.HasAntidiagonal.mem_antidiagonal.mp hab
  have hcd' := Finset.HasAntidiagonal.mem_antidiagonal.mp hcd
  have hef' := Finset.HasAntidiagonal.mem_antidiagonal.mp hef
  by_cases hp0 : triCoeff P ab.1 cd.1 ef.1 = 0
  · simp [triCoeff] at hp0
    simp [hp0]
  · by_cases hq0 : triCoeff Q ab.2 cd.2 ef.2 = 0
    · simp [triCoeff] at hq0
      simp [hq0]
    · have := hp ab.1 cd.1 ef.1 hp0
      have := hq ab.2 cd.2 ef.2 hq0
      omega

theorem hom_one : HomogeneousAt 1 0 := by
  intro i j k h
  by_cases hi : i=0 <;> by_cases hj : j=0 <;> by_cases hk : k=0 <;>
    simp_all [triCoeff, Polynomial.coeff_one, eq_comm]

theorem hom_u : HomogeneousAt u 1 := by
  intro i j k h
  by_cases hi : i=1 <;> by_cases hj : j=0 <;> by_cases hk : k=0 <;>
    simp_all [triCoeff, u, Polynomial.coeff_X, Polynomial.coeff_one, eq_comm]

theorem hom_v : HomogeneousAt v 1 := by
  intro i j k h
  by_cases hi : i=0 <;> by_cases hj : j=1 <;> by_cases hk : k=0 <;>
    simp_all [triCoeff, v, Polynomial.coeff_X, Polynomial.coeff_C, Polynomial.coeff_one, eq_comm]

theorem hom_w : HomogeneousAt w 1 := by
  intro i j k h
  by_cases hi : i=0 <;> by_cases hj : j=0 <;> by_cases hk : k=1 <;>
    simp_all [triCoeff, w, Polynomial.coeff_X, Polynomial.coeff_C, eq_comm]

theorem hom_pow {P : TriPoly} {d : ℕ} (hp : HomogeneousAt P d) (n : ℕ) :
    HomogeneousAt (P^n) (n*d) := by
  induction n with
  | zero => simpa using hom_one
  | succ n ih => simpa [pow_succ, Nat.succ_mul] using hom_mul ih hp

def specW : TriPoly →+* BiPoly :=
  Polynomial.mapRingHom (Polynomial.mapRingHom (Polynomial.evalRingHom (1 : ℤ)))

theorem specW_eq (P : TriPoly) : specW P = specializeW P := rfl

@[simp] theorem spec_add (P Q : TriPoly) : specW (P+Q) = specW P + specW Q :=
  _root_.map_add specW P Q
@[simp] theorem spec_sub (P Q : TriPoly) : specW (P-Q) = specW P - specW Q :=
  _root_.map_sub specW P Q
@[simp] theorem spec_mul (P Q : TriPoly) : specW (P*Q) = specW P * specW Q :=
  _root_.map_mul specW P Q
@[simp] theorem spec_pow (P : TriPoly) (n : ℕ) : specW (P^n) = (specW P)^n :=
  _root_.map_pow specW P n

@[simp] theorem spec_u : specW u = U := by simp [specW, u, U]
@[simp] theorem spec_v : specW v = V := by simp [specW, v, V]
@[simp] theorem spec_w : specW w = 1 := by simp [specW, w]
@[simp] theorem spec_H (L : Label) : specW (H L) = L.p := specialize_lift _ _

theorem H_hom (p : List Bool) (L : Label)
    (hL : L ∈ [(frame p).lo, (frame p).mid, (frame p).hi]) :
    HomogeneousAt (H L) (L.a+L.b-1) :=
  (Acceptedf9f6dde28a842e02dcb86480.obligation p L hL).2.2.2

theorem mutation_true (p : List Bool) :
    H (advance (frame p) true).mid =
      (u+v+w)*H (frame p).hi*H (frame p).mid -
      u^(frame p).hi.a*v^(frame p).hi.b*w^((frame p).hi.a+(frame p).hi.b)*H (frame p).lo := by
  symm
  apply Acceptedcb1615e51542ac6eb2dd5748.obligation
  · have hf := (Accepted54255e349b93aabd9e655107.obligation p).1
    rcases hf with ⟨⟨ha,hb⟩, hd, hl, hh, hla, hha⟩
    have hlo := H_hom p (frame p).lo (by simp)
    have hmid := H_hom p (frame p).mid (by simp)
    have hhi := H_hom p (frame p).hi (by simp)
    apply hom_sub
    · convert hom_mul (hom_mul (hom_add (hom_add hom_u hom_v) hom_w) hhi) hmid using 1 <;>
        simp only [advance, ↓reduceIte] <;> omega
    · convert hom_mul (hom_mul (hom_mul (hom_pow hom_u (frame p).hi.a)
        (hom_pow hom_v (frame p).hi.b)) (hom_pow hom_w ((frame p).hi.a+(frame p).hi.b))) hlo using 1 <;>
        simp only [advance, ↓reduceIte] <;> omega
  · change specW _ = _
    simp only [spec_sub, spec_mul, spec_add, spec_pow, spec_u, spec_v, spec_w, spec_H,
      one_pow, mul_one, advance, ↓reduceIte, S]

theorem mutation_false (p : List Bool) :
    H (advance (frame p) false).mid =
      (u+v+w)*H (frame p).lo*H (frame p).mid -
      u^(frame p).lo.a*v^(frame p).lo.b*w^((frame p).lo.a+(frame p).lo.b)*H (frame p).hi := by
  symm
  apply Acceptedcb1615e51542ac6eb2dd5748.obligation
  · have hf := (Accepted54255e349b93aabd9e655107.obligation p).1
    rcases hf with ⟨⟨ha,hb⟩, hd, hl, hh, hla, hha⟩
    have hlo := H_hom p (frame p).lo (by simp)
    have hmid := H_hom p (frame p).mid (by simp)
    have hhi := H_hom p (frame p).hi (by simp)
    apply hom_sub
    · convert hom_mul (hom_mul (hom_add (hom_add hom_u hom_v) hom_w) hlo) hmid using 1 <;>
        simp only [advance, Bool.false_eq_true, ↓reduceIte] <;> omega
    · convert hom_mul (hom_mul (hom_mul (hom_pow hom_u (frame p).lo.a)
        (hom_pow hom_v (frame p).lo.b)) (hom_pow hom_w ((frame p).lo.a+(frame p).lo.b))) hhi using 1 <;>
        simp only [advance, Bool.false_eq_true, ↓reduceIte] <;> omega
  · change specW _ = _
    simp only [spec_sub, spec_mul, spec_add, spec_pow, spec_u, spec_v, spec_w, spec_H,
      one_pow, mul_one, advance, Bool.false_eq_true, ↓reduceIte, S]

#print axioms mutation_true
#print axioms mutation_false
end
end MathGKM.Markov
