import MarkovSmallNumerator32MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cycleShape32_2MCFC (N x : ℤ) : ℤ := ((((((((-1679616)*N + (5878656*x + (-25474176)))*N + (((-7838208)*x + 72503424)*x + (-171787392)))*N + (((5443200*x + (-78382080))*x + 389733120)*x + (-661893120)))*N + (((((-2177280)*x + 42819840)*x + (-328769280))*x + 1157950080)*x + (-1565391744)))*N + (((((508032*x + (-12700800))*x + 132572160)*x + (-716688000))*x + 1992598272)*x + (-2264540544)))*N + (((((((-64512)*x + 1959552)*x + (-25925760))*x + 189866880)*x + (-806601600))*x + 1874001024)*x + (-1850629248)))*N + (((((((3456*x + (-123648))*x + 1983744)*x + (-18372480))*x + 105444864)*x + (-373051392))*x + 749811456)*x + (-657720000)))

theorem cycleShape32_2MCFC_value (n j : ℕ) (hn : 7≤n) (hl : 2*n+6≤j) (hu : j<(3)*n+5) :
 5040*smallValue32MCFC n (j)=16*cycleShape32_2MCFC n j := by
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
 have h3_14 : chooseShiftSevenK0B (j) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12 + (smallTerm32_1_2MCFC (n:ℤ))*h1_2 + (smallTerm32_1_3MCFC (n:ℤ))*h1_3 + (smallTerm32_1_4MCFC (n:ℤ))*h1_4 + (smallTerm32_1_5MCFC (n:ℤ))*h1_5 + (smallTerm32_1_6MCFC (n:ℤ))*h1_6 + (smallTerm32_1_7MCFC (n:ℤ))*h1_7 + (smallTerm32_1_8MCFC (n:ℤ))*h1_8 + (smallTerm32_1_9MCFC (n:ℤ))*h1_9 + (smallTerm32_1_10MCFC (n:ℤ))*h1_10 + (smallTerm32_1_11MCFC (n:ℤ))*h1_11 + (smallTerm32_1_12MCFC (n:ℤ))*h1_12 + (smallTerm32_2_4MCFC (n:ℤ))*h2_4 + (smallTerm32_2_5MCFC (n:ℤ))*h2_5 + (smallTerm32_2_6MCFC (n:ℤ))*h2_6 + (smallTerm32_2_7MCFC (n:ℤ))*h2_7 + (smallTerm32_2_8MCFC (n:ℤ))*h2_8 + (smallTerm32_2_9MCFC (n:ℤ))*h2_9 + (smallTerm32_2_10MCFC (n:ℤ))*h2_10 + (smallTerm32_2_11MCFC (n:ℤ))*h2_11 + (smallTerm32_2_12MCFC (n:ℤ))*h2_12 + (smallTerm32_2_13MCFC (n:ℤ))*h2_13
 simp only [cycleShape32_2MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cycleIntervalGap32_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((139345920*Z + (445906944*x + 5369462784))*Z + ((390168576*x + 14343340032)*x + 94436278272))*Z + ((9754214400*x + 211620003840)*x + 1011001098240))*Z + ((117050572800*x + 1916006400000)*x + 7401730129920))*Z + ((877879296000*x + 11904823590912)*x + 39331723640832))*Z + ((4554437787648*x + 53634913468416)*x + 156549539414016))*Z + ((17106941214720*x + 179523529113600)*x + 471877772083200))*Z + ((46986050764800*x + 445916930457600)*x + 1067908609474560))*Z + ((92372410368000*x + 800778715398144)*x + 1762472538537984))*Z + ((123478990258176*x + 985996485476352)*x + 2009527057907712))*Z + ((101640864890880*x + 751839239208960)*x + 1425387251957760))*Z + ((38714476953600*x + 266392472371200)*x + 471743071027200))

theorem cycleIntervalGap32_2MCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (cycleShape32_2MCFC (x+Z+4) (2*(x+Z+4)+6+x))*(cycleShape32_2MCFC (x+Z+4) (2*(x+Z+4)+8+x))≤(cycleShape32_2MCFC (x+Z+4) (2*(x+Z+4)+7+x))^2 := by
 apply sub_nonneg.mp
 have he : (cycleShape32_2MCFC (x+Z+4) (2*(x+Z+4)+7+x))^2-(cycleShape32_2MCFC (x+Z+4) (2*(x+Z+4)+6+x))*(cycleShape32_2MCFC (x+Z+4) (2*(x+Z+4)+8+x))=cycleIntervalGap32_2MCFCCert N Z x := by
  unfold cycleIntervalGap32_2MCFCCert cycleShape32_2MCFC
  ring
 rw [he]
 unfold cycleIntervalGap32_2MCFCCert
 positivity
end
end MathGKM.Markov
