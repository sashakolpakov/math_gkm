import MarkovSmallQuot1_0M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallGap1_0_0M38E (c r : ℤ) : ℤ := ((((((((5760*c + (211072*r + 199360))*c + ((3384288*r + 6391712)*r + 3011040))*c + (((31010688*r + 87829056)*r + 82719904)*r + 25909264))*c + ((((177613560*r + 670505040)*r + 946866768)*r + 592866248)*r + 138882336))*c + (((((651113640*r + 3071349900)*r + 5780441664)*r + 5426257332)*r + 2540852440)*r + 474802576))*c + ((((((1491932034*r + 8441448210)*r + 19849443822)*r + 24831041670)*r + 17430750984)*r + 6510532016)*r + 1010897184))*c + (((((((1953577116*r + 12889570014)*r + 36351741006)*r + 56811901662)*r + 53142584598)*r + 29755450212)*r + 9234448608)*r + 1225428480))*c + ((((((((1119214746*r + 8435031552)*r + 27738307116)*r + 51990326280)*r + 60753663954)*r + 45327637368)*r + 21087282024)*r + 5593011840)*r + 647539200))

theorem small_gap1_0_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 0*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 2≤(smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 1)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 1)^2-smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 0*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 2=smallGap1_0_0M38E c r := by
  unfold smallValue1_0M38E smallGap1_0_0M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_0_0M38E
 positivity

def smallGap1_0_1M38E (c r : ℤ) : ℤ := ((((((((25920*c + (984960*r + 950976))*c + ((16384864*r + 31587296)*r + 15197200))*c + (((155819808*r + 449619696)*r + 431481360)*r + 137649984))*c + ((((926434260*r + 3555036936)*r + 5102546740)*r + 3245697296)*r + 771792688))*c + (((((3525852240*r + 16861955976)*r + 32169208944)*r + 30598191096)*r + 14507461824)*r + 2742484800))*c + ((((((8387319960*r + 47975064264)*r + 114035332572)*r + 144161769168)*r + 102213686644)*r + 38533187840)*r + 6033571264))*c + (((((((11400708528*r + 75809730600)*r + 215503859880)*r + 339447144744)*r + 319921509480)*r + 180391879920)*r + 56341580544)*r + 7518855168))*c + ((((((((6779061396*r + 51323501232)*r + 169618453704)*r + 319560676416)*r + 375328965204)*r + 281380877712)*r + 131479636176)*r + 35007333120)*r + 4066329600))

theorem small_gap1_0_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 1*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 3≤(smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 2)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 2)^2-smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 1*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 3=smallGap1_0_1M38E c r := by
  unfold smallValue1_0M38E smallGap1_0_1M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_0_1M38E
 positivity

def smallGap1_0_2M38E (c r : ℤ) : ℤ := ((((((((29160*c + (1189080*r + 1214676))*c + ((21273570*r + 43337358)*r + 22107348))*c + (((217773348*r + 661408674)*r + 668467170)*r + 224124444))*c + ((((1393543710*r + 5596066236)*r + 8398654284)*r + 5573508330)*r + 1377892884))*c + (((((5703145200*r + 28343932632)*r + 56128385004)*r + 55302731862)*r + 27084574902)*r + 5270746800))*c + ((((((14568532830*r + 85934175750)*r + 210460182516)*r + 273725663046)*r + 199247231922)*r + 76913081520)*r + 12295693968))*c + (((((((21228377940*r + 144398338578)*r + 419850952290)*r + 675915433830)*r + 650220686322)*r + 373534988712)*r + 118602094776)*r + 16052738496))*c + ((((((((13505332986*r + 103739907600)*r + 348172201116)*r + 666222226344)*r + 794301253218)*r + 603808072200)*r + 285657040584)*r + 76874166144)*r + 9009252864))

theorem small_gap1_0_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 2*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 4≤(smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 3)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 3)^2-smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 2*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 4=smallGap1_0_2M38E c r := by
  unfold smallValue1_0M38E smallGap1_0_2M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_0_2M38E
 positivity

def smallGap1_0_3M38E (c r : ℤ) : ℤ := ((((((((6561*c + (309096*r + 352836))*c + ((6513372*r + 15031980)*r + 8833698))*c + (((78741720*r + 269130708)*r + 306189468)*r + 114449112))*c + ((((591504966*r + 2630984220)*r + 4349901582)*r + 3152384568)*r + 842466393))*c + (((((2814504408*r + 15198378444)*r + 32504974920)*r + 34351962192)*r + 17910541332)*r + 3682182564))*c + ((((((8270317404*r + 51972252804)*r + 135014602590)*r + 185390838864)*r + 141738711174)*r + 57153244572)*r + 9490630500))*c + (((((((13718852712*r + 97560896796)*r + 296016387804)*r + 496079788248)*r + 495252942516)*r + 294203736972)*r + 96213913704)*r + 13356571968))*c + ((((((((9840456801*r + 77654400948)*r + 267965170866)*r + 527035607928)*r + 645104254185)*r + 502499964564)*r + 242990715204)*r + 66643154496)*r + 7933872384))

theorem small_gap1_0_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 3*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 5≤(smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 4)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 4)^2-smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 3*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 5=smallGap1_0_3M38E c r := by
  unfold smallValue1_0M38E smallGap1_0_3M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_0_3M38E
 positivity

def smallGap1_0_4M38E (c r : ℤ) : ℤ := ((((((((116640*r + 513216)*r + 544320)*c + (((3706560*r + 18820512)*r + 29574720)*r + 14160960))*c + ((((49373280*r + 283961952)*r + 579510144)*r + 500118048)*r + 155234880))*c + (((((351676032*r + 2252409408)*r + 5566293120)*r + 6668503200)*r + 3884835456)*r + 882025920))*c + ((((((1409281632*r + 9906767232)*r + 28411071552)*r + 42638288928)*r + 35343393120)*r + 15341546400)*r + 2722055040))*c + (((((((3007606464*r + 22926406176)*r + 74182904640)*r + 132030440352)*r + 139482010944)*r + 87361310016)*r + 29988870336)*r + 4343800320))*c + ((((((((2667720096*r + 21833004384)*r + 78146260992)*r + 159438603840)*r + 202406292000)*r + 163388812896)*r + 81724889664)*r + 23102902272)*r + 2819174400))

theorem small_gap1_0_4M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 4*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 6≤(smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 5)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 5)^2-smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 4*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 6=smallGap1_0_4M38E c r := by
  unfold smallValue1_0M38E smallGap1_0_4M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_0_4M38E
 positivity

def smallGap1_0_5M38E (c r : ℤ) : ℤ := ((((((((414720*r + 2985984)*r + 8087040)*r + 9732096)*r + 4405248)*c + (((((8294400*r + 62244864)*r + 184719360)*r + 269498880)*r + 192602112)*r + 53544960))*c + ((((((62470144*r + 487741440)*r + 1569126400)*r + 2656937472)*r + 2494508032)*r + 1227902976)*r + 245901312))*c + (((((((209719296*r + 1699305472)*r + 5869117440)*r + 11201562112)*r + 12750280704)*r + 8634984448)*r + 3205933056)*r + 499783680))*c + ((((((((264508416*r + 2218014720)*r + 8153913856)*r + 17178327552)*r + 22659389440)*r + 19111286784)*r + 10020852736)*r + 2967877632)*r + 377487360))

theorem small_gap1_0_5M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 5*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 7≤(smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 6)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 6)^2-smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 5*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 7=smallGap1_0_5M38E c r := by
  unfold smallValue1_0M38E smallGap1_0_5M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_0_5M38E
 positivity

def smallGap1_0_6M38E (c r : ℤ) : ℤ := ((((((((368640*r + 3096576)*r + 11046912)*r + 21331968)*r + 23467008)*r + 13946880)*r + 3502080)*c + (((((((3555328*r + 29777920)*r + 108224512)*r + 220426240)*r + 271255552)*r + 201674752)*r + 84013056)*r + 15187968))*c + ((((((((8626176*r + 72065024)*r + 266219520)*r + 566546432)*r + 759161856)*r + 656273408)*r + 358133760)*r + 113209344)*r + 15962112))

theorem small_gap1_0_6M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 6*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 8≤(smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 7)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 7)^2-smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 6*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) 8=smallGap1_0_6M38E c r := by
  unfold smallValue1_0M38E smallGap1_0_6M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_0_6M38E
 positivity

theorem small_lc1_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :
 smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) j*smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) (j+2)≤(smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) (j+1))^2 := by
 by_cases hj : j≤6
 · interval_cases j
   · exact small_gap1_0_0M38E c r hc hr
   · exact small_gap1_0_1M38E c r hc hr
   · exact small_gap1_0_2M38E c r hc hr
   · exact small_gap1_0_3M38E c r hc hr
   · exact small_gap1_0_4M38E c r hc hr
   · exact small_gap1_0_5M38E c r hc hr
   · exact small_gap1_0_6M38E c r hc hr
 · have hv : smallValue1_0M38E (5+1*c+4*r) (1+0*c+1*r) (j+2)=0 := by
    unfold smallValue1_0M38E
    split <;> omega
   rw [hv,mul_zero]
   exact sq_nonneg _

theorem source_small_lc1_0M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a)
 (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 1 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 1 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+2) j≤coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-4*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 1*((frame rest).mid.a:ℤ)-0*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+1*x+4*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 1+0*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := small_lc1_0M38E x y hx hy j
 rw [ec,er] at h
 have h0 := source_small_coeff1_0M38E rest hc hl hu (i+2) j (by omega)
 have h1 := source_small_coeff1_0M38E rest hc hl hu (i+1) (j+1) (by omega)
 have h2 := source_small_coeff1_0M38E rest hc hl hu i (j+2) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
