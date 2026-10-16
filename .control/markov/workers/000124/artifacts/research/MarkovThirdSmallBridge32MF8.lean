import MarkovThirdThreeSourceMF8
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
def sThird32J0MF8 {R : Type*} [CommRing R] (q x : R) : R := 6*x+12*x^2+6*x^3
theorem sThird32block0MF8 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^4*sThird32J0MF8 q x=vJ0M115 3 1 0 0 0 q x+6*x^1*(1-x)^6 := by
 simp only [sThird32J0MF8,vJ0M115]
 ring
def sThird32J1MF8 {R : Type*} [CommRing R] (q x : R) : R := -24*x^2-288*x^3-192*x^4+24*q*x^2+24*q*x^3-48*q*x^4
theorem sThird32block1MF8 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^4*sThird32J1MF8 q x=vJ1M115 3 1 0 0 0 q x := by
 simp only [sThird32J1MF8,vJ1M115]
 ring
def sThird32J2MF8 {R : Type*} [CommRing R] (q x : R) : R := 288*x^3+1032*x^4+336*x^5+168*q*x^3+84*q*x^4-240*q*x^5-12*q*x^6+24*q^2*x^3-36*q^2*x^4+12*q^2*x^6
theorem sThird32block2MF8 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^4*sThird32J2MF8 q x=vJ2M115 3 1 0 0 0 q x := by
 simp only [sThird32J2MF8,vJ2M115]
 ring
def sThird32J3MF8 {R : Type*} [CommRing R] (q x : R) : R := -60*x^3-600*x^4-726*x^5+324*x^6-138*x^7+24*x^8-141*q*x^3-660*q*x^4+264*q*x^5+870*q*x^6-411*q*x^7+78*q*x^8-108*q^2*x^3-135*q^2*x^4+432*q^2*x^5+54*q^2*x^6-324*q^2*x^7+81*q^2*x^8-27*q^3*x^3+27*q^3*x^4+54*q^3*x^5-54*q^3*x^6-27*q^3*x^7+27*q^3*x^8
theorem sThird32block3MF8 {R : Type*} [CommRing R] (q x : R) :
 (1+x)^4*sThird32J3MF8 q x=vJ3M115 3 1 0 0 0 q x := by
 simp only [sThird32J3MF8,vJ3M115]
 ring

theorem sThird32sourceMF8 (n : ℕ) (rest : List Bool)
 (ha : (frame rest).mid.a=1) (hb : (frame rest).mid.b=3) :
 let path := List.replicate n false++true::rest
 (1-X)^6*(6*X^1*((frame path).mid.p).coeff 3)=
 sThird32J0MF8 (n+1:ℤ[X]) X+X^(n+1)*sThird32J1MF8 (n+1:ℤ[X]) X+
 X^(2*(n+1))*sThird32J2MF8 (n+1:ℤ[X]) X+X^(3*(n+1))*sThird32J3MF8 (n+1:ℤ[X]) X := by
 have hr : rest=[false] := frame_path_injective_098 (ha.trans (by decide)) (hb.trans (by decide))
 subst rest
 dsimp only
 have hf := vertical_three_clearedMF8 n false
 simp only [Bool.false_eq_true,if_false,if_true] at hf
 have hs := vThirdSeed_four_blocksM115 n [false]
 norm_num [frame,initial,advance,vThirdNumeratorM115] at hs
 have h0 := sThird32block0MF8 (n+1:ℤ[X]) X
 have h1 := sThird32block1MF8 (n+1:ℤ[X]) X
 have h2 := sThird32block2MF8 (n+1:ℤ[X]) X
 have h3 := sThird32block3MF8 (n+1:ℤ[X]) X
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero 4 hn)
 linear_combination (1-X)^6*hf+hs-h0-X^(n+1)*h1-X^(2*(n+1))*h2-X^(3*(n+1))*h3
end
end MathGKM.Markov
