import MarkovFourthClosedN6604
/-! Machine-authored bc8d3b6f. Exact normalization candidates; validated separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def jetNum20BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 2*x + -2*Z*x
theorem jet_normalize_20BC (n : ℕ) :
 closedJetBDEE 2 0 n=jetNum20BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^1) := by
 change runEmbedBDEE (jetClosed20BDEE n)/(6*(1-runXBDEE)^1)=_
 unfold jetClosed20BDEE jetNum20BC runXBDEE
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def jetNum21BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 1*x + -11*x^2 + -5*x^3 + -1*x^4 + 8*Z*x^2 + 8*Z*x^3 + 2*N*x + 2*N*x^2 + -2*N*x^3 + -2*N*x^4 + 2*N*Z*x + 2*N*Z*x^2 + -2*N*Z*x^3 + -2*N*Z*x^4
theorem jet_normalize_21BC (n : ℕ) :
 closedJetBDEE 2 1 n=jetNum21BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^3) := by
 change runEmbedBDEE (jetClosed21BDEE n)/(6*(1-runXBDEE)^3)=_
 unfold jetClosed21BDEE jetNum21BC runXBDEE
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def jetNum22BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 11*x^2 + 49*x^3 + 74*x^4 + 46*x^5 + 11*x^6 + 1*x^7 + -11*Z*x^2 + -49*Z*x^3 + -74*Z*x^4 + -46*Z*x^5 + -11*Z*x^6 + -1*Z*x^7 + -14*N*x^2 + -22*N*x^3 + 4*N*x^4 + 20*N*x^5 + 10*N*x^6 + 2*N*x^7 + -1*N*Z*x + -12*N*Z*x^2 + -21*N*Z*x^3 + 21*N*Z*x^5 + 12*N*Z*x^6 + 1*N*Z*x^7 + 1*N^2*x + 2*N^2*x^2 + -1*N^2*x^3 + -4*N^2*x^4 + -1*N^2*x^5 + 2*N^2*x^6 + 1*N^2*x^7 + -1*N^2*Z*x + -2*N^2*Z*x^2 + 1*N^2*Z*x^3 + 4*N^2*Z*x^4 + 1*N^2*Z*x^5 + -2*N^2*Z*x^6 + -1*N^2*Z*x^7
theorem jet_normalize_22BC (n : ℕ) :
 closedJetBDEE 2 2 n=jetNum22BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^5) := by
 change runEmbedBDEE (jetClosed22BDEE n)/(6*(1-runXBDEE)^5)=_
 unfold jetClosed22BDEE jetNum22BC runXBDEE
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def jetNum23BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -84*x^2 + -750*x^3 + -2526*x^4 + -4374*x^5 + -4302*x^6 + -2442*x^7 + -762*x^8 + -114*x^9 + -6*x^10 + 84*Z*x^2 + 750*Z*x^3 + 2526*Z*x^4 + 4374*Z*x^5 + 4302*Z*x^6 + 2442*Z*x^7 + 762*Z*x^8 + 114*Z*x^9 + 6*Z*x^10 + 1*N*x + 123*N*x^2 + 612*N*x^3 + 1084*N*x^4 + 558*N*x^5 + -630*N*x^6 + -1036*N*x^7 + -564*N*x^8 + -135*N*x^9 + -13*N*x^10 + 4*N*Z*x + 126*N*Z*x^2 + 600*N*Z*x^3 + 1072*N*Z*x^4 + 576*N*Z*x^5 + -612*N*Z*x^6 + -1048*N*Z*x^7 + -576*N*Z*x^8 + -132*N*Z*x^9 + -10*N*Z*x^10 + -3*N^2*x + -57*N^2*x^2 + -132*N^2*x^3 + -12*N^2*x^4 + 222*N^2*x^5 + 186*N^2*x^6 + -36*N^2*x^7 + -108*N^2*x^8 + -51*N^2*x^9 + -9*N^2*x^10 + 6*N^2*Z*x + 54*N^2*Z*x^2 + 120*N^2*Z*x^3 + 24*N^2*Z*x^4 + -204*N^2*Z*x^5 + -204*N^2*Z*x^6 + 24*N^2*Z*x^7 + 120*N^2*Z*x^8 + 54*N^2*Z*x^9 + 6*N^2*Z*x^10 + 2*N^3*x + 6*N^3*x^2 + -16*N^3*x^4 + -12*N^3*x^5 + 12*N^3*x^6 + 16*N^3*x^7 + -6*N^3*x^9 + -2*N^3*x^10 + 2*N^3*Z*x + 6*N^3*Z*x^2 + -16*N^3*Z*x^4 + -12*N^3*Z*x^5 + 12*N^3*Z*x^6 + 16*N^3*Z*x^7 + -6*N^3*Z*x^9 + -2*N^3*Z*x^10
theorem jet_normalize_23BC (n : ℕ) :
 closedJetBDEE 2 3 n=jetNum23BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (6*(1-runXBDEE)^7) := by
 change runEmbedBDEE (jetClosed23BDEE n)/(6*(1-runXBDEE)^7)=_
 unfold jetClosed23BDEE jetNum23BC runXBDEE
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
