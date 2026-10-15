import MarkovInteriorSourceFDDA
/-! Machine-authored fd72158c: exact small-run coefficient identity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
def small3_0FD (c r q t u : ℤ) : ℤ :=
 -6 + 11*r + -6*r^2 + 1*r^3 + 44*c + -48*c*r + 12*c*r^2 + -96*c^2 + 48*c^2*r + 64*c^3
def small3_1FD (c r q t u : ℤ) : ℤ :=
 -18 + 87*r + -54*r^2 + 9*r^3 + 258*c + -375*c*r + 99*c*r^2 + -636*c^2 + 360*c^2*r + 432*c^3
def small3_2FD (c r q t u : ℤ) : ℤ :=
 -18 + 393*r + -246*r^2 + 39*r^3 + 825*c + -1473*c*r + 390*c*r^2 + -2073*c^2 + 1275*c^2*r + 1356*c^3
def small3_3FD (c r q t u : ℤ) : ℤ :=
 -6 + 1365*r + -774*r^2 + 111*r^3 + 1911*c + -3960*c*r + 999*c*r^2 + -4434*c^2 + 2889*c^2*r + 2649*c^3
def small3_4FD (c r q t u : ℤ) : ℤ :=
 3936*r + -1920*r^2 + 240*r^3 + 3048*c + -8244*c*r + 1920*c*r^2 + -6624*c^2 + 4788*c^2*r + 3576*c^3
def small3_5FD (c r q t u : ℤ) : ℤ :=
 8112*r + -3756*r^2 + 420*r^3 + 3096*c + -13224*c*r + 2940*c*r^2 + -6900*c^2 + 6132*c^2*r + 3468*c^3
def small3_6FD (c r q t u : ℤ) : ℤ :=
 11432*r + -5676*r^2 + 604*r^3 + 1720*c + -15804*c*r + 3624*c*r^2 + -4872*c^2 + 6108*c^2*r + 2432*c^3
def small3_7FD (c r q t u : ℤ) : ℤ :=
 11256*r + -6720*r^2 + 720*r^3 + -48*c + -13800*c*r + 3600*c*r^2 + -2064*c^2 + 4656*c^2*r + 1200*c^3
def small3_8FD (c r q t u : ℤ) : ℤ :=
 7416*r + -6336*r^2 + 720*r^3 + -840*c + -8328*c*r + 2880*c*r^2 + -264*c^2 + 2592*c^2*r + 384*c^3
def small3_9FD (c r q t u : ℤ) : ℤ :=
 -456*q + 2888*r + 24*r*q + -4464*r^2 + 592*r^3 + -568*c + 96*c*q + -3072*c*r + 1776*c*r^2 + 192*c^2 + 960*c^2*r + 64*c^3
def small3_10FD (c r q t u : ℤ) : ℤ :=
 -1032*q + 456*r + 72*r*q + -2112*r^2 + 384*r^3 + -144*c + 216*c*q + -480*c*r + 768*c*r^2 + 96*c^2 + 192*c^2*r
def small3_11FD (c r q t u : ℤ) : ℤ :=
 -960*q + -120*r + 96*r*q + -576*r^2 + 192*r^3 + 24*c + 192*c*q + 96*c*r + 192*c*r^2
def small3_12FD (c r q t u : ℤ) : ℤ :=
 -576*q + 8*r + 96*r*q + 64*r^3 + 96*c*q
def small3_13FD (c r q t u : ℤ) : ℤ :=
 24*t + -144*q + 96*r*q
def small3_14FD (c r q t u : ℤ) : ℤ :=
 24*u
def smallCoeff3FD (c r q t u : ℤ) : ℕ → ℤ
 | 0 => small3_0FD c r q t u
 | 1 => small3_1FD c r q t u
 | 2 => small3_2FD c r q t u
 | 3 => small3_3FD c r q t u
 | 4 => small3_4FD c r q t u
 | 5 => small3_5FD c r q t u
 | 6 => small3_6FD c r q t u
 | 7 => small3_7FD c r q t u
 | 8 => small3_8FD c r q t u
 | 9 => small3_9FD c r q t u
 | 10 => small3_10FD c r q t u
 | 11 => small3_11FD c r q t u
 | 12 => small3_12FD c r q t u
 | 13 => small3_13FD c r q t u
 | 14 => small3_14FD c r q t u
 | _ => 0
def smallPoly3FD (c r q t u : ℤ) : ℤ[X] :=
 C (small3_0FD c r q t u)*X^0+C (small3_1FD c r q t u)*X^1+C (small3_2FD c r q t u)*X^2+C (small3_3FD c r q t u)*X^3+C (small3_4FD c r q t u)*X^4+C (small3_5FD c r q t u)*X^5+C (small3_6FD c r q t u)*X^6+C (small3_7FD c r q t u)*X^7+C (small3_8FD c r q t u)*X^8+C (small3_9FD c r q t u)*X^9+C (small3_10FD c r q t u)*X^10+C (small3_11FD c r q t u)*X^11+C (small3_12FD c r q t u)*X^12+C (small3_13FD c r q t u)*X^13+C (small3_14FD c r q t u)*X^14
theorem small_factor3FD (c r q t u : ℤ) :
 (1-X)^6*smallPoly3FD c r q t u=
 normalBand0FDDA (3:ℤ[X]) c r q t u X+
 X^5*(normalTail1FDDA (3:ℤ[X]) c r q t u X+
 X^4*normalTail2FDDA (3:ℤ[X]) c r q t u X+
 X^8*normalTail3FDDA (3:ℤ[X]) c r q t u X) := by
 simp only [smallPoly3FD,normalBand0FDDA,normalTail1FDDA,normalTail2FDDA,normalTail3FDDA,
 small3_0FD,small3_1FD,small3_2FD,small3_3FD,small3_4FD,small3_5FD,small3_6FD,small3_7FD,small3_8FD,small3_9FD,small3_10FD,small3_11FD,small3_12FD,small3_13FD,small3_14FD,map_add,map_mul,map_pow,map_neg,map_ofNat,map_one]
 rw [show (C c:ℤ[X])=c from Polynomial.C_eq_intCast c,
   show (C r:ℤ[X])=r from Polynomial.C_eq_intCast r,
   show (C q:ℤ[X])=q from Polynomial.C_eq_intCast q,
   show (C t:ℤ[X])=t from Polynomial.C_eq_intCast t,
   show (C u:ℤ[X])=u from Polynomial.C_eq_intCast u]
 ring
end
end MathGKM.Markov
