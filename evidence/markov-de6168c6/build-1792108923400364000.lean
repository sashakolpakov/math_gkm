import MarkovVerticalMomentsMDE6
/-! Machine-authored request de6168c6. Second vertical coefficient for actual
sources whose first path branch is right. Raw, unnormalized coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame

theorem vsecond_evalMDE6 (rest : List Bool) (ha : 4 ≤ (frame rest).mid.b)
 (x : ℝ) (hx : 0 < x) :
 let a := (frame rest).mid.b
 let r := a-(frame rest).mid.a
 2*x^3*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 (true::rest) 2)=
 x^(frame (true::rest)).mid.b*(v2seedMDE6 (a:ℝ) r (2*r-a:ℕ)).eval x := by
 dsimp only
 let a := (frame rest).mid.b
 let b := (frame rest).mid.a
 let r := a-b
 let q := 2*b-a
 let t := min (a-b) (3*b-a)
 let u := 3*b-2*a
 let D := vDMDE6 x a b q t u
 let K := vKMDE6 x a b q t u
 let T := tr16 (projProduct6905 ((sourceWord28 rest).map (vprojMDE6 x)))
 let E := vEvalMDE6 x (vdiffM9E1 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 (true::rest))))
 let z := x^(frame (true::rest)).mid.b
 have hx0 : x≠0 := ne_of_gt hx
 obtain ⟨h0,h1,h2⟩ := vsource_momentsMDE6 x hx0 rest ha
 change T.coeff 0=1 at h0
 change T.coeff 1=D at h1
 change 2*T.coeff 2=D^2+K at h2
 have ht : C z*T=(1+C (x+1)*X)*E := vproj_source_traceMDE6 x hx0 rest
 have e0 := congrArg (fun p : ℝ[X] => p.coeff 0) ht
 have e1 := congrArg (fun p : ℝ[X] => p.coeff 1) ht
 have e2 := congrArg (fun p : ℝ[X] => p.coeff 2) ht
 simp only [add_mul,one_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul_zero,mul_zero,add_zero,h0,mul_one] at e0
 simp only [add_mul,one_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul,h1] at e1 e2
 have he : 2*E.coeff 2=z*(D^2+K-2*(x+1)*D+2*(x+1)^2) := by
   linear_combination -2*e2+z*h2+2*(x+1)*e1-2*(x+1)^2*e0
 have hs := vmoment_seedMDE6 x a b q t u hx0
 change x^3*(D^2+K-2*(x+1)*D+2*(x+1)^2)=_ at hs
 have hab : b ≤ a := Nat.le_of_lt (frame_reduced rest).2.1
 have er : (a:ℝ)-b=(r:ℝ) := by dsimp [r]; rw [Nat.cast_sub hab]
 have esNat : (2*r-a)+2*b=a+q := by dsimp [r,q]; omega
 have esR : ((2*r-a:ℕ):ℝ)+2*b=(a:ℝ)+q := by exact_mod_cast esNat
 have es : (a:ℝ)-2*b+q=((2*r-a:ℕ):ℝ) := by linarith
 rw [er,es] at hs
 have ec : E.coeff 2=eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 (true::rest) 2) :=
   vEval_coeffMDE6 x _ 2
 rw [ec] at he
 change 2*x^3*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 (true::rest) 2)=z*_
 linear_combination x^3*he+z*hs

theorem vertical_second_formulaMDE6 (rest : List Bool) (ha : 5 ≤ (frame rest).mid.b) :
 let a := (frame (true::rest)).mid.a
 let b := (frame (true::rest)).mid.b
 let r := (frame rest).mid.b-(frame rest).mid.a
 2*(((frame (true::rest)).mid.p).coeff 2).map (Int.castRingHom ℝ)=
 X^(b-3)*(1+X)^(a-5)*v2seedMDE6 (a:ℝ) r (2*r-a:ℕ) := by
 dsimp only
 let a := (frame rest).mid.b
 let r := a-(frame rest).mid.a
 let b := (frame (true::rest)).mid.b
 let Q := (v2seedMDE6 (a:ℝ) r (2*r-a:ℕ) : ℝ[X])
 let R := (vresidualM9E1 (true::rest) 2).map (Int.castRingHom ℝ)
 have hi := source_vertical_indicesMDE6 0 rest
 simp only [List.replicate_zero,List.nil_append,Nat.zero_add,mul_one] at hi
 have hb : 3 ≤ b := by dsimp [b]; omega
 have hclear : 2*X^3*R=X^b*Q := by
   apply Polynomial.eq_of_infinite_eval_eq
   apply (Set.Ioi_infinite (0:ℝ)).mono
   intro x hx
   have h := vsecond_evalMDE6 rest (by omega) x hx
   simpa [Polynomial.eval_mul,Polynomial.eval_pow,Polynomial.eval_map,a,b,r,R,Q] using h
 have eb : (X:ℝ[X])^b=X^3*X^(b-3) := by rw [←pow_add]; congr 1; omega
 rw [eb] at hclear
 have hf : (2:ℝ[X])*R=X^(b-3)*Q := by
   apply mul_left_cancel₀ (pow_ne_zero 3 (X_ne_zero : (X:ℝ[X])≠0))
   linear_combination hclear
 have hs := vertical_all_order_factorM9E1 (true::rest) 2 (by omega)
 have hm := congrArg (Polynomial.map (Int.castRingHom ℝ)) hs
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_add,
   Polynomial.map_one,Polynomial.map_X] at hm
 rw [hm,hi.1]
 change 2*((X+1)^(a-2*2-1)*R)=X^(b-3)*(1+X)^(a-5)*Q
 rw [show a-2*2-1=a-5 by omega]
 linear_combination (1+X)^(a-5)*hf

theorem vertical_second_right_rawMDE6 (rest : List Bool)
 (ha : 5 ≤ (frame rest).mid.b) (j : ℕ) :
 coeff (frame (true::rest)).mid.p 2 j*coeff (frame (true::rest)).mid.p 2 (j+2) ≤
 coeff (frame (true::rest)).mid.p 2 (j+1)^2 := by
 let a := (frame rest).mid.b
 let r := a-(frame rest).mid.a
 have hi := source_vertical_indicesMDE6 0 rest
 simp only [List.replicate_zero,List.nil_append,Nat.zero_add,mul_one] at hi
 obtain ⟨hp,hab,_⟩ := frame_reduced rest
 have hr : 1 ≤ r := by dsimp [r,a]; omega
 have hra : r < a := by dsimp [r,a]; omega
 have h := v2seed_crossMDE6 a r hr hra
 have hs := crossLC_pascal h (a-5)
 rw [←coeffSeq_binomial_mul] at hs
 have ht := crossLC_X_pow_mul46 _ hs ((frame (true::rest)).mid.b-3)
 have hm := vertical_second_formulaMDE6 rest ha
 dsimp only at hm
 rw [hi.1] at hm
 rw [mul_assoc] at hm
 rw [←hm] at ht
 have hh := crossLC_adjacent ht ((j:ℤ)+1)
 have h0 : ¬(j:ℤ)<0 := by omega
 have h1 : ¬(j:ℤ)+1<0 := by omega
 have h2 : ¬(j:ℤ)+1+1<0 := by omega
 simp only [CoeffSeq,add_sub_cancel_right,h0,h1,h2,if_false,Int.toNat_natCast,
   Polynomial.coeff_ofNat_mul,Polynomial.coeff_map] at hh
 rw [show ((j:ℤ)+1).toNat=j+1 by omega,show ((j:ℤ)+1+1).toNat=j+2 by omega] at hh
 change 2*(coeff (frame (true::rest)).mid.p 2 j:ℝ)*
   (2*(coeff (frame (true::rest)).mid.p 2 (j+2):ℝ)) ≤
   (2*(coeff (frame (true::rest)).mid.p 2 (j+1):ℝ))^2 at hh
 have hr : (coeff (frame (true::rest)).mid.p 2 j:ℝ)*coeff (frame (true::rest)).mid.p 2 (j+2) ≤
   (coeff (frame (true::rest)).mid.p 2 (j+1):ℝ)^2 := by nlinarith
 exact_mod_cast hr

end
end MathGKM.Markov
