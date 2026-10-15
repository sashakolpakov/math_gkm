import MarkovSmallQuot0_1M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallGap0_1_0M38E (c r : ℤ) : ℤ := ((((((((1406250*c + (9562500*r + 16575000))*c + ((28406250*r + 97856250)*r + 84370000))*c + (((48150000*r + 247286250)*r + 424055250)*r + 242443500))*c + ((((50940000*r + 346749000)*r + 887147550)*r + 1009458150)*r + 430395550))*c + (((((34444800*r + 291393600)*r + 988867360)*r + 1679826270)*r + 1426260530)*r + 483522060))*c + ((((((14538240*r + 146762496)*r + 619428672)*r + 1396574472)*r + 1771229592)*r + 1196394288)*r + 335799880))*c + (((((((3502080*r + 41021952)*r + 206751744)*r + 580098720)*r + 976997216)*r + 986249592)*r + 551798536)*r + 131843280))*c + ((((((((368640*r + 4909056)*r + 28728832)*r + 96312192)*r + 201966208)*r + 270870624)*r + 226592800)*r + 107968128)*r + 22412160))

theorem small_gap0_1_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 0*smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 2≤(smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 1)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 1)^2-smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 0*smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 2=smallGap0_1_0M38E c r := by
  unfold smallValue0_1M38E smallGap0_1_0M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_1_0M38E
 positivity

def smallGap0_1_1M38E (c r : ℤ) : ℤ := ((((((((1012500*c + (7290000*r + 13122000))*c + ((22923000*r + 81955800)*r + 73805400))*c + (((41115600*r + 218962440)*r + 391557240)*r + 234930000))*c + ((((46009620*r + 324397224)*r + 863889516)*r + 1029074520)*r + 462236244))*c + (((((32892480*r + 287826696)*r + 1014611184)*r + 1799693136)*r + 1604871288)*r + 574891776))*c + ((((((14670720*r + 152946144)*r + 669049092)*r + 1570818696)*r + 2085879348)*r + 1483604784)*r + 440876064))*c + (((((((3732480*r + 45069696)*r + 234868896)*r + 684309696)*r + 1202887920)*r + 1274268432)*r + 752125344)*r + 190450176))*c + ((((((((414720*r + 5681664)*r + 34293312)*r + 119039616)*r + 259710192)*r + 364285824)*r + 320362704)*r + 161208768)*r + 35463744))

theorem small_gap0_1_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 1*smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 3≤(smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 2)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 2)^2-smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 1*smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 3=smallGap0_1_1M38E c r := by
  unfold smallValue0_1M38E smallGap0_1_1M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_1_1M38E
 positivity

def smallGap0_1_2M38E (c r : ℤ) : ℤ := ((((((((182250*c + (1385100*r + 2536920))*c + ((4599990*r + 16777206)*r + 15572088))*c + (((8718840*r + 47482686)*r + 87700158)*r + 54765540))*c + ((((10315350*r + 74547540)*r + 205444188)*r + 255076110)*r + 120126150))*c + (((((7800300*r + 70115220)*r + 256216932)*r + 474228630)*r + 443570022)*r + 167416308))*c + ((((((3681450*r + 39504510)*r + 179405928)*r + 439884630)*r + 612677142)*r + 458669988)*r + 143917560))*c + (((((((991440*r + 12344886)*r + 66869550)*r + 203560110)*r + 375148818)*r + 417641796)*r + 259528968)*r + 69323184))*c + ((((((((116640*r + 1650456)*r + 10364436)*r + 37593540)*r + 85915548)*r + 126388116)*r + 116623728)*r + 61603344)*r + 14243904))

theorem small_gap0_1_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 2*smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 4≤(smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 3)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 3)^2-smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 2*smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 4=smallGap0_1_2M38E c r := by
  unfold smallValue0_1M38E smallGap0_1_2M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_1_2M38E
 positivity

def smallGap0_1_3M38E (c r : ℤ) : ℤ := ((((((((6561*c + (52488*r + 96228))*c + ((183708*r + 673596)*r + 639090))*c + (((367416*r + 2020788)*r + 3834540)*r + 2496744))*c + ((((459270*r + 3367980)*r + 9586350)*r + 12431880)*r + 6199641))*c + (((((367416*r + 3367980)*r + 12781800)*r + 24770448)*r + 24449508)*r + 9881172))*c + ((((((183708*r + 2020788)*r + 9586350)*r + 24687504)*r + 36216342)*r + 28749564)*r + 9727380))*c + (((((((52488*r + 673596)*r + 3834540)*r + 12307464)*r + 23882724)*r + 28003068)*r + 18470952)*r + 5347296))*c + ((((((((6561*r + 96228)*r + 639090)*r + 2455272)*r + 5916249)*r + 9134676)*r + 8858772)*r + 4983264)*r + 1263168))

theorem small_gap0_1_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 3*smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 5≤(smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 4)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 4)^2-smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 3*smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) 5=smallGap0_1_3M38E c r := by
  unfold smallValue0_1M38E smallGap0_1_3M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_1_3M38E
 positivity

theorem small_lc0_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :
 smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) j*smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) (j+2)≤(smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) (j+1))^2 := by
 by_cases hj : j≤3
 · interval_cases j
   · exact small_gap0_1_0M38E c r hc hr
   · exact small_gap0_1_1M38E c r hc hr
   · exact small_gap0_1_2M38E c r hc hr
   · exact small_gap0_1_3M38E c r hc hr
 · have hv : smallValue0_1M38E (7+4*c+3*r) (2+1*c+1*r) (j+2)=0 := by
    unfold smallValue0_1M38E
    split <;> omega
   rw [hv,mul_zero]
   exact sq_nonneg _

theorem source_small_lc0_1M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 0 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 0 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 0 true++false::rest)).mid.p (i+2) j≤coeff (frame (List.replicate 0 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 7+4*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 2+1*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := small_lc0_1M38E x y hx hy j
 rw [ec,er] at h
 have h0 := source_small_coeff0_1M38E rest hc hl hu (i+2) j (by omega)
 have h1 := source_small_coeff0_1M38E rest hc hl hu (i+1) (j+1) (by omega)
 have h2 := source_small_coeff0_1M38E rest hc hl hu i (j+2) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
