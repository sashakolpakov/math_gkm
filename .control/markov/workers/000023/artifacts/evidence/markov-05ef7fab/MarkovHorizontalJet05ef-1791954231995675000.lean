import MarkovHorizontalB46
/-! Machine-authored 05ef7fab: exact second horizontal word jet.
No coefficient inequality or source-word statistic is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option maxRecDepth 8000
set_option linter.unusedSimpArgs false

def hsecond05ef {R : Type*} [CommRing R] (x : R)
 (p : Polynomial R × Polynomial R) : R :=
 x*p.1.coeff 2+p.1.coeff 1+x*(x+1)*p.2.coeff 2+x*p.2.coeff 1

def hseed05ef {R : Type*} [CommRing R] (x n m a : R) : R :=
 2*a+(9*m^2+13*m+6)*x+
 2*(3*(m+1)*n+3*m^2+4*m+3)*x^2+(n+m+2)*(n+m+1)*x^3

def HSecond05ef {R : Type*} [CommRing R] (x : R) (n m : ℕ) (a : R)
 (r : Bool) (p : Polynomial R × Polynomial R) : Prop :=
 HJet46 x n m p ∧
 (x+1)*p.1.coeff 1=p.2.coeff 0*(x+if r then 2 else 0) ∧
 2*(x+1)^3*hsecond05ef x p=p.2.coeff 0*hseed05ef x n m a

theorem hsecond_initial05ef {R : Type*} [CommRing R] (x : R) (r : Bool) :
 HSecond05ef x 1 (if r then 1 else 0) (if r then 4 else 0) r
 (hrowStep46 x (X,1) r) := by
 refine ⟨?_,?_,?_⟩
 · simpa using hjet_step46 x 0 0 (X,1) (hjet_initial46 x) r
 all_goals cases r <;>
   simp [hrowStep46,hsecond05ef,hseed05ef,add_mul,mul_add,mul_assoc,
     Polynomial.coeff_X_mul,Polynomial.coeff_X_mul_zero,Polynomial.coeff_C_mul,
     Polynomial.coeff_one,Polynomial.coeff_X,Polynomial.coeff_C] <;> ring

theorem hsecond_step05ef {R : Type*} [CommRing R] (x : R) (n m : ℕ) (a : R)
 (r z : Bool) (p : Polynomial R × Polynomial R) (h : HSecond05ef x n m a r p) :
 HSecond05ef x (n+1) (m+if z then 1 else 0)
 (a+if z then (if r then 4 else 2) else (if r then -2 else 0)) z
 (hrowStep46 x p z) := by
 obtain ⟨hj,hp,hs⟩ := h
 refine ⟨hjet_step46 x n m p hj z,?_,?_⟩
 · obtain ⟨h0,hq,hj⟩ := hj
   cases z <;>
     simp [hrowStep46,add_mul,mul_add,mul_assoc,Polynomial.coeff_X_mul,
       Polynomial.coeff_X_mul_zero,Polynomial.coeff_C_mul,h0] <;> ring
 · obtain ⟨h0,hq,hj⟩ := hj
   cases r <;> cases z <;>
     simp [hrowStep46,hsecond05ef,hseed05ef,add_mul,mul_add,mul_assoc,
       Polynomial.coeff_X_mul,Polynomial.coeff_X_mul_zero,Polynomial.coeff_C_mul,
       h0] at hp hs hj ⊢
   · linear_combination (x+1)*hs - 2*(x+1)*hp + 2*x^2*(x+1)^2*hj
   · linear_combination x*(x+1)*hs + 2*x*(x+1)*hp + 2*x^2*(2*x+3)*(x+1)^2*hj
   · linear_combination (x+1)*hs - 2*(x+1)*hp + 2*x^2*(x+1)^2*hj
   · linear_combination x*(x+1)*hs + 2*x*(x+1)*hp + 2*x^2*(2*x+3)*(x+1)^2*hj

#print axioms hsecond_step05ef
end
end MathGKM.Markov
