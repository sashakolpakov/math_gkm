import MarkovSmallQuot0_3M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallGap0_3_0M38E (c r : ℤ) : ℤ := ((((((((65610*c + (918540*r + 1041012))*c + ((5620590*r + 12671478)*r + 7122816))*c + (((19634400*r + 66048858)*r + 73900026)*r + 27480060))*c + ((((42828750*r + 191111400)*r + 319254048)*r + 236441430)*r + 65448270))*c + (((((59737500*r + 331533000)*r + 735101820)*r + 813315870)*r + 448630146)*r + 98616240))*c + ((((((52031250*r + 344823750)*r + 951505800)*r + 1398113850)*r + 1152734970)*r + 505196412)*r + 91864584))*c + (((((((25875000*r + 199106250)*r + 656468250)*r + 1201104750)*r + 1315870350)*r + 862402968)*r + 312794160)*r + 48393792))*c + ((((((((5625000*r + 49237500)*r + 188605000)*r + 412545000)*r + 563065000)*r + 490571580)*r + 266195080)*r + 82177920)*r + 11041920))

theorem small_gap0_3_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 0*smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 2≤(smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 1)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 1)^2-smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 0*smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 2=smallGap0_3_0M38E c r := by
  unfold smallValue0_3M38E smallGap0_3_0M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_3_0M38E
 positivity

def smallGap0_3_1M38E (c r : ℤ) : ℤ := ((((((((131220*c + (1924560*r + 2309472))*c + ((12334680*r + 29270808)*r + 17276328))*c + (((45120240*r + 158869512)*r + 185949432)*r + 72222192))*c + ((((103033620*r + 478653624)*r + 833378220)*r + 643024872)*r + 185207508))*c + (((((150400800*r + 864547992)*r + 1990609488)*r + 2288423232)*r + 1310671800)*r + 298749456))*c + ((((((137052000*r + 936124560)*r + 2672613252)*r + 4069092552)*r + 3475533492)*r + 1576106400)*r + 296155152))*c + (((((((71280000*r + 562629600)*r + 1912303440)*r + 3614971008)*r + 4092879648)*r + 2769496368)*r + 1035661920)*r + 165013632))*c + ((((((((16200000*r + 144792000)*r + 569677200)*r + 1283640480)*r + 1806062304)*r + 1620919200)*r + 904788432)*r + 286961280)*r + 39585024))

theorem small_gap0_3_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 1*smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 3≤(smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 2)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 2)^2-smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 1*smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 3=smallGap0_3_1M38E c r := by
  unfold smallValue0_3M38E smallGap0_3_1M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_3_1M38E
 positivity

def smallGap0_3_2M38E (c r : ℤ) : ℤ := ((((((((65610*c + (1006020*r + 1303452))*c + ((6743250*r + 17258346)*r + 10921392))*c + (((25806600*r + 97888662)*r + 122973390)*r + 51148908))*c + ((((61673400*r + 308305764)*r + 576786906)*r + 477431118)*r + 147405582))*c + (((((94245120*r + 582307056)*r + 1442222496)*r + 1780338186)*r + 1091819286)*r + 265586328))*c + ((((((89929440*r + 659513664)*r + 2027340144)*r + 3315207276)*r + 3027118140)*r + 1459905768)*r + 290061144))*c + (((((((48988800*r + 414717408)*r + 1518880032)*r + 3082654008)*r + 3723600168)*r + 2670306120)*r + 1051412184)*r + 175178880))*c + ((((((((11664000*r + 111689280)*r + 473770656)*r + 1145051568)*r + 1714693680)*r + 1625288112)*r + 951483312)*r + 314389728)*r + 44864640))

theorem small_gap0_3_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 2*smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 4≤(smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 3)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 3)^2-smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 2*smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 4=smallGap0_3_2M38E c r := by
  unfold smallValue0_3M38E smallGap0_3_2M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_3_2M38E
 positivity

def smallGap0_3_3M38E (c r : ℤ) : ℤ := ((((((((6561*c + (104976*r + 148716))*c + ((734832*r + 2082024)*r + 1449738))*c + (((2939328*r + 12492144)*r + 17459064)*r + 8081856))*c + ((((7348320*r + 41640480)*r + 88109208)*r + 82866240)*r + 29399553))*c + (((((11757312*r + 83280960)*r + 238095936)*r + 339209856)*r + 239261832)*r + 66627540))*c + ((((((11757312*r + 99937152)*r + 362804832)*r + 692250624)*r + 724919256)*r + 395406648)*r + 87635124))*c + (((((((6718464*r + 66624768)*r + 295187328)*r + 703832832)*r + 969382944)*r + 776010096)*r + 335826000)*r + 60567264))*c + ((((((((1679616*r + 19035648)*r + 100082304)*r + 285101568)*r + 482910480)*r + 503920800)*r + 319282128)*r + 112660416)*r + 16925760))

theorem small_gap0_3_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 3*smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 5≤(smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 4)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 4)^2-smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 3*smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 5=smallGap0_3_3M38E c r := by
  unfold smallValue0_3M38E smallGap0_3_3M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_3_3M38E
 positivity

def smallGap0_3_4M38E (c r : ℤ) : ℤ := ((((((171072*r + 590976)*r + 502848)*c + (((1368576*r + 5339520)*r + 6849792)*r + 2934144))*c + ((((4105728*r + 17687808)*r + 29032128)*r + 21709440)*r + 6158016))*c + (((((5474304*r + 25643520)*r + 50022144)*r + 50626944)*r + 26390016)*r + 5579136))*c + ((((((2737152*r + 13796352)*r + 30742272)*r + 38184192)*r + 27728640)*r + 11056896)*r + 1866240))

theorem small_gap0_3_4M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 4*smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 6≤(smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 5)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 5)^2-smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 4*smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) 6=smallGap0_3_4M38E c r := by
  unfold smallValue0_3M38E smallGap0_3_4M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_3_4M38E
 positivity

theorem small_lc0_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :
 smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) j*smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) (j+2)≤(smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) (j+1))^2 := by
 by_cases hj : j≤4
 · interval_cases j
   · exact small_gap0_3_0M38E c r hc hr
   · exact small_gap0_3_1M38E c r hc hr
   · exact small_gap0_3_2M38E c r hc hr
   · exact small_gap0_3_3M38E c r hc hr
   · exact small_gap0_3_4M38E c r hc hr
 · have hv : smallValue0_3M38E (5+2*c+3*r) (3+1*c+2*r) (j+2)=0 := by
    unfold smallValue0_3M38E
    split <;> omega
   rw [hv,mul_zero]
   exact sq_nonneg _

theorem source_small_lc0_3M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 0 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 0 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 0 true++false::rest)).mid.p (i+2) j≤coeff (frame (List.replicate 0 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let x : ℤ := 2*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 2*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+2*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 3+1*x+2*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := small_lc0_3M38E x y hx hy j
 rw [ec,er] at h
 have h0 := source_small_coeff0_3M38E rest hc hl hu (i+2) j (by omega)
 have h1 := source_small_coeff0_3M38E rest hc hl hu (i+1) (j+1) (by omega)
 have h2 := source_small_coeff0_3M38E rest hc hl hu i (j+2) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
