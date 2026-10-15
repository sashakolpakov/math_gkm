import MarkovFullSourceChamber0M06
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallValue2_0M38E (c r : ℤ) (j : ℕ) : ℤ :=
 match j with
 | 0 => ((((81*c + (108*r + (-270)))*c + ((54*r + (-270))*r + 315))*c + (((12*r + (-90))*r + 210)*r + (-150)))*c + ((((1*r + (-10))*r + 35)*r + (-50))*r + 24))
 | 1 => ((((648*c + (972*r + (-2160)))*c + ((540*r + (-2556))*r + 2448))*c + (((132*r + (-984))*r + 2112)*r + (-1032)))*c + ((((12*r + (-124))*r + 432)*r + (-536))*r + 96))
 | 2 => ((((2376*c + (4104*r + (-8100)))*c + ((2574*r + (-11790))*r + 9252))*c + (((700*r + (-5334))*r + 11090)*r + (-3672)))*c + ((((70*r + (-768))*r + 2810)*r + (-3456))*r + 144))
 | 3 => ((((5184*c + (10800*r + (-18000)))*c + ((7848*r + (-35232))*r + 20160))*c + (((2412*r + (-19284))*r + 40320)*r + (-6960)))*c + ((((268*r + (-3204))*r + 12848)*r + (-17256))*r + 96))
 | 4 => ((((7344*c + (19584*r + (-25200)))*c + ((17016*r + (-73512))*r + 24972))*c + (((6024*r + (-50148))*r + 101388)*r + (-4476)))*c + ((((753*r + (-9750))*r + 41331)*r + (-54510))*r + 24))
 | 5 => ((((6912*c + (25344*r + (-21648)))*c + ((27360*r + (-108192))*r + 12240))*c + (((11424*r + (-95760))*r + 172656)*r + 9408))*c + ((((1632*r + (-22272))*r + 94272)*r + (-108000))*r))
 | 6 => ((((4224*c + (23296*r + (-9472)))*c + ((33024*r + (-109248))*r + (-10080)))*c + (((16800*r + (-135168))*r + 191072)*r + 25120))*c + ((((2800*r + (-38944))*r + 155600)*r + (-131936))*r))
 | 7 => ((((1536*c + (14592*r + 320))*c + ((29568*r + (-70464))*r + (-19680)))*c + (((19200*r + (-138768))*r + 124752)*r + 24832))*c + ((((3840*r + (-52192))*r + 183072)*r + (-90944))*r))
 | 8 => ((((256*c + (5632*r + 2304))*c + ((18816*r + (-23808))*r + (-11488)))*c + (((16768*r + (-98496))*r + 32704)*r + 9696))*c + ((((4192*r + (-52704))*r + 145472)*r + (-22080))*r))
 | 9 => ((((1024*r + 768)*c + ((7680*r + (-768))*r + (-1728)))*c + (((10752*r + (-42624))*r + (-9280))*r + (-1152)))*c + ((((3584*r + (-38656))*r + 68224)*r + 10048)*r))
 | 10 => ((((1536*r + 1536)*r + 576)*c + (((4608*r + (-7680))*r + (-5952))*r + (-1536)))*c + ((((2304*r + (-18688))*r + 12384)*r + 4960)*r))
 | 11 => ((((1024*r + 768)*r + 512)*r + 96)*c + ((((1024*r + (-4608))*r + (-1792))*r + (-1152))*r))
 | 12 => ((((256*r)*r + 128)*r)*r)
 | _ => 0

def smallPoly2_0M38E (c r : ℤ) : ℤ[X] :=
 C (smallValue2_0M38E c r 0)*X^0 + C (smallValue2_0M38E c r 1)*X^1 + C (smallValue2_0M38E c r 2)*X^2 + C (smallValue2_0M38E c r 3)*X^3 + C (smallValue2_0M38E c r 4)*X^4 + C (smallValue2_0M38E c r 5)*X^5 + C (smallValue2_0M38E c r 6)*X^6 + C (smallValue2_0M38E c r 7)*X^7 + C (smallValue2_0M38E c r 8)*X^8 + C (smallValue2_0M38E c r 9)*X^9 + C (smallValue2_0M38E c r 10)*X^10 + C (smallValue2_0M38E c r 11)*X^11 + C (smallValue2_0M38E c r 12)*X^12

theorem small_identity2_0M38E (c r : ℤ) :
 chamberNumerator0FA (2:ℤ[X]) (X^2) (C c) (C r) X =
 (1-X)^8*smallPoly2_0M38E c r := by
 unfold chamberNumerator0FA fullH0FA fullH1FA runH0n0FA runH0n1FA runH0n2FA runH0n3FA runH0n4FA runH1n0FA runH1n1FA runH1n2FA runH1n3FA chamberH02FA chamberH03FA chamberH04FA smallPoly2_0M38E smallValue2_0M38E
 simp only [map_add,map_mul,map_pow,map_neg,map_ofNat,map_one,map_zero]
 ring

theorem small_coeff2_0M38E (c r : ℤ) (j : ℕ) : (smallPoly2_0M38E c r).coeff j=smallValue2_0M38E c r j := by
 simp only [smallPoly2_0M38E,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 by_cases hj : j≤12
 · interval_cases j <;> norm_num [smallValue2_0M38E]
 · have h : ∀ k, k≤12 → j≠k := by omega
   simp only [if_neg (h 0 (by omega)),if_neg (h 1 (by omega)),if_neg (h 2 (by omega)),if_neg (h 3 (by omega)),if_neg (h 4 (by omega)),if_neg (h 5 (by omega)),if_neg (h 6 (by omega)),if_neg (h 7 (by omega)),if_neg (h 8 (by omega)),if_neg (h 9 (by omega)),if_neg (h 10 (by omega)),if_neg (h 11 (by omega)),if_neg (h 12 (by omega)),zero_add]
   unfold smallValue2_0M38E
   split <;> omega

theorem source_small_coeff2_0M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a)
 (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate 2 true++false::rest)).mid.p i j=
 smallValue2_0M38E (frame rest).mid.b (frame rest).mid.a j := by
 have h := source_fourth_chamber0_clearedM06 2 rest hc hl hu
 have hid := small_identity2_0M38E ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [C_eq_natCast] at hid
 norm_num only [Nat.cast_zero,Nat.cast_one,Nat.cast_ofNat] at h
 rw [hid] at h
 have hn : (1-(X:ℤ[X]))^8≠0 := by
  apply pow_ne_zero
  intro he
  have he1 := congrArg (fun p : ℤ[X] => p.coeff 1) he
  norm_num [Polynomial.coeff_one] at he1
 have he := mul_left_cancel₀ hn h
 have hh := congrArg (fun p : ℤ[X] => p.coeff j) he
 simpa only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs,small_coeff2_0M38E] using hh
end
end MathGKM.Markov
