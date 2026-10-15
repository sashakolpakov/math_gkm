import MarkovGaugeNorm00BC
import MarkovGaugeNorm01BC
import MarkovGaugeNorm10BC
import MarkovGaugeNorm11BC
/-! Machine-authored bc8d3b6f. Exact normalization candidates; validated separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def gaugea1BC {A : Type*} [CommRing A] (N Z x : A) (p q : Bool) : A :=
 match p,q with
 | false,false => gaugeNum00a1BC N Z x
 | false,true => gaugeNum01a1BC N Z x
 | true,false => gaugeNum10a1BC N Z x
 | true,true => gaugeNum11a1BC N Z x
theorem gaugea1_normalizeBC (n : ℕ) (p q : Bool) :
 (closedGaugeJetBDEE n p q 1).a=gaugea1BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q/(1*(1-runXBDEE)^0) := by
 cases p <;> cases q
 · exact gauge_normalize_00a1BC n
 · exact gauge_normalize_01a1BC n
 · exact gauge_normalize_10a1BC n
 · exact gauge_normalize_11a1BC n
theorem gaugea1BC_map {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q : Bool) :
 g (gaugea1BC N Z x p q)=gaugea1BC (g N) (g Z) (g x) p q := by
 cases p <;> cases q <;>
 simp only [gaugea1BC,gaugeNum00a1BC,gaugeNum01a1BC,gaugeNum10a1BC,gaugeNum11a1BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

def gaugea2BC {A : Type*} [CommRing A] (N Z x : A) (p q : Bool) : A :=
 match p,q with
 | false,false => gaugeNum00a2BC N Z x
 | false,true => gaugeNum01a2BC N Z x
 | true,false => gaugeNum10a2BC N Z x
 | true,true => gaugeNum11a2BC N Z x
theorem gaugea2_normalizeBC (n : ℕ) (p q : Bool) :
 (closedGaugeJetBDEE n p q 2).a=gaugea2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q/(1*(1-runXBDEE)^3) := by
 cases p <;> cases q
 · exact gauge_normalize_00a2BC n
 · exact gauge_normalize_01a2BC n
 · exact gauge_normalize_10a2BC n
 · exact gauge_normalize_11a2BC n
theorem gaugea2BC_map {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q : Bool) :
 g (gaugea2BC N Z x p q)=gaugea2BC (g N) (g Z) (g x) p q := by
 cases p <;> cases q <;>
 simp only [gaugea2BC,gaugeNum00a2BC,gaugeNum01a2BC,gaugeNum10a2BC,gaugeNum11a2BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

def gaugeb2BC {A : Type*} [CommRing A] (N Z x : A) (p q : Bool) : A :=
 match p,q with
 | false,false => gaugeNum00b2BC N Z x
 | false,true => gaugeNum01b2BC N Z x
 | true,false => gaugeNum10b2BC N Z x
 | true,true => gaugeNum11b2BC N Z x
theorem gaugeb2_normalizeBC (n : ℕ) (p q : Bool) :
 (closedGaugeJetBDEE n p q 2).b=gaugeb2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q/(1*(1-runXBDEE)^2) := by
 cases p <;> cases q
 · exact gauge_normalize_00b2BC n
 · exact gauge_normalize_01b2BC n
 · exact gauge_normalize_10b2BC n
 · exact gauge_normalize_11b2BC n
theorem gaugeb2BC_map {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q : Bool) :
 g (gaugeb2BC N Z x p q)=gaugeb2BC (g N) (g Z) (g x) p q := by
 cases p <;> cases q <;>
 simp only [gaugeb2BC,gaugeNum00b2BC,gaugeNum01b2BC,gaugeNum10b2BC,gaugeNum11b2BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

def gaugeb3BC {A : Type*} [CommRing A] (N Z x : A) (p q : Bool) : A :=
 match p,q with
 | false,false => gaugeNum00b3BC N Z x
 | false,true => gaugeNum01b3BC N Z x
 | true,false => gaugeNum10b3BC N Z x
 | true,true => gaugeNum11b3BC N Z x
theorem gaugeb3_normalizeBC (n : ℕ) (p q : Bool) :
 (closedGaugeJetBDEE n p q 3).b=gaugeb3BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q/(2*(1-runXBDEE)^4) := by
 cases p <;> cases q
 · exact gauge_normalize_00b3BC n
 · exact gauge_normalize_01b3BC n
 · exact gauge_normalize_10b3BC n
 · exact gauge_normalize_11b3BC n
theorem gaugeb3BC_map {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q : Bool) :
 g (gaugeb3BC N Z x p q)=gaugeb3BC (g N) (g Z) (g x) p q := by
 cases p <;> cases q <;>
 simp only [gaugeb3BC,gaugeNum00b3BC,gaugeNum01b3BC,gaugeNum10b3BC,gaugeNum11b3BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

def gaugec1BC {A : Type*} [CommRing A] (N Z x : A) (p q : Bool) : A :=
 match p,q with
 | false,false => gaugeNum00c1BC N Z x
 | false,true => gaugeNum01c1BC N Z x
 | true,false => gaugeNum10c1BC N Z x
 | true,true => gaugeNum11c1BC N Z x
theorem gaugec1_normalizeBC (n : ℕ) (p q : Bool) :
 (closedGaugeJetBDEE n p q 1).c=gaugec1BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q/(1*(1-runXBDEE)^3) := by
 cases p <;> cases q
 · exact gauge_normalize_00c1BC n
 · exact gauge_normalize_01c1BC n
 · exact gauge_normalize_10c1BC n
 · exact gauge_normalize_11c1BC n
theorem gaugec1BC_map {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q : Bool) :
 g (gaugec1BC N Z x p q)=gaugec1BC (g N) (g Z) (g x) p q := by
 cases p <;> cases q <;>
 simp only [gaugec1BC,gaugeNum00c1BC,gaugeNum01c1BC,gaugeNum10c1BC,gaugeNum11c1BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

def gaugec2BC {A : Type*} [CommRing A] (N Z x : A) (p q : Bool) : A :=
 match p,q with
 | false,false => gaugeNum00c2BC N Z x
 | false,true => gaugeNum01c2BC N Z x
 | true,false => gaugeNum10c2BC N Z x
 | true,true => gaugeNum11c2BC N Z x
theorem gaugec2_normalizeBC (n : ℕ) (p q : Bool) :
 (closedGaugeJetBDEE n p q 2).c=gaugec2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q/(1*(1-runXBDEE)^5) := by
 cases p <;> cases q
 · exact gauge_normalize_00c2BC n
 · exact gauge_normalize_01c2BC n
 · exact gauge_normalize_10c2BC n
 · exact gauge_normalize_11c2BC n
theorem gaugec2BC_map {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q : Bool) :
 g (gaugec2BC N Z x p q)=gaugec2BC (g N) (g Z) (g x) p q := by
 cases p <;> cases q <;>
 simp only [gaugec2BC,gaugeNum00c2BC,gaugeNum01c2BC,gaugeNum10c2BC,gaugeNum11c2BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

def gaugec3BC {A : Type*} [CommRing A] (N Z x : A) (p q : Bool) : A :=
 match p,q with
 | false,false => gaugeNum00c3BC N Z x
 | false,true => gaugeNum01c3BC N Z x
 | true,false => gaugeNum10c3BC N Z x
 | true,true => gaugeNum11c3BC N Z x
theorem gaugec3_normalizeBC (n : ℕ) (p q : Bool) :
 (closedGaugeJetBDEE n p q 3).c=gaugec3BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q/(6*(1-runXBDEE)^7) := by
 cases p <;> cases q
 · exact gauge_normalize_00c3BC n
 · exact gauge_normalize_01c3BC n
 · exact gauge_normalize_10c3BC n
 · exact gauge_normalize_11c3BC n
theorem gaugec3BC_map {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q : Bool) :
 g (gaugec3BC N Z x p q)=gaugec3BC (g N) (g Z) (g x) p q := by
 cases p <;> cases q <;>
 simp only [gaugec3BC,gaugeNum00c3BC,gaugeNum01c3BC,gaugeNum10c3BC,gaugeNum11c3BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

def gauged1BC {A : Type*} [CommRing A] (N Z x : A) (p q : Bool) : A :=
 match p,q with
 | false,false => gaugeNum00d1BC N Z x
 | false,true => gaugeNum01d1BC N Z x
 | true,false => gaugeNum10d1BC N Z x
 | true,true => gaugeNum11d1BC N Z x
theorem gauged1_normalizeBC (n : ℕ) (p q : Bool) :
 (closedGaugeJetBDEE n p q 1).d=gauged1BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q/(1*(1-runXBDEE)^2) := by
 cases p <;> cases q
 · exact gauge_normalize_00d1BC n
 · exact gauge_normalize_01d1BC n
 · exact gauge_normalize_10d1BC n
 · exact gauge_normalize_11d1BC n
theorem gauged1BC_map {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q : Bool) :
 g (gauged1BC N Z x p q)=gauged1BC (g N) (g Z) (g x) p q := by
 cases p <;> cases q <;>
 simp only [gauged1BC,gaugeNum00d1BC,gaugeNum01d1BC,gaugeNum10d1BC,gaugeNum11d1BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

def gauged2BC {A : Type*} [CommRing A] (N Z x : A) (p q : Bool) : A :=
 match p,q with
 | false,false => gaugeNum00d2BC N Z x
 | false,true => gaugeNum01d2BC N Z x
 | true,false => gaugeNum10d2BC N Z x
 | true,true => gaugeNum11d2BC N Z x
theorem gauged2_normalizeBC (n : ℕ) (p q : Bool) :
 (closedGaugeJetBDEE n p q 2).d=gauged2BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q/(2*(1-runXBDEE)^4) := by
 cases p <;> cases q
 · exact gauge_normalize_00d2BC n
 · exact gauge_normalize_01d2BC n
 · exact gauge_normalize_10d2BC n
 · exact gauge_normalize_11d2BC n
theorem gauged2BC_map {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q : Bool) :
 g (gauged2BC N Z x p q)=gauged2BC (g N) (g Z) (g x) p q := by
 cases p <;> cases q <;>
 simp only [gauged2BC,gaugeNum00d2BC,gaugeNum01d2BC,gaugeNum10d2BC,gaugeNum11d2BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

def gauged3BC {A : Type*} [CommRing A] (N Z x : A) (p q : Bool) : A :=
 match p,q with
 | false,false => gaugeNum00d3BC N Z x
 | false,true => gaugeNum01d3BC N Z x
 | true,false => gaugeNum10d3BC N Z x
 | true,true => gaugeNum11d3BC N Z x
theorem gauged3_normalizeBC (n : ℕ) (p q : Bool) :
 (closedGaugeJetBDEE n p q 3).d=gauged3BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q/(6*(1-runXBDEE)^6) := by
 cases p <;> cases q
 · exact gauge_normalize_00d3BC n
 · exact gauge_normalize_01d3BC n
 · exact gauge_normalize_10d3BC n
 · exact gauge_normalize_11d3BC n
theorem gauged3BC_map {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q : Bool) :
 g (gauged3BC N Z x p q)=gauged3BC (g N) (g Z) (g x) p q := by
 cases p <;> cases q <;>
 simp only [gauged3BC,gaugeNum00d3BC,gaugeNum01d3BC,gaugeNum10d3BC,gaugeNum11d3BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

def gauged4BC {A : Type*} [CommRing A] (N Z x : A) (p q : Bool) : A :=
 match p,q with
 | false,false => gaugeNum00d4BC N Z x
 | false,true => gaugeNum01d4BC N Z x
 | true,false => gaugeNum10d4BC N Z x
 | true,true => gaugeNum11d4BC N Z x
theorem gauged4_normalizeBC (n : ℕ) (p q : Bool) :
 closedGaugeD4N6604 n p q=gauged4BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q/(24*(1-runXBDEE)^8) := by
 cases p <;> cases q
 · exact gauge_normalize_00d4BC n
 · exact gauge_normalize_01d4BC n
 · exact gauge_normalize_10d4BC n
 · exact gauge_normalize_11d4BC n
theorem gauged4BC_map {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q : Bool) :
 g (gauged4BC N Z x p q)=gauged4BC (g N) (g Z) (g x) p q := by
 cases p <;> cases q <;>
 simp only [gauged4BC,gaugeNum00d4BC,gaugeNum01d4BC,gaugeNum10d4BC,gaugeNum11d4BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

theorem gaugeb1_normalizeBC (n : ℕ) (p q : Bool) :
 (closedGaugeJetBDEE n p q 1).b=1 := by
 unfold closedGaugeJetBDEE closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 rw [jet_normalize_11BC]
 simp [jetNum11BC]

def localThirdNumBC {A : Type*} [CommRing A] (N Z x : A) (p q r : Bool) : A :=
 let D := 1-x
 let d := gauged1BC N Z x p q
 let c := gaugec1BC N Z x p q
 2*d^3-3*d*gauged2BC N Z x p q+gauged3BC N Z x p q+
 6*D*c*gaugeb2BC N Z x q r+6*D*gaugec2BC N Z x p q-
 6*D*c*(d+gauged1BC N Z x q r)+6*D^3*c*gaugea1BC N Z x q r

def localFourNumBC {A : Type*} [CommRing A] (N Z x : A) (p q r s : Bool) : A :=
 let D := 1-x
 let d := gauged1BC N Z x p q
 let c := gaugec1BC N Z x p q
 let v₂ := gaugeb2BC N Z x q r+D^2*gaugea1BC N Z x q r-gauged1BC N Z x q r
 let v₃ := gaugeb3BC N Z x q r+
   2*gaugea1BC N Z x q r*D^2*(gaugeb2BC N Z x r s+D^2*gaugea1BC N Z x r s-gauged1BC N Z x r s)+
   2*D*gaugea2BC N Z x q r-
   2*(gaugeb2BC N Z x q r+D^2*gaugea1BC N Z x q r)*gauged1BC N Z x q r+
   2*(gauged1BC N Z x q r)^2-gauged2BC N Z x q r-2*D*gaugec1BC N Z x q r
 let g₂ := gauged2BC N Z x p q+2*D*c
 let g₃ := gauged3BC N Z x p q+6*D*c*v₂+6*D*gaugec2BC N Z x p q
 let g₄ := gauged4BC N Z x p q+12*D*c*v₃+24*D*gaugec2BC N Z x p q*v₂+4*D*gaugec3BC N Z x p q
 g₄-4*d*g₃-3*g₂^2+12*d^2*g₂-6*d^4
theorem localThird_normalizeBC (n : ℕ) (p q r : Bool) :
 (1-runXBDEE)^6*closedLocalBDEE n p q r=
 localThirdNumBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q r := by
 unfold closedLocalBDEE localThirdNumBC
 dsimp only
 simp only [gaugea1_normalizeBC,gaugea2_normalizeBC,gaugeb2_normalizeBC,gaugeb3_normalizeBC,gaugec1_normalizeBC,gaugec2_normalizeBC,gaugec3_normalizeBC,gauged1_normalizeBC,gauged2_normalizeBC,gauged3_normalizeBC,gauged4_normalizeBC,gaugeb1_normalizeBC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring

theorem localThirdNum_mapBC {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q r : Bool) :
 g (localThirdNumBC N Z x p q r)=localThirdNumBC (g N) (g Z) (g x) p q r := by
 simp only [localThirdNumBC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,gaugea1BC_map,gaugea2BC_map,gaugeb2BC_map,gaugeb3BC_map,gaugec1BC_map,gaugec2BC_map,gaugec3BC_map,gauged1BC_map,gauged2BC_map,gauged3BC_map,gauged4BC_map]
theorem localFour_normalizeBC (n : ℕ) (p q r s : Bool) :
 (1-runXBDEE)^8*closedLocalFourN6604 n p q r s=
 localFourNumBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q r s := by
 unfold closedLocalFourN6604 localFourNumBC
 dsimp only
 simp only [gaugea1_normalizeBC,gaugea2_normalizeBC,gaugeb2_normalizeBC,gaugeb3_normalizeBC,gaugec1_normalizeBC,gaugec2_normalizeBC,gaugec3_normalizeBC,gauged1_normalizeBC,gauged2_normalizeBC,gauged3_normalizeBC,gauged4_normalizeBC,gaugeb1_normalizeBC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring

theorem localFourNum_mapBC {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q r s : Bool) :
 g (localFourNumBC N Z x p q r s)=localFourNumBC (g N) (g Z) (g x) p q r s := by
 simp only [localFourNumBC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,gaugea1BC_map,gaugea2BC_map,gaugeb2BC_map,gaugeb3BC_map,gaugec1BC_map,gaugec2BC_map,gaugec3BC_map,gauged1BC_map,gauged2BC_map,gauged3BC_map,gauged4BC_map]
end
end MathGKM.Markov
