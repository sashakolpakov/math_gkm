import MarkovSourceMomentsM13D
import MarkovHorizontalSeedM13D
/-! Machine-authored request 13d40bd7. Compact scalar moment certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false

def hDnM13D (x a b : ℝ) := (a+b)*x+3*a
def hKnM13D (x a b q : ℝ) := 8*q+a*x+(2*b-8*a)*x^2-(a+b)*x^3
def hLnM13D (x a b q t u : ℝ) :=
 24*u+24*t*x-96*q*x-144*q*x^2+6*a*x^2+(6*b-30*a)*x^3+
 (-12*b+30*a)*x^4+2*(a+b)*x^5

def hDvalM13D (x a b q t u : ℝ) :=
 boolMomentADB2 (fun p _ _ => (hprojM13D x p).d.coeff 1) b a q t u
def hKvalM13D (x a b q t u : ℝ) :=
 boolMomentADB2 (fun p q r => hlocalKM13D (hprojM13D x p) (hprojM13D x q) (hprojM13D x r)) b a q t u
def hLvalM13D (x a b q t u : ℝ) :=
 boolMomentADB2 (fun p q r => hlocalLM13D (hprojM13D x p) (hprojM13D x q) (hprojM13D x r)) b a q t u

theorem hD_closedM13D (x a b q t u : ℝ) (hh : x+1≠0) :
 hDvalM13D x a b q t u=hDnM13D x a b/(x+1)^2 := by
 norm_num only [Bool.false_eq_true,if_false,if_true,hDvalM13D,boolMomentADB2,boolJetADB2,hprojM13D,
   Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X,Polynomial.coeff_X_pow,Polynomial.coeff_one]
 unfold hDnM13D
 field_simp
 <;> ring

theorem hK_closedM13D (x a b q t u : ℝ) (hx : x≠0) (hh : x+1≠0) :
 hKvalM13D x a b q t u=hKnM13D x a b q/(x*(x+1)^4) := by
 norm_num only [Bool.false_eq_true,if_false,if_true,hKvalM13D,boolMomentADB2,boolJetADB2,hprojM13D,hlocalKM13D,hsingleKM13D,
   Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X,Polynomial.coeff_X_pow,Polynomial.coeff_one]
 unfold hKnM13D
 field_simp
 <;> ring

theorem hL_closedM13D (x a b q t u : ℝ) (hx : x≠0) (hh : x+1≠0) :
 hLvalM13D x a b q t u=hLnM13D x a b q t u/(x^2*(x+1)^6) := by
 norm_num only [Bool.false_eq_true,if_false,if_true,hLvalM13D,boolMomentADB2,boolJetADB2,hprojM13D,hlocalLM13D,singleLADB2,
   Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X,Polynomial.coeff_X_pow,Polynomial.coeff_one]
 unfold hLnM13D
 field_simp
 <;> ring

theorem hmoment_seedM13D (x a b q t u : ℝ) (hx : x≠0) (hh : x+1≠0) :
 let D := hDvalM13D x a b q t u
 let K := hKvalM13D x a b q t u
 let L := hLvalM13D x a b q t u
 x^2*(x+1)^3*((x+1)^3*(D^3+3*D*K+L)-3*(x+1)^2*(D^2+K)+6*(x+1)*D-6)=
 (h3seedM13D a b q t u).eval x := by
 dsimp only
 rw [hD_closedM13D x a b q t u hh,hK_closedM13D x a b q t u hx hh,
   hL_closedM13D x a b q t u hx hh]
 simp only [hDnM13D,hKnM13D,hLnM13D,h3seedM13D,h3c0M13D,h3c1M13D,h3c2M13D,
   h3c3M13D,h3c4M13D,h3c5M13D,Polynomial.eval_add,Polynomial.eval_mul,
   Polynomial.eval_pow,Polynomial.eval_C,Polynomial.eval_X]
 field_simp
 <;> ring
end
end MathGKM.Markov
