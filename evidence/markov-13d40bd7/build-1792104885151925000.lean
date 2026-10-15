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
 norm_num only [hDvalM13D,boolMomentADB2,boolJetADB2,hprojM13D,
   Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X,Polynomial.coeff_X_pow,Polynomial.coeff_one]
 unfold hDnM13D
 field_simp
 <;> ring

end
end MathGKM.Markov
