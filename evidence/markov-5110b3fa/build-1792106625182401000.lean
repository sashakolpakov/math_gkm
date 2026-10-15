import MarkovHorizontalResidualM511
/-! Machine-authored request 5110b3fa. Positive matrix expression for the
all-order horizontal residual; no log-concavity is asserted. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option linter.unusedSimpArgs false

def hdiffM511 {R : Type*} [CommRing R] (m : Mat16 R) : R := m.b+m.d-m.a-m.c

theorem hdiff_conjM511 (x : ℝ) (m : Mat16 ℝ[X]) :
 hdiffM511 (hconjM13D x m)=C (x+1)*m.b := by
 simp only [hdiffM511,hconjM13D,hleftM13D,hrightM13D,mm16,map_neg]
 ring

theorem hdiff_scaleM511 {R : Type*} [CommRing R] (c : R) (m : Mat16 R) :
 hdiffM511 (hscaleM13D c m)=c*hdiffM511 m := by
 simp only [hdiffM511,hscaleM13D]; ring

theorem hdiff_mapM511 {R S : Type*} [CommRing R] [CommRing S]
 (f : R →+* S) (m : Mat16 R) : hdiffM511 (hmapM13D f m)=f (hdiffM511 m) := by
 simp [hdiffM511,hmapM13D]

theorem hdiff_source_evalM511 (x : ℝ) (hx : x≠0) (hh : x+1≠0) (path : List Bool) :
 hsubM511 x (hrowEvalM13D x (frame path).mid.p)=
 C ((x+1)^((frame path).mid.b-1))*hdiffM511 (hKwordM511 x (sourceWord28 path)) := by
 have hw := congrArg hdiffM511 (hword_scaledM13D x hx hh (sourceWord28 path))
 rw [hdiff_conjM511,hdiff_scaleM511,(source_word_counts28 path).1,
   (source_word_counts28 path).2] at hw
 have hp := source_word_exact3eda path
 change C (x+1)*hrowEvalM13D x (rawWord80 (sourceWord28 path)).b=_ at hw
 rw [←hp] at hw
 have hs := congrArg (hsubM511 x) hw
 simp only [map_mul,hsubM511,coe_eval₂RingHom,eval₂_C] at hs
 have hk := congrArg hdiffM511 (hKword_scaledM511 x hx hh (sourceWord28 path))
 rw [hdiff_scaleM511,hdiff_mapM511,(source_word_counts28 path).1] at hk
 have hb : 1 ≤ (frame path).mid.b := by obtain ⟨ha,hab,_⟩ := frame_reduced path; omega
 have hpow : (x+1)^((frame path).mid.b)=(x+1)*(x+1)^((frame path).mid.b-1) := by
   rw [←pow_succ']; congr 1; omega
 apply mul_left_cancel₀ (show C (x+1)≠(0:ℝ[X]) from C_ne_zero.mpr hh)
 rw [hk]
 rw [hpow,map_mul] at hs
 change C (x+1)*hsubM511 x (hrowEvalM13D x (frame path).mid.p)=
   C (x^(frame path).mid.a)*(C (x+1)*C ((x+1)^((frame path).mid.b-1)))*
     hsubM511 x (hdiffM511 (hprojWordM13D x (sourceWord28 path))) at hs
 linear_combination hs

theorem hresidual_diffM511 (path : List Bool) (j : ℕ) :
 hresidualM511 (X:ℤ[X]) (sourceWord28 path) j=
 (hdiffM511 (hKwordM511 (X:ℤ[X]) (sourceWord28 path))).coeff j := by
 apply Polynomial.map_injective (Int.castRingHom ℝ) (Int.cast_injective (α:=ℝ))
 apply Polynomial.eq_of_infinite_eval_eq
 apply (Set.Ioi_infinite (0:ℝ)).mono
 intro x hx
 change 0 < x at hx
 let f := Polynomial.eval₂RingHom (Int.castRingHom ℝ) x
 have hh : x+1≠0 := by linarith
 have h1 := hresidual_source_evalM511 x (ne_of_gt hx) hh path j
 have h2 := congrArg (fun p : ℝ[X] => p.coeff j)
   (hdiff_source_evalM511 x (ne_of_gt hx) hh path)
 rw [hsub_coeffM511,Polynomial.coeff_C_mul] at h2
 have he : hresidualM511 x (sourceWord28 path) j=
   (hdiffM511 (hKwordM511 x (sourceWord28 path))).coeff j :=
   mul_left_cancel₀ (pow_ne_zero _ hh) (h1.symm.trans h2)
 have hr := hresidual_mapM511 f (X:ℤ[X]) (sourceWord28 path) j
 have hk := congrArg hdiffM511 (hKword_mapM511 f (X:ℤ[X]) (sourceWord28 path))
 rw [hdiff_mapM511] at hk
 have hc := congrArg (fun p : ℝ[X] => p.coeff j) hk
 change f ((hdiffM511 (hKwordM511 (X:ℤ[X]) (sourceWord28 path))).coeff j)=
   (hdiffM511 (hKwordM511 (f X) (sourceWord28 path))).coeff j at hc
 have hf : f (X:ℤ[X])=x := by simp [f]
 rw [hf] at hr hc
 have hout := hr.trans (he.trans hc.symm)
 simpa only [Polynomial.eval_map,coe_eval₂RingHom,f] using hout

theorem hdiff_lastM511 {R : Type*} [CommRing R] (x : R) (m : Mat16 R[X]) :
 hdiffM511 (mm16 m (hKletterM511 x true))=
 (m.a+m.c)*C (x+1)*X+(m.b+m.d)*C x*(1+C (x+1)*X) := by
 simp [hdiffM511,mm16,hKletterM511,map_add,map_mul,map_ofNat]
 ring

end
end MathGKM.Markov
