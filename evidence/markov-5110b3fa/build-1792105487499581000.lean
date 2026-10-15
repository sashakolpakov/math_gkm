import MarkovFourthGenericM511
import MarkovHorizontalFourthSeedM511
/-! Machine-authored request 5110b3fa. Exact fourth-row polynomial data. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false

def h4localNumM511 (x : ℝ) (p q r s : Bool) : ℝ :=
 (if p then (if q then (if r then (if s then (96-1152*x-192*x^2+2310*x^3+1800*x^4+276*x^5-72*x^6-12*x^7) else (-1200*x-192*x^2+2310*x^3+1800*x^4+276*x^5-72*x^6-12*x^7)) else (if s then (-96*x+1152*x^2+2694*x^3+1800*x^4+276*x^5-72*x^6-12*x^7) else (-192*x+1104*x^2+2694*x^3+1800*x^4+276*x^5-72*x^6-12*x^7))) else (if r then (if s then (96*x-384*x^2-906*x^3-600*x^4-204*x^5-72*x^6-12*x^7) else (-432*x^2-906*x^3-600*x^4-204*x^5-72*x^6-12*x^7)) else (if s then (96*x^2-42*x^3-312*x^4-204*x^5-72*x^6-12*x^7) else (-90*x^3-312*x^4-204*x^5-72*x^6-12*x^7)))) else (if q then (if r then (if s then (48*x-384*x^2-240*x^3+408*x^4+372*x^5+72*x^6-6*x^7) else (-384*x^2-240*x^3+408*x^4+372*x^5+72*x^6-6*x^7)) else (if s then (48*x^2+144*x^3+408*x^4+372*x^5+72*x^6-6*x^7) else (144*x^3+408*x^4+372*x^5+72*x^6-6*x^7))) else (if r then (if s then (48*x^2-96*x^3-264*x^4-108*x^5+72*x^6-6*x^7) else (-96*x^3-264*x^4-108*x^5+72*x^6-6*x^7)) else (if s then (48*x^3+24*x^4-108*x^5+72*x^6-6*x^7) else (24*x^4-108*x^5+72*x^6-6*x^7)))))

theorem h4local_closedM511 (x : ℝ) (hx : x≠0) (hh : x+1≠0) (p q r s : Bool) :
 hlocalFourM511 (hprojM13D x) p q r s=h4localNumM511 x p q r s/(x^3*(x+1)^8) := by
 cases p <;> cases q <;> cases r <;> cases s <;>
 norm_num only [hlocalFourM511,localFour01F,headRatioOne01F,headRatioTwo01F,
   headRatioThree01F,hprojM13D,h4localNumM511,Bool.false_eq_true,if_false,if_true,
   Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X,
   Polynomial.coeff_X_pow,Polynomial.coeff_one] <;>
 field_simp <;> ring

def h4valM511 (x a b q t u v w z : ℝ) : ℝ :=
 let f := hlocalFourM511 (hprojM13D x)
 b*f false false false false+boolMomentADB2 (fourTripleBE f) b a q t u+
 v*fourQuadBE f true false false true+
 w*(fourQuadBE f true true false true+fourQuadBE f true false true true)+
 z*fourQuadBE f true true true true

def h4numM511 (x a b q t u v w z : ℝ) : ℝ :=
 96*z-192*q*x-960*u*x+192*w*x+768*q*x^2-384*t*x^2-960*u*x^2+96*v*x^2+6*a*x^3+2304*q*x^3-768*t*x^3-240*a*x^4+24*b*x^4+2016*q*x^4+384*a*x^5-108*b*x^5-144*a*x^6+72*b*x^6-6*a*x^7-6*b*x^7

theorem h4val_closedM511 (x a b q t u v w z : ℝ) (hx : x≠0) (hh : x+1≠0) :
 h4valM511 x a b q t u v w z=h4numM511 x a b q t u v w z/(x^3*(x+1)^8) := by
 simp only [h4valM511,boolMomentADB2,boolJetADB2,fourTripleBE,fourQuadBE,
   fourCanonicalBE,fourPotentialBE,h4local_closedM511 x hx hh,h4localNumM511,h4numM511,
   Bool.false_eq_true,if_false,if_true]
 field_simp
 <;> ring

theorem h4source_valM511 (x : ℝ) (path : List Bool) :
 fourMomentBE (hlocalFourM511 (hprojM13D x)) (frame path).mid.b (frame path).mid.a=
 h4valM511 x (frame path).mid.a (frame path).mid.b
   (2*(frame path).mid.a-(frame path).mid.b:ℕ)
   (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ)
   (3*(frame path).mid.a-2*(frame path).mid.b:ℕ)
   (h4vM511 (frame path).mid.a (frame path).mid.b)
   (h4wM511 (frame path).mid.a (frame path).mid.b)
   (h4zM511 (frame path).mid.a (frame path).mid.b) := by
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 change fourMomentBE _ b a=h4valM511 x a b _ _ _ _ _ _
 unfold fourMomentBE fourSourceMoment897 h4valM511 h4vM511 h4wM511 h4zM511
 split_ifs <;> try omega
 all_goals first
 | (have hz : 4*a-3*b=0 := by omega; rw [hz]; simp)
 | simp
end
end MathGKM.Markov
