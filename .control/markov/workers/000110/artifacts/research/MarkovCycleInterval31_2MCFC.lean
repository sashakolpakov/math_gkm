import MarkovSmallNumerator31MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cycleShape31_2MCFC (N x : ℤ) : ℤ := ((((((((-1679616)*N + (5878656*x + (-21555072)))*N + (((-7838208)*x + 60746112)*x + (-124758144)))*N + (((5443200*x + (-65318400))*x + 278691840)*x + (-415860480)))*N + (((((-2177280)*x + 35562240)*x + (-232968960))*x + 714510720)*x + (-855598464)))*N + (((((508032*x + (-10523520))*x + 93381120)*x + (-437270400))*x + 1068705792)*x + (-1081358208)))*N + (((((((-64512)*x + 1620864)*x + (-18184320))*x + 114952320)*x + (-427271040))*x + 878177664)*x + (-774665856)))*N + (((((((3456*x + (-102144))*x + 1387008)*x + (-11061120))*x + 55367424)*x + (-172574976))*x + 308178432)*x + (-241980480)))

theorem cycleShape31_2MCFC_value (n j : ℕ) (hn : 7≤n) (hl : 2*n+5≤j) (hu : j<(3)*n+4) :
 5040*smallValue31MCFC n (j)=16*cycleShape31_2MCFC n j := by
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
 have h3_13 : chooseShiftSevenK0B (j) (3*n+13)=0 := by
  exact if_neg (by omega)
 unfold smallValue31MCFC
 rw [h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13]
 linear_combination (norm := skip) (smallTerm31_0_0MCFC (n:ℤ))*h0_0 + (smallTerm31_0_1MCFC (n:ℤ))*h0_1 + (smallTerm31_0_2MCFC (n:ℤ))*h0_2 + (smallTerm31_0_3MCFC (n:ℤ))*h0_3 + (smallTerm31_0_4MCFC (n:ℤ))*h0_4 + (smallTerm31_0_5MCFC (n:ℤ))*h0_5 + (smallTerm31_0_6MCFC (n:ℤ))*h0_6 + (smallTerm31_0_7MCFC (n:ℤ))*h0_7 + (smallTerm31_0_8MCFC (n:ℤ))*h0_8 + (smallTerm31_0_9MCFC (n:ℤ))*h0_9 + (smallTerm31_0_10MCFC (n:ℤ))*h0_10 + (smallTerm31_0_11MCFC (n:ℤ))*h0_11 + (smallTerm31_0_12MCFC (n:ℤ))*h0_12 + (smallTerm31_1_2MCFC (n:ℤ))*h1_2 + (smallTerm31_1_3MCFC (n:ℤ))*h1_3 + (smallTerm31_1_4MCFC (n:ℤ))*h1_4 + (smallTerm31_1_5MCFC (n:ℤ))*h1_5 + (smallTerm31_1_6MCFC (n:ℤ))*h1_6 + (smallTerm31_1_7MCFC (n:ℤ))*h1_7 + (smallTerm31_1_8MCFC (n:ℤ))*h1_8 + (smallTerm31_1_9MCFC (n:ℤ))*h1_9 + (smallTerm31_1_10MCFC (n:ℤ))*h1_10 + (smallTerm31_1_11MCFC (n:ℤ))*h1_11 + (smallTerm31_1_12MCFC (n:ℤ))*h1_12 + (smallTerm31_2_3MCFC (n:ℤ))*h2_3 + (smallTerm31_2_4MCFC (n:ℤ))*h2_4 + (smallTerm31_2_5MCFC (n:ℤ))*h2_5 + (smallTerm31_2_6MCFC (n:ℤ))*h2_6 + (smallTerm31_2_7MCFC (n:ℤ))*h2_7 + (smallTerm31_2_8MCFC (n:ℤ))*h2_8 + (smallTerm31_2_9MCFC (n:ℤ))*h2_9 + (smallTerm31_2_10MCFC (n:ℤ))*h2_10 + (smallTerm31_2_11MCFC (n:ℤ))*h2_11 + (smallTerm31_2_12MCFC (n:ℤ))*h2_12
 simp only [cycleShape31_2MCFC,fallingSevenK0B,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 push_cast
 ring

def cycleIntervalGap31_2MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((139345920*Z + (445906944*x + 5220827136))*Z + ((390168576*x + 14083227648)*x + 89698516992))*Z + ((9754214400*x + 205117194240)*x + 941544898560))*Z + ((117050572800*x + 1837972684800)*x + 6776066949120))*Z + ((877879296000*x + 11319570726912)*x + 35460991254528))*Z + ((4554437787648*x + 50598621609984)*x + 139177283567616))*Z + ((17106941214720*x + 168118901637120)*x + 413937366958080))*Z + ((46986050764800*x + 414592896614400)*x + 924490304962560))*Z + ((92372410368000*x + 739197108486144)*x + 1505809901223936))*Z + ((123478990258176*x + 903677158637568)*x + 1694581450555392))*Z + ((101640864890880*x + 684078662615040)*x + 1186067601653760))*Z + ((38714476953600*x + 240582821068800)*x + 387247188787200))

theorem cycleIntervalGap31_2MCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (cycleShape31_2MCFC (x+Z+4) (2*(x+Z+4)+5+x))*(cycleShape31_2MCFC (x+Z+4) (2*(x+Z+4)+7+x))≤(cycleShape31_2MCFC (x+Z+4) (2*(x+Z+4)+6+x))^2 := by
 apply sub_nonneg.mp
 have he : (cycleShape31_2MCFC (x+Z+4) (2*(x+Z+4)+6+x))^2-(cycleShape31_2MCFC (x+Z+4) (2*(x+Z+4)+5+x))*(cycleShape31_2MCFC (x+Z+4) (2*(x+Z+4)+7+x))=cycleIntervalGap31_2MCFCCert N Z x := by
  unfold cycleIntervalGap31_2MCFCCert cycleShape31_2MCFC
  ring
 rw [he]
 unfold cycleIntervalGap31_2MCFCCert
 positivity
end
end MathGKM.Markov
