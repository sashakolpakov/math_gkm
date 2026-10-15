import MarkovFullSourceFA
/-! Machine-authored 06b5b1f9. Exact fourth-slice tail certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def tailV00M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-15360*R + 309376*R^2 + -138240*R^3 + 8960*R^4 + 9216*C + 27648*C*R + -192000*C*R^2 + 35840*C*R^3 + -14464*C^2 + -29184*C^2*R + 32256*C^2*R^2 + 3072*C^3 + 7168*C^3*R + 256*C^4)

def tailV01M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (12672*R + 88576*R^2 + -61440*R^3 + 5120*R^4 + -2016*C + -13312*C*R + -53760*C*R^2 + 15360*C*R^3 + -1536*C^2 + 9216*C^2*R^2 + 768*C^3 + 1024*C^3*R)

def tailV02M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (4608*R + 12416*R^2 + -21504*R^3 + 2560*R^4 + -1536*C + -5888*C*R + -7680*C*R^2 + 5120*C*R^3 + 576*C^2 + 1536*C^2*R + 1536*C^2*R^2)

def tailV03M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (-1152*R + -1792*R^2 + -4608*R^3 + 1024*R^4 + 96*C + 512*C*R + 768*C*R^2 + 1024*C*R^3)

def tailV04M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (128*R^2 + 256*R^4)

def tailV05M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

def tailV06M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

def tailV07M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

def tailPoly0M06 {A : Type*} [CommRing A] (C R x : A) : A :=
 tailV00M06 C R + tailV01M06 C R*x + tailV02M06 C R*x^2 + tailV03M06 C R*x^3 + tailV04M06 C R*x^4 + tailV05M06 C R*x^5 + tailV06M06 C R*x^6 + tailV07M06 C R*x^7

def tailRem0M06 {A : Type*} [CommRing A] (C R x : A) : A :=
 (15360*R + -309376*R^2 + 138240*R^3 + -8960*R^4 + -9216*C + -27648*C*R + 192000*C*R^2 + -35840*C*R^3 + 14464*C^2 + 29184*C^2*R + -32256*C^2*R^2 + -3072*C^3 + -7168*C^3*R + -256*C^4) + x*(-135552*R + 2386432*R^2 + -1044480*R^3 + 66560*R^4 + 75744*C + 234496*C*R + -1482240*C*R^2 + 271360*C*R^3 + -114176*C^2 + -233472*C^2*R + 248832*C^2*R^2 + 23808*C^3 + 56320*C^3*R + 2048*C^4) + x^2*(526848*R + -7966336*R^2 + 3400704*R^3 + -212480*R^4 + -272640*C + -874752*C*R + 4953600*C*R^2 + -885760*C*R^3 + 392128*C^2 + 815616*C^2*R + -830976*C^2*R^2 + -79872*C^3 + -192512*C^3*R + -7168*C^4) + x^3*(-1176960*R + 14946048*R^2 + -6188544*R^3 + 377856*R^4 + 560160*C + 1873408*C*R + -9308928*C*R^2 + 1616896*C*R^3 + -762368*C^2 + -1622016*C^2*R + 1560576*C^2*R^2 + 150528*C^3 + 372736*C^3*R + 14336*C^4) + x^4*(1646592*R + -17058176*R^2 + 6801408*R^3 + -404224*R^4 + -714240*C + -2511872*C*R + 10650624*C*R^2 + -1783808*C*R^3 + 910336*C^2 + 1999872*C^2*R + -1784832*C^2*R^2 + -172032*C^3 + -444416*C^3*R + -17920*C^4) + x^5*(-1457280*R + 11871232*R^2 + -4515840*R^3 + 260096*R^4 + 568608*C + 2136064*C*R + -7440384*C*R^2 + 1189888*C*R^3 + -670208*C^2 + -1548288*C^2*R + 1247232*C^2*R^2 + 118272*C^3 + 329728*C^3*R + 14336*C^4) + x^6*(760320*R + -4673408*R^2 + 1677312*R^3 + -93184*R^4 + -260352*C + -1081088*C*R + 2946048*C*R^2 + -444416*C*R^3 + 279232*C^2 + 709632*C^2*R + -494592*C^2*R^2 + -43008*C^3 + -143360*C^3*R + -7168*C^4) + x^7*(-179328*R + 803584*R^2 + -268800*R^3 + 14336*R^4 + 50400*C + 251392*C*R + -510720*C*R^2 + 71680*C*R^3 + -46592*C^2 + -150528*C^2*R + 86016*C^2*R^2 + 3840*C^3 + 28672*C^3*R + 2048*C^4)

def tailSeq0M06 (C R : ℤ) : ℕ → ℤ
 | 0 => tailV00M06 C R
 | 1 => tailV01M06 C R
 | 2 => tailV02M06 C R
 | 3 => tailV03M06 C R
 | 4 => tailV04M06 C R
 | 5 => tailV05M06 C R
 | 6 => tailV06M06 C R
 | 7 => tailV07M06 C R
 | _ => 0

theorem tail_top_split0M06 {A : Type*} [CommRing A] (N C R x : A) :
 fullH4FA N C R (0) (0) (0) x+96*(1-x)^8*(0)=
 (1-x)^8*tailPoly0M06 C R x+tailRem0M06 C R x := by
 unfold fullH4FA tailPoly0M06 tailRem0M06 tailV00M06 tailV01M06 tailV02M06 tailV03M06 tailV04M06 tailV05M06 tailV06M06 tailV07M06
 ring

theorem tail_remainder_degree0M06 (c r : ℕ) :
 (tailRem0M06 (c:ℤ[X]) r X).natDegree≤7 := by
 unfold tailRem0M06
 compute_degree!

theorem tail_poly_coeff0M06 (c r : ℤ) (k : ℕ) :
 (tailPoly0M06 (c:ℤ[X]) r X).coeff k=tailSeq0M06 c r k := by
 have hv0 : tailPoly0M06 (c:ℤ[X]) r X=
 Polynomial.C (tailV00M06 c r) + Polynomial.C (tailV01M06 c r)*X + Polynomial.C (tailV02M06 c r)*X^2 + Polynomial.C (tailV03M06 c r)*X^3 + Polynomial.C (tailV04M06 c r)*X^4 + Polynomial.C (tailV05M06 c r)*X^5 + Polynomial.C (tailV06M06 c r)*X^6 + Polynomial.C (tailV07M06 c r)*X^7 := by
   simp only [tailPoly0M06,tailV00M06,tailV01M06,tailV02M06,tailV03M06,tailV04M06,tailV05M06,tailV06M06,tailV07M06,map_add,map_mul,map_pow,map_intCast]
 rw [hv0]
 by_cases hk : k<8
 · interval_cases k <;> norm_num [tailSeq0M06,Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow]
 · have hk' : 8≤k := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hk'
   simp [tailSeq0M06,Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow]

attribute [local irreducible] tailV00M06 tailV01M06 tailV02M06 tailV03M06 tailV04M06 tailV05M06 tailV06M06 tailV07M06

def tailGap00M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (8499446784 + 79933685760*R + 321953243136*R^2 + 728515117056*R^3 + 1017564659712*R^4 + 901753602048*R^5 + 496624041984*R^6 + 155790606336*R^7 + 21357527040*R^8 + 15304083456*C + 118961209344*C*R + 387783901184*C*R^2 + 690524356608*C*R^3 + 728103288832*C*R^4 + 455765852160*C*R^5 + 157096476672*C*R^6 + 23030661120*C*R^7 + 10779354112*C^2 + 67159179264*C^2*R + 170573144064*C^2*R^2 + 226908176384*C^2*R^3 + 167082213376*C^2*R^4 + 64623083520*C^2*R^5 + 10253107200*C^2*R^6 + 3765829632*C^3 + 18049564672*C^3*R + 33797865472*C^3*R^2 + 30948392960*C^3*R^3 + 13848018944*C^3*R^4 + 2414346240*C^3*R^5 + 682860544*C^4 + 2370863104*C^4*R + 2997813248*C^4*R^2 + 1627389952*C^4*R^3 + 317849600*C^4*R^4 + 61046784*C^5 + 139329536*C^5*R + 99483648*C^5*R^2 + 22282240*C^5*R^3 + 2277376*C^6 + 2490368*C^6*R + 655360*C^6*R^2)

theorem tail_gap00_eqM06 (C R : ℤ) :
 tailV01M06 (5 + 4*R + 1*C) (1 + 1*R)^2-
 tailV00M06 (5 + 4*R + 1*C) (1 + 1*R)*tailV02M06 (5 + 4*R + 1*C) (1 + 1*R)=tailGap00M06 C R := by
 unfold tailGap00M06 tailV00M06 tailV01M06 tailV02M06
 ring
theorem tail_gap00_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap00M06 C R := by
 unfold tailGap00M06
 positivity

def tailGap01M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (497009664 + 4386398208*R + 16596140032*R^2 + 35377692672*R^3 + 46792916992*R^4 + 39517421568*R^5 + 20872560640*R^6 + 6311903232*R^7 + 835977216*R^8 + 762587136*C + 5433532416*C*R + 16225345536*C*R^2 + 26549862400*C*R^3 + 25858146304*C*R^4 + 15032385536*C*R^5 + 4834721792*C*R^6 + 663748608*C*R^7 + 422163456*C^2 + 2320596992*C^2*R + 5197012992*C^2*R^2 + 6116933632*C^2*R^3 + 4003266560*C^2*R^4 + 1383333888*C^2*R^5 + 197656576*C^2*R^6 + 100564992*C^3 + 397934592*C^3*R + 615022592*C^3*R^2 + 467664896*C^3*R^3 + 175636480*C^3*R^4 + 26214400*C^3*R^5 + 9007104*C^4 + 21987328*C^4*R + 20316160*C^4*R^2 + 8388608*C^4*R^3 + 1310720*C^4*R^4)

theorem tail_gap01_eqM06 (C R : ℤ) :
 tailV02M06 (5 + 4*R + 1*C) (1 + 1*R)^2-
 tailV01M06 (5 + 4*R + 1*C) (1 + 1*R)*tailV03M06 (5 + 4*R + 1*C) (1 + 1*R)=tailGap01M06 C R := by
 unfold tailGap01M06 tailV01M06 tailV02M06 tailV03M06
 ring
theorem tail_gap01_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap01M06 C R := by
 unfold tailGap01M06
 positivity

def tailGap02M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (14828544 + 112459776*R + 381902848*R^2 + 752287744*R^3 + 935395328*R^4 + 749731840*R^5 + 377913344*R^6 + 109576192*R^7 + 14024704*R^8 + 16091136*C + 95010816*C*R + 243466240*C*R^2 + 349700096*C*R^3 + 303726592*C*R^4 + 159580160*C*R^5 + 47054848*C*R^6 + 6029312*C*R^7 + 4359168*C^2 + 18137088*C^2*R + 32088064*C^2*R^2 + 30867456*C^2*R^3 + 17022976*C^2*R^4 + 5111808*C^2*R^5 + 655360*C^2*R^6)

theorem tail_gap02_eqM06 (C R : ℤ) :
 tailV03M06 (5 + 4*R + 1*C) (1 + 1*R)^2-
 tailV02M06 (5 + 4*R + 1*C) (1 + 1*R)*tailV04M06 (5 + 4*R + 1*C) (1 + 1*R)=tailGap02M06 C R := by
 unfold tailGap02M06 tailV02M06 tailV03M06 tailV04M06
 ring
theorem tail_gap02_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap02M06 C R := by
 unfold tailGap02M06
 positivity

def tailGap03M06 {A : Type*} [CommRing A] (C R : A) : A :=
 (147456 + 983040*R + 2916352*R^2 + 5046272*R^3 + 5586944*R^4 + 4063232*R^5 + 1900544*R^6 + 524288*R^7 + 65536*R^8)

theorem tail_gap03_eqM06 (C R : ℤ) :
 tailV04M06 (5 + 4*R + 1*C) (1 + 1*R)^2-
 tailV03M06 (5 + 4*R + 1*C) (1 + 1*R)*tailV05M06 (5 + 4*R + 1*C) (1 + 1*R)=tailGap03M06 C R := by
 unfold tailGap03M06 tailV03M06 tailV04M06 tailV05M06
 ring
theorem tail_gap03_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap03M06 C R := by
 unfold tailGap03M06
 positivity

def tailGap04M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

theorem tail_gap04_eqM06 (C R : ℤ) :
 tailV05M06 (5 + 4*R + 1*C) (1 + 1*R)^2-
 tailV04M06 (5 + 4*R + 1*C) (1 + 1*R)*tailV06M06 (5 + 4*R + 1*C) (1 + 1*R)=tailGap04M06 C R := by
 unfold tailGap04M06 tailV04M06 tailV05M06 tailV06M06
 ring
theorem tail_gap04_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap04M06 C R := by
 unfold tailGap04M06
 positivity

def tailGap05M06 {A : Type*} [CommRing A] (C R : A) : A :=
 0

theorem tail_gap05_eqM06 (C R : ℤ) :
 tailV06M06 (5 + 4*R + 1*C) (1 + 1*R)^2-
 tailV05M06 (5 + 4*R + 1*C) (1 + 1*R)*tailV07M06 (5 + 4*R + 1*C) (1 + 1*R)=tailGap05M06 C R := by
 unfold tailGap05M06 tailV05M06 tailV06M06 tailV07M06
 ring
theorem tail_gap05_nonnegM06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R) :
 0≤tailGap05M06 C R := by
 unfold tailGap05M06
 positivity

theorem tail_seq_lc0M06 (C R : ℤ) (hc : 0≤C) (hr : 0≤R)
 (k : ℕ) (hk : k≤5) :
 tailSeq0M06 (5 + 4*R + 1*C) (1 + 1*R) k*tailSeq0M06 (5 + 4*R + 1*C) (1 + 1*R) (k+2)≤
 tailSeq0M06 (5 + 4*R + 1*C) (1 + 1*R) (k+1)^2 := by
 interval_cases k
 · simpa only [tailSeq0M06] using (sub_nonneg.mp ((tail_gap00_eqM06 C R).symm ▸ tail_gap00_nonnegM06 C R hc hr))
 · simpa only [tailSeq0M06] using (sub_nonneg.mp ((tail_gap01_eqM06 C R).symm ▸ tail_gap01_nonnegM06 C R hc hr))
 · simpa only [tailSeq0M06] using (sub_nonneg.mp ((tail_gap02_eqM06 C R).symm ▸ tail_gap02_nonnegM06 C R hc hr))
 · simpa only [tailSeq0M06] using (sub_nonneg.mp ((tail_gap03_eqM06 C R).symm ▸ tail_gap03_nonnegM06 C R hc hr))
 · simpa only [tailSeq0M06] using (sub_nonneg.mp ((tail_gap04_eqM06 C R).symm ▸ tail_gap04_nonnegM06 C R hc hr))
 · simpa only [tailSeq0M06] using (sub_nonneg.mp ((tail_gap05_eqM06 C R).symm ▸ tail_gap05_nonnegM06 C R hc hr))
end
end MathGKM.Markov
