import MarkovVerticalInverseM758
import MarkovVerticalSmallSourceM758
/-! Machine-authored ead8a96f. Exact small-column sparse quotient blocks. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

theorem vFall_shiftMEA (j m q k : ℤ) :
 vFallM758 j (m+q+k)=vFallM758 (j-m-q) k := by
 unfold vFallM758
 split_ifs <;> first | omega | ring

def s21J0MEA {R : Type*} [CommRing R] (q x : R) : R := 2*x+2*x^2

def s21c0_1MEA (q : ℤ) : ℤ := 2

def s21c0_2MEA (q : ℤ) : ℤ := 2

def s21J1MEA {R : Type*} [CommRing R] (q x : R) : R := -16*x^2-16*x^3

def s21c1_2MEA (q : ℤ) : ℤ := -16

def s21c1_3MEA (q : ℤ) : ℤ := -16

def s21J2MEA {R : Type*} [CommRing R] (q x : R) : R := 6*x^2+28*x^3-8*x^4+2*x^5+10*q*x^2+10*q*x^3-26*q*x^4+6*q*x^5+4*q^2*x^2-4*q^2*x^3-4*q^2*x^4+4*q^2*x^5

def s21c2_2MEA (q : ℤ) : ℤ := 6+10*q+4*q^2

def s21c2_3MEA (q : ℤ) : ℤ := 28+10*q-4*q^2

def s21c2_4MEA (q : ℤ) : ℤ := -8-26*q-4*q^2

def s21c2_5MEA (q : ℤ) : ℤ := 2+6*q+4*q^2

def s21EMEA (q j : ℤ) : ℤ :=
 s21c0_1MEA q*vFallM758 (j-0*q) 1+
 s21c0_2MEA q*vFallM758 (j-0*q) 2+
 s21c1_2MEA q*vFallM758 (j-1*q) 2+
 s21c1_3MEA q*vFallM758 (j-1*q) 3+
 s21c2_2MEA q*vFallM758 (j-2*q) 2+
 s21c2_3MEA q*vFallM758 (j-2*q) 3+
 s21c2_4MEA q*vFallM758 (j-2*q) 4+
 s21c2_5MEA q*vFallM758 (j-2*q) 5

theorem s21block0MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^3*s21J0MEA q x = vH0M758 2 1 0 q x+2*x*(1-x)^4 := by
 simp only [s21J0MEA,vH0M758]; ring

theorem s21block1MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^3*s21J1MEA q x = vH1M758 2 1 0 q x := by
 simp only [s21J1MEA,vH1M758]; ring

theorem s21block2MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^3*s21J2MEA q x = vH2M758 2 1 0 q x := by
 simp only [s21J2MEA,vH2M758]; ring

theorem s21coeffMEA (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^4*P=X^m*(s21J0MEA (q:ℤ[X]) X+
   X^q*s21J1MEA (q:ℤ[X]) X+X^(2*q)*s21J2MEA (q:ℤ[X]) X)) :
 6*P.coeff j=s21EMEA q ((j:ℤ)-m) := by
 have hp : X^m*(s21J0MEA (q:ℤ[X]) X+
   X^q*s21J1MEA (q:ℤ[X]) X+X^(2*q)*s21J2MEA (q:ℤ[X]) X)=
 C (s21c0_1MEA q)*X^(m+0*q+1) +
 C (s21c0_2MEA q)*X^(m+0*q+2) +
 C (s21c1_2MEA q)*X^(m+1*q+2) +
 C (s21c1_3MEA q)*X^(m+1*q+3) +
 C (s21c2_2MEA q)*X^(m+2*q+2) +
 C (s21c2_3MEA q)*X^(m+2*q+3) +
 C (s21c2_4MEA q)*X^(m+2*q+4) +
 C (s21c2_5MEA q)*X^(m+2*q+5) := by
   simp only [s21J0MEA,s21J1MEA,s21J2MEA,s21c0_1MEA,s21c0_2MEA,s21c1_2MEA,s21c1_3MEA,s21c2_2MEA,s21c2_3MEA,s21c2_4MEA,s21c2_5MEA,
     map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Int.cast_natCast,pow_add,pow_mul]
   ring
 rw [hp] at h
 have hc := coeff_of_one_sub_mul_rangeBC _ _ 3 j h
 change P.coeff j=vInvM758 _ j at hc
 rw [hc]
 simp only [vInv_addM758,mul_add,vInv_monomialM758]
 simp only [s21EMEA,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,
   Nat.cast_one,Nat.cast_zero,vFall_shiftMEA]

def s31J0MEA {R : Type*} [CommRing R] (q x : R) : R := 16*x^2+8*x^3

def s31c0_2MEA (q : ℤ) : ℤ := 16

def s31c0_3MEA (q : ℤ) : ℤ := 8

def s31J1MEA {R : Type*} [CommRing R] (q x : R) : R := -16*x^2-88*x^3-16*x^4-8*q*x^2-8*q*x^3+16*q*x^4

def s31c1_2MEA (q : ℤ) : ℤ := -16-8*q

def s31c1_3MEA (q : ℤ) : ℤ := -88-8*q

def s31c1_4MEA (q : ℤ) : ℤ := -16+16*q

def s31J2MEA {R : Type*} [CommRing R] (q x : R) : R := 6*x^2+56*x^3+52*x^4-24*x^5+6*x^6+15*q*x^2+48*q*x^3-30*q*x^4-48*q*x^5+15*q*x^6+9*q^2*x^2-18*q^2*x^4+9*q^2*x^6

def s31c2_2MEA (q : ℤ) : ℤ := 6+15*q+9*q^2

def s31c2_3MEA (q : ℤ) : ℤ := 56+48*q

def s31c2_4MEA (q : ℤ) : ℤ := 52-30*q-18*q^2

def s31c2_5MEA (q : ℤ) : ℤ := -24-48*q

def s31c2_6MEA (q : ℤ) : ℤ := 6+15*q+9*q^2

def s31EMEA (q j : ℤ) : ℤ :=
 s31c0_2MEA q*vFallM758 (j-0*q) 2+
 s31c0_3MEA q*vFallM758 (j-0*q) 3+
 s31c1_2MEA q*vFallM758 (j-1*q) 2+
 s31c1_3MEA q*vFallM758 (j-1*q) 3+
 s31c1_4MEA q*vFallM758 (j-1*q) 4+
 s31c2_2MEA q*vFallM758 (j-2*q) 2+
 s31c2_3MEA q*vFallM758 (j-2*q) 3+
 s31c2_4MEA q*vFallM758 (j-2*q) 4+
 s31c2_5MEA q*vFallM758 (j-2*q) 5+
 s31c2_6MEA q*vFallM758 (j-2*q) 6

theorem s31block0MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*s31J0MEA q x = vH0M758 3 1 0 q x := by
 simp only [s31J0MEA,vH0M758]; ring

theorem s31block1MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*s31J1MEA q x = vH1M758 3 1 0 q x := by
 simp only [s31J1MEA,vH1M758]; ring

theorem s31block2MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*s31J2MEA q x = vH2M758 3 1 0 q x := by
 simp only [s31J2MEA,vH2M758]; ring

theorem s31coeffMEA (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^4*P=X^m*(s31J0MEA (q:ℤ[X]) X+
   X^q*s31J1MEA (q:ℤ[X]) X+X^(2*q)*s31J2MEA (q:ℤ[X]) X)) :
 6*P.coeff j=s31EMEA q ((j:ℤ)-m) := by
 have hp : X^m*(s31J0MEA (q:ℤ[X]) X+
   X^q*s31J1MEA (q:ℤ[X]) X+X^(2*q)*s31J2MEA (q:ℤ[X]) X)=
 C (s31c0_2MEA q)*X^(m+0*q+2) +
 C (s31c0_3MEA q)*X^(m+0*q+3) +
 C (s31c1_2MEA q)*X^(m+1*q+2) +
 C (s31c1_3MEA q)*X^(m+1*q+3) +
 C (s31c1_4MEA q)*X^(m+1*q+4) +
 C (s31c2_2MEA q)*X^(m+2*q+2) +
 C (s31c2_3MEA q)*X^(m+2*q+3) +
 C (s31c2_4MEA q)*X^(m+2*q+4) +
 C (s31c2_5MEA q)*X^(m+2*q+5) +
 C (s31c2_6MEA q)*X^(m+2*q+6) := by
   simp only [s31J0MEA,s31J1MEA,s31J2MEA,s31c0_2MEA,s31c0_3MEA,s31c1_2MEA,s31c1_3MEA,s31c1_4MEA,s31c2_2MEA,s31c2_3MEA,s31c2_4MEA,s31c2_5MEA,s31c2_6MEA,
     map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Int.cast_natCast,pow_add,pow_mul]
   ring
 rw [hp] at h
 have hc := coeff_of_one_sub_mul_rangeBC _ _ 3 j h
 change P.coeff j=vInvM758 _ j at hc
 rw [hc]
 simp only [vInv_addM758,mul_add,vInv_monomialM758]
 simp only [s31EMEA,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,
   Nat.cast_one,Nat.cast_zero,vFall_shiftMEA]

def s32J0MEA {R : Type*} [CommRing R] (q x : R) : R := 8*x+16*x^2

def s32c0_1MEA (q : ℤ) : ℤ := 8

def s32c0_2MEA (q : ℤ) : ℤ := 16

def s32J1MEA {R : Type*} [CommRing R] (q x : R) : R := -48*x^2-72*x^3-16*q*x^2+8*q*x^3+8*q*x^4

def s32c1_2MEA (q : ℤ) : ℤ := -48-16*q

def s32c1_3MEA (q : ℤ) : ℤ := -72+8*q

def s32c1_4MEA (q : ℤ) : ℤ := 8*q

def s32J2MEA {R : Type*} [CommRing R] (q x : R) : R := 12*x^2+72*x^3+40*x^4-40*x^5+12*x^6+21*q*x^2+48*q*x^3-42*q*x^4-48*q*x^5+21*q*x^6+9*q^2*x^2-18*q^2*x^4+9*q^2*x^6

def s32c2_2MEA (q : ℤ) : ℤ := 12+21*q+9*q^2

def s32c2_3MEA (q : ℤ) : ℤ := 72+48*q

def s32c2_4MEA (q : ℤ) : ℤ := 40-42*q-18*q^2

def s32c2_5MEA (q : ℤ) : ℤ := -40-48*q

def s32c2_6MEA (q : ℤ) : ℤ := 12+21*q+9*q^2

def s32EMEA (q j : ℤ) : ℤ :=
 s32c0_1MEA q*vFallM758 (j-0*q) 1+
 s32c0_2MEA q*vFallM758 (j-0*q) 2+
 s32c1_2MEA q*vFallM758 (j-1*q) 2+
 s32c1_3MEA q*vFallM758 (j-1*q) 3+
 s32c1_4MEA q*vFallM758 (j-1*q) 4+
 s32c2_2MEA q*vFallM758 (j-2*q) 2+
 s32c2_3MEA q*vFallM758 (j-2*q) 3+
 s32c2_4MEA q*vFallM758 (j-2*q) 4+
 s32c2_5MEA q*vFallM758 (j-2*q) 5+
 s32c2_6MEA q*vFallM758 (j-2*q) 6

theorem s32block0MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*s32J0MEA q x = vH0M758 3 2 1 q x := by
 simp only [s32J0MEA,vH0M758]; ring

theorem s32block1MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*s32J1MEA q x = vH1M758 3 2 1 q x := by
 simp only [s32J1MEA,vH1M758]; ring

theorem s32block2MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^2*s32J2MEA q x = vH2M758 3 2 1 q x := by
 simp only [s32J2MEA,vH2M758]; ring

theorem s32coeffMEA (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^4*P=X^m*(s32J0MEA (q:ℤ[X]) X+
   X^q*s32J1MEA (q:ℤ[X]) X+X^(2*q)*s32J2MEA (q:ℤ[X]) X)) :
 6*P.coeff j=s32EMEA q ((j:ℤ)-m) := by
 have hp : X^m*(s32J0MEA (q:ℤ[X]) X+
   X^q*s32J1MEA (q:ℤ[X]) X+X^(2*q)*s32J2MEA (q:ℤ[X]) X)=
 C (s32c0_1MEA q)*X^(m+0*q+1) +
 C (s32c0_2MEA q)*X^(m+0*q+2) +
 C (s32c1_2MEA q)*X^(m+1*q+2) +
 C (s32c1_3MEA q)*X^(m+1*q+3) +
 C (s32c1_4MEA q)*X^(m+1*q+4) +
 C (s32c2_2MEA q)*X^(m+2*q+2) +
 C (s32c2_3MEA q)*X^(m+2*q+3) +
 C (s32c2_4MEA q)*X^(m+2*q+4) +
 C (s32c2_5MEA q)*X^(m+2*q+5) +
 C (s32c2_6MEA q)*X^(m+2*q+6) := by
   simp only [s32J0MEA,s32J1MEA,s32J2MEA,s32c0_1MEA,s32c0_2MEA,s32c1_2MEA,s32c1_3MEA,s32c1_4MEA,s32c2_2MEA,s32c2_3MEA,s32c2_4MEA,s32c2_5MEA,s32c2_6MEA,
     map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Int.cast_natCast,pow_add,pow_mul]
   ring
 rw [hp] at h
 have hc := coeff_of_one_sub_mul_rangeBC _ _ 3 j h
 change P.coeff j=vInvM758 _ j at hc
 rw [hc]
 simp only [vInv_addM758,mul_add,vInv_monomialM758]
 simp only [s32EMEA,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,
   Nat.cast_one,Nat.cast_zero,vFall_shiftMEA]

def s41J0MEA {R : Type*} [CommRing R] (q x : R) : R := 16*x^2+64*x^3+16*x^4

def s41c0_2MEA (q : ℤ) : ℤ := 16

def s41c0_3MEA (q : ℤ) : ℤ := 64

def s41c0_4MEA (q : ℤ) : ℤ := 16

def s41J1MEA {R : Type*} [CommRing R] (q x : R) : R := -16*x^2-160*x^3-208*x^4-16*q*x^2-48*q*x^3+16*q*x^4+48*q*x^5

def s41c1_2MEA (q : ℤ) : ℤ := -16-16*q

def s41c1_3MEA (q : ℤ) : ℤ := -160-48*q

def s41c1_4MEA (q : ℤ) : ℤ := -208+16*q

def s41c1_5MEA (q : ℤ) : ℤ := 48*q

def s41J2MEA {R : Type*} [CommRing R] (q x : R) : R := 6*x^2+84*x^3+180*x^4+48*x^5-42*x^6+12*x^7+20*q*x^2+108*q*x^3+40*q*x^4-136*q*x^5-60*q*x^6+28*q*x^7+16*q^2*x^2+16*q^2*x^3-32*q^2*x^4-32*q^2*x^5+16*q^2*x^6+16*q^2*x^7

def s41c2_2MEA (q : ℤ) : ℤ := 6+20*q+16*q^2

def s41c2_3MEA (q : ℤ) : ℤ := 84+108*q+16*q^2

def s41c2_4MEA (q : ℤ) : ℤ := 180+40*q-32*q^2

def s41c2_5MEA (q : ℤ) : ℤ := 48-136*q-32*q^2

def s41c2_6MEA (q : ℤ) : ℤ := -42-60*q+16*q^2

def s41c2_7MEA (q : ℤ) : ℤ := 12+28*q+16*q^2

def s41EMEA (q j : ℤ) : ℤ :=
 s41c0_2MEA q*vFallM758 (j-0*q) 2+
 s41c0_3MEA q*vFallM758 (j-0*q) 3+
 s41c0_4MEA q*vFallM758 (j-0*q) 4+
 s41c1_2MEA q*vFallM758 (j-1*q) 2+
 s41c1_3MEA q*vFallM758 (j-1*q) 3+
 s41c1_4MEA q*vFallM758 (j-1*q) 4+
 s41c1_5MEA q*vFallM758 (j-1*q) 5+
 s41c2_2MEA q*vFallM758 (j-2*q) 2+
 s41c2_3MEA q*vFallM758 (j-2*q) 3+
 s41c2_4MEA q*vFallM758 (j-2*q) 4+
 s41c2_5MEA q*vFallM758 (j-2*q) 5+
 s41c2_6MEA q*vFallM758 (j-2*q) 6+
 s41c2_7MEA q*vFallM758 (j-2*q) 7

theorem s41block0MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*s41J0MEA q x = vH0M758 4 1 0 q x := by
 simp only [s41J0MEA,vH0M758]; ring

theorem s41block1MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*s41J1MEA q x = vH1M758 4 1 0 q x := by
 simp only [s41J1MEA,vH1M758]; ring

theorem s41block2MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*s41J2MEA q x = vH2M758 4 1 0 q x := by
 simp only [s41J2MEA,vH2M758]; ring

theorem s41coeffMEA (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^4*P=X^m*(s41J0MEA (q:ℤ[X]) X+
   X^q*s41J1MEA (q:ℤ[X]) X+X^(2*q)*s41J2MEA (q:ℤ[X]) X)) :
 6*P.coeff j=s41EMEA q ((j:ℤ)-m) := by
 have hp : X^m*(s41J0MEA (q:ℤ[X]) X+
   X^q*s41J1MEA (q:ℤ[X]) X+X^(2*q)*s41J2MEA (q:ℤ[X]) X)=
 C (s41c0_2MEA q)*X^(m+0*q+2) +
 C (s41c0_3MEA q)*X^(m+0*q+3) +
 C (s41c0_4MEA q)*X^(m+0*q+4) +
 C (s41c1_2MEA q)*X^(m+1*q+2) +
 C (s41c1_3MEA q)*X^(m+1*q+3) +
 C (s41c1_4MEA q)*X^(m+1*q+4) +
 C (s41c1_5MEA q)*X^(m+1*q+5) +
 C (s41c2_2MEA q)*X^(m+2*q+2) +
 C (s41c2_3MEA q)*X^(m+2*q+3) +
 C (s41c2_4MEA q)*X^(m+2*q+4) +
 C (s41c2_5MEA q)*X^(m+2*q+5) +
 C (s41c2_6MEA q)*X^(m+2*q+6) +
 C (s41c2_7MEA q)*X^(m+2*q+7) := by
   simp only [s41J0MEA,s41J1MEA,s41J2MEA,s41c0_2MEA,s41c0_3MEA,s41c0_4MEA,s41c1_2MEA,s41c1_3MEA,s41c1_4MEA,s41c1_5MEA,s41c2_2MEA,s41c2_3MEA,s41c2_4MEA,s41c2_5MEA,s41c2_6MEA,s41c2_7MEA,
     map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Int.cast_natCast,pow_add,pow_mul]
   ring
 rw [hp] at h
 have hc := coeff_of_one_sub_mul_rangeBC _ _ 3 j h
 change P.coeff j=vInvM758 _ j at hc
 rw [hc]
 simp only [vInv_addM758,mul_add,vInv_monomialM758]
 simp only [s41EMEA,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,
   Nat.cast_one,Nat.cast_zero,vFall_shiftMEA]

def s43J0MEA {R : Type*} [CommRing R] (q x : R) : R := 16*x+64*x^2+16*x^3

def s43c0_1MEA (q : ℤ) : ℤ := 16

def s43c0_2MEA (q : ℤ) : ℤ := 64

def s43c0_3MEA (q : ℤ) : ℤ := 16

def s43J1MEA {R : Type*} [CommRing R] (q x : R) : R := -96*x^2-240*x^3-64*x^4+16*x^5-48*q*x^2-16*q*x^3+48*q*x^4+16*q*x^5

def s43c1_2MEA (q : ℤ) : ℤ := -96-48*q

def s43c1_3MEA (q : ℤ) : ℤ := -240-16*q

def s43c1_4MEA (q : ℤ) : ℤ := -64+48*q

def s43c1_5MEA (q : ℤ) : ℤ := 16+16*q

def s43J2MEA {R : Type*} [CommRing R] (q x : R) : R := 20*x^2+142*x^3+192*x^4-28*x^5-68*x^6+30*x^7+36*q*x^2+124*q*x^3+8*q*x^4-168*q*x^5-44*q*x^6+44*q*x^7+16*q^2*x^2+16*q^2*x^3-32*q^2*x^4-32*q^2*x^5+16*q^2*x^6+16*q^2*x^7

def s43c2_2MEA (q : ℤ) : ℤ := 20+36*q+16*q^2

def s43c2_3MEA (q : ℤ) : ℤ := 142+124*q+16*q^2

def s43c2_4MEA (q : ℤ) : ℤ := 192+8*q-32*q^2

def s43c2_5MEA (q : ℤ) : ℤ := -28-168*q-32*q^2

def s43c2_6MEA (q : ℤ) : ℤ := -68-44*q+16*q^2

def s43c2_7MEA (q : ℤ) : ℤ := 30+44*q+16*q^2

def s43EMEA (q j : ℤ) : ℤ :=
 s43c0_1MEA q*vFallM758 (j-0*q) 1+
 s43c0_2MEA q*vFallM758 (j-0*q) 2+
 s43c0_3MEA q*vFallM758 (j-0*q) 3+
 s43c1_2MEA q*vFallM758 (j-1*q) 2+
 s43c1_3MEA q*vFallM758 (j-1*q) 3+
 s43c1_4MEA q*vFallM758 (j-1*q) 4+
 s43c1_5MEA q*vFallM758 (j-1*q) 5+
 s43c2_2MEA q*vFallM758 (j-2*q) 2+
 s43c2_3MEA q*vFallM758 (j-2*q) 3+
 s43c2_4MEA q*vFallM758 (j-2*q) 4+
 s43c2_5MEA q*vFallM758 (j-2*q) 5+
 s43c2_6MEA q*vFallM758 (j-2*q) 6+
 s43c2_7MEA q*vFallM758 (j-2*q) 7

theorem s43block0MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*s43J0MEA q x = vH0M758 4 3 2 q x := by
 simp only [s43J0MEA,vH0M758]; ring

theorem s43block1MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*s43J1MEA q x = vH1M758 4 3 2 q x := by
 simp only [s43J1MEA,vH1M758]; ring

theorem s43block2MEA {R : Type*} [CommRing R] (q x : R) :
 (1+x)^1*s43J2MEA q x = vH2M758 4 3 2 q x := by
 simp only [s43J2MEA,vH2M758]; ring

theorem s43coeffMEA (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^4*P=X^m*(s43J0MEA (q:ℤ[X]) X+
   X^q*s43J1MEA (q:ℤ[X]) X+X^(2*q)*s43J2MEA (q:ℤ[X]) X)) :
 6*P.coeff j=s43EMEA q ((j:ℤ)-m) := by
 have hp : X^m*(s43J0MEA (q:ℤ[X]) X+
   X^q*s43J1MEA (q:ℤ[X]) X+X^(2*q)*s43J2MEA (q:ℤ[X]) X)=
 C (s43c0_1MEA q)*X^(m+0*q+1) +
 C (s43c0_2MEA q)*X^(m+0*q+2) +
 C (s43c0_3MEA q)*X^(m+0*q+3) +
 C (s43c1_2MEA q)*X^(m+1*q+2) +
 C (s43c1_3MEA q)*X^(m+1*q+3) +
 C (s43c1_4MEA q)*X^(m+1*q+4) +
 C (s43c1_5MEA q)*X^(m+1*q+5) +
 C (s43c2_2MEA q)*X^(m+2*q+2) +
 C (s43c2_3MEA q)*X^(m+2*q+3) +
 C (s43c2_4MEA q)*X^(m+2*q+4) +
 C (s43c2_5MEA q)*X^(m+2*q+5) +
 C (s43c2_6MEA q)*X^(m+2*q+6) +
 C (s43c2_7MEA q)*X^(m+2*q+7) := by
   simp only [s43J0MEA,s43J1MEA,s43J2MEA,s43c0_1MEA,s43c0_2MEA,s43c0_3MEA,s43c1_2MEA,s43c1_3MEA,s43c1_4MEA,s43c1_5MEA,s43c2_2MEA,s43c2_3MEA,s43c2_4MEA,s43c2_5MEA,s43c2_6MEA,s43c2_7MEA,
     map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Int.cast_natCast,pow_add,pow_mul]
   ring
 rw [hp] at h
 have hc := coeff_of_one_sub_mul_rangeBC _ _ 3 j h
 change P.coeff j=vInvM758 _ j at hc
 rw [hc]
 simp only [vInv_addM758,mul_add,vInv_monomialM758]
 simp only [s43EMEA,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,
   Nat.cast_one,Nat.cast_zero,vFall_shiftMEA]

end
end MathGKM.Markov
