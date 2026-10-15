import MarkovRunJet487
/-! Machine-authored 75ad68f9. A cyclic change of basis gives all run blocks
the same constant projection. Exact ring identities, no LC assertion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
def shear75 {R : Type*} [CommRing R] (b : R) : Mat16 R := ⟨1,0,-b,1⟩
def unshear75 {R : Type*} [CommRing R] (b : R) : Mat16 R := ⟨1,0,b,1⟩
def gauge75 {R : Type*} [CommRing R] (a b : R) (m : Mat16 R) : Mat16 R :=
 mm16 (mm16 (unshear75 a) m) (shear75 b)

theorem gauge_mul75 {R : Type*} [CommRing R] (a b c : R) (m n : Mat16 R) :
 mm16 (gauge75 a b m) (gauge75 b c n)=gauge75 a c (mm16 m n) := by
 apply Mat16.ext <;> simp [gauge75,shear75,unshear75,mm16] <;> ring

theorem gauge_trace75 {R : Type*} [CommRing R] (b : R) (m : Mat16 R) :
 tr16 (gauge75 b b m)=tr16 m := by
 simp [gauge75,shear75,unshear75,mm16,tr16]; ring

def gaugeList75 {R : Type*} [CommRing R] (a : R) : List (Mat16 R × R) → Mat16 R
 | [] => ⟨1,0,0,1⟩
 | (m,b)::rs => mm16 (gauge75 a b m) (gaugeList75 b rs)
def plainList75 {R : Type*} [CommRing R] : List (Mat16 R × R) → Mat16 R
 | [] => ⟨1,0,0,1⟩
 | (m,_)::rs => mm16 m (plainList75 rs)
def finalGauge75 {R : Type*} (a : R) : List (Mat16 R × R) → R
 | [] => a
 | (_,b)::rs => finalGauge75 b rs

theorem gauge_list75 {R : Type*} [CommRing R] (a : R) (w : List (Mat16 R × R)) :
 gaugeList75 a w=gauge75 a (finalGauge75 a w) (plainList75 w) := by
 induction w generalizing a with
 | nil => apply Mat16.ext <;> simp [gaugeList75,gauge75,shear75,unshear75,
     plainList75,finalGauge75,mm16]
 | cons mb rs ih =>
   rcases mb with ⟨m,b⟩
   simp only [gaugeList75,finalGauge75,plainList75,ih,gauge_mul75]

theorem gauge_cyclic_trace75 {R : Type*} [CommRing R] (a : R)
 (w : List (Mat16 R × R)) (h : finalGauge75 a w=a) :
 tr16 (gaugeList75 a w)=tr16 (plainList75 w) := by
 rw [gauge_list75,h,gauge_trace75]

theorem run_gauge_constant75 (a : ℤ[X]) (n : ℕ) :
 let g := gauge75 (C a) (C (2*runSumA27 X n)) (lowerMatrix487 n)
 g.a.coeff 0=0 ∧ g.b.coeff 0=0 ∧ g.c.coeff 0=0 ∧ g.d.coeff 0=1 := by
 obtain ⟨ha,hb,hc,hd,_,_,_⟩ := lowerMatrix_jets487 n
 simp [gauge75,shear75,unshear75,mm16,Polynomial.mul_coeff_zero,ha,hb,hc,hd]

#print axioms gauge_mul75
#print axioms gauge_cyclic_trace75
#print axioms run_gauge_constant75
end
end MathGKM.Markov
