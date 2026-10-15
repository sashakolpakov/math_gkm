import MarkovSmallNumerator43MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cycleShape43_2MCFC (N x : ℤ) : ℤ := ((((((((-11624448)*N + (36019200*x + (-173752320)))*N + (((-43997184)*x + 446132736)*x + (-1143738624)))*N + (((28492800*x + (-445939200))*x + 2376971520)*x + (-4281029760)))*N + (((((-10752000)*x + 228480000)*x + (-1869611520))*x + 6943480320)*x + (-9810458112)))*N + (((((2386944*x + (-64189440))*x + 710976000)*x + (-4036273920))*x + 11686703616)*x + (-13731070080)))*N + (((((((-290304)*x + 9451008)*x + (-132222720))*x + 1013537280)*x + (-4470853632))*x + 10713970176)*x + (-10847258496)))*N + (((((((14976*x + (-572544))*x + 9684864)*x + (-93623040))*x + 556504704)*x + (-2026354176))*x + 4169258496)*x + (-3724902720)))

theorem cycleShape43_2MCFC_value (n j : ℕ) (hn : 7≤n) (hl : 2*n+6≤j) (hu : j<(3)*n+6) :
 5040*smallValue43MCFC n (j)=16*cycleShape43_2MCFC n j := by
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
 have h2_4 := chooseShiftSeven_fallingK0B (j) (2*n+4) (by omega)
 push_cast at h2_4
 have h2_5 := chooseShiftSeven_fallingK0B (j) (2*n+5) (by omega)
 push_cast at h2_5
 have h2_6 := chooseShiftSeven_fallingK0B (j) (2*n+6) (by omega)
 push_cast at h2_6
 have h2_7 := chooseShiftSeven_fallingK0B (j) (2*n+7) (by omega)
 push_cast at h2_7
 have h2_8 := chooseShiftSeven_fallingK0B (j) (2*n+8) (by omega)
 push_cast at h2_8
 have h2_9 := chooseShiftSeven_fallingK0B (j) (2*n+9) (by omega)
 push_cast at h2_9
 have h2_10 := chooseShiftSeven_fallingK0B (j) (2*n+10) (by omega)
 push_cast at h2_10
 have h2_11 := chooseShiftSeven_fallingK0B (j) (2*n+11) (by omega)
 push_cast at h2_11
 have h2_12 := chooseShiftSeven_fallingK0B (j) (2*n+12) (by omega)
 push_cast at h2_12
 have h2_13 := chooseShiftSeven_fallingK0B (j) (2*n+13) (by omega)
 push_cast at h2_13
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
 have h3_14 : chooseShiftSevenK0B (j) (3*n+14)=0 := by
  exact if_neg (by omega)
 have h4_7 : chooseShiftSevenK0B (j) (4*n+7)=0 := by
  exact if_neg (by omega)
 have h4_8 : chooseShiftSevenK0B (j) (4*n+8)=0 := by
  exact if_neg (by omega)
 have h4_9 : chooseShiftSevenK0B (j) (4*n+9)=0 := by
  exact if_neg (by omega)
 have h4_10 : chooseShiftSevenK0B (j) (4*n+10)=0 := by
  exact if_neg (by omega)
 have h4_11 : chooseShiftSevenK0B (j) (4*n+11)=0 := by
  exact if_neg (by omega)
 have h4_12 : chooseShiftSevenK0B (j) (4*n+12)=0 := by
  exact if_neg (by omega)
 have h4_13 : chooseShiftSevenK0B (j) (4*n+13)=0 := by
  exact if_neg (by omega)
 have h4_14 : chooseShiftSevenK0B (j) (4*n+14)=0 := by
  exact if_neg (by omega)
 have h4_15 : chooseShiftSevenK0B (j) (4*n+15)=0 := by
  exact if_neg (by omega)
 unfold smallValue43MCFC
 rw [h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 linear_combination (norm := skip) (smallTerm43_0_0MCFC (n:ℤ))*h0_0 + (smallTerm43_0_1MCFC (n:ℤ))*h0_1 + (smallTerm43_0_2MCFC (n:ℤ))*h0_2 + (smallTerm43_0_3MCFC (n:ℤ))*h0_3 + (smallTerm43_0_4MCFC (n:ℤ))*h0_4 + (smallTerm43_0_5MCFC (n:ℤ))*h0_5 + (smallTerm43_0_6MCFC (n:ℤ))*h0_6 + (smallTerm43_0_7MCFC (n:ℤ))*h0_7 + (smallTerm43_0_8MCFC (n:ℤ))*h0_8 + (smallTerm43_0_9MCFC (n:ℤ))*h0_9 + (smallTerm43_0_10MCFC (n:ℤ))*h0_10 + (smallTerm43_0_11MCFC (n:ℤ))*h0_11 + (smallTerm43_0_12MCFC (n:ℤ))*h0_12 + (smallTerm43_1_2MCFC (n:ℤ))*h1_2 + (smallTerm43_1_3MCFC (n:ℤ))*h1_3 + (smallTerm43_1_4MCFC (n:ℤ))*h1_4 + (smallTerm43_1_5MCFC (n:ℤ))*h1_5 + (smallTerm43_1_6MCFC (n:ℤ))*h1_6 + (smallTerm43_1_7MCFC (n:ℤ))*h1_7 + (smallTerm43_1_8MCFC (n:ℤ))*h1_8 + (smallTerm43_1_9MCFC (n:ℤ))*h1_9 + (smallTerm43_1_10MCFC (n:ℤ))*h1_10 + (smallTerm43_1_11MCFC (n:ℤ))*h1_11 + (smallTerm43_1_12MCFC (n:ℤ))*h1_12 + (smallTerm43_2_4MCFC (n:ℤ))*h2_4 + (smallTerm43_2_5MCFC (n:ℤ))*h2_5 + (smallTerm43_2_6MCFC (n:ℤ))*h2_6 + (smallTerm43_2_7MCFC (n:ℤ))*h2_7 + (smallTerm43_2_8MCFC (n:ℤ))*h2_8 + (smallTerm43_2_9MCFC (n:ℤ))*h2_9 + (smallTerm43_2_10MCFC (n:ℤ))*h2_10 + (smallTerm43_2_11MCFC (n:ℤ))*h2_11 + (smallTerm43_2_12MCFC (n:ℤ))*h2_12 + (smallTerm43_2_13MCFC (n:ℤ))*h2_13
 simp only [cycleShape43_2MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cycleIntervalGap43_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((8918138880*Z + (42807066624*x + 294298583040))*Z + ((86803218432*x + 1258052124672)*x + 4472892555264))*Z + (((103054049280*x + 2291961692160)*x + 17113413058560)*x + 41774048870400))*Z + ((((95126814720*x + 2574369423360)*x + 28525410385920)*x + 144097801666560)*x + 269526408560640))*Z + (((((74714185728*x + 2265702727680)*x + 30213168168960)*x + 220704119193600)*x + 839175514619904)*x + 1272868126064640))*Z + ((((((48323100672*x + 1640095285248)*x + 24690156503040)*x + 216538357432320)*x + 1169953538310144)*x + 3547565812482048)*x + 4516973466550272))*Z + (((((((23385341952*x + 916636041216)*x + 15709487431680)*x + 157710907146240)*x + 1028658728337408)*x + 4393310564450304)*x + 11041271594680320)*x + 12091911652638720))*Z + ((((((((7927234560*x + 363166433280)*x + 7246586511360)*x + 83954956861440)*x + 636041830072320)*x + 3310563676815360)*x + 11693737601925120)*x + 25079355283046400)*x + 24083966904238080))*Z + (((((((((1816657920*x + 96365445120)*x + 2248238039040)*x + 30453957918720)*x + 268821293432832)*x + 1645499120025600)*x + 7155482768179200)*x + 21605948991406080)*x + 40472906627284992)*x + 34641098812293120))*Z + ((((((((((272498688*x + 16349921280)*x + 440395038720)*x + 6963642040320)*x + 71995408515072)*x + 516833032568832)*x + 2668815837757440)*x + 10011880210268160)*x + 26496861796564992)*x + 44176067425566720)*x + 34172030699864064))*Z + (((((((((((24772608*x + 1634992128)*x + 49648435200)*x + 903209287680)*x + 10872858673152)*x + 91462537248768)*x + 556350693212160)*x + 2496704603258880)*x + 8272236839731200)*x + 19561041094017024)*x + 29469778216058880)*x + 20834266769326080))*Z + ((((((((((((1032192*x + 74317824)*x + 2482421760)*x + 50845777920)*x + 701780115456)*x + 6852883709952)*x + 48798946344960)*x + 258435170058240)*x + 1028471392714752)*x + 3058522174439424)*x + 6548016528506880)*x + 9006436397629440)*x + 5864731162214400))

theorem cycleIntervalGap43_2MCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (cycleShape43_2MCFC (x+Z+3) (2*(x+Z+3)+6+x))*(cycleShape43_2MCFC (x+Z+3) (2*(x+Z+3)+8+x))≤(cycleShape43_2MCFC (x+Z+3) (2*(x+Z+3)+7+x))^2 := by
 apply sub_nonneg.mp
 have he : (cycleShape43_2MCFC (x+Z+3) (2*(x+Z+3)+7+x))^2-(cycleShape43_2MCFC (x+Z+3) (2*(x+Z+3)+6+x))*(cycleShape43_2MCFC (x+Z+3) (2*(x+Z+3)+8+x))=cycleIntervalGap43_2MCFCCert N Z x := by
  unfold cycleIntervalGap43_2MCFCCert cycleShape43_2MCFC
  ring
 rw [he]
 unfold cycleIntervalGap43_2MCFCCert
 positivity
end
end MathGKM.Markov
