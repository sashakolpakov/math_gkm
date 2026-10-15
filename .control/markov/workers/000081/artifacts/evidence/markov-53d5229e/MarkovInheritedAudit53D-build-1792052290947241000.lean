import MarkovCrossCoefficients07F1
import MarkovCrossGap107F1
import MarkovCrossGap207F1
import MarkovCrossGap307F1
import MarkovCrossGap407F1
import MarkovFirstCoefficients07F1
import MarkovFirstGap007F1
import MarkovFirstGap107F1
import MarkovFirstGap207F1
import MarkovFirstGap307F1
import MarkovFirstSource07F1
import MarkovSecondCoefficients07F1
import MarkovSecondGap007F1
import MarkovSecondGap1007F1
import MarkovSecondGap107F1
import MarkovSecondGap207F1
import MarkovSecondGap307F1
import MarkovSecondGap407F1
import MarkovSecondGap507F1
import MarkovSecondGap607F1
import MarkovSecondGap707F1
import MarkovSecondGap807F1
import MarkovSecondGap907F1
import MarkovSecondHigh07F1
import MarkovSecondLC07F1
import MarkovSecondOne07F1
import MarkovSecondParts07F1
import MarkovSecondShape07F1
import MarkovSecondSmall07F1
import MarkovSecondTwo07F1
import MarkovShapeGap007F1
import MarkovShapeGap107F1
import MarkovShapeGap207F1
import MarkovShapeGap307F1
import MarkovShapeGap407F1
import MarkovShapeGap507F1
import MarkovShapeGap607F1
import MarkovShapeLC07F1
import MarkovShapeParts07F1

#print axioms MathGKM.Markov.cross_coeff_007F1
#print axioms MathGKM.Markov.cross_coeff_107F1
#print axioms MathGKM.Markov.cross_coeff_207F1
#print axioms MathGKM.Markov.cross_coeff_307F1
#print axioms MathGKM.Markov.cross_coeff_407F1
#print axioms MathGKM.Markov.cross_coeff_507F1
#print axioms MathGKM.Markov.cross_gap_107F1
#print axioms MathGKM.Markov.cross_gap_207F1
#print axioms MathGKM.Markov.cross_gap_307F1
#print axioms MathGKM.Markov.cross_gap_407F1
#print axioms MathGKM.Markov.extract_monomial07F1
#print axioms MathGKM.Markov.first_coeff_007F1
#print axioms MathGKM.Markov.first_coeff_107F1
#print axioms MathGKM.Markov.first_coeff_207F1
#print axioms MathGKM.Markov.first_coeff_307F1
#print axioms MathGKM.Markov.first_coeff_407F1
#print axioms MathGKM.Markov.first_coeff_507F1
#print axioms MathGKM.Markov.first_gap_007F1
#print axioms MathGKM.Markov.first_gap_107F1
#print axioms MathGKM.Markov.first_gap_207F1
#print axioms MathGKM.Markov.first_gap_307F1
#print axioms MathGKM.Markov.third_first_band_lc07F1
#print axioms MathGKM.Markov.source_third_first_band07F1
#print axioms MathGKM.Markov.second_denominator07F1
#print axioms MathGKM.Markov.extract_two_bands07F1
#print axioms MathGKM.Markov.extract_tail07F1
#print axioms MathGKM.Markov.second_run_coeff07F1
#print axioms MathGKM.Markov.second_gap_0_nonneg07F1
#print axioms MathGKM.Markov.second_gap_10_nonneg07F1
#print axioms MathGKM.Markov.second_gap_1_nonneg07F1
#print axioms MathGKM.Markov.second_gap_2_nonneg07F1
#print axioms MathGKM.Markov.second_gap_3_nonneg07F1
#print axioms MathGKM.Markov.second_gap_4_nonneg07F1
#print axioms MathGKM.Markov.second_gap_5_nonneg07F1
#print axioms MathGKM.Markov.second_gap_6_nonneg07F1
#print axioms MathGKM.Markov.second_gap_7_nonneg07F1
#print axioms MathGKM.Markov.second_gap_8_nonneg07F1
#print axioms MathGKM.Markov.second_gap_9_nonneg07F1
#print axioms MathGKM.Markov.second_shift_lc07F1
#print axioms MathGKM.Markov.second_high_lc07F1
#print axioms MathGKM.Markov.second_shape_lc07F1
#print axioms MathGKM.Markov.third_second_band_lc07F1
#print axioms MathGKM.Markov.one_expand_L07F1
#print axioms MathGKM.Markov.one_expand_C07F1
#print axioms MathGKM.Markov.one_expand_R07F1
#print axioms MathGKM.Markov.one_gap_007F1
#print axioms MathGKM.Markov.one_gap_107F1
#print axioms MathGKM.Markov.one_gap_207F1
#print axioms MathGKM.Markov.one_gap_307F1
#print axioms MathGKM.Markov.one_gap_407F1
#print axioms MathGKM.Markov.one_gap_507F1
#print axioms MathGKM.Markov.one_gap_607F1
#print axioms MathGKM.Markov.second_One_shift07F1
#print axioms MathGKM.Markov.second_expand_L07F1
#print axioms MathGKM.Markov.second_expand_C07F1
#print axioms MathGKM.Markov.second_expand_R07F1
#print axioms MathGKM.Markov.tail_poly07F1
#print axioms MathGKM.Markov.second_shape_falling07F1
#print axioms MathGKM.Markov.second_one_lc07F1
#print axioms MathGKM.Markov.second_Two_shift07F1
#print axioms MathGKM.Markov.shape_gap_0_nonneg07F1
#print axioms MathGKM.Markov.shape_gap_1_nonneg07F1
#print axioms MathGKM.Markov.shape_gap_2_nonneg07F1
#print axioms MathGKM.Markov.shape_gap_3_nonneg07F1
#print axioms MathGKM.Markov.shape_gap_4_nonneg07F1
#print axioms MathGKM.Markov.shape_gap_5_nonneg07F1
#print axioms MathGKM.Markov.shape_gap_6_nonneg07F1
#print axioms MathGKM.Markov.thirdShape_shift_lc07F1
#print axioms MathGKM.Markov.thirdShape_lc07F1
#print axioms MathGKM.Markov.shape_expand_L07F1
#print axioms MathGKM.Markov.shape_expand_C07F1
#print axioms MathGKM.Markov.shape_expand_R07F1
