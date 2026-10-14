import MarkovGasF80

/-! Machine-authored worker b46c0efc. First horizontal jet of an exact
A--core--B raw word. No log-concavity is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def hrowStep46 {R : Type*} [CommRing R] (x : R)
    (p : Polynomial R × Polynomial R) (r : Bool) :=
  if r then
    (X*(C x+X+1)*p.1+C x*X*(C x+X+2)*p.2,
      (C x+X)*p.1+C x*(C x+X+1)*p.2)
  else (X*p.1+C x*X*p.2,p.1+C (x+1)*p.2)

def HJet46 {R : Type*} [CommRing R] (x : R) (n m : ℕ)
    (p : Polynomial R × Polynomial R) : Prop :=
  p.1.coeff 0=0 ∧ p.2.coeff 0=x^m*(x+1)^n ∧
  (x+1)*(p.1.coeff 1+(x+1)*p.2.coeff 1)=
    p.2.coeff 0*((x+1)+(n:R)*x+(m:R)*(x+3))

theorem coeff_mul_one46 {R : Type*} [CommRing R] (p q : Polynomial R) :
    (p*q).coeff 1=p.coeff 0*q.coeff 1+p.coeff 1*q.coeff 0 := by
  simp [Polynomial.coeff_mul,Finset.antidiagonal_succ,Finset.antidiagonal_zero]

theorem hjet_initial46 {R : Type*} [CommRing R] (x : R) :
    HJet46 x 0 0 (X,1) := by simp [HJet46]

theorem hjet_step46 {R : Type*} [CommRing R] (x : R) (n m : ℕ)
    (p : Polynomial R × Polynomial R) (h : HJet46 x n m p) (r : Bool) :
    HJet46 x (n+1) (m+if r then 1 else 0) (hrowStep46 x p r) := by
  obtain ⟨hp,hq,hs⟩ := h
  cases r <;>
    simp [HJet46,hrowStep46,coeff_mul_one46,Polynomial.mul_coeff_zero,
      Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_X,
      hp,hq,pow_succ] at *
  · constructor
    · ring
    · linear_combination (x+1)*hs
  · constructor
    · ring
    · linear_combination x*(x+1)*hs

theorem hjet_fold46 {R : Type*} [CommRing R] (x : R) (n m : ℕ)
    (p : Polynomial R × Polynomial R) (h : HJet46 x n m p) (w : List Bool) :
    HJet46 x (n+w.length) (m+w.count true) (w.foldl (hrowStep46 x) p) := by
  induction w generalizing n m p with
  | nil => simpa using h
  | cons r rs ih =>
    have hh := ih (n+1) (m+if r then 1 else 0) _ (hjet_step46 x n m p h r)
    cases r <;> simpa [List.count_cons,add_assoc,add_comm,add_left_comm] using hh

def hword46 {R : Type*} [CommRing R] (x : R) (w : List Bool) : Polynomial R :=
  let p := w.foldl (hrowStep46 x) (X,1)
  (C x+X)*p.1+C x*(C x+X+1)*p.2

theorem hword_scaled46 {R : Type*} [CommRing R] (x : R) (w : List Bool) :
    (x+1)*(hword46 x w).coeff 1 =
      x^(w.count true+1)*(x+1)^w.length*
        (((3*w.count true+2:ℕ):R)+((w.length+w.count true+2:ℕ):R)*x) := by
  have h := hjet_fold46 x 0 0 (X,1) (hjet_initial46 x) w
  simp only [zero_add] at h
  obtain ⟨hp,hq,hs⟩ := h
  simp only [hword46,Polynomial.coeff_add,coeff_mul_one46,
    Polynomial.mul_coeff_zero,Polynomial.coeff_C,Polynomial.coeff_X,
    Polynomial.coeff_one,zero_ne_one,one_ne_zero,if_false,if_true,
    mul_zero,zero_mul,add_zero,zero_add,mul_one,one_mul,hp,hq]
  push_cast
  rw [pow_succ]
  linear_combination x*hs

#print axioms hword_scaled46
end
end MathGKM.Markov
