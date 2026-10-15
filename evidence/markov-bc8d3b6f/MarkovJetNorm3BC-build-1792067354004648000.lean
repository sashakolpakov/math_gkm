import MarkovFourthClosedN6604
/-! Machine-authored bc8d3b6f. Exact normalization candidates; validated separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def jetNum30BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 1
theorem jet_normalize_30BC (n : ℕ) :
 closedJetBDEE 3 0 n=jetNum30BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^0) := by
 unfold closedJetBDEE jetNumeratorBDEE
 norm_num only [Fin.val_zero,Fin.val_one,Fin.reduceFinMk]
 unfold jetClosed30BDEE jetNum30BC
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one]
 change _ = _ / (1*(1-runEmbedBDEE X)^0)
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp
 ring

def jetNum31BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 1 + -4*x + -1*x^2 + 2*Z*x + 2*Z*x^2 + 1*N + 1*N*x + -1*N*x^2 + -1*N*x^3
theorem jet_normalize_31BC (n : ℕ) :
 closedJetBDEE 3 1 n=jetNum31BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^2) := by
 unfold closedJetBDEE jetNumeratorBDEE
 norm_num only [Fin.val_zero,Fin.val_one,Fin.reduceFinMk]
 unfold jetClosed31BDEE jetNum31BC
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one]
 change _ = _ / (1*(1-runEmbedBDEE X)^2)
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp
 ring

def jetNum32BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 4*x + 24*x^2 + 40*x^3 + 24*x^4 + 4*x^5 + -4*Z*x + -24*Z*x^2 + -40*Z*x^3 + -24*Z*x^4 + -4*Z*x^5 + 1*N + -10*N*x + -17*N*x^2 + 4*N*x^3 + 15*N*x^4 + 6*N*x^5 + 1*N*x^6 + -4*N*Z*x + -8*N*Z*x^2 + 8*N*Z*x^4 + 4*N*Z*x^5 + 1*N^2 + 2*N^2*x + -1*N^2*x^2 + -4*N^2*x^3 + -1*N^2*x^4 + 2*N^2*x^5 + 1*N^2*x^6
theorem jet_normalize_32BC (n : ℕ) :
 closedJetBDEE 3 2 n=jetNum32BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (2*(1-runXBDEE)^4) := by
 unfold closedJetBDEE jetNumeratorBDEE
 norm_num only [Fin.val_zero,Fin.val_one,Fin.reduceFinMk]
 unfold jetClosed32BDEE jetNum32BC
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one]
 change _ = _ / (2*(1-runEmbedBDEE X)^4)
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp
 ring

def jetNum33BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -12*x + -162*x^2 + -624*x^3 + -1134*x^4 + -1116*x^5 + -606*x^6 + -168*x^7 + -18*x^8 + 12*Z*x + 162*Z*x^2 + 624*Z*x^3 + 1134*Z*x^4 + 1116*Z*x^5 + 606*Z*x^6 + 168*Z*x^7 + 18*Z*x^8 + -1*N + 30*N*x + 180*N*x^2 + 344*N*x^3 + 186*N*x^4 + -204*N*x^5 + -332*N*x^6 + -168*N*x^7 + -33*N*x^8 + -2*N*x^9 + 18*N*Z*x + 114*N*Z*x^2 + 234*N*Z*x^3 + 138*N*Z*x^4 + -138*N*Z*x^5 + -234*N*Z*x^6 + -114*N*Z*x^7 + -18*N*Z*x^8 + -21*N^2*x + -54*N^2*x^2 + -6*N^2*x^3 + 90*N^2*x^4 + 72*N^2*x^5 + -18*N^2*x^6 + -42*N^2*x^7 + -18*N^2*x^8 + -3*N^2*x^9 + 6*N^2*Z*x + 18*N^2*Z*x^2 + 6*N^2*Z*x^3 + -30*N^2*Z*x^4 + -30*N^2*Z*x^5 + 6*N^2*Z*x^6 + 18*N^2*Z*x^7 + 6*N^2*Z*x^8 + 1*N^3 + 3*N^3*x + -8*N^3*x^3 + -6*N^3*x^4 + 6*N^3*x^5 + 8*N^3*x^6 + -3*N^3*x^8 + -1*N^3*x^9
theorem jet_normalize_33BC (n : ℕ) :
 closedJetBDEE 3 3 n=jetNum33BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (6*(1-runXBDEE)^6) := by
 unfold closedJetBDEE jetNumeratorBDEE
 norm_num only [Fin.val_zero,Fin.val_one,Fin.reduceFinMk]
 unfold jetClosed33BDEE jetNum33BC
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one]
 change _ = _ / (6*(1-runEmbedBDEE X)^6)
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp
 ring

def jetNum34BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 48*x + 1128*x^2 + 7392*x^3 + 24096*x^4 + 46560*x^5 + 57264*x^6 + 45888*x^7 + 23712*x^8 + 7536*x^9 + 1320*x^10 + 96*x^11 + -48*Z*x + -1128*Z*x^2 + -7392*Z*x^3 + -24096*Z*x^4 + -46560*Z*x^5 + -57264*Z*x^6 + -45888*Z*x^7 + -23712*Z*x^8 + -7536*Z*x^9 + -1320*Z*x^10 + -96*Z*x^11 + 2*N + -128*N*x + -1544*N*x^2 + -6328*N*x^3 + -12398*N*x^4 + -11168*N*x^5 + 352*N*x^6 + 11312*N*x^7 + 11942*N*x^8 + 6112*N*x^9 + 1640*N*x^10 + 200*N*x^11 + 6*N*x^12 + -88*N*Z*x + -1096*N*Z*x^2 + -4656*N*Z*x^3 + -9376*N*Z*x^4 + -8656*N*Z*x^5 + 144*N*Z*x^6 + 8704*N*Z*x^7 + 9184*N*Z*x^8 + 4584*N*Z*x^9 + 1144*N*Z*x^10 + 112*N*Z*x^11 + -1*N^2 + 116*N^2*x + 730*N^2*x^2 + 1596*N^2*x^3 + 941*N^2*x^4 + -1784*N^2*x^5 + -3364*N^2*x^6 + -1544*N^2*x^7 + 1001*N^2*x^8 + 1476*N^2*x^9 + 682*N^2*x^10 + 140*N^2*x^11 + 11*N^2*x^12 + -48*N^2*Z*x + -336*N^2*Z*x^2 + -816*N^2*Z*x^3 + -576*N^2*Z*x^4 + 864*N^2*Z*x^5 + 1824*N^2*Z*x^6 + 864*N^2*Z*x^7 + -576*N^2*Z*x^8 + -816*N^2*Z*x^9 + -336*N^2*Z*x^10 + -48*N^2*Z*x^11 + -2*N^3 + -40*N^3*x + -124*N^3*x^2 + -56*N^3*x^3 + 266*N^3*x^4 + 368*N^3*x^5 + -40*N^3*x^6 + -368*N^3*x^7 + -206*N^3*x^8 + 56*N^3*x^9 + 100*N^3*x^10 + 40*N^3*x^11 + 6*N^3*x^12 + -8*N^3*Z*x + -32*N^3*Z*x^2 + -24*N^3*Z*x^3 + 64*N^3*Z*x^4 + 112*N^3*Z*x^5 + -112*N^3*Z*x^7 + -64*N^3*Z*x^8 + 24*N^3*Z*x^9 + 32*N^3*Z*x^10 + 8*N^3*Z*x^11 + 1*N^4 + 4*N^4*x + 2*N^4*x^2 + -12*N^4*x^3 + -17*N^4*x^4 + 8*N^4*x^5 + 28*N^4*x^6 + 8*N^4*x^7 + -17*N^4*x^8 + -12*N^4*x^9 + 2*N^4*x^10 + 4*N^4*x^11 + 1*N^4*x^12
theorem jet_normalize_34BC (n : ℕ) :
 closedD4N6604 n=jetNum34BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (24*(1-runXBDEE)^8) := by
 unfold closedD4N6604 
 norm_num only [Fin.val_zero,Fin.val_one,Fin.reduceFinMk]
 unfold jetClosed34N6604 jetNum34BC
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one]
 change _ = _ / (24*(1-runEmbedBDEE X)^8)
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp
 ring
end
end MathGKM.Markov
