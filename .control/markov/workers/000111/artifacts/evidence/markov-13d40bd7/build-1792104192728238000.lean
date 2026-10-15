import MarkovCyclicTrace487
import MarkovProjectionJet6905
/-! Machine-authored request 13d40bd7. Exact normalized horizontal matrices.
Real evaluation requires x≠0 and x+1≠0; no coefficient inequality is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

def hmapM13D {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S) (m : Mat16 R) : Mat16 S :=
 ⟨f m.a,f m.b,f m.c,f m.d⟩
def hscaleM13D {R : Type*} [CommRing R] (c : R) (m : Mat16 R) : Mat16 R :=
 ⟨c*m.a,c*m.b,c*m.c,c*m.d⟩
theorem hmap_mmM13D {R S : Type*} [CommRing R] [CommRing S]
 (f : R →+* S) (m n : Mat16 R) :
 hmapM13D f (mm16 m n)=mm16 (hmapM13D f m) (hmapM13D f n) := by
 ext <;> simp [hmapM13D,mm16]
theorem hscale_mmM13D {R : Type*} [CommRing R] (a b : R) (m n : Mat16 R) :
 mm16 (hscaleM13D a m) (hscaleM13D b n)=hscaleM13D (a*b) (mm16 m n) := by
 ext <;> simp [hscaleM13D,mm16] <;> ring

def hrowEvalM13D (x : ℝ) : BiPoly →+* ℝ[X] :=
 eval₂RingHom (Polynomial.mapRingHom (Int.castRingHom ℝ)) (C x)
def hleftM13D (x : ℝ) : Mat16 ℝ[X] := ⟨1,C (-(x+1)⁻¹),0,C ((x+1)⁻¹)⟩
def hrightM13D (x : ℝ) : Mat16 ℝ[X] := ⟨1,1,0,C (x+1)⟩
def hconjM13D (x : ℝ) (m : Mat16 ℝ[X]) := mm16 (mm16 (hleftM13D x) m) (hrightM13D x)

theorem hinverseM13D (x : ℝ) (hx : x+1≠0) :
 mm16 (hrightM13D x) (hleftM13D x)=⟨1,0,0,1⟩ ∧
 mm16 (hleftM13D x) (hrightM13D x)=⟨1,0,0,1⟩ := by
 constructor <;> apply Mat16.ext <;>
 simp [hrightM13D,hleftM13D,mm16,←map_mul,←map_add,hx]

theorem hconj_mmM13D (x : ℝ) (hx : x+1≠0) (m n : Mat16 ℝ[X]) :
 hconjM13D x (mm16 m n)=mm16 (hconjM13D x m) (hconjM13D x n) := by
 unfold hconjM13D
 simp only [mm_assoc16]
 rw [←mm_assoc16 (hrightM13D x) (hleftM13D x), (hinverseM13D x hx).1,mm_one_left774]

theorem hconj_traceM13D (x : ℝ) (hx : x+1≠0) (m : Mat16 ℝ[X]) :
 tr16 (hconjM13D x m)=tr16 m := by
 have hc : C (x+1)*C ((x+1)⁻¹)=(1:ℝ[X]) := by rw [←map_mul]; simp [hx]
 simp only [hconjM13D,hrightM13D,hleftM13D,mm16,tr16,map_neg]
 linear_combination m.d*hc

def hprojM13D (x : ℝ) (r : Bool) : Mat16 ℝ[X] :=
 if r then
 ⟨C (1/(x*(x+1)^2))*(X+X^2),
  C (1/(x*(x+1)^2))*(C (x+2)*X+X^2),
  C (1/(x+1)^2)*(C (x+2)*X+X^2),
  1+C (1/(x+1)^2)*(C (2*x+3)*X+X^2)⟩
 else ⟨C (1/(x+1)^2)*X,C (1/(x+1)^2)*X,
  C (x/(x+1)^2)*X,1+C (x/(x+1)^2)*X⟩

theorem hproj_shapeM13D (x : ℝ) (r : Bool) : Projection6905 (hprojM13D x r) := by
 cases r <;> simp [Projection6905,hprojM13D,Polynomial.mul_coeff_zero,Polynomial.coeff_one]

theorem hproj_letterM13D (x : ℝ) (hx : x≠0) (hh : x+1≠0) (r : Bool) :
 hconjM13D x (hmapM13D (hrowEvalM13D x) (if r then rawB18 else rawA18))=
 hscaleM13D (C ((if r then x else 1)*(x+1))) (hprojM13D x r) := by
 cases r <;> apply Mat16.ext <;> apply Polynomial.funext <;> intro y <;>
 simp [hconjM13D,hmapM13D,hrowEvalM13D,rawA18,rawB18,U,V,S,
   hleftM13D,hrightM13D,hscaleM13D,hprojM13D,mm16] <;>
 field_simp <;> ring

end
end MathGKM.Markov
