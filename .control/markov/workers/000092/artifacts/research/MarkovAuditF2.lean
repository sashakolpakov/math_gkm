import MarkovCubicMomentsF2
import MarkovCubicNumeratorF2
import MarkovFirstShiftCoeffF2
import MarkovFirstShiftFactF2
import MarkovFirstShiftGap1F2
import MarkovFirstShiftGap2F2
import MarkovFirstShiftGap3F2
import MarkovFirstShiftLCF2
import MarkovFirstShiftSourceF2
import MarkovFourCubicF2
import MarkovFourthBoundaryF2
import MarkovFourthSourceF2
import MarkovResidualF2
import MarkovResidualNextF2
import MarkovShiftGapPart0F2
import MarkovShiftGapPart1F2
import MarkovShiftGapPart2F2
import MarkovShiftGapPart3F2
import MarkovShiftGapPart4F2
import MarkovShiftGapPart5F2
import MarkovShiftGapPart6F2
import MarkovShiftGapPart7F2
import MarkovShiftGapPart8F2
import MarkovShiftPartsF2
import MarkovShiftProductF2
import MarkovThirdCubicF2
/-! Machine-authored f2da221d axiom-closure audit. -/
#print axioms MathGKM.Markov.thirdMoment_cubicF2
#print axioms MathGKM.Markov.fourMoment_cubicF2
#print axioms MathGKM.Markov.fourthNumerator_cubicF2
#print axioms MathGKM.Markov.shiftCorrection_mapF2
#print axioms MathGKM.Markov.fourthNumerator_cube_dvdF2
#print axioms MathGKM.Markov.fourthNumerator_next_dvdF2
#print axioms MathGKM.Markov.fourthNumerator_next_coeffF2
#print axioms MathGKM.Markov.source_fourth_next_convF2
#print axioms MathGKM.Markov.firstShift_factoredF2
#print axioms MathGKM.Markov.firstShift_large_rF2
#print axioms MathGKM.Markov.firstShiftGap_identity1F2
#print axioms MathGKM.Markov.firstShiftGap_nonneg1F2
#print axioms MathGKM.Markov.firstShiftGap_identity2F2
#print axioms MathGKM.Markov.firstShiftGap_nonneg2F2
#print axioms MathGKM.Markov.firstShiftGap_identity3F2
#print axioms MathGKM.Markov.firstShiftGap_nonneg3F2
#print axioms MathGKM.Markov.firstShift_logConcaveF2
#print axioms MathGKM.Markov.source_fourth_first_shiftF2
#print axioms MathGKM.Markov.localFour_cubicF2
#print axioms MathGKM.Markov.convLow_at0F2
#print axioms MathGKM.Markov.convLow_at1F2
#print axioms MathGKM.Markov.convLow_at2F2
#print axioms MathGKM.Markov.convLow_at3F2
#print axioms MathGKM.Markov.convLow_at4F2
#print axioms MathGKM.Markov.convLow_at5F2
#print axioms MathGKM.Markov.convLow_at6F2
#print axioms MathGKM.Markov.lowGap1_identityF2
#print axioms MathGKM.Markov.lowGap1_nonnegF2
#print axioms MathGKM.Markov.lowCoeff1_lcF2
#print axioms MathGKM.Markov.lowGap2_identityF2
#print axioms MathGKM.Markov.lowGap2_nonnegF2
#print axioms MathGKM.Markov.lowCoeff2_lcF2
#print axioms MathGKM.Markov.lowGap3_identityF2
#print axioms MathGKM.Markov.lowGap3_nonnegF2
#print axioms MathGKM.Markov.lowCoeff3_lcF2
#print axioms MathGKM.Markov.lowGap4_identityF2
#print axioms MathGKM.Markov.lowGap4_nonnegF2
#print axioms MathGKM.Markov.lowCoeff4_lcF2
#print axioms MathGKM.Markov.lowGap5_identityF2
#print axioms MathGKM.Markov.lowGap5_nonnegF2
#print axioms MathGKM.Markov.lowCoeff5_lcF2
#print axioms MathGKM.Markov.fourthLow_convolution_lcF2
#print axioms MathGKM.Markov.source_fourth_convF2
#print axioms MathGKM.Markov.source_fourth_initial_allF2
#print axioms MathGKM.Markov.root_iff_coreF2
#print axioms MathGKM.Markov.root_iff_coreNextF2
#print axioms MathGKM.Markov.shiftGapPart_identity0F2
#print axioms MathGKM.Markov.shiftGapPart_nonneg0F2
#print axioms MathGKM.Markov.shiftGapPart_identity1F2
#print axioms MathGKM.Markov.shiftGapPart_nonneg1F2
#print axioms MathGKM.Markov.shiftGapPart_identity2F2
#print axioms MathGKM.Markov.shiftGapPart_nonneg2F2
#print axioms MathGKM.Markov.shiftGapPart_identity3F2
#print axioms MathGKM.Markov.shiftGapPart_nonneg3F2
#print axioms MathGKM.Markov.shiftGapPart_identity4F2
#print axioms MathGKM.Markov.shiftGapPart_nonneg4F2
#print axioms MathGKM.Markov.shiftGapPart_identity5F2
#print axioms MathGKM.Markov.shiftGapPart_nonneg5F2
#print axioms MathGKM.Markov.shiftGapPart_identity6F2
#print axioms MathGKM.Markov.shiftGapPart_nonneg6F2
#print axioms MathGKM.Markov.shiftGapPart_identity7F2
#print axioms MathGKM.Markov.shiftGapPart_nonneg7F2
#print axioms MathGKM.Markov.shiftGapPart_identity8F2
#print axioms MathGKM.Markov.shiftGapPart_nonneg8F2
#print axioms MathGKM.Markov.shiftParts0F2
#print axioms MathGKM.Markov.shiftParts1F2
#print axioms MathGKM.Markov.shiftParts2F2
#print axioms MathGKM.Markov.eval_shift_productF2
#print axioms MathGKM.Markov.fourthNumerator_shift_dvdF2
#print axioms MathGKM.Markov.fourthNumerator_coeff_shiftF2
#print axioms MathGKM.Markov.source_fourth_shift_binomialF2
#print axioms MathGKM.Markov.localThird_cubicF2
