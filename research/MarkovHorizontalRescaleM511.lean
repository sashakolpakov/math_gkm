import MarkovHorizontalTraceM13D
/-! Machine-authored request 5110b3fa. Integral horizontal rescaling alphabet.
This representation has no row cutoff and no positivity premise. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false

def hKletterM511 {R : Type*} [CommRing R] (x : R) (r : Bool) : Mat16 R[X] :=
 if r then
 ⟨X+C ((x+1)^2)*X^2,
  C (x+2)*X+C ((x+1)^2)*X^2,
  C (x*(x+2))*X+C (x*(x+1)^2)*X^2,
  C x+C (x*(2*x+3))*X+C (x*(x+1)^2)*X^2⟩
 else ⟨X,X,C x*X,1+C x*X⟩

def hKwordM511 {R : Type*} [CommRing R] (x : R) (w : List Bool) : Mat16 R[X] :=
 projProduct6905 (w.map (hKletterM511 x))

def hsubM511 (x : ℝ) : ℝ[X] →+* ℝ[X] :=
 eval₂RingHom C (C ((x+1)^2)*X)

theorem hKletter_scaledM511 (x : ℝ) (hx : x≠0) (hh : x+1≠0) (r : Bool) :
 hKletterM511 x r=hscaleM13D (C (if r then x else 1))
   (hmapM13D (hsubM511 x) (hprojM13D x r)) := by
 cases r <;> apply Mat16.ext <;> apply Polynomial.funext <;> intro y <;>
 simp [hKletterM511,hscaleM13D,hmapM13D,hsubM511,hprojM13D] <;>
 field_simp <;> ring

theorem hmap_scaleM511 {R S : Type*} [CommRing R] [CommRing S]
 (f : R →+* S) (c : R) (m : Mat16 R) :
 hmapM13D f (hscaleM13D c m)=hscaleM13D (f c) (hmapM13D f m) := by
 ext <;> simp [hmapM13D,hscaleM13D]

theorem hKword_scaledM511 (x : ℝ) (hx : x≠0) (hh : x+1≠0) (w : List Bool) :
 hKwordM511 x w=hscaleM13D (C (x^(w.count true)))
   (hmapM13D (hsubM511 x) (hprojWordM13D x w)) := by
 induction w with
 | nil => simp [hKwordM511,hprojWordM13D,projProduct6905,hmapM13D,hscaleM13D]
 | cons r rs ih =>
   change mm16 (hKletterM511 x r) (hKwordM511 x rs)=_
   rw [hKletter_scaledM511 x hx hh,ih,hscale_mmM13D]
   have he : C (if r then x else 1)*C (x^rs.count true)=C (x^(r::rs).count true) := by
     rw [←map_mul]; congr 1
     cases r <;> simp [List.count_cons,pow_succ,mul_comm]
   rw [he]
   unfold hprojWordM13D
   simp only [List.map_cons,projProduct6905,hmap_mmM13D]

theorem hKsource_traceM511 (x : ℝ) (hx : x≠0) (hh : x+1≠0) (path : List Bool) :
 (1+C (x+1)*X)*hsubM511 x (hrowEvalM13D x (frame path).mid.p)=
 C ((x+1)^((frame path).mid.b-1))*tr16 (hKwordM511 x (sourceWord28 path)) := by
 have ht := congrArg (hsubM511 x) (hsource_traceM13D x hx hh path)
 have hw := congrArg tr16 (hKword_scaledM511 x hx hh (sourceWord28 path))
 rw [(source_word_counts28 path).1] at hw
 simp only [tr16,hscaleM13D,hmapM13D] at hw
 rw [←mul_add,←map_add] at hw
 change tr16 (hKwordM511 x (sourceWord28 path))=
   C (x^(frame path).mid.a)*hsubM511 x (tr16 (hprojWordM13D x (sourceWord28 path))) at hw
 simp only [map_mul,map_add,hsubM511,coe_eval₂RingHom,eval₂_C,eval₂_X] at ht
 have hb : 1 ≤ (frame path).mid.b := by obtain ⟨ha,hab,_⟩ := frame_reduced path; omega
 have hp : (x+1)^((frame path).mid.b)=(x+1)*(x+1)^((frame path).mid.b-1) := by
   rw [←pow_succ']; congr 1; omega
 apply mul_left_cancel₀ (show C (x+1)≠(0:ℝ[X]) from C_ne_zero.mpr hh)
 rw [hw]
 change C (x+1)*((1+C (x+1)*X)*hsubM511 x (hrowEvalM13D x (frame path).mid.p))=_
 rw [hp,map_mul] at ht
 rw [←map_add] at ht
 change C (x^(frame path).mid.a)*(C (x+1)*C ((x+1)^((frame path).mid.b-1)))*
   hsubM511 x (tr16 (hprojWordM13D x (sourceWord28 path)))=
   (C (x+1)+C ((x+1)^2)*X)*hsubM511 x (hrowEvalM13D x (frame path).mid.p) at ht
 simp only [map_pow] at ht ⊢
 linear_combination -ht

end
end MathGKM.Markov
