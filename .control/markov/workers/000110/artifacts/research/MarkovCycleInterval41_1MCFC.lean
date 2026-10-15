import MarkovSmallNumerator41MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cycleShape41_1MCFC (N x : ℤ) : ℤ := (((((((2531328*N + ((-13526016)*x + 40341504))*N + ((30320640*x + (-182149632))*x + 309458688))*N + ((((-33438720)*x + 314334720)*x + (-1085710080))*x + 1356539520))*N + ((((20213760*x + (-262026240))*x + 1394695680)*x + (-3543052800))*x + 3580104192))*N + ((((((-6902784)*x + 114508800)*x + (-830215680))*x + 3222455040)*x + (-6604577280))*x + 5665005696))*N + ((((((1257984*x + (-25449984))*x + 234205440)*x + (-1229652480))*x + 3830486016)*x + (-6646101504))*x + 4981410432))*N + ((((((((-95616)*x + 2282112)*x + (-25474176))*x + 168940800)*x + (-708833664))*x + 1862719488)*x + (-2817345024))*x + 1880988480))

theorem cycleShape41_1MCFC_value (n j : ℕ) (hn : 7≤n) (hl : 1*n+5≤j) (hu : j<(2)*n+3) :
 5040*smallValue41MCFC n (j)=16*cycleShape41_1MCFC n j := by
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
 rw [h2_3,h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h3_4,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h4_5,h4_6,h4_7,h4_8,h4_9,h4_10,h4_11,h4_12,h4_13]
 linear_combination (norm := skip) (smallTerm41_0_0MCFC (n:ℤ))*h0_0 + (smallTerm41_0_1MCFC (n:ℤ))*h0_1 + (smallTerm41_0_2MCFC (n:ℤ))*h0_2 + (smallTerm41_0_3MCFC (n:ℤ))*h0_3 + (smallTerm41_0_4MCFC (n:ℤ))*h0_4 + (smallTerm41_0_5MCFC (n:ℤ))*h0_5 + (smallTerm41_0_6MCFC (n:ℤ))*h0_6 + (smallTerm41_0_7MCFC (n:ℤ))*h0_7 + (smallTerm41_0_8MCFC (n:ℤ))*h0_8 + (smallTerm41_0_9MCFC (n:ℤ))*h0_9 + (smallTerm41_0_10MCFC (n:ℤ))*h0_10 + (smallTerm41_0_11MCFC (n:ℤ))*h0_11 + (smallTerm41_0_12MCFC (n:ℤ))*h0_12 + (smallTerm41_1_2MCFC (n:ℤ))*h1_2 + (smallTerm41_1_3MCFC (n:ℤ))*h1_3 + (smallTerm41_1_4MCFC (n:ℤ))*h1_4 + (smallTerm41_1_5MCFC (n:ℤ))*h1_5 + (smallTerm41_1_6MCFC (n:ℤ))*h1_6 + (smallTerm41_1_7MCFC (n:ℤ))*h1_7 + (smallTerm41_1_8MCFC (n:ℤ))*h1_8 + (smallTerm41_1_9MCFC (n:ℤ))*h1_9 + (smallTerm41_1_10MCFC (n:ℤ))*h1_10 + (smallTerm41_1_11MCFC (n:ℤ))*h1_11 + (smallTerm41_1_12MCFC (n:ℤ))*h1_12
 simp only [cycleShape41_1MCFC,fallingSevenK0B,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 push_cast
 ring

def cycleIntervalGap41_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((634229342208*Z + (7141521752064*x + 42236825960448))*Z + ((32950813851648*x + 410572138217472)*x + 1239063306485760))*Z + (((85282015150080*x + 1655269994004480)*x + 10463461082726400)*x + 21408194340126720))*Z + ((((141019557396480*x + 3752099587031040)*x + 36800605147299840)*x + 156996533256192000)*x + 244371235685842944))*Z + (((((158041311805440*x + 5388562464768000)*x + 72400534255042560)*x + 478184100034314240)*x + 1546945855065096192)*x + 1950738647282417664))*Z + ((((((124189212672000*x + 5187412603699200)*x + 89203312785162240)*x + 806357052142387200)*x + 4032234513064525824)*x + 10542224750884356096)*x + 11205908627181649920))*Z + (((((((69681779048448*x + 3448098663432192)*x + 72514717831987200)*x + 837749931881103360)*x + 5727169642747133952)*x + 23113648279927554048)*x + 50837212429444546560)*x + 46809222686634885120))*Z + ((((((((27991065231360*x + 1598789934120960)*x + 39764563075399680)*x + 560889486540472320)*x + 4893266764513935360)*x + 26964374605288243200)*x + 91425175918281031680)*x + 173881266471807713280)*x + 141467687479861198848))*Z + (((((((((7911380090880*x + 511318519971840)*x + 14661017516113920)*x + 244213531284602880)*x + 2597296050867732480)*x + 18238036344984207360)*x + 84324014266896875520)*x + 246902812519164641280)*x + 414255559141309906944)*x + 302317730975065817088))*Z + ((((((((((1499436417024*x + 108067034234880)*x + 3504173839810560)*x + 67229605964021760)*x + 843381624659116032)*x + 7210009526274293760)*x + 42422080722016665600)*x + 169165934462544445440)*x + 436400263596310659072)*x + 655794968360285601792)*x + 434381894353700536320))*Z + (((((((((((171228266496*x + 13618592612352)*x + 492448233553920)*x + 10681503158108160)*x + 154240515711959040)*x + 1553928029035167744)*x + 11119014469986877440)*x + 56358219502283489280)*x + 197771456562000297984)*x + 456405781431555293184)*x + 621645864278664314880)*x + 377285797497645711360))*Z + ((((((((((((8918138880*x + 775878082560)*x + 30959765028864)*x + 748863553536000)*x + 12223399763312640)*x + 141690995154616320)*x + 1193988161271693312)*x + 7353290755833200640)*x + 32765451754126049280)*x + 102748769535293521920)*x + 214679227908118708224)*x + 267582946741310914560)*x + 149966235241043558400))

theorem cycleIntervalGap41_1MCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (cycleShape41_1MCFC (x+Z+5) (1*(x+Z+5)+5+x))*(cycleShape41_1MCFC (x+Z+5) (1*(x+Z+5)+7+x))≤(cycleShape41_1MCFC (x+Z+5) (1*(x+Z+5)+6+x))^2 := by
 apply sub_nonneg.mp
 have he : (cycleShape41_1MCFC (x+Z+5) (1*(x+Z+5)+6+x))^2-(cycleShape41_1MCFC (x+Z+5) (1*(x+Z+5)+5+x))*(cycleShape41_1MCFC (x+Z+5) (1*(x+Z+5)+7+x))=cycleIntervalGap41_1MCFCCert N Z x := by
  unfold cycleIntervalGap41_1MCFCCert cycleShape41_1MCFC
  ring
 rw [he]
 unfold cycleIntervalGap41_1MCFCCert
 positivity
end
end MathGKM.Markov
