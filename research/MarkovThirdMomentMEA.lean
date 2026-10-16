import MarkovVerticalSmallSourceM758
/-! Machine-authored ead8a96f. Exact third-column moments for every run.
This is a source identity; no third-column log-concavity is asserted. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame

def vGeneralLMEA (x : ℝ) (n : ℕ) (rest : List Bool) : ℝ :=
 hsourceMomentM13D (fun p q r => hlocalLM13D
   (vGeneralProjMDE6 x n p) (vGeneralProjMDE6 x n q) (vGeneralProjMDE6 x n r)) rest

def vThirdMomentMEA (x : ℝ) (n : ℕ) (rest : List Bool) : ℝ :=
 let D := vGeneralDMDE6 x n rest
 let K := vGeneralKMDE6 x n rest
 let L := vGeneralLMEA x n rest
 D^3+3*D*K+L-3*(x+1)*(D^2+K)+6*(x+1)^2*D-6*(x+1)^3

theorem vertical_third_general_momentMEA (n : ℕ) (rest : List Bool)
 (ha : 4 ≤ (frame rest).mid.b) (x : ℝ) (hx : x≠0) :
 let path := List.replicate n false++true::rest
 6*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 3)=
 x^(frame path).mid.b*vThirdMomentMEA x n rest := by
 dsimp only
 let path := List.replicate n false++true::rest
 let D := vGeneralDMDE6 x n rest
 let K := vGeneralKMDE6 x n rest
 let L := vGeneralLMEA x n rest
 let T := tr16 (projProduct6905 ((sourceWord28 rest).map (vGeneralProjMDE6 x n)))
 let E := vEvalMDE6 x (vdiffM9E1 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path)))
 let z := x^(frame path).mid.b
 obtain ⟨h0,h1,h2,h3⟩ := hsource_momentsM13D (vGeneralProjMDE6 x n)
   (vGeneral_shapeMDE6 x hx n) rest ha
 change T.coeff 0=1 at h0
 change T.coeff 1=D at h1
 change 2*T.coeff 2=D^2+K at h2
 change 6*T.coeff 3=D^3+3*D*K+L at h3
 have ht : C z*T=(1+C (x+1)*X)*E := vGeneral_source_traceMDE6 x hx n rest
 have e0 := congrArg (fun p : ℝ[X] => p.coeff 0) ht
 have e1 := congrArg (fun p : ℝ[X] => p.coeff 1) ht
 have e2 := congrArg (fun p : ℝ[X] => p.coeff 2) ht
 have e3 := congrArg (fun p : ℝ[X] => p.coeff 3) ht
 simp only [add_mul,one_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul_zero,mul_zero,add_zero,h0,mul_one] at e0
 simp only [add_mul,one_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul,h1] at e1 e2 e3
 have he : 6*E.coeff 3=z*(D^3+3*D*K+L-3*(x+1)*(D^2+K)+
   6*(x+1)^2*D-6*(x+1)^3) := by
   linear_combination -6*e3+z*h3+6*(x+1)*e2-3*(x+1)*z*h2-
     6*(x+1)^2*e1+6*(x+1)^3*e0
 have ec : E.coeff 3=eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 3) :=
   vEval_coeffMDE6 x _ 3
 rw [ec] at he
 exact he

theorem vertical_third_raw_momentMEA (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b) (x : ℝ) (hx : x≠0) :
 let path := List.replicate n false++true::rest
 6*eval₂ (Int.castRingHom ℝ) x (((frame path).mid.p).coeff 3)=
 (x+1)^((frame path).mid.a-7)*x^(frame path).mid.b*vThirdMomentMEA x n rest := by
 dsimp only
 let path := List.replicate n false++true::rest
 have hi := (source_vertical_indicesMDE6 n rest).1
 have hf := vertical_all_order_factorM9E1 path 3 (by dsimp [path]; omega)
 have he := congrArg (eval₂ (Int.castRingHom ℝ) x) hf
 simp only [eval₂_mul,eval₂_pow,eval₂_add,eval₂_X,eval₂_one,
   show (frame path).mid.a-2*3-1=(frame path).mid.a-7 by omega] at he
 have hm := vertical_third_general_momentMEA n rest (by omega) x hx
 dsimp only at hm
 linear_combination 6*he+(x+1)^((frame path).mid.a-7)*hm
end
end MathGKM.Markov
