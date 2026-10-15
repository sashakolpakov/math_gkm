import MarkovFourthAllCyclesBE
/-! Machine-authored 062809ba: exact short-cycle cut polynomial. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem cut343_0_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 1=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut343_0_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 2=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut343_0_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 3=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut343_0_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [] 4=p*(0)+q*(0) := by
 simp [cutCoeffA27]
theorem cut343_1_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 1=p*(1+1*X^1)+q*(1+1*X^1) := by
 rw [cutCoeffA27,cut343_0_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_1_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 2=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut343_0_2K062,cut343_0_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_1_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 3=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut343_0_3K062,cut343_0_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_1_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut343_0_4K062,cut343_0_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_2_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 1=p*(1+2*X^1+1*X^2)+q*(2+4*X^1+2*X^2) := by
 rw [cutCoeffA27,cut343_1_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_2_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 2=p*(1+3*X^1+3*X^2+1*X^3)+q*(1+3*X^1+3*X^2+1*X^3) := by
 rw [cutCoeffA27,cut343_1_2K062,cut343_1_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_2_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 3=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut343_1_3K062,cut343_1_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_2_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut343_1_4K062,cut343_1_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_3_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 1=p*(1+2*X^1+2*X^2+1*X^3)+q*(3+7*X^1+6*X^2+2*X^3) := by
 rw [cutCoeffA27,cut343_2_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_3_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 2=p*(2+8*X^1+12*X^2+8*X^3+2*X^4)+q*(3+12*X^1+18*X^2+12*X^3+3*X^4) := by
 rw [cutCoeffA27,cut343_2_2K062,cut343_2_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_3_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 3=p*(1+5*X^1+10*X^2+10*X^3+5*X^4+1*X^5)+q*(1+5*X^1+10*X^2+10*X^3+5*X^4+1*X^5) := by
 rw [cutCoeffA27,cut343_2_3K062,cut343_2_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_3_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true] 4=p*(0)+q*(0) := by
 rw [cutCoeffA27,cut343_2_4K062,cut343_2_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_4_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true] 1=p*(1+2*X^1+2*X^2+2*X^3+1*X^4)+q*(4+10*X^1+10*X^2+6*X^3+2*X^4) := by
 rw [cutCoeffA27,cut343_3_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_4_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true] 2=p*(3+13*X^1+24*X^2+24*X^3+13*X^4+3*X^5)+q*(6+27*X^1+50*X^2+48*X^3+24*X^4+5*X^5) := by
 rw [cutCoeffA27,cut343_3_2K062,cut343_3_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_4_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true] 3=p*(3+18*X^1+45*X^2+60*X^3+45*X^4+18*X^5+3*X^6)+q*(4+24*X^1+60*X^2+80*X^3+60*X^4+24*X^5+4*X^6) := by
 rw [cutCoeffA27,cut343_3_3K062,cut343_3_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_4_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true] 4=p*(1+7*X^1+21*X^2+35*X^3+35*X^4+21*X^5+7*X^6+1*X^7)+q*(1+7*X^1+21*X^2+35*X^3+35*X^4+21*X^5+7*X^6+1*X^7) := by
 rw [cutCoeffA27,cut343_3_4K062,cut343_3_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_5_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true] 1=p*(1)+q*(5+10*X^1+10*X^2+6*X^3+2*X^4) := by
 rw [cutCoeffA27,cut343_4_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_5_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true] 2=p*(4+11*X^1+12*X^2+8*X^3+4*X^4+1*X^5)+q*(10+38*X^1+62*X^2+56*X^3+28*X^4+6*X^5) := by
 rw [cutCoeffA27,cut343_4_2K062,cut343_4_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_5_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true] 3=p*(6+30*X^1+63*X^2+72*X^3+48*X^4+18*X^5+3*X^6)+q*(10+54*X^1+123*X^2+152*X^3+108*X^4+42*X^5+7*X^6) := by
 rw [cutCoeffA27,cut343_4_3K062,cut343_4_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_5_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true] 4=p*(4+27*X^1+78*X^2+125*X^3+120*X^4+69*X^5+22*X^6+3*X^7)+q*(5+34*X^1+99*X^2+160*X^3+155*X^4+90*X^5+29*X^6+4*X^7) := by
 rw [cutCoeffA27,cut343_4_4K062,cut343_4_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_6_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true] 1=p*(1+2*X^1)+q*(6+13*X^1+10*X^2+6*X^3+2*X^4) := by
 rw [cutCoeffA27,cut343_5_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_6_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true] 2=p*(5+20*X^1+32*X^2+28*X^3+16*X^4+6*X^5+1*X^6)+q*(15+62*X^1+105*X^2+96*X^3+52*X^4+16*X^5+2*X^6) := by
 rw [cutCoeffA27,cut343_5_2K062,cut343_5_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_6_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true] 3=p*(10+58*X^1+145*X^2+204*X^3+176*X^4+94*X^5+29*X^6+4*X^7)+q*(20+118*X^1+298*X^2+419*X^3+356*X^4+184*X^5+54*X^6+7*X^7) := by
 rw [cutCoeffA27,cut343_5_3K062,cut343_5_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_6_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true] 4=p*(10+74*X^1+240*X^2+446*X^3+520*X^4+390*X^5+184*X^6+50*X^7+6*X^8)+q*(15+112*X^1+366*X^2+684*X^3+800*X^4+600*X^5+282*X^6+76*X^7+9*X^8) := by
 rw [cutCoeffA27,cut343_5_4K062,cut343_5_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_7_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true] 1=p*(1+2*X^1+2*X^2)+q*(7+16*X^1+14*X^2+6*X^3+2*X^4) := by
 rw [cutCoeffA27,cut343_6_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_7_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true] 2=p*(6+25*X^1+46*X^2+50*X^3+36*X^4+18*X^5+6*X^6+1*X^7)+q*(21+92*X^1+171*X^2+178*X^3+116*X^4+50*X^5+14*X^6+2*X^7) := by
 rw [cutCoeffA27,cut343_6_2K062,cut343_6_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_7_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true] 3=p*(15+92*X^1+250*X^2+398*X^3+412*X^4+288*X^5+134*X^6+38*X^7+5*X^8)+q*(35+220*X^1+606*X^2+962*X^3+972*X^4+648*X^5+282*X^6+74*X^7+9*X^8) := by
 rw [cutCoeffA27,cut343_6_3K062,cut343_6_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_7_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true] 4=p*(20+158*X^1+558*X^2+1160*X^3+1570*X^4+1440*X^5+898*X^6+368*X^7+90*X^8+10*X^9)+q*(35+280*X^1+998*X^2+2084*X^3+2816*X^4+2560*X^5+1570*X^6+628*X^7+149*X^8+16*X^9) := by
 rw [cutCoeffA27,cut343_6_4K062,cut343_6_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_8_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true] 1=p*(1+2*X^1+2*X^2+2*X^3)+q*(8+19*X^1+18*X^2+10*X^3+2*X^4) := by
 rw [cutCoeffA27,cut343_7_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_8_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true] 2=p*(7+30*X^1+58*X^2+70*X^3+60*X^4+38*X^5+18*X^6+6*X^7+1*X^8)+q*(28+128*X^1+254*X^2+294*X^3+226*X^4+124*X^5+50*X^6+14*X^7+2*X^8) := by
 rw [cutCoeffA27,cut343_7_2K062,cut343_7_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_8_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true] 3=p*(21+134*X^1+386*X^2+670*X^3+788*X^4+664*X^5+406*X^6+174*X^7+47*X^8+6*X^9)+q*(56+369*X^1+1084*X^2+1882*X^3+2158*X^4+1724*X^5+976*X^6+382*X^7+94*X^8+11*X^9) := by
 rw [cutCoeffA27,cut343_7_3K062,cut343_7_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_8_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true] 4=p*(35+290*X^1+1091*X^2+2468*X^3+3742*X^4+4000*X^5+3070*X^6+1676*X^7+623*X^8+142*X^9+15*X^10)+q*(70+590*X^1+2247*X^2+5110*X^3+7718*X^4+8130*X^5+6080*X^6+3202*X^7+1140*X^8+248*X^9+25*X^10) := by
 rw [cutCoeffA27,cut343_7_4K062,cut343_7_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_9_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true,false,true,true,true,true] 1=p*(1+2*X^1+2*X^2+2*X^3+2*X^4)+q*(9+22*X^1+22*X^2+14*X^3+6*X^4) := by
 rw [cutCoeffA27,cut343_8_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_9_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true,false,true,true,true,true] 2=p*(8+35*X^1+70*X^2+90*X^3+86*X^4+64*X^5+38*X^6+18*X^7+6*X^8+1*X^9)+q*(36+170*X^1+354*X^2+442*X^3+382*X^4+248*X^5+126*X^6+50*X^7+14*X^8+2*X^9) := by
 rw [cutCoeffA27,cut343_8_2K062,cut343_8_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_9_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true,false,true,true,true,true] 3=p*(28+184*X^1+553*X^2+1022*X^3+1318*X^4+1268*X^5+936*X^6+526*X^7+214*X^8+56*X^9+7*X^10)+q*(84+574*X^1+1771*X^2+3290*X^3+4146*X^4+3780*X^5+2576*X^6+1314*X^7+482*X^8+114*X^9+13*X^10) := by
 rw [cutCoeffA27,cut343_8_3K062,cut343_8_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_9_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true,false,true,true,true,true] 4=p*(56+481*X^1+1898*X^2+4577*X^3+7564*X^4+9082*X^5+8152*X^6+5498*X^7+2732*X^8+949*X^9+206*X^10+21*X^11)+q*(126+1106*X^1+4435*X^2+10778*X^3+17750*X^4+20954*X^5+18232*X^6+11770*X^7+5548*X^8+1820*X^9+373*X^10+36*X^11) := by
 rw [cutCoeffA27,cut343_8_4K062,cut343_8_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_10_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true,false,true,true,true,true] 1=p*(1)+q*(10+22*X^1+22*X^2+14*X^3+6*X^4) := by
 rw [cutCoeffA27,cut343_9_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_10_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true,false,true,true,true,true] 2=p*(9+23*X^1+24*X^2+16*X^3+8*X^4+2*X^5)+q*(45+193*X^1+378*X^2+458*X^3+390*X^4+250*X^5+126*X^6+50*X^7+14*X^8+2*X^9) := by
 rw [cutCoeffA27,cut343_9_2K062,cut343_9_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_10_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true,false,true,true,true,true] 3=p*(36+178*X^1+389*X^2+512*X^3+472*X^4+334*X^5+190*X^6+88*X^7+32*X^8+8*X^9+1*X^10)+q*(120+752*X^1+2160*X^2+3802*X^3+4618*X^4+4114*X^5+2766*X^6+1402*X^7+514*X^8+122*X^9+14*X^10) := by
 rw [cutCoeffA27,cut343_9_3K062,cut343_9_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_10_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true,false,true,true,true,true] 4=p*(84+602*X^1+1955*X^2+3843*X^3+5168*X^4+5098*X^5+3844*X^6+2250*X^7+1008*X^8+328*X^9+69*X^10+7*X^11)+q*(210+1708*X^1+6390*X^2+14621*X^3+22918*X^4+26052*X^5+22076*X^6+14020*X^7+6556*X^8+2148*X^9+442*X^10+43*X^11) := by
 rw [cutCoeffA27,cut343_9_4K062,cut343_9_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_11_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true,false,true,true,true,true] 1=p*(1+2*X^1)+q*(11+25*X^1+22*X^2+14*X^3+6*X^4) := by
 rw [cutCoeffA27,cut343_10_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_11_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true,false,true,true,true,true] 2=p*(10+42*X^1+68*X^2+60*X^3+36*X^4+14*X^5+2*X^6)+q*(55+244*X^1+469*X^2+542*X^3+442*X^4+272*X^5+130*X^6+50*X^7+14*X^8+2*X^9) := by
 rw [cutCoeffA27,cut343_10_2K062,cut343_10_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_11_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true,false,true,true,true,true] 3=p*(45+283*X^1+781*X^2+1272*X^3+1400*X^4+1136*X^5+720*X^6+368*X^7+152*X^8+48*X^9+10*X^10+1*X^11)+q*(165+1071*X^1+3119*X^2+5463*X^3+6530*X^4+5722*X^5+3820*X^6+1960*X^7+754*X^8+202*X^9+32*X^10+2*X^11) := by
 rw [cutCoeffA27,cut343_10_3K062,cut343_10_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_11_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true,false,true,true,true,true] 4=p*(120+992*X^1+3728*X^2+8484*X^3+13164*X^4+14884*X^5+12784*X^6+8536*X^7+4444*X^8+1764*X^9+504*X^10+92*X^11+8*X^12)+q*(330+2784*X^1+10720*X^2+25060*X^3+39925*X^4+46104*X^5+39958*X^6+26400*X^7+13250*X^8+4920*X^9+1274*X^10+204*X^11+15*X^12) := by
 rw [cutCoeffA27,cut343_10_4K062,cut343_10_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_12_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true,false,true,true,true,true] 1=p*(1+2*X^1+2*X^2)+q*(12+28*X^1+26*X^2+14*X^3+6*X^4) := by
 rw [cutCoeffA27,cut343_11_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_12_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true,false,true,true,true,true] 2=p*(11+47*X^1+92*X^2+106*X^3+80*X^4+42*X^5+14*X^6+2*X^7)+q*(66+301*X^1+603*X^2+716*X^3+582*X^4+350*X^5+158*X^6+54*X^7+14*X^8+2*X^9) := by
 rw [cutCoeffA27,cut343_11_2K062,cut343_11_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_12_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true,false,true,true,true,true] 3=p*(55+354*X^1+1048*X^2+1902*X^3+2384*X^4+2210*X^5+1588*X^6+916*X^7+434*X^8+168*X^9+50*X^10+10*X^11+1*X^12)+q*(220+1470*X^1+4450*X^2+8146*X^3+10186*X^4+9332*X^5+6544*X^6+3596*X^7+1556*X^8+522*X^9+130*X^10+22*X^11+2*X^12) := by
 rw [cutCoeffA27,cut343_11_3K062,cut343_11_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_12_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true,false,true,true,true,true] 4=p*(165+1401*X^1+5510*X^2+13374*X^3+22530*X^4+28088*X^5+26962*X^6+20420*X^7+12338*X^8+5920*X^9+2198*X^10+596*X^11+105*X^12+9*X^13)+q*(495+4305*X^1+17222*X^2+42162*X^3+70939*X^4+87356*X^5+81804*X^6+59604*X^7+34124*X^8+15284*X^9+5236*X^10+1304*X^11+212*X^12+17*X^13) := by
 rw [cutCoeffA27,cut343_11_4K062,cut343_11_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_13_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true,false,true,true,true,true] 1=p*(1+2*X^1+2*X^2+2*X^3)+q*(13+31*X^1+30*X^2+18*X^3+6*X^4) := by
 rw [cutCoeffA27,cut343_12_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_13_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true,false,true,true,true,true] 2=p*(12+52*X^1+104*X^2+136*X^3+128*X^4+86*X^5+42*X^6+14*X^7+2*X^8)+q*(78+364*X^1+754*X^2+944*X^3+816*X^4+516*X^5+242*X^6+82*X^7+18*X^8+2*X^9) := by
 rw [cutCoeffA27,cut343_12_2K062,cut343_12_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_13_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true,false,true,true,true,true] 3=p*(66+433*X^1+1316*X^2+2506*X^3+3398*X^4+3502*X^5+2840*X^6+1856*X^7+1000*X^8+452*X^9+170*X^10+50*X^11+10*X^12+1*X^13)+q*(286+1958*X^1+6120*X^2+11700*X^3+15486*X^4+15218*X^5+11594*X^6+7040*X^7+3472*X^8+1408*X^9+468*X^10+122*X^11+22*X^12+2*X^13) := by
 rw [cutCoeffA27,cut343_12_3K062,cut343_12_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_13_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true,false,true,true,true,true] 4=p*(220+1910*X^1+7730*X^2+19508*X^3+34656*X^4+46334*X^5+48558*X^6+40900*X^7+28076*X^8+15766*X^9+7174*X^10+2568*X^11+680*X^12+118*X^13+10*X^14)+q*(715+6380*X^1+26353*X^2+67180*X^3+118969*X^4+156220*X^5+158450*X^6+127466*X^7+82620*X^8+43388*X^9+18330*X^10+6070*X^11+1488*X^12+240*X^13+19*X^14) := by
 rw [cutCoeffA27,cut343_12_4K062,cut343_12_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_14_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true,false,true,true,true,true,false,true,true,true,true] 1=p*(1+2*X^1+2*X^2+2*X^3+2*X^4)+q*(14+34*X^1+34*X^2+22*X^3+10*X^4) := by
 rw [cutCoeffA27,cut343_13_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_14_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true,false,true,true,true,true,false,true,true,true,true] 2=p*(13+57*X^1+116*X^2+156*X^3+164*X^4+136*X^5+86*X^6+42*X^7+14*X^8+2*X^9)+q*(91+433*X^1+922*X^2+1204*X^3+1116*X^4+780*X^5+414*X^6+166*X^7+46*X^8+6*X^9) := by
 rw [cutCoeffA27,cut343_13_2K062,cut343_13_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_14_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true,false,true,true,true,true,false,true,true,true,true] 3=p*(78+520*X^1+1615*X^2+3170*X^3+4506*X^4+4994*X^5+4474*X^6+3292*X^7+2012*X^8+1036*X^9+456*X^10+170*X^11+50*X^12+10*X^13+1*X^14)+q*(364+2544*X^1+8168*X^2+16186*X^3+22498*X^4+23610*X^5+19570*X^6+13172*X^7+7340*X^8+3444*X^9+1376*X^10+462*X^11+122*X^12+22*X^13+2*X^14) := by
 rw [cutCoeffA27,cut343_13_3K062,cut343_13_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_14_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,true,false,true,true,true,true,false,true,true,true,true] 4=p*(286+2530*X^1+10487*X^2+27299*X^3+50516*X^4+71264*X^5+80046*X^6+73534*X^7+56108*X^8+35812*X^9+19094*X^10+8386*X^11+2932*X^12+764*X^13+131*X^14+11*X^15)+q*(1001+9130*X^1+38750*X^2+102209*X^3+188993*X^4+262140*X^5+284830*X^6+249558*X^7+179628*X^8+107276*X^9+53190*X^10+21630*X^11+6988*X^12+1684*X^13+268*X^14+21*X^15) := by
 rw [cutCoeffA27,cut343_13_4K062,cut343_13_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_15_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 1=p*(1)+q*(15+34*X^1+34*X^2+22*X^3+10*X^4) := by
 rw [cutCoeffA27,cut343_14_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_15_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 2=p*(14+35*X^1+36*X^2+24*X^3+12*X^4+2*X^5)+q*(105+468*X^1+958*X^2+1228*X^3+1128*X^4+782*X^5+414*X^6+166*X^7+46*X^8+6*X^9) := by
 rw [cutCoeffA27,cut343_14_2K062,cut343_14_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_15_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 3=p*(91+446*X^1+979*X^2+1320*X^3+1272*X^4+944*X^5+550*X^6+252*X^7+88*X^8+20*X^9+2*X^10)+q*(455+2990*X^1+9147*X^2+17506*X^3+23770*X^4+24554*X^5+20120*X^6+13424*X^7+7428*X^8+3464*X^9+1378*X^10+462*X^11+122*X^12+22*X^13+2*X^14) := by
 rw [cutCoeffA27,cut343_14_3K062,cut343_14_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_15_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 4=p*(364+2622*X^1+8688*X^2+17801*X^3+25668*X^4+28116*X^5+24564*X^6+17646*X^7+10632*X^8+5456*X^9+2412*X^10+918*X^11+292*X^12+72*X^13+12*X^14+1*X^15)+q*(1365+11752*X^1+47438*X^2+120010*X^3+214661*X^4+290256*X^5+309394*X^6+267204*X^7+190260*X^8+112732*X^9+55602*X^10+22548*X^11+7280*X^12+1756*X^13+280*X^14+22*X^15) := by
 rw [cutCoeffA27,cut343_14_4K062,cut343_14_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_16_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 1=p*(1+2*X^1)+q*(16+37*X^1+34*X^2+22*X^3+10*X^4) := by
 rw [cutCoeffA27,cut343_15_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_16_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 2=p*(15+64*X^1+104*X^2+92*X^3+56*X^4+22*X^5+2*X^6)+q*(120+546*X^1+1097*X^2+1356*X^3+1208*X^4+816*X^5+418*X^6+166*X^7+46*X^8+6*X^9) := by
 rw [cutCoeffA27,cut343_15_2K062,cut343_15_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_16_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 3=p*(105+678*X^1+1921*X^2+3236*X^3+3736*X^4+3218*X^5+2154*X^6+1132*X^7+464*X^8+140*X^9+26*X^10+2*X^11)+q*(560+3759*X^1+11514*X^2+21721*X^3+28826*X^4+29044*X^5+23218*X^6+15106*X^7+8144*X^8+3692*X^9+1424*X^10+466*X^11+122*X^12+22*X^13+2*X^14) := by
 rw [cutCoeffA27,cut343_15_3K062,cut343_15_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_16_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 4=p*(455+3900*X^1+15296*X^2+36766*X^3+61376*X^4+76584*X^5+75006*X^6+59602*X^7+39300*X^8+21864*X^9+10406*X^10+4274*X^11+1504*X^12+436*X^13+96*X^14+14*X^15+1*X^16)+q*(1820+16016*X^1+65356*X^2+165464*X^3+293838*X^4+392508*X^5+412516*X^6+351370*X^7+247206*X^8+145228*X^9+71464*X^10+29234*X^11+9702*X^12+2484*X^13+448*X^14+48*X^15+2*X^16) := by
 rw [cutCoeffA27,cut343_15_4K062,cut343_15_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_17_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 1=p*(1+2*X^1+2*X^2)+q*(17+40*X^1+38*X^2+22*X^3+10*X^4) := by
 rw [cutCoeffA27,cut343_16_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_17_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 2=p*(16+69*X^1+138*X^2+162*X^3+124*X^4+66*X^5+22*X^6+2*X^7)+q*(136+630*X^1+1299*X^2+1622*X^3+1424*X^4+938*X^5+462*X^6+170*X^7+46*X^8+6*X^9) := by
 rw [cutCoeffA27,cut343_16_2K062,cut343_16_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_17_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 3=p*(120+786*X^1+2400*X^2+4542*X^3+5996*X^4+5908*X^5+4530*X^6+2762*X^7+1346*X^8+516*X^9+146*X^10+26*X^11+2*X^12)+q*(680+4650*X^1+14592*X^2+28184*X^3+38058*X^4+38688*X^5+30966*X^6+20022*X^7+10622*X^8+4672*X^9+1710*X^10+518*X^11+126*X^12+22*X^13+2*X^14) := by
 rw [cutCoeffA27,cut343_16_3K062,cut343_16_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_17_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 4=p*(560+4879*X^1+19956*X^2+51130*X^3+92470*X^4+126218*X^5+135800*X^6+118702*X^7+86138*X^8+52732*X^9+27584*X^10+12462*X^11+4890*X^12+1650*X^13+460*X^14+98*X^15+14*X^16+1*X^17)+q*(2380+21350*X^1+89212*X^2+231890*X^3+423074*X^4+580102*X^5+624900*X^6+545078*X^7+392946*X^8+237260*X^9+120912*X^10+52102*X^11+18866*X^12+5638*X^13+1344*X^14+242*X^15+30*X^16+2*X^17) := by
 rw [cutCoeffA27,cut343_16_4K062,cut343_16_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_18_1K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 1=p*(1+2*X^1+2*X^2+2*X^3)+q*(18+43*X^1+42*X^2+26*X^3+10*X^4) := by
 rw [cutCoeffA27,cut343_17_1K062,cutCoeff_zeroA27]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_18_2K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 2=p*(17+74*X^1+150*X^2+202*X^3+196*X^4+134*X^5+66*X^6+22*X^7+2*X^8)+q*(153+720*X^1+1518*X^2+1962*X^3+1782*X^4+1196*X^5+594*X^6+214*X^7+50*X^8+6*X^9) := by
 rw [cutCoeffA27,cut343_17_2K062,cut343_17_1K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_18_3K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 3=p*(136+902*X^1+2800*X^2+5528*X^3+7888*X^4+8644*X^5+7498*X^6+5250*X^7+3002*X^8+1400*X^9+522*X^10+146*X^11+26*X^12+2*X^13)+q*(816+5672*X^1+18178*X^2+36112*X^3+50488*X^4+53328*X^5+44372*X^6+29802*X^7+16386*X^8+7418*X^9+2748*X^10+810*X^11+178*X^12+26*X^13+2*X^14) := by
 rw [cutCoeffA27,cut343_17_3K062,cut343_17_2K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
theorem cut343_18_4K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q [true,true,true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 4=p*(680+6010*X^1+25027*X^2+65918*X^3+124314*X^4+179754*X^5+207776*X^6+197226*X^7+156638*X^8+105540*X^9+60976*X^10+30474*X^11+13278*X^12+5066*X^13+1676*X^14+462*X^15+98*X^16+14*X^17+1*X^18)+q*(3060+27920*X^1+119118*X^2+317764*X^3+598518*X^4+852326*X^5+958894*X^6+878104*X^7+668286*X^8+428938*X^9+234620*X^10+110160*X^11+44606*X^12+15594*X^13+4670*X^14+1164*X^15+226*X^16+30*X^17+2*X^18) := by
 rw [cutCoeffA27,cut343_17_4K062,cut343_17_3K062]
 norm_num [cutChargeA27,cutFactorA27] <;> ring
def shortFourth343K062 : ℤ[X] := 3060+28600*X^1+125128*X^2+342791*X^3+664436*X^4+976640*X^5+1138648*X^6+1085880*X^7+865512*X^8+585576*X^9+340160*X^10+171136*X^11+75080*X^12+28872*X^13+9736*X^14+2840*X^15+688*X^16+128*X^17+16*X^18+1*X^19
theorem shortFourth_poly343K062 :
 cutCoeffA27 (X:ℤ[X]) X 1 [true,true,true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] 4=shortFourth343K062 := by
 rw [cut343_18_4K062]
 unfold shortFourth343K062
 ring
theorem shortFourth_lc343K062 (j : ℕ) :
 (shortFourth343K062).coeff j*(shortFourth343K062).coeff (j+2)≤
 ((shortFourth343K062).coeff (j+1))^2 := by
 by_cases hj : j<18
 · interval_cases j <;> norm_num [shortFourth343K062,Polynomial.coeff_add,
     Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,
     Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : (shortFourth343K062).coeff (j+2)=0 := by
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
     have h14 : j+2≠14 := by omega
     have h15 : j+2≠15 := by omega
     have h16 : j+2≠16 := by omega
     have h17 : j+2≠17 := by omega
     have h18 : j+2≠18 := by omega
     have h19 : j+2≠19 := by omega
     simp [shortFourth343K062,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,hj0,h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15,h16,h17,h18,h19,eq_comm]
   rw [hz,mul_zero]; exact sq_nonneg _
theorem shortFourth_tail343K062 (rest : List Bool)
 (hc : (frame rest).mid.b=4) (hr : (frame rest).mid.a=3) :
 central28 (List.replicate 3 true++false::rest)++[true]=[true,true,true,false,true,true,true,true,false,true,true,true,true,false,true,true,true,true] := by
 have h := source_run_substitutionBF 3 rest
 rw [source_short_wordBE rest (by omega),hc,hr,sourceWord_central28] at h
 norm_num [shortSourceWordBE,lowerSub487,lowerRun487,List.replicate_succ] at h
 exact h
theorem source_fourth_short343K062 (rest : List Bool)
 (hc : (frame rest).mid.b=4) (hr : (frame rest).mid.a=3)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate 3 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 3 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 3 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 3 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 rw [source_cut_coeffA27 _ i (j+2) 4 (by omega),
   source_cut_coeffA27 _ (i+2) j 4 (by omega),
   source_cut_coeffA27 _ (i+1) (j+1) 4 (by omega),
   shortFourth_tail343K062 rest hc hr,shortFourth_poly343K062]
 nlinarith only [shortFourth_lc343K062 j]
end
end MathGKM.Markov
