import MarkovSmallQuot0_4M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallGap0_4_0M38E (c r : ℤ) : ℤ := ((((((((5625000*c + (64125000*r + 87487500))*c + ((319781250*r + 871593750)*r + 593342500))*c + (((911137500*r + 3720948750)*r + 5060811750)*r + 2292163500))*c + ((((1622328750*r + 8824084500)*r + 17983627800)*r + 16274569950)*r + 5517459700))*c + (((((1848495600*r + 12554123400)*r + 34079041780)*r + 46215976530)*r + 31308263210)*r + 8474890920))*c + ((((((1316204190*r + 10715304222)*r + 36322418748)*r + 65615125254)*r + 66615210702)*r + 36034181028)*r + 8112813856))*c + (((((((535471020*r + 5080434366)*r + 20645063670)*r + 46574211978)*r + 62989639958)*r + 51067140096)*r + 22976919808)*r + 4425552384))*c + ((((((((95295690*r + 1032218712)*r + 4888800952)*r + 13222308372)*r + 22333684030)*r + 24122102004)*r + 16267601632)*r + 6262074624)*r + 1053333504))

theorem small_gap0_4_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 0*smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 2≤(smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 1)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 1)^2-smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 0*smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 2=smallGap0_4_0M38E c r := by
  unfold smallValue0_4M38E smallGap0_4_0M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_4_0M38E
 positivity

def smallGap0_4_1M38E (c r : ℤ) : ℤ := ((((((((16200000*c + (187920000*r + 261432000))*c + ((953532000*r + 2647706400)*r + 1838274000))*c + (((2764303200*r + 11490532560)*r + 15926094000)*r + 7356925440))*c + ((((5007745620*r + 27699614568)*r + 57482949780)*r + 53017392336)*r + 18328501680))*c + (((((5805036720*r + 40058438328)*r + 110639223888)*r + 152807792328)*r + 105486494400)*r + 29104580352))*c + ((((((4205076120*r + 34753678344)*r + 119768586732)*r + 220184842608)*r + 227638013220)*r + 125427720864)*r + 28763811456))*c + (((((((1740327120*r + 16748273304)*r + 69137922168)*r + 158614830408)*r + 218301508632)*r + 180157496640)*r + 82513551744)*r + 16173864960))*c + ((((((((315059220*r + 3458576016)*r + 16627197048)*r + 45698749488)*r + 78495779988)*r + 86245753632)*r + 59168872704)*r + 23165101056)*r + 3961331712))

theorem small_gap0_4_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 1*smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 3≤(smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 2)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 2)^2-smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 1*smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 3=smallGap0_4_1M38E c r := by
  unfold smallValue0_4M38E smallGap0_4_1M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_4_1M38E
 positivity

def smallGap0_4_2M38E (c r : ℤ) : ℤ := ((((((((11664000*c + (137635200*r + 200335680))*c + ((710454240*r + 2063856672)*r + 1502385120))*c + (((2095320960*r + 9111279168)*r + 13241799648)*r + 6417281520))*c + ((((3861804600*r + 22344010704)*r + 48624744528)*r + 47050874856)*r + 17047082592))*c + (((((4554646200*r + 32873632596)*r + 95218385472)*r + 137972124108)*r + 99804697416)*r + 28789144272))*c + ((((((3356935650*r + 29016038538)*r + 104872082670)*r + 202269671838)*r + 219087886824)*r + 126160620768)*r + 30143024640))*c + (((((((1413633060*r + 14226815538)*r + 61595564346)*r + 148246591338)*r + 213716272194)*r + 184256403012)*r + 87876696384)*r + 17874130176))*c + ((((((((260406090*r + 2989174104)*r + 15072252912)*r + 43455220956)*r + 78166670022)*r + 89685996012)*r + 64035209952)*r + 25998094080)*r + 4594046976))

theorem small_gap0_4_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 2*smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 4≤(smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 3)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 3)^2-smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 2*smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 4=smallGap0_4_2M38E c r := by
  unfold smallValue0_4M38E smallGap0_4_2M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_4_2M38E
 positivity

def smallGap0_4_3M38E (c r : ℤ) : ℤ := ((((((((1679616*c + (20155392*r + 32472576))*c + ((105815808*r + 340962048)*r + 280361088))*c + (((317447424*r + 1534329216)*r + 2526235776)*r + 1387448064))*c + ((((595213920*r + 3835823040)*r + 9485141472)*r + 10421698176)*r + 4243115664))*c + (((((714256704*r + 5753734560)*r + 18994647744)*r + 31312368000)*r + 25466248800)*r + 8136444384))*c + ((((((535692528*r + 5178361104)*r + 21397057848)*r + 47038184640)*r + 57309386328)*r + 36535528944)*r + 9515271312))*c + (((((((229582512*r + 2589180552)*r + 12855320136)*r + 35329261392)*r + 57312016920)*r + 54673942824)*r + 28397033136)*r + 6201931392))*c + ((((((((43046721*r + 554824404)*r + 3218122386)*r + 10613305656)*r + 21489764265)*r + 27266157108)*r + 21180097476)*r + 9224312256)*r + 1727559936))

theorem small_gap0_4_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 3*smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 5≤(smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 4)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 4)^2-smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 3*smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 5=smallGap0_4_3M38E c r := by
  unfold smallValue0_4M38E smallGap0_4_3M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_4_3M38E
 positivity

def smallGap0_4_4M38E (c r : ℤ) : ℤ := ((((((2737152*c + (26625024*r + 34947072))*c + ((107993088*r + 279908352)*r + 181119744))*c + (((233653248*r + 896769792)*r + 1148115456)*r + 489480192))*c + ((((284275008*r + 1436137344)*r + 2728618560)*r + 2307308544)*r + 731517696))*c + (((((184337856*r + 1149387840)*r + 2881096128)*r + 3623001408)*r + 2281782528)*r + 574944768))*c + ((((((49758624*r + 367714080)*r + 1140237216)*r + 1895035104)*r + 1777203648)*r + 890323200)*r + 185886720))

theorem small_gap0_4_4M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 4*smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 6≤(smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 5)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 5)^2-smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 4*smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) 6=smallGap0_4_4M38E c r := by
  unfold smallValue0_4M38E smallGap0_4_4M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap0_4_4M38E
 positivity

theorem small_lc0_4M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :
 smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) j*smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) (j+2)≤(smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) (j+1))^2 := by
 by_cases hj : j≤4
 · interval_cases j
   · exact small_gap0_4_0M38E c r hc hr
   · exact small_gap0_4_1M38E c r hc hr
   · exact small_gap0_4_2M38E c r hc hr
   · exact small_gap0_4_3M38E c r hc hr
   · exact small_gap0_4_4M38E c r hc hr
 · have hv : smallValue0_4M38E (7+3*c+4*r) (5+2*c+3*r) (j+2)=0 := by
    unfold smallValue0_4M38E
    split <;> omega
   rw [hv,mul_zero]
   exact sq_nonneg _

theorem source_small_lc0_4M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 2*(frame rest).mid.b<3*(frame rest).mid.a)
 (hu : 4*(frame rest).mid.a<3*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 0 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 0 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 0 true++false::rest)).mid.p (i+2) j≤coeff (frame (List.replicate 0 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let x : ℤ := 3*((frame rest).mid.b:ℤ)-4*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 3*((frame rest).mid.a:ℤ)-2*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 7+3*x+4*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 5+2*x+3*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := small_lc0_4M38E x y hx hy j
 rw [ec,er] at h
 have h0 := source_small_coeff0_4M38E rest hc hl hu (i+2) j (by omega)
 have h1 := source_small_coeff0_4M38E rest hc hl hu (i+1) (j+1) (by omega)
 have h2 := source_small_coeff0_4M38E rest hc hl hu i (j+2) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
