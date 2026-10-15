import MarkovNormalJetsFDDA
/-! Machine-authored live fddabb33. Exact algebraic normalization;
all generated identities are checked by Lean, not inferred from tests. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def normalHFDDA (N Z x : RunFieldBDEE) := normalJet31FDDA N Z x+normalJet20FDDA N Z x
def normalKFDDA (N Z x : RunFieldBDEE) := normalJet32FDDA N Z x+normalJet21FDDA N Z x
def normalFirstFDDA (N Z c r x : RunFieldBDEE) :=
 (c-r)*normalHFDDA N Z x+r*normalHFDDA (N+1) (Z*x) x-(1+x)
def normalSecondFDDA (N Z c r q x : RunFieldBDEE) :=
 let h₀ := normalHFDDA N Z x
 let h₁ := normalHFDDA (N+1) (Z*x) x
 let k₀ := normalKFDDA N Z x
 let k₁ := normalKFDDA (N+1) (Z*x) x
 let b := normalJet20FDDA N Z x
 let d := 2*Z*x
 2*((c-r)*k₀+r*k₁)+((c-r)*h₀+r*h₁)^2-((c-r)*h₀^2+r*h₁^2)+
 2*((x-1)*(c*b+r*d)+x*(c*b^2+2*r*b*d+q*d^2))-
 2*(1+x)*((c-r)*h₀+r*h₁-1-x)
def normalFirstNumFDDA (N Z c r x : RunFieldBDEE) : RunFieldBDEE :=
 -1 + 1*x + 1*x^2 + -1*x^3 + 1*r + 1*r*x + -1*r*x^2 + -1*r*x^3 + 1*c + -2*c*x + -3*c*x^2 + -4*Z*r*x^2 + 4*Z*r*x^3 + 4*Z*c*x^2 + 1*N*c + 1*N*c*x + -1*N*c*x^2 + -1*N*c*x^3
theorem normal_firstFDDA (N Z c r x : RunFieldBDEE) (hx : 1-x≠0) :
 (1-x)^2*normalFirstFDDA N Z c r x=normalFirstNumFDDA N Z c r x := by
 unfold normalFirstFDDA normalFirstNumFDDA normalHFDDA normalJet31FDDA normalJet20FDDA 
 field_simp
 <;> ring
def normalSecondNumFDDA (N Z c r q x : RunFieldBDEE) : RunFieldBDEE :=
 2 + -4*x + -2*x^2 + 8*x^3 + -2*x^4 + -4*x^5 + 2*x^6 + -3*r + -4*r*x + 1*r*x^2 + -1*r*x^4 + 4*r*x^5 + 3*r*x^6 + 1*r^2 + 2*r^2*x + -1*r^2*x^2 + -4*r^2*x^3 + -1*r^2*x^4 + 2*r^2*x^5 + 1*r^2*x^6 + -3*c + 12*c*x + 22*c*x^2 + 12*c*x^3 + 21*c*x^4 + 16*c*x^5 + 2*c*r + -2*c*r*x + -12*c*r*x^2 + -4*c*r*x^3 + 10*c*r*x^4 + 6*c*r*x^5 + 1*c^2 + -4*c^2*x + -2*c^2*x^2 + 12*c^2*x^3 + 9*c^2*x^4 + 40*Z*r*x^2 + -48*Z*r*x^3 + -32*Z*r*x^4 + 48*Z*r*x^5 + -8*Z*r*x^6 + -8*Z*r^2*x^2 + 16*Z*r^2*x^4 + -8*Z*r^2*x^6 + -40*Z*c*x^2 + -8*Z*c*x^3 + 8*Z*c*x^4 + -24*Z*c*x^5 + 32*Z*c*r*x^3 + -32*Z*c*r*x^5 + 8*Z*c^2*x^2 + -16*Z*c^2*x^3 + -24*Z*c^2*x^4 + 8*Z^2*q*x^3 + -32*Z^2*q*x^4 + 48*Z^2*q*x^5 + -32*Z^2*q*x^6 + 8*Z^2*q*x^7 + -16*Z^2*r*x^3 + 64*Z^2*r*x^4 + -48*Z^2*r*x^5 + 16*Z^2*r^2*x^4 + -32*Z^2*r^2*x^5 + 16*Z^2*r^2*x^6 + 8*Z^2*c*x^3 + -32*Z^2*c*x^4 + 8*Z^2*c*x^5 + -32*Z^2*c*r*x^4 + 32*Z^2*c*r*x^5 + 16*Z^2*c^2*x^4 + -3*N*c + -4*N*c*x + 1*N*c*x^2 + -1*N*c*x^4 + 4*N*c*x^5 + 3*N*c*x^6 + 2*N*c*r + 4*N*c*r*x + -2*N*c*r*x^2 + -8*N*c*r*x^3 + -2*N*c*r*x^4 + 4*N*c*r*x^5 + 2*N*c*r*x^6 + 2*N*c^2 + -2*N*c^2*x + -12*N*c^2*x^2 + -4*N*c^2*x^3 + 10*N*c^2*x^4 + 6*N*c^2*x^5 + 16*N*Z*r*x^2 + -32*N*Z*r*x^4 + 16*N*Z*r*x^6 + -16*N*Z*c*x^2 + -16*N*Z*c*x^3 + 16*N*Z*c*x^4 + 16*N*Z*c*x^5 + -8*N*Z*c*r*x^2 + 16*N*Z*c*r*x^4 + -8*N*Z*c*r*x^6 + 8*N*Z*c^2*x^2 + 8*N*Z*c^2*x^3 + -8*N*Z*c^2*x^4 + -8*N*Z*c^2*x^5 + 1*N^2*c^2 + 2*N^2*c^2*x + -1*N^2*c^2*x^2 + -4*N^2*c^2*x^3 + -1*N^2*c^2*x^4 + 2*N^2*c^2*x^5 + 1*N^2*c^2*x^6
theorem normal_secondFDDA (N Z c r q x : RunFieldBDEE) (hx : 1-x≠0) :
 (1-x)^4*normalSecondFDDA N Z c r q x=normalSecondNumFDDA N Z c r q x := by
 unfold normalSecondFDDA normalSecondNumFDDA normalHFDDA normalKFDDA normalJet31FDDA normalJet20FDDA normalJet32FDDA normalJet21FDDA
 field_simp
 <;> ring
end
end MathGKM.Markov
