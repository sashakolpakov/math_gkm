import MarkovFourthAfterMiddleM722
import MarkovFourthMiddleM722
import MarkovMiddleBase0M722
import MarkovMiddleBase1M722
import MarkovMiddleBase2M722
import MarkovMiddleBase3M722
import MarkovMiddleCanonicalM722
import MarkovMiddleGap1_0M722
import MarkovMiddleGap1_1M722
import MarkovMiddleGap1_2M722
import MarkovMiddleGap1_3M722
import MarkovMiddleGap1_4M722
import MarkovMiddleGap1_5M722
import MarkovMiddleGap1_6M722
import MarkovMiddleGap1_7M722
import MarkovMiddleGap1_8M722
import MarkovMiddleGap3_1M722
import MarkovMiddleGap3_2M722
import MarkovMiddleGap3_3M722
import MarkovMiddleGap3_4M722
import MarkovMiddleRawDefM722
import MarkovMiddleShapeEq0M722
import MarkovMiddleShapeEq1M722
import MarkovMiddleShapeEq2M722
import MarkovMiddleShapeEq3M722
import MarkovMiddleShapeEq4M722
import MarkovMiddleShapeEq5M722
import MarkovMiddleShapesM722
import MarkovMiddleValue0_0M722
import MarkovMiddleValue0_1M722
import MarkovMiddleValue0_2M722
import MarkovMiddleValue1_0M722
import MarkovMiddleValue1_1M722
import MarkovMiddleValue1_2M722
import MarkovMiddleValue2_0M722
import MarkovMiddleValue2_1M722
import MarkovMiddleValue2_2M722
import MarkovMiddleValue3_0M722
import MarkovMiddleValue3_1M722
import MarkovMiddleValue3_2M722
import MarkovOnsetAdapter4M722
import MarkovOnsetAllM722
import MarkovResidualM722
/-! Machine-authored 722898f8. Checked-build theorem closure inspection. -/
#print axioms MathGKM.Markov.source_fourth_after_middleM722
#print axioms MathGKM.Markov.run_fourth_iff_middleM722
#print axioms MathGKM.Markov.source_fourth_middle_canonicalM722
#print axioms MathGKM.Markov.middle_gap_eq1_0_0M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_0_0M722
#print axioms MathGKM.Markov.middle_gap_eq1_1_0M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_1_0M722
#print axioms MathGKM.Markov.middle_gap_eq1_2_0M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_2_0M722
#print axioms MathGKM.Markov.middle_gap_eq1_3_0M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_3_0M722
#print axioms MathGKM.Markov.middle_gap_eq1_4_0M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_4_0M722
#print axioms MathGKM.Markov.middle_gap_eq1_5_0M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_5_0M722
#print axioms MathGKM.Markov.middle_gap_eq1_6_0M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_6_0M722
#print axioms MathGKM.Markov.middle_gap_eq1_7_0M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_7_0M722
#print axioms MathGKM.Markov.middle_gap_eq1_8_0M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_8_0M722
#print axioms MathGKM.Markov.middle_gap_eq1_0_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_0_1M722
#print axioms MathGKM.Markov.middle_gap_eq1_1_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_1_1M722
#print axioms MathGKM.Markov.middle_gap_eq1_2_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_2_1M722
#print axioms MathGKM.Markov.middle_gap_eq1_3_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_3_1M722
#print axioms MathGKM.Markov.middle_gap_eq1_4_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_4_1M722
#print axioms MathGKM.Markov.middle_gap_eq1_5_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_5_1M722
#print axioms MathGKM.Markov.middle_gap_eq1_6_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_6_1M722
#print axioms MathGKM.Markov.middle_gap_eq1_7_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_7_1M722
#print axioms MathGKM.Markov.middle_gap_eq1_0_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_0_2M722
#print axioms MathGKM.Markov.middle_gap_eq1_1_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_1_2M722
#print axioms MathGKM.Markov.middle_gap_eq1_2_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_2_2M722
#print axioms MathGKM.Markov.middle_gap_eq1_3_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_3_2M722
#print axioms MathGKM.Markov.middle_gap_eq1_4_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_4_2M722
#print axioms MathGKM.Markov.middle_gap_eq1_5_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_5_2M722
#print axioms MathGKM.Markov.middle_gap_eq1_6_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_6_2M722
#print axioms MathGKM.Markov.middle_gap_eq1_0_3M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_0_3M722
#print axioms MathGKM.Markov.middle_gap_eq1_1_3M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_1_3M722
#print axioms MathGKM.Markov.middle_gap_eq1_2_3M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_2_3M722
#print axioms MathGKM.Markov.middle_gap_eq1_3_3M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_3_3M722
#print axioms MathGKM.Markov.middle_gap_eq1_4_3M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_4_3M722
#print axioms MathGKM.Markov.middle_gap_eq1_5_3M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_5_3M722
#print axioms MathGKM.Markov.middle_gap_eq1_0_4M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_0_4M722
#print axioms MathGKM.Markov.middle_gap_eq1_1_4M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_1_4M722
#print axioms MathGKM.Markov.middle_gap_eq1_2_4M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_2_4M722
#print axioms MathGKM.Markov.middle_gap_eq1_3_4M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_3_4M722
#print axioms MathGKM.Markov.middle_gap_eq1_4_4M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_4_4M722
#print axioms MathGKM.Markov.middle_gap_eq1_0_5M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_0_5M722
#print axioms MathGKM.Markov.middle_gap_eq1_1_5M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_1_5M722
#print axioms MathGKM.Markov.middle_gap_eq1_2_5M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_2_5M722
#print axioms MathGKM.Markov.middle_gap_eq1_3_5M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_3_5M722
#print axioms MathGKM.Markov.middle_gap_eq1_0_6M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_0_6M722
#print axioms MathGKM.Markov.middle_gap_eq1_1_6M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_1_6M722
#print axioms MathGKM.Markov.middle_gap_eq1_2_6M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_2_6M722
#print axioms MathGKM.Markov.middle_gap_eq1_0_7M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_0_7M722
#print axioms MathGKM.Markov.middle_gap_eq1_1_7M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_1_7M722
#print axioms MathGKM.Markov.middle_gap_eq1_0_8M722
#print axioms MathGKM.Markov.middle_gap_nonneg1_0_8M722
#print axioms MathGKM.Markov.middle_gap_eq3_0_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_0_1M722
#print axioms MathGKM.Markov.middle_gap_eq3_1_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_1_1M722
#print axioms MathGKM.Markov.middle_gap_eq3_2_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_2_1M722
#print axioms MathGKM.Markov.middle_gap_eq3_3_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_3_1M722
#print axioms MathGKM.Markov.middle_gap_eq3_4_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_4_1M722
#print axioms MathGKM.Markov.middle_gap_eq3_5_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_5_1M722
#print axioms MathGKM.Markov.middle_gap_eq3_6_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_6_1M722
#print axioms MathGKM.Markov.middle_gap_eq3_7_1M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_7_1M722
#print axioms MathGKM.Markov.middle_gap_eq3_0_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_0_2M722
#print axioms MathGKM.Markov.middle_gap_eq3_1_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_1_2M722
#print axioms MathGKM.Markov.middle_gap_eq3_2_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_2_2M722
#print axioms MathGKM.Markov.middle_gap_eq3_3_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_3_2M722
#print axioms MathGKM.Markov.middle_gap_eq3_4_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_4_2M722
#print axioms MathGKM.Markov.middle_gap_eq3_5_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_5_2M722
#print axioms MathGKM.Markov.middle_gap_eq3_6_2M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_6_2M722
#print axioms MathGKM.Markov.middle_gap_eq3_0_3M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_0_3M722
#print axioms MathGKM.Markov.middle_gap_eq3_1_3M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_1_3M722
#print axioms MathGKM.Markov.middle_gap_eq3_2_3M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_2_3M722
#print axioms MathGKM.Markov.middle_gap_eq3_3_3M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_3_3M722
#print axioms MathGKM.Markov.middle_gap_eq3_4_3M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_4_3M722
#print axioms MathGKM.Markov.middle_gap_eq3_5_3M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_5_3M722
#print axioms MathGKM.Markov.middle_gap_eq3_0_4M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_0_4M722
#print axioms MathGKM.Markov.middle_gap_eq3_1_4M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_1_4M722
#print axioms MathGKM.Markov.middle_gap_eq3_2_4M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_2_4M722
#print axioms MathGKM.Markov.middle_gap_eq3_3_4M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_3_4M722
#print axioms MathGKM.Markov.middle_gap_eq3_4_4M722
#print axioms MathGKM.Markov.middle_gap_nonneg3_4_4M722
#print axioms MathGKM.Markov.middle_shape0M722
#print axioms MathGKM.Markov.middle_shape1M722
#print axioms MathGKM.Markov.middle_shape2M722
#print axioms MathGKM.Markov.middle_shape3M722
#print axioms MathGKM.Markov.middle_shape4M722
#print axioms MathGKM.Markov.middle_shape5M722
#print axioms MathGKM.Markov.middle_value0_0M722
#print axioms MathGKM.Markov.middle_value0_1M722
#print axioms MathGKM.Markov.middle_value0_2M722
#print axioms MathGKM.Markov.middle_value1_0M722
#print axioms MathGKM.Markov.middle_value1_1M722
#print axioms MathGKM.Markov.middle_value1_2M722
#print axioms MathGKM.Markov.middle_value2_0M722
#print axioms MathGKM.Markov.middle_value2_1M722
#print axioms MathGKM.Markov.middle_value2_2M722
#print axioms MathGKM.Markov.middle_value3_0M722
#print axioms MathGKM.Markov.middle_value3_1M722
#print axioms MathGKM.Markov.middle_value3_2M722
#print axioms MathGKM.Markov.source_fourth_onset4_1M722
#print axioms MathGKM.Markov.source_fourth_onset4_2M722
#print axioms MathGKM.Markov.source_fourth_onset4_3M722
#print axioms MathGKM.Markov.source_fourth_onset4_4M722
#print axioms MathGKM.Markov.source_fourth_onset4_5M722
#print axioms MathGKM.Markov.source_fourth_onset_chamber4M722
#print axioms MathGKM.Markov.source_fourth_onsetM722
#print axioms MathGKM.Markov.root_iff_coreM722
