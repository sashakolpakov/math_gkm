import MarkovCorrectedNumeratorM0A5
import MarkovConvK0B
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallTerm43_0_0MCFC {A : Type*} [CommRing A] (N : A) : A := ((((256*N + 1152)*N + 1904)*N + 1368)*N + 360)

def smallTerm43_0_1MCFC {A : Type*} [CommRing A] (N : A) : A := ((((1024*N + 1280)*N + (-1216))*N + (-2288))*N + (-816))

def smallTerm43_0_2MCFC {A : Type*} [CommRing A] (N : A) : A := ((((512*N + (-11264))*N + (-15968))*N + (-7984))*N + (-1488))

def smallTerm43_0_3MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-3072)*N + (-24832))*N + 20160)*N + 14128)*N + 4440)

def smallTerm43_0_4MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-4352)*N + 6272)*N + 130640)*N + (-28088))*N + 10680)

def smallTerm43_0_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((((2048*N + 57856)*N + 109696)*N + (-270688))*N + 77952)

def smallTerm43_0_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((((7168*N + 35840)*N + (-127552))*N + (-430880))*N + 323808)

def smallTerm43_0_7MCFC {A : Type*} [CommRing A] (N : A) : A := ((((2048*N + (-37376))*N + (-247424))*N + (-137632))*N + 616272)

def smallTerm43_0_8MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-4352)*N + (-49792))*N + (-79600))*N + 291688)*N + 629400)

def smallTerm43_0_9MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-3072)*N + (-5888))*N + 91200)*N + 360272)*N + 363120)

def smallTerm43_0_10MCFC {A : Type*} [CommRing A] (N : A) : A := ((((512*N + 16384)*N + 87712)*N + 171344)*N + 114672)

def smallTerm43_0_11MCFC {A : Type*} [CommRing A] (N : A) : A := ((((1024*N + 8960)*N + 27584)*N + 36208)*N + 17304)

def smallTerm43_0_12MCFC {A : Type*} [CommRing A] (N : A) : A := ((((256*N + 1408)*N + 2864)*N + 2552)*N + 840)

def smallTerm43_1_2MCFC {A : Type*} [CommRing A] (N : A) : A := (((128*N + 192)*N + 64)*N)

def smallTerm43_1_3MCFC {A : Type*} [CommRing A] (N : A) : A := (((768*N + (-1920))*N + 192)*N)

def smallTerm43_1_4MCFC {A : Type*} [CommRing A] (N : A) : A := (((1152*N + (-14400))*N + 21312)*N + (-9408))

def smallTerm43_1_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-1024)*N + (-27648))*N + 116224)*N + (-103104))

def smallTerm43_1_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-3840)*N + (-4224))*N + 239232)*N + (-418368))

def smallTerm43_1_7MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-1536)*N + 45312)*N + 186240)*N + (-880320))

def smallTerm43_1_8MCFC {A : Type*} [CommRing A] (N : A) : A := (((3328*N + 48000)*N + (-70528))*N + (-1076160))

def smallTerm43_1_9MCFC {A : Type*} [CommRing A] (N : A) : A := (((3072*N)*N + (-242688))*N + (-787008))

def smallTerm43_1_10MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-384)*N + (-26688))*N + (-182976))*N + (-333504))

def smallTerm43_1_11MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-1280)*N + (-15744))*N + (-59968))*N + (-72768))

def smallTerm43_1_12MCFC {A : Type*} [CommRing A] (N : A) : A := ((((-384)*N + (-2880))*N + (-7104))*N + (-5760))

def smallTerm43_2_4MCFC {A : Type*} [CommRing A] (N : A) : A := 576

def smallTerm43_2_5MCFC {A : Type*} [CommRing A] (N : A) : A := 15168

def smallTerm43_2_6MCFC {A : Type*} [CommRing A] (N : A) : A := 96768

def smallTerm43_2_7MCFC {A : Type*} [CommRing A] (N : A) : A := 288768

def smallTerm43_2_8MCFC {A : Type*} [CommRing A] (N : A) : A := 483456

def smallTerm43_2_9MCFC {A : Type*} [CommRing A] (N : A) : A := 483456

def smallTerm43_2_10MCFC {A : Type*} [CommRing A] (N : A) : A := 288768

def smallTerm43_2_11MCFC {A : Type*} [CommRing A] (N : A) : A := 96768

def smallTerm43_2_12MCFC {A : Type*} [CommRing A] (N : A) : A := 15168

def smallTerm43_2_13MCFC {A : Type*} [CommRing A] (N : A) : A := 576

def smallTerm43_3_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((-576)*N + (-1728))

def smallTerm43_3_7MCFC {A : Type*} [CommRing A] (N : A) : A := ((-3072)*N + (-12864))

def smallTerm43_3_8MCFC {A : Type*} [CommRing A] (N : A) : A := ((-6144)*N + (-40128))

def smallTerm43_3_9MCFC {A : Type*} [CommRing A] (N : A) : A := ((-4608)*N + (-68160))

def smallTerm43_3_10MCFC {A : Type*} [CommRing A] (N : A) : A := (1920*N + (-68160))

def smallTerm43_3_11MCFC {A : Type*} [CommRing A] (N : A) : A := (6144*N + (-40128))

def smallTerm43_3_12MCFC {A : Type*} [CommRing A] (N : A) : A := (4608*N + (-12864))

def smallTerm43_3_13MCFC {A : Type*} [CommRing A] (N : A) : A := (1536*N + (-1728))

def smallTerm43_3_14MCFC {A : Type*} [CommRing A] (N : A) : A := (192*N)

def smallTerm43_4_7MCFC {A : Type*} [CommRing A] (N : A) : A := 24

def smallTerm43_4_8MCFC {A : Type*} [CommRing A] (N : A) : A := 192

def smallTerm43_4_9MCFC {A : Type*} [CommRing A] (N : A) : A := 672

def smallTerm43_4_10MCFC {A : Type*} [CommRing A] (N : A) : A := 1344

def smallTerm43_4_11MCFC {A : Type*} [CommRing A] (N : A) : A := 1680

def smallTerm43_4_12MCFC {A : Type*} [CommRing A] (N : A) : A := 1344

def smallTerm43_4_13MCFC {A : Type*} [CommRing A] (N : A) : A := 672

def smallTerm43_4_14MCFC {A : Type*} [CommRing A] (N : A) : A := 192

def smallTerm43_4_15MCFC {A : Type*} [CommRing A] (N : A) : A := 24

def smallNumerator43MCFC {A : Type*} [CommRing A] (N Z x : A) : A :=
 smallTerm43_0_0MCFC N*Z^0*x^0 + smallTerm43_0_1MCFC N*Z^0*x^1 + smallTerm43_0_2MCFC N*Z^0*x^2 + smallTerm43_0_3MCFC N*Z^0*x^3 + smallTerm43_0_4MCFC N*Z^0*x^4 + smallTerm43_0_5MCFC N*Z^0*x^5 + smallTerm43_0_6MCFC N*Z^0*x^6 + smallTerm43_0_7MCFC N*Z^0*x^7 + smallTerm43_0_8MCFC N*Z^0*x^8 + smallTerm43_0_9MCFC N*Z^0*x^9 + smallTerm43_0_10MCFC N*Z^0*x^10 + smallTerm43_0_11MCFC N*Z^0*x^11 + smallTerm43_0_12MCFC N*Z^0*x^12 + smallTerm43_1_2MCFC N*Z^1*x^2 + smallTerm43_1_3MCFC N*Z^1*x^3 + smallTerm43_1_4MCFC N*Z^1*x^4 + smallTerm43_1_5MCFC N*Z^1*x^5 + smallTerm43_1_6MCFC N*Z^1*x^6 + smallTerm43_1_7MCFC N*Z^1*x^7 + smallTerm43_1_8MCFC N*Z^1*x^8 + smallTerm43_1_9MCFC N*Z^1*x^9 + smallTerm43_1_10MCFC N*Z^1*x^10 + smallTerm43_1_11MCFC N*Z^1*x^11 + smallTerm43_1_12MCFC N*Z^1*x^12 + smallTerm43_2_4MCFC N*Z^2*x^4 + smallTerm43_2_5MCFC N*Z^2*x^5 + smallTerm43_2_6MCFC N*Z^2*x^6 + smallTerm43_2_7MCFC N*Z^2*x^7 + smallTerm43_2_8MCFC N*Z^2*x^8 + smallTerm43_2_9MCFC N*Z^2*x^9 + smallTerm43_2_10MCFC N*Z^2*x^10 + smallTerm43_2_11MCFC N*Z^2*x^11 + smallTerm43_2_12MCFC N*Z^2*x^12 + smallTerm43_2_13MCFC N*Z^2*x^13 + smallTerm43_3_6MCFC N*Z^3*x^6 + smallTerm43_3_7MCFC N*Z^3*x^7 + smallTerm43_3_8MCFC N*Z^3*x^8 + smallTerm43_3_9MCFC N*Z^3*x^9 + smallTerm43_3_10MCFC N*Z^3*x^10 + smallTerm43_3_11MCFC N*Z^3*x^11 + smallTerm43_3_12MCFC N*Z^3*x^12 + smallTerm43_3_13MCFC N*Z^3*x^13 + smallTerm43_3_14MCFC N*Z^3*x^14 + smallTerm43_4_7MCFC N*Z^4*x^7 + smallTerm43_4_8MCFC N*Z^4*x^8 + smallTerm43_4_9MCFC N*Z^4*x^9 + smallTerm43_4_10MCFC N*Z^4*x^10 + smallTerm43_4_11MCFC N*Z^4*x^11 + smallTerm43_4_12MCFC N*Z^4*x^12 + smallTerm43_4_13MCFC N*Z^4*x^13 + smallTerm43_4_14MCFC N*Z^4*x^14 + smallTerm43_4_15MCFC N*Z^4*x^15

theorem small_numerator_identity43MCFC {A : Type*} [CommRing A] (N Z x : A) :
 fourthNumeratorBC N Z x 4 3+(24*(Z^4*x^7)*(1-x)^8)=smallNumerator43MCFC N Z x := by
 rw [fourthNumerator_fullFA]
 unfold fullNumeratorFA fourthCountCorrectionFA
 norm_num only [show (2*3-4:ℕ)=2 by decide,show (min (4-3) (3*3-4):ℕ)=1 by decide,show (3*3-2*4:ℕ)=1 by decide]
 norm_num [firstNumBC,secondNumBC,fullH0FA,fullH1FA,fullH2FA,fullH3FA,fullH4FA,runH0n0FA,runH0n1FA,runH0n2FA,runH0n3FA,runH0n4FA,runH1n0FA,runH1n1FA,runH1n2FA,runH1n3FA,smallNumerator43MCFC,smallTerm43_0_0MCFC,smallTerm43_0_1MCFC,smallTerm43_0_2MCFC,smallTerm43_0_3MCFC,smallTerm43_0_4MCFC,smallTerm43_0_5MCFC,smallTerm43_0_6MCFC,smallTerm43_0_7MCFC,smallTerm43_0_8MCFC,smallTerm43_0_9MCFC,smallTerm43_0_10MCFC,smallTerm43_0_11MCFC,smallTerm43_0_12MCFC,smallTerm43_1_2MCFC,smallTerm43_1_3MCFC,smallTerm43_1_4MCFC,smallTerm43_1_5MCFC,smallTerm43_1_6MCFC,smallTerm43_1_7MCFC,smallTerm43_1_8MCFC,smallTerm43_1_9MCFC,smallTerm43_1_10MCFC,smallTerm43_1_11MCFC,smallTerm43_1_12MCFC,smallTerm43_2_4MCFC,smallTerm43_2_5MCFC,smallTerm43_2_6MCFC,smallTerm43_2_7MCFC,smallTerm43_2_8MCFC,smallTerm43_2_9MCFC,smallTerm43_2_10MCFC,smallTerm43_2_11MCFC,smallTerm43_2_12MCFC,smallTerm43_2_13MCFC,smallTerm43_3_6MCFC,smallTerm43_3_7MCFC,smallTerm43_3_8MCFC,smallTerm43_3_9MCFC,smallTerm43_3_10MCFC,smallTerm43_3_11MCFC,smallTerm43_3_12MCFC,smallTerm43_3_13MCFC,smallTerm43_3_14MCFC,smallTerm43_4_7MCFC,smallTerm43_4_8MCFC,smallTerm43_4_9MCFC,smallTerm43_4_10MCFC,smallTerm43_4_11MCFC,smallTerm43_4_12MCFC,smallTerm43_4_13MCFC,smallTerm43_4_14MCFC,smallTerm43_4_15MCFC]
 <;> ring

theorem source_small_numerator43MCFC (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) (hr : (frame rest).mid.a=3) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 smallNumerator43MCFC (n:ℤ[X]) (X^n) X := by
 rw [source_corrected_numeratorM0A5,hc,hr]
 unfold correctedFourthNumeratorM0A5 cycleNumeratorCorrectionM0A5
 norm_num only
 have hp : (X:ℤ[X])^(4*(n+1)+3)=(X^n)^4*X^7 := by
  rw [←pow_mul,←pow_add]
  congr 1
  omega
 rw [hp]
 exact small_numerator_identity43MCFC _ _ _

def smallValue43MCFC (n j : ℕ) : ℤ :=
 smallTerm43_0_0MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+0) + smallTerm43_0_1MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+1) + smallTerm43_0_2MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+2) + smallTerm43_0_3MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+3) + smallTerm43_0_4MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+4) + smallTerm43_0_5MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+5) + smallTerm43_0_6MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+6) + smallTerm43_0_7MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+7) + smallTerm43_0_8MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+8) + smallTerm43_0_9MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+9) + smallTerm43_0_10MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+10) + smallTerm43_0_11MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+11) + smallTerm43_0_12MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+12) + smallTerm43_1_2MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+2) + smallTerm43_1_3MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+3) + smallTerm43_1_4MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+4) + smallTerm43_1_5MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+5) + smallTerm43_1_6MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+6) + smallTerm43_1_7MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+7) + smallTerm43_1_8MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+8) + smallTerm43_1_9MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+9) + smallTerm43_1_10MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+10) + smallTerm43_1_11MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+11) + smallTerm43_1_12MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+12) + smallTerm43_2_4MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+4) + smallTerm43_2_5MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+5) + smallTerm43_2_6MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+6) + smallTerm43_2_7MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+7) + smallTerm43_2_8MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+8) + smallTerm43_2_9MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+9) + smallTerm43_2_10MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+10) + smallTerm43_2_11MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+11) + smallTerm43_2_12MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+12) + smallTerm43_2_13MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+13) + smallTerm43_3_6MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+6) + smallTerm43_3_7MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+7) + smallTerm43_3_8MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+8) + smallTerm43_3_9MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+9) + smallTerm43_3_10MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+10) + smallTerm43_3_11MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+11) + smallTerm43_3_12MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+12) + smallTerm43_3_13MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+13) + smallTerm43_3_14MCFC (n:ℤ)*chooseShiftSevenK0B j (3*n+14) + smallTerm43_4_7MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+7) + smallTerm43_4_8MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+8) + smallTerm43_4_9MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+9) + smallTerm43_4_10MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+10) + smallTerm43_4_11MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+11) + smallTerm43_4_12MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+12) + smallTerm43_4_13MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+13) + smallTerm43_4_14MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+14) + smallTerm43_4_15MCFC (n:ℤ)*chooseShiftSevenK0B j (4*n+15)

theorem small_numerator_expand43MCFC (n : ℕ) :
 smallNumerator43MCFC (n:ℤ[X]) (X^n) X=
 C (smallTerm43_0_0MCFC (n:ℤ))*X^(0*n+0) + C (smallTerm43_0_1MCFC (n:ℤ))*X^(0*n+1) + C (smallTerm43_0_2MCFC (n:ℤ))*X^(0*n+2) + C (smallTerm43_0_3MCFC (n:ℤ))*X^(0*n+3) + C (smallTerm43_0_4MCFC (n:ℤ))*X^(0*n+4) + C (smallTerm43_0_5MCFC (n:ℤ))*X^(0*n+5) + C (smallTerm43_0_6MCFC (n:ℤ))*X^(0*n+6) + C (smallTerm43_0_7MCFC (n:ℤ))*X^(0*n+7) + C (smallTerm43_0_8MCFC (n:ℤ))*X^(0*n+8) + C (smallTerm43_0_9MCFC (n:ℤ))*X^(0*n+9) + C (smallTerm43_0_10MCFC (n:ℤ))*X^(0*n+10) + C (smallTerm43_0_11MCFC (n:ℤ))*X^(0*n+11) + C (smallTerm43_0_12MCFC (n:ℤ))*X^(0*n+12) + C (smallTerm43_1_2MCFC (n:ℤ))*X^(1*n+2) + C (smallTerm43_1_3MCFC (n:ℤ))*X^(1*n+3) + C (smallTerm43_1_4MCFC (n:ℤ))*X^(1*n+4) + C (smallTerm43_1_5MCFC (n:ℤ))*X^(1*n+5) + C (smallTerm43_1_6MCFC (n:ℤ))*X^(1*n+6) + C (smallTerm43_1_7MCFC (n:ℤ))*X^(1*n+7) + C (smallTerm43_1_8MCFC (n:ℤ))*X^(1*n+8) + C (smallTerm43_1_9MCFC (n:ℤ))*X^(1*n+9) + C (smallTerm43_1_10MCFC (n:ℤ))*X^(1*n+10) + C (smallTerm43_1_11MCFC (n:ℤ))*X^(1*n+11) + C (smallTerm43_1_12MCFC (n:ℤ))*X^(1*n+12) + C (smallTerm43_2_4MCFC (n:ℤ))*X^(2*n+4) + C (smallTerm43_2_5MCFC (n:ℤ))*X^(2*n+5) + C (smallTerm43_2_6MCFC (n:ℤ))*X^(2*n+6) + C (smallTerm43_2_7MCFC (n:ℤ))*X^(2*n+7) + C (smallTerm43_2_8MCFC (n:ℤ))*X^(2*n+8) + C (smallTerm43_2_9MCFC (n:ℤ))*X^(2*n+9) + C (smallTerm43_2_10MCFC (n:ℤ))*X^(2*n+10) + C (smallTerm43_2_11MCFC (n:ℤ))*X^(2*n+11) + C (smallTerm43_2_12MCFC (n:ℤ))*X^(2*n+12) + C (smallTerm43_2_13MCFC (n:ℤ))*X^(2*n+13) + C (smallTerm43_3_6MCFC (n:ℤ))*X^(3*n+6) + C (smallTerm43_3_7MCFC (n:ℤ))*X^(3*n+7) + C (smallTerm43_3_8MCFC (n:ℤ))*X^(3*n+8) + C (smallTerm43_3_9MCFC (n:ℤ))*X^(3*n+9) + C (smallTerm43_3_10MCFC (n:ℤ))*X^(3*n+10) + C (smallTerm43_3_11MCFC (n:ℤ))*X^(3*n+11) + C (smallTerm43_3_12MCFC (n:ℤ))*X^(3*n+12) + C (smallTerm43_3_13MCFC (n:ℤ))*X^(3*n+13) + C (smallTerm43_3_14MCFC (n:ℤ))*X^(3*n+14) + C (smallTerm43_4_7MCFC (n:ℤ))*X^(4*n+7) + C (smallTerm43_4_8MCFC (n:ℤ))*X^(4*n+8) + C (smallTerm43_4_9MCFC (n:ℤ))*X^(4*n+9) + C (smallTerm43_4_10MCFC (n:ℤ))*X^(4*n+10) + C (smallTerm43_4_11MCFC (n:ℤ))*X^(4*n+11) + C (smallTerm43_4_12MCFC (n:ℤ))*X^(4*n+12) + C (smallTerm43_4_13MCFC (n:ℤ))*X^(4*n+13) + C (smallTerm43_4_14MCFC (n:ℤ))*X^(4*n+14) + C (smallTerm43_4_15MCFC (n:ℤ))*X^(4*n+15) := by
 unfold smallNumerator43MCFC smallTerm43_0_0MCFC smallTerm43_0_1MCFC smallTerm43_0_2MCFC smallTerm43_0_3MCFC smallTerm43_0_4MCFC smallTerm43_0_5MCFC smallTerm43_0_6MCFC smallTerm43_0_7MCFC smallTerm43_0_8MCFC smallTerm43_0_9MCFC smallTerm43_0_10MCFC smallTerm43_0_11MCFC smallTerm43_0_12MCFC smallTerm43_1_2MCFC smallTerm43_1_3MCFC smallTerm43_1_4MCFC smallTerm43_1_5MCFC smallTerm43_1_6MCFC smallTerm43_1_7MCFC smallTerm43_1_8MCFC smallTerm43_1_9MCFC smallTerm43_1_10MCFC smallTerm43_1_11MCFC smallTerm43_1_12MCFC smallTerm43_2_4MCFC smallTerm43_2_5MCFC smallTerm43_2_6MCFC smallTerm43_2_7MCFC smallTerm43_2_8MCFC smallTerm43_2_9MCFC smallTerm43_2_10MCFC smallTerm43_2_11MCFC smallTerm43_2_12MCFC smallTerm43_2_13MCFC smallTerm43_3_6MCFC smallTerm43_3_7MCFC smallTerm43_3_8MCFC smallTerm43_3_9MCFC smallTerm43_3_10MCFC smallTerm43_3_11MCFC smallTerm43_3_12MCFC smallTerm43_3_13MCFC smallTerm43_3_14MCFC smallTerm43_4_7MCFC smallTerm43_4_8MCFC smallTerm43_4_9MCFC smallTerm43_4_10MCFC smallTerm43_4_11MCFC smallTerm43_4_12MCFC smallTerm43_4_13MCFC smallTerm43_4_14MCFC smallTerm43_4_15MCFC
 simp only [map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_natCast,pow_add,pow_mul]
 ring

theorem source_small_value43MCFC (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) (hr : (frame rest).mid.a=3) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=smallValue43MCFC n j := by
 have h := coeff_of_one_sub_mul_rangeBC _ _ 7 j (source_small_numerator43MCFC n rest hc hr)
 simp only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs] at h
 change _=convSevenK0B (smallNumerator43MCFC (n:ℤ[X]) (X^n) X) j at h
 rw [small_numerator_expand43MCFC] at h
 simpa only [convSeven_addK0B,convSeven_monomialK0B,smallValue43MCFC,source_cut_coeffA27 _ i j 4 hs] using h
end
end MathGKM.Markov
