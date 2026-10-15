import MarkovFullSourceChamber5M06
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallValue3_5M38E (c r : ℤ) (j : ℕ) : ℤ :=
 match j with
 | 0 => ((((256*c + (256*r + (-640)))*c + ((96*r + (-480))*r + 560))*c + (((16*r + (-120))*r + 280)*r + (-200)))*c + ((((1*r + (-10))*r + 35)*r + (-50))*r + 24))
 | 1 => ((((2304*c + (2496*r + (-5824)))*c + ((1008*r + (-4896))*r + 4992))*c + (((180*r + (-1356))*r + 2976)*r + (-1568)))*c + ((((12*r + (-124))*r + 432)*r + (-536))*r + 96))
 | 2 => ((((9824*c + (11632*r + (-25992)))*c + ((5094*r + (-24762))*r + 23152))*c + (((980*r + (-7638))*r + 16710)*r + (-7128)))*c + ((((70*r + (-768))*r + 2810)*r + (-3456))*r + 144))
 | 3 => ((((26512*c + (34804*r + (-75720)))*c + ((16692*r + (-83412))*r + 73328))*c + (((3484*r + (-28896))*r + 66016)*r + (-24216)))*c + ((((268*r + (-3204))*r + 12848)*r + (-17256))*r + 96))
 | 4 => ((((50721*c + (75724*r + (-158610)))*c + ((40374*r + (-210738))*r + 167691))*c + (((9228*r + (-83238))*r + 203186)*r + (-58986)))*c + ((((769*r + (-10230))*r + 46115)*r + (-70350))*r + 24))
 | 5 => ((((72672*c + (127776*r + (-247872)))*c + ((77184*r + (-418176))*r + 279168))*c + (((19536*r + (-191616))*r + 488976)*r + (-98592)))*c + ((((1776*r + (-26304))*r + 130704)*r + (-212544))*r))
 | 6 => ((((80144*c + (172640*r + (-292832)))*c + ((120624*r + (-659760))*r + 336592))*c + (((34240*r + (-357168))*r + 908496)*r + (-106816)))*c + ((((3424*r + (-55360))*r + 290624)*r + (-464864))*r))
 | 7 => ((((68736*c + (189072*r + (-260336)))*c + ((156432*r + (-827904))*r + 282192))*c + (((50544*r + (-542784))*r + 1300464)*r + (-54592)))*c + ((((5616*r + (-96448))*r + 513552)*r + (-752000))*r))
 | 8 => ((((45664*c + (167552*r + (-169248)))*c + ((169344*r + (-819264))*r + 140768))*c + (((63488*r + (-677184))*r + 1423424)*r + 35808))*c + ((((7936*r + (-140928))*r + 733952)*r + (-904896))*r))
 | 9 => ((((23040*c + (118464*r + (-75088)))*c + ((152640*r + (-625344))*r + 14256))*c + (((68096*r + (-691392))*r + 1151680)*r + 80128))*c + ((((9728*r + (-173440))*r + 843520)*r + (-759104))*r))
 | 10 => ((((8448*c + (65024*r + (-19840)))*c + ((112992*r + (-351840))*r + (-16608)))*c + (((62016*r + (-566400))*r + 622528)*r + 11104))*c + ((((10336*r + (-178336))*r + 754496)*r + (-321728))*r))
 | 11 => ((((2048*c + (26368*r + (-4272)))*c + ((66816*r + (-130752))*r + 29008))*c + (((47360*r + (-358128))*r + 136272)*r + (-127296)))*c + ((((9472*r + (-151200))*r + 493472)*r + 169920)*r))
 | 12 => ((((256*c + (7168*r + (-5376)))*c + ((29952*r + (-21120))*r + 74336))*c + (((29696*r + (-160128))*r + (-102336))*r + (-225888)))*c + ((((7424*r + (-103168))*r + 192256)*r + 452800)*r))
 | 13 => ((((1024*r + (-5760))*c + ((9216*r + 3840)*r + 73728))*c + (((14592*r + (-37632))*r + (-109120))*r + (-223680)))*c + ((((4864*r + (-52480))*r + (-20224))*r + 453952)*r))
 | 14 => ((((-3072)*c + ((1536*r + (-384))*r + 41568))*c + (((5120*r + 5760)*r + (-35264))*r + (-141408)))*c + ((((2560*r + (-16128))*r + (-91648))*r + 281280)*r))
 | 15 => ((((-768)*c + ((-3072)*r + 12864))*c + (((1024*r + 7680)*r + 7520)*r + (-52320)))*c + ((((1024*r)*r + (-67360))*r + 104736)*r))
 | 16 => ((((-1536)*r + 768)*c + ((1536*r + 11520)*r + (-6144)))*c + ((((256*r + 3072)*r + (-26752))*r + 15360)*r))
 | 17 => (((-768)*c + (((-768)*r + 3072)*r + 5280))*c + (((1536*r + (-3840))*r + (-7296))*r))
 | 18 => ((192*c + ((-1536)*r + 3072))*c + ((1920*r + (-4608))*r))
 | 19 => ((-288)*c + (384*r))
 | _ => 0

def smallPoly3_5M38E (c r : ℤ) : ℤ[X] :=
 C (smallValue3_5M38E c r 0)*X^0 + C (smallValue3_5M38E c r 1)*X^1 + C (smallValue3_5M38E c r 2)*X^2 + C (smallValue3_5M38E c r 3)*X^3 + C (smallValue3_5M38E c r 4)*X^4 + C (smallValue3_5M38E c r 5)*X^5 + C (smallValue3_5M38E c r 6)*X^6 + C (smallValue3_5M38E c r 7)*X^7 + C (smallValue3_5M38E c r 8)*X^8 + C (smallValue3_5M38E c r 9)*X^9 + C (smallValue3_5M38E c r 10)*X^10 + C (smallValue3_5M38E c r 11)*X^11 + C (smallValue3_5M38E c r 12)*X^12 + C (smallValue3_5M38E c r 13)*X^13 + C (smallValue3_5M38E c r 14)*X^14 + C (smallValue3_5M38E c r 15)*X^15 + C (smallValue3_5M38E c r 16)*X^16 + C (smallValue3_5M38E c r 17)*X^17 + C (smallValue3_5M38E c r 18)*X^18 + C (smallValue3_5M38E c r 19)*X^19

theorem small_identity3_5M38E (c r : ℤ) :
 chamberNumerator5M06 (3:ℤ[X]) (X^3) (C c) (C r) X =
 (1-X)^8*smallPoly3_5M38E c r := by
 unfold chamberNumerator5M06 fullH0FA fullH1FA runH0n0FA runH0n1FA runH0n2FA runH0n3FA runH0n4FA runH1n0FA runH1n1FA runH1n2FA runH1n3FA chamberHM0652FA chamberHM0653FA chamberHM0654FA smallPoly3_5M38E smallValue3_5M38E
 simp only [map_add,map_mul,map_pow,map_neg,map_ofNat,map_one,map_zero]
 ring

theorem small_coeff3_5M38E (c r : ℤ) (j : ℕ) : (smallPoly3_5M38E c r).coeff j=smallValue3_5M38E c r j := by
 simp only [smallPoly3_5M38E,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 by_cases hj : j≤19
 · interval_cases j <;> norm_num [smallValue3_5M38E]
 · have h : ∀ k, k≤19 → j≠k := by omega
   simp only [if_neg (h 0 (by omega)),if_neg (h 1 (by omega)),if_neg (h 2 (by omega)),if_neg (h 3 (by omega)),if_neg (h 4 (by omega)),if_neg (h 5 (by omega)),if_neg (h 6 (by omega)),if_neg (h 7 (by omega)),if_neg (h 8 (by omega)),if_neg (h 9 (by omega)),if_neg (h 10 (by omega)),if_neg (h 11 (by omega)),if_neg (h 12 (by omega)),if_neg (h 13 (by omega)),if_neg (h 14 (by omega)),if_neg (h 15 (by omega)),if_neg (h 16 (by omega)),if_neg (h 17 (by omega)),if_neg (h 18 (by omega)),if_neg (h 19 (by omega)),zero_add]
   unfold smallValue3_5M38E
   split <;> omega

theorem source_small_coeff3_5M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate 3 true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate 3 true++false::rest)).mid.p i j=
 smallValue3_5M38E (frame rest).mid.b (frame rest).mid.a j := by
 have h := source_fourth_chamber5_clearedM06 3 rest hc hl hu
 have hid := small_identity3_5M38E ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [C_eq_natCast] at hid
 norm_num only [Nat.cast_zero,Nat.cast_one,Nat.cast_ofNat] at h
 rw [hid] at h
 have hn : (1-(X:ℤ[X]))^8≠0 := by
  apply pow_ne_zero
  intro he
  have he1 := congrArg (fun p : ℤ[X] => p.coeff 1) he
  norm_num [Polynomial.coeff_one] at he1
 have he := mul_left_cancel₀ hn h
 have hh := congrArg (fun p : ℤ[X] => p.coeff j) he
 simpa only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs,small_coeff3_5M38E] using hh
end
end MathGKM.Markov
