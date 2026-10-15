import MarkovBlockChartM806
import MarkovBlockColumn0M806
import MarkovBlockColumn1M806
import MarkovBlockColumn2M806
import MarkovBlockColumn3M806
import MarkovBlockColumn4M806
import MarkovBlockColumn5M806
import MarkovBlockColumn6M806
import MarkovBlockColumn7M806
import MarkovBlockColumn8M806
import MarkovBlockColumnsM806
import MarkovBlockLCM806
import MarkovBlockScalar00M806
import MarkovBlockScalar01M806
import MarkovBlockScalar02M806
import MarkovBlockScalar03M806
import MarkovBlockScalar04M806
import MarkovBlockScalar10M806
import MarkovBlockScalar11M806
import MarkovBlockScalar12M806
import MarkovBlockScalar13M806
import MarkovBlockScalar14M806
import MarkovBlockScalar20M806
import MarkovBlockScalar21M806
import MarkovBlockScalar22M806
import MarkovBlockScalar23M806
import MarkovBlockScalar24M806
import MarkovBlockSourceM806
import MarkovBlockStageDefsM806
import MarkovBlockStageM806
import MarkovBlockValue0M806
import MarkovBlockValue1M806
import MarkovBlockValue2M806
import MarkovPrefixM806
import MarkovResidualM806
import MarkovSplitLG00M042
import MarkovSplitLG01M042
import MarkovSplitLG02M042
import MarkovSplitLG03M042
import MarkovSplitLG04M042
import MarkovSplitLG05M042
import MarkovSplitLG06M042
import MarkovSplitLG07M042
import MarkovSplitLG08M042
import MarkovSplitLG10M042
import MarkovSplitLG11M042
import MarkovSplitLG12M042
import MarkovSplitLG13M042
import MarkovSplitLG14M042
import MarkovSplitLG15M042
import MarkovSplitLG16M042
import MarkovSplitLG17M042
import MarkovSplitLG20M042
import MarkovSplitLG21M042
import MarkovSplitLG22M042
import MarkovSplitLG23M042
import MarkovSplitLG24M042
import MarkovSplitLG25M042
import MarkovSplitLG26M042
import MarkovSplitLG30M042
import MarkovSplitLG31M042
import MarkovSplitLG32M042
import MarkovSplitLG33M042
import MarkovSplitLG34M042
import MarkovSplitLG35M042
/-! Machine-authored 8067e0c5. Local axiom inventory. -/
#print axioms MathGKM.Markov.blockLChartM806
#print axioms MathGKM.Markov.blockColumnGap0M806_nonneg
#print axioms MathGKM.Markov.blockColumnGap1M806_nonneg
#print axioms MathGKM.Markov.blockColumnGap2M806_nonneg
#print axioms MathGKM.Markov.blockColumnGap3M806_nonneg
#print axioms MathGKM.Markov.blockColumnGap4M806_nonneg
#print axioms MathGKM.Markov.blockColumnGap5M806_nonneg
#print axioms MathGKM.Markov.blockColumnGap6M806_nonneg
#print axioms MathGKM.Markov.blockColumnGap7M806_nonneg
#print axioms MathGKM.Markov.blockColumnGap8M806_nonneg
#print axioms MathGKM.Markov.block_columns0M806
#print axioms MathGKM.Markov.block_columns1M806
#print axioms MathGKM.Markov.block_columns2M806
#print axioms MathGKM.Markov.blockValue_logConcaveM806
#print axioms MathGKM.Markov.block_scalar000M806
#print axioms MathGKM.Markov.block_scalar001M806
#print axioms MathGKM.Markov.block_scalar002M806
#print axioms MathGKM.Markov.block_scalar003M806
#print axioms MathGKM.Markov.block_scalar004M806
#print axioms MathGKM.Markov.block_scalar010M806
#print axioms MathGKM.Markov.block_scalar011M806
#print axioms MathGKM.Markov.block_scalar012M806
#print axioms MathGKM.Markov.block_scalar013M806
#print axioms MathGKM.Markov.block_scalar020M806
#print axioms MathGKM.Markov.block_scalar021M806
#print axioms MathGKM.Markov.block_scalar022M806
#print axioms MathGKM.Markov.block_scalar030M806
#print axioms MathGKM.Markov.block_scalar031M806
#print axioms MathGKM.Markov.block_scalar040M806
#print axioms MathGKM.Markov.block_scalar100M806
#print axioms MathGKM.Markov.block_scalar101M806
#print axioms MathGKM.Markov.block_scalar102M806
#print axioms MathGKM.Markov.block_scalar103M806
#print axioms MathGKM.Markov.block_scalar104M806
#print axioms MathGKM.Markov.block_scalar110M806
#print axioms MathGKM.Markov.block_scalar111M806
#print axioms MathGKM.Markov.block_scalar112M806
#print axioms MathGKM.Markov.block_scalar113M806
#print axioms MathGKM.Markov.block_scalar120M806
#print axioms MathGKM.Markov.block_scalar121M806
#print axioms MathGKM.Markov.block_scalar122M806
#print axioms MathGKM.Markov.block_scalar130M806
#print axioms MathGKM.Markov.block_scalar131M806
#print axioms MathGKM.Markov.block_scalar140M806
#print axioms MathGKM.Markov.block_scalar200M806
#print axioms MathGKM.Markov.block_scalar201M806
#print axioms MathGKM.Markov.block_scalar202M806
#print axioms MathGKM.Markov.block_scalar203M806
#print axioms MathGKM.Markov.block_scalar204M806
#print axioms MathGKM.Markov.block_scalar210M806
#print axioms MathGKM.Markov.block_scalar211M806
#print axioms MathGKM.Markov.block_scalar212M806
#print axioms MathGKM.Markov.block_scalar213M806
#print axioms MathGKM.Markov.block_scalar220M806
#print axioms MathGKM.Markov.block_scalar221M806
#print axioms MathGKM.Markov.block_scalar222M806
#print axioms MathGKM.Markov.block_scalar230M806
#print axioms MathGKM.Markov.block_scalar231M806
#print axioms MathGKM.Markov.block_scalar240M806
#print axioms MathGKM.Markov.source_fourth_blockM806
#print axioms MathGKM.Markov.block_stageM806
#print axioms MathGKM.Markov.block_value0M806
#print axioms MathGKM.Markov.block_value1M806
#print axioms MathGKM.Markov.block_value2M806
#print axioms MathGKM.Markov.source_fourth_prefixM806
#print axioms MathGKM.Markov.root_iff_coreM806
#print axioms MathGKM.Markov.blockLG00M042_nonneg
#print axioms MathGKM.Markov.blockLG01M042_nonneg
#print axioms MathGKM.Markov.blockLG02M042_nonneg
#print axioms MathGKM.Markov.blockLG03M042_nonneg
#print axioms MathGKM.Markov.blockLG04M042_nonneg
#print axioms MathGKM.Markov.blockLG05M042_nonneg
#print axioms MathGKM.Markov.blockLG06M042_nonneg
#print axioms MathGKM.Markov.blockLG07M042_nonneg
#print axioms MathGKM.Markov.blockLG08M042_nonneg
#print axioms MathGKM.Markov.blockLG10M042_nonneg
#print axioms MathGKM.Markov.blockLG11M042_nonneg
#print axioms MathGKM.Markov.blockLG12M042_nonneg
#print axioms MathGKM.Markov.blockLG13M042_nonneg
#print axioms MathGKM.Markov.blockLG14M042_nonneg
#print axioms MathGKM.Markov.blockLG15M042_nonneg
#print axioms MathGKM.Markov.blockLG16M042_nonneg
#print axioms MathGKM.Markov.blockLG17M042_nonneg
#print axioms MathGKM.Markov.blockLG20M042_nonneg
#print axioms MathGKM.Markov.blockLG21M042_nonneg
#print axioms MathGKM.Markov.blockLG22M042_nonneg
#print axioms MathGKM.Markov.blockLG23M042_nonneg
#print axioms MathGKM.Markov.blockLG24M042_nonneg
#print axioms MathGKM.Markov.blockLG25M042_nonneg
#print axioms MathGKM.Markov.blockLG26M042_nonneg
#print axioms MathGKM.Markov.blockLG30M042_nonneg
#print axioms MathGKM.Markov.blockLG31M042_nonneg
#print axioms MathGKM.Markov.blockLG32M042_nonneg
#print axioms MathGKM.Markov.blockLG33M042_nonneg
#print axioms MathGKM.Markov.blockLG34M042_nonneg
#print axioms MathGKM.Markov.blockLG35M042_nonneg
