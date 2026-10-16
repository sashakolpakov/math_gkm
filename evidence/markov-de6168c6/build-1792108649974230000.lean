import MarkovVerticalAllOrderM9E1
import MarkovVerticalBlockWordMDE6
/-! Machine-authored request de6168c6. Integral vertical trace and exact
block-product transport. These are identities, with no LC premise. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem vword_traceMDE6 (w : List Bool) :
 vsubM9E1 (tr16 (rawWord80 w))=
 C (X+1)^w.count true*tr16 (vKwordM9E1 (X:ℤ[X]) w) := by
 have h := vword_intertwineM9E1 w
 have ha := congrArg Mat16.a h
 have hc := congrArg Mat16.c h
 have hd := congrArg Mat16.d h
 simp only [mm16,hmapM13D,vrightM9E1,hscaleM13D,one_mul,mul_one,mul_zero,
   zero_mul,mul_neg_one,neg_mul,zero_add,add_zero] at ha hc hd
 have hz : (C (X+1):BiPoly)≠0 := by
   apply C_ne_zero.mpr
   simpa using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ hz
 simp only [tr16,map_add,map_one] at ha hc hd ⊢
 linear_combination C (X+1)*ha+hc+hd

theorem vsource_traceMDE6 (path : List Bool) :
 tr16 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path))=
 (1+C (X+1)*X)*vdiffM9E1 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path)) := by
 have h := vword_traceMDE6 (sourceWord28 path)
 rw [(source_word_counts28 path).1] at h
 have ht := sourceMatrix_trace025 path
 rw [sourceMatrix_exact_word487,←source_word_exact3eda] at ht
 rw [ht,map_mul,vertical_rescaled_sourceM9E1] at h
 have hs : vsubM9E1 S=C (X+1)*(1+C (X+1)*X) := by
   simp [vsubM9E1,S,U,V,map_add,map_mul,map_pow]; ring
 rw [hs] at h
 have ha := (frame_reduced path).1
 have hp : (C (X+1):BiPoly)^((frame path).mid.a)=
   C (X+1)*C (X+1)^((frame path).mid.a-1) := by
   rw [←pow_succ']; congr 1; omega
 have hz : (C (X+1):BiPoly)≠0 := by
   apply C_ne_zero.mpr
   simpa using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero (frame path).mid.a hz)
 rw [hp] at h ⊢
 linear_combination -h

theorem vKword_appendMDE6 {R : Type*} [CommRing R] (x : R) (w z : List Bool) :
 vKwordM9E1 x (w++z)=mm16 (vKwordM9E1 x w) (vKwordM9E1 x z) := by
 simp [vKwordM9E1,projProduct_append6905]

theorem vKword_blockMDE6 {R : Type*} [CommRing R] (x : R) (n : ℕ) (w : List Bool) :
 vKwordM9E1 x (blockSub025 n w)=
 projProduct6905 (w.map fun r => vKwordM9E1 x (runBlock025 (n+if r then 1 else 0))) := by
 induction w with
 | nil => rfl
 | cons r rs ih =>
   simp only [blockSub025,List.flatMap_cons,List.map_cons,projProduct6905]
   rw [vKword_appendMDE6]
   exact congrArg (mm16 _) ih

def vswapMDE6 {R : Type*} (m : Mat16 R) : Mat16 R := ⟨m.d,m.c,m.b,m.a⟩
theorem vswap_mulMDE6 {R : Type*} [CommRing R] (m n : Mat16 R) :
 vswapMDE6 (mm16 m n)=mm16 (vswapMDE6 m) (vswapMDE6 n) := by
 ext <;> simp [vswapMDE6,mm16,add_comm]
theorem vswap_traceMDE6 {R : Type*} [CommRing R] (m : Mat16 R) :
 tr16 (vswapMDE6 m)=tr16 m := by simp [vswapMDE6,tr16,add_comm]

def vEvalMDE6 (x : ℝ) : BiPoly →+* ℝ[X] :=
 Polynomial.mapRingHom (eval₂RingHom (Int.castRingHom ℝ) x)

theorem vEval_wordMDE6 (x : ℝ) (w : List Bool) :
 hmapM13D (vEvalMDE6 x) (vKwordM9E1 (X:ℤ[X]) w)=vKwordM9E1 x w := by
 induction w with
 | nil => ext <;> simp [vKwordM9E1,projProduct6905,hmapM13D]
 | cons r rs ih =>
   change hmapM13D _ (mm16 (vKletterM9E1 (X:ℤ[X]) r) (vKwordM9E1 X rs))=
     mm16 (vKletterM9E1 x r) (vKwordM9E1 x rs)
   rw [hmap_mmM13D,ih]
   congr 1
   cases r <;> ext <;>
     simp [hmapM13D,vEvalMDE6,vKletterM9E1,vKaM9E1,vKcM9E1,mm16]

theorem vEval_coeffMDE6 (x : ℝ) (P : BiPoly) (i : ℕ) :
 (vEvalMDE6 x P).coeff i=eval₂ (Int.castRingHom ℝ) x (P.coeff i) := by
 simp [vEvalMDE6]

theorem vsource_trace_evalMDE6 (x : ℝ) (path : List Bool) :
 tr16 (vKwordM9E1 x (sourceWord28 path))=
 (1+C (x+1)*X)*vEvalMDE6 x (vdiffM9E1
   (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path))) := by
 have h := congrArg (vEvalMDE6 x) (vsource_traceMDE6 path)
 have hw := congrArg tr16 (vEval_wordMDE6 x (sourceWord28 path))
 simp only [tr16,hmapM13D,←map_add] at hw
 change vEvalMDE6 x (tr16 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path)))=
   tr16 (vKwordM9E1 x (sourceWord28 path)) at hw
 rw [hw] at h
 simpa [map_mul,map_add,vEvalMDE6] using h

end
end MathGKM.Markov
