import MarkovThirdThreeSourceMF8
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
def sThird31J0MF8 {R : Type*} [CommRing R] (q x : R) : R := 6*x^2+12*x^3+6*x^4
theorem sThird31block0MF8 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^4*sThird31J0MF8 q x=vJ0M115 3 2 1 1 0 q x+6*x^2*(1-x)^6 := by
 simp only [sThird31J0MF8,vJ0M115]
 ring
def sThird31J1MF8 {R : Type*} [CommRing R] (q x : R) : R := -96*x^3-336*x^4-72*x^5+48*q*x^3-24*q*x^4-24*q*x^5
theorem sThird31block1MF8 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^4*sThird31J1MF8 q x=vJ1M115 3 2 1 1 0 q x := by
 simp only [sThird31J1MF8,vJ1M115]
 ring
def sThird31J2MF8 {R : Type*} [CommRing R] (q x : R) : R := 72*x^3+816*x^4+720*x^5+48*x^6+60*q*x^3+240*q*x^4-228*q*x^5-72*q*x^6+12*q^2*x^3-36*q^2*x^5+24*q^2*x^6
theorem sThird31block2MF8 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^4*sThird31J2MF8 q x=vJ2M115 3 2 1 1 0 q x := by
 simp only [sThird31J2MF8,vJ2M115]
 ring
def sThird31J3MF8 {R : Type*} [CommRing R] (q x : R) : R := -24*x^3-396*x^4-768*x^5+42*x^6-36*x^7+6*x^8-78*q*x^3-561*q*x^4-6*q*x^5+816*q*x^6-204*q*x^7+33*q*x^8-81*q^2*x^3-162*q^2*x^4+378*q^2*x^5+108*q^2*x^6-297*q^2*x^7+54*q^2*x^8-27*q^3*x^3+27*q^3*x^4+54*q^3*x^5-54*q^3*x^6-27*q^3*x^7+27*q^3*x^8
theorem sThird31block3MF8 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^4*sThird31J3MF8 q x=vJ3M115 3 2 1 1 0 q x := by
 simp only [sThird31J3MF8,vJ3M115]
 ring

theorem sThird31sourceMF8 (n : ℕ) (rest : List Bool)
 (ha : (frame rest).mid.a=2) (hb : (frame rest).mid.b=3) :
 let path := List.replicate n false++true::rest
 (1-X)^6*(6*X^2*((frame path).mid.p).coeff 3)=
 sThird31J0MF8 (n+1:ℤ[X]) X+X^(n+1)*sThird31J1MF8 (n+1:ℤ[X]) X+
 X^(2*(n+1))*sThird31J2MF8 (n+1:ℤ[X]) X+X^(3*(n+1))*sThird31J3MF8 (n+1:ℤ[X]) X := by
 have hr : rest=[true] := frame_path_injective_098 (ha.trans (by decide)) (hb.trans (by decide))
 subst rest
 dsimp only
 have hf := vertical_three_clearedMF8 n true
 simp only [Bool.false_eq_true,if_false,if_true] at hf
 have hs := vThirdSeed_four_blocksM115 n [true]
 norm_num [frame,initial,advance,vThirdNumeratorM115] at hs
 have h0 := sThird31block0MF8 (n+1:ℤ[X]) X
 have h1 := sThird31block1MF8 (n+1:ℤ[X]) X
 have h2 := sThird31block2MF8 (n+1:ℤ[X]) X
 have h3 := sThird31block3MF8 (n+1:ℤ[X]) X
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero 4 hn)
 linear_combination (1-X)^6*hf+hs-h0-X^(n+1)*h1-X^(2*(n+1))*h2-X^(3*(n+1))*h3
end
end MathGKM.Markov
