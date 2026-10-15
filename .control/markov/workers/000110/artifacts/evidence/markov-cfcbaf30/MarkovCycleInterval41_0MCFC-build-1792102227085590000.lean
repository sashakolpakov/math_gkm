import MarkovSmallNumerator41MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cycleShape41_0MCFC (N x : ℤ) : ℤ := (((((((3440640*x + (-20643840))*x + 58490880)*x + (-61931520))*N + (((((-6021120)*x + 58490880)*x + (-257187840))*x + 571146240)*x + (-516096000)))*N + (((((3999744*x + (-53544960))*x + 332021760)*x + (-1141217280))*x + 2119950336)*x + (-1672151040)))*N + (((((((-1193472)*x + 20321280)*x + (-164129280))*x + 775004160)*x + (-2207912448))*x + 3547944960)*x + (-2486131200)))*N + (((((((134784*x + (-2782080))*x + 27764352)*x + (-167771520))*x + 649627776)*x + (-1590744960))*x + 2259381888)*x + (-1425513600)))

theorem cycleShape41_0MCFC_value (n j : ℕ) (hn : 7≤n) (hl : 0*n+5≤j) (hu : j<(1)*n+2) :
 5040*smallValue41MCFC n (j)=16*cycleShape41_0MCFC n j := by
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
 rw [h1_2,h1_3,h1_4,h1_5,h1_6,h1_7,h1_8,h1_9,h1_10,h1_11,h1_12,h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12
 simp only [cycleShape41_0MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cycleIntervalGap41_0MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((35514010828800*x + 568224173260800)*x + 3373831028736000)*x + 8807474685542400)*x + 8949530728857600)*Z + (((((159813048729600*x + 3977569212825600)*x + 37627094473113600)*x + 171177532194816000)*x + 379005523564953600)*x + 340082167696588800))*Z + ((((((324361298903040*x + 10861072361717760)*x + 145561572134092800)*x + 997850480010854400)*x + 3703530971316879360)*x + 7124174497476771840)*x + 5721466957568409600))*Z + (((((((386214867763200*x + 16165977729269760)*x + 281603243727912960)*x + 2636713318101811200)*x + 14300319088587571200)*x + 44977961560587632640)*x + 76516612813923287040)*x + 55597641195375820800))*Z + ((((((((293454332559360*x + 14700993073643520)*x + 315172880960716800)*x + 3765287598025605120)*x + 27334165841722736640)*x + 123215187968450887680)*x + 336939382108952985600)*x + 513932096332030279680)*x + 340877935547567308800))*Z + (((((((((144863605555200*x + 8443087458140160)*x + 214936556635422720)*x + 3129817867223040000)*x + 28657942045183180800)*x + 170691347717176688640)*x + 660151089476382228480)*x + 1598922144519133593600)*x + 2210755642777298534400)*x + 1348575071541343027200))*Z + ((((((((((45134799962112*x + 3000516744314880)*x + 88481620344176640)*x + 1521751580328591360)*x + 16872714584432050176)*x + 125767338837218426880)*x + 636964485076199669760)*x + 2161232749423417098240)*x + 4702430989053289562112)*x + 5947019111410921635840)*x + 3357779469753758515200))*Z + (((((((((((8079982460928*x + 603760628072448)*x + 20255356663234560)*x + 402266742240706560)*x + 5247683931586166784)*x + 47144051528007942144)*x + 297126046196628848640)*x + 1311603480034665431040)*x + 3969528633975184293888)*x + 7845988158840053956608)*x + 9144405680426827776000)*x + 4805446953452027904000))*Z + ((((((((((((634229342208*x + 52662960193536)*x + 1982558282858496)*x + 44705574180126720)*x + 671843704197464064)*x + 7080862405838635008)*x + 53597987738775502848)*x + 293181609919520931840)*x + 1148681605167874326528)*x + 3140946161083157446656)*x + 5691112476661739667456)*x + 6151995105210908835840)*x + 3023635604376619008000))

theorem cycleIntervalGap41_0MCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (cycleShape41_0MCFC (x+Z+6) (0*(x+Z+6)+5+x))*(cycleShape41_0MCFC (x+Z+6) (0*(x+Z+6)+7+x))≤(cycleShape41_0MCFC (x+Z+6) (0*(x+Z+6)+6+x))^2 := by
 apply sub_nonneg.mp
 have he : (cycleShape41_0MCFC (x+Z+6) (0*(x+Z+6)+6+x))^2-(cycleShape41_0MCFC (x+Z+6) (0*(x+Z+6)+5+x))*(cycleShape41_0MCFC (x+Z+6) (0*(x+Z+6)+7+x))=cycleIntervalGap41_0MCFCCert N Z x := by
  unfold cycleIntervalGap41_0MCFCCert cycleShape41_0MCFC
  ring
 rw [he]
 unfold cycleIntervalGap41_0MCFCCert
 positivity
end
end MathGKM.Markov
