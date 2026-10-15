import MarkovCorrectedNumeratorM0A5
import MarkovConvK0B
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallTerm41_0_0MCFC {A : Type*} [CommRing A] (N : A) : A := ((((256*N + 640)*N + 560)*N + 200)*N + 24)

def smallTerm41_0_1MCFC {A : Type*} [CommRing A] (N : A) : A := ((((1024*N + (-768))*N + (-1600))*N + (-624))*N + (-72))

def smallTerm41_0_2MCFC {A : Type*} [CommRing A] (N : A) : A := ((((512*N + (-12288))*N + 1696)*N + (-720))*N + (-48))

def smallTerm41_0_3MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-3072)*N + (-18688))*N + 52800)*N + (-23120))*N + 5328)

def smallTerm41_0_4MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-4352)*N + 14976)*N + 114704)*N + (-151848))*N + 56328)

def smallTerm41_0_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((((2048*N + 53760)*N + 25984)*N + (-338016))*N + 233616)

def smallTerm41_0_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((((7168*N + 21504)*N + (-170560))*N + (-280032))*N + 503328)

def smallTerm41_0_7MCFC {A : Type*} [CommRing A] (N : A) : A := ((((2048*N + (-41472))*N + (-188288))*N + 80736)*N + 628032)

def smallTerm41_0_8MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-4352)*N + (-41088))*N + (-11440))*N + 336120)*N + 469608)

def smallTerm41_0_9MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-3072)*N + 256)*N + 95424)*N + 266192)*N + 206328)

def smallTerm41_0_10MCFC {A : Type*} [CommRing A] (N : A) : A := ((((512*N + 15360)*N + 63904)*N + 95664)*N + 48912)

def smallTerm41_0_11MCFC {A : Type*} [CommRing A] (N : A) : A := ((((1024*N + 6912)*N + 15680)*N + 14832)*N + 5040)

def smallTerm41_0_12MCFC {A : Type*} [CommRing A] (N : A) : A := ((((256*N + 896)*N + 1136)*N + 616)*N + 120)

def smallTerm41_1_2MCFC {A : Type*} [CommRing A] (N : A) : A := (((384*N + (-576))*N + 192)*N)

def smallTerm41_1_3MCFC {A : Type*} [CommRing A] (N : A) : A := (((1280*N + (-8064))*N + 12352)*N + (-5568))

def smallTerm41_1_4MCFC {A : Type*} [CommRing A] (N : A) : A := (((384*N + (-24384))*N + 80832)*N + (-71232))

def smallTerm41_1_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-3072)*N + (-18432))*N + 205824)*N + (-326208))

def smallTerm41_1_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-3328)*N + 28032)*N + 222592)*N + (-769728))

def smallTerm41_1_7MCFC {A : Type*} [CommRing A] (N : A) : A := (((1536*N + 54528)*N + 13440)*N + (-1059264))

def smallTerm41_1_8MCFC {A : Type*} [CommRing A] (N : A) : A := (((3840*N + 18816)*N + (-210048))*N + (-883008))

def smallTerm41_1_9MCFC {A : Type*} [CommRing A] (N : A) : A := (((1024*N + (-21504))*N + (-214528))*N + (-437952))

def smallTerm41_1_10MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-1152)*N + (-21312))*N + (-92736))*N + (-118848))

def smallTerm41_1_11MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-768)*N + (-6528))*N + (-17088))*N + (-14208))

def smallTerm41_1_12MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-128)*N + (-576))*N + (-832))*N + (-384))

def smallTerm41_2_3MCFC {A : Type*} [CommRing A] (N : A) : A := 576

def smallTerm41_2_4MCFC {A : Type*} [CommRing A] (N : A) : A := 15168

def smallTerm41_2_5MCFC {A : Type*} [CommRing A] (N : A) : A := 96768

def smallTerm41_2_6MCFC {A : Type*} [CommRing A] (N : A) : A := 288768

def smallTerm41_2_7MCFC {A : Type*} [CommRing A] (N : A) : A := 483456

def smallTerm41_2_8MCFC {A : Type*} [CommRing A] (N : A) : A := 483456

def smallTerm41_2_9MCFC {A : Type*} [CommRing A] (N : A) : A := 288768

def smallTerm41_2_10MCFC {A : Type*} [CommRing A] (N : A) : A := 96768

def smallTerm41_2_11MCFC {A : Type*} [CommRing A] (N : A) : A := 15168

def smallTerm41_2_12MCFC {A : Type*} [CommRing A] (N : A) : A := 576

def smallTerm41_3_4MCFC {A : Type*} [CommRing A] (N : A) : A := ((-192)*N + (-384))

def smallTerm41_3_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((-1536)*N + (-4800))

def smallTerm41_3_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((-4608)*N + (-22080))

def smallTerm41_3_7MCFC {A : Type*} [CommRing A] (N : A) : A := ((-6144)*N + (-52416))

def smallTerm41_3_8MCFC {A : Type*} [CommRing A] (N : A) : A := ((-1920)*N + (-72000))

def smallTerm41_3_9MCFC {A : Type*} [CommRing A] (N : A) : A := (4608*N + (-58944))

def smallTerm41_3_10MCFC {A : Type*} [CommRing A] (N : A) : A := (6144*N + (-27840))

def smallTerm41_3_11MCFC {A : Type*} [CommRing A] (N : A) : A := (3072*N + (-6720))

def smallTerm41_3_12MCFC {A : Type*} [CommRing A] (N : A) : A := (576*N + (-576))

def smallTerm41_4_5MCFC {A : Type*} [CommRing A] (N : A) : A := 24

def smallTerm41_4_6MCFC {A : Type*} [CommRing A] (N : A) : A := 192

def smallTerm41_4_7MCFC {A : Type*} [CommRing A] (N : A) : A := 672

def smallTerm41_4_8MCFC {A : Type*} [CommRing A] (N : A) : A := 1344

def smallTerm41_4_9MCFC {A : Type*} [CommRing A] (N : A) : A := 1680

def smallTerm41_4_10MCFC {A : Type*} [CommRing A] (N : A) : A := 1344

def smallTerm41_4_11MCFC {A : Type*} [CommRing A] (N : A) : A := 672

def smallTerm41_4_12MCFC {A : Type*} [CommRing A] (N : A) : A := 192

def smallTerm41_4_13MCFC {A : Type*} [CommRing A] (N : A) : A := 24

def smallNumerator41MCFC {A : Type*} [CommRing A] (N Z x : A) : A :=
 smallTerm41_0_0MCFC N*Z^0*x^0 + smallTerm41_0_1MCFC N*Z^0*x^1 + smallTerm41_0_2MCFC N*Z^0*x^2 + smallTerm41_0_3MCFC N*Z^0*x^3 + smallTerm41_0_4MCFC N*Z^0*x^4 + smallTerm41_0_5MCFC N*Z^0*x^5 + smallTerm41_0_6MCFC N*Z^0*x^6 + smallTerm41_0_7MCFC N*Z^0*x^7 + smallTerm41_0_8MCFC N*Z^0*x^8 + smallTerm41_0_9MCFC N*Z^0*x^9 + smallTerm41_0_10MCFC N*Z^0*x^10 + smallTerm41_0_11MCFC N*Z^0*x^11 + smallTerm41_0_12MCFC N*Z^0*x^12 + smallTerm41_1_2MCFC N*Z^1*x^2 + smallTerm41_1_3MCFC N*Z^1*x^3 + smallTerm41_1_4MCFC N*Z^1*x^4 + smallTerm41_1_5MCFC N*Z^1*x^5 + smallTerm41_1_6MCFC N*Z^1*x^6 + smallTerm41_1_7MCFC N*Z^1*x^7 + smallTerm41_1_8MCFC N*Z^1*x^8 + smallTerm41_1_9MCFC N*Z^1*x^9 + smallTerm41_1_10MCFC N*Z^1*x^10 + smallTerm41_1_11MCFC N*Z^1*x^11 + smallTerm41_1_12MCFC N*Z^1*x^12 + smallTerm41_2_3MCFC N*Z^2*x^3 + smallTerm41_2_4MCFC N*Z^2*x^4 + smallTerm41_2_5MCFC N*Z^2*x^5 + smallTerm41_2_6MCFC N*Z^2*x^6 + smallTerm41_2_7MCFC N*Z^2*x^7 + smallTerm41_2_8MCFC N*Z^2*x^8 + smallTerm41_2_9MCFC N*Z^2*x^9 + smallTerm41_2_10MCFC N*Z^2*x^10 + smallTerm41_2_11MCFC N*Z^2*x^11 + smallTerm41_2_12MCFC N*Z^2*x^12 + smallTerm41_3_4MCFC N*Z^3*x^4 + smallTerm41_3_5MCFC N*Z^3*x^5 + smallTerm41_3_6MCFC N*Z^3*x^6 + smallTerm41_3_7MCFC N*Z^3*x^7 + smallTerm41_3_8MCFC N*Z^3*x^8 + smallTerm41_3_9MCFC N*Z^3*x^9 + smallTerm41_3_10MCFC N*Z^3*x^10 + smallTerm41_3_11MCFC N*Z^3*x^11 + smallTerm41_3_12MCFC N*Z^3*x^12 + smallTerm41_4_5MCFC N*Z^4*x^5 + smallTerm41_4_6MCFC N*Z^4*x^6 + smallTerm41_4_7MCFC N*Z^4*x^7 + smallTerm41_4_8MCFC N*Z^4*x^8 + smallTerm41_4_9MCFC N*Z^4*x^9 + smallTerm41_4_10MCFC N*Z^4*x^10 + smallTerm41_4_11MCFC N*Z^4*x^11 + smallTerm41_4_12MCFC N*Z^4*x^12 + smallTerm41_4_13MCFC N*Z^4*x^13

theorem small_numerator_identity41MCFC {A : Type*} [CommRing A] (N Z x : A) :
 fourthNumeratorBC N Z x 4 1+(24*(Z^4*x^5)*(1-x)^8)=smallNumerator41MCFC N Z x := by
 rw [fourthNumerator_fullFA]
 unfold fullNumeratorFA fourthCountCorrectionFA
 norm_num only [show (2*1-4:ℕ)=0 by decide,show (min (4-1) (3*1-4):ℕ)=0 by decide,show (3*1-2*4:ℕ)=0 by decide]
 norm_num [firstNumBC,secondNumBC,fullH0FA,fullH1FA,fullH2FA,fullH3FA,fullH4FA,runH0n0FA,runH0n1FA,runH0n2FA,runH0n3FA,runH0n4FA,runH1n0FA,runH1n1FA,runH1n2FA,runH1n3FA,smallNumerator41MCFC,smallTerm41_0_0MCFC,smallTerm41_0_1MCFC,smallTerm41_0_2MCFC,smallTerm41_0_3MCFC,smallTerm41_0_4MCFC,smallTerm41_0_5MCFC,smallTerm41_0_6MCFC,smallTerm41_0_7MCFC,smallTerm41_0_8MCFC,smallTerm41_0_9MCFC,smallTerm41_0_10MCFC,smallTerm41_0_11MCFC,smallTerm41_0_12MCFC,smallTerm41_1_2MCFC,smallTerm41_1_3MCFC,smallTerm41_1_4MCFC,smallTerm41_1_5MCFC,smallTerm41_1_6MCFC,smallTerm41_1_7MCFC,smallTerm41_1_8MCFC,smallTerm41_1_9MCFC,smallTerm41_1_10MCFC,smallTerm41_1_11MCFC,smallTerm41_1_12MCFC,smallTerm41_2_3MCFC,smallTerm41_2_4MCFC,smallTerm41_2_5MCFC,smallTerm41_2_6MCFC,smallTerm41_2_7MCFC,smallTerm41_2_8MCFC,smallTerm41_2_9MCFC,smallTerm41_2_10MCFC,smallTerm41_2_11MCFC,smallTerm41_2_12MCFC,smallTerm41_3_4MCFC,smallTerm41_3_5MCFC,smallTerm41_3_6MCFC,smallTerm41_3_7MCFC,smallTerm41_3_8MCFC,smallTerm41_3_9MCFC,smallTerm41_3_10MCFC,smallTerm41_3_11MCFC,smallTerm41_3_12MCFC,smallTerm41_4_5MCFC,smallTerm41_4_6MCFC,smallTerm41_4_7MCFC,smallTerm41_4_8MCFC,smallTerm41_4_9MCFC,smallTerm41_4_10MCFC,smallTerm41_4_11MCFC,smallTerm41_4_12MCFC,smallTerm41_4_13MCFC]
 <;> ring

theorem source_small_numerator41MCFC (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) (hr : (frame rest).mid.a=1) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 smallNumerator41MCFC (n:ℤ[X]) (X^n) X := by
 rw [source_corrected_numeratorM0A5,hc,hr]
 unfold correctedFourthNumeratorM0A5 cycleNumeratorCorrectionM0A5
 norm_num only
 have hp : (X:ℤ[X])^(4*(n+1)+1)=(X^n)^4*X^5 := by
  rw [←pow_mul,←pow_add]
  congr 1
  omega
 rw [hp]
 exact small_numerator_identity41MCFC _ _ _

def smallValue41MCFC (n j : ℕ) : ℤ :=
 smallTerm41_0_0MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+0) + smallTerm41_0_1MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+1) + smallTerm41_0_2MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+2) + smallTerm41_0_3MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+3) + smallTerm41_0_4MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+4) + smallTerm41_0_5MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+5) + smallTerm41_0_6MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+6) + smallTerm41_0_7MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+7) + smallTerm41_0_8MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+8) + smallTerm41_0_9MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+9) + smallTerm41_0_10MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+10) + smallTerm41_0_11MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+11) + smallTerm41_0_12MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+12) + smallTerm41_1_2MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+2) + smallTerm41_1_3MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+3) + smallTerm41_1_4MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+4) + smallTerm41_1_5MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+5) + smallTerm41_1_6MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+6) + smallTerm41_1_7MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+7) + smallTerm41_1_8MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+8) + smallTerm41_1_9MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+9) + smallTerm41_1_10MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+10) + smallTerm41_1_11MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+11) + smallTerm41_1_12MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+12) + smallTerm41_2_3MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+3) + smallTerm41_2_4MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+4) + smallTerm41_2_5MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+5) + smallTerm41_2_6MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+6) + smallTerm41_2_7MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+7) + smallTerm41_2_8MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+8) + smallTerm41_2_9MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+9) + smallTerm41_2_10MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+10) + smallTerm41_2_11MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+11) + smallTerm41_2_12MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+12) + smallTerm41_3_4MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+4) + smallTerm41_3_5MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+5) + smallTerm41_3_6MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+6) + smallTerm41_3_7MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+7) + smallTerm41_3_8MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+8) + smallTerm41_3_9MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+9) + smallTerm41_3_10MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+10) + smallTerm41_3_11MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+11) + smallTerm41_3_12MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+12) + smallTerm41_4_5MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+5) + smallTerm41_4_6MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+6) + smallTerm41_4_7MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+7) + smallTerm41_4_8MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+8) + smallTerm41_4_9MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+9) + smallTerm41_4_10MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+10) + smallTerm41_4_11MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+11) + smallTerm41_4_12MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+12) + smallTerm41_4_13MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+13)

theorem small_numerator_expand41MCFC (n : ℕ) :
 smallNumerator41MCFC (n:ℤ[X]) (X^n) X=
 C (smallTerm41_0_0MCFC (n:ℤ))*X^(0*n+0) + C (smallTerm41_0_1MCFC (n:ℤ))*X^(0*n+1) + C (smallTerm41_0_2MCFC (n:ℤ))*X^(0*n+2) + C (smallTerm41_0_3MCFC (n:ℤ))*X^(0*n+3) + C (smallTerm41_0_4MCFC (n:ℤ))*X^(0*n+4) + C (smallTerm41_0_5MCFC (n:ℤ))*X^(0*n+5) + C (smallTerm41_0_6MCFC (n:ℤ))*X^(0*n+6) + C (smallTerm41_0_7MCFC (n:ℤ))*X^(0*n+7) + C (smallTerm41_0_8MCFC (n:ℤ))*X^(0*n+8) + C (smallTerm41_0_9MCFC (n:ℤ))*X^(0*n+9) + C (smallTerm41_0_10MCFC (n:ℤ))*X^(0*n+10) + C (smallTerm41_0_11MCFC (n:ℤ))*X^(0*n+11) + C (smallTerm41_0_12MCFC (n:ℤ))*X^(0*n+12) + C (smallTerm41_1_2MCFC (n:ℤ))*X^(1*n+2) + C (smallTerm41_1_3MCFC (n:ℤ))*X^(1*n+3) + C (smallTerm41_1_4MCFC (n:ℤ))*X^(1*n+4) + C (smallTerm41_1_5MCFC (n:ℤ))*X^(1*n+5) + C (smallTerm41_1_6MCFC (n:ℤ))*X^(1*n+6) + C (smallTerm41_1_7MCFC (n:ℤ))*X^(1*n+7) + C (smallTerm41_1_8MCFC (n:ℤ))*X^(1*n+8) + C (smallTerm41_1_9MCFC (n:ℤ))*X^(1*n+9) + C (smallTerm41_1_10MCFC (n:ℤ))*X^(1*n+10) + C (smallTerm41_1_11MCFC (n:ℤ))*X^(1*n+11) + C (smallTerm41_1_12MCFC (n:ℤ))*X^(1*n+12) + C (smallTerm41_2_3MCFC (n:ℤ))*X^(2*n+3) + C (smallTerm41_2_4MCFC (n:ℤ))*X^(2*n+4) + C (smallTerm41_2_5MCFC (n:ℤ))*X^(2*n+5) + C (smallTerm41_2_6MCFC (n:ℤ))*X^(2*n+6) + C (smallTerm41_2_7MCFC (n:ℤ))*X^(2*n+7) + C (smallTerm41_2_8MCFC (n:ℤ))*X^(2*n+8) + C (smallTerm41_2_9MCFC (n:ℤ))*X^(2*n+9) + C (smallTerm41_2_10MCFC (n:ℤ))*X^(2*n+10) + C (smallTerm41_2_11MCFC (n:ℤ))*X^(2*n+11) + C (smallTerm41_2_12MCFC (n:ℤ))*X^(2*n+12) + C (smallTerm41_3_4MCFC (n:ℤ))*X^(3*n+4) + C (smallTerm41_3_5MCFC (n:ℤ))*X^(3*n+5) + C (smallTerm41_3_6MCFC (n:ℤ))*X^(3*n+6) + C (smallTerm41_3_7MCFC (n:ℤ))*X^(3*n+7) + C (smallTerm41_3_8MCFC (n:ℤ))*X^(3*n+8) + C (smallTerm41_3_9MCFC (n:ℤ))*X^(3*n+9) + C (smallTerm41_3_10MCFC (n:ℤ))*X^(3*n+10) + C (smallTerm41_3_11MCFC (n:ℤ))*X^(3*n+11) + C (smallTerm41_3_12MCFC (n:ℤ))*X^(3*n+12) + C (smallTerm41_4_5MCFC (n:ℤ))*X^(4*n+5) + C (smallTerm41_4_6MCFC (n:ℤ))*X^(4*n+6) + C (smallTerm41_4_7MCFC (n:ℤ))*X^(4*n+7) + C (smallTerm41_4_8MCFC (n:ℤ))*X^(4*n+8) + C (smallTerm41_4_9MCFC (n:ℤ))*X^(4*n+9) + C (smallTerm41_4_10MCFC (n:ℤ))*X^(4*n+10) + C (smallTerm41_4_11MCFC (n:ℤ))*X^(4*n+11) + C (smallTerm41_4_12MCFC (n:ℤ))*X^(4*n+12) + C (smallTerm41_4_13MCFC (n:ℤ))*X^(4*n+13) := by
 unfold smallNumerator41MCFC smallTerm41_0_0MCFC smallTerm41_0_1MCFC smallTerm41_0_2MCFC smallTerm41_0_3MCFC smallTerm41_0_4MCFC smallTerm41_0_5MCFC smallTerm41_0_6MCFC smallTerm41_0_7MCFC smallTerm41_0_8MCFC smallTerm41_0_9MCFC smallTerm41_0_10MCFC smallTerm41_0_11MCFC smallTerm41_0_12MCFC smallTerm41_1_2MCFC smallTerm41_1_3MCFC smallTerm41_1_4MCFC smallTerm41_1_5MCFC smallTerm41_1_6MCFC smallTerm41_1_7MCFC smallTerm41_1_8MCFC smallTerm41_1_9MCFC smallTerm41_1_10MCFC smallTerm41_1_11MCFC smallTerm41_1_12MCFC smallTerm41_2_3MCFC smallTerm41_2_4MCFC smallTerm41_2_5MCFC smallTerm41_2_6MCFC smallTerm41_2_7MCFC smallTerm41_2_8MCFC smallTerm41_2_9MCFC smallTerm41_2_10MCFC smallTerm41_2_11MCFC smallTerm41_2_12MCFC smallTerm41_3_4MCFC smallTerm41_3_5MCFC smallTerm41_3_6MCFC smallTerm41_3_7MCFC smallTerm41_3_8MCFC smallTerm41_3_9MCFC smallTerm41_3_10MCFC smallTerm41_3_11MCFC smallTerm41_3_12MCFC smallTerm41_4_5MCFC smallTerm41_4_6MCFC smallTerm41_4_7MCFC smallTerm41_4_8MCFC smallTerm41_4_9MCFC smallTerm41_4_10MCFC smallTerm41_4_11MCFC smallTerm41_4_12MCFC smallTerm41_4_13MCFC
 simp only [map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_natCast,pow_add,pow_mul]
 ring

theorem source_small_value41MCFC (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) (hr : (frame rest).mid.a=1) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=smallValue41MCFC n j := by
 have h := coeff_of_one_sub_mul_rangeBC _ _ 7 j (source_small_numerator41MCFC n rest hc hr)
 simp only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs] at h
 change _=convSevenK0B (smallNumerator41MCFC (n:ℤ[X]) (X^n) X) j at h
 rw [small_numerator_expand41MCFC] at h
 simpa only [convSeven_addK0B,convSeven_monomialK0B,smallValue41MCFC,source_cut_coeffA27 _ i j 4 hs] using h
end
end MathGKM.Markov
