import MarkovFourthClosedN6604
/-! Machine-authored bc8d3b6f. Exact normalization candidates; validated separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def jetNum00BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 0
theorem jet_normalize_00BC (n : ℕ) :
 closedJetBDEE 0 0 n=jetNum00BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^0) := by
 unfold closedJetBDEE jetNumeratorBDEE
 norm_num only [Fin.val_zero,Fin.val_one,Fin.reduceFinMk]
 unfold jetClosed00BDEE jetNum00BC
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one]
 change _ = _ / (1*(1-runEmbedBDEE X)^0)
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp
 ring

def jetNum01BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 2*x + -1*Z*x + -1*Z*x^2
theorem jet_normalize_01BC (n : ℕ) :
 closedJetBDEE 0 1 n=jetNum01BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^1) := by
 unfold closedJetBDEE jetNumeratorBDEE
 norm_num only [Fin.val_zero,Fin.val_one,Fin.reduceFinMk]
 unfold jetClosed01BDEE jetNum01BC
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one]
 change _ = _ / (1*(1-runEmbedBDEE X)^1)
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp
 ring

def jetNum02BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -1*x + -5*x^2 + -7*x^3 + -3*x^4 + 1*Z*x + 5*Z*x^2 + 7*Z*x^3 + 3*Z*x^4 + 2*N*x + 2*N*x^2 + -2*N*x^3 + -2*N*x^4 + 1*N*Z*x + 2*N*Z*x^2 + -2*N*Z*x^4 + -1*N*Z*x^5
theorem jet_normalize_02BC (n : ℕ) :
 closedJetBDEE 0 2 n=jetNum02BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^3) := by
 unfold closedJetBDEE jetNumeratorBDEE
 norm_num only [Fin.val_zero,Fin.val_one,Fin.reduceFinMk]
 unfold jetClosed02BDEE jetNum02BC
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one]
 change _ = _ / (1*(1-runEmbedBDEE X)^3)
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp
 ring

def jetNum03BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 2*x + 22*x^2 + 76*x^3 + 124*x^4 + 106*x^5 + 46*x^6 + 8*x^7 + -2*Z*x + -22*Z*x^2 + -76*Z*x^3 + -124*Z*x^4 + -106*Z*x^5 + -46*Z*x^6 + -8*Z*x^7 + -4*N*x + -20*N*x^2 + -32*N*x^3 + -8*N*x^4 + 28*N*x^5 + 28*N*x^6 + 8*N*x^7 + -3*N*Z*x + -17*N*Z*x^2 + -31*N*Z*x^3 + -13*N*Z*x^4 + 23*N*Z*x^5 + 29*N*Z*x^6 + 11*N*Z*x^7 + 1*N*Z*x^8 + 2*N^2*x + 4*N^2*x^2 + -2*N^2*x^3 + -8*N^2*x^4 + -2*N^2*x^5 + 4*N^2*x^6 + 2*N^2*x^7 + -1*N^2*Z*x + -3*N^2*Z*x^2 + -1*N^2*Z*x^3 + 5*N^2*Z*x^4 + 5*N^2*Z*x^5 + -1*N^2*Z*x^6 + -3*N^2*Z*x^7 + -1*N^2*Z*x^8
theorem jet_normalize_03BC (n : ℕ) :
 closedJetBDEE 0 3 n=jetNum03BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (2*(1-runXBDEE)^5) := by
 unfold closedJetBDEE jetNumeratorBDEE
 norm_num only [Fin.val_zero,Fin.val_one,Fin.reduceFinMk]
 unfold jetClosed03BDEE jetNum03BC
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one]
 change _ = _ / (2*(1-runEmbedBDEE X)^5)
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp
 ring
end
end MathGKM.Markov
