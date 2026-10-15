import MarkovSmallNumerator43MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cycleShape43_0MCFC (N x : ℤ) : ℤ := (((((((3440640*x + (-20643840))*x + 58490880)*x + (-61931520))*N + (((((-6021120)*x + 65372160)*x + (-298475520))*x + 688128000)*x + (-639959040)))*N + (((((3999744*x + (-62576640))*x + 424919040)*x + (-1557964800))*x + 3064406016)*x + (-2539192320)))*N + (((((((-1193472)*x + 24321024)*x + (-222190080))*x + 1152614400)*x + (-3552342528))*x + 6125500416)*x + (-4576320000)))*N + (((((((134784*x + (-3378816))*x + 38924928)*x + (-263975040))*x + 1127661696)*x + (-3013444224))*x + 4638390912)*x + (-3154999680)))

theorem cycleShape43_0MCFC_value (n j : ℕ) (hn : 7≤n) (hl : 0*n+5≤j) (hu : j<(1)*n+2) :
 5040*smallValue43MCFC n (j)=16*cycleShape43_0MCFC n j := by
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
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13,h4_14,h4_15]
 linear_combination (norm := skip) (smallTerm43_0_0MCFC (n:ℤ))*h0_0 + (smallTerm43_0_1MCFC (n:ℤ))*h0_1 + (smallTerm43_0_2MCFC (n:ℤ))*h0_2 + (smallTerm43_0_3MCFC (n:ℤ))*h0_3 + (smallTerm43_0_4MCFC (n:ℤ))*h0_4 + (smallTerm43_0_5MCFC (n:ℤ))*h0_5 + (smallTerm43_0_6MCFC (n:ℤ))*h0_6 + (smallTerm43_0_7MCFC (n:ℤ))*h0_7 + (smallTerm43_0_8MCFC (n:ℤ))*h0_8 + (smallTerm43_0_9MCFC (n:ℤ))*h0_9 + (smallTerm43_0_10MCFC (n:ℤ))*h0_10 + (smallTerm43_0_11MCFC (n:ℤ))*h0_11 + (smallTerm43_0_12MCFC (n:ℤ))*h0_12
 simp only [cycleShape43_0MCFC,fallingSevenK0B,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 push_cast
 ring

def cycleIntervalGap43_0MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((35514010828800*x + 568224173260800)*x + 3373831028736000)*x + 8807474685542400)*x + 8949530728857600)*Z + (((((159813048729600*x + 4119625256140800)*x + 39899991166156800)*x + 184672856309760000)*x + 414235422307123200)*x + 375880290612019200))*Z + ((((((324361298903040*x + 11420418032271360)*x + 159731662454784000)*x + 1133522879879577600)*x + 4326269151199887360)*x + 8512346152752906240)*x + 6974401259608473600))*Z + (((((((386214867763200*x + 17139061625978880)*x + 315025479318896640)*x + 3094528870947225600)*x + 17495390343816806400)*x + 57010853335762206720)*x + 99940567627868405760)*x + 74610120163590144000))*Z + ((((((((293454332559360*x + 15666530243051520)*x + 356804180154777600)*x + 4510723910790021120)*x + 34489362271583600640)*x + 162875029509038407680)*x + 464036189366963404800)*x + 733635964599722311680)*x + 502854553307499724800))*Z + (((((((((144863605555200*x + 9029996123258880)*x + 245304079952117760)*x + 3801389476714905600)*x + 36920027622502563840)*x + 232324129708383928320)*x + 944910192996243210240)*x + 2394884995122777292800)*x + 3448566291383357276160)*x + 2184388304439450009600))*Z + ((((((((((45134799962112*x + 3217812152647680)*x + 101586433030225920)*x + 1866690673476894720)*x + 22060712267586994176)*x + 174764474489343836160)*x + 937437736853227438080)*x + 3355117990655235194880)*x + 7666031602538341466112)*x + 10136627975328717864960)*x + 5967047001496308940800))*Z + (((((((((((8079982460928*x + 648895428034560)*x + 23364521111715840)*x + 497227405344768000)*x + 6938109118074322944)*x + 66526828639121571840)*x + 446359540311032463360)*x + 2091105261792549273600)*x + 6692142392147767984128)*x + 13930849405788998860800)*x + 17031746800505674137600)*x + 9363581488396438732800))*Z + ((((((((((((634229342208*x + 56702951424000)*x + 2295722296885248)*x + 55601489648517120)*x + 896171207231913984)*x + 10112940217575014400)*x + 81799627942299746304)*x + 477013012011826053120)*x + 1986853973188253073408)*x + 5756701273425749606400)*x + 11012103062265483214848)*x + 12521923389406776360960)*x + 6457510219515070464000))

theorem cycleIntervalGap43_0MCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (cycleShape43_0MCFC (x+Z+6) (0*(x+Z+6)+5+x))*(cycleShape43_0MCFC (x+Z+6) (0*(x+Z+6)+7+x))≤(cycleShape43_0MCFC (x+Z+6) (0*(x+Z+6)+6+x))^2 := by
 apply sub_nonneg.mp
 have he : (cycleShape43_0MCFC (x+Z+6) (0*(x+Z+6)+6+x))^2-(cycleShape43_0MCFC (x+Z+6) (0*(x+Z+6)+5+x))*(cycleShape43_0MCFC (x+Z+6) (0*(x+Z+6)+7+x))=cycleIntervalGap43_0MCFCCert N Z x := by
  unfold cycleIntervalGap43_0MCFCCert cycleShape43_0MCFC
  ring
 rw [he]
 unfold cycleIntervalGap43_0MCFCCert
 positivity
end
end MathGKM.Markov
