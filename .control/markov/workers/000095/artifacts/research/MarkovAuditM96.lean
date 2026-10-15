import MarkovFourthPolygonM96
import MarkovOnsetA1M96
import MarkovOnsetA2M96
import MarkovOnsetA3M96
import MarkovOnsetA4M96
import MarkovOnsetB1M96
import MarkovOnsetB2M96
import MarkovOnsetB3M96
import MarkovOnsetB4M96
import MarkovOnsetColumn10M96
import MarkovOnsetColumn11M96
import MarkovOnsetColumn12M96
import MarkovOnsetColumn20M96
import MarkovOnsetColumn21M96
import MarkovOnsetColumn22M96
import MarkovOnsetColumn30M96
import MarkovOnsetColumn31M96
import MarkovOnsetColumn32M96
import MarkovOnsetColumn40M96
import MarkovOnsetColumn41M96
import MarkovOnsetColumn42M96
import MarkovOnsetColumnsM96
import MarkovOnsetD1M96
import MarkovOnsetD2M96
import MarkovOnsetD3M96
import MarkovOnsetD4M96
import MarkovOnsetDefsM96
import MarkovOnsetExpand1M96
import MarkovOnsetExpand2M96
import MarkovOnsetExpand3M96
import MarkovOnsetExpand4M96
import MarkovOnsetExpand5M96
import MarkovOnsetExpand6M96
import MarkovOnsetGap10M96
import MarkovOnsetGap11M96
import MarkovOnsetGap12M96
import MarkovOnsetGap20M96
import MarkovOnsetGap21M96
import MarkovOnsetGap22M96
import MarkovOnsetGap30M96
import MarkovOnsetGap31M96
import MarkovOnsetGap32M96
import MarkovOnsetGap40M96
import MarkovOnsetGap41M96
import MarkovOnsetGap42M96
import MarkovOnsetLFinal1M96
import MarkovOnsetLFinal2M96
import MarkovOnsetLFinal3M96
import MarkovOnsetLFinal4M96
import MarkovOnsetM96
import MarkovOnsetPartsM96
import MarkovOnsetSourceM96
import MarkovOnsetValue1M96
import MarkovOnsetValue2M96
import MarkovOnsetValue3M96
import MarkovOnsetValue4M96
import MarkovOnsetValue5M96
import MarkovOnsetValue6M96
import MarkovPrefixM96
import MarkovResidualOnsetM96
/-! Machine-authored 96dea62b. Local axiom inventory. -/
#print axioms MathGKM.Markov.lower_slice_polygon_iffM96
#print axioms MathGKM.Markov.lower_slice_polygon_boundM96
#print axioms MathGKM.Markov.source_fourth_polygon_boundM96
#print axioms MathGKM.Markov.onsetA1M96
#print axioms MathGKM.Markov.onsetA2M96
#print axioms MathGKM.Markov.onsetA3M96
#print axioms MathGKM.Markov.onsetA4M96
#print axioms MathGKM.Markov.onsetB1M96
#print axioms MathGKM.Markov.onsetB2M96
#print axioms MathGKM.Markov.onsetB3M96
#print axioms MathGKM.Markov.onsetB4M96
#print axioms MathGKM.Markov.onsetColumnGap1_0M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap1_1M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap1_2M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap1_3M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap1_4M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap1_5M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap1_6M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap1_7M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap1_8M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap2_0M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap2_1M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap2_2M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap2_3M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap2_4M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap2_5M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap2_6M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap2_7M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap2_8M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap3_0M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap3_1M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap3_2M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap3_3M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap3_4M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap3_5M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap3_6M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap3_7M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap3_8M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap4_0M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap4_1M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap4_2M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap4_3M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap4_4M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap4_5M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap4_6M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap4_7M96_nonneg
#print axioms MathGKM.Markov.onsetColumnGap4_8M96_nonneg
#print axioms MathGKM.Markov.onset_columns1M96
#print axioms MathGKM.Markov.onset_columns2M96
#print axioms MathGKM.Markov.onset_columns3M96
#print axioms MathGKM.Markov.onset_columns4M96
#print axioms MathGKM.Markov.onset_columns5M96
#print axioms MathGKM.Markov.onset_columns6M96
#print axioms MathGKM.Markov.onsetD1M96
#print axioms MathGKM.Markov.onsetD2M96
#print axioms MathGKM.Markov.onsetD3M96
#print axioms MathGKM.Markov.onsetD4M96
#print axioms MathGKM.Markov.onset_expand1M96
#print axioms MathGKM.Markov.onset_expand2M96
#print axioms MathGKM.Markov.onset_expand3M96
#print axioms MathGKM.Markov.onset_expand4M96
#print axioms MathGKM.Markov.onset_expand5M96
#print axioms MathGKM.Markov.onset_expand6M96
#print axioms MathGKM.Markov.onsetG1_0_0M96_nonneg
#print axioms MathGKM.Markov.onsetG1_0_1M96_nonneg
#print axioms MathGKM.Markov.onsetG1_0_2M96_nonneg
#print axioms MathGKM.Markov.onsetG1_0_3M96_nonneg
#print axioms MathGKM.Markov.onsetG1_0_4M96_nonneg
#print axioms MathGKM.Markov.onsetG1_0_5M96_nonneg
#print axioms MathGKM.Markov.onsetG1_0_6M96_nonneg
#print axioms MathGKM.Markov.onsetG1_0_7M96_nonneg
#print axioms MathGKM.Markov.onsetG1_0_8M96_nonneg
#print axioms MathGKM.Markov.onsetG1_1_0M96_nonneg
#print axioms MathGKM.Markov.onsetG1_1_1M96_nonneg
#print axioms MathGKM.Markov.onsetG1_1_2M96_nonneg
#print axioms MathGKM.Markov.onsetG1_1_3M96_nonneg
#print axioms MathGKM.Markov.onsetG1_1_4M96_nonneg
#print axioms MathGKM.Markov.onsetG1_1_5M96_nonneg
#print axioms MathGKM.Markov.onsetG1_1_6M96_nonneg
#print axioms MathGKM.Markov.onsetG1_1_7M96_nonneg
#print axioms MathGKM.Markov.onsetG1_2_0M96_nonneg
#print axioms MathGKM.Markov.onsetG1_2_1M96_nonneg
#print axioms MathGKM.Markov.onsetG1_2_2M96_nonneg
#print axioms MathGKM.Markov.onsetG1_2_3M96_nonneg
#print axioms MathGKM.Markov.onsetG1_2_4M96_nonneg
#print axioms MathGKM.Markov.onsetG1_2_5M96_nonneg
#print axioms MathGKM.Markov.onsetG1_2_6M96_nonneg
#print axioms MathGKM.Markov.onsetG1_3_0M96_nonneg
#print axioms MathGKM.Markov.onsetG1_3_1M96_nonneg
#print axioms MathGKM.Markov.onsetG1_3_2M96_nonneg
#print axioms MathGKM.Markov.onsetG1_3_3M96_nonneg
#print axioms MathGKM.Markov.onsetG1_3_4M96_nonneg
#print axioms MathGKM.Markov.onsetG1_3_5M96_nonneg
#print axioms MathGKM.Markov.onsetG1_4_0M96_nonneg
#print axioms MathGKM.Markov.onsetG1_4_1M96_nonneg
#print axioms MathGKM.Markov.onsetG1_4_2M96_nonneg
#print axioms MathGKM.Markov.onsetG1_4_3M96_nonneg
#print axioms MathGKM.Markov.onsetG1_4_4M96_nonneg
#print axioms MathGKM.Markov.onsetG1_5_0M96_nonneg
#print axioms MathGKM.Markov.onsetG1_5_1M96_nonneg
#print axioms MathGKM.Markov.onsetG1_5_2M96_nonneg
#print axioms MathGKM.Markov.onsetG1_5_3M96_nonneg
#print axioms MathGKM.Markov.onsetG1_6_0M96_nonneg
#print axioms MathGKM.Markov.onsetG1_6_1M96_nonneg
#print axioms MathGKM.Markov.onsetG1_6_2M96_nonneg
#print axioms MathGKM.Markov.onsetG1_7_0M96_nonneg
#print axioms MathGKM.Markov.onsetG1_7_1M96_nonneg
#print axioms MathGKM.Markov.onsetG1_8_0M96_nonneg
#print axioms MathGKM.Markov.onsetG2_0_0M96_nonneg
#print axioms MathGKM.Markov.onsetG2_0_1M96_nonneg
#print axioms MathGKM.Markov.onsetG2_0_2M96_nonneg
#print axioms MathGKM.Markov.onsetG2_0_3M96_nonneg
#print axioms MathGKM.Markov.onsetG2_0_4M96_nonneg
#print axioms MathGKM.Markov.onsetG2_0_5M96_nonneg
#print axioms MathGKM.Markov.onsetG2_0_6M96_nonneg
#print axioms MathGKM.Markov.onsetG2_0_7M96_nonneg
#print axioms MathGKM.Markov.onsetG2_0_8M96_nonneg
#print axioms MathGKM.Markov.onsetG2_1_0M96_nonneg
#print axioms MathGKM.Markov.onsetG2_1_1M96_nonneg
#print axioms MathGKM.Markov.onsetG2_1_2M96_nonneg
#print axioms MathGKM.Markov.onsetG2_1_3M96_nonneg
#print axioms MathGKM.Markov.onsetG2_1_4M96_nonneg
#print axioms MathGKM.Markov.onsetG2_1_5M96_nonneg
#print axioms MathGKM.Markov.onsetG2_1_6M96_nonneg
#print axioms MathGKM.Markov.onsetG2_1_7M96_nonneg
#print axioms MathGKM.Markov.onsetG2_2_0M96_nonneg
#print axioms MathGKM.Markov.onsetG2_2_1M96_nonneg
#print axioms MathGKM.Markov.onsetG2_2_2M96_nonneg
#print axioms MathGKM.Markov.onsetG2_2_3M96_nonneg
#print axioms MathGKM.Markov.onsetG2_2_4M96_nonneg
#print axioms MathGKM.Markov.onsetG2_2_5M96_nonneg
#print axioms MathGKM.Markov.onsetG2_2_6M96_nonneg
#print axioms MathGKM.Markov.onsetG2_3_0M96_nonneg
#print axioms MathGKM.Markov.onsetG2_3_1M96_nonneg
#print axioms MathGKM.Markov.onsetG2_3_2M96_nonneg
#print axioms MathGKM.Markov.onsetG2_3_3M96_nonneg
#print axioms MathGKM.Markov.onsetG2_3_4M96_nonneg
#print axioms MathGKM.Markov.onsetG2_3_5M96_nonneg
#print axioms MathGKM.Markov.onsetG2_4_0M96_nonneg
#print axioms MathGKM.Markov.onsetG2_4_1M96_nonneg
#print axioms MathGKM.Markov.onsetG2_4_2M96_nonneg
#print axioms MathGKM.Markov.onsetG2_4_3M96_nonneg
#print axioms MathGKM.Markov.onsetG2_4_4M96_nonneg
#print axioms MathGKM.Markov.onsetG2_5_0M96_nonneg
#print axioms MathGKM.Markov.onsetG2_5_1M96_nonneg
#print axioms MathGKM.Markov.onsetG2_5_2M96_nonneg
#print axioms MathGKM.Markov.onsetG2_5_3M96_nonneg
#print axioms MathGKM.Markov.onsetG2_6_0M96_nonneg
#print axioms MathGKM.Markov.onsetG2_6_1M96_nonneg
#print axioms MathGKM.Markov.onsetG2_6_2M96_nonneg
#print axioms MathGKM.Markov.onsetG2_7_0M96_nonneg
#print axioms MathGKM.Markov.onsetG2_7_1M96_nonneg
#print axioms MathGKM.Markov.onsetG2_8_0M96_nonneg
#print axioms MathGKM.Markov.onsetG3_0_0M96_nonneg
#print axioms MathGKM.Markov.onsetG3_0_1M96_nonneg
#print axioms MathGKM.Markov.onsetG3_0_2M96_nonneg
#print axioms MathGKM.Markov.onsetG3_0_3M96_nonneg
#print axioms MathGKM.Markov.onsetG3_0_4M96_nonneg
#print axioms MathGKM.Markov.onsetG3_0_5M96_nonneg
#print axioms MathGKM.Markov.onsetG3_0_6M96_nonneg
#print axioms MathGKM.Markov.onsetG3_0_7M96_nonneg
#print axioms MathGKM.Markov.onsetG3_0_8M96_nonneg
#print axioms MathGKM.Markov.onsetG3_1_0M96_nonneg
#print axioms MathGKM.Markov.onsetG3_1_1M96_nonneg
#print axioms MathGKM.Markov.onsetG3_1_2M96_nonneg
#print axioms MathGKM.Markov.onsetG3_1_3M96_nonneg
#print axioms MathGKM.Markov.onsetG3_1_4M96_nonneg
#print axioms MathGKM.Markov.onsetG3_1_5M96_nonneg
#print axioms MathGKM.Markov.onsetG3_1_6M96_nonneg
#print axioms MathGKM.Markov.onsetG3_1_7M96_nonneg
#print axioms MathGKM.Markov.onsetG3_2_0M96_nonneg
#print axioms MathGKM.Markov.onsetG3_2_1M96_nonneg
#print axioms MathGKM.Markov.onsetG3_2_2M96_nonneg
#print axioms MathGKM.Markov.onsetG3_2_3M96_nonneg
#print axioms MathGKM.Markov.onsetG3_2_4M96_nonneg
#print axioms MathGKM.Markov.onsetG3_2_5M96_nonneg
#print axioms MathGKM.Markov.onsetG3_2_6M96_nonneg
#print axioms MathGKM.Markov.onsetG3_3_0M96_nonneg
#print axioms MathGKM.Markov.onsetG3_3_1M96_nonneg
#print axioms MathGKM.Markov.onsetG3_3_2M96_nonneg
#print axioms MathGKM.Markov.onsetG3_3_3M96_nonneg
#print axioms MathGKM.Markov.onsetG3_3_4M96_nonneg
#print axioms MathGKM.Markov.onsetG3_3_5M96_nonneg
#print axioms MathGKM.Markov.onsetG3_4_0M96_nonneg
#print axioms MathGKM.Markov.onsetG3_4_1M96_nonneg
#print axioms MathGKM.Markov.onsetG3_4_2M96_nonneg
#print axioms MathGKM.Markov.onsetG3_4_3M96_nonneg
#print axioms MathGKM.Markov.onsetG3_4_4M96_nonneg
#print axioms MathGKM.Markov.onsetG3_5_0M96_nonneg
#print axioms MathGKM.Markov.onsetG3_5_1M96_nonneg
#print axioms MathGKM.Markov.onsetG3_5_2M96_nonneg
#print axioms MathGKM.Markov.onsetG3_5_3M96_nonneg
#print axioms MathGKM.Markov.onsetG3_6_0M96_nonneg
#print axioms MathGKM.Markov.onsetG3_6_1M96_nonneg
#print axioms MathGKM.Markov.onsetG3_6_2M96_nonneg
#print axioms MathGKM.Markov.onsetG3_7_0M96_nonneg
#print axioms MathGKM.Markov.onsetG3_7_1M96_nonneg
#print axioms MathGKM.Markov.onsetG3_8_0M96_nonneg
#print axioms MathGKM.Markov.onsetG4_0_0M96_nonneg
#print axioms MathGKM.Markov.onsetG4_0_1M96_nonneg
#print axioms MathGKM.Markov.onsetG4_0_2M96_nonneg
#print axioms MathGKM.Markov.onsetG4_0_3M96_nonneg
#print axioms MathGKM.Markov.onsetG4_0_4M96_nonneg
#print axioms MathGKM.Markov.onsetG4_0_5M96_nonneg
#print axioms MathGKM.Markov.onsetG4_0_6M96_nonneg
#print axioms MathGKM.Markov.onsetG4_0_7M96_nonneg
#print axioms MathGKM.Markov.onsetG4_0_8M96_nonneg
#print axioms MathGKM.Markov.onsetG4_1_0M96_nonneg
#print axioms MathGKM.Markov.onsetG4_1_1M96_nonneg
#print axioms MathGKM.Markov.onsetG4_1_2M96_nonneg
#print axioms MathGKM.Markov.onsetG4_1_3M96_nonneg
#print axioms MathGKM.Markov.onsetG4_1_4M96_nonneg
#print axioms MathGKM.Markov.onsetG4_1_5M96_nonneg
#print axioms MathGKM.Markov.onsetG4_1_6M96_nonneg
#print axioms MathGKM.Markov.onsetG4_1_7M96_nonneg
#print axioms MathGKM.Markov.onsetG4_2_0M96_nonneg
#print axioms MathGKM.Markov.onsetG4_2_1M96_nonneg
#print axioms MathGKM.Markov.onsetG4_2_2M96_nonneg
#print axioms MathGKM.Markov.onsetG4_2_3M96_nonneg
#print axioms MathGKM.Markov.onsetG4_2_4M96_nonneg
#print axioms MathGKM.Markov.onsetG4_2_5M96_nonneg
#print axioms MathGKM.Markov.onsetG4_2_6M96_nonneg
#print axioms MathGKM.Markov.onsetG4_3_0M96_nonneg
#print axioms MathGKM.Markov.onsetG4_3_1M96_nonneg
#print axioms MathGKM.Markov.onsetG4_3_2M96_nonneg
#print axioms MathGKM.Markov.onsetG4_3_3M96_nonneg
#print axioms MathGKM.Markov.onsetG4_3_4M96_nonneg
#print axioms MathGKM.Markov.onsetG4_3_5M96_nonneg
#print axioms MathGKM.Markov.onsetG4_4_0M96_nonneg
#print axioms MathGKM.Markov.onsetG4_4_1M96_nonneg
#print axioms MathGKM.Markov.onsetG4_4_2M96_nonneg
#print axioms MathGKM.Markov.onsetG4_4_3M96_nonneg
#print axioms MathGKM.Markov.onsetG4_4_4M96_nonneg
#print axioms MathGKM.Markov.onsetG4_5_0M96_nonneg
#print axioms MathGKM.Markov.onsetG4_5_1M96_nonneg
#print axioms MathGKM.Markov.onsetG4_5_2M96_nonneg
#print axioms MathGKM.Markov.onsetG4_5_3M96_nonneg
#print axioms MathGKM.Markov.onsetG4_6_0M96_nonneg
#print axioms MathGKM.Markov.onsetG4_6_1M96_nonneg
#print axioms MathGKM.Markov.onsetG4_6_2M96_nonneg
#print axioms MathGKM.Markov.onsetG4_7_0M96_nonneg
#print axioms MathGKM.Markov.onsetG4_7_1M96_nonneg
#print axioms MathGKM.Markov.onsetG4_8_0M96_nonneg
#print axioms MathGKM.Markov.onsetL1M96
#print axioms MathGKM.Markov.onsetL2M96
#print axioms MathGKM.Markov.onsetL3M96
#print axioms MathGKM.Markov.onsetL4M96
#print axioms MathGKM.Markov.onset_lc1M96
#print axioms MathGKM.Markov.onset_lc2M96
#print axioms MathGKM.Markov.onset_lc3M96
#print axioms MathGKM.Markov.onset_lc4M96
#print axioms MathGKM.Markov.onset_early_lcM96
#print axioms MathGKM.Markov.source_fourth_onsetM96
#print axioms MathGKM.Markov.onset_value1M96
#print axioms MathGKM.Markov.onset_value2M96
#print axioms MathGKM.Markov.onset_value3M96
#print axioms MathGKM.Markov.onset_value4M96
#print axioms MathGKM.Markov.onset_value5M96
#print axioms MathGKM.Markov.onset_value6M96
#print axioms MathGKM.Markov.source_fourth_prefixM96
#print axioms MathGKM.Markov.root_iff_coreOnsetM96
