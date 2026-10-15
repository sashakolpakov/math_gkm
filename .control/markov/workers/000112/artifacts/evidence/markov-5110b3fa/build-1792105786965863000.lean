import MarkovHorizontalFourthMomentSeedM511
import MarkovFourthMoment01F
/-! Machine-authored request 5110b3fa. Exact actual-source fourth horizontal row. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

def h4sourceSeedM511 {R : Type*} [CommRing R] (a b : ℕ) : R[X] :=
 h4seedM511 (a:R) b (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ)
   (h4vM511 a b) (h4wM511 a b) (h4zM511 a b)

theorem hfourth_eval_clearedM511 (path : List Bool) (hb : 5 ≤ (frame path).mid.b)
 (x : ℝ) (hx : 0 < x) :
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 24*x^3*(x+1)^9*(hrowEvalM13D x (frame path).mid.p).coeff 4=
 x^a*(x+1)^b*(h4sourceSeedM511 a b).eval x := by
 dsimp only
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let q := 2*a-b
 let t := min (b-a) (3*a-b)
 let u := 3*a-2*b
 let v := h4vM511 a b
 let w := h4wM511 a b
 let zz := h4zM511 a b
 let D := hDvalM13D x a b q t u
 let K := hKvalM13D x a b q t u
 let L := hLvalM13D x a b q t u
 let M := h4valM511 x a b q t u v w zz
 let T := tr16 (hprojWordM13D x (sourceWord28 path))
 let P := hrowEvalM13D x (frame path).mid.p
 let z := x^a*(x+1)^b
 have hx0 : x≠0 := ne_of_gt hx
 have hh : x+1≠0 := by linarith
 obtain ⟨h0,h1,h2,h3⟩ := hsource_momentsM13D (hprojM13D x) (hproj_shapeM13D x) path (by omega)
 change T.coeff 0=1 at h0
 change T.coeff 1=D at h1
 change 2*T.coeff 2=D^2+K at h2
 change 6*T.coeff 3=D^3+3*D*K+L at h3
 have h4 := hsource_fourth_momentM511 (hprojM13D x) (hproj_shapeM13D x) path hb
 rw [h4source_valM511] at h4
 change logFour01F T=M at h4
 unfold logFour01F at h4
 rw [h1] at h4
 have h4' := fourth_newton01F _ _ _ _ _ _ _ h2 h3 h4
 have ht : C z*T=(C (x+1)+X)*P := hsource_traceM13D x hx0 hh path
 have e0 := congrArg (fun p : ℝ[X] => p.coeff 0) ht
 have e1 := congrArg (fun p : ℝ[X] => p.coeff 1) ht
 have e2 := congrArg (fun p : ℝ[X] => p.coeff 2) ht
 have e3 := congrArg (fun p : ℝ[X] => p.coeff 3) ht
 have e4 := congrArg (fun p : ℝ[X] => p.coeff 4) ht
 simp only [add_mul,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul_zero,add_zero,h0,mul_one] at e0
 simp only [add_mul,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul,h1] at e1 e2 e3 e4
 have f2 : z*(D^2+K)=2*(x+1)*P.coeff 2+2*P.coeff 1 := by
   linear_combination 2*e2-z*h2
 have f3 : z*(D^3+3*D*K+L)=6*(x+1)*P.coeff 3+6*P.coeff 2 := by
   linear_combination 6*e3-z*h3
 have f4 : z*(D^4+6*D^2*K+3*K^2+4*D*L+M)=24*(x+1)*P.coeff 4+24*P.coeff 3 := by
   linear_combination 24*e4-z*h4'
 have he : 24*(x+1)^5*P.coeff 4=
   z*((x+1)^4*(D^4+6*D^2*K+3*K^2+4*D*L+M)-
     4*(x+1)^3*(D^3+3*D*K+L)+12*(x+1)^2*(D^2+K)-24*(x+1)*D+24) := by
   linear_combination -(x+1)^4*f4+4*(x+1)^3*f3-12*(x+1)^2*f2+24*(x+1)*e1-24*e0
 have hs := hmoment_fourth_seedM511 x a b q t u v w zz hx0 hh
 change x^3*(x+1)^4*((x+1)^4*(D^4+6*D^2*K+3*K^2+4*D*L+M)-
   4*(x+1)^3*(D^3+3*D*K+L)+12*(x+1)^2*(D^2+K)-24*(x+1)*D+24)=_ at hs
 change 24*x^3*(x+1)^9*P.coeff 4=z*_
 linear_combination x^3*(x+1)^4*he+z*hs

theorem horizontal_fourth_formulaM511 (path : List Bool)
 (ha : 3 ≤ (frame path).mid.a) (hb : 9 ≤ (frame path).mid.b) :
 24*(Bivariate.swap (frame path).mid.p).coeff 4=
 X^((frame path).mid.a-3)*(1+X)^((frame path).mid.b-9)*
   h4sourceSeedM511 (frame path).mid.a (frame path).mid.b := by
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let p := (Bivariate.swap (frame path).mid.p).coeff 4
 let Q := (h4sourceSeedM511 a b : ℝ[X])
 have hmap : (h4sourceSeedM511 a b : ℤ[X]).map (Int.castRingHom ℝ)=Q := by
   simp [Q,h4sourceSeedM511,h4seedM511,h4c0M511,h4c1M511,h4c2M511,h4c3M511,
     h4c4M511,h4c5M511,h4c6M511,h4c7M511,map_ofNat]
 have hclear : 24*X^3*(1+X)^9*p.map (Int.castRingHom ℝ)=X^a*(1+X)^b*Q := by
   apply Polynomial.eq_of_infinite_eval_eq
   apply (Set.Ioi_infinite (0:ℝ)).mono
   intro x hx
   have h := hfourth_eval_clearedM511 path (by omega) x hx
   dsimp only at h
   rw [hrowEval_coeffM13D] at h
   simpa [Polynomial.eval_mul,Polynomial.eval_pow,Polynomial.eval_add,
     Polynomial.eval_map,p,a,b,Q,add_comm] using h
 have hz : (X^3*(1+X)^9 : ℝ[X])≠0 := by
   apply mul_ne_zero (pow_ne_zero _ Polynomial.X_ne_zero)
   apply pow_ne_zero
   intro h
   have hh := congrArg (fun p : ℝ[X] => p.coeff 0) h
   norm_num [Polynomial.coeff_one] at hh
 have ea : (X:ℝ[X])^a=X^3*X^(a-3) := by rw [←pow_add]; congr 1; dsimp [a]; omega
 have eb : (1+X:ℝ[X])^b=(1+X)^9*(1+X)^(b-9) := by rw [←pow_add]; congr 1; dsimp [b]; omega
 rw [ea,eb] at hclear
 have hf : (24:ℝ[X])*p.map (Int.castRingHom ℝ)=X^(a-3)*(1+X)^(b-9)*Q := by
   apply mul_left_cancel₀ hz
   linear_combination hclear
 apply Polynomial.map_injective (Int.castRingHom ℝ) (Int.cast_injective (α:=ℝ))
 change ((24:ℤ[X])*p).map (Int.castRingHom ℝ)=
   (X^(a-3)*(1+X)^(b-9)*h4sourceSeedM511 a b).map (Int.castRingHom ℝ)
 simpa only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,Polynomial.map_ofNat,hmap] using hf

end
end MathGKM.Markov
