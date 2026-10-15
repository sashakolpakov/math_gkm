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

def gaugeNum10a1BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 1*Z*x
theorem gauge_normalize_10a1BC (n : ℕ) :
 (closedGaugeJetBDEE n true false 1).a=gaugeNum10a1BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^0) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum10a1BC,runXBDEE]
 try simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum10a2BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -1*x + -3*x^2 + -3*x^3 + -1*x^4 + 1*Z*x + 1*Z*x^2 + -1*Z*x^3 + -1*Z*x^4 + 2*Z^2*x^2 + 4*Z^2*x^3 + 2*Z^2*x^4 + 3*N*Z*x + 4*N*Z*x^2 + -2*N*Z*x^3 + -4*N*Z*x^4 + -1*N*Z*x^5
theorem gauge_normalize_10a2BC (n : ℕ) :
 (closedGaugeJetBDEE n true false 2).a=gaugeNum10a2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^3) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum10a2BC,runXBDEE]
 try simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum10b2BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -1*x + -2*x^2 + -1*x^3 + 1*Z*x + 2*Z*x^2 + 1*Z*x^3 + 1*N + 1*N*x + -1*N*x^2 + -1*N*x^3
theorem gauge_normalize_10b2BC (n : ℕ) :
 (closedGaugeJetBDEE n true false 2).b=gaugeNum10b2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^2) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum10b2BC,runXBDEE]
 try simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum10b3BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 4*x + 18*x^2 + 32*x^3 + 28*x^4 + 12*x^5 + 2*x^6 + -4*Z*x + -18*Z*x^2 + -32*Z*x^3 + -28*Z*x^4 + -12*Z*x^5 + -2*Z*x^6 + -1*N + -6*N*x + -11*N*x^2 + -4*N*x^3 + 9*N*x^4 + 10*N*x^5 + 3*N*x^6 + -2*N*Z*x + -6*N*Z*x^2 + -4*N*Z*x^3 + 4*N*Z*x^4 + 6*N*Z*x^5 + 2*N*Z*x^6 + 1*N^2 + 2*N^2*x + -1*N^2*x^2 + -4*N^2*x^3 + -1*N^2*x^4 + 2*N^2*x^5 + 1*N^2*x^6
theorem gauge_normalize_10b3BC (n : ℕ) :
 (closedGaugeJetBDEE n true false 3).b=gaugeNum10b3BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (2*(1-runXBDEE)^4) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum10b3BC,runXBDEE]
 try simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum10c1BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -1*x + -3*x^2 + -3*x^3 + -1*x^4 + 2*Z*x + -2*Z*x^2 + -2*Z*x^3 + 2*Z*x^4 + 4*Z^2*x^2 + 2*Z^2*x^3 + 4*Z^2*x^4 + -2*Z^2*x^5 + 4*N*Z*x + 4*N*Z*x^2 + -4*N*Z*x^3 + -4*N*Z*x^4
theorem gauge_normalize_10c1BC (n : ℕ) :
 (closedGaugeJetBDEE n true false 1).c=gaugeNum10c1BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^3) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum10c1BC,runXBDEE]
 try simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum10c2BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 5*x^2 + 21*x^3 + 34*x^4 + 26*x^5 + 9*x^6 + 1*x^7 + -1*Z*x^2 + 1*Z*x^3 + 6*Z*x^4 + 2*Z*x^5 + -5*Z*x^6 + -3*Z*x^7 + -4*Z^2*x^2 + -22*Z^2*x^3 + -36*Z^2*x^4 + -24*Z^2*x^5 + -8*Z^2*x^6 + -2*Z^2*x^7 + -4*Z^3*x^4 + -4*Z^3*x^5 + 4*Z^3*x^6 + 4*Z^3*x^7 + -1*N*x + -4*N*x^2 + -5*N*x^3 + 5*N*x^5 + 4*N*x^6 + 1*N*x^7 + -12*N*Z*x^2 + -28*N*Z*x^3 + -8*N*Z*x^4 + 24*N*Z*x^5 + 20*N*Z*x^6 + 4*N*Z*x^7 + -4*N*Z^2*x^2 + -14*N*Z^2*x^3 + -2*N*Z^2*x^4 + 20*N*Z^2*x^5 + 8*N*Z^2*x^6 + -6*N*Z^2*x^7 + -2*N*Z^2*x^8
theorem gauge_normalize_10c2BC (n : ℕ) :
 (closedGaugeJetBDEE n true false 2).c=gaugeNum10c2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^5) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum10c2BC,runXBDEE]
 try simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum10c3BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -48*x^2 + -354*x^3 + -1122*x^4 + -1986*x^5 + -2130*x^6 + -1398*x^7 + -534*x^8 + -102*x^9 + -6*x^10 + 24*Z*x^2 + 66*Z*x^3 + -30*Z*x^4 + -270*Z*x^5 + -270*Z*x^6 + 54*Z*x^7 + 246*Z*x^8 + 150*Z*x^9 + 30*Z*x^10 + 24*Z^2*x^2 + 288*Z^2*x^3 + 1104*Z^2*x^4 + 2088*Z^2*x^5 + 2232*Z^2*x^6 + 1392*Z^2*x^7 + 480*Z^2*x^8 + 72*Z^2*x^9 + 48*Z^3*x^4 + 168*Z^3*x^5 + 168*Z^3*x^6 + -48*Z^3*x^7 + -192*Z^3*x^8 + -120*Z^3*x^9 + -24*Z^3*x^10 + 3*N*x + 51*N*x^2 + 216*N*x^3 + 384*N*x^4 + 246*N*x^5 + -162*N*x^6 + -384*N*x^7 + -264*N*x^8 + -81*N*x^9 + -9*N*x^10 + 2*N*Z*x + 120*N*Z*x^2 + 624*N*Z*x^3 + 1232*N*Z*x^4 + 852*N*Z*x^5 + -528*N*Z*x^6 + -1280*N*Z*x^7 + -816*N*Z*x^8 + -198*N*Z*x^9 + -8*N*Z*x^10 + 36*N*Z^2*x^2 + 234*N*Z^2*x^3 + 540*N*Z^2*x^4 + 396*N*Z^2*x^5 + -348*N*Z^2*x^6 + -720*N*Z^2*x^7 + -300*N*Z^2*x^8 + 84*N*Z^2*x^9 + 72*N*Z^2*x^10 + 6*N*Z^2*x^11 + 24*N*Z^3*x^4 + 48*N*Z^3*x^5 + -24*N*Z^3*x^6 + -96*N*Z^3*x^7 + -24*N*Z^3*x^8 + 48*N*Z^3*x^9 + 24*N*Z^3*x^10 + -3*N^2*x + -15*N^2*x^2 + -24*N^2*x^3 + 42*N^2*x^5 + 42*N^2*x^6 + -24*N^2*x^8 + -15*N^2*x^9 + -3*N^2*x^10 + 6*N^2*Z*x + 6*N^2*Z*x^2 + -24*N^2*Z*x^3 + -24*N^2*Z*x^4 + 36*N^2*Z*x^5 + 36*N^2*Z*x^6 + -24*N^2*Z*x^7 + -24*N^2*Z*x^8 + 6*N^2*Z*x^9 + 6*N^2*Z*x^10 + 12*N^2*Z^2*x^2 + 30*N^2*Z^2*x^3 + 12*N^2*Z^2*x^4 + -36*N^2*Z^2*x^5 + -60*N^2*Z^2*x^6 + -24*N^2*Z^2*x^7 + 36*N^2*Z^2*x^8 + 36*N^2*Z^2*x^9 + -6*N^2*Z^2*x^11 + 4*N^3*Z*x + 12*N^3*Z*x^2 + -32*N^3*Z*x^4 + -24*N^3*Z*x^5 + 24*N^3*Z*x^6 + 32*N^3*Z*x^7 + -12*N^3*Z*x^9 + -4*N^3*Z*x^10
theorem gauge_normalize_10c3BC (n : ℕ) :
 (closedGaugeJetBDEE n true false 3).c=gaugeNum10c3BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (6*(1-runXBDEE)^7) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum10c3BC,runXBDEE]
 try simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum10d1BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 1 + -2*x + -3*x^2 + 2*Z*x + 2*Z*x^3 + 1*N + 1*N*x + -1*N*x^2 + -1*N*x^3
theorem gauge_normalize_10d1BC (n : ℕ) :
 (closedGaugeJetBDEE n true false 1).d=gaugeNum10d1BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^2) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum10d1BC,runXBDEE]
 try simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum10d2BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 4*x + 20*x^2 + 36*x^3 + 28*x^4 + 8*x^5 + -4*Z*x + -20*Z*x^2 + -32*Z*x^3 + -24*Z*x^4 + -12*Z*x^5 + -4*Z*x^6 + -4*Z^2*x^3 + -4*Z^2*x^4 + 4*Z^2*x^5 + 4*Z^2*x^6 + 1*N + -6*N*x + -17*N*x^2 + -4*N*x^3 + 15*N*x^4 + 10*N*x^5 + 1*N*x^6 + -4*N*Z*x + -12*N*Z*x^2 + 16*N*Z*x^4 + 4*N*Z*x^5 + -4*N*Z*x^6 + 1*N^2 + 2*N^2*x + -1*N^2*x^2 + -4*N^2*x^3 + -1*N^2*x^4 + 2*N^2*x^5 + 1*N^2*x^6
theorem gauge_normalize_10d2BC (n : ℕ) :
 (closedGaugeJetBDEE n true false 2).d=gaugeNum10d2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (2*(1-runXBDEE)^4) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum10d2BC,runXBDEE]
 try simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum10d3BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -12*x + -138*x^2 + -540*x^3 + -1050*x^4 + -1140*x^5 + -702*x^6 + -228*x^7 + -30*x^8 + 12*Z*x + 138*Z*x^2 + 516*Z*x^3 + 966*Z*x^4 + 1056*Z*x^5 + 726*Z*x^6 + 324*Z*x^7 + 90*Z*x^8 + 12*Z*x^9 + 24*Z^2*x^3 + 84*Z^2*x^4 + 84*Z^2*x^5 + -24*Z^2*x^6 + -96*Z^2*x^7 + -60*Z^2*x^8 + -12*Z^2*x^9 + -1*N + 24*N*x + 150*N*x^2 + 314*N*x^3 + 228*N*x^4 + -126*N*x^5 + -326*N*x^6 + -210*N*x^7 + -51*N*x^8 + -2*N*x^9 + 18*N*Z*x + 108*N*Z*x^2 + 240*N*Z*x^3 + 180*N*Z*x^4 + -132*N*Z*x^5 + -300*N*Z*x^6 + -144*N*Z*x^7 + 12*N*Z*x^8 + 18*N*Z*x^9 + 12*N*Z^2*x^3 + 24*N*Z^2*x^4 + -12*N*Z^2*x^5 + -48*N*Z^2*x^6 + -12*N*Z^2*x^7 + 24*N*Z^2*x^8 + 12*N*Z^2*x^9 + -15*N^2*x + -48*N^2*x^2 + -24*N^2*x^3 + 72*N^2*x^4 + 90*N^2*x^5 + -48*N^2*x^7 + -24*N^2*x^8 + -3*N^2*x^9 + 6*N^2*Z*x + 12*N^2*Z*x^2 + -12*N^2*Z*x^4 + -12*N^2*Z*x^5 + -12*N^2*Z*x^6 + 12*N^2*Z*x^8 + 6*N^2*Z*x^9 + 1*N^3 + 3*N^3*x + -8*N^3*x^3 + -6*N^3*x^4 + 6*N^3*x^5 + 8*N^3*x^6 + -3*N^3*x^8 + -1*N^3*x^9
theorem gauge_normalize_10d3BC (n : ℕ) :
 (closedGaugeJetBDEE n true false 3).d=gaugeNum10d3BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (6*(1-runXBDEE)^6) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum10d3BC,runXBDEE]
 try simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum10d4BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 48*x + 984*x^2 + 6384*x^3 + 21312*x^4 + 43008*x^5 + 56112*x^6 + 48384*x^7 + 27264*x^8 + 9552*x^9 + 1848*x^10 + 144*x^11 + -48*Z*x + -984*Z*x^2 + -6240*Z*x^3 + -20304*Z*x^4 + -40224*Z*x^5 + -52560*Z*x^6 + -47232*Z*x^7 + -29760*Z*x^8 + -13104*Z*x^9 + -3864*Z*x^10 + -672*Z*x^11 + -48*Z*x^12 + -144*Z^2*x^3 + -1008*Z^2*x^4 + -2784*Z^2*x^5 + -3552*Z^2*x^6 + -1152*Z^2*x^7 + 2496*Z^2*x^8 + 3552*Z^2*x^9 + 2016*Z^2*x^10 + 528*Z^2*x^11 + 48*Z^2*x^12 + 2*N + -112*N*x + -1296*N*x^2 + -5440*N*x^3 + -11374*N*x^4 + -11712*N*x^5 + -1904*N*x^6 + 9760*N*x^7 + 12390*N*x^8 + 7216*N*x^9 + 2176*N*x^10 + 288*N*x^11 + 6*N*x^12 + -88*N*Z*x + -992*N*Z*x^2 + -4352*N*Z*x^3 + -9496*N*Z*x^4 + -9872*N*Z*x^5 + -800*N*Z*x^6 + 9760*N*Z*x^7 + 10928*N*Z*x^8 + 4904*N*Z*x^9 + 448*N*Z*x^10 + -352*N*Z*x^11 + -88*N*Z*x^12 + -120*N*Z^2*x^3 + -552*N*Z^2*x^4 + -768*N*Z^2*x^5 + 192*N*Z^2*x^6 + 1488*N*Z^2*x^7 + 1200*N*Z^2*x^8 + -192*N*Z^2*x^9 + -768*N*Z^2*x^10 + -408*N*Z^2*x^11 + -72*N*Z^2*x^12 + -1*N^2 + 92*N^2*x + 610*N^2*x^2 + 1452*N^2*x^3 + 1133*N^2*x^4 + -1256*N^2*x^5 + -3220*N^2*x^6 + -2024*N^2*x^7 + 617*N^2*x^8 + 1548*N^2*x^9 + 850*N^2*x^10 + 188*N^2*x^11 + 11*N^2*x^12 + -48*N^2*Z*x + -288*N^2*Z*x^2 + -624*N^2*Z*x^3 + -432*N^2*Z*x^4 + 480*N^2*Z*x^5 + 1152*N^2*Z*x^6 + 864*N^2*Z*x^7 + 96*N^2*Z*x^8 + -432*N^2*Z*x^9 + -480*N^2*Z*x^10 + -240*N^2*Z*x^11 + -48*N^2*Z*x^12 + -24*N^2*Z^2*x^3 + -72*N^2*Z^2*x^4 + 192*N^2*Z^2*x^6 + 144*N^2*Z^2*x^7 + -144*N^2*Z^2*x^8 + -192*N^2*Z^2*x^9 + 72*N^2*Z^2*x^11 + 24*N^2*Z^2*x^12 + -2*N^3 + -32*N^3*x + -108*N^3*x^2 + -80*N^3*x^3 + 202*N^3*x^4 + 384*N^3*x^5 + 56*N^3*x^6 + -352*N^3*x^7 + -270*N^3*x^8 + 32*N^3*x^9 + 116*N^3*x^10 + 48*N^3*x^11 + 6*N^3*x^12 + -8*N^3*Z*x + -40*N^3*Z*x^2 + -40*N^3*Z*x^3 + 88*N^3*Z*x^4 + 176*N^3*Z*x^5 + -16*N^3*Z*x^6 + -208*N^3*Z*x^7 + -80*N^3*Z*x^8 + 88*N^3*Z*x^9 + 56*N^3*Z*x^10 + -8*N^3*Z*x^11 + -8*N^3*Z*x^12 + 1*N^4 + 4*N^4*x + 2*N^4*x^2 + -12*N^4*x^3 + -17*N^4*x^4 + 8*N^4*x^5 + 28*N^4*x^6 + 8*N^4*x^7 + -17*N^4*x^8 + -12*N^4*x^9 + 2*N^4*x^10 + 4*N^4*x^11 + 1*N^4*x^12
theorem gauge_normalize_10d4BC (n : ℕ) :
 closedGaugeD4N6604 n true false=gaugeNum10d4BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (24*(1-runXBDEE)^8) := by
 unfold closedGaugeD4N6604
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 
 try dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum14BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,jetNum34BC,gaugeNum10d4BC,runXBDEE]
 try simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
