import MarkovTerminalAlgebraE2
import MarkovCrossTail53D
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedVariables false
def fourthPolyCoeff0E2 (c r q t u : ℤ) : ℤ :=
 24*t + 48*q + -72*r + 24*c
def fourthPolyCoeff1E2 (c r q t u : ℤ) : ℤ :=
 24*u + -144*t + -480*q + 744*r + -96*r*q + 192*r^2 + -288*c + 96*c*q + -288*c*r + 96*c^2
def fourthPolyCoeff2E2 (c r q t u : ℤ) : ℤ :=
 -144*u + 360*t + 1296*q + -1808*r + 480*r*q + -960*r^2 + -64*r^3 + 656*c + -384*c*q + 1248*c*r + 192*c*r^2 + -384*c^2 + -192*c^2*r + 64*c^3
def fourthPolyCoeff3E2 (c r q t u : ℤ) : ℤ :=
 360*u + -480*t + -1344*q + 1296*r + -960*r*q + 1344*r^2 + 192*r^3 + -288*c + 576*c*q + -1056*c*r + -384*c*r^2 + 96*c^2 + 192*c^2*r
def fourthPolyCoeff4E2 (c r q t u : ℤ) : ℤ :=
 -480*u + 360*t + 336*q + -168*r + 960*r*q + -576*r^2 + -192*r^3 + 24*c + -384*c*q + 96*c*r + 192*c*r^2
def fourthPolyCoeff5E2 (c r q t u : ℤ) : ℤ :=
 360*u + -144*t + 288*q + 8*r + -480*r*q + 64*r^3 + 96*c*q
def fourthPolyCoeff6E2 (c r q t u : ℤ) : ℤ :=
 -144*u + 24*t + -144*q + 96*r*q
def fourthPolyCoeff7E2 (c r q t u : ℤ) : ℤ :=
 24*u
def fourthPolyE2 (c r q t u : ℤ) : ℤ[X] :=
 C (fourthPolyCoeff0E2 c r q t u)*X^0+C (fourthPolyCoeff1E2 c r q t u)*X^1+C (fourthPolyCoeff2E2 c r q t u)*X^2+C (fourthPolyCoeff3E2 c r q t u)*X^3+C (fourthPolyCoeff4E2 c r q t u)*X^4+C (fourthPolyCoeff5E2 c r q t u)*X^5+C (fourthPolyCoeff6E2 c r q t u)*X^6+C (fourthPolyCoeff7E2 c r q t u)*X^7
theorem fourth_polyE2 (n c r q t u : ℤ) :
 normalTail3FDDA (n:ℤ[X]) c r q t u X=fourthPolyE2 c r q t u := by
 simp only [normalTail3FDDA,fourthPolyE2,fourthPolyCoeff0E2,fourthPolyCoeff1E2,fourthPolyCoeff2E2,fourthPolyCoeff3E2,fourthPolyCoeff4E2,fourthPolyCoeff5E2,fourthPolyCoeff6E2,fourthPolyCoeff7E2,
   map_add,map_mul,map_pow,map_neg,map_ofNat,Polynomial.C_eq_intCast]
 ring
theorem fourth_series0E2 (n c r : ℕ) :
 PowerSeries.coeff 0 (inverseSixFDDA*(thirdR53D n c r:PowerSeries ℤ))=
 fourthCoeff0E2 c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) := by
 have hp := fourth_polyE2 n c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)
 simp only [Int.cast_natCast] at hp
 unfold thirdR53D
 rw [hp]
 simp only [fourthPolyE2,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
 norm_num [Nat.choose,fourthPolyCoeff0E2,fourthCoeff0E2]
theorem fourth_series1E2 (n c r : ℕ) :
 PowerSeries.coeff 1 (inverseSixFDDA*(thirdR53D n c r:PowerSeries ℤ))=
 6*fourthCoeff0E2 c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ)+
 fourthCoeff1E2 c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) := by
 have hp := fourth_polyE2 n c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)
 simp only [Int.cast_natCast] at hp
 unfold thirdR53D
 rw [hp]
 simp only [fourthPolyE2,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
 norm_num [Nat.choose,fourthPolyCoeff0E2,fourthPolyCoeff1E2,fourthCoeff0E2,fourthCoeff1E2]
 <;> ring
end
end MathGKM.Markov
