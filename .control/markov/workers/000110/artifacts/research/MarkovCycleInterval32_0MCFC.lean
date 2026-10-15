import MarkovSmallNumerator32MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cycleShape32_0MCFC (N x : ℤ) : ℤ := (((((((1088640*x + (-6531840))*x + 18506880)*x + (-19595520))*N + (((((-2177280)*x + 22498560)*x + (-102332160))*x + 234420480)*x + (-217728000)))*N + (((((1669248*x + (-24312960))*x + 160634880)*x + (-582422400))*x + 1136443392)*x + (-938407680)))*N + (((((((-580608)*x + 10862208)*x + (-94953600))*x + 480977280)*x + (-1461946752))*x + 2497686912)*x + (-1855889280)))*N + (((((((77184*x + (-1757952))*x + 19143936)*x + (-125354880))*x + 523547136)*x + (-1378234368))*x + 2099361024)*x + (-1417832640)))

theorem cycleShape32_0MCFC_value (n j : ℕ) (hn : 7≤n) (hl : 0*n+5≤j) (hu : j<(1)*n+2) :
 5040*smallValue32MCFC n (j)=16*cycleShape32_0MCFC n j := by
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
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12
 simp only [cycleShape32_0MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cycleIntervalGap32_0MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((3555411148800*x + 56886578380800)*x + 337764059136000)*x + 881741964902400)*x + 895963609497600)*Z + (((((14221644595200*x + 374503307673600)*x + 3664443757363200)*x + 17032789676851200)*x + 38218299575500800)*x + 34643926233907200))*Z + ((((((26231033364480*x + 944791255941120)*x + 13456046061158400)*x + 96549955065446400)*x + 370284061758750720)*x + 728446225737646080)*x + 595578772905984000))*Z + (((((((28759325736960*x + 1303650754560000)*x + 24424094409523200)*x + 243639421201612800)*x + 1391170702726103040)*x + 4552140904257945600)*x + 7972091151652454400)*x + 5932762886460211200))*Z + ((((((((20222576640000*x + 1102478443315200)*x + 25592709770772480)*x + 328984932581867520)*x + 2548893478131302400)*x + 12139312622601830400)*x + 34693575824940318720)*x + 54749166933064826880)*x + 37373172156382003200))*Z + (((((((((9235290193920*x + 588623084421120)*x + 16314448639426560)*x + 257350420967915520)*x + 2537377703332577280)*x + 16153048264256225280)*x + 66170462594072739840)*x + 168071336769043169280)*x + 241391103406851686400)*x + 152158103198193254400))*Z + ((((((((((2654539776000*x + 193916847882240)*x + 6258523150172160)*x + 117280019513180160)*x + 1409753636057088000)*x + 11325616258290647040)*x + 61389928109204029440)*x + 221077494351719792640)*x + 505830645563056128000)*x + 666732580582528696320)*x + 390340632767868518400))*Z + (((((((((((437100281856*x + 36044497649664)*x + 1329901017661440)*x + 28931867199406080)*x + 411602581254832128)*x + 4012445015507238912)*x + 27283382076009185280)*x + 129065326163689144320)*x + 415316440102689570816)*x + 865270086215809204224)*x + 1054121177530335559680)*x + 576138067070327193600))*Z + ((((((((((((31501467648*x + 2896221339648)*x + 120400495165440)*x + 2988128892026880)*x + 49232978113019904)*x + 566383296278790144)*x + 4656416738394193920)*x + 27508315151329689600)*x + 115642659282703515648)*x + 336755625710088388608)*x + 644505690562057175040)*x + 730124552255923077120)*x + 374239012206134476800))

theorem cycleIntervalGap32_0MCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (cycleShape32_0MCFC (x+Z+6) (0*(x+Z+6)+5+x))*(cycleShape32_0MCFC (x+Z+6) (0*(x+Z+6)+7+x))≤(cycleShape32_0MCFC (x+Z+6) (0*(x+Z+6)+6+x))^2 := by
 apply sub_nonneg.mp
 have he : (cycleShape32_0MCFC (x+Z+6) (0*(x+Z+6)+6+x))^2-(cycleShape32_0MCFC (x+Z+6) (0*(x+Z+6)+5+x))*(cycleShape32_0MCFC (x+Z+6) (0*(x+Z+6)+7+x))=cycleIntervalGap32_0MCFCCert N Z x := by
  unfold cycleIntervalGap32_0MCFCCert cycleShape32_0MCFC
  ring
 rw [he]
 unfold cycleIntervalGap32_0MCFCCert
 positivity
end
end MathGKM.Markov
