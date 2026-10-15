import MarkovCorrectedNumeratorM0A5
import MarkovConvK0B
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallTerm21_0_0MCFC {A : Type*} [CommRing A] (N : A) : A := ((((16*N + 16)*N + (-4))*N + (-4))*N)

def smallTerm21_0_1MCFC {A : Type*} [CommRing A] (N : A) : A := ((((64*N + (-160))*N + 80)*N + (-8))*N)

def smallTerm21_0_2MCFC {A : Type*} [CommRing A] (N : A) : A := ((((32*N + (-960))*N + 1624)*N + (-1248))*N + 384)

def smallTerm21_0_3MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-192)*N + (-1248))*N + 6864)*N + (-10008))*N + 5136)

def smallTerm21_0_4MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-272)*N + 1232)*N + 10724)*N + (-32804))*N + 27000)

def smallTerm21_0_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((((128*N + 4032)*N + 928)*N + (-54096))*N + 77568)

def smallTerm21_0_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((((448*N + 1792)*N + (-17584))*N + (-38752))*N + 137760)

def smallTerm21_0_7MCFC {A : Type*} [CommRing A] (N : A) : A := ((((128*N + (-3008))*N + (-20192))*N + 13520)*N + 159264)

def smallTerm21_0_8MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-272)*N + (-3408))*N + (-3196))*N + 52212)*N + 121296)

def smallTerm21_0_9MCFC {A : Type*} [CommRing A] (N : A) : A := (((((-192)*N + (-288))*N + 9744)*N + 46296)*N + 59520)

def smallTerm21_0_10MCFC {A : Type*} [CommRing A] (N : A) : A := ((((32*N + 1216)*N + 8152)*N + 20288)*N + 17568)

def smallTerm21_0_11MCFC {A : Type*} [CommRing A] (N : A) : A := ((((64*N + 672)*N + 2576)*N + 4296)*N + 2640)

def smallTerm21_0_12MCFC {A : Type*} [CommRing A] (N : A) : A := ((((16*N + 112)*N + 284)*N + 308)*N + 120)

def smallTerm21_1_2MCFC {A : Type*} [CommRing A] (N : A) : A := (-384)

def smallTerm21_1_3MCFC {A : Type*} [CommRing A] (N : A) : A := (-5376)

def smallTerm21_1_4MCFC {A : Type*} [CommRing A] (N : A) : A := (-29568)

def smallTerm21_1_5MCFC {A : Type*} [CommRing A] (N : A) : A := (-89088)

def smallTerm21_1_6MCFC {A : Type*} [CommRing A] (N : A) : A := (-166656)

def smallTerm21_1_7MCFC {A : Type*} [CommRing A] (N : A) : A := (-204288)

def smallTerm21_1_8MCFC {A : Type*} [CommRing A] (N : A) : A := (-166656)

def smallTerm21_1_9MCFC {A : Type*} [CommRing A] (N : A) : A := (-89088)

def smallTerm21_1_10MCFC {A : Type*} [CommRing A] (N : A) : A := (-29568)

def smallTerm21_1_11MCFC {A : Type*} [CommRing A] (N : A) : A := (-5376)

def smallTerm21_1_12MCFC {A : Type*} [CommRing A] (N : A) : A := (-384)

def smallTerm21_2_3MCFC {A : Type*} [CommRing A] (N : A) : A := ((48*N + 216)*N + 240)

def smallTerm21_2_4MCFC {A : Type*} [CommRing A] (N : A) : A := ((288*N + 1728)*N + 2568)

def smallTerm21_2_5MCFC {A : Type*} [CommRing A] (N : A) : A := ((624*N + 5640)*N + 11520)

def smallTerm21_2_6MCFC {A : Type*} [CommRing A] (N : A) : A := ((384*N + 9216)*N + 28896)

def smallTerm21_2_7MCFC {A : Type*} [CommRing A] (N : A) : A := (((-672)*N + 6384)*N + 45024)

def smallTerm21_2_8MCFC {A : Type*} [CommRing A] (N : A) : A := (((-1344)*N + (-2688))*N + 45360)

def smallTerm21_2_9MCFC {A : Type*} [CommRing A] (N : A) : A := (((-672)*N + (-9072))*N + 29568)

def smallTerm21_2_10MCFC {A : Type*} [CommRing A] (N : A) : A := ((384*N + (-7680))*N + 12000)

def smallTerm21_2_11MCFC {A : Type*} [CommRing A] (N : A) : A := ((624*N + (-3144))*N + 2736)

def smallTerm21_2_12MCFC {A : Type*} [CommRing A] (N : A) : A := ((288*N + (-576))*N + 264)

def smallTerm21_2_13MCFC {A : Type*} [CommRing A] (N : A) : A := ((48*N + (-24))*N)

def smallNumerator21MCFC {A : Type*} [CommRing A] (N Z x : A) : A :=
 smallTerm21_0_0MCFC N*Z^0*x^0 + smallTerm21_0_1MCFC N*Z^0*x^1 + smallTerm21_0_2MCFC N*Z^0*x^2 + smallTerm21_0_3MCFC N*Z^0*x^3 + smallTerm21_0_4MCFC N*Z^0*x^4 + smallTerm21_0_5MCFC N*Z^0*x^5 + smallTerm21_0_6MCFC N*Z^0*x^6 + smallTerm21_0_7MCFC N*Z^0*x^7 + smallTerm21_0_8MCFC N*Z^0*x^8 + smallTerm21_0_9MCFC N*Z^0*x^9 + smallTerm21_0_10MCFC N*Z^0*x^10 + smallTerm21_0_11MCFC N*Z^0*x^11 + smallTerm21_0_12MCFC N*Z^0*x^12 + smallTerm21_1_2MCFC N*Z^1*x^2 + smallTerm21_1_3MCFC N*Z^1*x^3 + smallTerm21_1_4MCFC N*Z^1*x^4 + smallTerm21_1_5MCFC N*Z^1*x^5 + smallTerm21_1_6MCFC N*Z^1*x^6 + smallTerm21_1_7MCFC N*Z^1*x^7 + smallTerm21_1_8MCFC N*Z^1*x^8 + smallTerm21_1_9MCFC N*Z^1*x^9 + smallTerm21_1_10MCFC N*Z^1*x^10 + smallTerm21_1_11MCFC N*Z^1*x^11 + smallTerm21_1_12MCFC N*Z^1*x^12 + smallTerm21_2_3MCFC N*Z^2*x^3 + smallTerm21_2_4MCFC N*Z^2*x^4 + smallTerm21_2_5MCFC N*Z^2*x^5 + smallTerm21_2_6MCFC N*Z^2*x^6 + smallTerm21_2_7MCFC N*Z^2*x^7 + smallTerm21_2_8MCFC N*Z^2*x^8 + smallTerm21_2_9MCFC N*Z^2*x^9 + smallTerm21_2_10MCFC N*Z^2*x^10 + smallTerm21_2_11MCFC N*Z^2*x^11 + smallTerm21_2_12MCFC N*Z^2*x^12 + smallTerm21_2_13MCFC N*Z^2*x^13

theorem small_numerator_identity21MCFC {A : Type*} [CommRing A] (N Z x : A) :
 fourthNumeratorBC N Z x 2 1+(12*(Z^2*x^3)*(1-x)^4*(2*(firstNumBC N Z 2 1 0 x)^2+4*(firstNumBC N Z 2 1 0 x)*(1+x)*(1-x)^2+6*(1+x)^2*(1-x)^4-(secondNumBC N Z 2 1 0 x)))=smallNumerator21MCFC N Z x := by
 rw [fourthNumerator_fullFA]
 unfold fullNumeratorFA fourthCountCorrectionFA
 norm_num only [show (2*1-2:ℕ)=0 by decide,show (min (2-1) (3*1-2):ℕ)=1 by decide,show (3*1-2*2:ℕ)=0 by decide]
 norm_num [firstNumBC,secondNumBC,fullH0FA,fullH1FA,fullH2FA,fullH3FA,fullH4FA,runH0n0FA,runH0n1FA,runH0n2FA,runH0n3FA,runH0n4FA,runH1n0FA,runH1n1FA,runH1n2FA,runH1n3FA,smallNumerator21MCFC,smallTerm21_0_0MCFC,smallTerm21_0_1MCFC,smallTerm21_0_2MCFC,smallTerm21_0_3MCFC,smallTerm21_0_4MCFC,smallTerm21_0_5MCFC,smallTerm21_0_6MCFC,smallTerm21_0_7MCFC,smallTerm21_0_8MCFC,smallTerm21_0_9MCFC,smallTerm21_0_10MCFC,smallTerm21_0_11MCFC,smallTerm21_0_12MCFC,smallTerm21_1_2MCFC,smallTerm21_1_3MCFC,smallTerm21_1_4MCFC,smallTerm21_1_5MCFC,smallTerm21_1_6MCFC,smallTerm21_1_7MCFC,smallTerm21_1_8MCFC,smallTerm21_1_9MCFC,smallTerm21_1_10MCFC,smallTerm21_1_11MCFC,smallTerm21_1_12MCFC,smallTerm21_2_3MCFC,smallTerm21_2_4MCFC,smallTerm21_2_5MCFC,smallTerm21_2_6MCFC,smallTerm21_2_7MCFC,smallTerm21_2_8MCFC,smallTerm21_2_9MCFC,smallTerm21_2_10MCFC,smallTerm21_2_11MCFC,smallTerm21_2_12MCFC,smallTerm21_2_13MCFC]
 <;> ring

theorem source_small_numerator21MCFC (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=2) (hr : (frame rest).mid.a=1) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 smallNumerator21MCFC (n:ℤ[X]) (X^n) X := by
 rw [source_corrected_numeratorM0A5,hc,hr]
 unfold correctedFourthNumeratorM0A5 cycleNumeratorCorrectionM0A5
 norm_num only
 have hp : (X:ℤ[X])^(2*(n+1)+1)=(X^n)^2*X^3 := by
  rw [←pow_mul,←pow_add]
  congr 1
  omega
 rw [hp]
 exact small_numerator_identity21MCFC _ _ _

def smallValue21MCFC (n j : ℕ) : ℤ :=
 smallTerm21_0_0MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+0) + smallTerm21_0_1MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+1) + smallTerm21_0_2MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+2) + smallTerm21_0_3MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+3) + smallTerm21_0_4MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+4) + smallTerm21_0_5MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+5) + smallTerm21_0_6MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+6) + smallTerm21_0_7MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+7) + smallTerm21_0_8MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+8) + smallTerm21_0_9MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+9) + smallTerm21_0_10MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+10) + smallTerm21_0_11MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+11) + smallTerm21_0_12MCFC (n:ℤ)*chooseShiftSevenK0B j (0*n+12) + smallTerm21_1_2MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+2) + smallTerm21_1_3MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+3) + smallTerm21_1_4MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+4) + smallTerm21_1_5MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+5) + smallTerm21_1_6MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+6) + smallTerm21_1_7MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+7) + smallTerm21_1_8MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+8) + smallTerm21_1_9MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+9) + smallTerm21_1_10MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+10) + smallTerm21_1_11MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+11) + smallTerm21_1_12MCFC (n:ℤ)*chooseShiftSevenK0B j (1*n+12) + smallTerm21_2_3MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+3) + smallTerm21_2_4MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+4) + smallTerm21_2_5MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+5) + smallTerm21_2_6MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+6) + smallTerm21_2_7MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+7) + smallTerm21_2_8MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+8) + smallTerm21_2_9MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+9) + smallTerm21_2_10MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+10) + smallTerm21_2_11MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+11) + smallTerm21_2_12MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+12) + smallTerm21_2_13MCFC (n:ℤ)*chooseShiftSevenK0B j (2*n+13)

theorem small_numerator_expand21MCFC (n : ℕ) :
 smallNumerator21MCFC (n:ℤ[X]) (X^n) X=
 C (smallTerm21_0_0MCFC (n:ℤ))*X^(0*n+0) + C (smallTerm21_0_1MCFC (n:ℤ))*X^(0*n+1) + C (smallTerm21_0_2MCFC (n:ℤ))*X^(0*n+2) + C (smallTerm21_0_3MCFC (n:ℤ))*X^(0*n+3) + C (smallTerm21_0_4MCFC (n:ℤ))*X^(0*n+4) + C (smallTerm21_0_5MCFC (n:ℤ))*X^(0*n+5) + C (smallTerm21_0_6MCFC (n:ℤ))*X^(0*n+6) + C (smallTerm21_0_7MCFC (n:ℤ))*X^(0*n+7) + C (smallTerm21_0_8MCFC (n:ℤ))*X^(0*n+8) + C (smallTerm21_0_9MCFC (n:ℤ))*X^(0*n+9) + C (smallTerm21_0_10MCFC (n:ℤ))*X^(0*n+10) + C (smallTerm21_0_11MCFC (n:ℤ))*X^(0*n+11) + C (smallTerm21_0_12MCFC (n:ℤ))*X^(0*n+12) + C (smallTerm21_1_2MCFC (n:ℤ))*X^(1*n+2) + C (smallTerm21_1_3MCFC (n:ℤ))*X^(1*n+3) + C (smallTerm21_1_4MCFC (n:ℤ))*X^(1*n+4) + C (smallTerm21_1_5MCFC (n:ℤ))*X^(1*n+5) + C (smallTerm21_1_6MCFC (n:ℤ))*X^(1*n+6) + C (smallTerm21_1_7MCFC (n:ℤ))*X^(1*n+7) + C (smallTerm21_1_8MCFC (n:ℤ))*X^(1*n+8) + C (smallTerm21_1_9MCFC (n:ℤ))*X^(1*n+9) + C (smallTerm21_1_10MCFC (n:ℤ))*X^(1*n+10) + C (smallTerm21_1_11MCFC (n:ℤ))*X^(1*n+11) + C (smallTerm21_1_12MCFC (n:ℤ))*X^(1*n+12) + C (smallTerm21_2_3MCFC (n:ℤ))*X^(2*n+3) + C (smallTerm21_2_4MCFC (n:ℤ))*X^(2*n+4) + C (smallTerm21_2_5MCFC (n:ℤ))*X^(2*n+5) + C (smallTerm21_2_6MCFC (n:ℤ))*X^(2*n+6) + C (smallTerm21_2_7MCFC (n:ℤ))*X^(2*n+7) + C (smallTerm21_2_8MCFC (n:ℤ))*X^(2*n+8) + C (smallTerm21_2_9MCFC (n:ℤ))*X^(2*n+9) + C (smallTerm21_2_10MCFC (n:ℤ))*X^(2*n+10) + C (smallTerm21_2_11MCFC (n:ℤ))*X^(2*n+11) + C (smallTerm21_2_12MCFC (n:ℤ))*X^(2*n+12) + C (smallTerm21_2_13MCFC (n:ℤ))*X^(2*n+13) := by
 unfold smallNumerator21MCFC smallTerm21_0_0MCFC smallTerm21_0_1MCFC smallTerm21_0_2MCFC smallTerm21_0_3MCFC smallTerm21_0_4MCFC smallTerm21_0_5MCFC smallTerm21_0_6MCFC smallTerm21_0_7MCFC smallTerm21_0_8MCFC smallTerm21_0_9MCFC smallTerm21_0_10MCFC smallTerm21_0_11MCFC smallTerm21_0_12MCFC smallTerm21_1_2MCFC smallTerm21_1_3MCFC smallTerm21_1_4MCFC smallTerm21_1_5MCFC smallTerm21_1_6MCFC smallTerm21_1_7MCFC smallTerm21_1_8MCFC smallTerm21_1_9MCFC smallTerm21_1_10MCFC smallTerm21_1_11MCFC smallTerm21_1_12MCFC smallTerm21_2_3MCFC smallTerm21_2_4MCFC smallTerm21_2_5MCFC smallTerm21_2_6MCFC smallTerm21_2_7MCFC smallTerm21_2_8MCFC smallTerm21_2_9MCFC smallTerm21_2_10MCFC smallTerm21_2_11MCFC smallTerm21_2_12MCFC smallTerm21_2_13MCFC
 simp only [map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_natCast,pow_add,pow_mul]
 ring

theorem source_small_value21MCFC (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=2) (hr : (frame rest).mid.a=1) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=smallValue21MCFC n j := by
 have h := coeff_of_one_sub_mul_rangeBC _ _ 7 j (source_small_numerator21MCFC n rest hc hr)
 simp only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs] at h
 change _=convSevenK0B (smallNumerator21MCFC (n:ℤ[X]) (X^n) X) j at h
 rw [small_numerator_expand21MCFC] at h
 simpa only [convSeven_addK0B,convSeven_monomialK0B,smallValue21MCFC,source_cut_coeffA27 _ i j 4 hs] using h
end
end MathGKM.Markov
