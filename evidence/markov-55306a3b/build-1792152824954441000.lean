import MarkovSourceLinearValueM553
import MarkovRawPrefixM10D
import MarkovResidualM37B
/-! Machine-authored 55306a3b. A literal source residual triple admitting a
rational-center certificate but no integer-center certificate. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

def centerPathM553 : List Bool := [false,false,false,false,true]

theorem center_source_coefficientsM553 :
 let p := (frame centerPathM553).mid.p
 coeff p 2 5=91 ∧ coeff p 3 5=728 ∧ coeff p 4 5=2340 := by
 dsimp only
 simp only [←rawPair_sourceM10D]
 norm_num [centerPathM553,sourceWord28,wordPairStep774,rawPairM10D,expand80,
   List.foldl_cons,List.foldl_nil,rawAtomicM10D,add_mul,one_mul,mul_assoc,
   coeff_add,coeff_U_succ725,coeff_U_zero725,coeff_V_succ725,coeff_V_zero725,
   coeff,U,V,Polynomial.coeff_add,Polynomial.coeff_one,Polynomial.coeff_X,
   Polynomial.coeff_C,Polynomial.coeff_C_mul,Polynomial.coeff_X_mul]

theorem center_source_labelsM553 :
 (frame centerPathM553).mid.a=2 ∧ (frame centerPathM553).mid.b=11 := by decide

theorem center_source_linear_valueM553 (C : ℝ) :
 linearMomentM553
   ((hresidualM511 (X:ℤ[X]) (sourceWord28 centerPathM553) 5).map
     (Int.castRingHom ℝ)) 0 2 C=tripleLinearM553 2 91 728 2340 C := by
 have hb := center_source_labelsM553.2
 have h := source_horizontal_linear_valueM553 centerPathM553 2 5 C (by omega)
 obtain ⟨h0,h1,h2⟩ := center_source_coefficientsM553
 simpa only [hb,h0,h1,h2,Nat.reduceSub,Nat.reduceAdd,Nat.reduceMul,
   Nat.cast_ofNat,Int.cast_ofNat] using h

theorem center_source_rationalM553 :
 0≤linearMomentM553
   ((hresidualM511 (X:ℤ[X]) (sourceWord28 centerPathM553) 5).map
     (Int.castRingHom ℝ)) 0 2 (3/2) := by
 rw [center_source_linear_valueM553]
 norm_num [tripleLinearM553]

theorem center_source_integer_failureM553 (z : ℤ) :
 linearMomentM553
   ((hresidualM511 (X:ℤ[X]) (sourceWord28 centerPathM553) 5).map
     (Int.castRingHom ℝ)) 0 2 z<0 := by
 rw [center_source_linear_valueM553]
 have hz : z≤1 ∨ z=2 ∨ 3≤z := by omega
 rcases hz with hz|hz|hz
 · have hzR : (z:ℝ)≤1 := by exact_mod_cast hz
   have hsq : 0≤((z:ℝ)-1)^2 := sq_nonneg _
   rw [zero_smoothing_centerM553]
   nlinarith
 · subst z; norm_num [tripleLinearM553]
 · have hzR : (3:ℝ)≤z := by exact_mod_cast hz
   have hpoly : tripleLinearM553 2 91 728 2340 z=
     -18720-24544*((z:ℝ)-3)-7774*((z:ℝ)-3)^2 := by
     unfold tripleLinearM553
     ring
   rw [hpoly]
   nlinarith [sq_nonneg ((z:ℝ)-3)]

theorem center_source_valid_rawM553 :
 let m := (frame centerPathM553).mid
 InPolygon m.a m.b 2 5 ∧ InPolygon m.a m.b 3 5 ∧ InPolygon m.a m.b 4 5 ∧
 coeff m.p 2 5*coeff m.p 4 5≤coeff m.p 3 5^2 := by
 dsimp only
 have ha := center_source_labelsM553.1
 have hb := center_source_labelsM553.2
 refine ⟨by norm_num [InPolygon,ha,hb],by norm_num [InPolygon,ha,hb],
   by norm_num [InPolygon,ha,hb],?_⟩
 have h := source_horizontal_linearM553 centerPathM553 2 5 (3/2) (by omega)
 have hn : (frame centerPathM553).mid.b-2*5-1=0 := by omega
 rw [hn] at h
 exact h center_source_rationalM553

theorem center_source_residual_guardsM553 :
 let m := (frame centerPathM553).mid
 2≤m.a ∧ 2+5+4≤m.a+m.b-1 ∧ 5≤(5:ℕ) ∧
 ¬HorizontalMiddleMF1E m.a m.b 2 5 ∧
 ¬(HorizontalRegionMAC3 m.a m.b 2 5 ∨ HorizontalVarianceMAC3 m.a m.b 2 5) ∧
 ¬HorizontalSharpM37B m.a m.b 2 5 := by
 dsimp only
 rw [center_source_labelsM553.1,center_source_labelsM553.2]
 norm_num [HorizontalMiddleMF1E,HorizontalRegionMAC3,MixtureRegionMAC3,
   HorizontalVarianceMAC3,VarianceRegionMAC3,HorizontalSharpM37B,SharpRegionM37B]

end
end MathGKM.Markov
