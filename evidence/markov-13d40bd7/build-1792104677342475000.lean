import MarkovSourceMomentsM13D
import MarkovHorizontalSeedM13D
/-! Machine-authored request 13d40bd7. Exact rational moment simplification. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false

def hDvalM13D (x a b q t u : ℝ) :=
 boolMomentADB2 (fun p _ _ => (hprojM13D x p).d.coeff 1) b a q t u
def hKvalM13D (x a b q t u : ℝ) :=
 boolMomentADB2 (fun p q r => hlocalKM13D (hprojM13D x p) (hprojM13D x q) (hprojM13D x r)) b a q t u
def hLvalM13D (x a b q t u : ℝ) :=
 boolMomentADB2 (fun p q r => hlocalLM13D (hprojM13D x p) (hprojM13D x q) (hprojM13D x r)) b a q t u

theorem hmoment_seedM13D (x a b q t u : ℝ) (hx : x≠0) (hh : x+1≠0) :
 let D := hDvalM13D x a b q t u
 let K := hKvalM13D x a b q t u
 let L := hLvalM13D x a b q t u
 x^2*(x+1)^3*((x+1)^3*(D^3+3*D*K+L)-3*(x+1)^2*(D^2+K)+6*(x+1)*D-6)=
 (h3seedM13D a b q t u).eval x := by
 dsimp only
 norm_num only [hDvalM13D,hKvalM13D,hLvalM13D,boolMomentADB2,boolJetADB2,
   hlocalKM13D,hsingleKM13D,hlocalLM13D,singleLADB2,hprojM13D,
   Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X,Polynomial.coeff_X_pow,
   Polynomial.coeff_one,h3seedM13D,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D]
 simp only [Polynomial.eval_add,Polynomial.eval_mul,Polynomial.eval_pow,Polynomial.eval_C,Polynomial.eval_X]
 norm_num only
 field_simp
 <;> ring

end
end MathGKM.Markov
