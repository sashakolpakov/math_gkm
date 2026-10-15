import MarkovFullSourceFA
/-! Machine-authored 06b5b1f9. Exact fourth-slice tail certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def tailV50M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (1013760*R + 36736*R^2 + -129024*R^3 + 8960*R^4 + -503808*C + -188160*C*R + -150528*C*R^2 + 35840*C*R^3 + 161408*C^2 + -21504*C^2*R + 32256*C^2*R^2 + -12288*C^3 + 7168*C^3*R + 256*C^4)

def tailV51M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (588672*R + -99584*R^2 + -53760*R^3 + 5120*R^4 + -288480*C + -105472*C*R + -26880*C*R^2 + 15360*C*R^3 + 91392*C^2 + 9216*C^2*R^2 + -6912*C^3 + 1024*C^3*R)

def tailV52M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (281088*R + -106624*R^2 + -15360*R^3 + 2560*R^4 + -138240*C + -28160*C*R + 7680*C*R^2 + 5120*C*R^3 + 41280*C^2 + -1536*C^2*R + 1536*C^2*R^2 + -3072*C^3)

def tailV53M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (98688*R + -67072*R^2 + 1024*R^4 + -48288*C + 8192*C*R + 7680*C*R^2 + 1024*C*R^3 + 12288*C^2 + -3072*C^2*R + -768*C^3)

def tailV54M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (15360*R + -26752*R^2 + 3072*R^3 + 256*R^4 + -6144*C + 11520*C*R + 1536*C*R^2 + 768*C^2 + -1536*C^2*R)

def tailV55M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-7296*R + -3840*R^2 + 1536*R^3 + 5280*C + 3072*C*R + -768*C*R^2 + -768*C^2)

def tailV56M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-4608*R + 1920*R^2 + 3072*C + -1536*C*R + 192*C^2)

def tailV57M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (384*R + -288*C)

def tailPoly5M06 {A : Type*} [CommRing A] (C R x : A) : A :=
 tailV50M06 C R + tailV51M06 C R*x + tailV52M06 C R*x^2 + tailV53M06 C R*x^3 + tailV54M06 C R*x^4 + tailV55M06 C R*x^5 + tailV56M06 C R*x^6 + tailV57M06 C R*x^7

def tailRem5M06 {A : Type*} [CommRing A] (C R x : A) : A :=
 (-1013760*R + -36736*R^2 + 129024*R^3 + -8960*R^4 + 503808*C + 188160*C*R + 150528*C*R^2 + -35840*C*R^3 + -161408*C^2 + 21504*C^2*R + -32256*C^2*R^2 + 12288*C^3 + -7168*C^3*R + -256*C^4) + x*(7521408*R + 393472*R^2 + -978432*R^3 + 66560*R^4 + -3741984*C + -1399808*C*R + -1177344*C*R^2 + 271360*C*R^3 + 1199872*C^2 + -172032*C^2*R + 248832*C^2*R^2 + -91392*C^3 + 56320*C^3*R + 2048*C^4) + x^2*(-23956992*R + -1718656*R^2 + 3197952*R^3 + -212480*R^4 + 11937024*C + 4452864*C*R + 3992064*C*R^2 + -885760*C*R^3 + -3829568*C^2 + 603648*C^2*R + -830976*C^2*R^2 + 291840*C^3 + -192512*C^3*R + -7168*C^4) + x^3*(42437760*R + 4059648*R^2 + -5842944*R^3 + 377856*R^4 + -21193440*C + -7817216*C*R + -7623168*C*R^2 + 1616896*C*R^3 + 6797824*C^2 + -1213440*C^2*R + 1560576*C^2*R^2 + -518400*C^3 + 372736*C^3*R + 14336*C^4) + x^4*(-45093888*R + -5672576*R^2 + 6448128*R^3 + -404224*R^4 + 22602240*C + 8107264*C*R + 8876544*C*R^2 + -1783808*C*R^3 + -7238912*C^2 + 1525248*C^2*R + -1784832*C^2*R^2 + 552960*C^3 + -444416*C^3*R + -17920*C^4) + x^5*(28671360*R + 4724992*R^2 + -4299264*R^3 + 260096*R^4 + -14463456*C + -4871168*C*R + -6319872*C*R^2 + 1189888*C*R^3 + 4615936*C^2 + -1216512*C^2*R + 1247232*C^2*R^2 + -354816*C^3 + 329728*C^3*R + 14336*C^4) + x^6*(-10053120*R + -2181248*R^2 + 1603584*R^3 + -93184*R^4 + 5135616*C + 1495552*C*R + 2552832*C*R^2 + -444416*C*R^3 + -1630784*C^2 + 580608*C^2*R + -494592*C^2*R^2 + 129024*C^3 + -143360*C^3*R + -7168*C^4) + x^7*(1487232*R + 431104*R^2 + -258048*R^3 + 14336*R^4 + -781344*C + -155648*C*R + -451584*C*R^2 + 71680*C*R^3 + 249856*C^2 + -129024*C^2*R + 86016*C^2*R^2 + -23040*C^3 + 28672*C^3*R + 2048*C^4)

def tailSeq5M06 (C R : ℤ) : ℕ → ℤ
 | 0 => tailV50M06 C R
 | 1 => tailV51M06 C R
 | 2 => tailV52M06 C R
 | 3 => tailV53M06 C R
 | 4 => tailV54M06 C R
 | 5 => tailV55M06 C R
 | 6 => tailV56M06 C R
 | 7 => tailV57M06 C R
 | _ => 0

theorem tail_top_split5M06 {A : Type*} [CommRing A] (N C R x : A) :
 fullH4FA N C R (2*R + -1*C) (-1*R + 1*C) (3*R + -2*C) x+96*(1-x)^8*(x^6*(-2*R + 2*C) + x^7*(4*R + -3*C))=
 (1-x)^8*tailPoly5M06 C R x+tailRem5M06 C R x := by
 unfold fullH4FA tailPoly5M06 tailRem5M06 tailV50M06 tailV51M06 tailV52M06 tailV53M06 tailV54M06 tailV55M06 tailV56M06 tailV57M06
 ring

theorem tail_remainder_degree5M06 (c r : ℕ) :
 (tailRem5M06 (c:ℤ[X]) r X).natDegree≤7 := by
 unfold tailRem5M06
 compute_degree!

theorem tail_poly_coeff5M06 (c r : ℤ) (k : ℕ) (hk : k≤7) :
 (tailPoly5M06 (c:ℤ[X]) r X).coeff k=tailSeq5M06 c r k := by
 have hv0 : tailPoly5M06 (c:ℤ[X]) r X=
 Polynomial.C (tailV50M06 c r) + Polynomial.C (tailV51M06 c r)*X + Polynomial.C (tailV52M06 c r)*X^2 + Polynomial.C (tailV53M06 c r)*X^3 + Polynomial.C (tailV54M06 c r)*X^4 + Polynomial.C (tailV55M06 c r)*X^5 + Polynomial.C (tailV56M06 c r)*X^6 + Polynomial.C (tailV57M06 c r)*X^7 := by
   simp only [tailPoly5M06,tailV50M06,tailV51M06,tailV52M06,tailV53M06,tailV54M06,tailV55M06,tailV56M06,tailV57M06,map_add,map_mul,map_pow,map_intCast,map_neg,map_ofNat,map_zero,Polynomial.C_eq_intCast]
 rw [hv0]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C_mul_X,Polynomial.coeff_C]
 interval_cases k <;> norm_num [tailSeq5M06]

attribute [local irreducible] tailV50M06 tailV51M06 tailV52M06 tailV53M06 tailV54M06 tailV55M06 tailV56M06 tailV57M06

def tailGap50M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (1432766923776 + 3857251239936*R + 4483461202944*R^2 + 2939442561024*R^3 + 1189059870720*R^4 + 303913697280*R^5 + 47941189632*R^6 + 4271898624*R^7 + 165150720*R^8 + 13500723167232*C + 31142280413184*C*R + 30383547858944*C*R^2 + 16259180593152*C*R^3 + 5155951673344*C*R^4 + 969399336960*C*R^5 + 100185931776*C*R^6 + 4404019200*C*R^7 + 54006298992640*C^2 + 104555890409472*C^2*R + 83277028761600*C^2*R^2 + 34952041398272*C^2*R^3 + 8159651037184*C^2*R^4 + 1006067515392*C^2*R^5 + 51334348800*C^2*R^6 + 119780356718592*C^3 + 189349979619328*C^3*R + 118345468542976*C^3*R^2 + 36595586957312*C^3*R^3 + 5607756136448*C^3*R^4 + 341618196480*C^3*R^5 + 161261688389632*C^4 + 200146574147584*C^4*R + 92236476563456*C^4*R^2 + 18737860182016*C^4*R^3 + 1419601510400*C^4*R^4 + 135255710760960*C^5 + 123872799555584*C^5*R + 37533926424576*C^5*R^2 + 3772115845120*C^5*R^3 + 69254205571072*C^6 + 41733261492224*C^6*R + 6258894438400*C^6*R^2 + 19869929570304*C^7 + 5929079930880*C^7*R + 2455112908800*C^8)

theorem tail_gap50_eqM06 (C R : ℤ) :
 tailV51M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)^2-
 tailV50M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)*tailV52M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)=tailGap50M06 C R := by
 unfold tailGap50M06 tailV50M06 tailV51M06 tailV52M06
 ring
theorem tail_gap50_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap50M06 C R := by
 unfold tailGap50M06
 positivity

def tailGap51M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (214978249728 + 576173844480*R + 665573536768*R^2 + 432640917504*R^3 + 172951072768*R^4 + 43495587840*R^5 + 6717177856*R^6 + 583532544*R^7 + 22020096*R^8 + 1974704283648*C + 4521113493504*C*R + 4367341486080*C*R^2 + 2306670395392*C*R^3 + 719068758016*C*R^4 + 132309843968*C*R^5 + 13335265280*C*R^6 + 572522496*C*R^7 + 7664414097408*C^2 + 14672990117888*C^2*R + 11520988815360*C^2*R^2 + 4749429145600*C^2*R^3 + 1084779266048*C^2*R^4 + 130484797440*C^2*R^5 + 6506414080*C^2*R^6 + 16406536962048*C^3 + 25539826335744*C^3*R + 15666503942144*C^3*R^2 + 4738633957376*C^3*R^3 + 708680089600*C^3*R^4 + 42213572608*C^3*R^5 + 21202490179584*C^4 + 25808947118080*C^4*R + 11632224698368*C^4*R^2 + 2307297640448*C^4*R^3 + 171018813440*C^4*R^4 + 16987786051584*C^5 + 15214599733248*C^5*R + 4503273996288*C^5*R^2 + 443016019968*C^5*R^3 + 8284249915392*C^6 + 4878765391872*C^6*R + 716607848448*C^6*R^2 + 2263362306048*C^7 + 661782528000*C^7*R + 267140726784*C^8)

theorem tail_gap51_eqM06 (C R : ℤ) :
 tailV52M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)^2-
 tailV51M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)*tailV53M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)=tailGap51M06 C R := by
 unfold tailGap51M06 tailV51M06 tailV52M06 tailV53M06
 ring
theorem tail_gap51_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap51M06 C R := by
 unfold tailGap51M06
 positivity

def tailGap52M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (23784145920 + 63073044480*R + 71819895808*R^2 + 45773750272*R^3 + 17801338880*R^4 + 4307058688*R^5 + 630996992*R^6 + 51380224*R^7 + 1835008*R^8 + 210145001472*C + 473312526336*C*R + 447278792704*C*R^2 + 229338742784*C*R^3 + 68682612736*C*R^4 + 11986141184*C*R^5 + 1133903872*C*R^6 + 46137344*C*R^7 + 777945194496*C^2 + 1454067990528*C^2*R + 1106234417152*C^2*R^2 + 437537439744*C^2*R^3 + 94774558720*C^2*R^4 + 10716315648*C^2*R^5 + 507117568*C^2*R^6 + 1572544217088*C^3 + 2367800180736*C^3*R + 1391901671424*C^3*R^2 + 399295709184*C^3*R^3 + 56223596544*C^3*R^4 + 3182690304*C^3*R^5 + 1897590325248*C^4 + 2211308666880*C^4*R + 945449091072*C^4*R^2 + 176860692480*C^4*R^3 + 12474777600*C^4*R^4 + 1403646640128*C^5 + 1192972713984*C^5*R + 333577322496*C^5*R^2 + 31270109184*C^5*R^3 + 626757304320*C^6 + 349304389632*C^6*R + 48954212352*C^6*R^2 + 156661972992*C^7 + 43762581504*C^7*R + 17103716352*C^8)

theorem tail_gap52_eqM06 (C R : ℤ) :
 tailV53M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)^2-
 tailV52M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)*tailV54M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)=tailGap52M06 C R := by
 unfold tailGap52M06 tailV52M06 tailV53M06 tailV54M06
 ring
theorem tail_gap52_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap52M06 C R := by
 unfold tailGap52M06
 positivity

def tailGap53M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (1766605824 + 4583000064*R + 5064082432*R^2 + 3094544384*R^3 + 1131560960*R^4 + 249233408*R^5 + 31588352*R^6 + 2097152*R^7 + 65536*R^8 + 14678876160*C + 31954034688*C*R + 28821159936*C*R^2 + 13836386304*C*R^3 + 3761209344*C*R^4 + 567803904*C*R^5 + 44040192*C*R^6 + 1572864*C*R^7 + 50219532288*C^2 + 89255632896*C^2*R + 63333507072*C^2*R^2 + 22674309120*C^2*R^3 + 4249485312*C^2*R^4 + 396361728*C^2*R^5 + 16515072*C^2*R^6 + 91885879296*C^3 + 128616677376*C^3*R + 68260626432*C^3*R^2 + 16951148544*C^3*R^3 + 1981808640*C^3*R^4 + 99090432*C^3*R^5 + 97792671744*C^4 + 102637338624*C^4*R + 38017105920*C^4*R^2 + 5945425920*C^4*R^3 + 371589120*C^4*R^4 + 61677895680*C^5 + 45461274624*C^5*R + 10701766656*C^5*R^2 + 891813888*C^5*R^3 + 22651011072*C^6 + 10701766656*C^6*R + 1337720832*C^6*R^2 + 4586471424*C^7 + 1146617856*C^7*R + 429981696*C^8)

theorem tail_gap53_eqM06 (C R : ℤ) :
 tailV54M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)^2-
 tailV53M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)*tailV55M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)=tailGap53M06 C R := by
 unfold tailGap53M06 tailV53M06 tailV54M06 tailV55M06
 ring
theorem tail_gap53_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap53M06 C R := by
 unfold tailGap53M06
 positivity

def tailGap54M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (76760064 + 190826496*R + 198239232*R^2 + 110493696*R^3 + 34971648*R^4 + 5996544*R^5 + 442368*R^6 + 578912256*C + 1167704064*C*R + 947994624*C*R^2 + 389578752*C*R^3 + 81690624*C*R^4 + 7077888*C*R^5 + 1707466752*C^2 + 2701590528*C^2*R + 1624940544*C^2*R^2 + 444235776*C^2*R^3 + 46989312*C^2*R^4 + 2551578624*C^3 + 3007512576*C^3*R + 1205600256*C^3*R^2 + 165740544*C^3*R^3 + 2085617664*C^4 + 1633517568*C^4*R + 327794688*C^4*R^2 + 884736000*C^5 + 345047040*C^5*R + 151289856*C^6)

theorem tail_gap54_eqM06 (C R : ℤ) :
 tailV55M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)^2-
 tailV54M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)*tailV56M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)=tailGap54M06 C R := by
 unfold tailGap54M06 tailV54M06 tailV55M06 tailV56M06
 ring
theorem tail_gap54_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap54M06 C R := by
 unfold tailGap54M06
 positivity

def tailGap55M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (1557504 + 3483648*R + 3290112*R^2 + 1474560*R^3 + 258048*R^4 + 10985472*C + 17178624*C*R + 10027008*C*R^2 + 2064384*C*R^3 + 23298048*C^2 + 22487040*C^2*R + 5971968*C^2*R^2 + 16367616*C^3 + 7520256*C^3*R + 3686400*C^4)

theorem tail_gap55_eqM06 (C R : ℤ) :
 tailV56M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)^2-
 tailV55M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)*tailV57M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C)=tailGap55M06 C R := by
 unfold tailGap55M06 tailV55M06 tailV56M06 tailV57M06
 ring
theorem tail_gap55_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap55M06 C R := by
 unfold tailGap55M06
 positivity

theorem tail_seq_lc5M06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R)
 (k : ℕ) (hk : k≤5) :
 tailSeq5M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C) k*tailSeq5M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C) (k+2)≤
 tailSeq5M06 (5 + 1*R + 4*C) (4 + 1*R + 3*C) (k+1)^2 := by
 interval_cases k
 · simpa only [tailSeq5M06] using (sub_nonneg.mp ((tail_gap50_eqM06 C R).symm ▸ tail_gap50_nonnegM06 C R hc hr))
 · simpa only [tailSeq5M06] using (sub_nonneg.mp ((tail_gap51_eqM06 C R).symm ▸ tail_gap51_nonnegM06 C R hc hr))
 · simpa only [tailSeq5M06] using (sub_nonneg.mp ((tail_gap52_eqM06 C R).symm ▸ tail_gap52_nonnegM06 C R hc hr))
 · simpa only [tailSeq5M06] using (sub_nonneg.mp ((tail_gap53_eqM06 C R).symm ▸ tail_gap53_nonnegM06 C R hc hr))
 · simpa only [tailSeq5M06] using (sub_nonneg.mp ((tail_gap54_eqM06 C R).symm ▸ tail_gap54_nonnegM06 C R hc hr))
 · simpa only [tailSeq5M06] using (sub_nonneg.mp ((tail_gap55_eqM06 C R).symm ▸ tail_gap55_nonnegM06 C R hc hr))
end
end MathGKM.Markov
