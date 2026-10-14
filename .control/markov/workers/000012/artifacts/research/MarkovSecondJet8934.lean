import MarkovHorizontalB46

/-! Machine-authored worker 8934af17. Exact second horizontal jet, with
the adjacency statistic retained. No log-concavity hypothesis. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def jetExpr8934 {R : Type*} [CommRing R] (x n m f k r : R) : R :=
  4*f+8*k+(9*m^2+7*m+2-4*r)*x+
    (6*m^2+6*m*n+4*n)*x^2+(m+n)*(m+n+1)*x^3

def HJet8934 {R : Type*} [CommRing R] (x : R) (n m : ℕ)
    (f : Bool) (k : ℕ) (r : Bool) (p : Polynomial R × Polynomial R) : Prop :=
  HJet46 x n m p ∧
  (x+1)*p.1.coeff 1=p.2.coeff 0*(x+2*(if r then 1 else 0)) ∧
  2*x*(x+1)^3*(p.1.coeff 2+(x+1)*p.2.coeff 2)=
    p.2.coeff 0*jetExpr8934 x n m (if f then 1 else 0) k (if r then 1 else 0)

theorem coeff_mul_two8934 {R : Type*} [CommRing R] (p q : Polynomial R) :
    (p*q).coeff 2=p.coeff 0*q.coeff 2+p.coeff 1*q.coeff 1+p.coeff 2*q.coeff 0 := by
  simp [Polynomial.coeff_mul, Finset.Nat.antidiagonal_succ, Finset.Nat.antidiagonal_zero, add_assoc]

theorem hjet_init8934 {R : Type*} [CommRing R] (x : R) (r : Bool) :
    HJet8934 x 1 (if r then 1 else 0) r 0 r (hrowStep46 x (X,1) r) := by
  refine ⟨by simpa using hjet_step46 x 0 0 (X,1) (hjet_initial46 x) r,?_,?_⟩
  all_goals cases r <;>
    simp [hrowStep46,jetExpr8934,coeff_mul_two8934,coeff_mul_one46,
      Polynomial.mul_coeff_zero,Polynomial.coeff_add,Polynomial.coeff_C,
      Polynomial.coeff_X,Polynomial.coeff_one] <;> ring

theorem hjet_step8934 {R : Type*} [CommRing R] (x : R) (n m : ℕ)
    (f : Bool) (k : ℕ) (r e : Bool) (p : Polynomial R × Polynomial R)
    (h : HJet8934 x n m f k r p) :
    HJet8934 x (n+1) (m+if e then 1 else 0) f
      (k+if r && e then 1 else 0) e (hrowStep46 x p e) := by
  obtain ⟨hj,hp1,hs2⟩ := h
  refine ⟨hjet_step46 x n m p hj e,?_,?_⟩
  all_goals obtain ⟨hp0,hq0,hs1⟩ := hj
  · cases e <;>
      simp [hrowStep46,coeff_mul_one46,Polynomial.mul_coeff_zero,
        Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_X,
        Polynomial.coeff_one,hp0] <;> ring
  · cases e <;> cases r <;>
      simp [hrowStep46,coeff_mul_two8934,coeff_mul_one46,
        Polynomial.mul_coeff_zero,Polynomial.coeff_add,Polynomial.coeff_C,
        Polynomial.coeff_X,Polynomial.coeff_one,hp0,jetExpr8934] at hp1 hs2 ⊢
    all_goals push_cast
    · linear_combination (x+1)*hs2 + 2*x^2*(x+1)*hs1 + 2*x*(x+1)*hp1
    · linear_combination (x+1)*hs2 + 2*x^2*(x+1)*hs1 + 2*x*(x+1)*hp1
    · linear_combination x*(x+1)*hs2 + 2*x^2*(x+1)*(2*x+3)*hs1 +
        2*x*(x+1)*(x+2)*hp1
    · linear_combination x*(x+1)*hs2 + 2*x^2*(x+1)*(2*x+3)*hs1 +
        2*x*(x+1)*(x+2)*hp1

#print axioms hjet_step8934
end
end MathGKM.Markov
