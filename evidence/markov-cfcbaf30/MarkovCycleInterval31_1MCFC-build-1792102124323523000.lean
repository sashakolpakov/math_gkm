import MarkovSmallNumerator31MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cycleShape31_1MCFC (N x : ℤ) : ℤ := (((((((569088*N + ((-3282048)*x + 9883776))*N + ((8031744*x + (-48537216))*x + 84131712))*N + ((((-9717120)*x + 91768320)*x + (-323205120))*x + 413978880))*N + ((((6451200*x + (-84000000))*x + 455696640)*x + (-1187733120))*x + 1235066112))*N + ((((((-2419200)*x + 40320000)*x + (-297884160))*x + 1186496640)*x + (-2505367872))*x + 2218810944))*N + ((((((483840*x + (-9838080))*x + 92252160)*x + (-497051520))*x + 1595857536)*x + (-2861914944))*x + 2221034688))*N + ((((((((-40320)*x + 967680)*x + (-11007360))*x + 74914560)*x + (-324011520))*x + 880427520)*x + (-1379972160))*x + 956188800))

theorem cycleShape31_1MCFC_value (n j : ℕ) (hn : 7≤n) (hl : 1*n+5≤j) (hu : j<(2)*n+3) :
 5040*smallValue31MCFC n (j)=16*cycleShape31_1MCFC n j := by
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
 have h1_2 := chooseShiftSeven_fallingK0B (j) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (j) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (j) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (j) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (j) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (j) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (j) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (j) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (j) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (j) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (j) (1*n+12) (by omega)
 push_cast at h1_12
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
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12 + (smallTerm31_1_2MCFC (n:ℤ))*h1_2 + (smallTerm31_1_3MCFC (n:ℤ))*h1_3 + (smallTerm31_1_4MCFC (n:ℤ))*h1_4 + (smallTerm31_1_5MCFC (n:ℤ))*h1_5 + (smallTerm31_1_6MCFC (n:ℤ))*h1_6 + (smallTerm31_1_7MCFC (n:ℤ))*h1_7 + (smallTerm31_1_8MCFC (n:ℤ))*h1_8 + (smallTerm31_1_9MCFC (n:ℤ))*h1_9 + (smallTerm31_1_10MCFC (n:ℤ))*h1_10 + (smallTerm31_1_11MCFC (n:ℤ))*h1_11 + (smallTerm31_1_12MCFC (n:ℤ))*h1_12
 simp only [cycleShape31_1MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cycleIntervalGap31_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((31501467648*Z + (318934941696*x + 2018007613440))*Z + ((1317376327680*x + 17698808365056)*x + 57178749616128))*Z + (((3030495068160*x + 63919738552320)*x + 436319666012160)*x + 956574346936320))*Z + ((((4410437713920*x + 128597426012160)*x + 1374006648913920)*x + 6341662267637760)*x + 10591339361992704))*Z + (((((4303113486336*x + 162221968097280)*x + 2396152308695040)*x + 17284727750492160)*x + 60619521285292032)*x + 82149930971136000))*Z + ((((((2977766572032*x + 136902349946880)*x + 2599526966722560)*x + 25862135478681600)*x + 141490282059399168)*x + 401726070093938688)*x + 459593579067162624))*Z + (((((((1513296691200*x + 81189008474112)*x + 1870623310381056)*x + 23797659902607360)*x + 178954157875691520)*x + 790638952909897728)*x + 1890502616131928064)*x + 1875751969480704000))*Z + ((((((((568252661760*x + 34573023313920)*x + 927329478082560)*x + 14259924684472320)*x + 136501457370808320)*x + 825936853829713920)*x + 3064430696667217920)*x + 6338366446232862720)*x + 5560917318964482048))*Z + (((((((((152723128320*x + 10413970882560)*x + 317273380945920)*x + 5676324826152960)*x + 65523789829177344)*x + 502954457891880960)*x + 2547338530758819840)*x + 8152669343756206080)*x + 14872073627881193472)*x + 11706928525076520960))*Z + ((((((((((27367538688*x + 2088423751680)*x + 71575774986240)*x + 1458362999439360)*x + 19602779928625152)*x + 181285128993669120)*x + 1162187222018457600)*x + 5064463093688893440)*x + 14260264678352609280)*x + 23284761029013528576)*x + 16634726164869378048))*Z + (((((((((((2898395136*x + 246920970240)*x + 9492739522560)*x + 218261694873600)*x + 3350568428863488)*x + 36140087442751488)*x + 279175713254129664)*x + 1538109269230141440)*x + 5886505331972407296)*x + 14807798514120794112)*x + 21900057202244100096)*x + 14332403883857633280))*Z + ((((((((((((139345920*x + 13024198656)*x + 557547798528)*x + 14379600936960)*x + 249501470883840)*x + 3079881733275648)*x + 27792498530893824)*x + 184606164299612160)*x + 892765348278128640)*x + 3048818481941815296)*x + 6936454995060584448)*x + 9382417232105594880)*x + 5668918403878195200))

theorem cycleIntervalGap31_1MCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (cycleShape31_1MCFC (x+Z+5) (1*(x+Z+5)+5+x))*(cycleShape31_1MCFC (x+Z+5) (1*(x+Z+5)+7+x))≤(cycleShape31_1MCFC (x+Z+5) (1*(x+Z+5)+6+x))^2 := by
 apply sub_nonneg.mp
 have he : (cycleShape31_1MCFC (x+Z+5) (1*(x+Z+5)+6+x))^2-(cycleShape31_1MCFC (x+Z+5) (1*(x+Z+5)+5+x))*(cycleShape31_1MCFC (x+Z+5) (1*(x+Z+5)+7+x))=cycleIntervalGap31_1MCFCCert N Z x := by
  unfold cycleIntervalGap31_1MCFCCert cycleShape31_1MCFC
  ring
 rw [he]
 unfold cycleIntervalGap31_1MCFCCert
 positivity
end
end MathGKM.Markov
