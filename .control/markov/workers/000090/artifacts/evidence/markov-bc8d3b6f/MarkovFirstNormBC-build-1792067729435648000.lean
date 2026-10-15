import MarkovJetNorm0BC
import MarkovJetNorm1BC
import MarkovJetNorm2BC
import MarkovJetNorm3BC
/-! Machine-authored bc8d3b6f. Exact normalization candidates; validated separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def firstNumBC {A : Type*} [CommRing A] (N Z C R Q x : A) : A :=
 -1 + 1*x + 1*x^2 + -1*x^3 + 1*R + 1*R*x + -1*R*x^2 + -1*R*x^3 + 1*C + -2*C*x + -3*C*x^2 + -4*Z*R*x^2 + 4*Z*R*x^3 + 4*Z*C*x^2 + 1*N*C + 1*N*C*x + -1*N*C*x^2 + -1*N*C*x^3
theorem first_normalizeBC (n c r : ℕ) (hc : 5≤c) :
 (1-runXBDEE)^2*closedFirstBDEE n c r=
 firstNumBC (n:RunFieldBDEE) (runXBDEE^n) c r (2*r-c:ℕ) runXBDEE := by
 unfold closedFirstBDEE closedHBDEE 
 
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,firstNumBC]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
