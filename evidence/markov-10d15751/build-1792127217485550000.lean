import MarkovRawPrefixM10D

/-! Machine-authored 10d15751. Exact scope contrast with actual source
coefficients. Neither source polynomial is a root counterexample. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

theorem source_seven_nine_tripleM10D :
 let p := (frame [true,true,true,false]).mid.p
 coeff p 4 4=4 ∧ coeff p 5 3=12 ∧ coeff p 6 2=20 := by
 dsimp only
 simp only [←rawPair_sourceM10D]
 norm_num [sourceWord28,wordPairStep774,rawPairM10D,expand80,List.foldl_cons,List.foldl_nil,
   rawAtomicM10D,add_mul,one_mul,mul_assoc,coeff_add,coeff_U_succ725,
   coeff_U_zero725,coeff_V_succ725,coeff_V_zero725,coeff,U,V,
   Polynomial.coeff_add,Polynomial.coeff_one,Polynomial.coeff_X,
   Polynomial.coeff_C,Polynomial.coeff_C_mul,Polynomial.coeff_X_mul]

theorem source_seven_nine_validM10D :
 let m := (frame [true,true,true,false]).mid
 m.a=7 ∧ m.b=9 ∧ InPolygon m.a m.b 4 4 ∧ InPolygon m.a m.b 5 3 ∧
 InPolygon m.a m.b 6 2 ∧ coeff m.p 4 4*coeff m.p 6 2≤coeff m.p 5 3^2 := by
 have ha : (frame [true,true,true,false]).mid.a=7 := by decide
 have hb : (frame [true,true,true,false]).mid.b=9 := by decide
 dsimp only
 obtain ⟨h0,h1,h2⟩ := source_seven_nine_tripleM10D
 norm_num [ha,hb,InPolygon,h0,h1,h2]

theorem source_eleven_thirteen_zeroM10D :
 let p := (frame containingPathM10D).mid.p
 coeff p 4 4=0 ∧ coeff p 5 3=0 ∧ coeff p 6 2=0 := by
 obtain ⟨_,ha,hb⟩ := badPrefix_sourceM10D
 dsimp only
 refine ⟨raw_outside_polygon18 _ _ _ ?_,raw_outside_polygon18 _ _ _ ?_,
   raw_outside_polygon18 _ _ _ ?_⟩ <;> norm_num [InPolygon,ha,hb]

end
end MathGKM.Markov
