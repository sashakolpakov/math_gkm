import MarkovVerticalSmallSourceM758
/-! Machine-authored ead8a96f. The exact two-letter trace correction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false

theorem hsource_two_momentsMEA {R : Type*} [CommRing R]
 (g : Bool → Mat16 R[X]) (hg : ∀ r, Projection6905 (g r)) :
 let T := tr16 (projProduct6905 ((sourceWord28 []).map g))
 let D := hsourceMomentM13D (fun p _ _ => (g p).d.coeff 1) []
 let K := hsourceMomentM13D (fun p q r => hlocalKM13D (g p) (g q) (g r)) []
 T.coeff 0=1 ∧ T.coeff 1=D ∧
 2*T.coeff 2=D^2+K+2*(g false).a.coeff 1*(g true).a.coeff 1 := by
 obtain ⟨m0a,m0b,m0c,m0d⟩ := hg false
 obtain ⟨ha',hb',hc',hd'⟩ := hg true
 dsimp only
 refine ⟨?_,?_,?_⟩
 all_goals
   norm_num [sourceWord28,wordPairStep774,projProduct6905,tr16,mm16,
     hsourceMomentM13D,boolMomentADB2,boolJetADB2,hlocalKM13D,hsingleKM13D,
     frame,initial,advance,Polynomial.coeff_add,Polynomial.mul_coeff_zero,
     coeff_mul_one46,coeff_mul_two8934,m0a,m0b,m0c,m0d,ha',hb',hc',hd']
   <;> ring

theorem vGeneral_a_firstMEA (x : ℝ) (n : ℕ) (r : Bool) :
 (vGeneralProjMDE6 x n r).a.coeff 1=(x^(n+1+if !r then 1 else 0))⁻¹ := by
 simp only [vGeneralProjMDE6,hscaleM13D,vswapMDE6,Polynomial.coeff_C_mul,
   (vRun_firstMDE6 x (n+if !r then 1 else 0)).1,mul_one]

attribute [local irreducible] frame
theorem vertical_two_momentMEA (n : ℕ) (x : ℝ) (hx : x≠0) :
 let path := List.replicate n false++[true]
 let D := vGeneralDMDE6 x n []
 let K := vGeneralKMDE6 x n []
 2*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 2)=
 x^(frame path).mid.b*(D^2+K-2*(x+1)*D+2*(x+1)^2)+2 := by
 dsimp only
 let path := List.replicate n false++[true]
 let D := vGeneralDMDE6 x n []
 let K := vGeneralKMDE6 x n []
 let T := tr16 (projProduct6905 ((sourceWord28 []).map (vGeneralProjMDE6 x n)))
 let E := vEvalMDE6 x (vdiffM9E1 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path)))
 let z := x^(frame path).mid.b
 let c := (vGeneralProjMDE6 x n false).a.coeff 1*(vGeneralProjMDE6 x n true).a.coeff 1
 obtain ⟨h0,h1,h2⟩ := hsource_two_momentsMEA (vGeneralProjMDE6 x n)
   (vGeneral_shapeMDE6 x hx n)
 change T.coeff 0=1 at h0
 change T.coeff 1=D at h1
 change 2*T.coeff 2=D^2+K+2*(vGeneralProjMDE6 x n false).a.coeff 1*
   (vGeneralProjMDE6 x n true).a.coeff 1 at h2
 have hc : z*c=1 := by
   have hb : (frame path).mid.b=2*n+3 := by
     have h := (source_vertical_indicesMDE6 n []).2
     rw [show (frame []).mid.b=2 by simp [frame,initial],
       show (frame []).mid.a=1 by simp [frame,initial]] at h
     omega
   dsimp [z,c]
   rw [hb,vGeneral_a_firstMEA,vGeneral_a_firstMEA]
   simp only [Bool.not_false,Bool.not_true,Bool.false_eq_true,if_true,if_false,add_zero]
   have he : x^(2*n+3)=x^(n+1+1)*x^(n+1) := by
     rw [←pow_add]; congr 1; omega
   rw [he]
   field_simp
 have ht : C z*T=(1+C (x+1)*X)*E := vGeneral_source_traceMDE6 x hx n []
 have e0 := congrArg (fun p : ℝ[X] => p.coeff 0) ht
 have e1 := congrArg (fun p : ℝ[X] => p.coeff 1) ht
 have e2 := congrArg (fun p : ℝ[X] => p.coeff 2) ht
 simp only [add_mul,one_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul_zero,mul_zero,add_zero,h0,mul_one] at e0
 simp only [add_mul,one_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul,h1] at e1 e2
 have he : 2*E.coeff 2=z*(D^2+K-2*(x+1)*D+2*(x+1)^2)+2 := by
   dsimp [c] at hc
   linear_combination -2*e2+z*h2+2*(x+1)*e1-2*(x+1)^2*e0+2*hc
 have ec : E.coeff 2=eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 2) :=
   vEval_coeffMDE6 x _ 2
 rw [ec] at he
 exact he

theorem vertical_two_candidateMEA (n : ℕ) (x : ℝ) (hx : x≠0) :
 let path := List.replicate n false++[true]
 2*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 path 2)=
 x^(2*n+3)*vSecondMomentMDE6 x n 2 1 0+2 := by
 dsimp only
 have h := vertical_two_momentMEA n x hx
 dsimp only at h
 obtain ⟨hd,hk⟩ := vGeneral_DK_explicitMDE6 x n []
 rw [hd,hk,vF_stepMDE6 x hx] at h
 have hb := (source_vertical_indicesMDE6 n []).2
 norm_num [frame,initial] at hd hk
 have hi : (frame (List.replicate n false++[true])).mid.b=2*n+3 := by
   rw [show (frame []).mid.b=2 by simp [frame,initial],
     show (frame []).mid.a=1 by simp [frame,initial]] at hb
   omega
 rw [hi] at h
 simpa only [vSecondMomentMDE6,frame,initial,List.foldl_nil,Nat.reduceSub,Nat.reduceMul,
   Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero] using h
end
end MathGKM.Markov
