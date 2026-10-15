import MarkovFourthAllCyclesBE
/-! Machine-authored 062809ba: exact short-cycle cut polynomial. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem cut241_0_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 1=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut241_0_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 2=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut241_0_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 3=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut241_0_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 4=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut241_1_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 1=p*(1+1*X^1)+q*(1+1*X^1) := by
 rw [cutCoeffA27,cut241_0_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_1_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 2=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut241_0_2K062,cut241_0_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_1_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 3=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut241_0_3K062,cut241_0_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_1_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut241_0_4K062,cut241_0_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_2_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 1=p*(1+2*X^1+1*X^2)+q*(2+4*X^1+2*X^2) := by
 rw [cutCoeffA27,cut241_1_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_2_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 2=p*(1+3*X^1+3*X^2+1*X^3)+q*(1+3*X^1+3*X^2+1*X^3) := by
 rw [cutCoeffA27,cut241_1_2K062,cut241_1_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_2_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 3=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut241_1_3K062,cut241_1_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_2_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut241_1_4K062,cut241_1_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_3_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 1=p*(1+2*X^1+2*X^2+1*X^3)+q*(3+7*X^1+6*X^2+2*X^3) := by
 rw [cutCoeffA27,cut241_2_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_3_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 2=p*(2+8*X^1+12*X^2+8*X^3+2*X^4)+q*(3+12*X^1+18*X^2+12*X^3+3*X^4) := by
 rw [cutCoeffA27,cut241_2_2K062,cut241_2_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_3_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 3=p*(1+5*X^1+10*X^2+10*X^3+5*X^4+1*X^5)+q*(1+5*X^1+10*X^2+10*X^3+5*X^4+1*X^5) := by
 rw [cutCoeffA27,cut241_2_3K062,cut241_2_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_3_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut241_2_4K062,cut241_2_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_4_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true] 1=p*(1)+q*(4+7*X^1+6*X^2+2*X^3) := by
 rw [cutCoeffA27,cut241_3_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_4_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true] 2=p*(3+8*X^1+8*X^2+4*X^3+1*X^4)+q*(6+20*X^1+26*X^2+16*X^3+4*X^4) := by
 rw [cutCoeffA27,cut241_3_2K062,cut241_3_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_4_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true] 3=p*(3+14*X^1+26*X^2+24*X^3+11*X^4+2*X^5)+q*(4+19*X^1+36*X^2+34*X^3+16*X^4+3*X^5) := by
 rw [cutCoeffA27,cut241_3_3K062,cut241_3_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_4_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true] 4=p*(1+6*X^1+15*X^2+20*X^3+15*X^4+6*X^5+1*X^6)+q*(1+6*X^1+15*X^2+20*X^3+15*X^4+6*X^5+1*X^6) := by
 rw [cutCoeffA27,cut241_3_4K062,cut241_3_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_5_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true] 1=p*(1+2*X^1)+q*(5+10*X^1+6*X^2+2*X^3) := by
 rw [cutCoeffA27,cut241_4_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_5_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true] 2=p*(4+15*X^1+22*X^2+16*X^3+6*X^4+1*X^5)+q*(10+38*X^1+56*X^2+40*X^3+14*X^4+2*X^5) := by
 rw [cutCoeffA27,cut241_4_2K062,cut241_4_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_5_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true] 3=p*(6+32*X^1+71*X^2+84*X^3+56*X^4+20*X^5+3*X^6)+q*(10+54*X^1+121*X^2+144*X^3+96*X^4+34*X^5+5*X^6) := by
 rw [cutCoeffA27,cut241_4_3K062,cut241_4_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_5_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true] 4=p*(4+27*X^1+78*X^2+125*X^3+120*X^4+69*X^5+22*X^6+3*X^7)+q*(5+34*X^1+99*X^2+160*X^3+155*X^4+90*X^5+29*X^6+4*X^7) := by
 rw [cutCoeffA27,cut241_4_4K062,cut241_4_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_6_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true] 1=p*(1+2*X^1+2*X^2)+q*(6+13*X^1+10*X^2+2*X^3) := by
 rw [cutCoeffA27,cut241_5_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_6_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true] 2=p*(5+20*X^1+34*X^2+32*X^3+18*X^4+6*X^5+1*X^6)+q*(15+62*X^1+105*X^2+94*X^3+48*X^4+14*X^5+2*X^6) := by
 rw [cutCoeffA27,cut241_5_2K062,cut241_5_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_6_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true] 3=p*(10+58*X^1+145*X^2+204*X^3+176*X^4+94*X^5+29*X^6+4*X^7)+q*(20+118*X^1+298*X^2+419*X^3+356*X^4+184*X^5+54*X^6+7*X^7) := by
 rw [cutCoeffA27,cut241_5_3K062,cut241_5_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_6_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true] 4=p*(10+74*X^1+240*X^2+446*X^3+520*X^4+390*X^5+184*X^6+50*X^7+6*X^8)+q*(15+112*X^1+366*X^2+684*X^3+800*X^4+600*X^5+282*X^6+76*X^7+9*X^8) := by
 rw [cutCoeffA27,cut241_5_4K062,cut241_5_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_7_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,false,true,true,true] 1=p*(1)+q*(7+13*X^1+10*X^2+2*X^3) := by
 rw [cutCoeffA27,cut241_6_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_7_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,false,true,true,true] 2=p*(6+14*X^1+12*X^2+4*X^3)+q*(21+76*X^1+117*X^2+98*X^3+48*X^4+14*X^5+2*X^6) := by
 rw [cutCoeffA27,cut241_6_2K062,cut241_6_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_7_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,false,true,true,true] 3=p*(15+67*X^1+125*X^2+128*X^3+80*X^4+32*X^5+8*X^6+1*X^7)+q*(35+185*X^1+423*X^2+547*X^3+436*X^4+216*X^5+62*X^6+8*X^7) := by
 rw [cutCoeffA27,cut241_6_3K062,cut241_6_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_7_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,false,true,true,true] 4=p*(20+128*X^1+356*X^2+564*X^3+560*X^4+360*X^5+148*X^6+36*X^7+4*X^8)+q*(35+240*X^1+722*X^2+1248*X^3+1360*X^4+960*X^5+430*X^6+112*X^7+13*X^8) := by
 rw [cutCoeffA27,cut241_6_4K062,cut241_6_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_8_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,false,true,true,true] 1=p*(1+2*X^1)+q*(8+16*X^1+10*X^2+2*X^3) := by
 rw [cutCoeffA27,cut241_7_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_8_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,false,true,true,true] 2=p*(7+27*X^1+38*X^2+24*X^3+6*X^4)+q*(28+109*X^1+169*X^2+134*X^3+58*X^4+14*X^5+2*X^6) := by
 rw [cutCoeffA27,cut241_7_2K062,cut241_7_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_8_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,false,true,true,true] 3=p*(21+118*X^1+280*X^2+366*X^3+290*X^4+146*X^5+48*X^6+10*X^7+1*X^8)+q*(56+318*X^1+770*X^2+1038*X^3+854*X^4+442*X^5+142*X^6+26*X^7+2*X^8) := by
 rw [cutCoeffA27,cut241_7_3K062,cut241_7_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_8_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,false,true,true,true] 4=p*(35+255*X^1+818*X^2+1518*X^3+1800*X^4+1420*X^5+750*X^6+258*X^7+53*X^8+5*X^9)+q*(70+515*X^1+1668*X^2+3122*X^3+3724*X^4+2940*X^5+1540*X^6+518*X^7+102*X^8+9*X^9) := by
 rw [cutCoeffA27,cut241_7_4K062,cut241_7_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_9_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,false,true,true,true] 1=p*(1+2*X^1+2*X^2)+q*(9+19*X^1+14*X^2+2*X^3) := by
 rw [cutCoeffA27,cut241_8_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_9_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,false,true,true,true] 2=p*(8+32*X^1+56*X^2+52*X^3+26*X^4+6*X^5)+q*(36+148*X^1+252*X^2+224*X^3+108*X^4+26*X^5+2*X^6) := by
 rw [cutCoeffA27,cut241_8_2K062,cut241_8_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_9_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,false,true,true,true] 3=p*(28+165*X^1+430*X^2+648*X^3+620*X^4+392*X^5+168*X^6+50*X^7+10*X^8+1*X^9)+q*(84+504*X^1+1318*X^2+1966*X^3+1840*X^4+1124*X^5+456*X^6+124*X^7+22*X^8+2*X^9) := by
 rw [cutCoeffA27,cut241_8_3K062,cut241_8_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_9_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,false,true,true,true] 4=p*(56+430*X^1+1482*X^2+3024*X^3+4056*X^4+3752*X^5+2440*X^6+1112*X^7+344*X^8+66*X^9+6*X^10)+q*(126+980*X^1+3405*X^2+6964*X^3+9298*X^4+8492*X^5+5400*X^6+2380*X^7+704*X^8+128*X^9+11*X^10) := by
 rw [cutCoeffA27,cut241_8_4K062,cut241_8_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_10_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,false,true,true,false,true,true,true] 1=p*(1)+q*(10+19*X^1+14*X^2+2*X^3) := by
 rw [cutCoeffA27,cut241_9_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_10_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,false,true,true,false,true,true,true] 2=p*(9+20*X^1+16*X^2+4*X^3)+q*(45+168*X^1+268*X^2+228*X^3+108*X^4+26*X^5+2*X^6) := by
 rw [cutCoeffA27,cut241_9_2K062,cut241_9_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_10_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,false,true,true,false,true,true,true] 3=p*(36+156*X^1+284*X^2+280*X^3+160*X^4+52*X^5+8*X^6)+q*(120+660*X^1+1602*X^2+2246*X^3+2000*X^4+1176*X^5+464*X^6+124*X^7+22*X^8+2*X^9) := by
 rw [cutCoeffA27,cut241_9_3K062,cut241_9_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_10_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,false,true,true,false,true,true,true] 4=p*(84+532*X^1+1483*X^2+2396*X^3+2488*X^4+1744*X^5+848*X^6+292*X^7+72*X^8+12*X^9+1*X^10)+q*(210+1512*X^1+4888*X^2+9360*X^3+11786*X^4+10236*X^5+6248*X^6+2672*X^7+776*X^8+140*X^9+12*X^10) := by
 rw [cutCoeffA27,cut241_9_4K062,cut241_9_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_11_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,false,true,true,false,true,true,true] 1=p*(1+2*X^1)+q*(11+22*X^1+14*X^2+2*X^3) := by
 rw [cutCoeffA27,cut241_10_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_11_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,false,true,true,false,true,true,true] 2=p*(10+39*X^1+54*X^2+32*X^3+6*X^4)+q*(55+216*X^1+342*X^2+276*X^3+118*X^4+26*X^5+2*X^6) := by
 rw [cutCoeffA27,cut241_10_2K062,cut241_10_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_11_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,false,true,true,false,true,true,true] 3=p*(45+258*X^1+621*X^2+816*X^3+636*X^4+298*X^5+80*X^6+10*X^7)+q*(165+954*X^1+2379*X^2+3346*X^3+2916*X^4+1634*X^5+596*X^6+142*X^7+22*X^8+2*X^9) := by
 rw [cutCoeffA27,cut241_10_3K062,cut241_10_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_11_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,false,true,true,false,true,true,true] 4=p*(120+900*X^1+2986*X^2+5771*X^3+7206*X^4+6104*X^5+3596*X^6+1496*X^7+446*X^8+96*X^9+14*X^10+1*X^11)+q*(330+2496*X^1+8406*X^2+16614*X^3+21388*X^4+18828*X^5+11588*X^6+5016*X^7+1514*X^8+308*X^9+38*X^10+2*X^11) := by
 rw [cutCoeffA27,cut241_10_4K062,cut241_10_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_12_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,false,true,true,false,true,true,true] 1=p*(1+2*X^1+2*X^2)+q*(12+25*X^1+18*X^2+2*X^3) := by
 rw [cutCoeffA27,cut241_11_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_12_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,false,true,true,false,true,true,true] 2=p*(11+44*X^1+78*X^2+72*X^3+34*X^4+6*X^5)+q*(66+270*X^1+459*X^2+402*X^3+184*X^4+38*X^5+2*X^6) := by
 rw [cutCoeffA27,cut241_11_2K062,cut241_11_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_12_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,false,true,true,false,true,true,true] 3=p*(55+326*X^1+865*X^2+1332*X^3+1296*X^4+818*X^5+332*X^6+82*X^7+10*X^8)+q*(220+1325*X^1+3502*X^2+5299*X^3+5028*X^4+3088*X^5+1226*X^6+304*X^7+42*X^8+2*X^9) := by
 rw [cutCoeffA27,cut241_11_3K062,cut241_11_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut241_12_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,false,true,true,false,true,true,true] 4=p*(165+1284*X^1+4536*X^2+9590*X^3+13470*X^4+13208*X^5+9268*X^6+4712*X^7+1750*X^8+480*X^9+98*X^10+14*X^11+1*X^12)+q*(495+3900*X^1+13842*X^2+29190*X^3+40629*X^4+39242*X^5+26960*X^6+13324*X^7+4760*X^8+1234*X^9+232*X^10+30*X^11+2*X^12) := by
 rw [cutCoeffA27,cut241_11_4K062,cut241_11_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
def shortFourth241K062 : ℤ[X] := 495+4065*X^1+15126*X^2+33726*X^3+50219*X^4+52712*X^5+40168*X^6+22592*X^7+9472*X^8+2984*X^9+712*X^10+128*X^11+16*X^12+1*X^13
theorem shortFourth_poly241K062 :
 cutCoeffA27 (X:ℤ[X]) X 1 [true,true,false,true,true,false,true,true,false,true,true,true] 4=shortFourth241K062 := by
 rw [cut241_12_4K062]
 unfold shortFourth241K062
 ring
theorem shortFourth_lc241K062 (j : ℕ) :
 (shortFourth241K062).coeff j*(shortFourth241K062).coeff (j+2)≤
 ((shortFourth241K062).coeff (j+1))^2 := by
 by_cases hj : j<12
 · interval_cases j <;> norm_num [shortFourth241K062,Polynomial.coeff_add,
     Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,
     Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : (shortFourth241K062).coeff (j+2)=0 := by
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
     have h13 : j+2≠13 := by omega
     simp [shortFourth241K062,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,hj0,h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,eq_comm]
   rw [hz,mul_zero]; exact sq_nonneg _
theorem shortFourth_tail241K062 (rest : List Bool)
 (hc : (frame rest).mid.b=4) (hr : (frame rest).mid.a=1) :
 central28 (List.replicate 2 true++false::rest)++[true]=[true,true,false,true,true,false,true,true,false,true,true,true] := by
 have h := source_run_substitutionBF 2 rest
 rw [source_short_wordBE rest (by omega),hc,hr,sourceWord_central28] at h
 norm_num [shortSourceWordBE,lowerSub487,lowerRun487,List.replicate_succ] at h
 exact h
theorem source_fourth_short241K062 (rest : List Bool)
 (hc : (frame rest).mid.b=4) (hr : (frame rest).mid.a=1)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 rw [source_cut_coeffA27 _ i (j+2) 4 (by omega),
   source_cut_coeffA27 _ (i+2) j 4 (by omega),
   source_cut_coeffA27 _ (i+1) (j+1) 4 (by omega),
   shortFourth_tail241K062 rest hc hr,shortFourth_poly241K062]
 nlinarith only [shortFourth_lc241K062 j]
end
end MathGKM.Markov
