import MarkovFullSourceFA
/-! Machine-authored 06b5b1f9. Exact fourth-slice tail certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def tailV40M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (1013760*R + 36736*R^2 + -129024*R^3 + 8960*R^4 + -503808*C + -188160*C*R + -150528*C*R^2 + 35840*C*R^3 + 161408*C^2 + -21504*C^2*R + 32256*C^2*R^2 + -12288*C^3 + 7168*C^3*R + 256*C^4)

def tailV41M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (588672*R + -99584*R^2 + -53760*R^3 + 5120*R^4 + -288480*C + -105472*C*R + -26880*C*R^2 + 15360*C*R^3 + 91392*C^2 + 9216*C^2*R^2 + -6912*C^3 + 1024*C^3*R)

def tailV42M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (281088*R + -106624*R^2 + -15360*R^3 + 2560*R^4 + -138240*C + -28160*C*R + 7680*C*R^2 + 5120*C*R^3 + 41280*C^2 + -1536*C^2*R + 1536*C^2*R^2 + -3072*C^3)

def tailV43M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (98688*R + -67072*R^2 + 1024*R^4 + -48288*C + 8192*C*R + 7680*C*R^2 + 1024*C*R^3 + 12288*C^2 + -3072*C^2*R + -768*C^3)

def tailV44M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (15360*R + -26752*R^2 + 3072*R^3 + 256*R^4 + -6144*C + 11520*C*R + 1536*C*R^2 + 768*C^2 + -1536*C^2*R)

def tailV45M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-7296*R + -3840*R^2 + 1536*R^3 + 5280*C + 3072*C*R + -768*C*R^2 + -768*C^2)

def tailV46M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-4608*R + 1920*R^2 + 3072*C + -1536*C*R + 192*C^2)

def tailV47M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

def tailPoly4M06 {A : Type*} [CommRing A] (C R x : A) : A :=
 tailV40M06 C R + tailV41M06 C R*x + tailV42M06 C R*x^2 + tailV43M06 C R*x^3 + tailV44M06 C R*x^4 + tailV45M06 C R*x^5 + tailV46M06 C R*x^6 + tailV47M06 C R*x^7

def tailRem4M06 {A : Type*} [CommRing A] (C R x : A) : A :=
 (-1013760*R + -36736*R^2 + 129024*R^3 + -8960*R^4 + 503808*C + 188160*C*R + 150528*C*R^2 + -35840*C*R^3 + -161408*C^2 + 21504*C^2*R + -32256*C^2*R^2 + 12288*C^3 + -7168*C^3*R + -256*C^4) + x*(7521408*R + 393472*R^2 + -978432*R^3 + 66560*R^4 + -3741984*C + -1399808*C*R + -1177344*C*R^2 + 271360*C*R^3 + 1199872*C^2 + -172032*C^2*R + 248832*C^2*R^2 + -91392*C^3 + 56320*C^3*R + 2048*C^4) + x^2*(-23956992*R + -1718656*R^2 + 3197952*R^3 + -212480*R^4 + 11937024*C + 4452864*C*R + 3992064*C*R^2 + -885760*C*R^3 + -3829568*C^2 + 603648*C^2*R + -830976*C^2*R^2 + 291840*C^3 + -192512*C^3*R + -7168*C^4) + x^3*(42437760*R + 4059648*R^2 + -5842944*R^3 + 377856*R^4 + -21193440*C + -7817216*C*R + -7623168*C*R^2 + 1616896*C*R^3 + 6797824*C^2 + -1213440*C^2*R + 1560576*C^2*R^2 + -518400*C^3 + 372736*C^3*R + 14336*C^4) + x^4*(-45093888*R + -5672576*R^2 + 6448128*R^3 + -404224*R^4 + 22602240*C + 8107264*C*R + 8876544*C*R^2 + -1783808*C*R^3 + -7238912*C^2 + 1525248*C^2*R + -1784832*C^2*R^2 + 552960*C^3 + -444416*C^3*R + -17920*C^4) + x^5*(28671360*R + 4724992*R^2 + -4299264*R^3 + 260096*R^4 + -14463456*C + -4871168*C*R + -6319872*C*R^2 + 1189888*C*R^3 + 4615936*C^2 + -1216512*C^2*R + 1247232*C^2*R^2 + -354816*C^3 + 329728*C^3*R + 14336*C^4) + x^6*(-10053120*R + -2181248*R^2 + 1603584*R^3 + -93184*R^4 + 5135616*C + 1495552*C*R + 2552832*C*R^2 + -444416*C*R^3 + -1630784*C^2 + 580608*C^2*R + -494592*C^2*R^2 + 129024*C^3 + -143360*C^3*R + -7168*C^4) + x^7*(1487232*R + 431104*R^2 + -258048*R^3 + 14336*R^4 + -781344*C + -155648*C*R + -451584*C*R^2 + 71680*C*R^3 + 249856*C^2 + -129024*C^2*R + 86016*C^2*R^2 + -23040*C^3 + 28672*C^3*R + 2048*C^4)

def tailSeq4M06 (C R : ℤ) : ℕ → ℤ
 | 0 => tailV40M06 C R
 | 1 => tailV41M06 C R
 | 2 => tailV42M06 C R
 | 3 => tailV43M06 C R
 | 4 => tailV44M06 C R
 | 5 => tailV45M06 C R
 | 6 => tailV46M06 C R
 | 7 => tailV47M06 C R
 | _ => 0

theorem tail_top_split4M06 {A : Type*} [CommRing A] (N C R x : A) :
 fullH4FA N C R (2*R + -1*C) (-1*R + 1*C) (3*R + -2*C) x+96*(1-x)^8*(x^6*(-2*R + 2*C))=
 (1-x)^8*tailPoly4M06 C R x+tailRem4M06 C R x := by
 unfold fullH4FA tailPoly4M06 tailRem4M06 tailV40M06 tailV41M06 tailV42M06 tailV43M06 tailV44M06 tailV45M06 tailV46M06 tailV47M06
 ring

theorem tail_remainder_degree4M06 (c r : ℕ) :
 (tailRem4M06 (c:ℤ[X]) r X).natDegree≤7 := by
 unfold tailRem4M06
 compute_degree!

theorem tail_poly_coeff4M06 (c r : ℤ) (k : ℕ) (hk : k≤7) :
 (tailPoly4M06 (c:ℤ[X]) r X).coeff k=tailSeq4M06 c r k := by
 have hv0 : tailPoly4M06 (c:ℤ[X]) r X=
 Polynomial.C (tailV40M06 c r) + Polynomial.C (tailV41M06 c r)*X + Polynomial.C (tailV42M06 c r)*X^2 + Polynomial.C (tailV43M06 c r)*X^3 + Polynomial.C (tailV44M06 c r)*X^4 + Polynomial.C (tailV45M06 c r)*X^5 + Polynomial.C (tailV46M06 c r)*X^6 + Polynomial.C (tailV47M06 c r)*X^7 := by
   simp only [tailPoly4M06,tailV40M06,tailV41M06,tailV42M06,tailV43M06,tailV44M06,tailV45M06,tailV46M06,tailV47M06,map_add,map_mul,map_pow,map_intCast,map_neg,map_ofNat,map_zero,Polynomial.C_eq_intCast]
   rw [show Polynomial.C c=(c:ℤ[X]) from Polynomial.C_eq_intCast c,
     show Polynomial.C r=(r:ℤ[X]) from Polynomial.C_eq_intCast r]
 rw [hv0]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C_mul_X,Polynomial.coeff_C]
 interval_cases k <;> norm_num [tailSeq4M06]

attribute [local irreducible] tailV40M06 tailV41M06 tailV42M06 tailV43M06 tailV44M06 tailV45M06 tailV46M06 tailV47M06

def tailGap40M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (32005613233152 + 190441193226240*R + 491880902778880*R^2 + 720443023491072*R^3 + 654688390512640*R^4 + 378141939400704*R^5 + 135648809746432*R^6 + 27652672978944*R^7 + 2455112908800*R^8 + 134778214189056*C + 694757190139904*C*R + 1523179975311360*C*R^2 + 1841749874442240*C*R^3 + 1327086481604608*C*R^4 + 570193593499648*C*R^5 + 135367467597824*C*R^6 + 13711823339520*C*R^7 + 245282797880320*C^2 + 1073262301216768*C^2*R + 1942610683502592*C^2*R^2 + 1862664379957248*C^2*R^3 + 998505146368000*C^2*R^4 + 283953271013376*C^2*R^5 + 33498496368640*C^2*R^6 + 252036605181952*C^3 + 910513618763776*C^3*R + 1306987362123776*C^3*R^2 + 932417228832768*C^3*R^3 + 330856268038144*C^3*R^4 + 46756895129600*C^3*R^5 + 160009851985920*C^4 + 458469004804096*C^4*R + 489695965478912*C^4*R^2 + 231268139925504*C^4*R^3 + 40782544896000*C^4*R^4 + 64319229755392*C^5 + 137143649894400*C^5*R + 96978730352640*C^5*R^2 + 22762043473920*C^5*R^3 + 16001046134784*C^6 + 22589051109376*C^6*R + 7938829844480*C^6*R^2 + 2254635532288*C^7 + 1581947289600*C^7*R + 137890365440*C^8)

theorem tail_gap40_eqM06 (C R : ℤ) :
 tailV41M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)^2-
 tailV40M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)*tailV42M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)=tailGap40M06 C R := by
 unfold tailGap40M06 tailV40M06 tailV41M06 tailV42M06
 ring
theorem tail_gap40_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap40M06 C R := by
 unfold tailGap40M06
 positivity

def tailGap41M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (4095093629952 + 24002148507648*R + 60956920086528*R^2 + 87628873089024*R^3 + 78019199188992*R^4 + 44082080514048*R^5 + 15451671625728*R^6 + 3076923064320*R^7 + 267140726784*R^8 + 16817318676480*C + 85208484175872*C*R + 183288085078016*C*R^2 + 217073955520512*C*R^3 + 152979506200576*C*R^4 + 64220896690176*C*R^5 + 14893649756160*C*R^6 + 1475343286272*C*R^7 + 29770314560512*C^2 + 127764112654336*C^2*R + 226444591718400*C^2*R^2 + 212318653448192*C^2*R^3 + 111197306552320*C^2*R^4 + 30891339153408*C^2*R^5 + 3564070502400*C^2*R^6 + 29680530857984*C^3 + 104966630998016*C^3*R + 147311916187648*C^3*R^2 + 102669206945792*C^3*R^3 + 35590029443072*C^3*R^4 + 4919078682624*C^3*R^5 + 18242754121728*C^4 + 51095614816256*C^4*R + 53313736146944*C^4*R^2 + 24598033727488*C^4*R^3 + 4242518835200*C^4*R^4 + 7087885254656*C^5 + 14762789044224*C^5*R + 10198905520128*C^5*R^2 + 2341350670336*C^5*R^3 + 1703018692608*C^6 + 2348901728256*C^6*R + 807443365888*C^6*R^2 + 231809220608*C^7 + 159089950720*C^7*R + 13711179776*C^8)

theorem tail_gap41_eqM06 (C R : ℤ) :
 tailV42M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)^2-
 tailV41M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)*tailV43M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)=tailGap41M06 C R := by
 unfold tailGap41M06 tailV41M06 tailV42M06 tailV43M06
 ring
theorem tail_gap41_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap41M06 C R := by
 unfold tailGap41M06
 positivity

def tailGap42M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (361780651008 + 2064199974912*R + 5081758212096*R^2 + 7049237594112*R^3 + 6027257511936*R^4 + 3255323000832*R^5 + 1086827102208*R^6 + 205966540800*R^7 + 17103716352*R^8 + 1426204723200*C + 7000797364224*C*R + 14523112931328*C*R^2 + 16510748491776*C*R^3 + 11120440147968*C*R^4 + 4447118426112*C*R^5 + 981940174848*C*R^6 + 93067149312*C*R^7 + 2410425607168*C^2 + 9971250298880*C^2*R + 16957295534080*C^2*R^2 + 15192778407936*C^2*R^3 + 7580961718272*C^2*R^4 + 2006025633792*C^2*R^5 + 221520199680*C^2*R^6 + 2281466806272*C^3 + 7738886209536*C^3*R + 10376549990400*C^3*R^2 + 6891439128576*C^3*R^3 + 2276441456640*C^3*R^4 + 301249069056*C^3*R^5 + 1324187877376*C^4 + 3543013425152*C^4*R + 3523402006528*C^4*R^2 + 1549779861504*C^4*R^3 + 256007208960*C^4*R^4 + 483827318784*C^5 + 960639270912*C^5*R + 632962940928*C^5*R^2 + 139217338368*C^5*R^3 + 109118291968*C^6 + 143601434624*C^6*R + 47309651968*C^6*R^2 + 13960740864*C^7 + 9185525760*C^7*R + 780140544*C^8)

theorem tail_gap42_eqM06 (C R : ℤ) :
 tailV43M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)^2-
 tailV42M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)*tailV44M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)=tailGap42M06 C R := by
 unfold tailGap42M06 tailV42M06 tailV43M06 tailV44M06
 ring
theorem tail_gap42_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap42M06 C R := by
 unfold tailGap42M06
 positivity

def tailGap43M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (19346088960 + 104984764416*R + 243147128832*R^2 + 313086099456*R^3 + 244445331456*R^4 + 118254993408*R^5 + 34690498560*R^6 + 5733089280*R^7 + 429981696*R^8 + 71025027072*C + 327641899008*C*R + 630157516800*C*R^2 + 653482278912*C*R^3 + 394077044736*C*R^4 + 138602741760*C*R^5 + 26754416640*C*R^6 + 2293235712*C*R^7 + 110331151360*C^2 + 422678151168*C^2*R + 655025332224*C^2*R^2 + 525262159872*C^2*R^3 + 230739148800*C^2*R^4 + 53508833280*C^2*R^5 + 5350883328*C^2*R^6 + 94483963904*C^3 + 291780132864*C^3*R + 350048354304*C^3*R^2 + 204869861376*C^3*R^3 + 59454259200*C^3*R^4 + 7134511104*C^3*R^5 + 48736919552*C^4 + 116641234944*C^4*R + 102323650560*C^4*R^2 + 39636172800*C^4*R^3 + 5945425920*C^4*R^4 + 15547301888*C^5 + 27258519552*C^5*R + 15854469120*C^5*R^2 + 3170893824*C^5*R^3 + 3025928192*C^6 + 3523215360*C^6*R + 1056964608*C^6*R^2 + 335544320*C^7 + 201326592*C^7*R + 16777216*C^8)

theorem tail_gap43_eqM06 (C R : ℤ) :
 tailV44M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)^2-
 tailV43M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)*tailV45M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)=tailGap43M06 C R := by
 unfold tailGap43M06 tailV43M06 tailV44M06 tailV45M06
 ring
theorem tail_gap43_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap43M06 C R := by
 unfold tailGap43M06
 positivity

def tailGap44M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (510206976 + 2502475776*R + 5095415808*R^2 + 5524291584*R^3 + 3372318720*R^4 + 1102381056*R^5 + 151289856*R^6 + 1629800448*C + 6593445888*C*R + 10637377536*C*R^2 + 8575451136*C*R^3 + 3464331264*C*R^4 + 562692096*C*R^5 + 2130158592*C^2 + 6825934848*C^2*R + 8179949568*C^2*R^2 + 4355850240*C^2*R^3 + 871907328*C^2*R^4 + 1459814400*C^3 + 3469787136*C^3*R + 2739830784*C^3*R^2 + 720764928*C^3*R^3 + 552419328*C^4 + 862420992*C^4*R + 335413248*C^4*R^2 + 108724224*C^5 + 83361792*C^5*R + 8650752*C^6)

theorem tail_gap44_eqM06 (C R : ℤ) :
 tailV45M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)^2-
 tailV44M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)*tailV46M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)=tailGap44M06 C R := by
 unfold tailGap44M06 tailV44M06 tailV45M06 tailV46M06
 ring
theorem tail_gap44_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap44M06 C R := by
 unfold tailGap44M06
 positivity

def tailGap45M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (4460544 + 16220160*R + 22855680*R^2 + 14745600*R^3 + 3686400*R^4 + 8110080*C + 21233664*C*R + 19169280*C*R^2 + 5898240*C*R^3 + 4497408*C^2 + 7372800*C^2*R + 3096576*C^2*R^2 + 737280*C^3 + 589824*C^3*R + 36864*C^4)

theorem tail_gap45_eqM06 (C R : ℤ) :
 tailV46M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)^2-
 tailV45M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)*tailV47M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C)=tailGap45M06 C R := by
 unfold tailGap45M06 tailV45M06 tailV46M06 tailV47M06
 ring
theorem tail_gap45_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap45M06 C R := by
 unfold tailGap45M06
 positivity

theorem tail_seq_lc4M06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R)
 (k : ℕ) (hk : k≤5) :
 tailSeq4M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C) k*tailSeq4M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C) (k+2)≤
 tailSeq4M06 (7 + 4*R + 3*C) (5 + 3*R + 2*C) (k+1)^2 := by
 interval_cases k
 · simpa only [tailSeq4M06] using (sub_nonneg.mp ((tail_gap40_eqM06 C R).symm ▸ tail_gap40_nonnegM06 C R hc hr))
 · simpa only [tailSeq4M06] using (sub_nonneg.mp ((tail_gap41_eqM06 C R).symm ▸ tail_gap41_nonnegM06 C R hc hr))
 · simpa only [tailSeq4M06] using (sub_nonneg.mp ((tail_gap42_eqM06 C R).symm ▸ tail_gap42_nonnegM06 C R hc hr))
 · simpa only [tailSeq4M06] using (sub_nonneg.mp ((tail_gap43_eqM06 C R).symm ▸ tail_gap43_nonnegM06 C R hc hr))
 · simpa only [tailSeq4M06] using (sub_nonneg.mp ((tail_gap44_eqM06 C R).symm ▸ tail_gap44_nonnegM06 C R hc hr))
 · simpa only [tailSeq4M06] using (sub_nonneg.mp ((tail_gap45_eqM06 C R).symm ▸ tail_gap45_nonnegM06 C R hc hr))
end
end MathGKM.Markov
