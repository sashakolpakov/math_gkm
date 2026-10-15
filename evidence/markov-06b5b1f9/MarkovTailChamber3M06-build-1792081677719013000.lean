import MarkovFullSourceFA
/-! Machine-authored 06b5b1f9. Exact fourth-slice tail certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def tailV30M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (1059840*R + 35584*R^2 + -129024*R^3 + 8960*R^4 + -534528*C + -194304*C*R + -150528*C*R^2 + 35840*C*R^3 + 166016*C^2 + -21504*C^2*R + 32256*C^2*R^2 + -12288*C^3 + 7168*C^3*R + 256*C^4)

def tailV31M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (627840*R + -100736*R^2 + -53760*R^3 + 5120*R^4 + -314592*C + -110464*C*R + -26880*C*R^2 + 15360*C*R^3 + 95232*C^2 + 9216*C^2*R^2 + -6912*C^3 + 1024*C^3*R)

def tailV32M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (313344*R + -107776*R^2 + -15360*R^3 + 2560*R^4 + -159744*C + -32000*C*R + 7680*C*R^2 + 5120*C*R^3 + 44352*C^2 + -1536*C^2*R + 1536*C^2*R^2 + -3072*C^3)

def tailV33M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (124032*R + -68224*R^2 + 1024*R^4 + -65184*C + 5504*C*R + 7680*C*R^2 + 1024*C*R^3 + 14592*C^2 + -3072*C^2*R + -768*C^3)

def tailV34M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (33792*R + -27904*R^2 + 3072*R^3 + 256*R^4 + -18432*C + 9984*C*R + 1536*C*R^2 + 2304*C^2 + -1536*C^2*R)

def tailV35M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (4224*R + -4992*R^2 + 1536*R^3 + -2400*C + 2688*C*R + -768*C*R^2)

def tailV36M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (768*R^2 + -768*C*R + 192*C^2)

def tailV37M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

def tailPoly3M06 {A : Type*} [CommRing A] (C R x : A) : A :=
 tailV30M06 C R + tailV31M06 C R*x + tailV32M06 C R*x^2 + tailV33M06 C R*x^3 + tailV34M06 C R*x^4 + tailV35M06 C R*x^5 + tailV36M06 C R*x^6 + tailV37M06 C R*x^7

def tailRem3M06 {A : Type*} [CommRing A] (C R x : A) : A :=
 (-1059840*R + -35584*R^2 + 129024*R^3 + -8960*R^4 + 534528*C + 194304*C*R + 150528*C*R^2 + -35840*C*R^3 + -166016*C^2 + 21504*C^2*R + -32256*C^2*R^2 + 12288*C^3 + -7168*C^3*R + -256*C^4) + x*(7850880*R + 385408*R^2 + -978432*R^3 + 66560*R^4 + -3961632*C + -1443968*C*R + -1177344*C*R^2 + 271360*C*R^3 + 1232896*C^2 + -172032*C^2*R + 248832*C^2*R^2 + -91392*C^3 + 56320*C^3*R + 2048*C^4) + x^2*(-24966144*R + -1694464*R^2 + 3197952*R^3 + -212480*R^4 + 12609792*C + 4588800*C*R + 3992064*C*R^2 + -885760*C*R^3 + -3930944*C^2 + 603648*C^2*R + -830976*C^2*R^2 + 291840*C^3 + -192512*C^3*R + -7168*C^4) + x^3*(44154240*R + 4019328*R^2 + -5842944*R^3 + 377856*R^4 + -22337760*C + -8049536*C*R + -7623168*C*R^2 + 1616896*C*R^3 + 6970624*C^2 + -1213440*C^2*R + 1560576*C^2*R^2 + -518400*C^3 + 372736*C^3*R + 14336*C^4) + x^4*(-46844928*R + -5632256*R^2 + 6448128*R^3 + -404224*R^4 + 23769600*C + 8345344*C*R + 8876544*C*R^2 + -1783808*C*R^3 + -7415552*C^2 + 1525248*C^2*R + -1784832*C^2*R^2 + 552960*C^3 + -444416*C^3*R + -17920*C^4) + x^5*(29742720*R + 4700800*R^2 + -4299264*R^3 + 260096*R^4 + -15177696*C + -5017472*C*R + -6319872*C*R^2 + 1189888*C*R^3 + 4724224*C^2 + -1216512*C^2*R + 1247232*C^2*R^2 + -354816*C^3 + 329728*C^3*R + 14336*C^4) + x^6*(-10417152*R + -2173184*R^2 + 1603584*R^3 + -93184*R^4 + 5378304*C + 1545472*C*R + 2552832*C*R^2 + -444416*C*R^3 + -1667648*C^2 + 580608*C^2*R + -494592*C^2*R^2 + 129024*C^3 + -143360*C^3*R + -7168*C^4) + x^7*(1540224*R + 429952*R^2 + -258048*R^3 + 14336*R^4 + -816672*C + -162944*C*R + -451584*C*R^2 + 71680*C*R^3 + 255232*C^2 + -129024*C^2*R + 86016*C^2*R^2 + -23040*C^3 + 28672*C^3*R + 2048*C^4)

def tailSeq3M06 (C R : ℤ) : ℕ → ℤ
 | 0 => tailV30M06 C R
 | 1 => tailV31M06 C R
 | 2 => tailV32M06 C R
 | 3 => tailV33M06 C R
 | 4 => tailV34M06 C R
 | 5 => tailV35M06 C R
 | 6 => tailV36M06 C R
 | 7 => tailV37M06 C R
 | _ => 0

theorem tail_top_split3M06 {A : Type*} [CommRing A] (N C R x : A) :
 fullH4FA N C R (2*R + -1*C) (-1*R + 1*C) (0) x+96*(1-x)^8*(x^6*(4*R + -2*C))=
 (1-x)^8*tailPoly3M06 C R x+tailRem3M06 C R x := by
 unfold fullH4FA tailPoly3M06 tailRem3M06 tailV30M06 tailV31M06 tailV32M06 tailV33M06 tailV34M06 tailV35M06 tailV36M06 tailV37M06
 ring

theorem tail_remainder_degree3M06 (c r : ℕ) :
 (tailRem3M06 (c:ℤ[X]) r X).natDegree≤7 := by
 unfold tailRem3M06
 compute_degree!

theorem tail_poly_coeff3M06 (c r : ℤ) (k : ℕ) (hk : k≤7) :
 (tailPoly3M06 (c:ℤ[X]) r X).coeff k=tailSeq3M06 c r k := by
 have hv0 : tailPoly3M06 (c:ℤ[X]) r X=
 Polynomial.C (tailV30M06 c r) + Polynomial.C (tailV31M06 c r)*X + Polynomial.C (tailV32M06 c r)*X^2 + Polynomial.C (tailV33M06 c r)*X^3 + Polynomial.C (tailV34M06 c r)*X^4 + Polynomial.C (tailV35M06 c r)*X^5 + Polynomial.C (tailV36M06 c r)*X^6 + Polynomial.C (tailV37M06 c r)*X^7 := by
   simp only [tailPoly3M06,tailV30M06,tailV31M06,tailV32M06,tailV33M06,tailV34M06,tailV35M06,tailV36M06,tailV37M06,map_add,map_mul,map_pow,map_intCast,map_neg,map_ofNat,map_zero,Polynomial.C_eq_intCast]
 rw [hv0]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C_mul_X,Polynomial.coeff_C]
 interval_cases k <;> norm_num [tailSeq3M06]

attribute [local irreducible] tailV30M06 tailV31M06 tailV32M06 tailV33M06 tailV34M06 tailV35M06 tailV36M06 tailV37M06

def tailGap30M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (338798748672 + 2577811372032*R + 8410579026944*R^2 + 15379859963904*R^3 + 17257308872704*R^4 + 12182210052096*R^5 + 5292357566464*R^6 + 1296986800128*R^7 + 137890365440*R^8 + 1544264257536*C + 9992764870656*C*R + 27174911107072*C*R^2 + 40308406927360*C*R^3 + 35271612694528*C*R^4 + 18242110685184*C*R^5 + 5176821415936*C*R^6 + 624298557440*C*R^7 + 2964130754560*C^2 + 15983147704320*C^2*R + 35260177956864*C^2*R^2 + 40803227860992*C^2*R^3 + 26174390239232*C^2*R^4 + 8847393423360*C^2*R^5 + 1235288719360*C^2*R^6 + 3129134759936*C^3 + 13690477346816*C^3*R + 23574718709760*C^3*R^2 + 20011295375360*C^3*R^3 + 8392737816576*C^3*R^4 + 1395226050560*C^3*R^5 + 1990698893312*C^4 + 6802773147648*C^4*R + 8598231334912*C^4*R^2 + 4772659986432*C^4*R^3 + 983869030400*C^4*R^4 + 784348872704*C^5 + 1968665657344*C^5*R + 1627030683648*C^5*R^2 + 443552890880*C^5*R^3 + 187661287424*C^6 + 307890880512*C^6*R + 124844113920*C^6*R^2 + 24950079488*C^7 + 20057948160*C^7*R + 1408368640*C^8)

theorem tail_gap30_eqM06 (C R : ℤ) :
 tailV31M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)^2-
 tailV30M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)*tailV32M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)=tailGap30M06 C R := by
 unfold tailGap30M06 tailV30M06 tailV31M06 tailV32M06
 ring
theorem tail_gap30_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap30M06 C R := by
 unfold tailGap30M06
 positivity

def tailGap31M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (40865080320 + 306941171712*R + 985621500928*R^2 + 1768189140992*R^3 + 1939526258688*R^4 + 1333010235392*R^5 + 561451302912*R^6 + 133008195584*R^7 + 13711179776*R^8 + 180292399104*C + 1145296580608*C*R + 3047903469568*C*R^2 + 4409800228864*C*R^3 + 3750965510144*C*R^4 + 1879496196096*C*R^5 + 515727163392*C*R^6 + 60288925696*C*R^7 + 331996401664*C^2 + 1747493134336*C^2*R + 3752562647040*C^2*R^2 + 4215508336640*C^2*R^3 + 2618719993856*C^2*R^4 + 856159420416*C^2*R^5 + 115836190720*C^2*R^6 + 333232701440*C^3 + 1416431910912*C^3*R + 2365256794112*C^3*R^2 + 1944020320256*C^3*R^3 + 788869414912*C^3*R^4 + 127022399488*C^3*R^5 + 200090697728*C^4 + 662594945024*C^4*R + 811043454976*C^4*R^2 + 435728416768*C^4*R^3 + 86949232640*C^4*R^4 + 74143760384*C^5 + 180321517568*C^5*R + 144281174016*C^5*R^2 + 38045483008*C^5*R^3 + 16694116352*C^6 + 26520846336*C^6*R + 10391912448*C^6*R^2 + 2087714816*C^7 + 1620049920*C^7*R + 110362624*C^8)

theorem tail_gap31_eqM06 (C R : ℤ) :
 tailV32M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)^2-
 tailV31M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)*tailV33M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)=tailGap31M06 C R := by
 unfold tailGap31M06 tailV31M06 tailV32M06 tailV33M06
 ring
theorem tail_gap31_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap31M06 C R := by
 unfold tailGap31M06
 positivity

def tailGap32M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (3410666496 + 25052264448*R + 78246077440*R^2 + 135710588928*R^3 + 142818377728*R^4 + 93197893632*R^5 + 36785422336*R^6 + 8071938048*R^7 + 780140544*R^8 + 14324846592*C + 88038707200*C*R + 225295032320*C*R^2 + 311299653632*C*R^3 + 250709442560*C*R^4 + 117742239744*C*R^5 + 30046945280*C*R^6 + 3296722944*C*R^7 + 24662192128*C^2 + 124162039808*C^2*R + 253543677952*C^2*R^2 + 269116014592*C^2*R^3 + 156854910976*C^2*R^4 + 47895281664*C^2*R^5 + 6088032256*C^2*R^6 + 22710763520*C^3 + 91442282496*C^3*R + 144104620032*C^3*R^2 + 111354839040*C^3*R^3 + 42383179776*C^3*R^4 + 6417285120*C^3*R^5 + 12321161216*C^4 + 38500728832*C^4*R + 44447219712*C^4*R^2 + 22488547328*C^4*R^3 + 4223139840*C^4*R^4 + 4106878976*C^5 + 9461694464*C^5*R + 7155351552*C^5*R^2 + 1776812032*C^5*R^3 + 839647232*C^6 + 1264189440*C^6*R + 466747392*C^6*R^2 + 95682560*C^7 + 69992448*C^7*R + 4587520*C^8)

theorem tail_gap32_eqM06 (C R : ℤ) :
 tailV33M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)^2-
 tailV32M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)*tailV34M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)=tailGap32M06 C R := by
 unfold tailGap32M06 tailV32M06 tailV33M06 tailV34M06
 ring
theorem tail_gap32_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap32M06 C R := by
 unfold tailGap32M06
 positivity

def tailGap33M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (174007296 + 1223079936*R + 3631113216*R^2 + 5929623552*R^3 + 5781446656*R^4 + 3394830336*R^5 + 1146880000*R^6 + 201326592*R^7 + 16777216*R^8 + 673591296*C + 3879727104*C*R + 9206734848*C*R^2 + 11623792640*C*R^3 + 8346894336*C*R^4 + 3361996800*C*R^5 + 704643072*C*R^6 + 67108864*C*R^7 + 1025249280*C^2 + 4713553920*C^2*R + 8677171200*C^2*R^2 + 8155004928*C^2*R^3 + 4101439488*C^2*R^4 + 1056964608*C^2*R^5 + 117440512*C^2*R^6 + 794296320*C^3 + 2847653888*C^3*R + 3959685120*C^3*R^2 + 2669805568*C^3*R^3 + 880803840*C^3*R^4 + 117440512*C^3*R^5 + 346439680*C^4 + 956694528*C^4*R + 980287488*C^4*R^2 + 440401920*C^4*R^3 + 73400320*C^4*R^4 + 92209152*C^5 + 193069056*C^5*R + 132120576*C^5*R^2 + 29360128*C^5*R^3 + 15990784*C^6 + 22020096*C^6*R + 7340032*C^6*R^2 + 1572864*C^7 + 1048576*C^7*R + 65536*C^8)

theorem tail_gap33_eqM06 (C R : ℤ) :
 tailV34M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)^2-
 tailV33M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)*tailV35M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)=tailGap33M06 C R := by
 unfold tailGap33M06 tailV33M06 tailV34M06 tailV35M06
 ring
theorem tail_gap33_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap33M06 C R := by
 unfold tailGap33M06
 positivity

def tailGap34M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (4432896 + 27408384*R + 72901632*R^2 + 106856448*R^3 + 90980352*R^4 + 42663936*R^5 + 8650752*R^6 + 14192640*C + 69980160*C*R + 141287424*C*R^2 + 146817024*C*R^3 + 78544896*C*R^4 + 17301504*C*R^5 + 16379904*C^2 + 59891712*C^2*R + 83804160*C^2*R^2 + 53379072*C^2*R^3 + 12976128*C^2*R^4 + 7815168*C^3 + 19070976*C^3*R + 15728640*C^3*R^2 + 4325376*C^3*R^3 + 1277952*C^4 + 1671168*C^4*R + 540672*C^4*R^2)

theorem tail_gap34_eqM06 (C R : ℤ) :
 tailV35M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)^2-
 tailV34M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)*tailV36M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)=tailGap34M06 C R := by
 unfold tailGap34M06 tailV34M06 tailV35M06 tailV36M06
 ring
theorem tail_gap34_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap34M06 C R := by
 unfold tailGap34M06
 positivity

def tailGap35M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (36864 + 147456*R + 221184*R^2 + 147456*R^3 + 36864*R^4)

theorem tail_gap35_eqM06 (C R : ℤ) :
 tailV36M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)^2-
 tailV35M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)*tailV37M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C)=tailGap35M06 C R := by
 unfold tailGap35M06 tailV35M06 tailV36M06 tailV37M06
 ring
theorem tail_gap35_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap35M06 C R := by
 unfold tailGap35M06
 positivity

theorem tail_seq_lc3M06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R)
 (k : ℕ) (hk : k≤5) :
 tailSeq3M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C) k*tailSeq3M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C) (k+2)≤
 tailSeq3M06 (5 + 3*R + 2*C) (3 + 2*R + 1*C) (k+1)^2 := by
 interval_cases k
 · simpa only [tailSeq3M06] using (sub_nonneg.mp ((tail_gap30_eqM06 C R).symm ▸ tail_gap30_nonnegM06 C R hc hr))
 · simpa only [tailSeq3M06] using (sub_nonneg.mp ((tail_gap31_eqM06 C R).symm ▸ tail_gap31_nonnegM06 C R hc hr))
 · simpa only [tailSeq3M06] using (sub_nonneg.mp ((tail_gap32_eqM06 C R).symm ▸ tail_gap32_nonnegM06 C R hc hr))
 · simpa only [tailSeq3M06] using (sub_nonneg.mp ((tail_gap33_eqM06 C R).symm ▸ tail_gap33_nonnegM06 C R hc hr))
 · simpa only [tailSeq3M06] using (sub_nonneg.mp ((tail_gap34_eqM06 C R).symm ▸ tail_gap34_nonnegM06 C R hc hr))
 · simpa only [tailSeq3M06] using (sub_nonneg.mp ((tail_gap35_eqM06 C R).symm ▸ tail_gap35_nonnegM06 C R hc hr))
end
end MathGKM.Markov
