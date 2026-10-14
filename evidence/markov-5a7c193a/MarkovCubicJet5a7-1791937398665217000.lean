import MarkovWordJet774

/-! Machine-authored worker 5a7c193a. A universal cubic word identity.
The word statistic is explicit; no source-specific formula for it is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def cubicExpr5a7 {R : Type*} [CommRing R] (x n m s : R) : R :=
  m*(m-1)*(m-2) +
    3*(2*(n-1)+3*m-5*m^2+n*m+n*m^2-4*s)*x +
    3*(2*n*(n-1)+m*(n-1)*(n-4))*x^2 + (n+1)*n*(n-1)*x^3

def RowCubic5a7 {R : Type*} [CommRing R] (x n m s : R) (e : Bool)
    (p : Polynomial R × Polynomial R) : Prop :=
  RowJet774 x n m p ∧
  p.2.coeff 1 = n*x+m+1-2*(if e then 1 else 0) ∧
  2*p.1.coeff 2 = n*(n-1)*x^2+2*((m+1)*n-3*m-1+2*(if e then 1 else 0))*x+m*(m-1) ∧
  6*(p.1.coeff 3+x*p.2.coeff 2)=cubicExpr5a7 x n m s

theorem rowCubic_initial5a7 {R : Type*} [CommRing R] (x : R) (e : Bool) :
    RowCubic5a7 x 1 (if e then 1 else 0) 0 e (rowStep774 x (1,1) e) := by
  refine ⟨?_,?_⟩
  · simpa using rowJet_step774 x 0 0 (1,1) (rowJet_initial774 x) e
  · cases e <;> simp [RowCubic5a7,rowStep774,cubicExpr5a7,Polynomial.coeff_one,
      mul_assoc,Polynomial.coeff_X_mul,Polynomial.coeff_X_mul_zero] <;> ring

theorem rowCubic_step5a7 {R : Type*} [CommRing R] (x n m s : R)
    (e r : Bool) (p : Polynomial R × Polynomial R) (h : RowCubic5a7 x n m s e p) :
    RowCubic5a7 x (n+1) (m+if r then 1 else 0)
      (s+if e=r then 0 else 1) r (rowStep774 x p r) := by
  obtain ⟨hj,hq,hp,hc⟩ := h
  refine ⟨rowJet_step774 x n m p hj r,?_⟩
  obtain ⟨h0,h1,h2,h3⟩ := hj
  cases e <;> cases r <;>
    simp only [rowStep774,Bool.false_eq_true,if_false,if_true,reduceCtorEq,
      add_zero,add_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_C_mul,
      Polynomial.coeff_X_mul,Polynomial.coeff_X_mul_zero,
      one_mul,mul_zero,add_zero,h0,h1,h2] at hq hp ⊢
  all_goals refine ⟨by ring,?_,?_⟩
  · linear_combination h3
  · dsimp [cubicExpr5a7] at hc ⊢
    linear_combination hc+3*x*h3+6*x*hq
  · linear_combination h3
  · dsimp [cubicExpr5a7] at hc ⊢
    linear_combination hc+3*x*h3+3*hp
  · linear_combination h3
  · dsimp [cubicExpr5a7] at hc ⊢
    linear_combination hc+3*x*h3+6*x*hq
  · linear_combination h3
  · dsimp [cubicExpr5a7] at hc ⊢
    linear_combination hc+3*x*h3+3*hp

def switchesFrom5a7 (e : Bool) : List Bool → ℕ
  | [] => 0
  | r::rs => (if e=r then 0 else 1)+switchesFrom5a7 r rs

def lastFrom5a7 (e : Bool) : List Bool → Bool
  | [] => e
  | r::rs => lastFrom5a7 r rs

theorem rowCubic_fold5a7 {R : Type*} [CommRing R] (x n m s : R)
    (e : Bool) (p : Polynomial R × Polynomial R) (h : RowCubic5a7 x n m s e p)
    (w : List Bool) :
    RowCubic5a7 x (n+w.length) (m+w.count true) (s+switchesFrom5a7 e w)
      (lastFrom5a7 e w) (w.foldl (rowStep774 x) p) := by
  induction w generalizing n m s e p with
  | nil => simpa [switchesFrom5a7,lastFrom5a7] using h
  | cons r rs ih =>
    have hh := ih (n+1) (m+if r then 1 else 0) (s+if e=r then 0 else 1)
      r _ (rowCubic_step5a7 x n m s e r p h)
    cases e <;> cases r <;>
      simpa [switchesFrom5a7,lastFrom5a7,List.count_cons,add_assoc,add_comm,add_left_comm] using hh

/-- Nonempty cores; the empty core has zero cubic coefficient separately. -/
theorem word_cubic5a7 {R : Type*} [CommRing R] (x : R) (e : Bool) (w : List Bool) :
    6*(wordQuotient774 x (e::w)).coeff 3 =
      cubicExpr5a7 x (1+w.length) ((if e then 1 else 0)+w.count true)
        (switchesFrom5a7 e w) := by
  have h := rowCubic_fold5a7 x 1 (if e then 1 else 0) 0 e _ (rowCubic_initial5a7 x e) w
  simpa [RowCubic5a7,wordQuotient774,mul_assoc,Polynomial.coeff_add,
    Polynomial.coeff_C_mul,Polynomial.coeff_X_mul] using h.2.2.2

#print axioms rowCubic_step5a7
#print axioms word_cubic5a7
end
end MathGKM.Markov
