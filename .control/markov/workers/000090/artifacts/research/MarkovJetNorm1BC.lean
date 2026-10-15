import MarkovFourthClosedN6604
/-! Machine-authored bc8d3b6f. Exact normalization candidates; validated separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def jetNum10BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 0
theorem jet_normalize_10BC (n : ℕ) :
 closedJetBDEE 1 0 n=jetNum10BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^0) := by
 change runEmbedBDEE (jetClosed10BDEE n)/(6*(1-runXBDEE)^1)=_
 unfold jetClosed10BDEE jetNum10BC runXBDEE
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def jetNum11BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 1
theorem jet_normalize_11BC (n : ℕ) :
 closedJetBDEE 1 1 n=jetNum11BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^0) := by
 change runEmbedBDEE (jetClosed11BDEE n)/(6*(1-runXBDEE)^3)=_
 unfold jetClosed11BDEE jetNum11BC runXBDEE
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def jetNum12BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -1*x + -2*x^2 + -1*x^3 + 1*Z*x + 2*Z*x^2 + 1*Z*x^3 + 1*N + 1*N*x + -1*N*x^2 + -1*N*x^3
theorem jet_normalize_12BC (n : ℕ) :
 closedJetBDEE 1 2 n=jetNum12BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^2) := by
 change runEmbedBDEE (jetClosed12BDEE n)/(6*(1-runXBDEE)^5)=_
 unfold jetClosed12BDEE jetNum12BC runXBDEE
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def jetNum13BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 4*x + 18*x^2 + 32*x^3 + 28*x^4 + 12*x^5 + 2*x^6 + -4*Z*x + -18*Z*x^2 + -32*Z*x^3 + -28*Z*x^4 + -12*Z*x^5 + -2*Z*x^6 + -1*N + -6*N*x + -11*N*x^2 + -4*N*x^3 + 9*N*x^4 + 10*N*x^5 + 3*N*x^6 + -2*N*Z*x + -6*N*Z*x^2 + -4*N*Z*x^3 + 4*N*Z*x^4 + 6*N*Z*x^5 + 2*N*Z*x^6 + 1*N^2 + 2*N^2*x + -1*N^2*x^2 + -4*N^2*x^3 + -1*N^2*x^4 + 2*N^2*x^5 + 1*N^2*x^6
theorem jet_normalize_13BC (n : ℕ) :
 closedJetBDEE 1 3 n=jetNum13BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (2*(1-runXBDEE)^4) := by
 change runEmbedBDEE (jetClosed13BDEE n)/(6*(1-runXBDEE)^7)=_
 unfold jetClosed13BDEE jetNum13BC runXBDEE
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def jetNum14BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -18*x + -144*x^2 + -492*x^3 + -936*x^4 + -1080*x^5 + -768*x^6 + -324*x^7 + -72*x^8 + -6*x^9 + 18*Z*x + 144*Z*x^2 + 492*Z*x^3 + 936*Z*x^4 + 1080*Z*x^5 + 768*Z*x^6 + 324*Z*x^7 + 72*Z*x^8 + 6*Z*x^9 + 2*N + 33*N*x + 144*N*x^2 + 272*N*x^3 + 204*N*x^4 + -78*N*x^5 + -272*N*x^6 + -216*N*x^7 + -78*N*x^8 + -11*N*x^9 + 15*N*Z*x + 84*N*Z*x^2 + 180*N*Z*x^3 + 156*N*Z*x^4 + -30*N*Z*x^5 + -180*N*Z*x^6 + -156*N*Z*x^7 + -60*N*Z*x^8 + -9*N*Z*x^9 + -3*N^2 + -18*N^2*x + -36*N^2*x^2 + -12*N^2*x^3 + 54*N^2*x^4 + 72*N^2*x^5 + 12*N^2*x^6 + -36*N^2*x^7 + -27*N^2*x^8 + -6*N^2*x^9 + 3*N^2*Z*x + 12*N^2*Z*x^2 + 12*N^2*Z*x^3 + -12*N^2*Z*x^4 + -30*N^2*Z*x^5 + -12*N^2*Z*x^6 + 12*N^2*Z*x^7 + 12*N^2*Z*x^8 + 3*N^2*Z*x^9 + 1*N^3 + 3*N^3*x + -8*N^3*x^3 + -6*N^3*x^4 + 6*N^3*x^5 + 8*N^3*x^6 + -3*N^3*x^8 + -1*N^3*x^9
theorem jet_normalize_14BC (n : ℕ) :
 closedB4N6604 n=jetNum14BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (6*(1-runXBDEE)^6) := by
 change runEmbedBDEE (jetClosed14N6604 n)/(24*(1-runXBDEE)^9)=_
 unfold jetClosed14N6604 jetNum14BC runXBDEE
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
