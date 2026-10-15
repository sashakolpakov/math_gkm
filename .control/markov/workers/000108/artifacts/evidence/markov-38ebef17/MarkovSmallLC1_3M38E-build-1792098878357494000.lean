import MarkovSmallQuot1_3M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallGap1_3_0M38E (c r : ℤ) : ℤ := ((((((((11406250*c + (147187500*r + 193237500))*c + ((830956250*r + 2181356250)*r + 1428755000))*c + (((2680700000*r + 10553186250)*r + 13820973250)*r + 6021877500))*c + ((((5405040000*r + 28363938000)*r + 55706389550)*r + 48531060750)*r + 15824963750))*c + (((((6974771200*r + 45740294400)*r + 119747587520)*r + 156445513950)*r + 102001487850)*r + 26552419080))*c + ((((((5625241600*r + 44256872448)*r + 144793009408)*r + 252157476240)*r + 246544980120)*r + 128325874008)*r + 27779987320))*c + (((((((2592473088*r + 23789641728)*r + 93373485056)*r + 203210394240)*r + 264848715776)*r + 206726992728)*r + 89482134536)*r + 16570120320))*c + ((((((((522715136*r + 5480448000)*r + 25089073152)*r + 65505119232)*r + 106690407936)*r + 111007659456)*r + 72056710432)*r + 26680047840)*r + 4314384000))

theorem small_gap1_3_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 0*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 2≤(smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 1)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 1)^2-smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 0*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 2=smallGap1_3_0M38E c r := by
  unfold smallValue1_3M38E smallGap1_3_0M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_3_0M38E
 positivity

def smallGap1_3_1M38E (c r : ℤ) : ℤ := ((((((((86012500*c + (1126030000*r + 1476792000))*c + ((6448987000*r + 16893828600)*r + 11043056200))*c + (((21104202800*r + 82818899160)*r + 108141311240)*r + 46983680880))*c + ((((43161777620*r + 225541909992)*r + 441214933052)*r + 382951755048)*r + 124427070964))*c + (((((56491303040*r + 368506212552)*r + 960008036624)*r + 1248443256864)*r + 810431259912)*r + 210086987376))*c + ((((((46207757824*r + 361228281792)*r + 1174868738852)*r + 2034845191464)*r + 1979328888004)*r + 1025213480832)*r + 220903230096))*c + (((((((21596348416*r + 196704339456)*r + 766778241344)*r + 1658180723232)*r + 2148357770832)*r + 1667552415888)*r + 717984363360)*r + 132281665920))*c + ((((((((4415635456*r + 45902548992)*r + 208500044032)*r + 540456026880)*r + 874371677488)*r + 904055135232)*r + 583366526544)*r + 214785601920)*r + 34545542400))

theorem small_gap1_3_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 1*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 3≤(smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 2)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 2)^2-smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 1*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 3=smallGap1_3_1M38E c r := by
  unfold smallValue1_3M38E smallGap1_3_1M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_3_1M38E
 positivity

def smallGap1_3_2M38E (c r : ℤ) : ℤ := ((((((((242270250*c + (3237543300*r + 4239768180))*c + ((18923030790*r + 49416561798)*r + 32212689336))*c + (((63184215960*r + 246779645046)*r + 320858065638)*r + 138851669196))*c + ((((131821697430*r + 684475018476)*r + 1331308478220)*r + 1149385451862)*r + 371594201142))*c + (((((175964597892*r + 1138785503424)*r + 2945340108372)*r + 3804884080002)*r + 2454664949454)*r + 632584866912))*c + ((((((146765438202*r + 1136483732670)*r + 3664445826312)*r + 6296361799854)*r + 6079369350198)*r + 3126991204236)*r + 669312721224))*c + (((((((69930145824*r + 629939268534)*r + 2430942809334)*r + 5208489141354)*r + 6690449784786)*r + 5151517495176)*r + 2201234657328)*r + 402617650752))*c + ((((((((14573490816*r + 149604625008)*r + 671778444036)*r + 1723054395972)*r + 2760562515828)*r + 2828430083724)*r + 1809568004040)*r + 660859871616)*r + 105466803840))

theorem small_gap1_3_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 2*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 4≤(smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 3)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 3)^2-smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 2*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 4=smallGap1_3_2M38E c r := by
  unfold smallValue1_3M38E smallGap1_3_2M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_3_2M38E
 positivity

def smallGap1_3_3M38E (c r : ℤ) : ℤ := ((((((((291301281*c + (3996816696*r + 5239844892))*c + ((23977016892*r + 62546613372)*r + 40722304698))*c + (((82143243720*r + 319793607468)*r + 414493450020)*r + 178788341952))*c + ((((175778355366*r + 907870819212)*r + 1757009784006)*r + 1509442724448)*r + 485530329969))*c + (((((240590736648*r + 1545588098388)*r + 3970222952184)*r + 5095154951136)*r + 3265573937724)*r + 835970938596))*c + ((((((205691179644*r + 1577910029940)*r + 5043902070438)*r + 8595563081760)*r + 8232951325734)*r + 4200988253940)*r + 891992348820))*c + (((((((100429423992*r + 894476667492)*r + 3415927407012)*r + 7247200521312)*r + 9221328060732)*r + 7034440799340)*r + 2978151409944)*r + 539728867296))*c + ((((((((21440470401*r + 217196631684)*r + 963460380186)*r + 2443081933440)*r + 3871594477809)*r + 3924897483708)*r + 2485017989460)*r + 898237371168)*r + 141900807744))

theorem small_gap1_3_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 3*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 5≤(smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 4)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 4)^2-smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 3*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 5=smallGap1_3_3M38E c r := by
  unfold smallValue1_3M38E smallGap1_3_3M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_3_3M38E
 positivity

def smallGap1_3_4M38E (c r : ℤ) : ℤ := ((((((((155052960*c + (2196070080*r + 2903704608))*c + ((13594702560*r + 35667672384)*r + 23323133664))*c + (((48043980288*r + 187621624032)*r + 243711556608)*r + 105206198112))*c + ((((106017262560*r + 547874092416)*r + 1060368365088)*r + 910060546464)*r + 292036060992))*c + (((((149584651200*r + 959162373600)*r + 2458872425472)*r + 3146804259456)*r + 2008864089408)*r + 511513898496))*c + ((((((131787720480*r + 1006739994432)*r + 3205056316704)*r + 5436868342272)*r + 5178536774112)*r + 2624462009184)*r + 552747207744))*c + (((((((66286773120*r + 586588090656)*r + 2226541289472)*r + 4693613913888)*r + 5929177190784)*r + 4485604759680)*r + 1881118976832)*r + 337329410688))*c + ((((((((14573490816*r + 146364793344)*r + 644036883168)*r + 1619704327008)*r + 2544068916768)*r + 2553899548704)*r + 1599506792064)*r + 571340433024)*r + 89124309504))

theorem small_gap1_3_4M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 4*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 6≤(smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 5)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 5)^2-smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 4*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 6=smallGap1_3_4M38E c r := by
  unfold smallValue1_3M38E smallGap1_3_4M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_3_4M38E
 positivity

def smallGap1_3_5M38E (c r : ℤ) : ℤ := ((((((((35230720*c + (517591040*r + 699475968))*c + ((3323090944*r + 8886339840)*r + 5902058752))*c + (((12177829888*r + 48347503872)*r + 63680262400)*r + 27787370496))*c + ((((27860341760*r + 146020715520)*r + 286098060032)*r + 247891005696)*r + 80049757696))*c + (((((40746557440*r + 264395036160)*r + 685042321408)*r + 883827017472)*r + 566925795072)*r + 144512749056))*c + ((((((37203435520*r + 286997009664)*r + 921963619328)*r + 1574214311424)*r + 1504103172352)*r + 761735400192)*r + 159687569664))*c + (((((((19388530688*r + 172922393856)*r + 661243404544)*r + 1400682084864)*r + 1771742779392)*r + 1336944648960)*r + 557034566400)*r + 98865271296))*c + ((((((((4415635456*r + 44612888064)*r + 197439574528)*r + 498052792320)*r + 781824577024)*r + 781335573504)*r + 485290192896)*r + 171277899264)*r + 26311532544))

theorem small_gap1_3_5M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 5*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 7≤(smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 6)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 6)^2-smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 5*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 7=smallGap1_3_5M38E c r := by
  unfold smallValue1_3M38E smallGap1_3_5M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_3_5M38E
 positivity

def smallGap1_3_6M38E (c r : ℤ) : ℤ := ((((((((2990080*c + (45760512*r + 64413696))*c + ((306126848*r + 852578304)*r + 585939968))*c + (((1169195008*r + 4834234368)*r + 6596710400)*r + 2968246272))*c + ((((2788392960*r + 15220936704)*r + 30946988288)*r + 27704176128)*r + 9204677888))*c + (((((4251975680*r + 28739309568)*r + 77415783424)*r + 103322899968)*r + 68136907776)*r + 17739096576))*c + ((((((4048420864*r + 32539336704)*r + 108891128320)*r + 192444873216)*r + 188755458816)*r + 97312806912)*r + 20592986368))*c + (((((((2200436736*r + 20454555648)*r + 81640139776)*r + 178988235264)*r + 231921711616)*r + 177507706368)*r + 74327429632)*r + 13138446336))*c + ((((((((522715136*r + 5506695168)*r + 25484982528)*r + 66496548864)*r + 106639870464)*r + 107666202624)*r + 66901669120)*r + 23411619840)*r + 3534520320))

theorem small_gap1_3_6M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 6*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 8≤(smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 7)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 7)^2-smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 6*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 8=smallGap1_3_6M38E c r := by
  unfold smallValue1_3M38E smallGap1_3_6M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_3_6M38E
 positivity

def smallGap1_3_7M38E (c r : ℤ) : ℤ := ((((((((65536*c + (1048576*r + 1572864))*c + ((7340032*r + 22020096)*r + 16138240))*c + (((29360128*r + 132120576)*r + 194150400)*r + 93585408))*c + ((((73400320*r + 440401920)*r + 980054016)*r + 958371840)*r + 348285952))*c + (((((117440512*r + 880803840)*r + 2651152384)*r + 3924424704)*r + 2838619136)*r + 802255872))*c + ((((((117440512*r + 1056964608)*r + 4045467648)*r + 8018061312)*r + 8610743808)*r + 4768355328)*r + 1066473984))*c + (((((((67108864*r + 704643072)*r + 3296280576)*r + 8163588096)*r + 11521120256)*r + 9353559552)*r + 4075063296)*r + 736946688))*c + ((((((((16777216*r + 201326592)*r + 1119010816)*r + 3311112192)*r + 5738430976)*r + 6060329472)*r + 3852762624)*r + 1355638272)*r + 202346496))

theorem small_gap1_3_7M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 7*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 9≤(smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 8)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 8)^2-smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 7*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 9=smallGap1_3_7M38E c r := by
  unfold smallValue1_3M38E smallGap1_3_7M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_3_7M38E
 positivity

def smallGap1_3_8M38E (c r : ℤ) : ℤ := ((((((540672*r + 1671168)*r + 1277952)*c + (((4325376*r + 15728640)*r + 19070976)*r + 7815168))*c + ((((12976128*r + 53600256)*r + 84523008)*r + 60665856)*r + 16656384))*c + (((((17301504*r + 79355904)*r + 149803008)*r + 145360896)*r + 72413184)*r + 14727168))*c + ((((((8650752*r + 43401216)*r + 93984768)*r + 111667200)*r + 76606464)*r + 28717056)*r + 4580352))

theorem small_gap1_3_8M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 8*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 10≤(smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 9)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 9)^2-smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 8*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) 10=smallGap1_3_8M38E c r := by
  unfold smallValue1_3M38E smallGap1_3_8M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_3_8M38E
 positivity

theorem small_lc1_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :
 smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) j*smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) (j+2)≤(smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) (j+1))^2 := by
 by_cases hj : j≤8
 · interval_cases j
   · exact small_gap1_3_0M38E c r hc hr
   · exact small_gap1_3_1M38E c r hc hr
   · exact small_gap1_3_2M38E c r hc hr
   · exact small_gap1_3_3M38E c r hc hr
   · exact small_gap1_3_4M38E c r hc hr
   · exact small_gap1_3_5M38E c r hc hr
   · exact small_gap1_3_6M38E c r hc hr
   · exact small_gap1_3_7M38E c r hc hr
   · exact small_gap1_3_8M38E c r hc hr
 · have hv : smallValue1_3M38E (5+2*c+3*r) (3+1*c+2*r) (j+2)=0 := by
    unfold smallValue1_3M38E
    split <;> omega
   rw [hv,mul_zero]
   exact sq_nonneg _

theorem source_small_lc1_3M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 1 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 1 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+2) j≤coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let x : ℤ := 2*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 2*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+2*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 3+1*x+2*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := small_lc1_3M38E x y hx hy j
 rw [ec,er] at h
 have h0 := source_small_coeff1_3M38E rest hc hl hu (i+2) j (by omega)
 have h1 := source_small_coeff1_3M38E rest hc hl hu (i+1) (j+1) (by omega)
 have h2 := source_small_coeff1_3M38E rest hc hl hu i (j+2) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
