import MarkovMatrix16cb

/-! Machine-authored worker 774eaadc. Low-order coefficients of A-word-B.
The letter-count/source-label bridge is not asserted in this module. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def rowStep774 {R : Type*} [CommRing R] (x : R)
    (p : Polynomial R × Polynomial R) (r : Bool) :=
  if r then ((1+X)*p.1+C x*X*p.2, p.1+C x*X*p.2)
  else (p.1+C x*X*p.2, p.1+(C x+1)*X*p.2)

def RowJet774 {R : Type*} [CommRing R] (x n m : R)
    (p : Polynomial R × Polynomial R) : Prop :=
  p.1.coeff 0=1 ∧ p.2.coeff 0=1 ∧ p.1.coeff 1=n*x+m ∧
  2*(p.1.coeff 2+x*p.2.coeff 1)=
    n*(n+1)*x^2+2*((m+1)*n-2*m)*x+m*(m-1)

theorem rowJet_initial774 {R : Type*} [CommRing R] (x : R) :
    RowJet774 x 0 0 (1,1) := by simp [RowJet774,Polynomial.coeff_one]

theorem rowJet_step774 {R : Type*} [CommRing R] (x n m : R)
    (p : Polynomial R × Polynomial R) (h : RowJet774 x n m p) (r : Bool) :
    RowJet774 x (n+1) (m+if r then 1 else 0) (rowStep774 x p r) := by
  obtain ⟨h0,h1,h2,h3⟩ := h
  cases r <;>
    simp only [RowJet774,rowStep774,Bool.false_eq_true,if_false,if_true,
      add_zero,add_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_C_mul,
      Polynomial.coeff_X_mul,Polynomial.coeff_X_mul_zero,
      one_mul,mul_zero,add_zero,h0,h1,h2]
  · refine ⟨True.intro,True.intro,by ring,?_⟩
    linear_combination h3
  · refine ⟨True.intro,True.intro,by ring,?_⟩
    linear_combination h3

theorem rowJet_fold774 {R : Type*} [CommRing R] (x n m : R)
    (p : Polynomial R × Polynomial R) (h : RowJet774 x n m p) (w : List Bool) :
    RowJet774 x (n+w.length) (m+w.count true) (w.foldl (rowStep774 x) p) := by
  induction w generalizing n m p with
  | nil => simpa using h
  | cons r rs ih =>
    have hh := ih (n+1) (m+if r then 1 else 0) _ (rowJet_step774 x n m p h r)
    cases r <;> simpa [List.count_cons,add_assoc,add_comm,add_left_comm] using hh

def wordQuotient774 {R : Type*} [CommRing R] (x : R) (w : List Bool) : Polynomial R :=
  let p := w.foldl (rowStep774 x) (1,1)
  p.1+C x*X*p.2

theorem word_quadratic774 {R : Type*} [CommRing R] (x : R) (w : List Bool) :
    let n : R := w.length
    let m : R := w.count true
    2*(wordQuotient774 x w).coeff 2 =
      n*(n+1)*x^2+2*((m+1)*n-2*m)*x+m*(m-1) := by
  have h := rowJet_fold774 x 0 0 (1,1) (rowJet_initial774 x) w
  simpa [RowJet774,wordQuotient774,mul_assoc,Polynomial.coeff_X_mul,
    Polynomial.coeff_C_mul] using h.2.2.2

/-- The row transition is the literal matrix multiplication transition. -/
theorem row_matrix_step774 {R : Type*} [CommRing R] (x : R)
    (M : Mat16 (Polynomial R)) (r : Bool) :
    rowStep774 x (M.a,M.b) r =
      let N := mm16 M (if r then matB16 (C x*X) X else matA16 (C x*X) X)
      (N.a,N.b) := by
  cases r <;> simp [rowStep774,mm16,matA16,matB16] <;> constructor <;> ring

#print axioms word_quadratic774
#print axioms row_matrix_step774
end
end MathGKM.Markov
