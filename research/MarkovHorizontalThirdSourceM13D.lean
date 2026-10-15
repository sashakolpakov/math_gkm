import MarkovHorizontalScaledM13D
import MarkovHorizontalLCM13D
/-! Machine-authored request 13d40bd7. Candidate source coefficient assembly. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem hthird_eval_clearedM13D (path : List Bool) (hb : 4 ≤ (frame path).mid.b)
 (x : ℝ) (hx : 0 < x) :
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let Q := h3seedM13D (a:ℝ) b (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ)
 6*x^2*(x+1)^7*(hrowEvalM13D x (frame path).mid.p).coeff 3=
 x^a*(x+1)^b*Q.eval x := by
 dsimp only
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let q := 2*a-b
 let t := min (b-a) (3*a-b)
 let u := 3*a-2*b
 let D := hDvalM13D x a b q t u
 let K := hKvalM13D x a b q t u
 let L := hLvalM13D x a b q t u
 let T := tr16 (hprojWordM13D x (sourceWord28 path))
 let P := hrowEvalM13D x (frame path).mid.p
 let z := x^a*(x+1)^b
 have hx0 : x≠0 := ne_of_gt hx
 have hh : x+1≠0 := by linarith
 obtain ⟨h0,h1,h2,h3⟩ := hsource_momentsM13D (hprojM13D x) (hproj_shapeM13D x) path hb
 change T.coeff 0=1 at h0
 change T.coeff 1=D at h1
 change 2*T.coeff 2=D^2+K at h2
 change 6*T.coeff 3=D^3+3*D*K+L at h3
 have ht : C z*T=(C (x+1)+X)*P := hsource_traceM13D x hx0 hh path
 have e0 := congrArg (fun p : ℝ[X] => p.coeff 0) ht
 have e1 := congrArg (fun p : ℝ[X] => p.coeff 1) ht
 have e2 := congrArg (fun p : ℝ[X] => p.coeff 2) ht
 have e3 := congrArg (fun p : ℝ[X] => p.coeff 3) ht
 simp only [add_mul,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul_zero,add_zero,h0,mul_one] at e0
 simp only [add_mul,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul,h1] at e1 e2 e3
 have f2 : z*(D^2+K)=2*(x+1)*P.coeff 2+2*P.coeff 1 := by
   linear_combination 2*e2-z*h2
 have f3 : z*(D^3+3*D*K+L)=6*(x+1)*P.coeff 3+6*P.coeff 2 := by
   linear_combination 6*e3-z*h3
 have he : 6*(x+1)^4*P.coeff 3=
   z*((x+1)^3*(D^3+3*D*K+L)-3*(x+1)^2*(D^2+K)+6*(x+1)*D-6) := by
   linear_combination -(x+1)^3*f3+3*(x+1)^2*f2-6*(x+1)*e1+6*e0
 have hs := hmoment_seedM13D x a b q t u hx0 hh
 change x^2*(x+1)^3*((x+1)^3*(D^3+3*D*K+L)-3*(x+1)^2*(D^2+K)+6*(x+1)*D-6)=_ at hs
 change 6*x^2*(x+1)^7*P.coeff 3=z*_
 linear_combination x^2*(x+1)^3*he+z*hs

theorem horizontal_third_formulaM13D (path : List Bool)
 (ha : 2 ≤ (frame path).mid.a) (hb : 7 ≤ (frame path).mid.b) :
 HorizontalThirdFormulaM13D path := by
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let q := 2*a-b
 let t := min (b-a) (3*a-b)
 let u := 3*a-2*b
 let p := (Bivariate.swap (frame path).mid.p).coeff 3
 let Q := h3seedM13D (a:ℝ) b q t u
 have hmap (a b q t u : ℤ) :
   (h3seedM13D a b q t u).map (Int.castRingHom ℝ)=h3seedM13D (a:ℝ) b q t u := by
   simp [h3seedM13D,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D,map_ofNat]
 have hclear : 6*X^2*(1+X)^7*p.map (Int.castRingHom ℝ)=X^a*(1+X)^b*Q := by
   apply Polynomial.eq_of_infinite_eval_eq
   apply (Set.Ioi_infinite (0:ℝ)).mono
   intro x hx
   have h := hthird_eval_clearedM13D path (by omega) x hx
   dsimp only at h
   rw [hrowEval_coeffM13D] at h
   simpa [Polynomial.eval_mul,Polynomial.eval_pow,Polynomial.eval_add,
     Polynomial.eval_map,p,a,b,q,t,u,Q,add_comm] using h
 have hz : (X^2*(1+X)^7 : ℝ[X])≠0 := by
   apply mul_ne_zero (pow_ne_zero _ Polynomial.X_ne_zero)
   apply pow_ne_zero
   intro h
   have hh := congrArg (fun p : ℝ[X] => p.coeff 0) h
   norm_num [Polynomial.coeff_one] at hh
 have ea : (X:ℝ[X])^a=X^2*X^(a-2) := by rw [←pow_add]; congr 1; dsimp [a]; omega
 have eb : (1+X:ℝ[X])^b=(1+X)^7*(1+X)^(b-7) := by rw [←pow_add]; congr 1; dsimp [b]; omega
 rw [ea,eb] at hclear
 have hf : (6:ℝ[X])*p.map (Int.castRingHom ℝ)=X^(a-2)*(1+X)^(b-7)*Q := by
   apply mul_left_cancel₀ hz
   linear_combination hclear
 apply Polynomial.map_injective (Int.castRingHom ℝ) (Int.cast_injective (α:=ℝ))
 change ((6:ℤ[X])*p).map (Int.castRingHom ℝ)=
   (X^(a-2)*(1+X)^(b-7)*h3seedM13D (a:ℤ) b q t u).map (Int.castRingHom ℝ)
 simpa only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,Polynomial.map_ofNat,hmap,Int.cast_natCast] using hf

theorem horizontal_third_rawM13D (path : List Bool)
 (ha : 2 ≤ (frame path).mid.a) (hb : 7 ≤ (frame path).mid.b) (i : ℕ) :
 coeff (frame path).mid.p i 3*coeff (frame path).mid.p (i+2) 3 ≤
 coeff (frame path).mid.p (i+1) 3^2 :=
 horizontal_third_of_formulaM13D path ha hb (horizontal_third_formulaM13D path ha hb) i

end
end MathGKM.Markov
