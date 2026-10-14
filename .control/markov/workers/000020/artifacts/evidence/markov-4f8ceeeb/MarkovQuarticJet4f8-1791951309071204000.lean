import MarkovCubicJet5a7
import MarkovResidualSupport725

/-! Machine-authored request 4f8ceeeb. Exact fourth-degree residual identity,
with ordered local statistics; no experimental premise is used. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false
set_option maxRecDepth 4000

def quarticExpr4f8 {R : Type*} [CommRing R] (x n m s t : R) : R :=
 m*(m-1)*(m-2)*(m-3)+
 (4*((n-8)*m^3+18*m^2+(5*n-22)*m-6*n+12)+48*(1-m)*s+48*t)*x+
 (6*(n^2*(m^2+3*m+6)+n*(-11*m^2-9*m-18)+26*m^2-10*m+12)+(144-48*n)*s)*x^2+
 4*(n-1)*(n-2)*(3*n+m*(n-6))*x^3+(n+1)*n*(n-1)*(n-2)*x^4

def qsecond4f8 {R : Type*} [CommRing R] (x n m : R) (e r : Bool) : R :=
 let E : R := if e then 1 else 0
 let F : R := if r then 1 else 0
 n*(n-1)*x^2+2*((m+2-2*F)*n-3*m-2+4*F)*x+
 m*(m-1)+2*((1-2*F)*m+1-2*(1-F)*E)

def RowQuartic4f8 {R : Type*} [CommRing R] (x n m s t : R) (e r : Bool)
    (p : Polynomial R × Polynomial R) : Prop :=
 RowCubic5a7 x n m s r p ∧ 2*p.2.coeff 2=qsecond4f8 x n m e r ∧
 24*(p.1.coeff 4+x*p.2.coeff 3)=quarticExpr4f8 x n m s t

theorem quartic_initial4f8 {R : Type*} [CommRing R] (x : R) (e r : Bool) :
 RowQuartic4f8 x 2 ((if e then 1 else 0)+(if r then 1 else 0))
   (if e=r then 0 else 1) 0 e r
   (rowStep774 x (rowStep774 x (1,1) e) r) := by
 refine ⟨by simpa [one_add_one_eq_two] using (rowCubic_step5a7 x 1 (if e then 1 else 0) 0 e r _
   (rowCubic_initial5a7 x e)),?_,?_⟩
 all_goals cases e <;> cases r <;>
   simp [rowStep774,qsecond4f8,quarticExpr4f8,add_mul,mul_assoc,
     Polynomial.coeff_X_mul,Polynomial.coeff_X_mul_zero,
     Polynomial.coeff_one,Polynomial.coeff_X,Polynomial.coeff_C] <;> ring

theorem quartic_step4f8 {R : Type*} [CommRing R] (x n m s t : R)
 (e r z : Bool) (p : Polynomial R × Polynomial R) (h : RowQuartic4f8 x n m s t e r p) :
 RowQuartic4f8 x (n+1) (m+if z then 1 else 0)
   (s+if r=z then 0 else 1) (t+if e=z ∧ r=false then 1 else 0) r z (rowStep774 x p z) := by
 obtain ⟨hc,hq2,h4⟩ := h
 refine ⟨rowCubic_step5a7 x n m s r z p hc,?_,?_⟩
 all_goals obtain ⟨⟨hp0,hq0,hp1,h2⟩,hq1,hp2,h3⟩ := hc
 · cases z <;> cases r <;> cases e <;>
     simp [rowStep774,qsecond4f8,add_mul,mul_assoc,Polynomial.coeff_X_mul,
       Polynomial.coeff_X_mul_zero] at hq1 hp2 ⊢
   all_goals first | linear_combination hp2+2*(x+1)*hq1 | linear_combination hp2+2*x*hq1
 · cases z <;> cases r <;> cases e <;>
     simp [rowStep774,quarticExpr4f8,cubicExpr5a7,qsecond4f8,add_mul,mul_assoc,
       Polynomial.coeff_X_mul,Polynomial.coeff_X_mul_zero] at hq2 h3 h4 ⊢
   all_goals first
     | linear_combination h4+4*x*h3+12*x*hq2
     | linear_combination h4+4*(x+1)*h3-12*x*hq2

def triples4f8 (e r : Bool) : List Bool → ℕ
 | [] => 0
 | z::zs => (if e=z ∧ r=false then 1 else 0)+triples4f8 r z zs

theorem quartic_fold4f8 {R : Type*} [CommRing R] (x n m s t : R)
 (e r : Bool) (p : Polynomial R × Polynomial R) (h : RowQuartic4f8 x n m s t e r p)
 (w : List Bool) :
 24*((w.foldl (rowStep774 x) p).1.coeff 4+x*(w.foldl (rowStep774 x) p).2.coeff 3)=
 quarticExpr4f8 x (n+w.length) (m+w.count true)
   (s+switchesFrom5a7 r w) (t+triples4f8 e r w) := by
 induction w generalizing n m s t e r p with
   | nil => simpa [switchesFrom5a7,triples4f8] using h.2.2
   | cons z zs ih =>
     have hh := ih (n+1) (m+if z then 1 else 0) (s+if r=z then 0 else 1)
       (t+if e=z ∧ r=false then 1 else 0) r z _ (quartic_step4f8 x n m s t e r z p h)
     cases z <;> cases r <;> cases e <;>
       simpa [switchesFrom5a7,triples4f8,List.count_cons,add_assoc,add_comm,add_left_comm] using hh

theorem word_quartic4f8 {R : Type*} [CommRing R] (x : R) (e r : Bool) (w : List Bool) :
 24*(wordQuotient774 x (e::r::w)).coeff 4=
 quarticExpr4f8 x (e::r::w).length ((e::r::w).count true)
   (switchesFrom5a7 e (r::w)) (triples4f8 e r w) := by
 have h := (quartic_fold4f8 x 2 ((if e then 1 else 0)+(if r then 1 else 0))
   (if e=r then 0 else 1) 0 e r _ (quartic_initial4f8 x e r) w)
 cases e <;> cases r <;>
   simpa [wordQuotient774,switchesFrom5a7,List.count_cons,List.length_cons,
     mul_assoc,Polynomial.coeff_X_mul,add_assoc,add_comm,add_left_comm,one_add_one_eq_two] using h

#print axioms word_quartic4f8
end
end MathGKM.Markov
