import MarkovHorizontalPositiveM511
/-! Machine-authored request 9e104e0c. Integral all-order vertical gauge.
No division by a variable and no coefficient inequality is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false

def vKaM9E1 {R : Type*} [CommRing R] (x : R) : Mat16 R[X] :=
 ⟨C x*(1+C (x+1)*X),2+C (x+1)*X,
   C x*C (x+1)*X,1+C (x+1)*X⟩
def vKcM9E1 {R : Type*} [CommRing R] (x : R) : Mat16 R[X] :=
 ⟨1+C x*X,X,C x*X,X⟩
def vKletterM9E1 {R : Type*} [CommRing R] (x : R) (r : Bool) : Mat16 R[X] :=
 if r then mm16 (vKaM9E1 x) (vKcM9E1 x) else vKaM9E1 x
def vKwordM9E1 {R : Type*} [CommRing R] (x : R) (w : List Bool) : Mat16 R[X] :=
 projProduct6905 (w.map (vKletterM9E1 x))
def vrightM9E1 {R : Type*} [CommRing R] (x : R) : Mat16 R[X] :=
 ⟨1,-1,0,C (x+1)⟩
def vsubM9E1 : BiPoly →+* BiPoly :=
 eval₂RingHom C (C ((X+1)^2)*X)
def vdiffM9E1 {R : Type*} [CommRing R] (m : Mat16 R) : R := m.a+m.b-m.c-m.d

theorem vletter_intertwineM9E1 (r : Bool) :
 mm16 (hmapM13D vsubM9E1 (if r then rawB18 else rawA18)) (vrightM9E1 (X:ℤ[X]))=
 hscaleM13D (if r then C (X+1) else 1)
   (mm16 (vrightM9E1 (X:ℤ[X])) (vKletterM9E1 X r)) := by
 cases r <;> apply Mat16.ext <;>
 simp [vsubM9E1,hmapM13D,rawA18,rawB18,U,V,S,vrightM9E1,vKletterM9E1,
   vKaM9E1,vKcM9E1,hscaleM13D,mm16,map_add,map_mul,map_pow] <;> ring

theorem vscale_leftM9E1 {R : Type*} [CommRing R] (c : R) (m n : Mat16 R) :
 mm16 (hscaleM13D c m) n=hscaleM13D c (mm16 m n) := by
 ext <;> simp [mm16,hscaleM13D] <;> ring
theorem vscale_rightM9E1 {R : Type*} [CommRing R] (c : R) (m n : Mat16 R) :
 mm16 m (hscaleM13D c n)=hscaleM13D c (mm16 m n) := by
 ext <;> simp [mm16,hscaleM13D] <;> ring
theorem vscale_scaleM9E1 {R : Type*} [CommRing R] (c d : R) (m : Mat16 R) :
 hscaleM13D c (hscaleM13D d m)=hscaleM13D (c*d) m := by
 ext <;> simp [hscaleM13D,mul_assoc]

theorem vword_intertwineM9E1 (w : List Bool) :
 mm16 (hmapM13D vsubM9E1 (rawWord80 w)) (vrightM9E1 (X:ℤ[X]))=
 hscaleM13D (C (X+1)^w.count true)
   (mm16 (vrightM9E1 (X:ℤ[X])) (vKwordM9E1 X w)) := by
 induction w with
 | nil => simp [rawWord80,vKwordM9E1,projProduct6905,hmapM13D,hscaleM13D,
     mm_one_left774,mm_one_right774]
 | cons r rs ih =>
   change mm16 (hmapM13D vsubM9E1 (mm16 (if r then rawB18 else rawA18) (rawWord80 rs))) _=_
   rw [hmap_mmM13D,mm_assoc16,ih,vscale_rightM9E1,←mm_assoc16,
     vletter_intertwineM9E1,vscale_leftM9E1,vscale_scaleM9E1,mm_assoc16]
   have he : C (X+1)^rs.count true*(if r then C (X+1) else 1)=
     (C (X+1):BiPoly)^(r::rs).count true := by
     cases r <;> simp [List.count_cons,pow_succ]
   rw [he]
   rfl

theorem vertical_rescaled_sourceM9E1 (path : List Bool) :
 vsubM9E1 (frame path).mid.p=
 C (X+1)^((frame path).mid.a-1)*vdiffM9E1 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path)) := by
 have hw := vword_intertwineM9E1 (sourceWord28 path)
 have he := congrArg (fun m : Mat16 BiPoly => m.a+m.b) hw
 simp only [mm16,hmapM13D,vrightM9E1,hscaleM13D,one_mul,mul_one,mul_zero,
   zero_mul,mul_neg_one,neg_mul,zero_add,add_zero] at he
 rw [(source_word_counts28 path).1,←source_word_exact3eda path] at he
 have ha := (frame_reduced path).1
 have hp : (C (X+1):BiPoly)^((frame path).mid.a)=
   C (X+1)*C (X+1)^((frame path).mid.a-1) := by
   rw [←pow_succ']; congr 1; omega
 rw [hp] at he
 have hz : (C (X+1):BiPoly)≠0 := by
   apply C_ne_zero.mpr
   simpa using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ hz
 unfold vdiffM9E1
 linear_combination he

theorem vdiff_firstM9E1 {R : Type*} [CommRing R] (x : R) (m : Mat16 R[X]) :
 vdiffM9E1 (mm16 (vKaM9E1 x) m)=C x*(m.a+m.b)+(m.c+m.d) := by
 simp [vdiffM9E1,vKaM9E1,mm16]
 ring

end
end MathGKM.Markov
