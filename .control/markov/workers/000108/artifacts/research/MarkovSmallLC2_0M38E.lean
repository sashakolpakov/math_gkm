import MarkovSmallQuot2_0M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallGap2_0_0M38E (c r : ℤ) : ℤ := ((((((((227448*c + (7949016*r + 8266860))*c + ((121540338*r + 252742842)*r + 131212224))*c + (((1061908380*r + 3311591850)*r + 3437661222)*r + 1187888976))*c + ((((5798706030*r + 24105634020)*r + 37526329188)*r + 25928666838)*r + 6709264992))*c + (((((20265268608*r + 105280456320)*r + 218475732852)*r + 226380644694)*r + 117129563154)*r + 24209466084))*c + ((((((44264009166*r + 275882584770)*r + 715464601488)*r + 988241576634)*r + 766802775198)*r + 316910390832)*r + 54503167176))*c + (((((((55246913228*r + 401628266442)*r + 1249588564406)*r + 2157007313058)*r + 2231066836622)*r + 1382803605012)*r + 475534342896)*r + 69997472640))*c + ((((((((30167556250*r + 250578219840)*r + 909347395580)*r + 1883192489256)*r + 2434260146786)*r + 2011209282264)*r + 1037231979784)*r + 305291538240)*r + 39264451200))

theorem small_gap2_0_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 0*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 2≤(smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 1)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 1)^2-smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 0*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 2=smallGap2_0_0M38E c r := by
  unfold smallValue2_0M38E smallGap2_0_0M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap2_0_0M38E
 positivity

def smallGap2_0_1M38E (c r : ℤ) : ℤ := ((((((((2286144*c + (80621568*r + 83280960))*c + ((1243903392*r + 2568918240)*r + 1324559952))*c + (((10967120928*r + 33960934800)*r + 35007135120)*r + 12012906528))*c + ((((60434676180*r + 249423460056)*r + 385501289796)*r + 264462257664)*r + 67949799264))*c + (((((213140654064*r + 1099122980616)*r + 2264064844176)*r + 2328790880088)*r + 1196176952448)*r + 245468273760))*c + ((((((469820512408*r + 2906068757592)*r + 7479437582380)*r + 10253169633552)*r + 7896271966228)*r + 3239360593200)*r + 553068996048))*c + (((((((591785361232*r + 4268660764680)*r + 13177766033848)*r + 22570767469464)*r + 23166167389720)*r + 14249121462624)*r + 4863448110432)*r + 710617209984))*c + ((((((((326120579668*r + 2687191441168)*r + 9673797050216)*r + 19873973907424)*r + 25486212236852)*r + 20892078143632)*r + 10691389543696)*r + 3122930967168)*r + 398655048960))

theorem small_gap2_0_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 1*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 3≤(smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 2)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 2)^2-smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 1*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 3=smallGap2_0_1M38E c r := by
  unfold smallValue2_0M38E smallGap2_0_1M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap2_0_1M38E
 positivity

def smallGap2_0_2M38E (c r : ℤ) : ℤ := ((((((((9424512*c + (336887424*r + 345021120))*c + ((5268968352*r + 10782017568)*r + 5507717472))*c + (((47093344704*r + 144404995968)*r + 147381927840)*r + 50070355632))*c + ((((263086999560*r + 1074467206224)*r + 1643198742432)*r + 1115354772504)*r + 283538607120))*c + (((((940675997352*r + 4796820496500)*r + 9770512003680)*r + 9937517531916)*r + 5047438299672)*r + 1024286270832))*c + ((((((2102213560914*r + 12848728116678)*r + 32677434018210)*r + 44267434975290)*r + 33692015592564)*r + 13661076374568)*r + 2305575814608))*c + (((((((2684646595332*r + 19119943816518)*r + 58284959849466)*r + 98589685233186)*r + 99946118269866)*r + 60728135631720)*r + 20478993620904)*r + 2956953650400))*c + ((((((((1499970712474*r + 12193431741296)*r + 43314315541676)*r + 87823031034536)*r + 111173492284754)*r + 89978004547112)*r + 45471529181416)*r + 13119494258880)*r + 1654654091904))

theorem small_gap2_0_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 2*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 4≤(smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 3)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 3)^2-smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 2*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 4=smallGap2_0_2M38E c r := by
  unfold smallValue2_0M38E smallGap2_0_2M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap2_0_2M38E
 positivity

def smallGap2_0_3M38E (c r : ℤ) : ℤ := ((((((((18102528*c + (660897792*r + 672219648))*c + ((10558874880*r + 21433683456)*r + 10856557440))*c + (((96415481088*r + 292886703360)*r + 296013780864)*r + 99540782208))*c + ((((550320412320*r + 2223365786496)*r + 3362441334048)*r + 2256118000704)*r + 566736809616))*c + (((((2010491055360*r + 10126106548896)*r + 20366890337280)*r + 20449821638400)*r + 10251153402144)*r + 2052608744736))*c + ((((((4590779046192*r + 27668375455152)*r + 69381011923224)*r + 92660000476032)*r + 69517333689240)*r + 27781504831536)*r + 4620746332368))*c + (((((((5990073868176*r + 41995330924008)*r + 126030037541112)*r + 209878764677760)*r + 209473317086472)*r + 125309025744888)*r + 41604408055632)*r + 5914712149056))*c + ((((((((3419316127137*r + 27313765639692)*r + 95369831155530)*r + 190110775498080)*r + 236642850873633)*r + 188359142529492)*r + 93628912949076)*r + 26575049188896)*r + 3297825529920))

theorem small_gap2_0_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 3*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 5≤(smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 4)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 4)^2-smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 3*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 5=smallGap2_0_3M38E c r := by
  unfold smallValue2_0M38E smallGap2_0_3M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap2_0_3M38E
 positivity

def smallGap2_0_4M38E (c r : ℤ) : ℤ := ((((((((16754688*c + (632696832*r + 643479552))*c + ((10459321344*r + 21188837376)*r + 10703556864))*c + (((98839156224*r + 298936135680)*r + 300540277248)*r + 100416425472))*c + ((((583838060160*r + 2342128996608)*r + 3513924092544)*r + 2336607462144)*r + 581018631552))*c + (((((2207043162624*r + 11005079056128)*r + 21897621820032)*r + 21732891975936)*r + 10758588837504)*r + 2125328617728))*c + ((((((5213327312256*r + 31009646799552)*r + 76706556867552)*r + 100997816022144)*r + 74654355455136)*r + 29373612833472)*r + 4806786715776))*c + (((((((7034435132640*r + 48514854799776)*r + 143208767026272)*r + 234515582310720)*r + 230081320996224)*r + 135238564705056)*r + 44099611457856)*r + 6155110563840))*c + ((((((((4150708507536*r + 32509028111904)*r + 111325476365760)*r + 217665580048608)*r + 265737787213488)*r + 207425258019456)*r + 101092995865344)*r + 28128595805568)*r + 3421515723264))

theorem small_gap2_0_4M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 4*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 6≤(smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 5)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 5)^2-smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 4*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 6=smallGap2_0_4M38E c r := by
  unfold smallValue2_0M38E smallGap2_0_4M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap2_0_4M38E
 positivity

def smallGap2_0_5M38E (c r : ℤ) : ℤ := ((((((((7225344*c + (288227328*r + 297050112))*c + ((5038882816*r + 10320678912)*r + 5269963776))*c + (((50366152704*r + 153441325056)*r + 155194143744)*r + 52054448640))*c + ((((314547879936*r + 1265108791296)*r + 1899917926144)*r + 1261982700288)*r + 312684748800))*c + (((((1256020750336*r + 6246195758592)*r + 12376840925696)*r + 12210956340480)*r + 5996730512640)*r + 1172555532288))*c + ((((((3130154972160*r + 18465431576064)*r + 45252578300160)*r + 58951668375552)*r + 43045870738432)*r + 16701907240704)*r + 2690307750912))*c + (((((((4449726802944*r + 30262871016960)*r + 88051096785920)*r + 142013779748352)*r + 137082269951488)*r + 79177605770496)*r + 25336967817984)*r + 3465751549440))*c + ((((((((2761972740352*r + 21210601485312)*r + 71236059790336)*r + 136577444276736)*r + 163422839197696)*r + 124931701761024)*r + 59580380385024)*r + 16207262900736)*r + 1925805754368))

theorem small_gap2_0_5M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 5*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 7≤(smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 6)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 6)^2-smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 5*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 7=smallGap2_0_5M38E c r := by
  unfold smallValue2_0M38E smallGap2_0_5M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap2_0_5M38E
 positivity

def smallGap2_0_6M38E (c r : ℤ) : ℤ := ((((((((1277952*c + (55967744*r + 59867136))*c + ((1079197696*r + 2294169600)*r + 1219059712))*c + (((11898200064*r + 37409636352)*r + 38993125376)*r + 13426606080))*c + ((((81744748544*r + 336426307584)*r + 515532290048)*r + 348076240896)*r + 87257159680))*c + (((((357653106688*r + 1802230149120)*r + 3608506647552)*r + 3585702893568)*r + 1766809996288)*r + 345139906560))*c + ((((((972157814784*r + 5752438333440)*r + 14111866984192)*r + 18358261633536)*r + 13347404584704)*r + 5139278349312)*r + 818475652096))*c + (((((((1500290235392*r + 10132877706240)*r + 29250467762176)*r + 46737696503808)*r + 44605899742208)*r + 25410730328064)*r + 7997326541824)*r + 1072633055232))*c + ((((((((1006368871936*r + 7601588845056)*r + 25117002318848)*r + 47354827008000)*r + 55660978055936)*r + 41732072976384)*r + 19479963390208)*r + 5174926550016)*r + 599144334336))

theorem small_gap2_0_6M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 6*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 8≤(smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 7)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 7)^2-smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 6*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 8=smallGap2_0_6M38E c r := by
  unfold smallValue2_0M38E smallGap2_0_6M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap2_0_6M38E
 positivity

def smallGap2_0_7M38E (c r : ℤ) : ℤ := ((((((((65536*c + (3407872*r + 3932160))*c + ((80674816*r + 188612608)*r + 111607808))*c + (((1087700992*r + 3720708096)*r + 4205985792)*r + 1557123072))*c + ((((8987213824*r + 39454605312)*r + 64085938176)*r + 45536751616)*r + 11921583104))*c + (((((46407221248*r + 244286431232)*r + 508194418688)*r + 521822946304)*r + 264146590720)*r + 52667105280))*c + ((((((146315173888*r + 886888169472)*r + 2221033586688)*r + 2938651960320)*r + 2163852291072)*r + 839642392576)*r + 133964145664))*c + (((((((258020220928*r + 1753876893696)*r + 5087920889856)*r + 8153309968384)*r + 7782914323456)*r + 4418894769152)*r + 1379816298496)*r + 182582360064))*c + ((((((((195278709760*r + 1461198379008)*r + 4784144325632)*r + 8933655773184)*r + 10386971995136)*r + 7686604505088)*r + 3530175115264)*r + 918756467712)*r + 103660369920))

theorem small_gap2_0_7M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 7*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 9≤(smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 8)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 8)^2-smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 7*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 9=smallGap2_0_7M38E c r := by
  unfold smallValue2_0M38E smallGap2_0_7M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap2_0_7M38E
 positivity

def smallGap2_0_8M38E (c r : ℤ) : ℤ := ((((((((655360*r + 2490368)*r + 2277376)*c + (((21626880*r + 97124352)*r + 137084928)*r + 60653568))*c + ((((300810240*r + 1557004288)*r + 2905145344)*r + 2330140672)*r + 681256960))*c + (((((2238578688*r + 13041106944)*r + 29656023040)*r + 32999018496)*r + 17979545600)*r + 3833229312))*c + ((((((9353379840*r + 60132655104)*r + 158854060032)*r + 220745455616)*r + 170035145728)*r + 68708348928)*r + 11341336576))*c + (((((((20745928704*r + 144911237120)*r + 431202035712)*r + 707644454912)*r + 690535018496)*r + 399728958464)*r + 126678240256)*r + 16881469440))*c + ((((((((19056009216*r + 142858780672)*r + 468769561600)*r + 877693812736)*r + 1023264698368)*r + 758592464896)*r + 348060857344)*r + 89995622400)*r + 9994752000))

theorem small_gap2_0_8M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 8*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 10≤(smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 9)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 9)^2-smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 8*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 10=smallGap2_0_8M38E c r := by
  unfold smallValue2_0M38E smallGap2_0_8M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap2_0_8M38E
 positivity

def smallGap2_0_9M38E (c r : ℤ) : ℤ := ((((((((1310720*r + 8388608)*r + 20316160)*r + 21987328)*r + 9007104)*c + (((((26214400*r + 176029696)*r + 470024192)*r + 620232704)*r + 402948096)*r + 102352896))*c + ((((((198180864*r + 1392771072)*r + 4050485248)*r + 6223691776)*r + 5319913472)*r + 2391025664)*r + 438116352))*c + (((((((669253632*r + 4902879232)*r + 15343812608)*r + 26580074496)*r + 27492904960)*r + 16929910784)*r + 5713864704)*r + 808132608))*c + ((((((((849936384*r + 6461456384)*r + 21525938176)*r + 41069281280)*r + 49016218624)*r + 37358864384)*r + 17667773440)*r + 4704497664)*r + 535357440))

theorem small_gap2_0_9M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 9*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 11≤(smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 10)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 10)^2-smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 9*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 11=smallGap2_0_9M38E c r := by
  unfold smallValue2_0M38E smallGap2_0_9M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap2_0_9M38E
 positivity

def smallGap2_0_10M38E (c r : ℤ) : ℤ := ((((((((655360*r + 5111808)*r + 17022976)*r + 30867456)*r + 32088064)*r + 18137088)*r + 4359168)*c + (((((((6160384*r + 47972352)*r + 162414592)*r + 308723712)*r + 355115008)*r + 247062528)*r + 96362496)*r + 16312320))*c + ((((((((14614528*r + 113704960)*r + 390668288)*r + 772218880)*r + 959762432)*r + 768471040)*r + 387985408)*r + 113455104)*r + 14828544))

theorem small_gap2_0_10M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 10*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 12≤(smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 11)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 11)^2-smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 10*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) 12=smallGap2_0_10M38E c r := by
  unfold smallValue2_0M38E smallGap2_0_10M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap2_0_10M38E
 positivity

theorem small_lc2_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :
 smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) j*smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) (j+2)≤(smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) (j+1))^2 := by
 by_cases hj : j≤10
 · interval_cases j
   · exact small_gap2_0_0M38E c r hc hr
   · exact small_gap2_0_1M38E c r hc hr
   · exact small_gap2_0_2M38E c r hc hr
   · exact small_gap2_0_3M38E c r hc hr
   · exact small_gap2_0_4M38E c r hc hr
   · exact small_gap2_0_5M38E c r hc hr
   · exact small_gap2_0_6M38E c r hc hr
   · exact small_gap2_0_7M38E c r hc hr
   · exact small_gap2_0_8M38E c r hc hr
   · exact small_gap2_0_9M38E c r hc hr
   · exact small_gap2_0_10M38E c r hc hr
 · have hv : smallValue2_0M38E (5+1*c+4*r) (1+0*c+1*r) (j+2)=0 := by
    unfold smallValue2_0M38E
    split <;> omega
   rw [hv,mul_zero]
   exact sq_nonneg _

theorem source_small_lc2_0M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a)
 (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-4*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 1*((frame rest).mid.a:ℤ)-0*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+1*x+4*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 1+0*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := small_lc2_0M38E x y hx hy j
 rw [ec,er] at h
 have h0 := source_small_coeff2_0M38E rest hc hl hu (i+2) j (by omega)
 have h1 := source_small_coeff2_0M38E rest hc hl hu (i+1) (j+1) (by omega)
 have h2 := source_small_coeff2_0M38E rest hc hl hu i (j+2) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
