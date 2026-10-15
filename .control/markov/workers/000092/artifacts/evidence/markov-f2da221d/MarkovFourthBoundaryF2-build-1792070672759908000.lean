import MarkovFourthGapStrongK0B
/-! Machine-authored request f2da221d; adapted from excluded 0b212317 draft. Initial coefficient and adjacent-gap certificates. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def lowCoeff0F2 (C H : ℤ) : ℤ :=
 24 + -50*H + 35*H^2 + -10*H^3 + 1*H^4 + -50*C + 70*C*H + -30*C*H^2 + 4*C*H^3 + 35*C^2 + -30*C^2*H + 6*C^2*H^2 + -10*C^3 + 4*C^3*H + 1*C^4

theorem convLow_at0F2 (c h : ℤ) :
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) 0=lowCoeff0F2 c h := by
 rw [fourthLow_convolutionK0B]
 norm_num [chooseShiftSevenK0B]
 simp only [lowCoeff0F2,fourthLow0K0B,fourthLow1K0B,fourthLow2K0B,fourthLow3K0B,fourthLow4K0B,fourthLow5K0B,fourthLow6K0B,fourthLow7K0B,fourthLow8K0B,fourthLow9K0B,fourthLow10K0B,fourthLow11K0B,fourthLow12K0B]
 norm_num [Nat.choose]
 <;> ring

def lowCoeff1F2 (C H : ℤ) : ℤ :=
 96 + -536*H + 432*H^2 + -124*H^3 + 12*H^4 + 40*C + 384*C*H + -240*C*H^2 + 36*C*H^3 + -48*C^2 + -108*C^2*H + 36*C^2*H^2 + 8*C^3 + 12*C^3*H

theorem convLow_at1F2 (c h : ℤ) :
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) 1=lowCoeff1F2 c h := by
 rw [fourthLow_convolutionK0B]
 norm_num [chooseShiftSevenK0B]
 simp only [lowCoeff1F2,fourthLow0K0B,fourthLow1K0B,fourthLow2K0B,fourthLow3K0B,fourthLow4K0B,fourthLow5K0B,fourthLow6K0B,fourthLow7K0B,fourthLow8K0B,fourthLow9K0B,fourthLow10K0B,fourthLow11K0B,fourthLow12K0B]
 norm_num [Nat.choose]
 <;> ring

def lowCoeff2F2 (C H : ℤ) : ℤ :=
 144 + -3456*H + 2810*H^2 + -768*H^3 + 70*H^4 + 3240*C + -150*C*H + -726*C*H^2 + 140*C*H^3 + -1688*C^2 + 330*C^2*H + 54*C^2*H^2 + 288*C^3 + -32*C^3*H + -16*C^4

theorem convLow_at2F2 (c h : ℤ) :
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) 2=lowCoeff2F2 c h := by
 rw [fourthLow_convolutionK0B]
 norm_num [chooseShiftSevenK0B]
 simp only [lowCoeff2F2,fourthLow0K0B,fourthLow1K0B,fourthLow2K0B,fourthLow3K0B,fourthLow4K0B,fourthLow5K0B,fourthLow6K0B,fourthLow7K0B,fourthLow8K0B,fourthLow9K0B,fourthLow10K0B,fourthLow11K0B,fourthLow12K0B]
 norm_num [Nat.choose]
 <;> ring

def lowCoeff3F2 (C H : ℤ) : ℤ :=
 96 + -17256*H + 12848*H^2 + -3204*H^3 + 268*H^4 + 27552*C + -11072*C*H + -60*C*H^2 + 268*C*H^3 + -9088*C^2 + 3456*C^2*H + -192*C^2*H^2 + 960*C^3 + -224*C^3*H + -32*C^4

theorem convLow_at3F2 (c h : ℤ) :
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) 3=lowCoeff3F2 c h := by
 rw [fourthLow_convolutionK0B]
 norm_num [chooseShiftSevenK0B]
 simp only [lowCoeff3F2,fourthLow0K0B,fourthLow1K0B,fourthLow2K0B,fourthLow3K0B,fourthLow4K0B,fourthLow5K0B,fourthLow6K0B,fourthLow7K0B,fourthLow8K0B,fourthLow9K0B,fourthLow10K0B,fourthLow11K0B,fourthLow12K0B]
 norm_num [Nat.choose]
 <;> ring

def lowCoeff4F2 (C H : ℤ) : ℤ :=
 24 + -70350*H + 46115*H^2 + -10230*H^3 + 769*H^4 + 152064*C + -73504*C*H + 8832*C*H^2 + -26832*C^2 + 12480*C^2*H + -1152*C^2*H^2 + 672*C^3 + -416*C^3*H + 48*C^4

theorem convLow_at4F2 (c h : ℤ) :
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) 4=lowCoeff4F2 c h := by
 rw [fourthLow_convolutionK0B]
 norm_num [chooseShiftSevenK0B]
 simp only [lowCoeff4F2,fourthLow0K0B,fourthLow1K0B,fourthLow2K0B,fourthLow3K0B,fourthLow4K0B,fourthLow5K0B,fourthLow6K0B,fourthLow7K0B,fourthLow8K0B,fourthLow9K0B,fourthLow10K0B,fourthLow11K0B,fourthLow12K0B]
 norm_num [Nat.choose]
 <;> ring

def lowCoeff5F2 (C H : ℤ) : ℤ :=
 -240000*H + 137600*H^2 + -26880*H^3 + 1792*H^4 + 648864*C + -315936*C*H + 46272*C*H^2 + -1792*C*H^3 + -39008*C^2 + 25344*C^2*H + -2880*C^2*H^2 + -5376*C^3 + 160*C^3*H + 320*C^4

theorem convLow_at5F2 (c h : ℤ) :
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) 5=lowCoeff5F2 c h := by
 rw [fourthLow_convolutionK0B]
 norm_num [chooseShiftSevenK0B]
 simp only [lowCoeff5F2,fourthLow0K0B,fourthLow1K0B,fourthLow2K0B,fourthLow3K0B,fourthLow4K0B,fourthLow5K0B,fourthLow6K0B,fourthLow7K0B,fourthLow8K0B,fourthLow9K0B,fourthLow10K0B,fourthLow11K0B,fourthLow12K0B]
 norm_num [Nat.choose]
 <;> ring

def lowCoeff6F2 (C H : ℤ) : ℤ :=
 -703232*H + 354304*H^2 + -60928*H^3 + 3584*H^4 + 2284928*C + -1060640*C*H + 156672*C*H^2 + -7168*C*H^3 + 62448*C^2 + 17472*C^2*H + -3840*C^2*H^2 + -25568*C^3 + 2784*C^3*H + 624*C^4

theorem convLow_at6F2 (c h : ℤ) :
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) 6=lowCoeff6F2 c h := by
 rw [fourthLow_convolutionK0B]
 norm_num [chooseShiftSevenK0B]
 simp only [lowCoeff6F2,fourthLow0K0B,fourthLow1K0B,fourthLow2K0B,fourthLow3K0B,fourthLow4K0B,fourthLow5K0B,fourthLow6K0B,fourthLow7K0B,fourthLow8K0B,fourthLow9K0B,fourthLow10K0B,fourthLow11K0B,fourthLow12K0B]
 norm_num [Nat.choose]
 <;> ring

def lowGap1F2 (C R : ℤ) : ℤ :=
 16128 + 69840*R + 127704*R^2 + 130492*R^3 + 82370*R^4 + 32944*R^5 + 8156*R^6 + 1156*R^7 + 74*R^8 + 135360*C + 491016*C*R + 743600*C*R^2 + 617298*C*R^3 + 304638*C*R^4 + 89354*C*R^5 + 14530*C*R^6 + 1036*C*R^7 + 471504*C^2 + 1410344*C^2*R + 1730196*C^2*R^2 + 1122230*C^2*R^3 + 405842*C^2*R^4 + 77850*C^2*R^5 + 6306*C^2*R^6 + 890224*C^3 + 2149048*C^3*R + 2057588*C^3*R^2 + 977536*C^3*R^3 + 230380*C^3*R^4 + 21800*C^3*R^5 + 997776*C^4 + 1876488*C^4*R + 1315888*C^4*R^2 + 406480*C^4*R^3 + 46840*C^4*R^4 + 680464*C^5 + 937696*C^5*R + 427392*C^5*R^2 + 64128*C^5*R^3 + 276000*C^6 + 247840*C^6*R + 54752*C^6*R^2 + 61120*C^7 + 26752*C^7*R + 5760*C^8

theorem lowGap1_identityF2 (C R : ℤ) :
 lowCoeff1F2 (C+2) ((C+2)*1+R+1)^2-
 lowCoeff0F2 (C+2) ((C+2)*1+R+1)*
 lowCoeff2F2 (C+2) ((C+2)*1+R+1)=lowGap1F2 C R := by
 unfold lowCoeff1F2 lowCoeff0F2 lowCoeff2F2 lowGap1F2
 ring

theorem lowGap1_nonnegF2 (C R : ℤ) (hC : 0≤C) (hR : 0≤R) :
 0≤lowGap1F2 C R := by unfold lowGap1F2; positivity

theorem lowCoeff1_lcF2 (c h : ℤ) (hc : 2≤c) (hh : c*1+1≤h) :
 lowCoeff0F2 c h*lowCoeff2F2 c h≤lowCoeff1F2 c h^2 := by
 have he := lowGap1_identityF2 (c-2) (h-c*1-1)
 have hn := lowGap1_nonnegF2 (c-2) (h-c*1-1) (by omega) (by omega)
 have ec : c-2+2=c := by ring
 have eh : (c-2+2)*1+(h-c*1-1)+1=h := by ring
 rw [eh,ec] at he
 linarith only [he,hn]

def lowGap2F2 (C R : ℤ) : ℤ :=
 46582272 + 99715008*R + 93920656*R^2 + 51008608*R^3 + 17490644*R^4 + 3881632*R^5 + 546440*R^6 + 44992*R^7 + 1684*R^8 + 271401984*C + 506798544*C*R + 408920208*C*R^2 + 185146568*C*R^3 + 50842104*C*R^4 + 8488472*C*R^5 + 803256*C*R^6 + 33680*C*R^7 + 681304032*C^2 + 1088411760*C^2*R + 731634004*C^2*R^2 + 265071984*C^2*R^3 + 54664924*C^2*R^4 + 6114504*C^2*R^5 + 293080*C^2*R^6 + 961570080*C^3 + 1278730656*C^3*R + 687375432*C^3*R^2 + 186757488*C^3*R^3 + 25723800*C^3*R^4 + 1449648*C^3*R^5 + 833724144*C^4 + 886229424*C^4*R + 356901876*C^4*R^2 + 64597176*C^4*R^3 + 4459860*C^4*R^4 + 454279104*C^5 + 361649232*C^5*R + 96843600*C^5*R^2 + 8746272*C^5*R^3 + 151768080*C^6 + 80287200*C^6*R + 10692000*C^6*R^2 + 28413504*C^7 + 7464960*C^7*R + 2286144*C^8

theorem lowGap2_identityF2 (C R : ℤ) :
 lowCoeff2F2 (C+2) ((C+2)*2+R+1)^2-
 lowCoeff1F2 (C+2) ((C+2)*2+R+1)*
 lowCoeff3F2 (C+2) ((C+2)*2+R+1)=lowGap2F2 C R := by
 unfold lowCoeff2F2 lowCoeff1F2 lowCoeff3F2 lowGap2F2
 ring

theorem lowGap2_nonnegF2 (C R : ℤ) (hC : 0≤C) (hR : 0≤R) :
 0≤lowGap2F2 C R := by unfold lowGap2F2; positivity

theorem lowCoeff2_lcF2 (c h : ℤ) (hc : 2≤c) (hh : c*2+1≤h) :
 lowCoeff1F2 c h*lowCoeff3F2 c h≤lowCoeff2F2 c h^2 := by
 have he := lowGap2_identityF2 (c-2) (h-c*2-1)
 have hn := lowGap2_nonnegF2 (c-2) (h-c*2-1) (by omega) (by omega)
 have ec : c-2+2=c := by ring
 have eh : (c-2+2)*2+(h-c*2-1)+1=h := by ring
 rw [eh,ec] at he
 linarith only [he,hn]

def lowGap3F2 (C R : ℤ) : ℤ :=
 7263658944 + 11010759216*R + 7376212648*R^2 + 2856668388*R^3 + 700109122*R^4 + 111379632*R^5 + 11276812*R^6 + 668988*R^7 + 17994*R^8 + 38387847120*C + 51062890088*C*R + 29439683236*C*R^2 + 9545178262*C*R^3 + 1881971542*C*R^4 + 226337166*C*R^5 + 15467014*C*R^6 + 467844*C*R^7 + 88032794320*C^2 + 100718944340*C^2*R + 48593668138*C^2*R^2 + 12665104738*C^2*R^3 + 1884817492*C^2*R^4 + 152611230*C^2*R^5 + 5298262*C^2*R^6 + 114367431556*C^3 + 109458769122*C^3*R + 42426419790*C^3*R^2 + 8335188468*C^3*R^3 + 833118228*C^3*R^4 + 34145160*C^3*R^5 + 92027576540*C^4 + 70734490006*C^4*R + 20645030940*C^4*R^2 + 2718190520*C^4*R^3 + 137027670*C^4*R^4 + 46948618228*C^5 + 27156233134*C^5*R + 5302221582*C^5*R^2 + 350901476*C^5*R^3 + 14822685716*C^6 + 5728663278*C^6*R + 560566506*C^6*R^2 + 2646744280*C^7 + 511548048*C^7*R + 204603040*C^8

theorem lowGap3_identityF2 (C R : ℤ) :
 lowCoeff3F2 (C+2) ((C+2)*3+R+1)^2-
 lowCoeff2F2 (C+2) ((C+2)*3+R+1)*
 lowCoeff4F2 (C+2) ((C+2)*3+R+1)=lowGap3F2 C R := by
 unfold lowCoeff3F2 lowCoeff2F2 lowCoeff4F2 lowGap3F2
 ring

theorem lowGap3_nonnegF2 (C R : ℤ) (hC : 0≤C) (hR : 0≤R) :
 0≤lowGap3F2 C R := by unfold lowGap3F2; positivity

theorem lowCoeff3_lcF2 (c h : ℤ) (hc : 2≤c) (hh : c*3+1≤h) :
 lowCoeff2F2 c h*lowCoeff4F2 c h≤lowCoeff3F2 c h^2 := by
 have he := lowGap3_identityF2 (c-2) (h-c*3-1)
 have hn := lowGap3_nonnegF2 (c-2) (h-c*3-1) (by omega) (by omega)
 have ec : c-2+2=c := by ring
 have eh : (c-2+2)*3+(h-c*3-1)+1=h := by ring
 rw [eh,ec] at he
 linarith only [he,hn]

def lowGap4F2 (C R : ℤ) : ℤ :=
 287318915136 + 345024587424*R + 183173442772*R^2 + 56217856812*R^3 + 10919942329*R^4 + 1377597912*R^5 + 110677618*R^6 + 5211228*R^7 + 111105*R^8 + 1465127698560*C + 1546575669280*C*R + 707644217296*C*R^2 + 182092689872*C*R^3 + 28505004064*C*R^4 + 2723800560*C*R^5 + 147964432*C*R^6 + 3555360*C*R^7 + 3252729068608*C^2 + 2958221354368*C^2*R + 1134465520768*C^2*R^2 + 235081787840*C^2*R^3 + 27834391744*C^2*R^4 + 1794451392*C^2*R^5 + 49599424*C^2*R^6 + 4106433107968*C^3 + 3129392116224*C^3*R + 965856081792*C^3*R^2 + 151188779712*C^3*R^3 + 12051829632*C^3*R^4 + 394132032*C^3*R^5 + 3224580063488*C^4 + 1976967758144*C^4*R + 460436565024*C^4*R^2 + 48425876416*C^4*R^3 + 1952158944*C^4*R^4 + 1612815212800*C^5 + 745591662080*C^5*R + 116466100992*C^5*R^2 + 6176061184*C^5*R^3 + 501696763904*C^6 + 155335203840*C^6*R + 12200306688*C^6*R^2 + 88707693568*C^7 + 13777575936*C^7*R + 6822236416*C^8

theorem lowGap4_identityF2 (C R : ℤ) :
 lowCoeff4F2 (C+2) ((C+2)*4+R+1)^2-
 lowCoeff3F2 (C+2) ((C+2)*4+R+1)*
 lowCoeff5F2 (C+2) ((C+2)*4+R+1)=lowGap4F2 C R := by
 unfold lowCoeff4F2 lowCoeff3F2 lowCoeff5F2 lowGap4F2
 ring

theorem lowGap4_nonnegF2 (C R : ℤ) (hC : 0≤C) (hR : 0≤R) :
 0≤lowGap4F2 C R := by unfold lowGap4F2; positivity

theorem lowCoeff4_lcF2 (c h : ℤ) (hc : 2≤c) (hh : c*4+1≤h) :
 lowCoeff3F2 c h*lowCoeff5F2 c h≤lowCoeff4F2 c h^2 := by
 have he := lowGap4_identityF2 (c-2) (h-c*4-1)
 have hn := lowGap4_nonnegF2 (c-2) (h-c*4-1) (by omega) (by omega)
 have ec : c-2+2=c := by ring
 have eh : (c-2+2)*4+(h-c*4-1)+1=h := by ring
 rw [eh,ec] at he
 linarith only [he,hn]

def lowGap5F2 (C R : ℤ) : ℤ :=
 4781483255808 + 4820886159360*R + 2148029814400*R^2 + 553029619648*R^3 + 90091927680*R^4 + 9533226304*R^5 + 642754560*R^6 + 25414144*R^7 + 455168*R^8 + 24144423356160*C + 21413014039488*C*R + 8227929682016*C*R^2 + 1777446025632*C*R^3 + 233598384672*C*R^4 + 18748193696*C*R^5 + 855996928*C*R^6 + 17296384*C*R^7 + 53190063663552*C^2 + 40672195758816*C^2*R + 13108935916112*C^2*R^2 + 2282787916896*C^2*R^3 + 227221536240*C^2*R^4 + 12322994304*C^2*R^5 + 286726912*C^2*R^6 + 66794330635200*C^3 + 42832682235072*C^3*R + 11121433832288*C^3*R^2 + 1464851086432*C^3*R^3 + 98317722112*C^3*R^4 + 2709369632*C^3*R^5 + 52315866331920*C^4 + 27014552422848*C^4*R + 5299268202224*C^4*R^2 + 469691949408*C^4*R^3 + 15970539184*C^4*R^4 + 26177768290656*C^5 + 10203170061792*C^5*R + 1344296252832*C^5*R^2 + 60181540992*C^5*R^3 + 8172134014464*C^6 + 2135842503840*C^6*R + 141728920992*C^6*R^2 + 1454609792736*C^7 + 190980955872*C^7*R + 112939561008*C^8

theorem lowGap5_identityF2 (C R : ℤ) :
 lowCoeff5F2 (C+2) ((C+2)*5+R+1)^2-
 lowCoeff4F2 (C+2) ((C+2)*5+R+1)*
 lowCoeff6F2 (C+2) ((C+2)*5+R+1)=lowGap5F2 C R := by
 unfold lowCoeff5F2 lowCoeff4F2 lowCoeff6F2 lowGap5F2
 ring

theorem lowGap5_nonnegF2 (C R : ℤ) (hC : 0≤C) (hR : 0≤R) :
 0≤lowGap5F2 C R := by unfold lowGap5F2; positivity

theorem lowCoeff5_lcF2 (c h : ℤ) (hc : 2≤c) (hh : c*5+1≤h) :
 lowCoeff4F2 c h*lowCoeff6F2 c h≤lowCoeff5F2 c h^2 := by
 have he := lowGap5_identityF2 (c-2) (h-c*5-1)
 have hn := lowGap5_nonnegF2 (c-2) (h-c*5-1) (by omega) (by omega)
 have ec : c-2+2=c := by ring
 have eh : (c-2+2)*5+(h-c*5-1)+1=h := by ring
 rw [eh,ec] at he
 linarith only [he,hn]

theorem fourthLow_convolution_lcF2 (c h : ℤ) (j : ℕ) (hc : 2≤c)
 (hh : c*((j:ℤ)+1)+1≤h) :
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) j*
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) (j+2) ≤
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) (j+1)^2 := by
 by_cases hj : 5≤j
 · have h0 := fourthShape_convolutionK0B c h j hj
   have h1 := fourthShape_convolutionK0B c h (j+1) (by omega)
   have h2 := fourthShape_convolutionK0B c h (j+2) (by omega)
   have hg := fourthShape_logConcaveStrongK0B c h ((j:ℤ)+1) hc (by omega) hh
   have e0 : (j:ℤ)+1-1=j := by ring
   have e2 : (j:ℤ)+1+1=j+2 := by ring
   rw [e0,e2] at hg
   push_cast at h1 h2
   rw [←h0,←h1,←h2] at hg
   nlinarith only [hg]
 · interval_cases j
   · norm_num only [Nat.reduceAdd] at *
     rw [convLow_at0F2,convLow_at1F2,convLow_at2F2]
     exact lowCoeff1_lcF2 c h hc (by norm_num at hh ⊢; exact hh)
   · norm_num only [Nat.reduceAdd] at *
     rw [convLow_at1F2,convLow_at2F2,convLow_at3F2]
     exact lowCoeff2_lcF2 c h hc (by norm_num at hh ⊢; exact hh)
   · norm_num only [Nat.reduceAdd] at *
     rw [convLow_at2F2,convLow_at3F2,convLow_at4F2]
     exact lowCoeff3_lcF2 c h hc (by norm_num at hh ⊢; exact hh)
   · norm_num only [Nat.reduceAdd] at *
     rw [convLow_at3F2,convLow_at4F2,convLow_at5F2]
     exact lowCoeff4_lcF2 c h hc (by norm_num at hh ⊢; exact hh)
   · norm_num only [Nat.reduceAdd] at *
     rw [convLow_at4F2,convLow_at5F2,convLow_at6F2]
     exact lowCoeff5_lcF2 c h hc (by norm_num at hh ⊢; exact hh)
end
end MathGKM.Markov
