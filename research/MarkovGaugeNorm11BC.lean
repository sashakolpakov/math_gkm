import MarkovJetNorm0BC
import MarkovJetNorm1BC
import MarkovJetNorm2BC
import MarkovJetNorm3BC
/-! Machine-authored bc8d3b6f. Exact normalization candidates; validated separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def gaugeNum11a1BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 1*Z*x^2
theorem gauge_normalize_11a1BC (n : ℕ) :
 (closedGaugeJetBDEE n true true 1).a=gaugeNum11a1BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^0) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum11a1BC,runXBDEE]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum11a2BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -1*x + -3*x^2 + -3*x^3 + -1*x^4 + 4*Z*x^2 + 5*Z*x^3 + -3*Z*x^4 + -5*Z*x^5 + -1*Z*x^6 + 2*Z^2*x^4 + 4*Z^2*x^5 + 2*Z^2*x^6 + 3*N*Z*x^2 + 4*N*Z*x^3 + -2*N*Z*x^4 + -4*N*Z*x^5 + -1*N*Z*x^6
theorem gauge_normalize_11a2BC (n : ℕ) :
 (closedGaugeJetBDEE n true true 2).a=gaugeNum11a2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^3) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum11a2BC,runXBDEE]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum11b2BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 1 + -3*x^2 + -2*x^3 + 1*Z*x^2 + 2*Z*x^3 + 1*Z*x^4 + 1*N + 1*N*x + -1*N*x^2 + -1*N*x^3
theorem gauge_normalize_11b2BC (n : ℕ) :
 (closedGaugeJetBDEE n true true 2).b=gaugeNum11b2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^2) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum11b2BC,runXBDEE]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum11b3BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 6*x^2 + 24*x^3 + 36*x^4 + 24*x^5 + 6*x^6 + -6*Z*x^2 + -24*Z*x^3 + -36*Z*x^4 + -24*Z*x^5 + -6*Z*x^6 + 1*N + -2*N*x + -13*N*x^2 + -12*N*x^3 + 7*N*x^4 + 14*N*x^5 + 5*N*x^6 + -2*N*Z*x^2 + -6*N*Z*x^3 + -4*N*Z*x^4 + 4*N*Z*x^5 + 6*N*Z*x^6 + 2*N*Z*x^7 + 1*N^2 + 2*N^2*x + -1*N^2*x^2 + -4*N^2*x^3 + -1*N^2*x^4 + 2*N^2*x^5 + 1*N^2*x^6
theorem gauge_normalize_11b3BC (n : ℕ) :
 (closedGaugeJetBDEE n true true 3).b=gaugeNum11b3BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (2*(1-runXBDEE)^4) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum11b3BC,runXBDEE]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum11c1BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -1*x + -3*x^2 + -3*x^3 + -1*x^4 + 6*Z*x^2 + 2*Z*x^3 + -6*Z*x^4 + -2*Z*x^5 + 2*Z^2*x^4 + 8*Z^2*x^5 + -2*Z^2*x^6 + 4*N*Z*x^2 + 4*N*Z*x^3 + -4*N*Z*x^4 + -4*N*Z*x^5
theorem gauge_normalize_11c1BC (n : ℕ) :
 (closedGaugeJetBDEE n true true 1).c=gaugeNum11c1BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^3) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum11c1BC,runXBDEE]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum11c2BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -1*x + 1*x^2 + 16*x^3 + 34*x^4 + 31*x^5 + 13*x^6 + 2*x^7 + -11*Z*x^3 + -25*Z*x^4 + -6*Z*x^5 + 22*Z*x^6 + 17*Z*x^7 + 3*Z*x^8 + -16*Z^2*x^4 + -30*Z^2*x^5 + -20*Z^2*x^6 + -16*Z^2*x^7 + -12*Z^2*x^8 + -2*Z^2*x^9 + -4*Z^3*x^6 + -4*Z^3*x^7 + 4*Z^3*x^8 + 4*Z^3*x^9 + -1*N*x + -4*N*x^2 + -5*N*x^3 + 5*N*x^5 + 4*N*x^6 + 1*N*x^7 + -12*N*Z*x^3 + -28*N*Z*x^4 + -8*N*Z*x^5 + 24*N*Z*x^6 + 20*N*Z*x^7 + 4*N*Z*x^8 + -10*N*Z^2*x^4 + -10*N*Z^2*x^5 + 12*N*Z^2*x^6 + 12*N*Z^2*x^7 + -2*N*Z^2*x^8 + -2*N*Z^2*x^9
theorem gauge_normalize_11c2BC (n : ℕ) :
 (closedGaugeJetBDEE n true true 2).c=gaugeNum11c2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^5) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum11c2BC,runXBDEE]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum11c3BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -12*x^2 + -162*x^3 + -738*x^4 + -1698*x^5 + -2250*x^6 + -1782*x^7 + -822*x^8 + -198*x^9 + -18*x^10 + 12*Z*x^2 + 162*Z*x^3 + 630*Z*x^4 + 1038*Z*x^5 + 558*Z*x^6 + -558*Z*x^7 + -1038*Z*x^8 + -630*Z*x^9 + -162*Z*x^10 + -12*Z*x^11 + 108*Z^2*x^4 + 660*Z^2*x^5 + 1620*Z^2*x^6 + 2124*Z^2*x^7 + 1716*Z^2*x^8 + 972*Z^2*x^9 + 396*Z^2*x^10 + 84*Z^2*x^11 + 72*Z^3*x^6 + 216*Z^3*x^7 + 144*Z^3*x^8 + -144*Z^3*x^9 + -216*Z^3*x^10 + -72*Z^3*x^11 + -3*N*x + 21*N*x^2 + 168*N*x^3 + 384*N*x^4 + 330*N*x^5 + -78*N*x^6 + -384*N*x^7 + -312*N*x^8 + -111*N*x^9 + -15*N*x^10 + 26*N*Z*x^2 + 180*N*Z*x^3 + 600*N*Z*x^4 + 1064*N*Z*x^5 + 780*N*Z*x^6 + -384*N*Z*x^7 + -1160*N*Z*x^8 + -840*N*Z*x^9 + -246*N*Z*x^10 + -20*N*Z*x^11 + 78*N*Z^2*x^4 + 396*N*Z^2*x^5 + 588*N*Z^2*x^6 + 12*N*Z^2*x^7 + -648*N*Z^2*x^8 + -444*N*Z^2*x^9 + -12*N*Z^2*x^10 + 36*N*Z^2*x^11 + -6*N*Z^2*x^12 + 24*N*Z^3*x^6 + 48*N*Z^3*x^7 + -24*N*Z^3*x^8 + -96*N*Z^3*x^9 + -24*N*Z^3*x^10 + 48*N*Z^3*x^11 + 24*N*Z^3*x^12 + -3*N^2*x + -15*N^2*x^2 + -24*N^2*x^3 + 42*N^2*x^5 + 42*N^2*x^6 + -24*N^2*x^8 + -15*N^2*x^9 + -3*N^2*x^10 + 18*N^2*Z*x^2 + 42*N^2*Z*x^3 + -24*N^2*Z*x^4 + -120*N^2*Z*x^5 + -36*N^2*Z*x^6 + 108*N^2*Z*x^7 + 72*N^2*Z*x^8 + -24*N^2*Z*x^9 + -30*N^2*Z*x^10 + -6*N^2*Z*x^11 + 6*N^2*Z^2*x^4 + 36*N^2*Z^2*x^5 + 36*N^2*Z^2*x^6 + -60*N^2*Z^2*x^7 + -96*N^2*Z^2*x^8 + 12*N^2*Z^2*x^9 + 60*N^2*Z^2*x^10 + 12*N^2*Z^2*x^11 + -6*N^2*Z^2*x^12 + 4*N^3*Z*x^2 + 12*N^3*Z*x^3 + -32*N^3*Z*x^5 + -24*N^3*Z*x^6 + 24*N^3*Z*x^7 + 32*N^3*Z*x^8 + -12*N^3*Z*x^10 + -4*N^3*Z*x^11
theorem gauge_normalize_11c3BC (n : ℕ) :
 (closedGaugeJetBDEE n true true 3).c=gaugeNum11c3BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (6*(1-runXBDEE)^7) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum11c3BC,runXBDEE]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum11d1BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 2 + -1*x + -4*x^2 + -1*x^3 + 4*Z*x^3 + 1*N + 1*N*x + -1*N*x^2 + -1*N*x^3
theorem gauge_normalize_11d1BC (n : ℕ) :
 (closedGaugeJetBDEE n true true 1).d=gaugeNum11d1BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^2) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum11d1BC,runXBDEE]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum11d2BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 2 + 2*x^2 + 28*x^3 + 42*x^4 + 20*x^5 + 2*x^6 + -12*Z*x^2 + -24*Z*x^3 + -24*Z*x^4 + -24*Z*x^5 + -12*Z*x^6 + -4*Z^2*x^4 + -4*Z^2*x^5 + 4*Z^2*x^6 + 4*Z^2*x^7 + 3*N + -2*N*x + -19*N*x^2 + -12*N*x^3 + 13*N*x^4 + 14*N*x^5 + 3*N*x^6 + -8*N*Z*x^2 + -8*N*Z*x^3 + 8*N*Z*x^4 + 8*N*Z*x^5 + 1*N^2 + 2*N^2*x + -1*N^2*x^2 + -4*N^2*x^3 + -1*N^2*x^4 + 2*N^2*x^5 + 1*N^2*x^6
theorem gauge_normalize_11d2BC (n : ℕ) :
 (closedGaugeJetBDEE n true true 2).d=gaugeNum11d2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (2*(1-runXBDEE)^4) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum11d2BC,runXBDEE]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum11d3BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -36*x^2 + -258*x^3 + -756*x^4 + -1170*x^5 + -1020*x^6 + -486*x^7 + -108*x^8 + -6*x^9 + 36*Z*x^2 + 258*Z*x^3 + 720*Z*x^4 + 1062*Z*x^5 + 948*Z*x^6 + 558*Z*x^7 + 216*Z*x^8 + 42*Z*x^9 + 36*Z^2*x^4 + 108*Z^2*x^5 + 72*Z^2*x^6 + -72*Z^2*x^7 + -108*Z^2*x^8 + -36*Z^2*x^9 + 2*N + 3*N*x + 54*N*x^2 + 242*N*x^3 + 354*N*x^4 + 72*N*x^5 + -302*N*x^6 + -306*N*x^7 + -108*N*x^8 + -11*N*x^9 + 24*N*Z*x^2 + 156*N*Z*x^3 + 288*N*Z*x^4 + 84*N*Z*x^5 + -264*N*Z*x^6 + -252*N*Z*x^7 + -48*N*Z*x^8 + 12*N*Z*x^9 + 12*N*Z^2*x^4 + 24*N*Z^2*x^5 + -12*N*Z^2*x^6 + -48*N*Z^2*x^7 + -12*N*Z^2*x^8 + 24*N*Z^2*x^9 + 12*N*Z^2*x^10 + 3*N^2 + -6*N^2*x + -48*N^2*x^2 + -48*N^2*x^3 + 54*N^2*x^4 + 108*N^2*x^5 + 24*N^2*x^6 + -48*N^2*x^7 + -33*N^2*x^8 + -6*N^2*x^9 + 12*N^2*Z*x^3 + 24*N^2*Z*x^4 + -12*N^2*Z*x^5 + -48*N^2*Z*x^6 + -12*N^2*Z*x^7 + 24*N^2*Z*x^8 + 12*N^2*Z*x^9 + 1*N^3 + 3*N^3*x + -8*N^3*x^3 + -6*N^3*x^4 + 6*N^3*x^5 + 8*N^3*x^6 + -3*N^3*x^8 + -1*N^3*x^9
theorem gauge_normalize_11d3BC (n : ℕ) :
 (closedGaugeJetBDEE n true true 3).d=gaugeNum11d3BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (6*(1-runXBDEE)^6) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum11d3BC,runXBDEE]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum11d4BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 192*x^2 + 2304*x^3 + 11256*x^4 + 30432*x^5 + 51072*x^6 + 55776*x^7 + 39984*x^8 + 18336*x^9 + 4992*x^10 + 672*x^11 + 24*x^12 + -192*Z*x^2 + -2304*Z*x^3 + -10968*Z*x^4 + -28800*Z*x^5 + -47520*Z*x^6 + -52608*Z*x^7 + -40464*Z*x^8 + -21888*Z*x^9 + -8160*Z*x^10 + -1920*Z*x^11 + -216*Z*x^12 + -288*Z^2*x^4 + -1632*Z^2*x^5 + -3552*Z^2*x^6 + -3168*Z^2*x^7 + 480*Z^2*x^8 + 3552*Z^2*x^9 + 3168*Z^2*x^10 + 1248*Z^2*x^11 + 192*Z^2*x^12 + -2*N + -8*N*x + -392*N*x^2 + -2824*N*x^3 + -8570*N*x^4 + -13040*N*x^5 + -8064*N*x^6 + 4688*N*x^7 + 12746*N*x^8 + 10360*N*x^9 + 4232*N*x^10 + 824*N*x^11 + 50*N*x^12 + -200*N*Z*x^2 + -1752*N*Z*x^3 + -6192*N*Z*x^4 + -10784*N*Z*x^5 + -7728*N*Z*x^6 + 3696*N*Z*x^7 + 11648*N*Z*x^8 + 8928*N*Z*x^9 + 2616*N*Z*x^10 + -88*N*Z*x^11 + -144*N*Z*x^12 + -168*N*Z^2*x^4 + -696*N*Z^2*x^5 + -768*N*Z^2*x^6 + 576*N*Z^2*x^7 + 1776*N*Z^2*x^8 + 912*N*Z^2*x^9 + -576*N*Z^2*x^10 + -768*N*Z^2*x^11 + -264*N*Z^2*x^12 + -24*N*Z^2*x^13 + -1*N^2 + 20*N^2*x + 298*N^2*x^2 + 1140*N^2*x^3 + 1637*N^2*x^4 + -56*N^2*x^5 + -2884*N^2*x^6 + -3032*N^2*x^7 + -295*N^2*x^8 + 1572*N^2*x^9 + 1210*N^2*x^10 + 356*N^2*x^11 + 35*N^2*x^12 + -72*N^2*Z*x^2 + -336*N^2*Z*x^3 + -600*N^2*Z*x^4 + -384*N^2*Z*x^5 + 432*N^2*Z*x^6 + 1248*N^2*Z*x^7 + 1104*N^2*Z*x^8 + -744*N^2*Z*x^10 + -528*N^2*Z*x^11 + -120*N^2*Z*x^12 + -24*N^2*Z^2*x^4 + -72*N^2*Z^2*x^5 + 192*N^2*Z^2*x^7 + 144*N^2*Z^2*x^8 + -144*N^2*Z^2*x^9 + -192*N^2*Z^2*x^10 + 72*N^2*Z^2*x^12 + 24*N^2*Z^2*x^13 + 2*N^3 + -16*N^3*x + -100*N^3*x^2 + -128*N^3*x^3 + 134*N^3*x^4 + 416*N^3*x^5 + 168*N^3*x^6 + -320*N^3*x^7 + -338*N^3*x^8 + -16*N^3*x^9 + 124*N^3*x^10 + 64*N^3*x^11 + 10*N^3*x^12 + -16*N^3*Z*x^2 + -48*N^3*Z*x^3 + 128*N^3*Z*x^5 + 96*N^3*Z*x^6 + -96*N^3*Z*x^7 + -128*N^3*Z*x^8 + 48*N^3*Z*x^10 + 16*N^3*Z*x^11 + 1*N^4 + 4*N^4*x + 2*N^4*x^2 + -12*N^4*x^3 + -17*N^4*x^4 + 8*N^4*x^5 + 28*N^4*x^6 + 8*N^4*x^7 + -17*N^4*x^8 + -12*N^4*x^9 + 2*N^4*x^10 + 4*N^4*x^11 + 1*N^4*x^12
theorem gauge_normalize_11d4BC (n : ℕ) :
 closedGaugeD4N6604 n true true=gaugeNum11d4BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (24*(1-runXBDEE)^8) := by
 unfold closedGaugeD4N6604
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum11d4BC,runXBDEE]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
