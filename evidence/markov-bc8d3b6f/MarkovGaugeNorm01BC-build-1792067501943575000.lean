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

def gaugeNum01a1BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 1*Z*x^2
theorem gauge_normalize_01a1BC (n : ℕ) :
 (closedGaugeJetBDEE n false true 1).a=gaugeNum01a1BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^0) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 unfold jetNum00BC jetNum01BC jetNum02BC jetNum03BC jetNum10BC jetNum11BC jetNum12BC jetNum13BC jetNum14BC jetNum20BC jetNum21BC jetNum22BC jetNum23BC jetNum30BC jetNum31BC jetNum32BC jetNum33BC jetNum34BC gaugeNum01a1BC runXBDEE
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum01a2BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -1*x + -3*x^2 + -3*x^3 + -1*x^4 + 4*Z*x^2 + 5*Z*x^3 + -3*Z*x^4 + -5*Z*x^5 + -1*Z*x^6 + 2*Z^2*x^4 + 4*Z^2*x^5 + 2*Z^2*x^6 + 3*N*Z*x^2 + 4*N*Z*x^3 + -2*N*Z*x^4 + -4*N*Z*x^5 + -1*N*Z*x^6
theorem gauge_normalize_01a2BC (n : ℕ) :
 (closedGaugeJetBDEE n false true 2).a=gaugeNum01a2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^3) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 unfold jetNum00BC jetNum01BC jetNum02BC jetNum03BC jetNum10BC jetNum11BC jetNum12BC jetNum13BC jetNum14BC jetNum20BC jetNum21BC jetNum22BC jetNum23BC jetNum30BC jetNum31BC jetNum32BC jetNum33BC jetNum34BC gaugeNum01a2BC runXBDEE
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum01b2BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 1 + -3*x^2 + -2*x^3 + 1*Z*x^2 + 2*Z*x^3 + 1*Z*x^4 + 1*N + 1*N*x + -1*N*x^2 + -1*N*x^3
theorem gauge_normalize_01b2BC (n : ℕ) :
 (closedGaugeJetBDEE n false true 2).b=gaugeNum01b2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^2) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 unfold jetNum00BC jetNum01BC jetNum02BC jetNum03BC jetNum10BC jetNum11BC jetNum12BC jetNum13BC jetNum14BC jetNum20BC jetNum21BC jetNum22BC jetNum23BC jetNum30BC jetNum31BC jetNum32BC jetNum33BC jetNum34BC gaugeNum01b2BC runXBDEE
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum01b3BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 6*x^2 + 24*x^3 + 36*x^4 + 24*x^5 + 6*x^6 + -6*Z*x^2 + -24*Z*x^3 + -36*Z*x^4 + -24*Z*x^5 + -6*Z*x^6 + 1*N + -2*N*x + -13*N*x^2 + -12*N*x^3 + 7*N*x^4 + 14*N*x^5 + 5*N*x^6 + -2*N*Z*x^2 + -6*N*Z*x^3 + -4*N*Z*x^4 + 4*N*Z*x^5 + 6*N*Z*x^6 + 2*N*Z*x^7 + 1*N^2 + 2*N^2*x + -1*N^2*x^2 + -4*N^2*x^3 + -1*N^2*x^4 + 2*N^2*x^5 + 1*N^2*x^6
theorem gauge_normalize_01b3BC (n : ℕ) :
 (closedGaugeJetBDEE n false true 3).b=gaugeNum01b3BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (2*(1-runXBDEE)^4) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 unfold jetNum00BC jetNum01BC jetNum02BC jetNum03BC jetNum10BC jetNum11BC jetNum12BC jetNum13BC jetNum14BC jetNum20BC jetNum21BC jetNum22BC jetNum23BC jetNum30BC jetNum31BC jetNum32BC jetNum33BC jetNum34BC gaugeNum01b3BC runXBDEE
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum01c1BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -1*x + -3*x^2 + -3*x^3 + -1*x^4 + 6*Z*x^2 + 2*Z*x^3 + -6*Z*x^4 + -2*Z*x^5 + -2*Z^2*x^3 + 8*Z^2*x^4 + 2*Z^2*x^5 + 4*N*Z*x^2 + 4*N*Z*x^3 + -4*N*Z*x^4 + -4*N*Z*x^5
theorem gauge_normalize_01c1BC (n : ℕ) :
 (closedGaugeJetBDEE n false true 1).c=gaugeNum01c1BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^3) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 unfold jetNum00BC jetNum01BC jetNum02BC jetNum03BC jetNum10BC jetNum11BC jetNum12BC jetNum13BC jetNum14BC jetNum20BC jetNum21BC jetNum22BC jetNum23BC jetNum30BC jetNum31BC jetNum32BC jetNum33BC jetNum34BC gaugeNum01c1BC runXBDEE
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum01c2BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -1*x + 1*x^2 + 16*x^3 + 34*x^4 + 31*x^5 + 13*x^6 + 2*x^7 + 2*Z*x^2 + -9*Z*x^3 + -29*Z*x^4 + -10*Z*x^5 + 24*Z*x^6 + 19*Z*x^7 + 3*Z*x^8 + -8*Z^2*x^3 + -10*Z^2*x^4 + -12*Z^2*x^5 + -32*Z^2*x^6 + -28*Z^2*x^7 + -6*Z^2*x^8 + -4*Z^3*x^5 + -4*Z^3*x^6 + 4*Z^3*x^7 + 4*Z^3*x^8 + -1*N*x + -4*N*x^2 + -5*N*x^3 + 5*N*x^5 + 4*N*x^6 + 1*N*x^7 + -12*N*Z*x^3 + -28*N*Z*x^4 + -8*N*Z*x^5 + 24*N*Z*x^6 + 20*N*Z*x^7 + 4*N*Z*x^8 + -6*N*Z^2*x^3 + -6*N*Z^2*x^4 + 4*N*Z^2*x^5 + 4*N*Z^2*x^6 + 2*N*Z^2*x^7 + 2*N*Z^2*x^8
theorem gauge_normalize_01c2BC (n : ℕ) :
 (closedGaugeJetBDEE n false true 2).c=gaugeNum01c2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^5) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 unfold jetNum00BC jetNum01BC jetNum02BC jetNum03BC jetNum10BC jetNum11BC jetNum12BC jetNum13BC jetNum14BC jetNum20BC jetNum21BC jetNum22BC jetNum23BC jetNum30BC jetNum31BC jetNum32BC jetNum33BC jetNum34BC gaugeNum01c2BC runXBDEE
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum01c3BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -12*x^2 + -162*x^3 + -738*x^4 + -1698*x^5 + -2250*x^6 + -1782*x^7 + -822*x^8 + -198*x^9 + -18*x^10 + 12*Z*x^2 + 126*Z*x^3 + 522*Z*x^4 + 1002*Z*x^5 + 738*Z*x^6 + -378*Z*x^7 + -1074*Z*x^8 + -738*Z*x^9 + -198*Z*x^10 + -12*Z*x^11 + 36*Z^2*x^3 + 216*Z^2*x^4 + 624*Z^2*x^5 + 1296*Z^2*x^6 + 2016*Z^2*x^7 + 2040*Z^2*x^8 + 1152*Z^2*x^9 + 288*Z^2*x^10 + 12*Z^2*x^11 + 72*Z^3*x^5 + 216*Z^3*x^6 + 144*Z^3*x^7 + -144*Z^3*x^8 + -216*Z^3*x^9 + -72*Z^3*x^10 + -3*N*x + 21*N*x^2 + 168*N*x^3 + 384*N*x^4 + 330*N*x^5 + -78*N*x^6 + -384*N*x^7 + -312*N*x^8 + -111*N*x^9 + -15*N*x^10 + 38*N*Z*x^2 + 204*N*Z*x^3 + 576*N*Z*x^4 + 992*N*Z*x^5 + 780*N*Z*x^6 + -312*N*Z*x^7 + -1136*N*Z*x^8 + -864*N*Z*x^9 + -258*N*Z*x^10 + -20*N*Z*x^11 + 18*N*Z^2*x^3 + 180*N*Z^2*x^4 + 420*N*Z^2*x^5 + 276*N*Z^2*x^6 + -168*N*Z^2*x^7 + -324*N*Z^2*x^8 + -228*N*Z^2*x^9 + -132*N*Z^2*x^10 + -42*N*Z^2*x^11 + 24*N*Z^3*x^5 + 48*N*Z^3*x^6 + -24*N*Z^3*x^7 + -96*N*Z^3*x^8 + -24*N*Z^3*x^9 + 48*N*Z^3*x^10 + 24*N*Z^3*x^11 + -3*N^2*x + -15*N^2*x^2 + -24*N^2*x^3 + 42*N^2*x^5 + 42*N^2*x^6 + -24*N^2*x^8 + -15*N^2*x^9 + -3*N^2*x^10 + 18*N^2*Z*x^2 + 42*N^2*Z*x^3 + -24*N^2*Z*x^4 + -120*N^2*Z*x^5 + -36*N^2*Z*x^6 + 108*N^2*Z*x^7 + 72*N^2*Z*x^8 + -24*N^2*Z*x^9 + -30*N^2*Z*x^10 + -6*N^2*Z*x^11 + -6*N^2*Z^2*x^3 + 12*N^2*Z^2*x^4 + 60*N^2*Z^2*x^5 + 12*N^2*Z^2*x^6 + -96*N^2*Z^2*x^7 + -60*N^2*Z^2*x^8 + 36*N^2*Z^2*x^9 + 36*N^2*Z^2*x^10 + 6*N^2*Z^2*x^11 + 4*N^3*Z*x^2 + 12*N^3*Z*x^3 + -32*N^3*Z*x^5 + -24*N^3*Z*x^6 + 24*N^3*Z*x^7 + 32*N^3*Z*x^8 + -12*N^3*Z*x^10 + -4*N^3*Z*x^11
theorem gauge_normalize_01c3BC (n : ℕ) :
 (closedGaugeJetBDEE n false true 3).c=gaugeNum01c3BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (6*(1-runXBDEE)^7) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 unfold jetNum00BC jetNum01BC jetNum02BC jetNum03BC jetNum10BC jetNum11BC jetNum12BC jetNum13BC jetNum14BC jetNum20BC jetNum21BC jetNum22BC jetNum23BC jetNum30BC jetNum31BC jetNum32BC jetNum33BC jetNum34BC gaugeNum01c3BC runXBDEE
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum01d1BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 2 + -1*x + -4*x^2 + -1*x^3 + -2*Z*x + 4*Z*x^2 + 2*Z*x^3 + 1*N + 1*N*x + -1*N*x^2 + -1*N*x^3
theorem gauge_normalize_01d1BC (n : ℕ) :
 (closedGaugeJetBDEE n false true 1).d=gaugeNum01d1BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (1*(1-runXBDEE)^2) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 unfold jetNum00BC jetNum01BC jetNum02BC jetNum03BC jetNum10BC jetNum11BC jetNum12BC jetNum13BC jetNum14BC jetNum20BC jetNum21BC jetNum22BC jetNum23BC jetNum30BC jetNum31BC jetNum32BC jetNum33BC jetNum34BC gaugeNum01d1BC runXBDEE
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum01d2BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 2 + 2*x^2 + 28*x^3 + 42*x^4 + 20*x^5 + 2*x^6 + -4*Z*x + -4*Z*x^2 + -16*Z*x^3 + -40*Z*x^4 + -28*Z*x^5 + -4*Z*x^6 + -4*Z^2*x^3 + -4*Z^2*x^4 + 4*Z^2*x^5 + 4*Z^2*x^6 + 3*N + -2*N*x + -19*N*x^2 + -12*N*x^3 + 13*N*x^4 + 14*N*x^5 + 3*N*x^6 + -4*N*Z*x + -4*N*Z*x^2 + 4*N*Z*x^5 + 4*N*Z*x^6 + 1*N^2 + 2*N^2*x + -1*N^2*x^2 + -4*N^2*x^3 + -1*N^2*x^4 + 2*N^2*x^5 + 1*N^2*x^6
theorem gauge_normalize_01d2BC (n : ℕ) :
 (closedGaugeJetBDEE n false true 2).d=gaugeNum01d2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (2*(1-runXBDEE)^4) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 unfold jetNum00BC jetNum01BC jetNum02BC jetNum03BC jetNum10BC jetNum11BC jetNum12BC jetNum13BC jetNum14BC jetNum20BC jetNum21BC jetNum22BC jetNum23BC jetNum30BC jetNum31BC jetNum32BC jetNum33BC jetNum34BC gaugeNum01d2BC runXBDEE
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum01d3BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 -36*x^2 + -258*x^3 + -756*x^4 + -1170*x^5 + -1020*x^6 + -486*x^7 + -108*x^8 + -6*x^9 + 36*Z*x^2 + 222*Z*x^3 + 648*Z*x^4 + 1098*Z*x^5 + 1092*Z*x^6 + 594*Z*x^7 + 144*Z*x^8 + 6*Z*x^9 + 36*Z^2*x^3 + 108*Z^2*x^4 + 72*Z^2*x^5 + -72*Z^2*x^6 + -108*Z^2*x^7 + -36*Z^2*x^8 + 2*N + 3*N*x + 54*N*x^2 + 242*N*x^3 + 354*N*x^4 + 72*N*x^5 + -302*N*x^6 + -306*N*x^7 + -108*N*x^8 + -11*N*x^9 + -6*N*Z*x + 48*N*Z*x^2 + 204*N*Z*x^3 + 216*N*Z*x^4 + -24*N*Z*x^5 + -192*N*Z*x^6 + -156*N*Z*x^7 + -72*N*Z*x^8 + -18*N*Z*x^9 + 12*N*Z^2*x^3 + 24*N*Z^2*x^4 + -12*N*Z^2*x^5 + -48*N*Z^2*x^6 + -12*N*Z^2*x^7 + 24*N*Z^2*x^8 + 12*N*Z^2*x^9 + 3*N^2 + -6*N^2*x + -48*N^2*x^2 + -48*N^2*x^3 + 54*N^2*x^4 + 108*N^2*x^5 + 24*N^2*x^6 + -48*N^2*x^7 + -33*N^2*x^8 + -6*N^2*x^9 + -6*N^2*Z*x + 36*N^2*Z*x^3 + 24*N^2*Z*x^4 + -48*N^2*Z*x^5 + -48*N^2*Z*x^6 + 12*N^2*Z*x^7 + 24*N^2*Z*x^8 + 6*N^2*Z*x^9 + 1*N^3 + 3*N^3*x + -8*N^3*x^3 + -6*N^3*x^4 + 6*N^3*x^5 + 8*N^3*x^6 + -3*N^3*x^8 + -1*N^3*x^9
theorem gauge_normalize_01d3BC (n : ℕ) :
 (closedGaugeJetBDEE n false true 3).d=gaugeNum01d3BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (6*(1-runXBDEE)^6) := by
 unfold closedGaugeJetBDEE
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 unfold jetNum00BC jetNum01BC jetNum02BC jetNum03BC jetNum10BC jetNum11BC jetNum12BC jetNum13BC jetNum14BC jetNum20BC jetNum21BC jetNum22BC jetNum23BC jetNum30BC jetNum31BC jetNum32BC jetNum33BC jetNum34BC gaugeNum01d3BC runXBDEE
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring

def gaugeNum01d4BC {A : Type*} [CommRing A] (N Z x : A) : A :=
 192*x^2 + 2304*x^3 + 11256*x^4 + 30432*x^5 + 51072*x^6 + 55776*x^7 + 39984*x^8 + 18336*x^9 + 4992*x^10 + 672*x^11 + 24*x^12 + -192*Z*x^2 + -2016*Z*x^3 + -9624*Z*x^4 + -26880*Z*x^5 + -47904*Z*x^6 + -56256*Z*x^7 + -43536*Z*x^8 + -21504*Z*x^9 + -6240*Z*x^10 + -864*Z*x^11 + -24*Z*x^12 + -288*Z^2*x^3 + -1632*Z^2*x^4 + -3552*Z^2*x^5 + -3168*Z^2*x^6 + 480*Z^2*x^7 + 3552*Z^2*x^8 + 3168*Z^2*x^9 + 1248*Z^2*x^10 + 192*Z^2*x^11 + -2*N + -8*N*x + -392*N*x^2 + -2824*N*x^3 + -8570*N*x^4 + -13040*N*x^5 + -8064*N*x^6 + 4688*N*x^7 + 12746*N*x^8 + 10360*N*x^9 + 4232*N*x^10 + 824*N*x^11 + 50*N*x^12 + 8*N*Z*x + -264*N*Z*x^2 + -2224*N*Z*x^3 + -6880*N*Z*x^4 + -10128*N*Z*x^5 + -5488*N*Z*x^6 + 4480*N*Z*x^7 + 9696*N*Z*x^8 + 7240*N*Z*x^9 + 2872*N*Z*x^10 + 624*N*Z*x^11 + 64*N*Z*x^12 + -168*N*Z^2*x^3 + -696*N*Z^2*x^4 + -768*N*Z^2*x^5 + 576*N*Z^2*x^6 + 1776*N*Z^2*x^7 + 912*N*Z^2*x^8 + -576*N*Z^2*x^9 + -768*N*Z^2*x^10 + -264*N*Z^2*x^11 + -24*N*Z^2*x^12 + -1*N^2 + 20*N^2*x + 298*N^2*x^2 + 1140*N^2*x^3 + 1637*N^2*x^4 + -56*N^2*x^5 + -2884*N^2*x^6 + -3032*N^2*x^7 + -295*N^2*x^8 + 1572*N^2*x^9 + 1210*N^2*x^10 + 356*N^2*x^11 + 35*N^2*x^12 + -192*N^2*Z*x^3 + -816*N^2*Z*x^4 + -960*N^2*Z*x^5 + 576*N^2*Z*x^6 + 2112*N^2*Z*x^7 + 1248*N^2*Z*x^8 + -576*N^2*Z*x^9 + -960*N^2*Z*x^10 + -384*N^2*Z*x^11 + -48*N^2*Z*x^12 + -24*N^2*Z^2*x^3 + -72*N^2*Z^2*x^4 + 192*N^2*Z^2*x^6 + 144*N^2*Z^2*x^7 + -144*N^2*Z^2*x^8 + -192*N^2*Z^2*x^9 + 72*N^2*Z^2*x^11 + 24*N^2*Z^2*x^12 + 2*N^3 + -16*N^3*x + -100*N^3*x^2 + -128*N^3*x^3 + 134*N^3*x^4 + 416*N^3*x^5 + 168*N^3*x^6 + -320*N^3*x^7 + -338*N^3*x^8 + -16*N^3*x^9 + 124*N^3*x^10 + 64*N^3*x^11 + 10*N^3*x^12 + -8*N^3*Z*x + -24*N^3*Z*x^2 + -8*N^3*Z*x^3 + 40*N^3*Z*x^4 + 48*N^3*Z*x^5 + 16*N^3*Z*x^6 + -16*N^3*Z*x^7 + -48*N^3*Z*x^8 + -40*N^3*Z*x^9 + 8*N^3*Z*x^10 + 24*N^3*Z*x^11 + 8*N^3*Z*x^12 + 1*N^4 + 4*N^4*x + 2*N^4*x^2 + -12*N^4*x^3 + -17*N^4*x^4 + 8*N^4*x^5 + 28*N^4*x^6 + 8*N^4*x^7 + -17*N^4*x^8 + -12*N^4*x^9 + 2*N^4*x^10 + 4*N^4*x^11 + 1*N^4*x^12
theorem gauge_normalize_01d4BC (n : ℕ) :
 closedGaugeD4N6604 n false true=gaugeNum01d4BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   (24*(1-runXBDEE)^8) := by
 unfold closedGaugeD4N6604
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 
 dsimp only
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_14BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC,jet_normalize_34BC]
 unfold jetNum00BC jetNum01BC jetNum02BC jetNum03BC jetNum10BC jetNum11BC jetNum12BC jetNum13BC jetNum14BC jetNum20BC jetNum21BC jetNum22BC jetNum23BC jetNum30BC jetNum31BC jetNum32BC jetNum33BC jetNum34BC gaugeNum01d4BC runXBDEE
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
