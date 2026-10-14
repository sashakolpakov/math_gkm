import MarkovWords774
import MarkovSecondWord8934

/-! Machine-authored request 4f8ceeeb. Exact cubic residual word jet.
No log-concavity is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def cubicExpr4f8 {R : Type*} [CommRing R] (x n m s : R) : R :=
  m*(m-1)*(m-2)+(3*(n-5)*m*(m+1)+6*(n-1)+12*s)*x+
    3*(n-1)*((n-4)*m+2*n)*x^2+(n+1)*n*(n-1)*x^3

def CubicJet4f8 {R : Type*} [CommRing R] (x : R) (n m : ℕ)
    (f : Bool) (k : ℕ) (r : Bool) (p : Polynomial R × Polynomial R) : Prop :=
  RowJet774 x n m p ∧
  p.2.coeff 1=n*x+m+1-2*(if r then 1 else 0) ∧
  6*(p.1.coeff 3+x*p.2.coeff 2)=cubicExpr4f8 x n m
    ((if f then 1 else 0)+(if r then 1 else 0)+2*(k:R))

theorem cubicJet_init4f8 {R : Type*} [CommRing R] (x : R) (e : Bool) :
    CubicJet4f8 x 1 (if e then 1 else 0) e 0 e (rowStep774 x (1,1) e) := by
  refine ⟨by simpa using rowJet_step774 x 0 0 (1,1) (rowJet_initial774 x) e,?_,?_⟩
  all_goals cases e <;> simp [rowStep774,cubicExpr4f8,Polynomial.coeff_C,
    Polynomial.coeff_X,Polynomial.coeff_one,add_mul] <;> ring

theorem cubicJet_step4f8 {R : Type*} [CommRing R] (x : R) (n m : ℕ)
    (f : Bool) (k : ℕ) (r e : Bool) (p : Polynomial R × Polynomial R)
    (h : CubicJet4f8 x n m f k r p) :
    CubicJet4f8 x (n+1) (m+if e then 1 else 0) f
      (k+if r && e then 1 else 0) e (rowStep774 x p e) := by
  obtain ⟨hj,hq1,h3⟩ := h
  refine ⟨by simpa using rowJet_step774 x (n:R) (m:R) p hj e,?_,?_⟩
  all_goals obtain ⟨hp0,hq0,hp1,h2⟩ := hj
  · cases e <;> simp [rowStep774,add_mul,mul_assoc,Polynomial.coeff_X_mul,
      Polynomial.coeff_X_mul_zero,hp1,hq0] <;> ring
  · cases e <;> cases r <;> cases f <;>
      simp [rowStep774,add_mul,mul_assoc,Polynomial.coeff_X_mul,
        Polynomial.coeff_X_mul_zero,cubicExpr4f8] at hq1 h2 h3 ⊢
    all_goals push_cast
    all_goals first
      | linear_combination h3+3*x*h2+6*x*hq1
      | linear_combination h3+3*(x+1)*h2-6*x*hq1

theorem cubicJet_fold4f8 {R : Type*} [CommRing R] (x : R) (n m : ℕ)
    (f : Bool) (k : ℕ) (r : Bool) (p : Polynomial R × Polynomial R)
    (h : CubicJet4f8 x n m f k r p) (w : List Bool) :
    CubicJet4f8 x (n+w.length) (m+w.count true) f (k+adj8934 r w)
      (last8934 r w) (w.foldl (rowStep774 x) p) := by
  induction w generalizing n m k r p with
  | nil => simpa [last8934,adj8934] using h
  | cons e es ih =>
    have hh := ih (n+1) (m+if e then 1 else 0) (k+if r && e then 1 else 0)
      e _ (cubicJet_step4f8 x n m f k r e p h)
    cases e <;> cases r <;>
      simpa [last8934,adj8934,List.count_cons,add_assoc,add_comm,add_left_comm] using hh

theorem word_cubic4f8 {R : Type*} [CommRing R] (x : R) (e : Bool) (w : List Bool) :
    6*(wordQuotient774 x (e::w)).coeff 3 =
      cubicExpr4f8 x (e::w).length ((e::w).count true) (stat8934 e w) := by
  have h := cubicJet_fold4f8 x 1 (if e then 1 else 0) e 0 e _ (cubicJet_init4f8 x e) w
  have hh := h.2.2
  cases e <;> simpa [wordQuotient774,stat8934,List.count_cons,add_comm,
    add_left_comm,add_assoc,mul_assoc,Polynomial.coeff_X_mul] using hh

#print axioms word_cubic4f8
end
end MathGKM.Markov
