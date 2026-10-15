import MarkovSmallNumerator43MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cycleShape43_1MCFC (N x : ℤ) : ℤ := (((((((2531328*N + ((-13526016)*x + 49201152))*N + ((30320640*x + (-222727680))*x + 443772672))*N + ((((-33438720)*x + 390136320)*x + (-1591806720))*x + 2291452800))*N + ((((20213760*x + (-328903680))*x + 2099166720)*x + (-6201484800))*x + 7163423232))*N + ((((((-6902784)*x + 144829440)*x + (-1273413120))*x + 5822449920)*x + (-13774118400))*x + 13462286208))*N + ((((((1257984*x + (-32352768))*x + 363874560)*x + (-2272704000))*x + 8259557376)*x + (-16479386112))*x + 14060861568))*N + ((((((((-95616)*x + 2911104)*x + (-39924864))*x + 317157120)*x + (-1565230464))*x + 4771984896)*x + (-8284801536))*x + 6298568640))

theorem cycleShape43_1MCFC_value (n j : ℕ) (hn : 7≤n) (hl : 1*n+5≤j) (hu : j<(2)*n+4) :
 5040*smallValue43MCFC n (j)=16*cycleShape43_1MCFC n j := by
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
 have h2_13 : chooseShiftSevenK0B (j) (2*n+13)=0 := by
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
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 linear_combination (norm := skip) (smallTerm43_0_0MCFC (n:ℤ))*h0_0 + (smallTerm43_0_1MCFC (n:ℤ))*h0_1 + (smallTerm43_0_2MCFC (n:ℤ))*h0_2 + (smallTerm43_0_3MCFC (n:ℤ))*h0_3 + (smallTerm43_0_4MCFC (n:ℤ))*h0_4 + (smallTerm43_0_5MCFC (n:ℤ))*h0_5 + (smallTerm43_0_6MCFC (n:ℤ))*h0_6 + (smallTerm43_0_7MCFC (n:ℤ))*h0_7 + (smallTerm43_0_8MCFC (n:ℤ))*h0_8 + (smallTerm43_0_9MCFC (n:ℤ))*h0_9 + (smallTerm43_0_10MCFC (n:ℤ))*h0_10 + (smallTerm43_0_11MCFC (n:ℤ))*h0_11 + (smallTerm43_0_12MCFC (n:ℤ))*h0_12 + (smallTerm43_1_2MCFC (n:ℤ))*h1_2 + (smallTerm43_1_3MCFC (n:ℤ))*h1_3 + (smallTerm43_1_4MCFC (n:ℤ))*h1_4 + (smallTerm43_1_5MCFC (n:ℤ))*h1_5 + (smallTerm43_1_6MCFC (n:ℤ))*h1_6 + (smallTerm43_1_7MCFC (n:ℤ))*h1_7 + (smallTerm43_1_8MCFC (n:ℤ))*h1_8 + (smallTerm43_1_9MCFC (n:ℤ))*h1_9 + (smallTerm43_1_10MCFC (n:ℤ))*h1_10 + (smallTerm43_1_11MCFC (n:ℤ))*h1_11 + (smallTerm43_1_12MCFC (n:ℤ))*h1_12
 simp only [cycleShape43_1MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cycleIntervalGap43_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((634229342208*Z + (7141521752064*x + 38666065084416))*Z + ((32950813851648*x + 377621324365824)*x + 1042014940839936))*Z + (((85282015150080*x + 1527346971279360)*x + 8872152600084480)*x + 16579982106132480))*Z + ((((141019557396480*x + 3470060472238080)*x + 31383985102848000)*x + 122941633931182080)*x + 174626932990132224))*Z + (((((158041311805440*x + 4993459185254400)*x + 62018512605020160)*x + 377474595403530240)*x + 1120493106433032192)*x + 1288335802210910208))*Z + ((((((124189212672000*x + 4814844965683200)*x + 76700490823434240)*x + 640618085797724160)*x + 2950320353984446464)*x + 7072918736090038272)*x + 6849920650009264128))*Z + (((((((69681779048448*x + 3204212436762624)*x + 62536251181694976)*x + 669098128651223040)*x + 4224737037620477952)*x + 15694463967207653376)*x + 31632239492261904384)*x + 26519150593242316800))*Z + ((((((((27991065231360*x + 1486825673195520)*x + 34364735762595840)*x + 449799675576975360)*x + 3633491221734850560)*x + 18486775182119731200)*x + 57670985305793986560)*x + 100455897114863861760)*x + 74370491635872595968))*Z + (((((((((7911380090880*x + 475717309562880)*x + 12686945857044480)*x + 196398854370754560)*x + 1938215507124879360)*x + 12600417114681016320)*x + 53777256861886709760)*x + 144822060855418060800)*x + 222436288224710590464)*x + 147636903063331454976))*Z + ((((((((((1499436417024*x + 100569852149760)*x + 3034740845445120)*x + 54163814594641920)*x + 631527879124058112)*x + 5009827607832821760)*x + 27288168999747747840)*x + 100429809789442129920)*x + 238217115552036913152)*x + 327579963258642038784)*x + 197250446163567476736))*Z + (((((((((((171228266496*x + 12676837146624)*x + 426709659156480)*x + 8615299692625920)*x + 115752743050936320)*x + 1084019101293477888)*x + 7198037588436516864)*x + 33774738359086448640)*x + 109375498046764744704)*x + 232035493247563235328)*x + 289115384594962415616)*x + 159449831665428971520))*Z + ((((((((((((8918138880*x + 722369249280)*x + 26839584866304)*x + 604498207703040)*x + 9186682063749120)*x + 99103874360279040)*x + 776396480261455872)*x + 4437556136475033600)*x + 18305240265407692800)*x + 52970647160686510080)*x + 101725660101236097024)*x + 115961238146375516160)*x + 59036687829168537600))

theorem cycleIntervalGap43_1MCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (cycleShape43_1MCFC (x+Z+4) (1*(x+Z+4)+5+x))*(cycleShape43_1MCFC (x+Z+4) (1*(x+Z+4)+7+x))≤(cycleShape43_1MCFC (x+Z+4) (1*(x+Z+4)+6+x))^2 := by
 apply sub_nonneg.mp
 have he : (cycleShape43_1MCFC (x+Z+4) (1*(x+Z+4)+6+x))^2-(cycleShape43_1MCFC (x+Z+4) (1*(x+Z+4)+5+x))*(cycleShape43_1MCFC (x+Z+4) (1*(x+Z+4)+7+x))=cycleIntervalGap43_1MCFCCert N Z x := by
  unfold cycleIntervalGap43_1MCFCCert cycleShape43_1MCFC
  ring
 rw [he]
 unfold cycleIntervalGap43_1MCFCCert
 positivity
end
end MathGKM.Markov
