import MarkovFullSourceFA
/-! Machine-authored 06b5b1f9. Exact fourth-slice tail certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def tailV10M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-15360*R + 309376*R^2 + -138240*R^3 + 8960*R^4 + 9216*C + 27648*C*R + -192000*C*R^2 + 35840*C*R^3 + -14464*C^2 + -29184*C^2*R + 32256*C^2*R^2 + 3072*C^3 + 7168*C^3*R + 256*C^4)

def tailV11M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (12672*R + 88576*R^2 + -61440*R^3 + 5120*R^4 + -2016*C + -13312*C*R + -53760*C*R^2 + 15360*C*R^3 + -1536*C^2 + 9216*C^2*R^2 + 768*C^3 + 1024*C^3*R)

def tailV12M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (4608*R + 12416*R^2 + -21504*R^3 + 2560*R^4 + -1536*C + -5888*C*R + -7680*C*R^2 + 5120*C*R^3 + 576*C^2 + 1536*C^2*R + 1536*C^2*R^2)

def tailV13M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-1152*R + -1792*R^2 + -4608*R^3 + 1024*R^4 + 96*C + 512*C*R + 768*C*R^2 + 1024*C*R^3)

def tailV14M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (128*R^2 + 256*R^4)

def tailV15M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (384*R + -96*C)

def tailV16M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

def tailV17M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

def tailPoly1M06 {A : Type*} [CommRing A] (C R x : A) : A :=
 tailV10M06 C R + tailV11M06 C R*x + tailV12M06 C R*x^2 + tailV13M06 C R*x^3 + tailV14M06 C R*x^4 + tailV15M06 C R*x^5 + tailV16M06 C R*x^6 + tailV17M06 C R*x^7

def tailRem1M06 {A : Type*} [CommRing A] (C R x : A) : A :=
 (15360*R + -309376*R^2 + 138240*R^3 + -8960*R^4 + -9216*C + -27648*C*R + 192000*C*R^2 + -35840*C*R^3 + 14464*C^2 + 29184*C^2*R + -32256*C^2*R^2 + -3072*C^3 + -7168*C^3*R + -256*C^4) + x*(-135552*R + 2386432*R^2 + -1044480*R^3 + 66560*R^4 + 75744*C + 234496*C*R + -1482240*C*R^2 + 271360*C*R^3 + -114176*C^2 + -233472*C^2*R + 248832*C^2*R^2 + 23808*C^3 + 56320*C^3*R + 2048*C^4) + x^2*(526848*R + -7966336*R^2 + 3400704*R^3 + -212480*R^4 + -272640*C + -874752*C*R + 4953600*C*R^2 + -885760*C*R^3 + 392128*C^2 + 815616*C^2*R + -830976*C^2*R^2 + -79872*C^3 + -192512*C^3*R + -7168*C^4) + x^3*(-1176960*R + 14946048*R^2 + -6188544*R^3 + 377856*R^4 + 560160*C + 1873408*C*R + -9308928*C*R^2 + 1616896*C*R^3 + -762368*C^2 + -1622016*C^2*R + 1560576*C^2*R^2 + 150528*C^3 + 372736*C^3*R + 14336*C^4) + x^4*(1646592*R + -17058176*R^2 + 6801408*R^3 + -404224*R^4 + -714240*C + -2511872*C*R + 10650624*C*R^2 + -1783808*C*R^3 + 910336*C^2 + 1999872*C^2*R + -1784832*C^2*R^2 + -172032*C^3 + -444416*C^3*R + -17920*C^4) + x^5*(-1457280*R + 11871232*R^2 + -4515840*R^3 + 260096*R^4 + 568608*C + 2136064*C*R + -7440384*C*R^2 + 1189888*C*R^3 + -670208*C^2 + -1548288*C^2*R + 1247232*C^2*R^2 + 118272*C^3 + 329728*C^3*R + 14336*C^4) + x^6*(760320*R + -4673408*R^2 + 1677312*R^3 + -93184*R^4 + -260352*C + -1081088*C*R + 2946048*C*R^2 + -444416*C*R^3 + 279232*C^2 + 709632*C^2*R + -494592*C^2*R^2 + -43008*C^3 + -143360*C^3*R + -7168*C^4) + x^7*(-179328*R + 803584*R^2 + -268800*R^3 + 14336*R^4 + 50400*C + 251392*C*R + -510720*C*R^2 + 71680*C*R^3 + -46592*C^2 + -150528*C^2*R + 86016*C^2*R^2 + 3840*C^3 + 28672*C^3*R + 2048*C^4)

def tailSeq1M06 (C R : ℤ) : ℕ → ℤ
 | 0 => tailV10M06 C R
 | 1 => tailV11M06 C R
 | 2 => tailV12M06 C R
 | 3 => tailV13M06 C R
 | 4 => tailV14M06 C R
 | 5 => tailV15M06 C R
 | 6 => tailV16M06 C R
 | 7 => tailV17M06 C R
 | _ => 0

theorem tail_top_split1M06 {A : Type*} [CommRing A] (N C R x : A) :
 fullH4FA N C R (0) (0) (0) x+96*(1-x)^8*(x^5*(4*R + -1*C))=
 (1-x)^8*tailPoly1M06 C R x+tailRem1M06 C R x := by
 unfold fullH4FA tailPoly1M06 tailRem1M06 tailV10M06 tailV11M06 tailV12M06 tailV13M06 tailV14M06 tailV15M06 tailV16M06 tailV17M06
 ring

theorem tail_remainder_degree1M06 (c r : ℕ) :
 (tailRem1M06 (c:ℤ[X]) r X).natDegree≤7 := by
 unfold tailRem1M06
 compute_degree!

theorem tail_poly_coeff1M06 (c r : ℤ) (k : ℕ) (hk : k≤7) :
 (tailPoly1M06 (c:ℤ[X]) r X).coeff k=tailSeq1M06 c r k := by
 have hv0 : tailPoly1M06 (c:ℤ[X]) r X=
 Polynomial.C (tailV10M06 c r) + Polynomial.C (tailV11M06 c r)*X + Polynomial.C (tailV12M06 c r)*X^2 + Polynomial.C (tailV13M06 c r)*X^3 + Polynomial.C (tailV14M06 c r)*X^4 + Polynomial.C (tailV15M06 c r)*X^5 + Polynomial.C (tailV16M06 c r)*X^6 + Polynomial.C (tailV17M06 c r)*X^7 := by
   simp only [tailPoly1M06,tailV10M06,tailV11M06,tailV12M06,tailV13M06,tailV14M06,tailV15M06,tailV16M06,tailV17M06,map_add,map_mul,map_pow,map_intCast,map_neg,map_ofNat,map_zero,Polynomial.C_eq_intCast]
 rw [hv0]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C_mul_X,Polynomial.coeff_C]
 interval_cases k <;> norm_num [tailSeq1M06]

attribute [local irreducible] tailV10M06 tailV11M06 tailV12M06 tailV13M06 tailV14M06 tailV15M06 tailV16M06 tailV17M06

def tailGap10M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (743760110592 + 3317433600000*R + 6449762870272*R^2 + 7143641563136*R^3 + 4932903911424*R^4 + 2175783403520*R^5 + 598893625344*R^6 + 94090821632*R^7 + 6461849600*R^8 + 4027211907072*C + 15575409377280*C*R + 25733971443712*C*R^2 + 23560071102464*C*R^3 + 12915306758144*C*R^4 + 4241214799872*C*R^5 + 772819648512*C*R^6 + 60298362880*C*R^7 + 9393533460480*C^2 + 30867664191488*C^2*R + 42149531590656*C^2*R^2 + 30630038241280*C^2*R^3 + 12499683639296*C^2*R^4 + 2717063577600*C^2*R^5 + 245860925440*C^2*R^6 + 12328202108928*C^3 + 33475453943808*C^3*R + 36278018441216*C^3*R^2 + 19623478427648*C^3*R^3 + 5300383645696*C^3*R^4 + 572116172800*C^3*R^5 + 9958190284800*C^4 + 21457643536384*C^4*R + 17307523858432*C^4*R^2 + 6196053671936*C^4*R^3 + 830996480000*C^4*R^4 + 5070397046784*C^5 + 8130961735680*C^5*R + 4340243103744*C^5*R^2 + 771481927680*C^5*R^3 + 1589559263232*C^6 + 1686827827200*C^6*R + 447049236480*C^6*R^2 + 280589500416*C^7 + 147829555200*C^7*R + 21357527040*C^8)

theorem tail_gap10_eqM06 (C R : ℤ) :
 tailV11M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)^2-
 tailV10M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)*tailV12M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)=tailGap10M06 C R := by
 unfold tailGap10M06 tailV10M06 tailV11M06 tailV12M06
 ring
theorem tail_gap10_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap10M06 C R := by
 unfold tailGap10M06
 positivity

def tailGap11M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (45743072256 + 200066746368*R + 381686625280*R^2 + 415153168384*R^3 + 281730256896*R^4 + 122189774848*R^5 + 33081065472*R^6 + 5111283712*R^7 + 344981504*R^8 + 236307357696*C + 895016001536*C*R + 1449537421312*C*R^2 + 1302072131584*C*R^3 + 700870918144*C*R^4 + 226107850752*C*R^5 + 40479490048*C*R^6 + 3101687808*C*R^7 + 523736350720*C^2 + 1683956686848*C^2*R + 2252481847296*C^2*R^2 + 1605071962112*C^2*R^3 + 642749431808*C^2*R^4 + 137145090048*C^2*R^5 + 12179210240*C^2*R^6 + 650867392512*C^3 + 1728544653312*C^3*R + 1834423222272*C^3*R^2 + 972650446848*C^3*R^3 + 257669726208*C^3*R^4 + 27279753216*C^3*R^5 + 496465690624*C^4 + 1046258384896*C^4*R + 826370621440*C^4*R^2 + 289936506880*C^4*R^3 + 38122291200*C^4*R^4 + 238225981440*C^5 + 373734768640*C^5*R + 195386671104*C^5*R^2 + 34035728384*C^5*R^3 + 70291947520*C^6 + 73015230464*C^6*R + 18958778368*C^6*R^2 + 11672223744*C^7 + 6024069120*C^7*R + 835977216*C^8)

theorem tail_gap11_eqM06 (C R : ℤ) :
 tailV12M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)^2-
 tailV11M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)*tailV13M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)=tailGap11M06 C R := by
 unfold tailGap11M06 tailV11M06 tailV12M06 tailV13M06
 ring
theorem tail_gap11_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap11M06 C R := by
 unfold tailGap11M06
 positivity

def tailGap12M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (1439769600 + 6135613440*R + 11405575168*R^2 + 12078120960*R^3 + 7970332672*R^4 + 3357179904*R^5 + 881803264*R^6 + 132120576*R^7 + 8650752*R^8 + 6923304960*C + 25473056768*C*R + 40081424384*C*R^2 + 34965569536*C*R^3 + 18268356608*C*R^4 + 5718343680*C*R^5 + 993394688*C*R^6 + 73924608*C*R^7 + 14175723520*C^2 + 44200984576*C^2*R + 57362489344*C^2*R^2 + 39664812032*C^2*R^3 + 15417081856*C^2*R^4 + 3194880000*C^2*R^5 + 275906560*C^2*R^6 + 16197681152*C^3 + 41709600768*C^3*R + 42956095488*C^3*R^2 + 22120955904*C^3*R^3 + 5697699840*C^3*R^4 + 587464704*C^3*R^5 + 11342348288*C^4 + 23205281792*C^4*R + 17816764416*C^4*R^2 + 6085672960*C^4*R^3 + 780533760*C^4*R^4 + 5002821632*C^5 + 7638089728*C^5*R + 3893231616*C^5*R^2 + 662700032*C^5*R^3 + 1361739776*C^6 + 1381367808*C^6*R + 351141888*C^6*R^2 + 209715200*C^7 + 106168320*C^7*R + 14024704*C^8)

theorem tail_gap12_eqM06 (C R : ℤ) :
 tailV13M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)^2-
 tailV12M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)*tailV14M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)=tailGap12M06 C R := by
 unfold tailGap12M06 tailV12M06 tailV13M06 tailV14M06
 ring
theorem tail_gap12_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap12M06 C R := by
 unfold tailGap12M06
 positivity

def tailGap13M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (15787008 + 63498240*R + 113542144*R^2 + 116285440*R^3 + 73932800*R^4 + 29753344*R^5 + 7405568*R^6 + 1048576*R^7 + 65536*R^8 + 67756032*C + 235642880*C*R + 355418112*C*R^2 + 297992192*C*R^3 + 149061632*C*R^4 + 44433408*C*R^5 + 7340032*C*R^6 + 524288*C*R^7 + 123289600*C^2 + 363503616*C^2*R + 451043328*C^2*R^2 + 298811392*C^2*R^3 + 111083520*C^2*R^4 + 22020096*C^2*R^5 + 1835008*C^2*R^6 + 124370944*C^3 + 303841280*C^3*R + 299597824*C^3*R^2 + 148111360*C^3*R^3 + 36700160*C^3*R^4 + 3670016*C^3*R^5 + 76857344*C^4 + 150241280*C^4*R + 111083520*C^4*R^2 + 36700160*C^4*R^3 + 4587520*C^4*R^4 + 30146560*C^5 + 44433408*C^5*R + 22020096*C^5*R^2 + 3670016*C^5*R^3 + 7405568*C^6 + 7340032*C^6*R + 1835008*C^6*R^2 + 1048576*C^7 + 524288*C^7*R + 65536*C^8)

theorem tail_gap13_eqM06 (C R : ℤ) :
 tailV14M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)^2-
 tailV13M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)*tailV15M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)=tailGap13M06 C R := by
 unfold tailGap13M06 tailV13M06 tailV14M06 tailV15M06
 ring
theorem tail_gap13_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap13M06 C R := by
 unfold tailGap13M06
 positivity

def tailGap14M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (9216 + 18432*R + 9216*R^2)

theorem tail_gap14_eqM06 (C R : ℤ) :
 tailV15M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)^2-
 tailV14M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)*tailV16M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)=tailGap14M06 C R := by
 unfold tailGap14M06 tailV14M06 tailV15M06 tailV16M06
 ring
theorem tail_gap14_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap14M06 C R := by
 unfold tailGap14M06
 positivity

def tailGap15M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

theorem tail_gap15_eqM06 (C R : ℤ) :
 tailV16M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)^2-
 tailV15M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)*tailV17M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C)=tailGap15M06 C R := by
 unfold tailGap15M06 tailV15M06 tailV16M06 tailV17M06
 ring
theorem tail_gap15_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap15M06 C R := by
 unfold tailGap15M06
 positivity

theorem tail_seq_lc1M06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R)
 (k : ℕ) (hk : k≤5) :
 tailSeq1M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C) k*tailSeq1M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C) (k+2)≤
 tailSeq1M06 (7 + 3*R + 4*C) (2 + 1*R + 1*C) (k+1)^2 := by
 interval_cases k
 · simpa only [tailSeq1M06] using (sub_nonneg.mp ((tail_gap10_eqM06 C R).symm ▸ tail_gap10_nonnegM06 C R hc hr))
 · simpa only [tailSeq1M06] using (sub_nonneg.mp ((tail_gap11_eqM06 C R).symm ▸ tail_gap11_nonnegM06 C R hc hr))
 · simpa only [tailSeq1M06] using (sub_nonneg.mp ((tail_gap12_eqM06 C R).symm ▸ tail_gap12_nonnegM06 C R hc hr))
 · simpa only [tailSeq1M06] using (sub_nonneg.mp ((tail_gap13_eqM06 C R).symm ▸ tail_gap13_nonnegM06 C R hc hr))
 · simpa only [tailSeq1M06] using (sub_nonneg.mp ((tail_gap14_eqM06 C R).symm ▸ tail_gap14_nonnegM06 C R hc hr))
 · simpa only [tailSeq1M06] using (sub_nonneg.mp ((tail_gap15_eqM06 C R).symm ▸ tail_gap15_nonnegM06 C R hc hr))
end
end MathGKM.Markov
