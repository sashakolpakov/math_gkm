import MarkovSmallQuot1_2M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallGap1_2_0M38E (c r : ℤ) : ℤ := ((((((((156237872*c + (901124112*r + 1707994568))*c + ((2273867050*r + 8617568358)*r + 8147274884))*c + (((3278771300*r + 18633994302)*r + 35224435078)*r + 22149034292))*c + ((((2954883750*r + 22384846400)*r + 63454301848)*r + 79776902842)*r + 37535557220))*c + (((((1704325000*r + 16134394500)*r + 60963969780)*r + 114935436294)*r + 108123901970)*r + 40605985028))*c + ((((((614393750*r + 6977523750)*r + 32946110300)*r + 82793266930)*r + 116795139942)*r + 87698750216)*r + 27384901224))*c + (((((((126562500*r + 1676393750)*r + 9495761750)*r + 29819493950)*r + 56070987310)*r + 63134619428)*r + 39417140400)*r + 10526971008))*c + ((((((((11406250*r + 172612500)*r + 1140355000)*r + 4295953500)*r + 10094288950)*r + 15149995920)*r + 14183736936)*r + 7573720704)*r + 1766029824))

theorem small_gap1_2_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 0*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 2≤(smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 1)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 1)^2-smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 0*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 2=smallGap1_2_0M38E c r := by
  unfold smallValue1_2M38E smallGap1_2_0M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_2_0M38E
 positivity

def smallGap1_2_1M38E (c r : ℤ) : ℤ := ((((((((1025860864*c + (6021521408*r + 11413722880))*c + ((15462530944*r + 58523859520)*r + 55291142144))*c + (((22687806400*r + 128595205536)*r + 242613597856)*r + 152336774464))*c + ((((20804505620*r + 156966089608)*r + 443526707012)*r + 556186774464)*r + 261135202352))*c + (((((12208793200*r + 114947303368)*r + 432393468368)*r + 812178385448)*r + 761646664688)*r + 285248258368))*c + ((((((4477507000*r + 50501305560)*r + 237091896380)*r + 592935162080)*r + 832969908388)*r + 623163216944)*r + 193940357200))*c + (((((((938270000*r + 12325161400)*r + 69327973000)*r + 216415386696)*r + 404836123592)*r + 453752175584)*r + 282118459744)*r + 75053943552))*c + ((((((((86012500*r + 1289032000)*r + 8445869000)*r + 31592526640)*r + 73776404660)*r + 110122003888)*r + 102588280912)*r + 54528813312)*r + 12660249600))

theorem small_gap1_2_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 1*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 3≤(smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 2)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 2)^2-smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 1*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 3=smallGap1_2_1M38E c r := by
  unfold smallValue1_2M38E smallGap1_2_1M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_2_1M38E
 positivity

def smallGap1_2_2M38E (c r : ℤ) : ℤ := ((((((((2338226688*c + (14109924864*r + 26826739968))*c + ((37236702144*r + 141008369472)*r + 133461225600))*c + (((56131267968*r + 317512414848)*r + 598739913984)*r + 376163465472))*c + ((((52861513680*r + 397027270752)*r + 1118751457296)*r + 1400847597888)*r + 657291892224))*c + (((((31847272560*r + 297747765624)*r + 1114433006976)*r + 2085959547768)*r + 1951392612192)*r + 729517080864))*c + ((((((11986724490*r + 133920313242)*r + 624202845054)*r + 1552510677006)*r + 2171814806232)*r + 1619310791448)*r + 502517174496))*c + (((((((2576942700*r + 33449671242)*r + 186392235282)*r + 577537176486)*r + 1073943863370)*r + 1197797456256)*r + 741572993640)*r + 196527995328))*c + ((((((((242270250*r + 3579167580)*r + 23182105080)*r + 85908227244)*r + 199084489830)*r + 295254985176)*r + 273523052376)*r + 144654844416)*r + 33427044864))

theorem small_gap1_2_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 2*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 4≤(smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 3)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 3)^2-smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 2*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 4=smallGap1_2_2M38E c r := by
  unfold smallValue1_2M38E smallGap1_2_2M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_2_2M38E
 positivity

def smallGap1_2_3M38E (c r : ℤ) : ℤ := ((((((((2096391168*c + (13158678528*r + 25177688064))*c + ((36091607040*r + 137089999872)*r + 130337547264))*c + (((56499213312*r + 319532428800)*r + 603387818496)*r + 380056803840))*c + ((((55213465536*r + 413294997888)*r + 1162668144960)*r + 1455373162368)*r + 683296420608))*c + (((((34492241664*r + 320388854976)*r + 1193631557760)*r + 2227195460160)*r + 2079312614784)*r + 776349446400))*c + ((((((13451789088*r + 148860214560)*r + 688614905088)*r + 1702637913888)*r + 2370912439392)*r + 1761342481728)*r + 544943884608))*c + (((((((2994414048*r + 38384134704)*r + 211671490608)*r + 650245893984)*r + 1200584710224)*r + 1331119896624)*r + 819932971104)*r + 216307680768))*c + ((((((((291301281*r + 4237442244)*r + 27085053834)*r + 99248773392)*r + 227811304017)*r + 335108931084)*r + 308251153188)*r + 161996992704)*r + 37218081024))

theorem small_gap1_2_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 3*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 5≤(smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 4)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 4)^2-smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 3*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 5=smallGap1_2_3M38E c r := by
  unfold smallValue1_2M38E smallGap1_2_3M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_2_3M38E
 positivity

def smallGap1_2_4M38E (c r : ℤ) : ℤ := ((((((((763502592*c + (5043609600*r + 9741398016))*c + ((14542371840*r + 55604696064)*r + 53231096832))*c + (((23905658880*r + 135722443776)*r + 257278565376)*r + 162733160448))*c + ((((24506461440*r + 183642708480)*r + 517027858176)*r + 647796168192)*r + 304555325952))*c + (((((16043496192*r + 148774204032)*r + 553011846144)*r + 1029476446080)*r + 959222431488)*r + 357623876352))*c + ((((((6550576800*r + 72167054496)*r + 332059931136)*r + 816489419808)*r + 1130979560928)*r + 836266975680)*r + 257687492352))*c + (((((((1525200960*r + 19409248704)*r + 106136136192)*r + 323198927136)*r + 591681498240)*r + 650883005088)*r + 398126071488)*r + 104377990656))*c + ((((((((155052960*r + 2232835488)*r + 14108835744)*r + 51084863136)*r + 115893788352)*r + 168626240448)*r + 153589777152)*r + 80014782720)*r + 18240297984))

theorem small_gap1_2_4M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 4*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 6≤(smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 5)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 5)^2-smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 4*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 6=smallGap1_2_4M38E c r := by
  unfold smallValue1_2M38E smallGap1_2_4M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_2_4M38E
 positivity

def smallGap1_2_5M38E (c r : ℤ) : ℤ := ((((((((109379584*c + (767033344*r + 1498218496))*c + ((2346680320*r + 9073344512)*r + 8767029248))*c + (((4091002880*r + 23477133312)*r + 44837421056)*r + 28542484480))*c + ((((4444820480*r + 33644644352)*r + 95240133632)*r + 119729965056)*r + 56448754688))*c + (((((3081949184*r + 28841132032)*r + 107552819200)*r + 200261654528)*r + 186435260416)*r + 69431142400))*c + ((((((1331820544*r + 14789283840)*r + 68107467776)*r + 166962571264)*r + 230215644160)*r + 169404755968)*r + 51940234240))*c + (((((((327946240*r + 4200620032)*r + 22931999744)*r + 69390093312)*r + 125974276096)*r + 137380527104)*r + 83332668416)*r + 21660420096))*c + ((((((((35230720*r + 509831168)*r + 3207609344)*r + 11501447168)*r + 25775375360)*r + 37031011328)*r + 33327932416)*r + 17169435648)*r + 3869227008))

theorem small_gap1_2_5M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 5*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 7≤(smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 6)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 6)^2-smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 5*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 7=smallGap1_2_5M38E c r := by
  unfold smallValue1_2M38E smallGap1_2_5M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_2_5M38E
 positivity

def smallGap1_2_6M38E (c r : ℤ) : ℤ := ((((((((5439488*c + (40697856*r + 80445440))*c + ((132947968*r + 522018816)*r + 512417792))*c + (((247644160*r + 1448067072)*r + 2805678080)*r + 1812832256))*c + ((((287662080*r + 2225643520)*r + 6385020928)*r + 8117374976)*r + 3870371840))*c + (((((213352448*r + 2046689280)*r + 7728820224)*r + 14507569152)*r + 13607710720)*r + 5100855296))*c + ((((((98656256*r + 1125949440)*r + 5247097856)*r + 12930928640)*r + 17900562432)*r + 13226619904)*r + 4061110272))*c + (((((((26001408*r + 343064576)*r + 1893935104)*r + 5745815552)*r + 10434080768)*r + 11383675904)*r + 6901748736)*r + 1783001088))*c + ((((((((2990080*r + 44654592)*r + 283896832)*r + 1017913344)*r + 2272691200)*r + 3250612224)*r + 2911758336)*r + 1489047552)*r + 330485760))

theorem small_gap1_2_6M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 6*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 8≤(smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 7)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 7)^2-smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 6*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 8=smallGap1_2_6M38E c r := by
  unfold smallValue1_2M38E smallGap1_2_6M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_2_6M38E
 positivity

def smallGap1_2_7M38E (c r : ℤ) : ℤ := ((((((((65536*c + (524288*r + 1048576))*c + ((1835008*r + 7340032)*r + 7405568))*c + (((3670016*r + 22020096)*r + 43843584)*r + 29261824))*c + ((((4587520*r + 36700160)*r + 108281856)*r + 142008320)*r + 70049792))*c + (((((3670016*r + 36700160)*r + 142802944)*r + 276373504)*r + 268771328)*r + 104697856))*c + ((((((1835008*r + 22020096)*r + 106070016)*r + 269688832)*r + 388890624)*r + 302266368)*r + 97914880))*c + (((((((524288*r + 7340032)*r + 42074112)*r + 131981312)*r + 251076608)*r + 288595968)*r + 183535616)*r + 49440768))*c + ((((((((65536*r + 1048576)*r + 6963200)*r + 25919488)*r + 60990464)*r + 91432960)*r + 84726784)*r + 44224512)*r + 9934848))

theorem small_gap1_2_7M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 7*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 9≤(smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 8)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 8)^2-smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 7*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) 9=smallGap1_2_7M38E c r := by
  unfold smallValue1_2M38E smallGap1_2_7M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_2_7M38E
 positivity

theorem small_lc1_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :
 smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) j*smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) (j+2)≤(smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) (j+1))^2 := by
 by_cases hj : j≤7
 · interval_cases j
   · exact small_gap1_2_0M38E c r hc hr
   · exact small_gap1_2_1M38E c r hc hr
   · exact small_gap1_2_2M38E c r hc hr
   · exact small_gap1_2_3M38E c r hc hr
   · exact small_gap1_2_4M38E c r hc hr
   · exact small_gap1_2_5M38E c r hc hr
   · exact small_gap1_2_6M38E c r hc hr
   · exact small_gap1_2_7M38E c r hc hr
 · have hv : smallValue1_2M38E (5+3*c+2*r) (2+1*c+1*r) (j+2)=0 := by
    unfold smallValue1_2M38E
    split <;> omega
   rw [hv,mul_zero]
   exact sq_nonneg _

theorem source_small_lc1_2M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a)
 (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 1 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 1 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+2) j≤coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-2*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 3*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+3*x+2*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 2+1*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := small_lc1_2M38E x y hx hy j
 rw [ec,er] at h
 have h0 := source_small_coeff1_2M38E rest hc hl hu (i+2) j (by omega)
 have h1 := source_small_coeff1_2M38E rest hc hl hu (i+1) (j+1) (by omega)
 have h2 := source_small_coeff1_2M38E rest hc hl hu i (j+2) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
