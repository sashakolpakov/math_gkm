import MarkovFullSourceFA
/-! Machine-authored 06b5b1f9. Exact fourth-slice tail certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def tailV20M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-52224*R + 310528*R^2 + -138240*R^3 + 8960*R^4 + 21504*C + 33024*C*R + -192000*C*R^2 + 35840*C*R^3 + -16384*C^2 + -29184*C^2*R + 32256*C^2*R^2 + 3072*C^3 + 7168*C^3*R + 256*C^4)

def tailV21M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-17280*R + 89728*R^2 + -61440*R^3 + 5120*R^4 + 7968*C + -9088*C*R + -53760*C*R^2 + 15360*C*R^3 + -3072*C^2 + 9216*C^2*R^2 + 768*C^3 + 1024*C^3*R)

def tailV22M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-18432*R + 13568*R^2 + -21504*R^3 + 2560*R^4 + 6144*C + -2816*C*R + -7680*C*R^2 + 5120*C*R^3 + -576*C^2 + 1536*C^2*R + 1536*C^2*R^2)

def tailV23M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-17280*R + -640*R^2 + -4608*R^3 + 1024*R^4 + 5472*C + 2432*C*R + 768*C*R^2 + 1024*C*R^3 + -768*C^2)

def tailV24M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-9216*R + 1280*R^2 + 256*R^4 + 3072*C + 768*C*R + -384*C^2)

def tailV25M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-1920*R + 1152*R^2 + 672*C + -384*C*R)

def tailV26M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

def tailV27M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

def tailPoly2M06 {A : Type*} [CommRing A] (C R x : A) : A :=
 tailV20M06 C R + tailV21M06 C R*x + tailV22M06 C R*x^2 + tailV23M06 C R*x^3 + tailV24M06 C R*x^4 + tailV25M06 C R*x^5 + tailV26M06 C R*x^6 + tailV27M06 C R*x^7

def tailRem2M06 {A : Type*} [CommRing A] (C R x : A) : A :=
 (52224*R + -310528*R^2 + 138240*R^3 + -8960*R^4 + -21504*C + -33024*C*R + 192000*C*R^2 + -35840*C*R^3 + 16384*C^2 + 29184*C^2*R + -32256*C^2*R^2 + -3072*C^3 + -7168*C^3*R + -256*C^4) + x*(-400512*R + 2394496*R^2 + -1044480*R^3 + 66560*R^4 + 164064*C + 273280*C*R + -1482240*C*R^2 + 271360*C*R^3 + -128000*C^2 + -233472*C^2*R + 248832*C^2*R^2 + 23808*C^3 + 56320*C^3*R + 2048*C^4) + x^2*(1342464*R + -7990528*R^2 + 3400704*R^3 + -212480*R^4 + -544512*C + -994560*C*R + 4953600*C*R^2 + -885760*C*R^3 + 434752*C^2 + 815616*C^2*R + -830976*C^2*R^2 + -79872*C^3 + -192512*C^3*R + -7168*C^4) + x^3*(-2570880*R + 14986368*R^2 + -6188544*R^3 + 377856*R^4 + 1024800*C + 2078848*C*R + -9308928*C*R^2 + 1616896*C*R^3 + -835328*C^2 + -1622016*C^2*R + 1560576*C^2*R^2 + 150528*C^3 + 372736*C^3*R + 14336*C^4) + x^4*(3075072*R + -17098496*R^2 + 6801408*R^3 + -404224*R^4 + -1190400*C + -2723072*C*R + 10650624*C*R^2 + -1783808*C*R^3 + 985216*C^2 + 1999872*C^2*R + -1784832*C^2*R^2 + -172032*C^3 + -444416*C^3*R + -17920*C^4) + x^5*(-2335104*R + 11895424*R^2 + -4515840*R^3 + 260096*R^4 + 861216*C + 2266240*C*R + -7440384*C*R^2 + 1189888*C*R^3 + -716288*C^2 + -1548288*C^2*R + 1247232*C^2*R^2 + 118272*C^3 + 329728*C^3*R + 14336*C^4) + x^6*(1059840*R + -4681472*R^2 + 1677312*R^3 + -93184*R^4 + -360192*C + -1125632*C*R + 2946048*C*R^2 + -444416*C*R^3 + 294976*C^2 + 709632*C^2*R + -494592*C^2*R^2 + -43008*C^3 + -143360*C^3*R + -7168*C^4) + x^7*(-223104*R + 804736*R^2 + -268800*R^3 + 14336*R^4 + 64992*C + 257920*C*R + -510720*C*R^2 + 71680*C*R^3 + -48896*C^2 + -150528*C^2*R + 86016*C^2*R^2 + 3840*C^3 + 28672*C^3*R + 2048*C^4)

def tailSeq2M06 (C R : ℤ) : ℕ → ℤ
 | 0 => tailV20M06 C R
 | 1 => tailV21M06 C R
 | 2 => tailV22M06 C R
 | 3 => tailV23M06 C R
 | 4 => tailV24M06 C R
 | 5 => tailV25M06 C R
 | 6 => tailV26M06 C R
 | 7 => tailV27M06 C R
 | _ => 0

theorem tail_top_split2M06 {A : Type*} [CommRing A] (N C R x : A) :
 fullH4FA N C R (0) (3*R + -1*C) (0) x+96*(1-x)^8*(x^5*(-2*R + 1*C))=
 (1-x)^8*tailPoly2M06 C R x+tailRem2M06 C R x := by
 unfold fullH4FA tailPoly2M06 tailRem2M06 tailV20M06 tailV21M06 tailV22M06 tailV23M06 tailV24M06 tailV25M06 tailV26M06 tailV27M06
 ring

theorem tail_remainder_degree2M06 (c r : ℕ) :
 (tailRem2M06 (c:ℤ[X]) r X).natDegree≤7 := by
 unfold tailRem2M06
 compute_degree!

theorem tail_poly_coeff2M06 (c r : ℤ) (k : ℕ) (hk : k≤7) :
 (tailPoly2M06 (c:ℤ[X]) r X).coeff k=tailSeq2M06 c r k := by
 have hv0 : tailPoly2M06 (c:ℤ[X]) r X=
 Polynomial.C (tailV20M06 c r) + Polynomial.C (tailV21M06 c r)*X + Polynomial.C (tailV22M06 c r)*X^2 + Polynomial.C (tailV23M06 c r)*X^3 + Polynomial.C (tailV24M06 c r)*X^4 + Polynomial.C (tailV25M06 c r)*X^5 + Polynomial.C (tailV26M06 c r)*X^6 + Polynomial.C (tailV27M06 c r)*X^7 := by
   simp only [tailPoly2M06,tailV20M06,tailV21M06,tailV22M06,tailV23M06,tailV24M06,tailV25M06,tailV26M06,tailV27M06,map_add,map_mul,map_pow,map_intCast,map_neg,map_ofNat,map_zero,Polynomial.C_eq_intCast]
 rw [hv0]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C_mul_X,Polynomial.coeff_C]
 interval_cases k <;> norm_num [tailSeq2M06]

attribute [local irreducible] tailV20M06 tailV21M06 tailV22M06 tailV23M06 tailV24M06 tailV25M06 tailV26M06 tailV27M06

def tailGap20M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (63186969600 + 324468461568*R + 720054464512*R^2 + 904104427520*R^3 + 703841435648*R^4 + 348242444288*R^5 + 106959208448*R^6 + 18635030528*R^7 + 1408368640*R^8 + 428759955456*C + 1883671957504*C*R + 3508252401664*C*R^2 + 3598766604288*C*R^3 + 2198995238912*C*R^4 + 800792379392*C*R^5 + 160880787456*C*R^6 + 13742899200*C*R^7 + 1229012313088*C^2 + 4527379210240*C^2*R + 6884445487104*C^2*R^2 + 5541332123648*C^2*R^3 + 2492205285376*C^2*R^4 + 593853284352*C^2*R^5 + 58536099840*C^2*R^6 + 1942981984256*C^3 + 5839700279296*C^3*R + 6965327790080*C^3*R^2 + 4126670716928*C^3*R^3 + 1214905581568*C^3*R^4 + 142142341120*C^3*R^5 + 1853191569408*C^4 + 4367042969600*C^4*R + 3834179158016*C^4*R^2 + 1487654354944*C^4*R^3 + 215220224000*C^4*R^4 + 1092503207936*C^5 + 1895217364992*C^5*R + 1090291236864*C^5*R^2 + 208061071360*C^5*R^3 + 389342527488*C^6 + 442818625536*C^6*R + 125411000320*C^6*R^2 + 76883689472*C^7 + 43091230720*C^7*R + 6461849600*C^8)

theorem tail_gap20_eqM06 (C R : ℤ) :
 tailV21M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)^2-
 tailV20M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)*tailV22M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)=tailGap20M06 C R := by
 unfold tailGap20M06 tailV20M06 tailV21M06 tailV22M06
 ring
theorem tail_gap20_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap20M06 C R := by
 unfold tailGap20M06
 positivity

def tailGap21M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (5654946816 + 28541104128*R + 62223290368*R^2 + 76844072960*R^3 + 58961936384*R^4 + 28799664128*R^5 + 8730705920*R^6 + 1496317952*R^7 + 110362624*R^8 + 36584527872*C + 157559353344*C*R + 287826911232*C*R^2 + 290140700672*C*R^3 + 174532362240*C*R^4 + 62585307136*C*R^5 + 12347768832*C*R^6 + 1028653056*C*R^7 + 99341505536*C^2 + 358130458624*C^2*R + 533701779456*C^2*R^2 + 421747654656*C^2*R^3 + 186334511104*C^2*R^4 + 43531370496*C^2*R^5 + 4182245376*C^2*R^6 + 148023287808*C^3 + 434950144000*C^3*R + 507952594944*C^3*R^2 + 294922747904*C^3*R^3 + 84988133376*C^3*R^4 + 9687793664*C^3*R^5 + 132520972288*C^4 + 304923443200*C^4*R + 261716443136*C^4*R^2 + 99236708352*C^4*R^3 + 13984071680*C^4*R^4 + 72987967488*C^5 + 123461173248*C^5*R + 69301174272*C^5*R^2 + 12880707584*C^5*R^3 + 24187568128*C^6 + 26800291840*C^6*R + 7393509376*C^6*R^2 + 4427612160*C^7 + 2418016256*C^7*R + 344981504*C^8)

theorem tail_gap21_eqM06 (C R : ℤ) :
 tailV22M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)^2-
 tailV21M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)*tailV23M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)=tailGap21M06 C R := by
 unfold tailGap21M06 tailV21M06 tailV22M06 tailV23M06
 ring
theorem tail_gap21_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap21M06 C R := by
 unfold tailGap21M06
 positivity

def tailGap22M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (314090496 + 1537511424*R + 3231969280*R^2 + 3843768320*R^3 + 2848489472*R^4 + 1349648384*R^5 + 397672448*R^6 + 65798144*R^7 + 4587520*R^8 + 1875867648*C + 7769968640*C*R + 13617750016*C*R^2 + 13206552576*C*R^3 + 7682293760*C*R^4 + 2671378432*C*R^5 + 508428288*C*R^6 + 40108032*C*R^7 + 4632675328*C^2 + 16001097728*C^2*R + 22882926592*C^2*R^2 + 17435983872*C^2*R^3 + 7451590656*C^2*R^4 + 1677852672*C^2*R^5 + 152961024*C^2*R^6 + 6236405760*C^3 + 17571758080*C^3*R + 19731316736*C^3*R^2 + 11049959424*C^3*R^3 + 3065774080*C^3*R^4 + 332398592*C^3*R^5 + 5050802176*C^4 + 11138564096*C^4*R + 9189621760*C^4*R^2 + 3350200320*C^4*R^3 + 450232320*C^4*R^4 + 2510585856*C^5 + 4064870400*C^5*R + 2189819904*C^5*R^2 + 389283840*C^5*R^3 + 747323392*C^6 + 792854528*C^6*R + 209846272*C^6*R^2 + 122683392*C^7 + 64487424*C^7*R + 8650752*C^8)

theorem tail_gap22_eqM06 (C R : ℤ) :
 tailV23M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)^2-
 tailV22M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)*tailV24M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)=tailGap22M06 C R := by
 unfold tailGap22M06 tailV22M06 tailV23M06 tailV24M06
 ring
theorem tail_gap22_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap22M06 C R := by
 unfold tailGap22M06
 positivity

def tailGap23M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (8856576 + 40611840*R + 79335424*R^2 + 86376448*R^3 + 57884672*R^4 + 24838144*R^5 + 6815744*R^6 + 1048576*R^7 + 65536*R^8 + 46086144*C + 173600768*C*R + 274833408*C*R^2 + 239845376*C*R^3 + 127139840*C*R^4 + 41287680*C*R^5 + 7340032*C*R^6 + 524288*C*R^7 + 93168640*C^2 + 289284096*C^2*R + 373727232*C^2*R^2 + 261357568*C^2*R^3 + 104398848*C^2*R^4 + 22020096*C^2*R^5 + 1835008*C^2*R^6 + 100163584*C^3 + 259751936*C^3*R + 269615104*C^3*R^2 + 141033472*C^3*R^3 + 36700160*C^3*R^4 + 3670016*C^3*R^5 + 68132864*C^4 + 139526144*C^4*R + 107347968*C^4*R^2 + 36700160*C^4*R^3 + 4587520*C^4*R^4 + 28966912*C^5 + 43646976*C^5*R + 22020096*C^5*R^2 + 3670016*C^5*R^3 + 7405568*C^6 + 7340032*C^6*R + 1835008*C^6*R^2 + 1048576*C^7 + 524288*C^7*R + 65536*C^8)

theorem tail_gap23_eqM06 (C R : ℤ) :
 tailV24M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)^2-
 tailV23M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)*tailV25M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)=tailGap23M06 C R := by
 unfold tailGap23M06 tailV23M06 tailV24M06 tailV25M06
 ring
theorem tail_gap23_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap23M06 C R := by
 unfold tailGap23M06
 positivity

def tailGap24M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (82944 + 331776*R + 552960*R^2 + 442368*R^3 + 147456*R^4 + 276480*C + 774144*C*R + 811008*C*R^2 + 294912*C*R^3 + 230400*C^2 + 368640*C^2*R + 147456*C^2*R^2)

theorem tail_gap24_eqM06 (C R : ℤ) :
 tailV25M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)^2-
 tailV24M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)*tailV26M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)=tailGap24M06 C R := by
 unfold tailGap24M06 tailV24M06 tailV25M06 tailV26M06
 ring
theorem tail_gap24_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap24M06 C R := by
 unfold tailGap24M06
 positivity

def tailGap25M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

theorem tail_gap25_eqM06 (C R : ℤ) :
 tailV26M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)^2-
 tailV25M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)*tailV27M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C)=tailGap25M06 C R := by
 unfold tailGap25M06 tailV25M06 tailV26M06 tailV27M06
 ring
theorem tail_gap25_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap25M06 C R := by
 unfold tailGap25M06
 positivity

theorem tail_seq_lc2M06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R)
 (k : ℕ) (hk : k≤5) :
 tailSeq2M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C) k*tailSeq2M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C) (k+2)≤
 tailSeq2M06 (5 + 2*R + 3*C) (2 + 1*R + 1*C) (k+1)^2 := by
 interval_cases k
 · simpa only [tailSeq2M06] using (sub_nonneg.mp ((tail_gap20_eqM06 C R).symm ▸ tail_gap20_nonnegM06 C R hc hr))
 · simpa only [tailSeq2M06] using (sub_nonneg.mp ((tail_gap21_eqM06 C R).symm ▸ tail_gap21_nonnegM06 C R hc hr))
 · simpa only [tailSeq2M06] using (sub_nonneg.mp ((tail_gap22_eqM06 C R).symm ▸ tail_gap22_nonnegM06 C R hc hr))
 · simpa only [tailSeq2M06] using (sub_nonneg.mp ((tail_gap23_eqM06 C R).symm ▸ tail_gap23_nonnegM06 C R hc hr))
 · simpa only [tailSeq2M06] using (sub_nonneg.mp ((tail_gap24_eqM06 C R).symm ▸ tail_gap24_nonnegM06 C R hc hr))
 · simpa only [tailSeq2M06] using (sub_nonneg.mp ((tail_gap25_eqM06 C R).symm ▸ tail_gap25_nonnegM06 C R hc hr))
end
end MathGKM.Markov
