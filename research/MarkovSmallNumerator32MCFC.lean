import MarkovCorrectedNumeratorM0A5
import MarkovConvK0B
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallTerm32_0_0MCFC {A : Type*} [CommRing A] (N : A) : A := ((((81*N + 270)*N + 315)*N + 150)*N + 24)

def smallTerm32_0_1MCFC {A : Type*} [CommRing A] (N : A) : A := ((((324*N)*N + (-468))*N + (-288))*N + (-48))

def smallTerm32_0_2MCFC {A : Type*} [CommRing A] (N : A) : A := ((((162*N + (-3996))*N + (-1206))*N + (-888))*N + (-120))

def smallTerm32_0_3MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-972)*N + (-7344))*N + 15444)*N + (-6168))*N + 2112)

def smallTerm32_0_4MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-1377)*N + 3402)*N + 45945)*N + (-50490))*N + 21912)

def smallTerm32_0_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((((648*N + 19008)*N + 25848)*N + (-140640))*N + 98016)

def smallTerm32_0_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((((2268*N + 10584)*N + (-55332))*N + (-157920))*N + 238512)

def smallTerm32_0_7MCFC {A : Type*} [CommRing A] (N : A) : A := ((((648*N + (-12960))*N + (-86040))*N + (-16272))*N + 344640)

def smallTerm32_0_8MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-1377)*N + (-16254))*N + (-22851))*N + 139362)*N + 305832)

def smallTerm32_0_9MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-972)*N + (-1728))*N + 35100)*N + 148800)*N + 165072)

def smallTerm32_0_10MCFC {A : Type*} [CommRing A] (N : A) : A := ((((162*N + 5508)*N + 32058)*N + 68760)*N + 50952)

def smallTerm32_0_11MCFC {A : Type*} [CommRing A] (N : A) : A := ((((324*N + 3024)*N + 10116)*N + 14568)*N + 7680)

def smallTerm32_0_12MCFC {A : Type*} [CommRing A] (N : A) : A := ((((81*N + 486)*N + 1071)*N + 1026)*N + 360)

def smallTerm32_1_2MCFC {A : Type*} [CommRing A] (N : A) : A := (((16*N + (-48))*N + 32)*N)

def smallTerm32_1_3MCFC {A : Type*} [CommRing A] (N : A) : A := (((80*N + (-768))*N + 2128)*N + (-1824))

def smallTerm32_1_4MCFC {A : Type*} [CommRing A] (N : A) : A := (((96*N + (-2880))*N + 15264)*N + (-23616))

def smallTerm32_1_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-128)*N + (-3648))*N + 45056)*N + (-116352))

def smallTerm32_1_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-352)*N + 1248)*N + 63424)*N + (-306240))

def smallTerm32_1_7MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-96)*N + 7488)*N + 29088)*N + (-486720))

def smallTerm32_1_8MCFC {A : Type*} [CommRing A] (N : A) : A := (((320*N + 5952)*N + (-36032))*N + (-489024))

def smallTerm32_1_9MCFC {A : Type*} [CommRing A] (N : A) : A := (((256*N + (-960))*N + (-63616))*N + (-310656))

def smallTerm32_1_10MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-48)*N + (-3888))*N + (-41184))*N + (-119232))

def smallTerm32_1_11MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-112)*N + (-2112))*N + (-12656))*N + (-24480))

def smallTerm32_1_12MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-32)*N + (-384))*N + (-1504))*N + (-1920))

def smallTerm32_2_4MCFC {A : Type*} [CommRing A] (N : A) : A := ((96*N + 864)*N + 1920)

def smallTerm32_2_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((432*N + 5616)*N + 17760)

def smallTerm32_2_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((576*N + 14400)*N + 68928)

def smallTerm32_2_7MCFC {A : Type*} [CommRing A] (N : A) : A := (((-192)*N + 16704)*N + 148224)

def smallTerm32_2_8MCFC {A : Type*} [CommRing A] (N : A) : A := (((-1152)*N + 3456)*N + 194496)

def smallTerm32_2_9MCFC {A : Type*} [CommRing A] (N : A) : A := (((-864)*N + (-13536))*N + 160320)

def smallTerm32_2_10MCFC {A : Type*} [CommRing A] (N : A) : A := ((192*N + (-16704))*N + 81600)

def smallTerm32_2_11MCFC {A : Type*} [CommRing A] (N : A) : A := ((576*N + (-8640))*N + 23808)

def smallTerm32_2_12MCFC {A : Type*} [CommRing A] (N : A) : A := ((288*N + (-2016))*N + 3264)

def smallTerm32_2_13MCFC {A : Type*} [CommRing A] (N : A) : A := ((48*N + (-144))*N + 96)

def smallTerm32_3_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((-72)*N + (-144))

def smallTerm32_3_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((-504)*N + (-1320))

def smallTerm32_3_7MCFC {A : Type*} [CommRing A] (N : A) : A := ((-1440)*N + (-5184))

def smallTerm32_3_8MCFC {A : Type*} [CommRing A] (N : A) : A := ((-2016)*N + (-11424))

def smallTerm32_3_9MCFC {A : Type*} [CommRing A] (N : A) : A := ((-1008)*N + (-15456))

def smallTerm32_3_10MCFC {A : Type*} [CommRing A] (N : A) : A := (1008*N + (-13104))

def smallTerm32_3_11MCFC {A : Type*} [CommRing A] (N : A) : A := (2016*N + (-6720))

def smallTerm32_3_12MCFC {A : Type*} [CommRing A] (N : A) : A := (1440*N + (-1824))

def smallTerm32_3_13MCFC {A : Type*} [CommRing A] (N : A) : A := (504*N + (-144))

def smallTerm32_3_14MCFC {A : Type*} [CommRing A] (N : A) : A := (72*N + 24)

def smallNumerator32MCFC {A : Type*} [CommRing A] (N Z x : A) : A :=
 smallTerm32_0_0MCFC N*Z^0*x^0 + smallTerm32_0_1MCFC N*Z^0*x^1 + smallTerm32_0_2MCFC N*Z^0*x^2 + smallTerm32_0_3MCFC N*Z^0*x^3 + smallTerm32_0_4MCFC N*Z^0*x^4 + smallTerm32_0_5MCFC N*Z^0*x^5 + smallTerm32_0_6MCFC N*Z^0*x^6 + smallTerm32_0_7MCFC N*Z^0*x^7 + smallTerm32_0_8MCFC N*Z^0*x^8 + smallTerm32_0_9MCFC N*Z^0*x^9 + smallTerm32_0_10MCFC N*Z^0*x^10 + smallTerm32_0_11MCFC N*Z^0*x^11 + smallTerm32_0_12MCFC N*Z^0*x^12 + smallTerm32_1_2MCFC N*Z^1*x^2 + smallTerm32_1_3MCFC N*Z^1*x^3 + smallTerm32_1_4MCFC N*Z^1*x^4 + smallTerm32_1_5MCFC N*Z^1*x^5 + smallTerm32_1_6MCFC N*Z^1*x^6 + smallTerm32_1_7MCFC N*Z^1*x^7 + smallTerm32_1_8MCFC N*Z^1*x^8 + smallTerm32_1_9MCFC N*Z^1*x^9 + smallTerm32_1_10MCFC N*Z^1*x^10 + smallTerm32_1_11MCFC N*Z^1*x^11 + smallTerm32_1_12MCFC N*Z^1*x^12 + smallTerm32_2_4MCFC N*Z^2*x^4 + smallTerm32_2_5MCFC N*Z^2*x^5 + smallTerm32_2_6MCFC N*Z^2*x^6 + smallTerm32_2_7MCFC N*Z^2*x^7 + smallTerm32_2_8MCFC N*Z^2*x^8 + smallTerm32_2_9MCFC N*Z^2*x^9 + smallTerm32_2_10MCFC N*Z^2*x^10 + smallTerm32_2_11MCFC N*Z^2*x^11 + smallTerm32_2_12MCFC N*Z^2*x^12 + smallTerm32_2_13MCFC N*Z^2*x^13 + smallTerm32_3_5MCFC N*Z^3*x^5 + smallTerm32_3_6MCFC N*Z^3*x^6 + smallTerm32_3_7MCFC N*Z^3*x^7 + smallTerm32_3_8MCFC N*Z^3*x^8 + smallTerm32_3_9MCFC N*Z^3*x^9 + smallTerm32_3_10MCFC N*Z^3*x^10 + smallTerm32_3_11MCFC N*Z^3*x^11 + smallTerm32_3_12MCFC N*Z^3*x^12 + smallTerm32_3_13MCFC N*Z^3*x^13 + smallTerm32_3_14MCFC N*Z^3*x^14

theorem small_numerator_identity32MCFC {A : Type*} [CommRing A] (N Z x : A) :
 fourthNumeratorBC N Z x 3 2+(-24*(Z^3*x^5)*(1-x)^6*(firstNumBC N Z 3 2 1 x+2*(1+x)*(1-x)^2))=smallNumerator32MCFC N Z x := by
 rw [fourthNumerator_fullFA]
 unfold fullNumeratorFA fourthCountCorrectionFA
 norm_num only [show (2*2-3:ℕ)=1 by decide,show (min (3-2) (3*2-3):ℕ)=1 by decide,show (3*2-2*3:ℕ)=0 by decide]
 norm_num [firstNumBC,secondNumBC,fullH0FA,fullH1FA,fullH2FA,fullH3FA,fullH4FA,runH0n0FA,runH0n1FA,runH0n2FA,runH0n3FA,runH0n4FA,runH1n0FA,runH1n1FA,runH1n2FA,runH1n3FA,smallNumerator32MCFC,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 <;> ring

theorem source_small_numerator32MCFC (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=3) (hr : (frame rest).mid.a=2) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 smallNumerator32MCFC (n:ℤ[X]) (X^n) X := by
 rw [source_corrected_numeratorM0A5,hc,hr]
 unfold correctedFourthNumeratorM0A5 cycleNumeratorCorrectionM0A5
 norm_num only
 have hp : (X:ℤ[X])^(3*(n+1)+2)=(X^n)^3*X^5 := by
  rw [←pow_mul,←pow_add]
  congr 1
  omega
 rw [hp]
 exact small_numerator_identity32MCFC _ _ _

def smallValue32MCFC (n j : ℕ) : ℤ :=
 smallTerm32_0_0MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+0) + smallTerm32_0_1MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+1) + smallTerm32_0_2MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+2) + smallTerm32_0_3MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+3) + smallTerm32_0_4MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+4) + smallTerm32_0_5MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+5) + smallTerm32_0_6MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+6) + smallTerm32_0_7MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+7) + smallTerm32_0_8MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+8) + smallTerm32_0_9MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+9) + smallTerm32_0_10MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+10) + smallTerm32_0_11MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+11) + smallTerm32_0_12MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+12) + smallTerm32_1_2MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+2) + smallTerm32_1_3MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+3) + smallTerm32_1_4MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+4) + smallTerm32_1_5MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+5) + smallTerm32_1_6MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+6) + smallTerm32_1_7MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+7) + smallTerm32_1_8MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+8) + smallTerm32_1_9MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+9) + smallTerm32_1_10MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+10) + smallTerm32_1_11MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+11) + smallTerm32_1_12MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+12) + smallTerm32_2_4MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+4) + smallTerm32_2_5MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+5) + smallTerm32_2_6MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+6) + smallTerm32_2_7MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+7) + smallTerm32_2_8MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+8) + smallTerm32_2_9MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+9) + smallTerm32_2_10MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+10) + smallTerm32_2_11MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+11) + smallTerm32_2_12MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+12) + smallTerm32_2_13MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+13) + smallTerm32_3_5MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+5) + smallTerm32_3_6MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+6) + smallTerm32_3_7MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+7) + smallTerm32_3_8MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+8) + smallTerm32_3_9MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+9) + smallTerm32_3_10MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+10) + smallTerm32_3_11MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+11) + smallTerm32_3_12MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+12) + smallTerm32_3_13MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+13) + smallTerm32_3_14MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+14)

theorem small_numerator_expand32MCFC (n : ℕ) :
 smallNumerator32MCFC (n:ℤ[X]) (X^n) X=
 C (smallTerm32_0_0MCFC (n:ℤ))*X^(0*n+0) + C (smallTerm32_0_1MCFC (n:ℤ))*X^(0*n+1) + C (smallTerm32_0_2MCFC (n:ℤ))*X^(0*n+2) + C (smallTerm32_0_3MCFC (n:ℤ))*X^(0*n+3) + C (smallTerm32_0_4MCFC (n:ℤ))*X^(0*n+4) + C (smallTerm32_0_5MCFC (n:ℤ))*X^(0*n+5) + C (smallTerm32_0_6MCFC (n:ℤ))*X^(0*n+6) + C (smallTerm32_0_7MCFC (n:ℤ))*X^(0*n+7) + C (smallTerm32_0_8MCFC (n:ℤ))*X^(0*n+8) + C (smallTerm32_0_9MCFC (n:ℤ))*X^(0*n+9) + C (smallTerm32_0_10MCFC (n:ℤ))*X^(0*n+10) + C (smallTerm32_0_11MCFC (n:ℤ))*X^(0*n+11) + C (smallTerm32_0_12MCFC (n:ℤ))*X^(0*n+12) + C (smallTerm32_1_2MCFC (n:ℤ))*X^(1*n+2) + C (smallTerm32_1_3MCFC (n:ℤ))*X^(1*n+3) + C (smallTerm32_1_4MCFC (n:ℤ))*X^(1*n+4) + C (smallTerm32_1_5MCFC (n:ℤ))*X^(1*n+5) + C (smallTerm32_1_6MCFC (n:ℤ))*X^(1*n+6) + C (smallTerm32_1_7MCFC (n:ℤ))*X^(1*n+7) + C (smallTerm32_1_8MCFC (n:ℤ))*X^(1*n+8) + C (smallTerm32_1_9MCFC (n:ℤ))*X^(1*n+9) + C (smallTerm32_1_10MCFC (n:ℤ))*X^(1*n+10) + C (smallTerm32_1_11MCFC (n:ℤ))*X^(1*n+11) + C (smallTerm32_1_12MCFC (n:ℤ))*X^(1*n+12) + C (smallTerm32_2_4MCFC (n:ℤ))*X^(2*n+4) + C (smallTerm32_2_5MCFC (n:ℤ))*X^(2*n+5) + C (smallTerm32_2_6MCFC (n:ℤ))*X^(2*n+6) + C (smallTerm32_2_7MCFC (n:ℤ))*X^(2*n+7) + C (smallTerm32_2_8MCFC (n:ℤ))*X^(2*n+8) + C (smallTerm32_2_9MCFC (n:ℤ))*X^(2*n+9) + C (smallTerm32_2_10MCFC (n:ℤ))*X^(2*n+10) + C (smallTerm32_2_11MCFC (n:ℤ))*X^(2*n+11) + C (smallTerm32_2_12MCFC (n:ℤ))*X^(2*n+12) + C (smallTerm32_2_13MCFC (n:ℤ))*X^(2*n+13) + C (smallTerm32_3_5MCFC (n:ℤ))*X^(3*n+5) + C (smallTerm32_3_6MCFC (n:ℤ))*X^(3*n+6) + C (smallTerm32_3_7MCFC (n:ℤ))*X^(3*n+7) + C (smallTerm32_3_8MCFC (n:ℤ))*X^(3*n+8) + C (smallTerm32_3_9MCFC (n:ℤ))*X^(3*n+9) + C (smallTerm32_3_10MCFC (n:ℤ))*X^(3*n+10) + C (smallTerm32_3_11MCFC (n:ℤ))*X^(3*n+11) + C (smallTerm32_3_12MCFC (n:ℤ))*X^(3*n+12) + C (smallTerm32_3_13MCFC (n:ℤ))*X^(3*n+13) + C (smallTerm32_3_14MCFC (n:ℤ))*X^(3*n+14) := by
 unfold smallNumerator32MCFC smallTerm32_0_0MCFC smallTerm32_0_1MCFC smallTerm32_0_2MCFC smallTerm32_0_3MCFC smallTerm32_0_4MCFC smallTerm32_0_5MCFC smallTerm32_0_6MCFC smallTerm32_0_7MCFC smallTerm32_0_8MCFC smallTerm32_0_9MCFC smallTerm32_0_10MCFC smallTerm32_0_11MCFC smallTerm32_0_12MCFC smallTerm32_1_2MCFC smallTerm32_1_3MCFC smallTerm32_1_4MCFC smallTerm32_1_5MCFC smallTerm32_1_6MCFC smallTerm32_1_7MCFC smallTerm32_1_8MCFC smallTerm32_1_9MCFC smallTerm32_1_10MCFC smallTerm32_1_11MCFC smallTerm32_1_12MCFC smallTerm32_2_4MCFC smallTerm32_2_5MCFC smallTerm32_2_6MCFC smallTerm32_2_7MCFC smallTerm32_2_8MCFC smallTerm32_2_9MCFC smallTerm32_2_10MCFC smallTerm32_2_11MCFC smallTerm32_2_12MCFC smallTerm32_2_13MCFC smallTerm32_3_5MCFC smallTerm32_3_6MCFC smallTerm32_3_7MCFC smallTerm32_3_8MCFC smallTerm32_3_9MCFC smallTerm32_3_10MCFC smallTerm32_3_11MCFC smallTerm32_3_12MCFC smallTerm32_3_13MCFC smallTerm32_3_14MCFC
 simp only [map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_natCast,pow_add,pow_mul]
 ring

theorem source_small_value32MCFC (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=3) (hr : (frame rest).mid.a=2) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=smallValue32MCFC n j := by
 have h := coeff_of_one_sub_mul_rangeBC _ _ 7 j (source_small_numerator32MCFC n rest hc hr)
 simp only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs] at h
 change _=convSevenK0B (smallNumerator32MCFC (n:ℤ[X]) (X^n) X) j at h
 rw [small_numerator_expand32MCFC] at h
 simpa only [convSeven_addK0B,convSeven_monomialK0B,smallValue32MCFC,source_cut_coeffA27 _ i j 4 hs] using h
end
end MathGKM.Markov
