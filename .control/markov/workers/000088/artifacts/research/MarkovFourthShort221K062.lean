import MarkovFourthAllCyclesBE
/-! Machine-authored 062809ba: exact short-cycle cut polynomial. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem cut221_0_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 1=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut221_0_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 2=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut221_0_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 3=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut221_0_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 4=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut221_1_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 1=p*(1+1*X^1)+q*(1+1*X^1) := by
 rw [cutCoeffA27,cut221_0_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_1_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 2=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut221_0_2K062,cut221_0_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_1_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 3=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut221_0_3K062,cut221_0_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_1_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut221_0_4K062,cut221_0_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_2_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 1=p*(1+2*X^1+1*X^2)+q*(2+4*X^1+2*X^2) := by
 rw [cutCoeffA27,cut221_1_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_2_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 2=p*(1+3*X^1+3*X^2+1*X^3)+q*(1+3*X^1+3*X^2+1*X^3) := by
 rw [cutCoeffA27,cut221_1_2K062,cut221_1_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_2_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 3=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut221_1_3K062,cut221_1_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_2_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut221_1_4K062,cut221_1_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_3_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 1=p*(1+2*X^1+2*X^2+1*X^3)+q*(3+7*X^1+6*X^2+2*X^3) := by
 rw [cutCoeffA27,cut221_2_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_3_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 2=p*(2+8*X^1+12*X^2+8*X^3+2*X^4)+q*(3+12*X^1+18*X^2+12*X^3+3*X^4) := by
 rw [cutCoeffA27,cut221_2_2K062,cut221_2_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_3_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 3=p*(1+5*X^1+10*X^2+10*X^3+5*X^4+1*X^5)+q*(1+5*X^1+10*X^2+10*X^3+5*X^4+1*X^5) := by
 rw [cutCoeffA27,cut221_2_3K062,cut221_2_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_3_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut221_2_4K062,cut221_2_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_4_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true] 1=p*(1)+q*(4+7*X^1+6*X^2+2*X^3) := by
 rw [cutCoeffA27,cut221_3_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_4_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true] 2=p*(3+8*X^1+8*X^2+4*X^3+1*X^4)+q*(6+20*X^1+26*X^2+16*X^3+4*X^4) := by
 rw [cutCoeffA27,cut221_3_2K062,cut221_3_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_4_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true] 3=p*(3+14*X^1+26*X^2+24*X^3+11*X^4+2*X^5)+q*(4+19*X^1+36*X^2+34*X^3+16*X^4+3*X^5) := by
 rw [cutCoeffA27,cut221_3_3K062,cut221_3_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_4_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true] 4=p*(1+6*X^1+15*X^2+20*X^3+15*X^4+6*X^5+1*X^6)+q*(1+6*X^1+15*X^2+20*X^3+15*X^4+6*X^5+1*X^6) := by
 rw [cutCoeffA27,cut221_3_4K062,cut221_3_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_5_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true] 1=p*(1+2*X^1)+q*(5+10*X^1+6*X^2+2*X^3) := by
 rw [cutCoeffA27,cut221_4_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_5_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true] 2=p*(4+15*X^1+22*X^2+16*X^3+6*X^4+1*X^5)+q*(10+38*X^1+56*X^2+40*X^3+14*X^4+2*X^5) := by
 rw [cutCoeffA27,cut221_4_2K062,cut221_4_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_5_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true] 3=p*(6+32*X^1+71*X^2+84*X^3+56*X^4+20*X^5+3*X^6)+q*(10+54*X^1+121*X^2+144*X^3+96*X^4+34*X^5+5*X^6) := by
 rw [cutCoeffA27,cut221_4_3K062,cut221_4_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_5_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true] 4=p*(4+27*X^1+78*X^2+125*X^3+120*X^4+69*X^5+22*X^6+3*X^7)+q*(5+34*X^1+99*X^2+160*X^3+155*X^4+90*X^5+29*X^6+4*X^7) := by
 rw [cutCoeffA27,cut221_4_4K062,cut221_4_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_6_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true] 1=p*(1+2*X^1+2*X^2)+q*(6+13*X^1+10*X^2+2*X^3) := by
 rw [cutCoeffA27,cut221_5_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_6_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true] 2=p*(5+20*X^1+34*X^2+32*X^3+18*X^4+6*X^5+1*X^6)+q*(15+62*X^1+105*X^2+94*X^3+48*X^4+14*X^5+2*X^6) := by
 rw [cutCoeffA27,cut221_5_2K062,cut221_5_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_6_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true] 3=p*(10+58*X^1+145*X^2+204*X^3+176*X^4+94*X^5+29*X^6+4*X^7)+q*(20+118*X^1+298*X^2+419*X^3+356*X^4+184*X^5+54*X^6+7*X^7) := by
 rw [cutCoeffA27,cut221_5_3K062,cut221_5_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut221_6_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true] 4=p*(10+74*X^1+240*X^2+446*X^3+520*X^4+390*X^5+184*X^6+50*X^7+6*X^8)+q*(15+112*X^1+366*X^2+684*X^3+800*X^4+600*X^5+282*X^6+76*X^7+9*X^8) := by
 rw [cutCoeffA27,cut221_5_4K062,cut221_5_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
def shortFourth221K062 : ℤ[X] := 15+122*X^1+440*X^2+924*X^3+1246*X^4+1120*X^5+672*X^6+260*X^7+59*X^8+6*X^9
theorem shortFourth_poly221K062 :
 cutCoeffA27 (X:ℤ[X]) X 1 [true,true,false,true,true,true] 4=shortFourth221K062 := by
 rw [cut221_6_4K062]
 unfold shortFourth221K062
 ring
theorem shortFourth_lc221K062 (j : ℕ) :
 (shortFourth221K062).coeff j*(shortFourth221K062).coeff (j+2)≤
 ((shortFourth221K062).coeff (j+1))^2 := by
 by_cases hj : j<8
 · interval_cases j <;> norm_num [shortFourth221K062,Polynomial.coeff_add,
     Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,
     Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : (shortFourth221K062).coeff (j+2)=0 := by
     have hj0 : j≠0 := by omega
     have h0 : j+2≠0 := by omega
     have h1 : j+2≠1 := by omega
     have h2 : j+2≠2 := by omega
     have h3 : j+2≠3 := by omega
     have h4 : j+2≠4 := by omega
     have h5 : j+2≠5 := by omega
     have h6 : j+2≠6 := by omega
     have h7 : j+2≠7 := by omega
     have h8 : j+2≠8 := by omega
     have h9 : j+2≠9 := by omega
     simp [shortFourth221K062,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,hj0,h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,eq_comm]
   rw [hz,mul_zero]; exact sq_nonneg _
theorem shortFourth_tail221K062 (rest : List Bool)
 (hc : (frame rest).mid.b=2) (hr : (frame rest).mid.a=1) :
 central28 (List.replicate 2 true++false::rest)++[true]=[true,true,false,true,true,true] := by
 have h := source_run_substitutionBF 2 rest
 rw [source_short_wordBE rest (by omega),hc,hr,sourceWord_central28] at h
 norm_num [shortSourceWordBE,lowerSub487,lowerRun487,List.replicate_succ] at h
 exact h
theorem source_fourth_short221K062 (rest : List Bool)
 (hc : (frame rest).mid.b=2) (hr : (frame rest).mid.a=1)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 rw [source_cut_coeffA27 _ i (j+2) 4 (by omega),
   source_cut_coeffA27 _ (i+2) j 4 (by omega),
   source_cut_coeffA27 _ (i+1) (j+1) 4 (by omega),
   shortFourth_tail221K062 rest hc hr,shortFourth_poly221K062]
 nlinarith only [shortFourth_lc221K062 j]
end
end MathGKM.Markov
