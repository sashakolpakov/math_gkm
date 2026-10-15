import MarkovCorrectedNumeratorM0A5
import MarkovConvK0B
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallTerm31_0_0MCFC {A : Type*} [CommRing A] (N : A) : A := ((((81*N + 162)*N + 99)*N + 18)*N)

def smallTerm31_0_1MCFC {A : Type*} [CommRing A] (N : A) : A := ((((324*N + (-432))*N + (-252))*N + (-24))*N)

def smallTerm31_0_2MCFC {A : Type*} [CommRing A] (N : A) : A := ((((162*N + (-4212))*N + 2898)*N + (-1440))*N + 192)

def smallTerm31_0_3MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-972)*N + (-6048))*N + 22140)*N + (-18768))*N + 6144)

def smallTerm31_0_4MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-1377)*N + 5238)*N + 41625)*N + (-79782))*N + 43704)

def smallTerm31_0_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((((648*N + 18144)*N + 7272)*N + (-151632))*N + 147072)

def smallTerm31_0_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((((2268*N + 7560)*N + (-64404))*N + (-117840))*N + 284640)

def smallTerm31_0_7MCFC {A : Type*} [CommRing A] (N : A) : A := ((((648*N + (-13824))*N + (-72648))*N + 36672)*N + 340992)

def smallTerm31_0_8MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-1377)*N + (-14418))*N + (-7515))*N + 149382)*N + 257424)

def smallTerm31_0_9MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-972)*N + (-432))*N + 36180)*N + 124968)*N + 119424)

def smallTerm31_0_10MCFC {A : Type*} [CommRing A] (N : A) : A := ((((162*N + 5292)*N + 26658)*N + 49200)*N + 31392)

def smallTerm31_0_11MCFC {A : Type*} [CommRing A] (N : A) : A := ((((324*N + 2592)*N + 7308)*N + 8784)*N + 3840)

def smallTerm31_0_12MCFC {A : Type*} [CommRing A] (N : A) : A := ((((81*N + 378)*N + 639)*N + 462)*N + 120)

def smallTerm31_1_2MCFC {A : Type*} [CommRing A] (N : A) : A := (((32*N + (-192))*N + 352)*N + (-192))

def smallTerm31_1_3MCFC {A : Type*} [CommRing A] (N : A) : A := (((112*N + (-1440))*N + 5552)*N + (-6720))

def smallTerm31_1_4MCFC {A : Type*} [CommRing A] (N : A) : A := (((48*N + (-3600))*N + 26208)*N + (-52032))

def smallTerm31_1_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-256)*N + (-2496))*N + 56704)*N + (-189312))

def smallTerm31_1_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-320)*N + 4032)*N + 56000)*N + (-395712))

def smallTerm31_1_7MCFC {A : Type*} [CommRing A] (N : A) : A := (((96*N + 8064)*N + 2016)*N + (-514176))

def smallTerm31_1_8MCFC {A : Type*} [CommRing A] (N : A) : A := (((352*N + 3360)*N + (-54208))*N + (-425280))

def smallTerm31_1_9MCFC {A : Type*} [CommRing A] (N : A) : A := (((128*N + (-2880))*N + (-58112))*N + (-220032))

def smallTerm31_1_10MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-96)*N + (-3456))*N + (-27936))*N + (-66432))

def smallTerm31_1_11MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-80)*N + (-1248))*N + (-6160))*N + (-9792))

def smallTerm31_1_12MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-16)*N + (-144))*N + (-416))*N + (-384))

def smallTerm31_2_3MCFC {A : Type*} [CommRing A] (N : A) : A := ((48*N + 336)*N + 576)

def smallTerm31_2_4MCFC {A : Type*} [CommRing A] (N : A) : A := ((288*N + 3168)*N + 8448)

def smallTerm31_2_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((576*N + 10944)*N + 43392)

def smallTerm31_2_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((192*N + 17472)*N + 115776)

def smallTerm31_2_7MCFC {A : Type*} [CommRing A] (N : A) : A := (((-864)*N + 10080)*N + 183936)

def smallTerm31_2_8MCFC {A : Type*} [CommRing A] (N : A) : A := (((-1152)*N + (-8064))*N + 182976)

def smallTerm31_2_9MCFC {A : Type*} [CommRing A] (N : A) : A := (((-192)*N + (-17472))*N + 114048)

def smallTerm31_2_10MCFC {A : Type*} [CommRing A] (N : A) : A := ((576*N + (-12096))*N + 42432)

def smallTerm31_2_11MCFC {A : Type*} [CommRing A] (N : A) : A := ((432*N + (-3888))*N + 8256)

def smallTerm31_2_12MCFC {A : Type*} [CommRing A] (N : A) : A := ((96*N + (-480))*N + 576)

def smallTerm31_3_4MCFC {A : Type*} [CommRing A] (N : A) : A := ((-72)*N + (-120))

def smallTerm31_3_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((-504)*N + (-1152))

def smallTerm31_3_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((-1440)*N + (-4704))

def smallTerm31_3_7MCFC {A : Type*} [CommRing A] (N : A) : A := ((-2016)*N + (-10752))

def smallTerm31_3_8MCFC {A : Type*} [CommRing A] (N : A) : A := ((-1008)*N + (-15120))

def smallTerm31_3_9MCFC {A : Type*} [CommRing A] (N : A) : A := (1008*N + (-13440))

def smallTerm31_3_10MCFC {A : Type*} [CommRing A] (N : A) : A := (2016*N + (-7392))

def smallTerm31_3_11MCFC {A : Type*} [CommRing A] (N : A) : A := (1440*N + (-2304))

def smallTerm31_3_12MCFC {A : Type*} [CommRing A] (N : A) : A := (504*N + (-312))

def smallTerm31_3_13MCFC {A : Type*} [CommRing A] (N : A) : A := (72*N)

def smallNumerator31MCFC {A : Type*} [CommRing A] (N Z x : A) : A :=
 smallTerm31_0_0MCFC N*Z^0*x^0 + smallTerm31_0_1MCFC N*Z^0*x^1 + smallTerm31_0_2MCFC N*Z^0*x^2 + smallTerm31_0_3MCFC N*Z^0*x^3 + smallTerm31_0_4MCFC N*Z^0*x^4 + smallTerm31_0_5MCFC N*Z^0*x^5 + smallTerm31_0_6MCFC N*Z^0*x^6 + smallTerm31_0_7MCFC N*Z^0*x^7 + smallTerm31_0_8MCFC N*Z^0*x^8 + smallTerm31_0_9MCFC N*Z^0*x^9 + smallTerm31_0_10MCFC N*Z^0*x^10 + smallTerm31_0_11MCFC N*Z^0*x^11 + smallTerm31_0_12MCFC N*Z^0*x^12 + smallTerm31_1_2MCFC N*Z^1*x^2 + smallTerm31_1_3MCFC N*Z^1*x^3 + smallTerm31_1_4MCFC N*Z^1*x^4 + smallTerm31_1_5MCFC N*Z^1*x^5 + smallTerm31_1_6MCFC N*Z^1*x^6 + smallTerm31_1_7MCFC N*Z^1*x^7 + smallTerm31_1_8MCFC N*Z^1*x^8 + smallTerm31_1_9MCFC N*Z^1*x^9 + smallTerm31_1_10MCFC N*Z^1*x^10 + smallTerm31_1_11MCFC N*Z^1*x^11 + smallTerm31_1_12MCFC N*Z^1*x^12 + smallTerm31_2_3MCFC N*Z^2*x^3 + smallTerm31_2_4MCFC N*Z^2*x^4 + smallTerm31_2_5MCFC N*Z^2*x^5 + smallTerm31_2_6MCFC N*Z^2*x^6 + smallTerm31_2_7MCFC N*Z^2*x^7 + smallTerm31_2_8MCFC N*Z^2*x^8 + smallTerm31_2_9MCFC N*Z^2*x^9 + smallTerm31_2_10MCFC N*Z^2*x^10 + smallTerm31_2_11MCFC N*Z^2*x^11 + smallTerm31_2_12MCFC N*Z^2*x^12 + smallTerm31_3_4MCFC N*Z^3*x^4 + smallTerm31_3_5MCFC N*Z^3*x^5 + smallTerm31_3_6MCFC N*Z^3*x^6 + smallTerm31_3_7MCFC N*Z^3*x^7 + smallTerm31_3_8MCFC N*Z^3*x^8 + smallTerm31_3_9MCFC N*Z^3*x^9 + smallTerm31_3_10MCFC N*Z^3*x^10 + smallTerm31_3_11MCFC N*Z^3*x^11 + smallTerm31_3_12MCFC N*Z^3*x^12 + smallTerm31_3_13MCFC N*Z^3*x^13

theorem small_numerator_identity31MCFC {A : Type*} [CommRing A] (N Z x : A) :
 fourthNumeratorBC N Z x 3 1+(-24*(Z^3*x^4)*(1-x)^6*(firstNumBC N Z 3 1 0 x+2*(1+x)*(1-x)^2))=smallNumerator31MCFC N Z x := by
 rw [fourthNumerator_fullFA]
 unfold fullNumeratorFA fourthCountCorrectionFA
 norm_num only [show (2*1-3:ℕ)=0 by decide,show (min (3-1) (3*1-3):ℕ)=0 by decide,show (3*1-2*3:ℕ)=0 by decide]
 norm_num [firstNumBC,secondNumBC,fullH0FA,fullH1FA,fullH2FA,fullH3FA,fullH4FA,runH0n0FA,runH0n1FA,runH0n2FA,runH0n3FA,runH0n4FA,runH1n0FA,runH1n1FA,runH1n2FA,runH1n3FA,smallNumerator31MCFC,smallTerm31_0_0MCFC,smallTerm31_0_1MCFC,smallTerm31_0_2MCFC,smallTerm31_0_3MCFC,smallTerm31_0_4MCFC,smallTerm31_0_5MCFC,smallTerm31_0_6MCFC,smallTerm31_0_7MCFC,smallTerm31_0_8MCFC,smallTerm31_0_9MCFC,smallTerm31_0_10MCFC,smallTerm31_0_11MCFC,smallTerm31_0_12MCFC,smallTerm31_1_2MCFC,smallTerm31_1_3MCFC,smallTerm31_1_4MCFC,smallTerm31_1_5MCFC,smallTerm31_1_6MCFC,smallTerm31_1_7MCFC,smallTerm31_1_8MCFC,smallTerm31_1_9MCFC,smallTerm31_1_10MCFC,smallTerm31_1_11MCFC,smallTerm31_1_12MCFC,smallTerm31_2_3MCFC,smallTerm31_2_4MCFC,smallTerm31_2_5MCFC,smallTerm31_2_6MCFC,smallTerm31_2_7MCFC,smallTerm31_2_8MCFC,smallTerm31_2_9MCFC,smallTerm31_2_10MCFC,smallTerm31_2_11MCFC,smallTerm31_2_12MCFC,smallTerm31_3_4MCFC,smallTerm31_3_5MCFC,smallTerm31_3_6MCFC,smallTerm31_3_7MCFC,smallTerm31_3_8MCFC,smallTerm31_3_9MCFC,smallTerm31_3_10MCFC,smallTerm31_3_11MCFC,smallTerm31_3_12MCFC,smallTerm31_3_13MCFC]
 <;> ring

theorem source_small_numerator31MCFC (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=3) (hr : (frame rest).mid.a=1) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 smallNumerator31MCFC (n:ℤ[X]) (X^n) X := by
 rw [source_corrected_numeratorM0A5,hc,hr]
 unfold correctedFourthNumeratorM0A5 cycleNumeratorCorrectionM0A5
 norm_num only
 have hp : (X:ℤ[X])^(3*(n+1)+1)=(X^n)^3*X^4 := by
  rw [←pow_mul,←pow_add]
  congr 1
  omega
 rw [hp]
 exact small_numerator_identity31MCFC _ _ _

def smallValue31MCFC (n j : ℕ) : ℤ :=
 smallTerm31_0_0MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+0) + smallTerm31_0_1MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+1) + smallTerm31_0_2MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+2) + smallTerm31_0_3MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+3) + smallTerm31_0_4MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+4) + smallTerm31_0_5MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+5) + smallTerm31_0_6MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+6) + smallTerm31_0_7MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+7) + smallTerm31_0_8MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+8) + smallTerm31_0_9MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+9) + smallTerm31_0_10MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+10) + smallTerm31_0_11MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+11) + smallTerm31_0_12MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+12) + smallTerm31_1_2MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+2) + smallTerm31_1_3MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+3) + smallTerm31_1_4MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+4) + smallTerm31_1_5MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+5) + smallTerm31_1_6MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+6) + smallTerm31_1_7MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+7) + smallTerm31_1_8MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+8) + smallTerm31_1_9MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+9) + smallTerm31_1_10MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+10) + smallTerm31_1_11MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+11) + smallTerm31_1_12MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+12) + smallTerm31_2_3MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+3) + smallTerm31_2_4MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+4) + smallTerm31_2_5MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+5) + smallTerm31_2_6MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+6) + smallTerm31_2_7MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+7) + smallTerm31_2_8MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+8) + smallTerm31_2_9MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+9) + smallTerm31_2_10MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+10) + smallTerm31_2_11MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+11) + smallTerm31_2_12MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+12) + smallTerm31_3_4MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+4) + smallTerm31_3_5MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+5) + smallTerm31_3_6MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+6) + smallTerm31_3_7MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+7) + smallTerm31_3_8MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+8) + smallTerm31_3_9MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+9) + smallTerm31_3_10MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+10) + smallTerm31_3_11MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+11) + smallTerm31_3_12MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+12) + smallTerm31_3_13MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+13)

theorem small_numerator_expand31MCFC (n : ℕ) :
 smallNumerator31MCFC (n:ℤ[X]) (X^n) X=
 C (smallTerm31_0_0MCFC (n:ℤ))*X^(0*n+0) + C (smallTerm31_0_1MCFC (n:ℤ))*X^(0*n+1) + C (smallTerm31_0_2MCFC (n:ℤ))*X^(0*n+2) + C (smallTerm31_0_3MCFC (n:ℤ))*X^(0*n+3) + C (smallTerm31_0_4MCFC (n:ℤ))*X^(0*n+4) + C (smallTerm31_0_5MCFC (n:ℤ))*X^(0*n+5) + C (smallTerm31_0_6MCFC (n:ℤ))*X^(0*n+6) + C (smallTerm31_0_7MCFC (n:ℤ))*X^(0*n+7) + C (smallTerm31_0_8MCFC (n:ℤ))*X^(0*n+8) + C (smallTerm31_0_9MCFC (n:ℤ))*X^(0*n+9) + C (smallTerm31_0_10MCFC (n:ℤ))*X^(0*n+10) + C (smallTerm31_0_11MCFC (n:ℤ))*X^(0*n+11) + C (smallTerm31_0_12MCFC (n:ℤ))*X^(0*n+12) + C (smallTerm31_1_2MCFC (n:ℤ))*X^(1*n+2) + C (smallTerm31_1_3MCFC (n:ℤ))*X^(1*n+3) + C (smallTerm31_1_4MCFC (n:ℤ))*X^(1*n+4) + C (smallTerm31_1_5MCFC (n:ℤ))*X^(1*n+5) + C (smallTerm31_1_6MCFC (n:ℤ))*X^(1*n+6) + C (smallTerm31_1_7MCFC (n:ℤ))*X^(1*n+7) + C (smallTerm31_1_8MCFC (n:ℤ))*X^(1*n+8) + C (smallTerm31_1_9MCFC (n:ℤ))*X^(1*n+9) + C (smallTerm31_1_10MCFC (n:ℤ))*X^(1*n+10) + C (smallTerm31_1_11MCFC (n:ℤ))*X^(1*n+11) + C (smallTerm31_1_12MCFC (n:ℤ))*X^(1*n+12) + C (smallTerm31_2_3MCFC (n:ℤ))*X^(2*n+3) + C (smallTerm31_2_4MCFC (n:ℤ))*X^(2*n+4) + C (smallTerm31_2_5MCFC (n:ℤ))*X^(2*n+5) + C (smallTerm31_2_6MCFC (n:ℤ))*X^(2*n+6) + C (smallTerm31_2_7MCFC (n:ℤ))*X^(2*n+7) + C (smallTerm31_2_8MCFC (n:ℤ))*X^(2*n+8) + C (smallTerm31_2_9MCFC (n:ℤ))*X^(2*n+9) + C (smallTerm31_2_10MCFC (n:ℤ))*X^(2*n+10) + C (smallTerm31_2_11MCFC (n:ℤ))*X^(2*n+11) + C (smallTerm31_2_12MCFC (n:ℤ))*X^(2*n+12) + C (smallTerm31_3_4MCFC (n:ℤ))*X^(3*n+4) + C (smallTerm31_3_5MCFC (n:ℤ))*X^(3*n+5) + C (smallTerm31_3_6MCFC (n:ℤ))*X^(3*n+6) + C (smallTerm31_3_7MCFC (n:ℤ))*X^(3*n+7) + C (smallTerm31_3_8MCFC (n:ℤ))*X^(3*n+8) + C (smallTerm31_3_9MCFC (n:ℤ))*X^(3*n+9) + C (smallTerm31_3_10MCFC (n:ℤ))*X^(3*n+10) + C (smallTerm31_3_11MCFC (n:ℤ))*X^(3*n+11) + C (smallTerm31_3_12MCFC (n:ℤ))*X^(3*n+12) + C (smallTerm31_3_13MCFC (n:ℤ))*X^(3*n+13) := by
 unfold smallNumerator31MCFC smallTerm31_0_0MCFC smallTerm31_0_1MCFC smallTerm31_0_2MCFC smallTerm31_0_3MCFC smallTerm31_0_4MCFC smallTerm31_0_5MCFC smallTerm31_0_6MCFC smallTerm31_0_7MCFC smallTerm31_0_8MCFC smallTerm31_0_9MCFC smallTerm31_0_10MCFC smallTerm31_0_11MCFC smallTerm31_0_12MCFC smallTerm31_1_2MCFC smallTerm31_1_3MCFC smallTerm31_1_4MCFC smallTerm31_1_5MCFC smallTerm31_1_6MCFC smallTerm31_1_7MCFC smallTerm31_1_8MCFC smallTerm31_1_9MCFC smallTerm31_1_10MCFC smallTerm31_1_11MCFC smallTerm31_1_12MCFC smallTerm31_2_3MCFC smallTerm31_2_4MCFC smallTerm31_2_5MCFC smallTerm31_2_6MCFC smallTerm31_2_7MCFC smallTerm31_2_8MCFC smallTerm31_2_9MCFC smallTerm31_2_10MCFC smallTerm31_2_11MCFC smallTerm31_2_12MCFC smallTerm31_3_4MCFC smallTerm31_3_5MCFC smallTerm31_3_6MCFC smallTerm31_3_7MCFC smallTerm31_3_8MCFC smallTerm31_3_9MCFC smallTerm31_3_10MCFC smallTerm31_3_11MCFC smallTerm31_3_12MCFC smallTerm31_3_13MCFC
 simp only [map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_natCast,pow_add,pow_mul]
 ring

theorem source_small_value31MCFC (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=3) (hr : (frame rest).mid.a=1) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=smallValue31MCFC n j := by
 have h := coeff_of_one_sub_mul_rangeBC _ _ 7 j (source_small_numerator31MCFC n rest hc hr)
 simp only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs] at h
 change _=convSevenK0B (smallNumerator31MCFC (n:ℤ[X]) (X^n) X) j at h
 rw [small_numerator_expand31MCFC] at h
 simpa only [convSeven_addK0B,convSeven_monomialK0B,smallValue31MCFC,source_cut_coeffA27 _ i j 4 hs] using h
end
end MathGKM.Markov
