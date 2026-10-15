import MarkovFullSourceChamber0M06
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536

def smallValue0_0M38E (c r : ℤ) (j : ℕ) : ℤ :=
 match j with
 | 0 => ((((1*c + (4*r + (-10)))*c + ((6*r + (-30))*r + 35))*c + (((4*r + (-30))*r + 70)*r + (-50)))*c + ((((1*r + (-10))*r + 35)*r + (-50))*r + 24))
 | 1 => ((((12*r + 8)*c + ((36*r + (-108))*r + (-48)))*c + (((36*r + (-240))*r + 384)*r + 40))*c + ((((12*r + (-124))*r + 432)*r + (-536))*r + 96))
 | 2 => ((((54*r + 42)*r + 24)*c + (((108*r + (-438))*r + (-150))*r + (-120)))*c + ((((54*r + (-480))*r + 1098)*r + (-96))*r + 144))
 | 3 => ((((108*r + 36)*r + 96)*r)*c + ((((108*r + (-612))*r + 144)*r + (-456))*r + 96))
 | 4 => ((((81*r + (-54))*r + 147)*r + (-78))*r + 24)
 | _ => 0

def smallPoly0_0M38E (c r : ℤ) : ℤ[X] :=
 C (smallValue0_0M38E c r 0)*X^0 + C (smallValue0_0M38E c r 1)*X^1 + C (smallValue0_0M38E c r 2)*X^2 + C (smallValue0_0M38E c r 3)*X^3 + C (smallValue0_0M38E c r 4)*X^4

theorem small_identity0_0M38E (c r : ℤ) :
 chamberNumerator0FA (0:ℤ[X]) (X^0) (C c) (C r) X =
 (1-X)^8*smallPoly0_0M38E c r := by
 unfold chamberNumerator0FA fullH0FA fullH1FA runH0n0FA runH0n1FA runH0n2FA runH0n3FA runH0n4FA runH1n0FA runH1n1FA runH1n2FA runH1n3FA chamberH02FA chamberH03FA chamberH04FA smallPoly0_0M38E smallValue0_0M38E
 simp only [map_add,map_mul,map_pow,map_neg,map_ofNat,map_one,map_zero]
 ring

theorem small_coeff0_0M38E (c r : ℤ) (j : ℕ) : (smallPoly0_0M38E c r).coeff j=smallValue0_0M38E c r j := by
 simp only [smallPoly0_0M38E,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 by_cases hj : j≤4
 · interval_cases j <;> norm_num [smallValue0_0M38E]
 · have h : ∀ k, k≤4 → j≠k := by omega
   simp only [if_neg (h 0 (by omega)),if_neg (h 1 (by omega)),if_neg (h 2 (by omega)),if_neg (h 3 (by omega)),if_neg (h 4 (by omega)),zero_add]
   unfold smallValue0_0M38E
   split <;> omega

theorem source_small_coeff0_0M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a)
 (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate 0 true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate 0 true++false::rest)).mid.p i j=
 smallValue0_0M38E (frame rest).mid.b (frame rest).mid.a j := by
 have h := source_fourth_chamber0_clearedM06 0 rest hc hl hu
 have hid := small_identity0_0M38E ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [map_natCast] at hid
 norm_num only [Nat.cast_zero,Nat.cast_one,Nat.cast_ofNat] at h
 rw [hid] at h
 have hn : (1-(X:ℤ[X]))^8≠0 := by
  apply pow_ne_zero
  intro he
  have he1 := congrArg (fun p : ℤ[X] => p.coeff 1) he
  norm_num [Polynomial.coeff_one] at he1
 have he := mul_left_cancel₀ hn h
 have hh := congrArg (fun p : ℤ[X] => p.coeff j) he
 simpa only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs,small_coeff0_0M38E] using hh
end
end MathGKM.Markov
