import MarkovFourthAllCyclesBE
/-! Machine-authored 062809ba: exact short-cycle cut polynomial. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem cut321_0_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 1=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut321_0_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 2=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut321_0_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 3=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut321_0_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 4=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut321_1_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 1=p*(1+1*X^1)+q*(1+1*X^1) := by
 rw [cutCoeffA27,cut321_0_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_1_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 2=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut321_0_2K062,cut321_0_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_1_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 3=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut321_0_3K062,cut321_0_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_1_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut321_0_4K062,cut321_0_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_2_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 1=p*(1+2*X^1+1*X^2)+q*(2+4*X^1+2*X^2) := by
 rw [cutCoeffA27,cut321_1_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_2_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 2=p*(1+3*X^1+3*X^2+1*X^3)+q*(1+3*X^1+3*X^2+1*X^3) := by
 rw [cutCoeffA27,cut321_1_2K062,cut321_1_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_2_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 3=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut321_1_3K062,cut321_1_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_2_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut321_1_4K062,cut321_1_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_3_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 1=p*(1+2*X^1+2*X^2+1*X^3)+q*(3+7*X^1+6*X^2+2*X^3) := by
 rw [cutCoeffA27,cut321_2_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_3_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 2=p*(2+8*X^1+12*X^2+8*X^3+2*X^4)+q*(3+12*X^1+18*X^2+12*X^3+3*X^4) := by
 rw [cutCoeffA27,cut321_2_2K062,cut321_2_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_3_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 3=p*(1+5*X^1+10*X^2+10*X^3+5*X^4+1*X^5)+q*(1+5*X^1+10*X^2+10*X^3+5*X^4+1*X^5) := by
 rw [cutCoeffA27,cut321_2_3K062,cut321_2_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_3_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut321_2_4K062,cut321_2_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_4_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true] 1=p*(1+2*X^1+2*X^2+2*X^3+1*X^4)+q*(4+10*X^1+10*X^2+6*X^3+2*X^4) := by
 rw [cutCoeffA27,cut321_3_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_4_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true] 2=p*(3+13*X^1+24*X^2+24*X^3+13*X^4+3*X^5)+q*(6+27*X^1+50*X^2+48*X^3+24*X^4+5*X^5) := by
 rw [cutCoeffA27,cut321_3_2K062,cut321_3_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_4_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true] 3=p*(3+18*X^1+45*X^2+60*X^3+45*X^4+18*X^5+3*X^6)+q*(4+24*X^1+60*X^2+80*X^3+60*X^4+24*X^5+4*X^6) := by
 rw [cutCoeffA27,cut321_3_3K062,cut321_3_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_4_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true] 4=p*(1+7*X^1+21*X^2+35*X^3+35*X^4+21*X^5+7*X^6+1*X^7)+q*(1+7*X^1+21*X^2+35*X^3+35*X^4+21*X^5+7*X^6+1*X^7) := by
 rw [cutCoeffA27,cut321_3_4K062,cut321_3_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_5_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true] 1=p*(1)+q*(5+10*X^1+10*X^2+6*X^3+2*X^4) := by
 rw [cutCoeffA27,cut321_4_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_5_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true] 2=p*(4+11*X^1+12*X^2+8*X^3+4*X^4+1*X^5)+q*(10+38*X^1+62*X^2+56*X^3+28*X^4+6*X^5) := by
 rw [cutCoeffA27,cut321_4_2K062,cut321_4_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_5_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true] 3=p*(6+30*X^1+63*X^2+72*X^3+48*X^4+18*X^5+3*X^6)+q*(10+54*X^1+123*X^2+152*X^3+108*X^4+42*X^5+7*X^6) := by
 rw [cutCoeffA27,cut321_4_3K062,cut321_4_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_5_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true] 4=p*(4+27*X^1+78*X^2+125*X^3+120*X^4+69*X^5+22*X^6+3*X^7)+q*(5+34*X^1+99*X^2+160*X^3+155*X^4+90*X^5+29*X^6+4*X^7) := by
 rw [cutCoeffA27,cut321_4_4K062,cut321_4_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_6_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true] 1=p*(1+2*X^1)+q*(6+13*X^1+10*X^2+6*X^3+2*X^4) := by
 rw [cutCoeffA27,cut321_5_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_6_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true] 2=p*(5+20*X^1+32*X^2+28*X^3+16*X^4+6*X^5+1*X^6)+q*(15+62*X^1+105*X^2+96*X^3+52*X^4+16*X^5+2*X^6) := by
 rw [cutCoeffA27,cut321_5_2K062,cut321_5_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_6_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true] 3=p*(10+58*X^1+145*X^2+204*X^3+176*X^4+94*X^5+29*X^6+4*X^7)+q*(20+118*X^1+298*X^2+419*X^3+356*X^4+184*X^5+54*X^6+7*X^7) := by
 rw [cutCoeffA27,cut321_5_3K062,cut321_5_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_6_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true] 4=p*(10+74*X^1+240*X^2+446*X^3+520*X^4+390*X^5+184*X^6+50*X^7+6*X^8)+q*(15+112*X^1+366*X^2+684*X^3+800*X^4+600*X^5+282*X^6+76*X^7+9*X^8) := by
 rw [cutCoeffA27,cut321_5_4K062,cut321_5_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_7_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true] 1=p*(1+2*X^1+2*X^2)+q*(7+16*X^1+14*X^2+6*X^3+2*X^4) := by
 rw [cutCoeffA27,cut321_6_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_7_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true] 2=p*(6+25*X^1+46*X^2+50*X^3+36*X^4+18*X^5+6*X^6+1*X^7)+q*(21+92*X^1+171*X^2+178*X^3+116*X^4+50*X^5+14*X^6+2*X^7) := by
 rw [cutCoeffA27,cut321_6_2K062,cut321_6_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_7_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true] 3=p*(15+92*X^1+250*X^2+398*X^3+412*X^4+288*X^5+134*X^6+38*X^7+5*X^8)+q*(35+220*X^1+606*X^2+962*X^3+972*X^4+648*X^5+282*X^6+74*X^7+9*X^8) := by
 rw [cutCoeffA27,cut321_6_3K062,cut321_6_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_7_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true] 4=p*(20+158*X^1+558*X^2+1160*X^3+1570*X^4+1440*X^5+898*X^6+368*X^7+90*X^8+10*X^9)+q*(35+280*X^1+998*X^2+2084*X^3+2816*X^4+2560*X^5+1570*X^6+628*X^7+149*X^8+16*X^9) := by
 rw [cutCoeffA27,cut321_6_4K062,cut321_6_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_8_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true] 1=p*(1+2*X^1+2*X^2+2*X^3)+q*(8+19*X^1+18*X^2+10*X^3+2*X^4) := by
 rw [cutCoeffA27,cut321_7_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_8_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true] 2=p*(7+30*X^1+58*X^2+70*X^3+60*X^4+38*X^5+18*X^6+6*X^7+1*X^8)+q*(28+128*X^1+254*X^2+294*X^3+226*X^4+124*X^5+50*X^6+14*X^7+2*X^8) := by
 rw [cutCoeffA27,cut321_7_2K062,cut321_7_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_8_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true] 3=p*(21+134*X^1+386*X^2+670*X^3+788*X^4+664*X^5+406*X^6+174*X^7+47*X^8+6*X^9)+q*(56+369*X^1+1084*X^2+1882*X^3+2158*X^4+1724*X^5+976*X^6+382*X^7+94*X^8+11*X^9) := by
 rw [cutCoeffA27,cut321_7_3K062,cut321_7_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut321_8_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true] 4=p*(35+290*X^1+1091*X^2+2468*X^3+3742*X^4+4000*X^5+3070*X^6+1676*X^7+623*X^8+142*X^9+15*X^10)+q*(70+590*X^1+2247*X^2+5110*X^3+7718*X^4+8130*X^5+6080*X^6+3202*X^7+1140*X^8+248*X^9+25*X^10) := by
 rw [cutCoeffA27,cut321_7_4K062,cut321_7_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
def shortFourth321K062 : ℤ[X] := 70+625*X^1+2537*X^2+6201*X^3+10186*X^4+11872*X^5+10080*X^6+6272*X^7+2816*X^8+871*X^9+167*X^10+15*X^11
theorem shortFourth_poly321K062 :
 cutCoeffA27 (X:ℤ[X]) X 1 [true,true,true,false,true,true,true,true] 4=shortFourth321K062 := by
 rw [cut321_8_4K062]
 unfold shortFourth321K062
 ring
theorem shortFourth_lc321K062 (j : ℕ) :
 (shortFourth321K062).coeff j*(shortFourth321K062).coeff (j+2)≤
 ((shortFourth321K062).coeff (j+1))^2 := by
 by_cases hj : j<10
 · interval_cases j <;> norm_num [shortFourth321K062,Polynomial.coeff_add,
     Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,
     Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : (shortFourth321K062).coeff (j+2)=0 := by
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
     have h10 : j+2≠10 := by omega
     have h11 : j+2≠11 := by omega
     simp [shortFourth321K062,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,hj0,h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,eq_comm]
   rw [hz,mul_zero]; exact sq_nonneg _
theorem shortFourth_tail321K062 (rest : List Bool)
 (hc : (frame rest).mid.b=2) (hr : (frame rest).mid.a=1) :
 central28 (List.replicate 3 true++false::rest)++[true]=[true,true,true,false,true,true,true,true] := by
 have h := source_run_substitutionBF 3 rest
 rw [source_short_wordBE rest (by omega),hc,hr,sourceWord_central28] at h
 norm_num [shortSourceWordBE,lowerSub487,lowerRun487,List.replicate_succ] at h
 exact h
theorem source_fourth_short321K062 (rest : List Bool)
 (hc : (frame rest).mid.b=2) (hr : (frame rest).mid.a=1)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate 3 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 3 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 3 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 3 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 rw [source_cut_coeffA27 _ i (j+2) 4 (by omega),
   source_cut_coeffA27 _ (i+2) j 4 (by omega),
   source_cut_coeffA27 _ (i+1) (j+1) 4 (by omega),
   shortFourth_tail321K062 rest hc hr,shortFourth_poly321K062]
 nlinarith only [shortFourth_lc321K062 j]
end
end MathGKM.Markov
