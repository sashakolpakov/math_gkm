import MarkovMomentZeroK0B
/-! Machine-authored request 0b212317. Uniform pre-shift numerator, with H=N*C+R. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fourthLow0K0B {A : Type*} [CommRing A] (C H : A) : A :=
 24 + -50*H + 35*H^2 + -10*H^3 + 1*H^4 + -50*C + 70*C*H + -30*C*H^2 + 4*C*H^3 + 35*C^2 + -30*C^2*H + 6*C^2*H^2 + -10*C^3 + 4*C^3*H + 1*C^4

def fourthLow1K0B {A : Type*} [CommRing A] (C H : A) : A :=
 -96 + -136*H + 152*H^2 + -44*H^3 + 4*H^4 + 440*C + -176*C*H + 4*C*H^3 + -328*C^2 + 132*C^2*H + -12*C^2*H^2 + 88*C^3 + -20*C^3*H + -8*C^4

def fourthLow2K0B {A : Type*} [CommRing A] (C H : A) : A :=
 48 + -568*H + 334*H^2 + -56*H^3 + 2*H^4 + 1520*C + -1262*C*H + 354*C*H^2 + -36*C*H^3 + -324*C^2 + 354*C^2*H + -66*C^2*H^2 + -56*C^3 + -16*C^3*H + 12*C^4

def fourthLow3K0B {A : Type*} [CommRing A] (C H : A) : A :=
 288 + -1816*H + 504*H^2 + 28*H^3 + -12*H^4 + 5552*C + -3040*C*H + 708*C*H^2 + -68*C*H^3 + 1112*C^2 + -528*C^2*H + 48*C^2*H^2 + -560*C^3 + 144*C^3*H + 40*C^4

def fourthLow4K0B {A : Type*} [CommRing A] (C H : A) : A :=
 -408 + -2554*H + 269*H^2 + 142*H^3 + -17*H^4 + 16628*C + -5732*C*H + 324*C*H^2 + 40*C*H^3 + 3746*C^2 + -1980*C^2*H + 300*C^2*H^2 + -92*C^3 + 88*C^3*H + -74*C^4

def fourthLow5K0B {A : Type*} [CommRing A] (C H : A) : A :=
 -192 + -1552*H + -656*H^2 + 136*H^3 + 8*H^4 + 27968*C + -6560*C*H + -528*C*H^2 + 168*C*H^3 + 10392*C^2 + -2088*C^2*H + 120*C^2*H^2 + 1120*C^3 + -376*C^3*H + -120*C^4

def fourthLow6K0B {A : Type*} [CommRing A] (C H : A) : A :=
 672 + -1276*H^2 + 28*H^4 + 32056*C + -1276*C*H + -1068*C*H^2 + 56*C*H^3 + 17652*C^2 + -1068*C^2*H + -372*C^2*H^2 + 1928*C^3 + -400*C^3*H + 108*C^4

def fourthLow7K0B {A : Type*} [CommRing A] (C H : A) : A :=
 -192 + 1552*H + -656*H^2 + -136*H^3 + 8*H^4 + 29520*C + 5248*C*H + -936*C*H^2 + -136*C*H^3 + 16296*C^2 + 624*C^2*H + -336*C^2*H^2 + 2544*C^3 + 144*C^3*H + 216*C^4

def fourthLow8K0B {A : Type*} [CommRing A] (C H : A) : A :=
 -408 + 2554*H + 269*H^2 + -142*H^3 + -17*H^4 + 19182*C + 6270*C*H + -102*C*H^2 + -108*C*H^3 + 9747*C^2 + 2202*C^2*H + 78*C^2*H^2 + 2070*C^3 + 324*C^3*H + 81*C^4

def fourthLow9K0B {A : Type*} [CommRing A] (C H : A) : A :=
 288 + 1816*H + 504*H^2 + -28*H^3 + -12*H^4 + 7368*C + 4048*C*H + 624*C*H^2 + 20*C*H^3 + 4656*C^2 + 1860*C^2*H + 180*C^2*H^2 + 648*C^3 + 108*C^3*H

def fourthLow10K0B {A : Type*} [CommRing A] (C H : A) : A :=
 48 + 568*H + 334*H^2 + 56*H^3 + 2*H^4 + 2088*C + 1930*C*H + 522*C*H^2 + 44*C*H^3 + 1272*C^2 + 522*C^2*H + 54*C^2*H^2

def fourthLow11K0B {A : Type*} [CommRing A] (C H : A) : A :=
 -96 + 136*H + 152*H^2 + 44*H^3 + 4*H^4 + 576*C + 480*C*H + 132*C*H^2 + 12*C*H^3

def fourthLow12K0B {A : Type*} [CommRing A] (C H : A) : A :=
 24 + 50*H + 35*H^2 + 10*H^3 + 1*H^4

def fourthLowPolyK0B {A : Type*} [CommRing A] (C H x : A) : A :=
 fourthLow0K0B C H*x^0 + fourthLow1K0B C H*x^1 + fourthLow2K0B C H*x^2 + fourthLow3K0B C H*x^3 + fourthLow4K0B C H*x^4 + fourthLow5K0B C H*x^5 + fourthLow6K0B C H*x^6 + fourthLow7K0B C H*x^7 + fourthLow8K0B C H*x^8 + fourthLow9K0B C H*x^9 + fourthLow10K0B C H*x^10 + fourthLow11K0B C H*x^11 + fourthLow12K0B C H*x^12

theorem fourthNumerator_zeroK0B {A : Type*} [CommRing A] (N x : A) (c r : ℕ) :
 fourthNumeratorBC N 0 x c r=fourthLowPolyK0B c (N*c+r) x := by
 unfold fourthNumeratorBC
 dsimp only
 rw [thirdMoment_zeroK0B,fourMoment_zeroK0B]
 simp only [firstNumBC,secondNumBC,zero_pow,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
 unfold fourthLowPolyK0B fourthLow0K0B fourthLow1K0B fourthLow2K0B fourthLow3K0B fourthLow4K0B fourthLow5K0B fourthLow6K0B fourthLow7K0B fourthLow8K0B fourthLow9K0B fourthLow10K0B fourthLow11K0B fourthLow12K0B zeroThird0K0B zeroThird1K0B zeroFour0K0B zeroFour1K0B
 ring
end
end MathGKM.Markov
