import MarkovThirdSourceMEA
import MarkovTwoMomentMEA
/-! Machine-authored f8ca2c8b. Exact short-cycle correction; no LC assertion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

theorem hsource_three_momentsMF8 {R : Type*} [CommRing R]
 (g : Bool → Mat16 R[X]) (hg : ∀ r, Projection6905 (g r)) (r : Bool) :
 let T := tr16 (projProduct6905 ((sourceWord28 [r]).map g))
 let D := hsourceMomentM13D (fun p _ _ => (g p).d.coeff 1) [r]
 let K := hsourceMomentM13D (fun p q s => hlocalKM13D (g p) (g q) (g s)) [r]
 let L := hsourceMomentM13D (fun p q s => hlocalLM13D (g p) (g q) (g s)) [r]
 T.coeff 0=1 ∧ T.coeff 1=D ∧ 2*T.coeff 2=D^2+K ∧
 6*T.coeff 3=D^3+3*D*K+L+6*(g false).a.coeff 1*(g r).a.coeff 1*(g true).a.coeff 1 := by
 obtain ⟨m0a,m0b,m0c,m0d⟩ := hg false
 obtain ⟨m1a,m1b,m1c,m1d⟩ := hg true
 cases r <;> dsimp only <;> refine ⟨?_,?_,?_,?_⟩
 all_goals
   norm_num [sourceWord28,wordPairStep774,projProduct6905,tr16,mm16,
     hsourceMomentM13D,boolMomentADB2,boolJetADB2,hlocalKM13D,hsingleKM13D,
     hlocalLM13D,singleLADB2,frame,initial,advance,Polynomial.coeff_add,
     Polynomial.mul_coeff_zero,coeff_mul_one46,coeff_mul_two8934,coeff_mul_three6905,
     m0a,m0b,m0c,m0d,m1a,m1b,m1c,m1d] <;> ring

attribute [local irreducible] frame
theorem vertical_three_momentMF8 (n : ℕ) (r : Bool) (x : ℝ) (hx : x≠0) :
 let path := List.replicate n false++[true,r]
 6*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 3)=
 x^(frame path).mid.b*vThirdMomentMEA x n [r]+6 := by
 dsimp only
 let path := List.replicate n false++[true,r]
 let D := vGeneralDMDE6 x n [r]
 let K := vGeneralKMDE6 x n [r]
 let L := vGeneralLMEA x n [r]
 let T := tr16 (projProduct6905 ((sourceWord28 [r]).map (vGeneralProjMDE6 x n)))
 let E := vEvalMDE6 x (vdiffM9E1 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path)))
 let z := x^(frame path).mid.b
 let c := (vGeneralProjMDE6 x n false).a.coeff 1*
   (vGeneralProjMDE6 x n r).a.coeff 1*(vGeneralProjMDE6 x n true).a.coeff 1
 obtain ⟨h0,h1,h2,h3⟩ := hsource_three_momentsMF8 (vGeneralProjMDE6 x n)
   (vGeneral_shapeMDE6 x hx n) r
 change T.coeff 0=1 at h0
 change T.coeff 1=D at h1
 change 2*T.coeff 2=D^2+K at h2
 have h3' : 6*T.coeff 3=D^3+3*D*K+L+6*c := by
   simpa only [mul_assoc] using h3
 have hc : z*c=1 := by
   have hb := (source_vertical_indicesMDE6 n [r]).2
   dsimp [z,c,path]
   rw [hb,vGeneral_a_firstMEA,vGeneral_a_firstMEA,vGeneral_a_firstMEA]
   cases r <;> simp only [frame,initial,advance,List.foldl_cons,List.foldl_nil,
     Bool.not_false,Bool.not_true,Bool.false_eq_true,if_true,if_false,add_zero,
     Nat.reduceAdd,Nat.reduceSub,Nat.reduceMul]
   all_goals
     simp only [pow_add,pow_mul]
     field_simp
     <;> ring
 have ht : C z*T=(1+C (x+1)*X)*E := vGeneral_source_traceMDE6 x hx n [r]
 have e0 := congrArg (fun p : ℝ[X] => p.coeff 0) ht
 have e1 := congrArg (fun p : ℝ[X] => p.coeff 1) ht
 have e2 := congrArg (fun p : ℝ[X] => p.coeff 2) ht
 have e3 := congrArg (fun p : ℝ[X] => p.coeff 3) ht
 simp only [add_mul,one_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul_zero,mul_zero,add_zero,h0,mul_one] at e0
 simp only [add_mul,one_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul,h1] at e1 e2 e3
 have he : 6*E.coeff 3=z*(D^3+3*D*K+L-3*(x+1)*(D^2+K)+
   6*(x+1)^2*D-6*(x+1)^3)+6 := by
   linear_combination -6*e3+z*h3'+6*(x+1)*e2-3*(x+1)*z*h2-
     6*(x+1)^2*e1+6*(x+1)^3*e0-6*hc
 have ec : E.coeff 3=eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 3) :=
   vEval_coeffMDE6 x _ 3
 rw [ec] at he
 exact he
end
end MathGKM.Markov
