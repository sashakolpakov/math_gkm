/- UNVALIDATED CANDIDATE: the recorded build reached its time limit.
No theorem from this module is claimed or used by the accepted source proof. -/
import MarkovEightLowerPolyM295
import MarkovBinomialTableM295
import MarkovNewtonM295
/-! Machine-authored 29509309. Grouping changes only evaluation cost. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 64000000
set_option maxRecDepth 8192
def lowerGapEightFastM295 (x y : ℚ) : ℚ :=
 (245025 * choosePolyM0D3 x 3 + 50171121 * choosePolyM0D3 x 4 + 3317976981 * choosePolyM0D3 x 5 + 108608854959 * choosePolyM0D3 x 6 + 2127494495016 * choosePolyM0D3 x 7 + 27755866573974 * choosePolyM0D3 x 8 + 258090564416454 * choosePolyM0D3 x 9 + 1791141440477202 * choosePolyM0D3 x 10 + 9586054128637503 * choosePolyM0D3 x 11 + 40520464354437507 * choosePolyM0D3 x 12 + 137690276463241623 * choosePolyM0D3 x 13 + 381055607885173221 * choosePolyM0D3 x 14 + 867001294167730722 * choosePolyM0D3 x 15 + 1632256099696638108 * choosePolyM0D3 x 16 + 2552380862153822172 * choosePolyM0D3 x 17 + 3319524281640335868 * choosePolyM0D3 x 18 + 3586667103025796790 * choosePolyM0D3 x 19 + 3207299532596861526 * choosePolyM0D3 x 20 + 2357262716597968014 * choosePolyM0D3 x 21 + 1408520228887262106 * choosePolyM0D3 x 22 + 673169239575345744 * choosePolyM0D3 x 23 + 251150949409649652 * choosePolyM0D3 x 24 + 70465384355483700 * choosePolyM0D3 x 25 + 13982465974821300 * choosePolyM0D3 x 26 + 1749226575096000 * choosePolyM0D3 x 27 + 103742008999200 * choosePolyM0D3 x 28) +
 (2025 * choosePolyM0D3 x 1 + 858915 * choosePolyM0D3 x 2 + 96496263 * choosePolyM0D3 x 3 + 4817570865 * choosePolyM0D3 x 4 + 134349662898 * choosePolyM0D3 x 5 + 2379030644730 * choosePolyM0D3 x 6 + 29003156929818 * choosePolyM0D3 x 7 + 257147811908766 * choosePolyM0D3 x 8 + 1723934816930259 * choosePolyM0D3 x 9 + 8991598995662265 * choosePolyM0D3 x 10 + 37269835241486445 * choosePolyM0D3 x 11 + 124739673023658411 * choosePolyM0D3 x 12 + 341141771678252688 * choosePolyM0D3 x 13 + 768929852364461388 * choosePolyM0D3 x 14 + 1436811979688749980 * choosePolyM0D3 x 15 + 2233279289414168676 * choosePolyM0D3 x 16 + 2890444844686012542 * choosePolyM0D3 x 17 + 3110813365110266466 * choosePolyM0D3 x 18 + 2772941213909959578 * choosePolyM0D3 x 19 + 2032781229759607398 * choosePolyM0D3 x 20 + 1212111827591197356 * choosePolyM0D3 x 21 + 578333465677917804 * choosePolyM0D3 x 22 + 215481760616770956 * choosePolyM0D3 x 23 + 60394282114186284 * choosePolyM0D3 x 24 + 11974319231810760 * choosePolyM0D3 x 25 + 1497085581705120 * choosePolyM0D3 x 26 + 88748638355520 * choosePolyM0D3 x 27) * choosePolyM0D3 y 1 +
 (2965 + 908589 * choosePolyM0D3 x 1 + 89815311 * choosePolyM0D3 x 2 + 4204376124 * choosePolyM0D3 x 3 + 113071805598 * choosePolyM0D3 x 4 + 1959269196762 * choosePolyM0D3 x 5 + 23568556643502 * choosePolyM0D3 x 6 + 207237849510303 * choosePolyM0D3 x 7 + 1382333668819727 * choosePolyM0D3 x 8 + 7188922826869143 * choosePolyM0D3 x 9 + 29754188389274157 * choosePolyM0D3 x 10 + 99538842970199406 * choosePolyM0D3 x 11 + 272284572972762684 * choosePolyM0D3 x 12 + 614169261014572296 * choosePolyM0D3 x 13 + 1148853943146565848 * choosePolyM0D3 x 14 + 1788039554685737598 * choosePolyM0D3 x 15 + 2317616094560786622 * choosePolyM0D3 x 16 + 2498294267568584158 * choosePolyM0D3 x 17 + 2230673456150992682 * choosePolyM0D3 x 18 + 1638067595051870664 * choosePolyM0D3 x 19 + 978453919295683428 * choosePolyM0D3 x 20 + 467666367942792204 * choosePolyM0D3 x 21 + 174552798502848516 * choosePolyM0D3 x 22 + 49007783426045664 * choosePolyM0D3 x 23 + 9733399927088112 * choosePolyM0D3 x 24 + 1218973636362240 * choosePolyM0D3 x 25 + 72382113936000 * choosePolyM0D3 x 26) * choosePolyM0D3 y 2 +
 (358969 + 42722994 * choosePolyM0D3 x 1 + 2228858502 * choosePolyM0D3 x 2 + 64392703734 * choosePolyM0D3 x 3 + 1174360049214 * choosePolyM0D3 x 4 + 14683034583876 * choosePolyM0D3 x 5 + 133087727339508 * choosePolyM0D3 x 6 + 909858514769307 * choosePolyM0D3 x 7 + 4829585594319575 * choosePolyM0D3 x 8 + 20338786364395530 * choosePolyM0D3 x 9 + 69064821221221350 * choosePolyM0D3 x 10 + 191404294345287696 * choosePolyM0D3 x 11 + 436735972191424896 * choosePolyM0D3 x 12 + 825384401833379940 * choosePolyM0D3 x 13 + 1296520501740216996 * choosePolyM0D3 x 14 + 1694636048799716166 * choosePolyM0D3 x 15 + 1840728155320065366 * choosePolyM0D3 x 16 + 1655072549214992092 * choosePolyM0D3 x 17 + 1223231267082515588 * choosePolyM0D3 x 18 + 735028063521424116 * choosePolyM0D3 x 19 + 353266719361196388 * choosePolyM0D3 x 20 + 132535984221771384 * choosePolyM0D3 x 21 + 37391050272040176 * choosePolyM0D3 x 22 + 7459903228608864 * choosePolyM0D3 x 23 + 938236691073792 * choosePolyM0D3 x 24 + 55936276323840 * choosePolyM0D3 x 25) * choosePolyM0D3 y 3 +
 (9323786 + 672468978 * choosePolyM0D3 x 1 + 23675386866 * choosePolyM0D3 x 2 + 493600653168 * choosePolyM0D3 x 3 + 6798183617136 * choosePolyM0D3 x 4 + 66300716784384 * choosePolyM0D3 x 5 + 480055193700360 * choosePolyM0D3 x 6 + 2668842253640430 * choosePolyM0D3 x 7 + 11675978399673478 * choosePolyM0D3 x 8 + 40936759005465870 * choosePolyM0D3 x 9 + 116583706699695486 * choosePolyM0D3 x 10 + 272340564346385268 * choosePolyM0D3 x 11 + 525357995003453700 * choosePolyM0D3 x 12 + 840280055932574964 * choosePolyM0D3 x 13 + 1116070046470204764 * choosePolyM0D3 x 14 + 1229826444354601380 * choosePolyM0D3 x 15 + 1120193533337591772 * choosePolyM0D3 x 16 + 837684268640178380 * choosePolyM0D3 x 17 + 508767424948530220 * choosePolyM0D3 x 18 + 246927846490565568 * choosePolyM0D3 x 19 + 93478464485268192 * choosePolyM0D3 x 20 + 26592310386145536 * choosePolyM0D3 x 21 + 5346475782874944 * choosePolyM0D3 x 22 + 677263934409216 * choosePolyM0D3 x 23 + 40648144593408 * choosePolyM0D3 x 24) * choosePolyM0D3 y 4 +
 (97676046 + 5088124644 * choosePolyM0D3 x 1 + 135826572816 * choosePolyM0D3 x 2 + 2220508017024 * choosePolyM0D3 x 3 + 24569768257344 * choosePolyM0D3 x 4 + 196012742962272 * choosePolyM0D3 x 5 + 1176796651050648 * choosePolyM0D3 x 6 + 5480294719948182 * choosePolyM0D3 x 7 + 20235759610075578 * choosePolyM0D3 x 8 + 60201263496534516 * choosePolyM0D3 x 9 + 145977769828815192 * choosePolyM0D3 x 10 + 290835134648803548 * choosePolyM0D3 x 11 + 478480089763408212 * choosePolyM0D3 x 12 + 651523519833379488 * choosePolyM0D3 x 13 + 733970623342016880 * choosePolyM0D3 x 14 + 681891462198995436 * choosePolyM0D3 x 15 + 519081128535218004 * choosePolyM0D3 x 16 + 320388167717785656 * choosePolyM0D3 x 17 + 157797588631168224 * choosePolyM0D3 x 18 + 60543721037180352 * choosePolyM0D3 x 19 + 17436693862667520 * choosePolyM0D3 x 20 + 3545744158594560 * choosePolyM0D3 x 21 + 453899281397760 * choosePolyM0D3 x 22 + 27509047357440 * choosePolyM0D3 x 23) * choosePolyM0D3 y 5 +
 (528756712 + 21793233504 * choosePolyM0D3 x 1 + 471657471192 * choosePolyM0D3 x 2 + 6363420843696 * choosePolyM0D3 x 3 + 58882343037072 * choosePolyM0D3 x 4 + 396757394250624 * choosePolyM0D3 x 5 + 2026756045664892 * choosePolyM0D3 x 6 + 8073612804541908 * choosePolyM0D3 x 7 + 25590983186819336 * choosePolyM0D3 x 8 + 65483095180571664 * choosePolyM0D3 x 9 + 136636834475083488 * choosePolyM0D3 x 10 + 234009129476224248 * choosePolyM0D3 x 11 + 330070117826017104 * choosePolyM0D3 x 12 + 383615383583152560 * choosePolyM0D3 x 13 + 366437446724194668 * choosePolyM0D3 x 14 + 285985478425523808 * choosePolyM0D3 x 15 + 180530754322092240 * choosePolyM0D3 x 16 + 90747120868421248 * choosePolyM0D3 x 17 + 35471045128598720 * choosePolyM0D3 x 18 + 10391006666489088 * choosePolyM0D3 x 19 + 2146300243256832 * choosePolyM0D3 x 20 + 278743307758080 * choosePolyM0D3 x 21 + 17120444559360 * choosePolyM0D3 x 22) * choosePolyM0D3 y 6 +
 (1665658176 + 57375187968 * choosePolyM0D3 x 1 + 1050915708192 * choosePolyM0D3 x 2 + 12111541051008 * choosePolyM0D3 x 3 + 96387964128960 * choosePolyM0D3 x 4 + 561325661952384 * choosePolyM0D3 x 5 + 2486400500382288 * choosePolyM0D3 x 6 + 8604680236856592 * choosePolyM0D3 x 7 + 23708409298240128 * choosePolyM0D3 x 8 + 52697363314497216 * choosePolyM0D3 x 9 + 95321296251955200 * choosePolyM0D3 x 10 + 141026860961570976 * choosePolyM0D3 x 11 + 170951538189057024 * choosePolyM0D3 x 12 + 169518836726707776 * choosePolyM0D3 x 13 + 136801213441776912 * choosePolyM0D3 x 14 + 88996310073627936 * choosePolyM0D3 x 15 + 45971141033642496 * choosePolyM0D3 x 16 + 18419842515508224 * choosePolyM0D3 x 17 + 5519476271667456 * choosePolyM0D3 x 18 + 1163978740592640 * choosePolyM0D3 x 19 + 154084022367744 * choosePolyM0D3 x 20 + 9632389616640 * choosePolyM0D3 x 21) * choosePolyM0D3 y 7 +
 (3230932992 + 96419151360 * choosePolyM0D3 x 1 + 1539634612992 * choosePolyM0D3 x 2 + 15536096497152 * choosePolyM0D3 x 3 + 108562647191040 * choosePolyM0D3 x 4 + 555975241758720 * choosePolyM0D3 x 5 + 2166535687220352 * choosePolyM0D3 x 6 + 6591457779113088 * choosePolyM0D3 x 7 + 15937464941680128 * choosePolyM0D3 x 8 + 30994145924345856 * choosePolyM0D3 x 9 + 48840214238065152 * choosePolyM0D3 x 10 + 62577763206255360 * choosePolyM0D3 x 11 + 65177793987554304 * choosePolyM0D3 x 12 + 54956443824124416 * choosePolyM0D3 x 13 + 37188993054713472 * choosePolyM0D3 x 14 + 19906372452814848 * choosePolyM0D3 x 15 + 8238310245946368 * choosePolyM0D3 x 16 + 2542525670673408 * choosePolyM0D3 x 17 + 550876340259840 * choosePolyM0D3 x 18 + 74759337418752 * choosePolyM0D3 x 19 + 4781983309824 * choosePolyM0D3 x 20) * choosePolyM0D3 y 8 +
 (3918964224 + 103904252928 * choosePolyM0D3 x 1 + 1477886699520 * choosePolyM0D3 x 2 + 13300929847296 * choosePolyM0D3 x 3 + 82912631058432 * choosePolyM0D3 x 4 + 378483596918784 * choosePolyM0D3 x 5 + 1312328012921856 * choosePolyM0D3 x 6 + 3542793739559424 * choosePolyM0D3 x 7 + 7571867638755840 * choosePolyM0D3 x 8 + 12950035330176000 * choosePolyM0D3 x 9 + 17828236324620288 * choosePolyM0D3 x 10 + 19787715242136576 * choosePolyM0D3 x 11 + 17657885478159360 * choosePolyM0D3 x 12 + 12573224698245120 * choosePolyM0D3 x 13 + 7046919563314176 * choosePolyM0D3 x 14 + 3040779185353728 * choosePolyM0D3 x 15 + 974905632949248 * choosePolyM0D3 x 16 + 218733862803456 * choosePolyM0D3 x 17 + 30653180952576 * choosePolyM0D3 x 18 + 2019725180928 * choosePolyM0D3 x 19) * choosePolyM0D3 y 9 +
 (2899556352 + 69570428928 * choosePolyM0D3 x 1 + 895839393792 * choosePolyM0D3 x 2 + 7294389301248 * choosePolyM0D3 x 3 + 41072882995200 * choosePolyM0D3 x 4 + 168935638695936 * choosePolyM0D3 x 5 + 525965629615104 * choosePolyM0D3 x 6 + 1269258600723456 * choosePolyM0D3 x 7 + 2411124300232704 * choosePolyM0D3 x 8 + 3639013805715456 * choosePolyM0D3 x 9 + 4381169836130304 * choosePolyM0D3 x 10 + 4203849341024256 * choosePolyM0D3 x 11 + 3195077411549184 * choosePolyM0D3 x 12 + 1899576780681216 * choosePolyM0D3 x 13 + 864864771283968 * choosePolyM0D3 x 14 + 291224179384320 * choosePolyM0D3 x 15 + 68349384929280 * choosePolyM0D3 x 16 + 9984188497920 * choosePolyM0D3 x 17 + 683582914560 * choosePolyM0D3 x 18) * choosePolyM0D3 y 10 +
 (1197858816 + 26375602176 * choosePolyM0D3 x 1 + 311369490432 * choosePolyM0D3 x 2 + 2319894872064 * choosePolyM0D3 x 3 + 11918876884992 * choosePolyM0D3 x 4 + 44561278992384 * choosePolyM0D3 x 5 + 125502810402816 * choosePolyM0D3 x 6 + 272323758034944 * choosePolyM0D3 x 7 + 461675650867200 * choosePolyM0D3 x 8 + 616051772227584 * choosePolyM0D3 x 9 + 648044299026432 * choosePolyM0D3 x 10 + 535095324352512 * choosePolyM0D3 x 11 + 342989409337344 * choosePolyM0D3 x 12 + 167268812046336 * choosePolyM0D3 x 13 + 59992206962688 * choosePolyM0D3 x 14 + 14923668824064 * choosePolyM0D3 x 15 + 2300695068672 * choosePolyM0D3 x 16 + 165611077632 * choosePolyM0D3 x 17) * choosePolyM0D3 y 11 +
 (211943424 + 4329701376 * choosePolyM0D3 x 1 + 47331508224 * choosePolyM0D3 x 2 + 325651070976 * choosePolyM0D3 x 3 + 1539239116800 * choosePolyM0D3 x 4 + 5269095186432 * choosePolyM0D3 x 5 + 13506234728448 * choosePolyM0D3 x 6 + 26474356457472 * choosePolyM0D3 x 7 + 40168320073728 * choosePolyM0D3 x 8 + 47407762440192 * choosePolyM0D3 x 9 + 43443527221248 * choosePolyM0D3 x 10 + 30626725527552 * choosePolyM0D3 x 11 + 16302657896448 * choosePolyM0D3 x 12 + 6340847665152 * choosePolyM0D3 x 13 + 1701031428096 * choosePolyM0D3 x 14 + 281430589440 * choosePolyM0D3 x 15 + 21648506880 * choosePolyM0D3 x 16) * choosePolyM0D3 y 12

theorem lower_gap_eight_fastM295 (x y : ℚ) :
 lowerPolynomialM0D3 8 (x+1) (y+1)^2 -
 lowerPolynomialM0D3 8 x (y+2)*lowerPolynomialM0D3 8 (x+2) y =
 lowerGapEightFastM295 x y := by
 simp_rw [lower_eight_polyM295]
 unfold lowerEightPolyM295 lowerGapEightFastM295
 simp only [binomial_poly_0M295, binomial_poly_1M295, binomial_poly_2M295, binomial_poly_3M295, binomial_poly_4M295, binomial_poly_5M295, binomial_poly_6M295, binomial_poly_7M295, binomial_poly_8M295, binomial_poly_9M295, binomial_poly_10M295, binomial_poly_11M295, binomial_poly_12M295, binomial_poly_13M295, binomial_poly_14M295, binomial_poly_15M295, binomial_poly_16M295, binomial_poly_17M295, binomial_poly_18M295, binomial_poly_19M295, binomial_poly_20M295, binomial_poly_21M295, binomial_poly_22M295, binomial_poly_23M295, binomial_poly_24M295, binomial_poly_25M295, binomial_poly_26M295, binomial_poly_27M295, binomial_poly_28M295]
 ring

theorem lower_gap_eight_fast_nonnegM295 (x y : ℕ) :
 0 ≤ lowerPolynomialM0D3 8 ((x:ℚ)+1) ((y:ℚ)+1)^2 -
 lowerPolynomialM0D3 8 x ((y:ℚ)+2)*lowerPolynomialM0D3 8 ((x:ℚ)+2) y := by
 rw [lower_gap_eight_fastM295]
 unfold lowerGapEightFastM295
 have hx1 := choose_poly_nat_nonnegM295 x 1
 have hx2 := choose_poly_nat_nonnegM295 x 2
 have hx3 := choose_poly_nat_nonnegM295 x 3
 have hx4 := choose_poly_nat_nonnegM295 x 4
 have hx5 := choose_poly_nat_nonnegM295 x 5
 have hx6 := choose_poly_nat_nonnegM295 x 6
 have hx7 := choose_poly_nat_nonnegM295 x 7
 have hx8 := choose_poly_nat_nonnegM295 x 8
 have hx9 := choose_poly_nat_nonnegM295 x 9
 have hx10 := choose_poly_nat_nonnegM295 x 10
 have hx11 := choose_poly_nat_nonnegM295 x 11
 have hx12 := choose_poly_nat_nonnegM295 x 12
 have hx13 := choose_poly_nat_nonnegM295 x 13
 have hx14 := choose_poly_nat_nonnegM295 x 14
 have hx15 := choose_poly_nat_nonnegM295 x 15
 have hx16 := choose_poly_nat_nonnegM295 x 16
 have hx17 := choose_poly_nat_nonnegM295 x 17
 have hx18 := choose_poly_nat_nonnegM295 x 18
 have hx19 := choose_poly_nat_nonnegM295 x 19
 have hx20 := choose_poly_nat_nonnegM295 x 20
 have hx21 := choose_poly_nat_nonnegM295 x 21
 have hx22 := choose_poly_nat_nonnegM295 x 22
 have hx23 := choose_poly_nat_nonnegM295 x 23
 have hx24 := choose_poly_nat_nonnegM295 x 24
 have hx25 := choose_poly_nat_nonnegM295 x 25
 have hx26 := choose_poly_nat_nonnegM295 x 26
 have hx27 := choose_poly_nat_nonnegM295 x 27
 have hx28 := choose_poly_nat_nonnegM295 x 28
 have hy1 := choose_poly_nat_nonnegM295 y 1
 have hy2 := choose_poly_nat_nonnegM295 y 2
 have hy3 := choose_poly_nat_nonnegM295 y 3
 have hy4 := choose_poly_nat_nonnegM295 y 4
 have hy5 := choose_poly_nat_nonnegM295 y 5
 have hy6 := choose_poly_nat_nonnegM295 y 6
 have hy7 := choose_poly_nat_nonnegM295 y 7
 have hy8 := choose_poly_nat_nonnegM295 y 8
 have hy9 := choose_poly_nat_nonnegM295 y 9
 have hy10 := choose_poly_nat_nonnegM295 y 10
 have hy11 := choose_poly_nat_nonnegM295 y 11
 have hy12 := choose_poly_nat_nonnegM295 y 12
 positivity

end
end MathGKM.Markov
