import MarkovSmallQuot0_2M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallGap0_2_0M38E (c r : ℤ) : ℤ := ((((((((368640*c + (2396160*r + 3803136))*c + ((6796800*r + 21345792)*r + 16794112))*c + (((10990080*r + 51238656)*r + 79887360)*r + 41516928))*c + ((((11080800*r + 68195520)*r + 158085312)*r + 163026528)*r + 62898496))*c + (((((7134480*r + 54357480)*r + 166589856)*r + 255764232)*r + 196052544)*r + 59834688))*c + ((((((2864970*r + 25950942)*r + 98607618)*r + 200404530)*r + 228965412)*r + 138987168)*r + 34918720))*c + (((((((656100*r + 6871554)*r + 31087638)*r + 78430842)*r + 118750662)*r + 107551620)*r + 53794176)*r + 11434560))*c + ((((((((65610*r + 778572)*r + 4078512)*r + 12265668)*r + 23078142)*r + 27726192)*r + 20709576)*r + 8770752)*r + 1609344))

theorem small_gap0_2_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 0*smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 2≤(smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 1)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 1)^2-smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 0*smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 2=smallGap0_2_0M38E c r := by
  unfold smallValue0_2M38E smallGap0_2_0M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_2_0M38E
 positivity

def smallGap0_2_1M38E (c r : ℤ) : ℤ := ((((((((414720*c + (2903040*r + 4852224))*c + ((8864640*r + 29289600)*r + 24319296))*c + (((15422400*r + 75528288)*r + 123867360)*r + 67985856))*c + ((((16720020*r + 107855064)*r + 261991476)*r + 283888560)*r + 115664640))*c + (((((11566800*r + 92117736)*r + 294570288)*r + 472635336)*r + 380183664)*r + 122454720))*c + ((((((4986360*r + 47058408)*r + 185707404)*r + 392224032)*r + 467315172)*r + 297430944)*r + 78835008))*c + (((((((1224720*r + 13314456)*r + 62248824)*r + 162270648)*r + 254631384)*r + 240296784)*r + 126060864)*r + 28283904))*c + ((((((((131220*r + 1609632)*r + 8668296)*r + 26779248)*r + 51901812)*r + 64583568)*r + 50319504)*r + 22391424)*r + 4343040))

theorem small_gap0_2_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 1*smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 3≤(smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 2)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 2)^2-smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 1*smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 3=smallGap0_2_1M38E c r := by
  unfold smallValue0_2M38E smallGap0_2_1M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_2_1M38E
 positivity

def smallGap0_2_2M38E (c r : ℤ) : ℤ := ((((((((116640*c + (874800*r + 1533816))*c + ((2864970*r + 9974178)*r + 8810208))*c + (((5350860*r + 27729702)*r + 48225618)*r + 28274976))*c + ((((6232950*r + 42719400)*r + 109748520)*r + 126351486)*r + 55050912))*c + (((((4636440*r + 39380580)*r + 132879852)*r + 225459198)*r + 193164534)*r + 66576744))*c + ((((((2150550*r + 21719826)*r + 90256680)*r + 200714310)*r + 253698282)*r + 172668240)*r + 48988800))*c + (((((((568620*r + 6635358)*r + 32601042)*r + 89106858)*r + 147680370)*r + 148605696)*r + 83494584)*r + 19939104))*c + ((((((((65610*r + 866052)*r + 4891104)*r + 15775236)*r + 32126814)*r + 42422040)*r + 35304984)*r + 16740864)*r + 3415680))

theorem small_gap0_2_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 2*smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 4≤(smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 3)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 3)^2-smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 2*smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 4=smallGap0_2_2M38E c r := by
  unfold smallValue0_2M38E smallGap0_2_2M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_2_2M38E
 positivity

def smallGap0_2_3M38E (c r : ℤ) : ℤ := ((((((((6561*c + (52488*r + 96228))*c + ((183708*r + 673596)*r + 639090))*c + (((367416*r + 2020788)*r + 3772332)*r + 2393064))*c + ((((459270*r + 3367980)*r + 9290862)*r + 11597256)*r + 5501529))*c + (((((367416*r + 3367980)*r + 12221928)*r + 22541328)*r + 21261924)*r + 8100180))*c + ((((((183708*r + 2020788)*r + 9057582)*r + 21971088)*r + 31027158)*r + 24020028)*r + 7794324))*c + (((((((52488*r + 673596)*r + 3585708)*r + 10741896)*r + 20200932)*r + 23319036)*r + 14829480)*r + 3964896))*c + ((((((((6561*r + 96228)*r + 592434)*r + 2107944)*r + 4943385)*r + 7454484)*r + 6901524)*r + 3545568)*r + 774720))

theorem small_gap0_2_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 3*smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 5≤(smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 4)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 4)^2-smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 3*smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) 5=smallGap0_2_3M38E c r := by
  unfold smallValue0_2M38E smallGap0_2_3M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_2_3M38E
 positivity

theorem small_lc0_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :
 smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) j*smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) (j+2)≤(smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) (j+1))^2 := by
 by_cases hj : j≤3
 · interval_cases j
   · exact small_gap0_2_0M38E c r hc hr
   · exact small_gap0_2_1M38E c r hc hr
   · exact small_gap0_2_2M38E c r hc hr
   · exact small_gap0_2_3M38E c r hc hr
 · have hv : smallValue0_2M38E (5+3*c+2*r) (2+1*c+1*r) (j+2)=0 := by
    unfold smallValue0_2M38E
    split <;> omega
   rw [hv,mul_zero]
   exact sq_nonneg _

theorem source_small_lc0_2M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a)
 (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 0 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 0 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 0 true++false::rest)).mid.p (i+2) j≤coeff (frame (List.replicate 0 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-2*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 3*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+3*x+2*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 2+1*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := small_lc0_2M38E x y hx hy j
 rw [ec,er] at h
 have h0 := source_small_coeff0_2M38E rest hc hl hu (i+2) j (by omega)
 have h1 := source_small_coeff0_2M38E rest hc hl hu (i+1) (j+1) (by omega)
 have h2 := source_small_coeff0_2M38E rest hc hl hu i (j+2) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
