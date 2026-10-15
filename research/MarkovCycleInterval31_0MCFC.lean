import MarkovSmallNumerator31MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cycleShape31_0MCFC (N x : ℤ) : ℤ := (((((((1088640*x + (-6531840))*x + 18506880)*x + (-19595520))*N + (((((-2177280)*x + 21047040)*x + (-93623040))*x + 209744640)*x + (-191600640)))*N + (((((1669248*x + (-22135680))*x + 138862080)*x + (-484444800))*x + 914360832)*x + (-733743360)))*N + (((((((-580608)*x + 9749376)*x + (-79470720))*x + 381225600)*x + (-1106808192))*x + 1815456384)*x + (-1299957120)))*N + (((((((77184*x + (-1564416))*x + 15708672)*x + (-96324480))*x + 380249856)*x + (-951922944))*x + 1384616448)*x + (-895648320)))

theorem cycleShape31_0MCFC_value (n j : ℕ) (hn : 7≤n) (hl : 0*n+5≤j) (hu : j<(1)*n+2) :
 5040*smallValue31MCFC n (j)=16*cycleShape31_0MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (j) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (j) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (j) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (j) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (j) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (j) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (j) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (j) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (j) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (j) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (j) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (j) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (j) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 : chooseShiftSevenK0B (j) (1*n+2)=0 := by
  exact if_neg (by omega)
 have h1_3 : chooseShiftSevenK0B (j) (1*n+3)=0 := by
  exact if_neg (by omega)
 have h1_4 : chooseShiftSevenK0B (j) (1*n+4)=0 := by
  exact if_neg (by omega)
 have h1_5 : chooseShiftSevenK0B (j) (1*n+5)=0 := by
  exact if_neg (by omega)
 have h1_6 : chooseShiftSevenK0B (j) (1*n+6)=0 := by
  exact if_neg (by omega)
 have h1_7 : chooseShiftSevenK0B (j) (1*n+7)=0 := by
  exact if_neg (by omega)
 have h1_8 : chooseShiftSevenK0B (j) (1*n+8)=0 := by
  exact if_neg (by omega)
 have h1_9 : chooseShiftSevenK0B (j) (1*n+9)=0 := by
  exact if_neg (by omega)
 have h1_10 : chooseShiftSevenK0B (j) (1*n+10)=0 := by
  exact if_neg (by omega)
 have h1_11 : chooseShiftSevenK0B (j) (1*n+11)=0 := by
  exact if_neg (by omega)
 have h1_12 : chooseShiftSevenK0B (j) (1*n+12)=0 := by
  exact if_neg (by omega)
 have h2_3 : chooseShiftSevenK0B (j) (2*n+3)=0 := by
  exact if_neg (by omega)
 have h2_4 : chooseShiftSevenK0B (j) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (j) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (j) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (j) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (j) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (j) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (j) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (j) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (j) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h3_4 : chooseShiftSevenK0B (j) (3*n+4)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (j) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (j) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (j) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (j) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (j) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (j) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (j) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (j) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (j) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12
 simp only [cycleShape31_0MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cycleIntervalGap31_0MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((3555411148800*x + 56886578380800)*x + 337764059136000)*x + 881741964902400)*x + 895963609497600)*Z + (((((14221644595200*x + 365022211276800)*x + 3512746215014400)*x + 16132085519155200)*x + 35866987669094400)*x + 32254689941913600))*Z + ((((((26231033364480*x + 911607418552320)*x + 12593266289049600)*x + 88176566764339200)*x + 331591707363409920)*x + 642013390618951680)*x + 517530387367526400))*Z + (((((((28759325736960*x + 1251188687831040)*x + 22567695735029760)*x + 217593795944448000)*x + 1206503174385008640)*x + 3850615408974888960)*x + 6602545934370570240)*x + 4820582873633587200))*Z + ((((((((20222576640000*x + 1054546233753600)*x + 23463676902113280)*x + 289834325194014720)*x + 2164772124890726400)*x + 9976910332870656000)*x + 27702026773467217920)*x + 42627645148911943680)*x + 28433730796731187200))*Z + (((((((((9235290193920*x + 561659648901120)*x + 14876432188047360)*x + 224655878383534080)*x + 2125175309014302720)*x + 13015427656285716480)*x + 51460509462580592640)*x + 126604167525755781120)*x + 176726814303583272960)*x + 108492759411550617600))*Z + ((((((((((2654539776000*x + 184681557688320)*x + 5683381783511040)*x + 101689904900505600)*x + 1168987045588992000)*x + 8998689614766243840)*x + 46848364973492060160)*x + 162502223556892262400)*x + 359269493357459865600)*x + 459019923945086730240)*x + 261007990945022361600))*Z + (((((((((((437100281856*x + 34274804465664)*x + 1203701549137920)*x + 24952730190151680)*x + 338692496253124608)*x + 3154681043822149632)*x + 20531509764924211200)*x + 93160153802468229120)*x + 288273373811911950336)*x + 579205661604755963904)*x + 682459985736825569280)*x + 361445423708617113600))*Z + ((((((((((((31501467648*x + 2750521245696)*x + 108680611479552)*x + 2566032821452800)*x + 40262862647476224)*x + 441622802795102208)*x + 3466353492924973056)*x + 19582241635036200960)*x + 78874209448108720128)*x + 220574494357256503296)*x + 406470952086210772992)*x + 444535903598906327040)*x + 220366469765604556800))

theorem cycleIntervalGap31_0MCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (cycleShape31_0MCFC (x+Z+6) (0*(x+Z+6)+5+x))*(cycleShape31_0MCFC (x+Z+6) (0*(x+Z+6)+7+x))≤(cycleShape31_0MCFC (x+Z+6) (0*(x+Z+6)+6+x))^2 := by
 apply sub_nonneg.mp
 have he : (cycleShape31_0MCFC (x+Z+6) (0*(x+Z+6)+6+x))^2-(cycleShape31_0MCFC (x+Z+6) (0*(x+Z+6)+5+x))*(cycleShape31_0MCFC (x+Z+6) (0*(x+Z+6)+7+x))=cycleIntervalGap31_0MCFCCert N Z x := by
  unfold cycleIntervalGap31_0MCFCCert cycleShape31_0MCFC
  ring
 rw [he]
 unfold cycleIntervalGap31_0MCFCCert
 positivity
end
end MathGKM.Markov
