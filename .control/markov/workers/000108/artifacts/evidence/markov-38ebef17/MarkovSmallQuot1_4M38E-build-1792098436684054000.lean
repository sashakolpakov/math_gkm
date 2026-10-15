import MarkovFullSourceChamber4M06
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallValue1_4M38E (c r : ℤ) (j : ℕ) : ℤ :=
 match j with
 | 0 => ((((16*c + (32*r + (-80)))*c + ((24*r + (-120))*r + 140))*c + (((8*r + (-60))*r + 140)*r + (-100)))*c + ((((1*r + (-10))*r + 35)*r + (-50))*r + 24))
 | 1 => ((((96*c + (240*r + (-464)))*c + ((216*r + (-960))*r + 768))*c + (((84*r + (-612))*r + 1248)*r + (-496)))*c + ((((12*r + (-124))*r + 432)*r + (-536))*r + 96))
 | 2 => ((((216*c + (776*r + (-876)))*c + ((894*r + (-3426))*r + 972))*c + (((420*r + (-3030))*r + 5470)*r + (-216)))*c + ((((70*r + (-768))*r + 2810)*r + (-3456))*r + 144))
 | 3 => ((((216*c + (1332*r + (-384)))*c + ((2124*r + (-6276))*r + (-1200)))*c + (((1260*r + (-8520))*r + 11568)*r + 2232))*c + ((((252*r + (-2820))*r + 9792)*r + (-9192))*r + 96))
 | 4 => ((((81*c + (1188*r + 522))*c + ((3030*r + (-5106))*r + (-3117)))*c + (((2436*r + (-14034))*r + 8790)*r + 3378))*c + ((((609*r + (-6582))*r + 19299)*r + (-7854))*r + 24))
 | 5 => ((((432*r + 240)*c + ((2448*r + (-192))*r + 1008))*c + (((3024*r + (-12096))*r + (-6192))*r + (-6144)))*c + ((((1008*r + (-9600))*r + 17424)*r + 15552)*r))
 | 6 => ((((-576)*c + ((864*r + 1440)*r + 7584))*c + (((2240*r + (-2496))*r + (-13376))*r + (-23328)))*c + ((((1120*r + (-7840))*r + (-4288))*r + 48448)*r))
 | 7 => ((((-432)*c + ((-768)*r + 6768))*c + (((768*r + 3216)*r + (-1008))*r + (-27072)))*c + ((((768*r + (-1696))*r + (-25440))*r + 51904)*r))
 | 8 => ((((-1152)*r + 1248)*c + ((1152*r + 8256)*r + (-10464)))*c + ((((256*r + 2304)*r + (-20992))*r + 20160)*r))
 | 9 => (((-576)*c + (((-768)*r + 2976)*r + 3552))*c + (((1536*r + (-4128))*r + (-4704))*r))
 | 10 => ((192*c + ((-1536)*r + 3072))*c + ((1920*r + (-4608))*r))
 | _ => 0

def smallPoly1_4M38E (c r : ℤ) : ℤ[X] :=
 C (smallValue1_4M38E c r 0)*X^0 + C (smallValue1_4M38E c r 1)*X^1 + C (smallValue1_4M38E c r 2)*X^2 + C (smallValue1_4M38E c r 3)*X^3 + C (smallValue1_4M38E c r 4)*X^4 + C (smallValue1_4M38E c r 5)*X^5 + C (smallValue1_4M38E c r 6)*X^6 + C (smallValue1_4M38E c r 7)*X^7 + C (smallValue1_4M38E c r 8)*X^8 + C (smallValue1_4M38E c r 9)*X^9 + C (smallValue1_4M38E c r 10)*X^10

theorem small_identity1_4M38E (c r : ℤ) :
 chamberNumerator4M06 (1:ℤ[X]) (X^1) (C c) (C r) X =
 (1-X)^8*smallPoly1_4M38E c r := by
 unfold chamberNumerator4M06 fullH0FA fullH1FA runH0n0FA runH0n1FA runH0n2FA runH0n3FA runH0n4FA runH1n0FA runH1n1FA runH1n2FA runH1n3FA chamberHM0642FA chamberHM0643FA chamberHM0644FA smallPoly1_4M38E smallValue1_4M38E
 simp only [map_add,map_mul,map_pow,map_neg,map_ofNat,map_one,map_zero]
 ring

theorem small_coeff1_4M38E (c r : ℤ) (j : ℕ) : (smallPoly1_4M38E c r).coeff j=smallValue1_4M38E c r j := by
 simp only [smallPoly1_4M38E,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 by_cases hj : j≤10
 · interval_cases j <;> norm_num [smallValue1_4M38E]
 · have h : ∀ k, k≤10 → j≠k := by omega
   simp only [if_neg (h 0 (by omega)),if_neg (h 1 (by omega)),if_neg (h 2 (by omega)),if_neg (h 3 (by omega)),if_neg (h 4 (by omega)),if_neg (h 5 (by omega)),if_neg (h 6 (by omega)),if_neg (h 7 (by omega)),if_neg (h 8 (by omega)),if_neg (h 9 (by omega)),if_neg (h 10 (by omega)),zero_add]
   unfold smallValue1_4M38E
   split <;> omega

theorem source_small_coeff1_4M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 2*(frame rest).mid.b<3*(frame rest).mid.a)
 (hu : 4*(frame rest).mid.a<3*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate 1 true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate 1 true++false::rest)).mid.p i j=
 smallValue1_4M38E (frame rest).mid.b (frame rest).mid.a j := by
 have h := source_fourth_chamber4_clearedM06 1 rest hc hl hu
 have hid := small_identity1_4M38E ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [C_eq_natCast] at hid
 norm_num only [Nat.cast_zero,Nat.cast_one,Nat.cast_ofNat] at h
 rw [hid] at h
 have hn : (1-(X:ℤ[X]))^8≠0 := by
  apply pow_ne_zero
  intro he
  have he1 := congrArg (fun p : ℤ[X] => p.coeff 1) he
  norm_num at he1
 have he := mul_left_cancel₀ hn h
 have hh := congrArg (fun p : ℤ[X] => p.coeff j) he
 simpa only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs,small_coeff1_4M38E] using hh
end
end MathGKM.Markov
