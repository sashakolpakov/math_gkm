import MarkovFourthAllCyclesBE
/-! Machine-authored request 0a5fcabe. Exact four-cycle correction, all run lengths. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
attribute [local irreducible] runBooleanGaugeADB2 localFour01F frame coeff

theorem cyclic_four_run_fourM0A5 (n : ℕ) (p q : Bool)
 (hs : ∀ z∈runBooleanListADB2 n true [false,p,q,true],Projection6905 z) :
 cyclicFour01F (runBooleanListADB2 n true [false,p,q,true])=
 runLocalFourBE n true false p q+runLocalFourBE n false p q true+
 runLocalFourBE n p q true false+runLocalFourBE n q true false p := by
 rw [show runBooleanListADB2 n true [false,p,q,true]=
   runBooleanGaugeADB2 n true false::runBooleanListADB2 n false [p,q,true] by rfl]
 rw [cyclic_four_local01F _ _ hs]
 simp only [runBooleanListADB2,List.take,localFourScan01F,List.cons_append,List.nil_append,
   headRatioOne01F,headRatioTwo01F,headRatioThree01F,runBoolean_b1ADB2,runLocalFourBE]
 ring

theorem four_moment_41M0A5 {R : Type*} [CommRing R]
 (f : Bool → Bool → Bool → Bool → R) :
 fourMomentBE f 4 1=
 f true false false false+f false false false true+
 f false false true false+f false true false false := by
 norm_num [fourMomentBE,boolMomentADB2,boolJetADB2,fourSourceMoment897,
   fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE]
 <;> ring

theorem four_moment_43M0A5 {R : Type*} [CommRing R]
 (f : Bool → Bool → Bool → Bool → R) :
 fourMomentBE f 4 3=
 f true false true true+f false true true true+
 f true true true false+f true true false true := by
 norm_num [fourMomentBE,boolMomentADB2,boolJetADB2,fourSourceMoment897,
   fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE]
 <;> ring


end
end MathGKM.Markov
