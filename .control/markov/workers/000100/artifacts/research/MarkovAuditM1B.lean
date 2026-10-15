import MarkovBackwardTwoM1B
import MarkovBackwardTwoSourceM1B
import MarkovFourthFinalSixM1B
import MarkovFourthMiddleSixM1B
import MarkovOnsetSixAllM1B
import MarkovOnsetSixExceptionM1B
import MarkovOnsetSixSource0M1B
import MarkovOnsetSixSource1M1B
import MarkovOnsetSixSource2M1B
import MarkovOnsetSixSource3M1B
import MarkovOnsetSixSource4M1B
import MarkovOnsetSixSource5M1B
import MarkovOnsetSource0M1B
import MarkovOnsetSource1M1B
import MarkovOnsetSource2M1B
import MarkovOnsetSource3M1B
import MarkovOnsetSource4M1B
import MarkovOnsetSource5M1B
import MarkovOnsetValues0M1B
import MarkovOnsetValues1M1B
import MarkovOnsetValues2M1B
import MarkovOnsetValues3M1B
import MarkovOnsetValues4M1B
import MarkovOnsetValues5M1B
import MarkovPenultimateM1B
import MarkovReflectBlocksM1B
import MarkovResidualSixM1B
/-! Machine-authored 1b02dddc. Local axiom inventory only. -/
#print axioms MathGKM.Markov.convSeven_shift_guardM1B
#print axioms MathGKM.Markov.backward_two_coeffM1B
#print axioms MathGKM.Markov.source_fourth_backward_twoM1B
#print axioms MathGKM.Markov.source_fourth_final_sixM1B
#print axioms MathGKM.Markov.run_fourth_iff_middle_sixM1B
#print axioms MathGKM.Markov.source_fourth_onset_sixM1B
#print axioms MathGKM.Markov.onset_six_exceptionM1B
#print axioms MathGKM.Markov.source_fourth_onset_six0M1B
#print axioms MathGKM.Markov.source_fourth_onset_six1M1B
#print axioms MathGKM.Markov.source_fourth_onset_six2M1B
#print axioms MathGKM.Markov.source_fourth_onset_six3M1B
#print axioms MathGKM.Markov.source_fourth_onset_six4M1B
#print axioms MathGKM.Markov.source_fourth_onset_six5M1B
#print axioms MathGKM.Markov.pen_source0M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff0_1M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff0_2M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff0_3M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff0_4M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff0_5M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff0_6M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff0_7M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff0_8M1B
#print axioms MathGKM.Markov.pen_source1M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff1_1M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff1_2M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff1_3M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff1_4M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff1_5M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff1_6M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff1_7M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff1_8M1B
#print axioms MathGKM.Markov.pen_source2M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff2_1M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff2_2M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff2_3M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff2_4M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff2_5M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff2_6M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff2_7M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff2_8M1B
#print axioms MathGKM.Markov.pen_source3M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff3_1M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff3_2M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff3_3M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff3_4M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff3_5M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff3_6M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff3_7M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff3_8M1B
#print axioms MathGKM.Markov.pen_source4M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff4_1M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff4_2M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff4_3M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff4_4M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff4_5M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff4_6M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff4_7M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff4_8M1B
#print axioms MathGKM.Markov.pen_source5M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff5_1M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff5_2M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff5_3M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff5_4M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff5_5M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff5_6M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff5_7M1B
#print axioms MathGKM.Markov.source_fourth_onset_coeff5_8M1B
#print axioms MathGKM.Markov.onsetCorrection0_1_eqM1B
#print axioms MathGKM.Markov.onsetCorrection0_2_eqM1B
#print axioms MathGKM.Markov.onsetCorrection0_3_eqM1B
#print axioms MathGKM.Markov.onsetCorrection0_4_eqM1B
#print axioms MathGKM.Markov.onsetCorrection0_5_eqM1B
#print axioms MathGKM.Markov.onsetCorrection0_6_eqM1B
#print axioms MathGKM.Markov.onsetCorrection1_1_eqM1B
#print axioms MathGKM.Markov.onsetCorrection1_2_eqM1B
#print axioms MathGKM.Markov.onsetCorrection1_3_eqM1B
#print axioms MathGKM.Markov.onsetCorrection1_4_eqM1B
#print axioms MathGKM.Markov.onsetCorrection1_5_eqM1B
#print axioms MathGKM.Markov.onsetCorrection1_6_eqM1B
#print axioms MathGKM.Markov.onsetCorrection2_1_eqM1B
#print axioms MathGKM.Markov.onsetCorrection2_2_eqM1B
#print axioms MathGKM.Markov.onsetCorrection2_3_eqM1B
#print axioms MathGKM.Markov.onsetCorrection2_4_eqM1B
#print axioms MathGKM.Markov.onsetCorrection2_5_eqM1B
#print axioms MathGKM.Markov.onsetCorrection2_6_eqM1B
#print axioms MathGKM.Markov.onsetCorrection3_1_eqM1B
#print axioms MathGKM.Markov.onsetCorrection3_2_eqM1B
#print axioms MathGKM.Markov.onsetCorrection3_3_eqM1B
#print axioms MathGKM.Markov.onsetCorrection3_4_eqM1B
#print axioms MathGKM.Markov.onsetCorrection3_5_eqM1B
#print axioms MathGKM.Markov.onsetCorrection3_6_eqM1B
#print axioms MathGKM.Markov.onsetCorrection4_1_eqM1B
#print axioms MathGKM.Markov.onsetCorrection4_2_eqM1B
#print axioms MathGKM.Markov.onsetCorrection4_3_eqM1B
#print axioms MathGKM.Markov.onsetCorrection4_4_eqM1B
#print axioms MathGKM.Markov.onsetCorrection4_5_eqM1B
#print axioms MathGKM.Markov.onsetCorrection4_6_eqM1B
#print axioms MathGKM.Markov.onsetCorrection5_1_eqM1B
#print axioms MathGKM.Markov.onsetCorrection5_2_eqM1B
#print axioms MathGKM.Markov.onsetCorrection5_3_eqM1B
#print axioms MathGKM.Markov.onsetCorrection5_4_eqM1B
#print axioms MathGKM.Markov.onsetCorrection5_5_eqM1B
#print axioms MathGKM.Markov.onsetCorrection5_6_eqM1B
#print axioms MathGKM.Markov.pen_reflectM1B
#print axioms MathGKM.Markov.pen_conv1M1B
#print axioms MathGKM.Markov.pen_conv2M1B
#print axioms MathGKM.Markov.pen_conv3M1B
#print axioms MathGKM.Markov.pen_conv4M1B
#print axioms MathGKM.Markov.pen_conv5M1B
#print axioms MathGKM.Markov.pen_conv6M1B
#print axioms MathGKM.Markov.reflect_shift_padM1B
#print axioms MathGKM.Markov.reflect_five_blocksM1B
#print axioms MathGKM.Markov.backward_five_blocksM1B
#print axioms MathGKM.Markov.root_iff_core_sixM1B
