import MarkovFourthLocal01F
import MarkovBooleanJets6905
/-! Machine-authored 01f51d63. A checked Boolean coboundary certificate.
The source-specific cyclic counts are a separate obligation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
variable {R : Type*} [CommRing R]
def fourthLocalBoolean01F (y : R) (p q r s t : Bool) : R :=
 let r1 := (1:R)
 let r2 := localB26905 y r+localA6905 y r-localD6905 y q r
 let r3 := localA6905 y r*(localB26905 y s+localA6905 y s-localD6905 y r s)-
   y*localB26905 y r-(localB26905 y r+localA6905 y r)*localD6905 y q r+
   (localD6905 y q r)^2-localD26905 y q r-localC6905 y q r
 let d := localD6905 y p q
 let g2 := localD26905 y p q+localC6905 y p q*r1
 let g3 := localC6905 y p q*r2+localC26905 y p q*r1
 let g4 := localC6905 y p q*r3+localC26905 y p q*r2
 24*g4-24*d*g3-12*g2^2+24*d^2*g2-6*d^4
def fourthPotential01F (y : R) (p q r s : Bool) : R :=
 (-48*y + 144*y^2 + -96*y^3)*bit6905 p + (-6 + -144*y + 384*y^2 + 48*y^3 + 54*y^4)*bit6905 q + (-6 + -144*y + 384*y^2 + -240*y^3 + -42*y^4)*bit6905 r + (-6 + -144*y + 384*y^2 + -240*y^3 + 6*y^4)*bit6905 s + (1440*y^3 + 2016*y^4 + 768*y^5 + -192*y^6)*bit6905 p*bit6905 q + (2016*y^3 + 2352*y^4 + 720*y^5 + -192*y^6)*bit6905 q*bit6905 r + (2016*y^3 + 2304*y^4 + 768*y^5 + -192*y^6)*bit6905 r*bit6905 s + (-672*y^4 + -384*y^5)*bit6905 p*bit6905 r + (-768*y^4 + -384*y^5)*bit6905 q*bit6905 s + (96*y^5)*bit6905 p*bit6905 s + (672*y^4 + -480*y^5 + -960*y^6)*bit6905 p*bit6905 q*bit6905 r + (768*y^4 + -576*y^5 + -960*y^6)*bit6905 q*bit6905 r*bit6905 s + (-96*y^5 + 96*y^6)*bit6905 p*bit6905 q*bit6905 s + (-96*y^5 + 96*y^6)*bit6905 p*bit6905 r*bit6905 s + (96*y^5 + -192*y^6 + 96*y^7)*bit6905 p*bit6905 q*bit6905 r*bit6905 s
def fourthCanonical01F (y : R) (q r s t : Bool) : R :=
 (-6 + 72*y + -108*y^2 + 24*y^3) + (-6 + -144*y + 384*y^2 + -240*y^3 + 6*y^4)*bit6905 t + (2016*y^3 + 2304*y^4 + 768*y^5 + -192*y^6)*bit6905 s*bit6905 t + (-768*y^4 + -384*y^5)*bit6905 r*bit6905 t + (96*y^5)*bit6905 q*bit6905 t + (768*y^4 + -576*y^5 + -960*y^6)*bit6905 r*bit6905 s*bit6905 t + (-96*y^5 + 96*y^6)*bit6905 q*bit6905 r*bit6905 t + (-96*y^5 + 96*y^6)*bit6905 q*bit6905 s*bit6905 t + (96*y^5 + -192*y^6 + 96*y^7)*bit6905 q*bit6905 r*bit6905 s*bit6905 t
theorem fourth_boolean_coboundary01F (y : R) (p q r s t : Bool) :
 fourthLocalBoolean01F y p q r s t=fourthCanonical01F y q r s t+
 fourthPotential01F y p q r s-fourthPotential01F y q r s t := by
 cases p <;> cases q <;> cases r <;> cases s <;> cases t <;>
   simp only [fourthLocalBoolean01F,fourthCanonical01F,fourthPotential01F,
     localD6905,localA6905,localB26905,localD26905,localC6905,localC26905,
     bit6905,Bool.false_eq_true,if_false,if_true] <;> ring
end
end MathGKM.Markov
