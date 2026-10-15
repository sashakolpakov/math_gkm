import MarkovHorizontalRescaleM511
/-! Machine-authored request 5110b3fa. Uniform integral residual recursion.
This is a representation theorem, not a log-concavity assertion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false

def hresidualM511 {R : Type*} [CommRing R] (x : R) (w : List Bool) : ℕ → R
 | 0 => (tr16 (hKwordM511 x w)).coeff 0
 | n+1 => (tr16 (hKwordM511 x w)).coeff (n+1)-(x+1)*hresidualM511 x w n

theorem hKletter_mapM511 {R S : Type*} [CommRing R] [CommRing S]
 (f : R →+* S) (x : R) (r : Bool) :
 hmapM13D (Polynomial.mapRingHom f) (hKletterM511 x r)=hKletterM511 (f x) r := by
 cases r <;> ext <;> simp [hmapM13D,hKletterM511,map_ofNat]

theorem hKword_mapM511 {R S : Type*} [CommRing R] [CommRing S]
 (f : R →+* S) (x : R) (w : List Bool) :
 hmapM13D (Polynomial.mapRingHom f) (hKwordM511 x w)=hKwordM511 (f x) w := by
 induction w with
 | nil => simp [hKwordM511,projProduct6905,hmapM13D]
 | cons r rs ih =>
   change hmapM13D (Polynomial.mapRingHom f) (mm16 (hKletterM511 x r) (hKwordM511 x rs))=_
   rw [hmap_mmM13D,hKletter_mapM511,ih]
   rfl

theorem hKtrace_mapM511 {R S : Type*} [CommRing R] [CommRing S]
 (f : R →+* S) (x : R) (w : List Bool) :
 (tr16 (hKwordM511 x w)).map f=tr16 (hKwordM511 (f x) w) := by
 have h := congrArg tr16 (hKword_mapM511 f x w)
 simpa [tr16,hmapM13D] using h

theorem hresidual_mapM511 {R S : Type*} [CommRing R] [CommRing S]
 (f : R →+* S) (x : R) (w : List Bool) (j : ℕ) :
 f (hresidualM511 x w j)=hresidualM511 (f x) w j := by
 induction j with
 | zero =>
   have h := congrArg (fun p : S[X] => p.coeff 0) (hKtrace_mapM511 f x w)
   simpa [Polynomial.coeff_map,hresidualM511] using h
 | succ j ih =>
   have h := congrArg (fun p : S[X] => p.coeff (j+1)) (hKtrace_mapM511 f x w)
   simpa [Polynomial.coeff_map,hresidualM511,ih] using
     congrArg (fun z => z-(f x+1)*hresidualM511 (f x) w j) h

theorem hsub_coeffM511 (x : ℝ) (p : ℝ[X]) (j : ℕ) :
 (hsubM511 x p).coeff j=(x+1)^(2*j)*p.coeff j := by
 induction p using Polynomial.induction_on' with
 | add p q hp hq => simp [map_add,Polynomial.coeff_add,hp,hq,mul_add]
 | monomial n c =>
   simp only [hsubM511,coe_eval₂RingHom,eval₂_monomial,mul_pow,←map_pow,←map_mul]
   rw [←mul_assoc,←map_mul,Polynomial.coeff_C_mul_X_pow]
   simp only [Polynomial.coeff_monomial]
   by_cases h : n=j
   · subst n; simp only [if_pos rfl]; rw [←pow_mul]; ring
   · simp [h,Ne.symm h]

theorem hresidual_source_evalM511 (x : ℝ) (hx : x≠0) (hh : x+1≠0)
 (path : List Bool) (j : ℕ) :
 (x+1)^(2*j)*(hrowEvalM13D x (frame path).mid.p).coeff j=
 (x+1)^((frame path).mid.b-1)*hresidualM511 x (sourceWord28 path) j := by
 have ht := hKsource_traceM511 x hx hh path
 let P := hsubM511 x (hrowEvalM13D x (frame path).mid.p)
 have H (j : ℕ) : P.coeff j=(x+1)^((frame path).mid.b-1)*hresidualM511 x (sourceWord28 path) j := by
   induction j with
   | zero =>
     have h := congrArg (fun p : ℝ[X] => p.coeff 0) ht
     simpa only [P,add_mul,one_mul,Polynomial.coeff_add,Polynomial.coeff_C_mul,
       mul_assoc,Polynomial.coeff_X_mul_zero,mul_zero,add_zero,hresidualM511] using h
   | succ j ih =>
     have h := congrArg (fun p : ℝ[X] => p.coeff (j+1)) ht
     simp only [add_mul,one_mul,Polynomial.coeff_add,Polynomial.coeff_C_mul,
       mul_assoc,Polynomial.coeff_X_mul] at h
     change P.coeff (j+1)+(x*P.coeff j+P.coeff j)=_ at h
     rw [ih] at h
     simp only [hresidualM511]
     linear_combination h
 have h := H j
 simpa only [P,hsub_coeffM511] using h

end
end MathGKM.Markov
