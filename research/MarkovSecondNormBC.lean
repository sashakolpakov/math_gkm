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

def secondNumBC {A : Type*} [CommRing A] (N Z C R Q x : A) : A :=
 2 + -4*x + -2*x^2 + 8*x^3 + -2*x^4 + -4*x^5 + 2*x^6 + -3*R + -4*R*x + 1*R*x^2 + -1*R*x^4 + 4*R*x^5 + 3*R*x^6 + 1*R^2 + 2*R^2*x + -1*R^2*x^2 + -4*R^2*x^3 + -1*R^2*x^4 + 2*R^2*x^5 + 1*R^2*x^6 + -3*C + 12*C*x + 22*C*x^2 + 12*C*x^3 + 21*C*x^4 + 16*C*x^5 + 2*C*R + -2*C*R*x + -12*C*R*x^2 + -4*C*R*x^3 + 10*C*R*x^4 + 6*C*R*x^5 + 1*C^2 + -4*C^2*x + -2*C^2*x^2 + 12*C^2*x^3 + 9*C^2*x^4 + 40*Z*R*x^2 + -48*Z*R*x^3 + -32*Z*R*x^4 + 48*Z*R*x^5 + -8*Z*R*x^6 + -8*Z*R^2*x^2 + 16*Z*R^2*x^4 + -8*Z*R^2*x^6 + -40*Z*C*x^2 + -8*Z*C*x^3 + 8*Z*C*x^4 + -24*Z*C*x^5 + 32*Z*C*R*x^3 + -32*Z*C*R*x^5 + 8*Z*C^2*x^2 + -16*Z*C^2*x^3 + -24*Z*C^2*x^4 + 8*Z^2*Q*x^3 + -32*Z^2*Q*x^4 + 48*Z^2*Q*x^5 + -32*Z^2*Q*x^6 + 8*Z^2*Q*x^7 + -16*Z^2*R*x^3 + 64*Z^2*R*x^4 + -48*Z^2*R*x^5 + 16*Z^2*R^2*x^4 + -32*Z^2*R^2*x^5 + 16*Z^2*R^2*x^6 + 8*Z^2*C*x^3 + -32*Z^2*C*x^4 + 8*Z^2*C*x^5 + -32*Z^2*C*R*x^4 + 32*Z^2*C*R*x^5 + 16*Z^2*C^2*x^4 + -3*N*C + -4*N*C*x + 1*N*C*x^2 + -1*N*C*x^4 + 4*N*C*x^5 + 3*N*C*x^6 + 2*N*C*R + 4*N*C*R*x + -2*N*C*R*x^2 + -8*N*C*R*x^3 + -2*N*C*R*x^4 + 4*N*C*R*x^5 + 2*N*C*R*x^6 + 2*N*C^2 + -2*N*C^2*x + -12*N*C^2*x^2 + -4*N*C^2*x^3 + 10*N*C^2*x^4 + 6*N*C^2*x^5 + 16*N*Z*R*x^2 + -32*N*Z*R*x^4 + 16*N*Z*R*x^6 + -16*N*Z*C*x^2 + -16*N*Z*C*x^3 + 16*N*Z*C*x^4 + 16*N*Z*C*x^5 + -8*N*Z*C*R*x^2 + 16*N*Z*C*R*x^4 + -8*N*Z*C*R*x^6 + 8*N*Z*C^2*x^2 + 8*N*Z*C^2*x^3 + -8*N*Z*C^2*x^4 + -8*N*Z*C^2*x^5 + 1*N^2*C^2 + 2*N^2*C^2*x + -1*N^2*C^2*x^2 + -4*N^2*C^2*x^3 + -1*N^2*C^2*x^4 + 2*N^2*C^2*x^5 + 1*N^2*C^2*x^6
theorem second_normalizeBC (n c r : ℕ) (hc : 5≤c) :
 (1-runXBDEE)^4*closedSecondBDEE n c r=
 secondNumBC (n:RunFieldBDEE) (runXBDEE^n) c r (2*r-c:ℕ) runXBDEE := by
 unfold closedSecondBDEE closedHBDEE closedKBDEE
 rw [if_neg (by omega : ¬c=2)]
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,secondNumBC]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
