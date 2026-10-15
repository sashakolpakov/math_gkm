import MarkovFourthAllCyclesBE
/-! Machine-authored 062809ba: exact short-cycle cut polynomial. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem cut232_0_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 1=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut232_0_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 2=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut232_0_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 3=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut232_0_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 4=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut232_1_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 1=p*(1+1*X^1)+q*(1+1*X^1) := by
 rw [cutCoeffA27,cut232_0_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_1_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 2=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut232_0_2K062,cut232_0_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_1_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 3=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut232_0_3K062,cut232_0_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_1_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut232_0_4K062,cut232_0_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_2_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 1=p*(1+2*X^1+1*X^2)+q*(2+4*X^1+2*X^2) := by
 rw [cutCoeffA27,cut232_1_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_2_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 2=p*(1+3*X^1+3*X^2+1*X^3)+q*(1+3*X^1+3*X^2+1*X^3) := by
 rw [cutCoeffA27,cut232_1_2K062,cut232_1_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_2_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 3=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut232_1_3K062,cut232_1_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_2_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut232_1_4K062,cut232_1_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_3_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 1=p*(1+2*X^1+2*X^2+1*X^3)+q*(3+7*X^1+6*X^2+2*X^3) := by
 rw [cutCoeffA27,cut232_2_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_3_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 2=p*(2+8*X^1+12*X^2+8*X^3+2*X^4)+q*(3+12*X^1+18*X^2+12*X^3+3*X^4) := by
 rw [cutCoeffA27,cut232_2_2K062,cut232_2_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_3_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 3=p*(1+5*X^1+10*X^2+10*X^3+5*X^4+1*X^5)+q*(1+5*X^1+10*X^2+10*X^3+5*X^4+1*X^5) := by
 rw [cutCoeffA27,cut232_2_3K062,cut232_2_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_3_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut232_2_4K062,cut232_2_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_4_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true] 1=p*(1)+q*(4+7*X^1+6*X^2+2*X^3) := by
 rw [cutCoeffA27,cut232_3_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_4_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true] 2=p*(3+8*X^1+8*X^2+4*X^3+1*X^4)+q*(6+20*X^1+26*X^2+16*X^3+4*X^4) := by
 rw [cutCoeffA27,cut232_3_2K062,cut232_3_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_4_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true] 3=p*(3+14*X^1+26*X^2+24*X^3+11*X^4+2*X^5)+q*(4+19*X^1+36*X^2+34*X^3+16*X^4+3*X^5) := by
 rw [cutCoeffA27,cut232_3_3K062,cut232_3_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_4_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true] 4=p*(1+6*X^1+15*X^2+20*X^3+15*X^4+6*X^5+1*X^6)+q*(1+6*X^1+15*X^2+20*X^3+15*X^4+6*X^5+1*X^6) := by
 rw [cutCoeffA27,cut232_3_4K062,cut232_3_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_5_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true] 1=p*(1+2*X^1)+q*(5+10*X^1+6*X^2+2*X^3) := by
 rw [cutCoeffA27,cut232_4_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_5_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true] 2=p*(4+15*X^1+22*X^2+16*X^3+6*X^4+1*X^5)+q*(10+38*X^1+56*X^2+40*X^3+14*X^4+2*X^5) := by
 rw [cutCoeffA27,cut232_4_2K062,cut232_4_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_5_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true] 3=p*(6+32*X^1+71*X^2+84*X^3+56*X^4+20*X^5+3*X^6)+q*(10+54*X^1+121*X^2+144*X^3+96*X^4+34*X^5+5*X^6) := by
 rw [cutCoeffA27,cut232_4_3K062,cut232_4_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_5_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true] 4=p*(4+27*X^1+78*X^2+125*X^3+120*X^4+69*X^5+22*X^6+3*X^7)+q*(5+34*X^1+99*X^2+160*X^3+155*X^4+90*X^5+29*X^6+4*X^7) := by
 rw [cutCoeffA27,cut232_4_4K062,cut232_4_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_6_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true] 1=p*(1+2*X^1+2*X^2)+q*(6+13*X^1+10*X^2+2*X^3) := by
 rw [cutCoeffA27,cut232_5_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_6_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true] 2=p*(5+20*X^1+34*X^2+32*X^3+18*X^4+6*X^5+1*X^6)+q*(15+62*X^1+105*X^2+94*X^3+48*X^4+14*X^5+2*X^6) := by
 rw [cutCoeffA27,cut232_5_2K062,cut232_5_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_6_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true] 3=p*(10+58*X^1+145*X^2+204*X^3+176*X^4+94*X^5+29*X^6+4*X^7)+q*(20+118*X^1+298*X^2+419*X^3+356*X^4+184*X^5+54*X^6+7*X^7) := by
 rw [cutCoeffA27,cut232_5_3K062,cut232_5_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_6_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true] 4=p*(10+74*X^1+240*X^2+446*X^3+520*X^4+390*X^5+184*X^6+50*X^7+6*X^8)+q*(15+112*X^1+366*X^2+684*X^3+800*X^4+600*X^5+282*X^6+76*X^7+9*X^8) := by
 rw [cutCoeffA27,cut232_5_4K062,cut232_5_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_7_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true] 1=p*(1+2*X^1+2*X^2+2*X^3)+q*(7+16*X^1+14*X^2+6*X^3) := by
 rw [cutCoeffA27,cut232_6_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_7_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true] 2=p*(6+25*X^1+46*X^2+50*X^3+36*X^4+18*X^5+6*X^6+1*X^7)+q*(21+92*X^1+171*X^2+178*X^3+116*X^4+50*X^5+14*X^6+2*X^7) := by
 rw [cutCoeffA27,cut232_6_2K062,cut232_6_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_7_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true] 3=p*(15+92*X^1+250*X^2+398*X^3+412*X^4+288*X^5+134*X^6+38*X^7+5*X^8)+q*(35+220*X^1+606*X^2+962*X^3+972*X^4+648*X^5+282*X^6+74*X^7+9*X^8) := by
 rw [cutCoeffA27,cut232_6_3K062,cut232_6_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_7_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true] 4=p*(20+158*X^1+558*X^2+1160*X^3+1570*X^4+1440*X^5+898*X^6+368*X^7+90*X^8+10*X^9)+q*(35+280*X^1+998*X^2+2084*X^3+2816*X^4+2560*X^5+1570*X^6+628*X^7+149*X^8+16*X^9) := by
 rw [cutCoeffA27,cut232_6_4K062,cut232_6_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_8_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,false,true,true,true] 1=p*(1)+q*(8+16*X^1+14*X^2+6*X^3) := by
 rw [cutCoeffA27,cut232_7_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_8_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,false,true,true,true] 2=p*(7+17*X^1+16*X^2+8*X^3+2*X^4)+q*(28+109*X^1+187*X^2+186*X^3+118*X^4+50*X^5+14*X^6+2*X^7) := by
 rw [cutCoeffA27,cut232_7_2K062,cut232_7_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_8_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,false,true,true,true] 3=p*(21+98*X^1+196*X^2+224*X^3+166*X^4+86*X^5+32*X^6+8*X^7+1*X^8)+q*(56+318*X^1+802*X^2+1186*X^3+1138*X^4+734*X^5+314*X^6+82*X^7+10*X^8) := by
 rw [cutCoeffA27,cut232_7_3K062,cut232_7_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_8_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,false,true,true,true] 4=p*(35+235*X^1+698*X^2+1212*X^3+1370*X^4+1060*X^5+570*X^6+208*X^7+47*X^8+5*X^9)+q*(70+515*X^1+1696*X^2+3296*X^3+4186*X^4+3620*X^5+2140*X^6+836*X^7+196*X^8+21*X^9) := by
 rw [cutCoeffA27,cut232_7_4K062,cut232_7_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_9_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,false,true,true,true] 1=p*(1+2*X^1)+q*(9+19*X^1+14*X^2+6*X^3) := by
 rw [cutCoeffA27,cut232_8_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_9_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,false,true,true,true] 2=p*(8+32*X^1+48*X^2+36*X^3+14*X^4+2*X^5)+q*(36+148*X^1+252*X^2+238*X^3+140*X^4+54*X^5+14*X^6+2*X^7) := by
 rw [cutCoeffA27,cut232_8_2K062,cut232_8_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_9_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,false,true,true,true] 3=p*(28+165*X^1+418*X^2+602*X^3+552*X^4+344*X^5+152*X^6+48*X^7+10*X^8+1*X^9)+q*(84+504*X^1+1318*X^2+1984*X^3+1914*X^4+1244*X^5+552*X^6+162*X^7+28*X^8+2*X^9) := by
 rw [cutCoeffA27,cut232_8_3K062,cut232_8_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_9_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,false,true,true,true] 4=p*(56+430*X^1+1474*X^2+2980*X^3+3956*X^4+3632*X^5+2360*X^6+1084*X^7+340*X^8+66*X^9+6*X^10)+q*(126+980*X^1+3405*X^2+6974*X^3+9354*X^4+8622*X^5+5560*X^6+2490*X^7+744*X^8+134*X^9+11*X^10) := by
 rw [cutCoeffA27,cut232_8_4K062,cut232_8_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_10_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,false,true,true,true] 1=p*(1+2*X^1+2*X^2)+q*(10+22*X^1+18*X^2+6*X^3) := by
 rw [cutCoeffA27,cut232_9_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_10_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,false,true,true,true] 2=p*(9+37*X^1+68*X^2+70*X^3+42*X^4+14*X^5+2*X^6)+q*(45+193*X^1+352*X^2+356*X^3+218*X^4+82*X^5+18*X^6+2*X^7) := by
 rw [cutCoeffA27,cut232_9_2K062,cut232_9_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_10_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,false,true,true,true] 3=p*(36+220*X^1+605*X^2+988*X^3+1064*X^4+796*X^5+428*X^6+170*X^7+50*X^8+10*X^9+1*X^10)+q*(120+752*X^1+2088*X^2+3390*X^3+3580*X^4+2592*X^5+1324*X^6+484*X^7+126*X^8+22*X^9+2*X^10) := by
 rw [cutCoeffA27,cut232_9_3K062,cut232_9_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut232_10_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,false,true,true,true] 4=p*(84+672*X^1+2445*X^2+5359*X^3+7898*X^4+8268*X^5+6324*X^6+3570*X^7+1474*X^8+428*X^9+79*X^10+7*X^11)+q*(210+1708*X^1+6280*X^2+13807*X^3+20232*X^4+20846*X^5+15516*X^6+8420*X^7+3302*X^8+902*X^9+156*X^10+13*X^11) := by
 rw [cutCoeffA27,cut232_9_4K062,cut232_9_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
def shortFourth232K062 : ℤ[X] := 210+1792*X^1+6952*X^2+16252*X^3+25591*X^4+28744*X^5+23784*X^6+14744*X^7+6872*X^8+2376*X^9+584*X^10+92*X^11+7*X^12
theorem shortFourth_poly232K062 :
 cutCoeffA27 (X:ℤ[X]) X 1 [true,true,false,true,true,true,false,true,true,true] 4=shortFourth232K062 := by
 rw [cut232_10_4K062]
 unfold shortFourth232K062
 ring
theorem shortFourth_lc232K062 (j : ℕ) :
 (shortFourth232K062).coeff j*(shortFourth232K062).coeff (j+2)≤
 ((shortFourth232K062).coeff (j+1))^2 := by
 by_cases hj : j<11
 · interval_cases j <;> norm_num [shortFourth232K062,Polynomial.coeff_add,
     Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,
     Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : (shortFourth232K062).coeff (j+2)=0 := by
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
     have h12 : j+2≠12 := by omega
     simp [shortFourth232K062,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,hj0,h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,eq_comm]
   rw [hz,mul_zero]; exact sq_nonneg _
theorem shortFourth_tail232K062 (rest : List Bool)
 (hc : (frame rest).mid.b=3) (hr : (frame rest).mid.a=2) :
 central28 (List.replicate 2 true++false::rest)++[true]=[true,true,false,true,true,true,false,true,true,true] := by
 have h := source_run_substitutionBF 2 rest
 rw [source_short_wordBE rest (by omega),hc,hr,sourceWord_central28] at h
 norm_num [shortSourceWordBE,lowerSub487,lowerRun487,List.replicate_succ] at h
 exact h
theorem source_fourth_short232K062 (rest : List Bool)
 (hc : (frame rest).mid.b=3) (hr : (frame rest).mid.a=2)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 rw [source_cut_coeffA27 _ i (j+2) 4 (by omega),
   source_cut_coeffA27 _ (i+2) j 4 (by omega),
   source_cut_coeffA27 _ (i+1) (j+1) 4 (by omega),
   shortFourth_tail232K062 rest hc hr,shortFourth_poly232K062]
 nlinarith only [shortFourth_lc232K062 j]
end
end MathGKM.Markov
