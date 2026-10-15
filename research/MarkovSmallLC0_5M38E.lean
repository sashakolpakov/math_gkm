import MarkovSmallQuot0_5M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallGap0_5_0M38E (c r : ℤ) : ℤ := ((((((((95295690*c + (226894500*r + 723642192))*c + ((236186370*r + 1501580598)*r + 2389965004))*c + (((140396760*r + 1334553318)*r + 4235398986)*r + 4485295752))*c + ((((52126200*r + 658562940)*r + 3125804178)*r + 6602261274)*r + 5232989986))*c + (((((12378240*r + 194878320)*r + 1229731552)*r + 3885653562)*r + 6144254858)*r + 3887325288))*c + ((((((1836000*r + 34581312)*r + 272000688)*r + 1142932692)*r + 2704330260)*r + 3414258864)*r + 1795761928))*c + (((((((155520*r + 3407328)*r + 32071776)*r + 168022584)*r + 528825080)*r + 999279240)*r + 1049043208)*r + 471686016))*c + ((((((((5760*r + 143808)*r + 1574944)*r + 9876432)*r + 38765392)*r + 97459824)*r + 153167440)*r + 137489856)*r + 53936640))

theorem small_gap0_5_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 0*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 2≤(smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 1)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 1)^2-smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 0*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 2=smallGap0_5_0M38E c r := by
  unfold smallValue0_5M38E smallGap0_5_0M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_5_0M38E
 positivity

def smallGap0_5_1M38E (c r : ℤ) : ℤ := ((((((((315059220*c + (780146640*r + 2498395536))*c + ((844444440*r + 5378510088)*r + 8618065512))*c + (((521866800*r + 4958669016)*r + 15810061176)*r + 16882727904))*c + ((((201400020*r + 2537880552)*r + 12076606764)*r + 25670527224)*r + 20529244596))*c + (((((49701600*r + 778755096)*r + 4916429520)*r + 15602331984)*r + 24844709400)*r + 15854928528))*c + ((((((7659360*r + 143268912)*r + 1125042660)*r + 4738221720)*r + 11267600436)*r + 14321324352)*r + 7590058704))*c + (((((((673920*r + 14631840)*r + 137207088)*r + 718971744)*r + 2269623264)*r + 4309200144)*r + 4549852512)*r + 2058413568))*c + ((((((((25920*r + 639936)*r + 6967248)*r + 43608288)*r + 171323616)*r + 431926176)*r + 681438672)*r + 614360064)*r + 242095104))

theorem small_gap0_5_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 1*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 3≤(smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 2)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 2)^2-smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 1*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 3=smallGap0_5_1M38E c r := by
  unfold smallValue0_5M38E smallGap0_5_1M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_5_1M38E
 positivity

def smallGap0_5_2M38E (c r : ℤ) : ℤ := ((((((((260406090*c + (669615660*r + 2245156704))*c + ((752874750*r + 5021592570)*r + 8471090844))*c + (((483414480*r + 4811039874)*r + 16158648582)*r + 18152072136))*c + ((((193877550*r + 2559368664)*r + 12835319184)*r + 28697181930)*r + 24007687218))*c + (((((49732380*r + 816462180)*r + 5434224372)*r + 18132661818)*r + 30168523854)*r + 19973056536))*c + ((((((7967970*r + 156184362)*r + 1293319332)*r + 5723907534)*r + 14202193662)*r + 18690233868)*r + 10185334056))*c + (((((((729000*r + 16588314)*r + 164048598)*r + 902655558)*r + 2968494354)*r + 5823523872)*r + 6307997040)*r + 2911118976))*c + ((((((((29160*r + 754596)*r + 8663904)*r + 56889216)*r + 232437168)*r + 604163196)*r + 975558888)*r + 895165056)*r + 357594624))

theorem small_gap0_5_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 2*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 4≤(smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 3)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 3)^2-smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 2*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 4=smallGap0_5_2M38E c r := by
  unfold smallValue0_5M38E smallGap0_5_2M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_5_2M38E
 positivity

def smallGap0_5_3M38E (c r : ℤ) : ℤ := ((((((((43046721*c + (114791256*r + 440033148))*c + ((133923132*r + 1026744012)*r + 2057455242))*c + (((89282088*r + 1026744012)*r + 4132079892)*r + 5416707888))*c + ((((37200870*r + 570413340)*r + 3457847718)*r + 9048214800)*r + 8522619633))*c + (((((9920232*r + 190137780)*r + 1543076568)*r + 6041235168)*r + 11296815084)*r + 8134491636))*c + ((((((1653372*r + 38027556)*r + 387241398)*r + 2015032608)*r + 5607833526)*r + 7999015860)*r + 4615148772))*c + (((((((157464*r + 4225284)*r + 51810516)*r + 335730672)*r + 1235505420)*r + 2617185276)*r + 2991152664)*r + 1434313152))*c + ((((((((6561*r + 201204)*r + 2887002)*r + 22351824)*r + 101930337)*r + 284920668)*r + 483485508)*r + 459761472)*r + 188616960))

theorem small_gap0_5_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 3*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 5≤(smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 4)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 4)^2-smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 3*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 5=smallGap0_5_3M38E c r := by
  unfold smallValue0_5M38E smallGap0_5_3M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_5_3M38E
 positivity

def smallGap0_5_4M38E (c r : ℤ) : ℤ := ((((((49758624*c + (114213888*r + 297590112))*c + ((108965088*r + 553973472)*r + 720132768))*c + (((55240704*r + 411310656)*r + 1047615552)*r + 907968672))*c + ((((15684192*r + 152207424)*r + 570187584)*r + 971657568)*r + 632037312))*c + (((((2363904*r + 28070496)*r + 137600064)*r + 345244896)*r + 441236736)*r + 228902400))*c + ((((((147744*r + 2064096)*r + 12424608)*r + 40767264)*r + 76601664)*r + 77999616)*r + 33546240))

theorem small_gap0_5_4M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 4*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 6≤(smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 5)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 5)^2-smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 4*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 6=smallGap0_5_4M38E c r := by
  unfold smallValue0_5M38E smallGap0_5_4M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_5_4M38E
 positivity

def smallGap0_5_5M38E (c r : ℤ) : ℤ := ((((2663424*c + (5520384*r + 12100608))*c + ((4382208*r + 17114112)*r + 18049536))*c + (((1511424*r + 7865856)*r + 14358528)*r + 9552384))*c + ((((188928*r + 1184256)*r + 2907648)*r + 3350016)*r + 1585152))

theorem small_gap0_5_5M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 5*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 7≤(smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 6)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 6)^2-smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 5*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) 7=smallGap0_5_5M38E c r := by
  unfold smallValue0_5M38E smallGap0_5_5M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_5_5M38E
 positivity

theorem small_lc0_5M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :
 smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) j*smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) (j+2)≤(smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) (j+1))^2 := by
 by_cases hj : j≤5
 · interval_cases j
   · exact small_gap0_5_0M38E c r hc hr
   · exact small_gap0_5_1M38E c r hc hr
   · exact small_gap0_5_2M38E c r hc hr
   · exact small_gap0_5_3M38E c r hc hr
   · exact small_gap0_5_4M38E c r hc hr
   · exact small_gap0_5_5M38E c r hc hr
 · have hv : smallValue0_5M38E (5+4*c+1*r) (4+3*c+1*r) (j+2)=0 := by
    unfold smallValue0_5M38E
    split <;> omega
   rw [hv,mul_zero]
   exact sq_nonneg _

theorem source_small_lc0_5M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 0 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 0 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 0 true++false::rest)).mid.p (i+2) j≤coeff (frame (List.replicate 0 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+4*x+1*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 4+3*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := small_lc0_5M38E x y hx hy j
 rw [ec,er] at h
 have h0 := source_small_coeff0_5M38E rest hc hl hu (i+2) j (by omega)
 have h1 := source_small_coeff0_5M38E rest hc hl hu (i+1) (j+1) (by omega)
 have h2 := source_small_coeff0_5M38E rest hc hl hu i (j+2) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
