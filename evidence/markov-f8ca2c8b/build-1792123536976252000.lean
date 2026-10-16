import MarkovThirdTwoSourceMF8
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option linter.unusedSimpArgs false
def sThird21J0MF8 {R : Type*} [CommRing R] (q x : R) : R := 0
def sThird21J1MF8 {R : Type*} [CommRing R] (q x : R) : R := -48*x^3-24*x^4+12*q*x^2-12*q*x^4
def sThird21J2MF8 {R : Type*} [CommRing R] (q x : R) : R := 72*x^3+240*x^4+72*x^5
def sThird21J3MF8 {R : Type*} [CommRing R] (q x : R) : R := -24*x^3-216*x^4-72*x^5-52*q*x^3-172*q*x^4+240*q*x^5-20*q*x^6+4*q*x^7-36*q^2*x^3+120*q^2*x^5-96*q^2*x^6+12*q^2*x^7-8*q^3*x^3+16*q^3*x^4-16*q^3*x^6+8*q^3*x^7

theorem sThird21blocksMF8 {R : Type*} [CommRing R] (q x t : R) :
 (1+x)^5*(sThird21J0MF8 q x+t*sThird21J1MF8 q x+t^2*sThird21J2MF8 q x+t^3*sThird21J3MF8 q x)=
 vJ0M115 2 1 0 0 0 q x+t*vJ1M115 2 1 0 0 0 q x+
 t^2*vJ2M115 2 1 0 0 0 q x+t^3*vJ3M115 2 1 0 0 0 q x+6*vTwoSparseMF8 q x t := by
 simp only [sThird21J0MF8,sThird21J1MF8,sThird21J2MF8,sThird21J3MF8,
   vJ0M115,vJ1M115,vJ2M115,vJ3M115,vTwoSparseMF8]
 ring

theorem sThird21sourceMF8 (n : ℕ) :
 let path := List.replicate n false++[true]
 (1-X)^6*(6*X^(n+3)*((frame path).mid.p).coeff 3)=
 sThird21J0MF8 (n+1:ℤ[X]) X+X^(n+1)*sThird21J1MF8 (n+1:ℤ[X]) X+
 X^(2*(n+1))*sThird21J2MF8 (n+1:ℤ[X]) X+X^(3*(n+1))*sThird21J3MF8 (n+1:ℤ[X]) X := by
 dsimp only
 have hf := vertical_two_third_clearedMF8 n
 dsimp only at hf
 have hs := vThirdSeed_four_blocksM115 n []
 norm_num [frame,initial,vThirdNumeratorM115] at hs
 have hc := vTwoCorrection_sparseMF8 n
 have hb := sThird21blocksMF8 (n+1:ℤ[X]) X (X^(n+1))
 rw [←pow_mul,←pow_mul] at hb
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero 5 hn)
 simp only [mul_comm (n+1) 2,mul_comm (n+1) 3] at hb
 linear_combination (1-X)^6*hf+hs+6*hc-hb
end
end MathGKM.Markov
