import MarkovThirdOneSeq8BBB
/-! Machine-authored request 8bbb934e. Exact matrix formulas followed by jets. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 4096
set_option linter.unusedSimpArgs false
theorem oneGauge_formula_008BBB :
 runBooleanGaugeADB2 1 false false=
 ⟨U^1*C (1*X^2)+U^2*C (-1*X + -2*X^2 + -1*X^3),
  U^1*C (1)+U^2*C (1 + 2*X + 1*X^2),
  U^1*C (-1*X + 2*X^3)+U^2*C (-1*X + -4*X^2 + -5*X^3 + -2*X^4),
  C (1)+U^1*C (2 + 3*X)+U^2*C (1 + 4*X + 5*X^2 + 2*X^3)⟩ := by
 apply Mat16.ext <;>
   norm_num [runBooleanGaugeADB2,gauge75,shear75,unshear75,lowerMatrix487,lowerRun487,
     List.replicate_succ,List.replicate_zero,ambientWord5c,ambientT5c,mm16,U,V,
     runSumA27,Finset.sum_range_succ,map_ofNat] <;> ring
theorem oneGauge_008BBB :
 (runBooleanGaugeADB2 1 false false).a.coeff 1=(1*X^2) ∧
 (runBooleanGaugeADB2 1 false false).b.coeff 1=(1) ∧
 (runBooleanGaugeADB2 1 false false).c.coeff 1=(-1*X + 2*X^3) ∧
 (runBooleanGaugeADB2 1 false false).d.coeff 1=(2 + 3*X) ∧
 (runBooleanGaugeADB2 1 false false).b.coeff 2=(1 + 2*X + 1*X^2) ∧
 (runBooleanGaugeADB2 1 false false).c.coeff 2=(-1*X + -4*X^2 + -5*X^3 + -2*X^4) ∧
 (runBooleanGaugeADB2 1 false false).d.coeff 2=(1 + 4*X + 5*X^2 + 2*X^3) ∧
 (runBooleanGaugeADB2 1 false false).d.coeff 3=(0) := by
 rw [oneGauge_formula_008BBB]
 simp only [U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,
   Polynomial.coeff_X_pow]
 norm_num <;> (repeat' constructor) <;> ring
theorem oneGauge_formula_018BBB :
 runBooleanGaugeADB2 1 false true=
 ⟨U^1*C (1*X^3)+U^2*C (-1*X + -6*X^2 + -11*X^3 + -8*X^4 + -2*X^5)+U^3*C (-1*X + -6*X^2 + -14*X^3 + -16*X^4 + -9*X^5 + -2*X^6),
  U^1*C (1)+U^2*C (2 + 5*X + 4*X^2 + 1*X^3)+U^3*C (1 + 4*X + 6*X^2 + 4*X^3 + 1*X^4),
  U^1*C (-1*X + -6*X^2 + -8*X^3 + -2*X^4)+U^2*C (-2*X + -13*X^2 + -32*X^3 + -37*X^4 + -20*X^5 + -4*X^6)+U^3*C (-1*X + -8*X^2 + -26*X^3 + -44*X^4 + -41*X^5 + -20*X^6 + -4*X^7),
  C (1)+U^1*C (3 + 6*X + 2*X^2)+U^2*C (3 + 12*X + 17*X^2 + 10*X^3 + 2*X^4)+U^3*C (1 + 6*X + 14*X^2 + 16*X^3 + 9*X^4 + 2*X^5)⟩ := by
 apply Mat16.ext <;>
   norm_num [runBooleanGaugeADB2,gauge75,shear75,unshear75,lowerMatrix487,lowerRun487,
     List.replicate_succ,List.replicate_zero,ambientWord5c,ambientT5c,mm16,U,V,
     runSumA27,Finset.sum_range_succ,map_ofNat] <;> ring
theorem oneGauge_018BBB :
 (runBooleanGaugeADB2 1 false true).a.coeff 1=(1*X^3) ∧
 (runBooleanGaugeADB2 1 false true).b.coeff 1=(1) ∧
 (runBooleanGaugeADB2 1 false true).c.coeff 1=(-1*X + -6*X^2 + -8*X^3 + -2*X^4) ∧
 (runBooleanGaugeADB2 1 false true).d.coeff 1=(3 + 6*X + 2*X^2) ∧
 (runBooleanGaugeADB2 1 false true).b.coeff 2=(2 + 5*X + 4*X^2 + 1*X^3) ∧
 (runBooleanGaugeADB2 1 false true).c.coeff 2=(-2*X + -13*X^2 + -32*X^3 + -37*X^4 + -20*X^5 + -4*X^6) ∧
 (runBooleanGaugeADB2 1 false true).d.coeff 2=(3 + 12*X + 17*X^2 + 10*X^3 + 2*X^4) ∧
 (runBooleanGaugeADB2 1 false true).d.coeff 3=(1 + 6*X + 14*X^2 + 16*X^3 + 9*X^4 + 2*X^5) := by
 rw [oneGauge_formula_018BBB]
 simp only [U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,
   Polynomial.coeff_X_pow]
 norm_num <;> (repeat' constructor) <;> ring
theorem oneGauge_formula_108BBB :
 runBooleanGaugeADB2 1 true false=
 ⟨U^1*C (1*X^2)+U^2*C (-1*X + -2*X^2 + -1*X^3),
  U^1*C (1)+U^2*C (1 + 2*X + 1*X^2),
  U^1*C (-1*X + 2*X^3 + 2*X^4)+U^2*C (-1*X + -4*X^2 + -7*X^3 + -6*X^4 + -2*X^5),
  C (1)+U^1*C (2 + 3*X + 2*X^2)+U^2*C (1 + 4*X + 7*X^2 + 6*X^3 + 2*X^4)⟩ := by
 apply Mat16.ext <;>
   norm_num [runBooleanGaugeADB2,gauge75,shear75,unshear75,lowerMatrix487,lowerRun487,
     List.replicate_succ,List.replicate_zero,ambientWord5c,ambientT5c,mm16,U,V,
     runSumA27,Finset.sum_range_succ,map_ofNat] <;> ring
theorem oneGauge_108BBB :
 (runBooleanGaugeADB2 1 true false).a.coeff 1=(1*X^2) ∧
 (runBooleanGaugeADB2 1 true false).b.coeff 1=(1) ∧
 (runBooleanGaugeADB2 1 true false).c.coeff 1=(-1*X + 2*X^3 + 2*X^4) ∧
 (runBooleanGaugeADB2 1 true false).d.coeff 1=(2 + 3*X + 2*X^2) ∧
 (runBooleanGaugeADB2 1 true false).b.coeff 2=(1 + 2*X + 1*X^2) ∧
 (runBooleanGaugeADB2 1 true false).c.coeff 2=(-1*X + -4*X^2 + -7*X^3 + -6*X^4 + -2*X^5) ∧
 (runBooleanGaugeADB2 1 true false).d.coeff 2=(1 + 4*X + 7*X^2 + 6*X^3 + 2*X^4) ∧
 (runBooleanGaugeADB2 1 true false).d.coeff 3=(0) := by
 rw [oneGauge_formula_108BBB]
 simp only [U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,
   Polynomial.coeff_X_pow]
 norm_num <;> (repeat' constructor) <;> ring
theorem oneGauge_formula_118BBB :
 runBooleanGaugeADB2 1 true true=
 ⟨U^1*C (1*X^3)+U^2*C (-1*X + -6*X^2 + -11*X^3 + -8*X^4 + -2*X^5)+U^3*C (-1*X + -6*X^2 + -14*X^3 + -16*X^4 + -9*X^5 + -2*X^6),
  U^1*C (1)+U^2*C (2 + 5*X + 4*X^2 + 1*X^3)+U^3*C (1 + 4*X + 6*X^2 + 4*X^3 + 1*X^4),
  U^1*C (-1*X + -6*X^2 + -8*X^3 + -2*X^4 + 2*X^5)+U^2*C (-2*X + -13*X^2 + -34*X^3 + -49*X^4 + -42*X^5 + -20*X^6 + -4*X^7)+U^3*C (-1*X + -8*X^2 + -28*X^3 + -56*X^4 + -69*X^5 + -52*X^6 + -22*X^7 + -4*X^8),
  C (1)+U^1*C (3 + 6*X + 4*X^2)+U^2*C (3 + 12*X + 21*X^2 + 20*X^3 + 10*X^4 + 2*X^5)+U^3*C (1 + 6*X + 16*X^2 + 24*X^3 + 21*X^4 + 10*X^5 + 2*X^6)⟩ := by
 apply Mat16.ext <;>
   norm_num [runBooleanGaugeADB2,gauge75,shear75,unshear75,lowerMatrix487,lowerRun487,
     List.replicate_succ,List.replicate_zero,ambientWord5c,ambientT5c,mm16,U,V,
     runSumA27,Finset.sum_range_succ,map_ofNat] <;> ring
theorem oneGauge_118BBB :
 (runBooleanGaugeADB2 1 true true).a.coeff 1=(1*X^3) ∧
 (runBooleanGaugeADB2 1 true true).b.coeff 1=(1) ∧
 (runBooleanGaugeADB2 1 true true).c.coeff 1=(-1*X + -6*X^2 + -8*X^3 + -2*X^4 + 2*X^5) ∧
 (runBooleanGaugeADB2 1 true true).d.coeff 1=(3 + 6*X + 4*X^2) ∧
 (runBooleanGaugeADB2 1 true true).b.coeff 2=(2 + 5*X + 4*X^2 + 1*X^3) ∧
 (runBooleanGaugeADB2 1 true true).c.coeff 2=(-2*X + -13*X^2 + -34*X^3 + -49*X^4 + -42*X^5 + -20*X^6 + -4*X^7) ∧
 (runBooleanGaugeADB2 1 true true).d.coeff 2=(3 + 12*X + 21*X^2 + 20*X^3 + 10*X^4 + 2*X^5) ∧
 (runBooleanGaugeADB2 1 true true).d.coeff 3=(1 + 6*X + 16*X^2 + 24*X^3 + 21*X^4 + 10*X^5 + 2*X^6) := by
 rw [oneGauge_formula_118BBB]
 simp only [U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,
   Polynomial.coeff_X_pow]
 norm_num <;> (repeat' constructor) <;> ring
end
end MathGKM.Markov
