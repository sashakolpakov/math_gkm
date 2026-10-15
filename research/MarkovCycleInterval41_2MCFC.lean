import MarkovSmallNumerator41MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cycleShape41_2MCFC (N x : ℤ) : ℤ := ((((((((-11624448)*N + (36019200*x + (-133066752)))*N + (((-43997184)*x + 338075136)*x + (-683510016)))*N + (((28492800*x + (-335946240))*x + 1396711680)*x + (-2021308800)))*N + (((((-10752000)*x + 171494400)*x + (-1087726080))*x + 3212643840)*x + (-3691172352)))*N + (((((2386944*x + (-48061440))*x + 410995200)*x + (-1844317440))*x + 4302337536)*x + (-4141592448)))*N + (((((((-290304)*x + 7064064)*x + (-76097280))*x + 459271680)*x + (-1622971392))*x + 3160496640)*x + (-2633364864)))*N + (((((((14976*x + (-427392))*x + 5556096)*x + (-42174720))*x + 200075904)*x + (-588930048))*x + 990042624)*x + (-729570240)))

theorem cycleShape41_2MCFC_value (n j : ℕ) (hn : 7≤n) (hl : 2*n+5≤j) (hu : j<(3)*n+4) :
 5040*smallValue41MCFC n (j)=16*cycleShape41_2MCFC n j := by
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
 have h2_3 := chooseShiftSeven_fallingK0B (j) (2*n+3) (by omega)
 push_cast at h2_3
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
 have h4_5 : chooseShiftSevenK0B (j) (4*n+5)=0 := by
  exact if_neg (by omega)
 have h4_6 : chooseShiftSevenK0B (j) (4*n+6)=0 := by
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
 unfold smallValue41MCFC
 rw [h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12 + (smallTerm41_1_2MCFC (n:ℤ))*h1_2 + (smallTerm41_1_3MCFC (n:ℤ))*h1_3 + (smallTerm41_1_4MCFC (n:ℤ))*h1_4 + (smallTerm41_1_5MCFC (n:ℤ))*h1_5 + (smallTerm41_1_6MCFC (n:ℤ))*h1_6 + (smallTerm41_1_7MCFC (n:ℤ))*h1_7 + (smallTerm41_1_8MCFC (n:ℤ))*h1_8 + (smallTerm41_1_9MCFC (n:ℤ))*h1_9 + (smallTerm41_1_10MCFC (n:ℤ))*h1_10 + (smallTerm41_1_11MCFC (n:ℤ))*h1_11 + (smallTerm41_1_12MCFC (n:ℤ))*h1_12 + (smallTerm41_2_3MCFC (n:ℤ))*h2_3 + (smallTerm41_2_4MCFC (n:ℤ))*h2_4 + (smallTerm41_2_5MCFC (n:ℤ))*h2_5 + (smallTerm41_2_6MCFC (n:ℤ))*h2_6 + (smallTerm41_2_7MCFC (n:ℤ))*h2_7 + (smallTerm41_2_8MCFC (n:ℤ))*h2_8 + (smallTerm41_2_9MCFC (n:ℤ))*h2_9 + (smallTerm41_2_10MCFC (n:ℤ))*h2_10 + (smallTerm41_2_11MCFC (n:ℤ))*h2_11 + (smallTerm41_2_12MCFC (n:ℤ))*h2_12
 simp only [cycleShape41_2MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cycleIntervalGap41_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((8918138880*Z + (42807066624*x + 347807416320))*Z + ((86803218432*x + 1493490991104)*x + 6238684053504))*Z + (((103054049280*x + 2725977784320)*x + 23992270848000)*x + 68419961487360))*Z + ((((95126814720*x + 3038112645120)*x + 39815774208000)*x + 236092863283200)*x + 513836593643520))*Z + (((((74714185728*x + 2646209986560)*x + 41438132305920)*x + 356621014794240)*x + 1587845841813504)*x + 2795348270776320))*Z + ((((((48323100672*x + 1901594935296)*x + 33286003752960)*x + 341260511477760)*x + 2164548729176064)*x + 7671394137931776)*x + 11317801628270592))*Z + (((((((23385341952*x + 1061605343232)*x + 21022022762496)*x + 244270672773120)*x + 1853300822704128)*x + 9252494547222528)*x + 27110826356834304)*x + 34346484564295680))*Z + ((((((((7927234560*x + 421629788160)*x + 9719388241920)*x + 129688349736960)*x + 1132211621560320)*x + 6819377426104320)*x + 28012473915310080)*x + 69789985769226240)*x + 77355526503628800))*Z + (((((((((1816657920*x + 112219914240)*x + 3033034260480)*x + 47360395837440)*x + 480123588575232)*x + 3373234937856000)*x + 16886586182860800)*x + 58957818674872320)*x + 127696121093947392)*x + 125743396015964160))*Z + ((((((((((272498688*x + 19074908160)*x + 596834058240)*x + 10911280988160)*x + 129765935480832)*x + 1066944193265664)*x + 6299647222579200)*x + 27064814724218880)*x + 82312902667763712)*x + 157791482685849600)*x + 139823729430626304))*Z + (((((((((((24772608*x + 1907490816)*x + 67360849920)*x + 1420027822080)*x + 19721138798592)*x + 190356485308416)*x + 1322189441040384)*x + 6757034773708800)*x + 25499976227389440)*x + 68841783845388288)*x + 118503069912170496)*x + 95506572948111360))*Z + ((((((((((((1032192*x + 86704128)*x + 3368042496)*x + 79984558080)*x + 1276442689536)*x + 14347687624704)*x + 116962567077888)*x + 705495774412800)*x + 3186825259548672)*x + 10747654019923968)*x + 26131512712790016)*x + 40861592881643520)*x + 30216181059993600))

theorem cycleIntervalGap41_2MCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (cycleShape41_2MCFC (x+Z+4) (2*(x+Z+4)+5+x))*(cycleShape41_2MCFC (x+Z+4) (2*(x+Z+4)+7+x))≤(cycleShape41_2MCFC (x+Z+4) (2*(x+Z+4)+6+x))^2 := by
 apply sub_nonneg.mp
 have he : (cycleShape41_2MCFC (x+Z+4) (2*(x+Z+4)+6+x))^2-(cycleShape41_2MCFC (x+Z+4) (2*(x+Z+4)+5+x))*(cycleShape41_2MCFC (x+Z+4) (2*(x+Z+4)+7+x))=cycleIntervalGap41_2MCFCCert N Z x := by
  unfold cycleIntervalGap41_2MCFCCert cycleShape41_2MCFC
  ring
 rw [he]
 unfold cycleIntervalGap41_2MCFCCert
 positivity
end
end MathGKM.Markov
