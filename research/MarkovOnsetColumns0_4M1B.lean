import MarkovOnsetValues0M1B
/-! Machine-authored 1b02dddc. Column-wise exact onset gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false

def onsetP0_4_0_0M1B (c r : ℤ) : ℤ :=
 4576824000 + 22772977920*r + 40779678240*r^2 + 31584268800*r^3 + 9041598720*r^4 + 4897005120*c + 16901670240*c*r + 18754848000*c*r^2 + 6771260160*c*r^3 + 1733598720*c^2 + 3657830400*c^2*r + 1863751680*c^2*r^2 + 233694720*c^3 + 222566400*c^3*r + 9676800*c^4

def onsetP0_4_0_1M1B (c r : ℤ) : ℤ :=
 3783317760 + 19047065184*r + 34510747008*r^2 + 26982756864*r^3 + 7772414208*r^4 + 4195566144*c + 14758949280*c*r + 16683278976*c*r^2 + 6125804544*c*r^3 + 1566517440*c^2 + 3402072576*c^2*r + 1783911168*c^2*r^2 + 228441024*c^3 + 226917120*c^3*r + 10602240*c^4

def onsetP0_4_0_2M1B (c r : ℤ) : ℤ :=
 1355372928 + 6889596672*r + 12606923392*r^2 + 9936444672*r^3 + 2875881344*r^4 + 1552634496*c + 5552448384*c*r + 6379978752*c*r^2 + 2377712512*c*r^3 + 608261024*c^2 + 1355397120*c^2*r + 729469440*c^2*r^2 + 95184096*c^3 + 98271488*c^3*r + 4895296*c^4

def onsetP0_4_0_3M1B (c r : ℤ) : ℤ :=
 273060480 + 1398283264*r + 2578265984*r^2 + 2044657664*r^3 + 593509504*r^4 + 322072576*c + 1167460672*c*r + 1359895488*c*r^2 + 513044224*c*r^3 + 131705504*c^2 + 299991552*c^2*r + 165125184*c^2*r^2 + 21938336*c^3 + 23431744*c^3*r + 1235584*c^4

def onsetP0_4_0_4M1B (c r : ℤ) : ℤ :=
 33445440 + 172112640*r + 318949120*r^2 + 253881600*r^3 + 73740800*r^4 + 40488000*c + 148270080*c*r + 174504960*c*r^2 + 66424960*c*r^3 + 17193680*c^2 + 39856320*c^2*r + 22337280*c^2*r^2 + 3024000*c^3 + 3321920*c^3*r + 184240*c^4

def onsetP0_4_0_5M1B (c r : ℤ) : ℤ :=
 2493120 + 12858496*r + 23875712*r^2 + 19018496*r^3 + 5512192*r^4 + 3087616*c + 11381440*c*r + 13481664*c*r^2 + 5157376*c*r^3 + 1354640*c^2 + 3179904*c^2*r + 1804992*c^2*r^2 + 249536*c^3 + 280000*c^3*r + 16240*c^4

def onsetP0_4_0_6M1B (c r : ℤ) : ℤ :=
 104832 + 540288*r + 1001728*r^2 + 795648*r^3 + 229376*r^4 + 132384*c + 489216*c*r + 580608*c*r^2 + 222208*c*r^3 + 59696*c^2 + 141120*c^2*r + 80640*c^2*r^2 + 11424*c^3 + 12992*c^3*r + 784*c^4

def onsetP0_4_0_7M1B (c r : ℤ) : ℤ :=
 1920 + 9856*r + 18176*r^2 + 14336*r^3 + 4096*r^4 + 2464*c + 9088*c*r + 10752*c*r^2 + 4096*c*r^3 + 1136*c^2 + 2688*c^2*r + 1536*c^2*r^2 + 224*c^3 + 256*c^3*r + 16*c^4

def onsetP0_4_1_0M1B (c r : ℤ) : ℤ :=
 1906511040 + 9378270720*r + 16598977920*r^2 + 12734668800*r^3 + 3622026240*r^4 + 1970075520*c + 6666589440*c*r + 7254696960*c*r^2 + 2572093440*c*r^3 + 659534400*c^2 + 1347978240*c^2*r + 664796160*c^2*r^2 + 81285120*c^3 + 73543680*c^3*r + 2903040*c^4

def onsetP0_4_1_1M1B (c r : ℤ) : ℤ :=
 1769730912 + 8835501696*r + 15870163200*r^2 + 12319620096*r^3 + 3532752768*r^4 + 1909314624*c + 6617641728*c*r + 7369229952*c*r^2 + 2668375296*c*r^3 + 682760160*c^2 + 1446899328*c^2*r + 739550592*c^2*r^2 + 92972544*c^3 + 88705536*c^3*r + 3858048*c^4

def onsetP0_4_1_2M1B (c r : ℤ) : ℤ :=
 713465088 + 3606735104*r + 6561707264*r^2 + 5147209984*r^3 + 1486030336*r^4 + 800402624*c + 2833019840*c*r + 3220988736*c*r^2 + 1188802944*c*r^3 + 303631776*c^2 + 664821696*c^2*r + 351244992*c^2*r^2 + 45184384*c^3 + 45297280*c^3*r + 2143008*c^4

def onsetP0_4_1_3M1B (c r : ℤ) : ℤ :=
 162180480 + 827956864*r + 1521828224*r^2 + 1203905024*r^3 + 349224064*r^4 + 188435296*c + 678728512*c*r + 785456448*c*r^2 + 294617344*c*r^3 + 75323024*c^2 + 169636992*c^2*r + 92266944*c^2*r^2 + 12117056*c^3 + 12693184*c^3*r + 645904*c^4

def onsetP0_4_1_4M1B (c r : ℤ) : ℤ :=
 22485120 + 115579520*r + 213960320*r^2 + 170222080*r^3 + 49477120*r^4 + 26949440*c + 98383040*c*r + 115429440*c*r^2 + 43827840*c*r^3 + 11276160*c^2 + 25979520*c^2*r + 14468160*c^2*r^2 + 1939840*c^3 + 2107840*c^3*r + 114240*c^4

def onsetP0_4_1_5M1B (c r : ℤ) : ℤ :=
 1904448 + 9823744*r + 18247040*r^2 + 14545664*r^3 + 4221952*r^4 + 2345056*c + 8636992*c*r + 10223808*c*r^2 + 3910144*c*r^3 + 1020320*c^2 + 2389632*c^2*r + 1353408*c^2*r^2 + 185696*c^3 + 207424*c^3*r + 11872*c^4

def onsetP0_4_1_6M1B (c r : ℤ) : ℤ :=
 91392 + 471296*r + 874496*r^2 + 695296*r^3 + 200704*r^4 + 115136*c + 425600*c*r + 505344*c*r^2 + 193536*c*r^3 + 51744*c^2 + 122304*c^2*r + 69888*c^2*r^2 + 9856*c^3 + 11200*c^3*r + 672*c^4

def onsetP0_4_1_7M1B (c r : ℤ) : ℤ :=
 1920 + 9856*r + 18176*r^2 + 14336*r^3 + 4096*r^4 + 2464*c + 9088*c*r + 10752*c*r^2 + 4096*c*r^3 + 1136*c^2 + 2688*c^2*r + 1536*c^2*r^2 + 224*c^3 + 256*c^3*r + 16*c^4

def onsetP0_4_2_0M1B (c r : ℤ) : ℤ :=
 708734880 + 3427764480*r + 5965263360*r^2 + 4514711040*r^3 + 1271531520*r^4 + 697445280*c + 2293401600*c*r + 2426699520*c*r^2 + 838010880*c*r^3 + 215389440*c^2 + 419973120*c^2*r + 197406720*c^2*r^2 + 23143680*c^3 + 19353600*c^3*r + 645120*c^4

def onsetP0_4_2_1M1B (c r : ℤ) : ℤ :=
 748389024 + 3689943936*r + 6542507520*r^2 + 5024683776*r^3 + 1430390016*r^4 + 777069216*c + 2634950400*c*r + 2870066304*c*r^2 + 1017728256*c*r^3 + 261160128*c^2 + 533481984*c^2*r + 262347264*c^2*r^2 + 32066496*c^3 + 28730880*c^3*r + 1108224*c^4

def onsetP0_4_2_2M1B (c r : ℤ) : ℤ :=
 344120448 + 1724966656*r + 3110249856*r^2 + 2421499136*r^3 + 695925888*r^4 + 375018112*c + 1306955776*c*r + 1462312320*c*r^2 + 531633536*c*r^3 + 135868768*c^2 + 289669632*c^2*r + 148735104*c^2*r^2 + 18758432*c^3 + 17953152*c^3*r + 781760*c^4

def onsetP0_4_2_3M1B (c r : ℤ) : ℤ :=
 89523840 + 454795264*r + 831603584*r^2 + 655069184*r^3 + 189664384*r^4 + 101871616*c + 363372352*c*r + 416246208*c*r^2 + 154680064*c*r^3 + 39426464*c^2 + 87263232*c^2*r + 46584384*c^2*r^2 + 6025376*c^3 + 6121024*c^3*r + 294784*c^4

def onsetP0_4_2_4M1B (c r : ℤ) : ℤ :=
 14266560 + 73185280*r + 135206400*r^2 + 107421440*r^3 + 31234560*r^4 + 16864960*c + 61264000*c*r + 71514240*c*r^2 + 27036800*c*r^3 + 6910960*c^2 + 15771840*c^2*r + 8695680*c^2*r^2 + 1151360*c^3 + 1229760*c^3*r + 64400*c^4

def onsetP0_4_2_5M1B (c r : ℤ) : ℤ :=
 1396416 + 7202944*r + 13381760*r^2 + 10674944*r^3 + 3103744*r^4 + 1705984*c + 6274240*c*r + 7417536*c*r^2 + 2834944*c*r^3 + 733712*c^2 + 1712256*c^2*r + 966336*c^2*r^2 + 131264*c^3 + 145600*c^3*r + 8176*c^4

def onsetP0_4_2_6M1B (c r : ℤ) : ℤ :=
 77952 + 402304*r + 747264*r^2 + 594944*r^3 + 172032*r^4 + 97888*c + 361984*c*r + 430080*c*r^2 + 164864*c*r^3 + 43792*c^2 + 103488*c^2*r + 59136*c^2*r^2 + 8288*c^3 + 9408*c^3*r + 560*c^4

def onsetP0_4_2_7M1B (c r : ℤ) : ℤ :=
 1920 + 9856*r + 18176*r^2 + 14336*r^3 + 4096*r^4 + 2464*c + 9088*c*r + 10752*c*r^2 + 4096*c*r^3 + 1136*c^2 + 2688*c^2*r + 1536*c^2*r^2 + 224*c^3 + 256*c^3*r + 16*c^4

def onsetG0_4_0M1B (c r : ℤ) : ℤ :=
 391029537220761600 + 3931274815792128000*r + 16979885317767859200*r^2 + 41219136374053478400*r^3 + 61629234740488396800*r^4 + 58235682579572736000*r^5 + 34033645752990105600*r^6 + 11270010226832179200*r^7 + 1622396319576883200*r^8 + 849178824754176000*c + 7227670979397657600*c*r + 25892121126504729600*c*r^2 + 50705344834318540800*c*r^3 + 58743425971877068800*c*r^4 + 40342257404441395200*c*r^5 + 15236054117867520000*c*r^6 + 2445551039309414400*c*r^7 + 766162238017075200*c^2 + 5397032781147571200*c^2*r + 15563638485397094400*c^2*r^2 + 23565965255007436800*c^2*r^3 + 19800781444207411200*c^2*r^4 + 8770157144314675200*c^2*r^5 + 1602401896798617600*c^2*r^6 + 373201524851097600*c^3 + 2111533395910041600*c^3*r + 4697907724119859200*c^3*r^2 + 5148744298861363200*c^3*r^3 + 2785338207048499200*c^3*r^4 + 596065839847833600*c^3*r^5 + 106796887755264000*c^4 + 465180026714726400*c^4*r + 747716340871987200*c^4*r^2 + 526924385132544000*c^4*r^3 + 137690438447923200*c^4*r^4 + 18293658447052800*c^5 + 57469691820441600*c^5*r + 59355096927436800*c^5*r^2 + 20232945834393600*c^5*r^3 + 1825364665958400*c^6 + 3684908099174400*c^6*r + 1848462645657600*c^6*r^2 + 97230009139200*c^7 + 96137537126400*c^7*r + 2184944025600*c^8

theorem onsetG0_4_0M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_0M1B c r := by
 unfold onsetG0_4_0M1B
 positivity

def onsetG0_4_1M1B (c r : ℤ) : ℤ :=
 641408938099292160 + 6485081867425244160*r + 28177893810576276480*r^2 + 68817626986141716480*r^3 + 103502068948642775040*r^4 + 98347023003752570880*r^5 + 57765142959961006080*r^6 + 19212220181563637760*r^7 + 2775564260523048960*r^8 + 1419690810633984000*c + 12177572275921167360*c*r + 43976635343197240320*c*r^2 + 86820219136078848000*c*r^3 + 101385548812803870720*c*r^4 + 70161381428813660160*c*r^5 + 26690280210026496000*c*r^6 + 4313036461403013120*c*r^7 + 1311452224606218240*c^2 + 9332302965378785280*c^2*r + 27192527120954603520*c^2*r^2 + 41604895232289607680*c^2*r^3 + 35319427231522775040*c^2*r^4 + 15802210093870448640*c^2*r^5 + 2915735231241584640*c^2*r^6 + 657516638421135360*c^3 + 3767954465895782400*c^3*r + 8492600891729848320*c^3*r^2 + 9429248758053519360*c^3*r^3 + 5167137725162864640*c^3*r^4 + 1119936004875878400*c^3*r^5 + 194837320722401280*c^4 + 862011133888665600*c^4*r + 1407511013031567360*c^4*r^2 + 1007496012257280000*c^4*r^3 + 267327360064880640*c^4*r^4 + 34792000557834240*c^5 + 111336302043832320*c^5*r + 117102331262730240*c^5*r^2 + 40613987088138240*c^5*r^3 + 3644410582794240*c^6 + 7510381364183040*c^6*r + 3836865753907200*c^6*r^2 + 204975928442880*c^7 + 206244843356160*c^7*r + 4836356259840*c^8

theorem onsetG0_4_1M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_1M1B c r := by
 unfold onsetG0_4_1M1B
 positivity

def onsetG0_4_2M1B (c r : ℤ) : ℤ :=
 485433354074747904 + 4932461271780983808*r + 21544016313059573760*r^2 + 52895695463078952960*r^3 + 79967865848210694144*r^4 + 76354426428898738176*r^5 + 45043377221725876224*r^6 + 15036612306415386624*r^7 + 2178583782496321536*r^8 + 1093987725395281920*c + 9448627243713380352*c*r + 34366456358047199232*c*r^2 + 68338213897149665280*c*r^3 + 80369890487779737600*c*r^4 + 55997063741474537472*c*r^5 + 21438174612217724928*c*r^6 + 3484625283237740544*c*r^7 + 1033209545372347392*c^2 + 7419447247838008320*c^2*r + 21821446196679435264*c^2*r^2 + 33701655858521591808*c^2*r^3 + 28876532020967522304*c^2*r^4 + 13036825276537208832*c^2*r^5 + 2426561211104722944*c^2*r^6 + 532178942739591168*c^3 + 3085116320784669696*c^3*r + 7035778577497291776*c^3*r^2 + 7904344733127327744*c^3*r^3 + 4382316361742376960*c^3*r^4 + 960773062302498816*c^3*r^5 + 162907597086990336*c^4 + 731070064478444544*c^4*r + 1210949550673680384*c^4*r^2 + 879225322604912640*c^4*r^3 + 236561813139456000*c^4*r^4 + 30237868327274496*c^5 + 98415573591767040*c^5*r + 105257011355467776*c^5*r^2 + 37092251303460864*c^5*r^3 + 3313734422003712*c^6 + 6960188017262592*c^6*r + 3617564443508736*c^6*r^2 + 196062928846848*c^7 + 200721695440896*c^7*r + 4854364913664*c^8

theorem onsetG0_4_2M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_2M1B c r := by
 unfold onsetG0_4_2M1B
 positivity

def onsetG0_4_3M1B (c r : ℤ) : ℤ :=
 224154621668597760 + 2287336216001163264*r + 10035402393413677056*r^2 + 24751081509330505728*r^3 + 37583816129125109760*r^4 + 36032901843950505984*r^5 + 21333837084380147712*r^6 + 7143022713176555520*r^7 + 1037161497942786048*r^8 + 513834765700386816*c + 4464665659603924992*c*r + 16340470055569680384*c*r^2 + 32698322431879329792*c*r^3 + 38693145247923296256*c*r^4 + 27118227325033635840*c*r^5 + 10438884605805723648*c*r^6 + 1705119169130496000*c*r^7 + 495476852473085952*c^2 + 3586695388453782528*c^2*r + 10636344091141407744*c^2*r^2 + 16564055645848037376*c^2*r^3 + 14309244483159091200*c^2*r^4 + 6511639211494244352*c^2*r^5 + 1221256971292409856*c^2*r^6 + 261714469357178880*c^3 + 1532917411397600256*c^3*r + 3532854392721540096*c^3*r^2 + 4011028976958689280*c^3*r^3 + 2247042347900313600*c^3*r^4 + 497669076387495936*c^3*r^5 + 82573829351774208*c^4 + 375337297039466496*c^4*r + 629803222206842880*c^4*r^2 + 463183031247175680*c^4*r^3 + 126194190488002560*c^4*r^4 + 15887146208704512*c^5 + 52508974073837568*c^5*r + 57019402651115520*c^5*r^2 + 20388639624364032*c^5*r^3 + 1815578618757120*c^6 + 3880634083909632*c^6*r + 2049754377216000*c^6*r^2 + 112613835522048*c^7 + 117251902193664*c^7*r + 2922668335104*c^8

theorem onsetG0_4_3M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_3M1B c r := by
 unfold onsetG0_4_3M1B
 positivity

def onsetG0_4_4M1B (c r : ℤ) : ℤ :=
 70336685147904000 + 720286177898434560*r + 3171898920414902272*r^2 + 7852337134077743104*r^3 + 11966541811369005056*r^4 + 11510690231447400448*r^5 + 6834467585313406976*r^6 + 2293395821004488704*r^7 + 333470961640456192*r^8 + 163844868561561600*c + 1430959644143783936*c*r + 5265174681913079808*c*r^2 + 10592471927901710336*c*r^3 + 12600092492599377920*c*r^4 + 8874517922348703744*c*r^5 + 3431581427899727872*c*r^6 + 562741295464054784*c*r^7 + 161097511741368832*c^2 + 1174327166072159232*c^2*r + 3507524986355206656*c^2*r^2 + 5501779483129108480*c^2*r^3 + 4786594186006671360*c^2*r^4 + 2193097485732593664*c^2*r^5 + 413971865463095296*c^2*r^6 + 87113436199584256*c^3 + 514888117968928256*c^3*r + 1197671392744744960*c^3*r^2 + 1372432682652344320*c^3*r^3 + 775900966465372160*c^3*r^4 + 173372733531619328*c^3*r^5 + 28267693388028416*c^4 + 129959973890862080*c^4*r + 220590540695723520*c^4*r^2 + 164093483139891200*c^4*r^3 + 45207915458621440*c^4*r^4 + 5622572343066112*c^5 + 18841206836304384*c^5*r + 20741366374772736*c^5*r^2 + 7515150812008448*c^5*r^3 + 667971039389696*c^6 + 1450578292215808*c^6*r + 777730174713856*c^6*r^2 + 43292794617856*c^7 + 45810749702144*c^7*r + 1175963149312*c^8

theorem onsetG0_4_4M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_4M1B c r := by
 unfold onsetG0_4_4M1B
 positivity

def onsetG0_4_5M1B (c r : ℤ) : ℤ :=
 15800021749370880 + 162260682945177600*r + 716642426301634560*r^2 + 1779308482688593920*r^3 + 2719102403457699840*r^4 + 2622006184376033280*r^5 + 1559968759531929600*r^6 + 524208676089692160*r^7 + 76271345610915840*r^8 + 37366213924730880*c + 327736172995768320*c*r + 1211206663089346560*c*r^2 + 2447438051455703040*c*r^3 + 2923713456473241600*c*r^4 + 2067406861222133760*c*r^5 + 802245626657341440*c*r^6 + 131949862959022080*c*r^7 + 37415208456192000*c^2 + 274360623330178560*c^2*r + 824466120348648960*c^2*r^2 + 1301121690418636800*c^2*r^3 + 1138735120448808960*c^2*r^4 + 524703435184373760*c^2*r^5 + 99567165946429440*c^2*r^6 + 20679016040954880*c^3 + 123184476409881600*c^3*r + 288832779862824960*c^3*r^2 + 333628696549908480*c^3*r^3 + 190096361745776640*c^3*r^4 + 42797855356354560*c^3*r^5 + 6887042547409920*c^4 + 31979385369899520*c^4*r + 54829570339729920*c^4*r^2 + 41195815058657280*c^4*r^3 + 11460422428815360*c^4*r^4 + 1412616070118400*c^5 + 4791722000593920*c^5*r + 5339376432875520*c^5*r^2 + 1957537856655360*c^5*r^3 + 173946981734400*c^6 + 383175239731200*c^6*r + 208263322982400*c^6*r^2 + 11743588147200*c^7 + 12617079336960*c^7*r + 333228672000*c^8

theorem onsetG0_4_5M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_5M1B c r := by
 unfold onsetG0_4_5M1B
 positivity

def onsetG0_4_6M1B (c r : ℤ) : ℤ :=
 2605233543800832 + 26811808745723904*r + 118673889602293760*r^2 + 295269752226283520*r^3 + 452098384820518912*r^4 + 436664746545348608*r^5 + 260101801486385152*r^6 + 87455600313761792*r^7 + 12722678850387968*r^8 + 6249520965596160*c + 55000611551850496*c*r + 203971438692381696*c*r^2 + 413574940923504640*c*r^3 + 495674607464243200*c*r^4 + 351541227735269376*c*r^5 + 136759323695611904*c*r^6 + 22537914997276672*c*r^7 + 6365167883734016*c^2 + 46903606660861440*c^2*r + 141652220611517952*c^2*r^2 + 224658561759586304*c^2*r^3 + 197565828981706752*c^2*r^4 + 91444898635431936*c^2*r^5 + 17423716193042432*c^2*r^6 + 3590096765609984*c^3 + 21527718140551168*c^3*r + 50816261938899968*c^3*r^2 + 59090880519974912*c^3*r^3 + 33888856027586560*c^3*r^4 + 7677211111456768*c^3*r^5 + 1224788491671808*c^4 + 5735866019226112*c^4*r + 9919355525140992*c^4*r^2 + 7516707055513600*c^4*r^3 + 2108525290188800*c^4*r^4 + 258441395652608*c^5 + 885995007313920*c^5*r + 997753668108288*c^5*r^2 + 369594137608192*c^5*r^3 + 32893085026816*c^6 + 73378498113536*c^6*r + 40373885984768*c^6*r^2 + 2306242448384*c^7 + 2512731332608*c^7*r + 68208449792*c^8

theorem onsetG0_4_6M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_6M1B c r := by
 unfold onsetG0_4_6M1B
 positivity

def onsetG0_4_7M1B (c r : ℤ) : ℤ :=
 317692394127360 + 3274173933391872*r + 14512281543180288*r^2 + 36154213404954624*r^3 + 55417069511516160*r^4 + 53566186807590912*r^5 + 31917224086142976*r^6 + 10729003808194560*r^7 + 1559314320850944*r^8 + 772335465689088*c + 6814447302491136*c*r + 25336230261414912*c*r^2 + 51499149778169856*c*r^3 + 61863016473796608*c*r^4 + 43960462272921600*c*r^5 + 17127907585818624*c*r^6 + 2825407766200320*c*r^7 + 799220737437696*c^2 + 5912096800264704*c^2*r + 17924815696015872*c^2*r^2 + 28537790106083328*c^2*r^3 + 25187970378977280*c^2*r^4 + 11697423062040576*c^2*r^5 + 2235310973779968*c^2*r^6 + 459346864112640*c^3 + 2769320079525888*c^3*r + 6572699286709248*c^3*r^2 + 7684204019466240*c^3*r^3 + 4429848474132480*c^3*r^4 + 1008449874690048*c^3*r^5 + 160231297572864*c^4 + 755744453549568*c^4*r + 1316352605621760*c^4*r^2 + 1004591582023680*c^4*r^3 + 283735095275520*c^4*r^4 + 34703694498816*c^5 + 120048376863744*c^5*r + 136412878049280*c^5*r^2 + 50977359691776*c^5*r^3 + 4553082777600*c^6 + 10268886491136*c^6*r + 5710957056000*c^6*r^2 + 330557681664*c^7 + 364711882752*c^7*r + 10164252672*c^8

theorem onsetG0_4_7M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_7M1B c r := by
 unfold onsetG0_4_7M1B
 positivity

def onsetG0_4_8M1B (c r : ℤ) : ℤ :=
 28434154291200 + 293252616437760*r + 1300604870455296*r^2 + 3241686248005632*r^3 + 4969972257374208*r^4 + 4803447056400384*r^5 + 2860529334878208*r^6 + 960502758899712*r^7 + 139348144029696*r^8 + 69995437102080*c + 618627735118848*c*r + 2303846945132544*c*r^2 + 4689932255920128*c*r^3 + 5640961542021120*c*r^4 + 4012316507308032*c*r^5 + 1564072109408256*c*r^6 + 257997948321792*c*r^7 + 73510925462016*c^2 + 545338710637056*c^2*r + 1658092566509568*c^2*r^2 + 2646992342077440*c^2*r^3 + 2342112185548800*c^2*r^4 + 1090044293087232*c^2*r^5 + 208662248030208*c^2*r^6 + 42992973639168*c^3 + 260287056680448*c^3*r + 620360947691520*c^3*r^2 + 728238161817600*c^3*r^3 + 421445385338880*c^3*r^4 + 96281223757824*c^3*r^5 + 15307233731328*c^4 + 72612296762880*c^4*r + 127202146928640*c^4*r^2 + 97621797826560*c^4*r^3 + 27720408145920*c^4*r^4 + 3395630547456*c^5 + 11833787008512*c^5*r + 13546709987328*c^5*r^2 + 5099040436224*c^5*r^3 + 458064542208*c^6 + 1042677694464*c^6*r + 585163235328*c^6*r^2 + 34336877568*c^7 + 38301376512*c^7*r + 1094666496*c^8

theorem onsetG0_4_8M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_8M1B c r := by
 unfold onsetG0_4_8M1B
 positivity

def onsetG0_4_9M1B (c r : ℤ) : ℤ :=
 1821591797760 + 18786585968640*r + 83307301109760*r^2 + 207563506483200*r^3 + 318021169643520*r^4 + 307058939658240*r^5 + 182594792325120*r^6 + 61190103367680*r^7 + 8854280601600*r^8 + 4536803819520*c + 40130641797120*c*r + 149560326021120*c*r^2 + 304624327311360*c*r^3 + 366497444167680*c*r^4 + 260663099719680*c*r^5 + 101558279208960*c*r^6 + 16734722457600*c*r^7 + 4830519644160*c^2 + 35901470760960*c^2*r + 109350026526720*c^2*r^2 + 174844927057920*c^2*r^3 + 154912467763200*c^2*r^4 + 72168800256000*c^2*r^5 + 13822454661120*c^2*r^6 + 2870984847360*c^3 + 17433951897600*c^3*r + 41674141931520*c^3*r^2 + 49057469583360*c^3*r^3 + 28462412267520*c^3*r^4 + 6516558397440*c^3*r^5 + 1041596236800*c^4 + 4962492487680*c^4*r + 8730622494720*c^4*r^2 + 6728039915520*c^4*r^3 + 1917855744000*c^4*r^4 + 236172840960*c^5 + 827880130560*c^5*r + 953195120640*c^5*r^2 + 360791961600*c^5*r^3 + 32677263360*c^6 + 74939074560*c^6*r + 42366105600*c^6*r^2 + 2521989120*c^7 + 2838958080*c^7*r + 83112960*c^8

theorem onsetG0_4_9M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_9M1B c r := by
 unfold onsetG0_4_9M1B
 positivity

def onsetG0_4_10M1B (c r : ℤ) : ℤ :=
 79289892864 + 817132044288*r + 3620056186880*r^2 + 9008643768320*r^3 + 13781734457344*r^4 + 13281424572416*r^5 + 7879392231424*r^6 + 2632957558784*r^7 + 379685175296*r^8 + 199631953920*c + 1765835825152*c*r + 6579698614272*c*r^2 + 13395702906880*c*r^3 + 16104649523200*c*r^4 + 11441355620352*c*r^5 + 4450804563968*c*r^6 + 731889270784*c*r^7 + 215272020992*c^2 + 1601300951040*c^2*r + 4880640221184*c^2*r^2 + 7807468863488*c^2*r^3 + 6918540754944*c^2*r^4 + 3222464888832*c^2*r^5 + 616797569024*c^2*r^6 + 129854133248*c^3 + 789984219136*c^3*r + 1891580665856*c^3*r^2 + 2230003564544*c^3*r^3 + 1295350497280*c^3*r^4 + 296816214016*c^3*r^5 + 47928998656*c^4 + 229027692544*c^4*r + 404078567424*c^4*r^2 + 312211701760*c^4*r^3 + 89204326400*c^4*r^4 + 11086186496*c^5 + 39026749440*c^5*r + 45119348736*c^5*r^2 + 17144479744*c^5*r^3 + 1569551872*c^6 + 3619868672*c^6*r + 2057732096*c^6*r^2 + 124371968*c^7 + 141008896*c^7*r + 4223744*c^8

theorem onsetG0_4_10M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_10M1B c r := by
 unfold onsetG0_4_10M1B
 positivity

def onsetG0_4_11M1B (c r : ℤ) : ℤ :=
 2105671680 + 21667774464*r + 95823200256*r^2 + 237965672448*r^3 + 363166433280*r^4 + 348996501504*r^5 + 206372339712*r^6 + 68702699520*r^7 + 9865003008*r^8 + 5355012096*c + 47325315072*c*r + 176138747904*c*r^2 + 358090801152*c*r^3 + 429744193536*c*r^4 + 304648028160*c*r^5 + 118203875328*c*r^6 + 19377684480*c*r^7 + 5842378752*c^2 + 43450810368*c^2*r + 132380688384*c^2*r^2 + 211621380096*c^2*r^3 + 187335966720*c^2*r^4 + 87133519872*c^2*r^5 + 16647192576*c^2*r^6 + 3572244480*c^3 + 21746221056*c^3*r + 52092665856*c^3*r^2 + 61422305280*c^3*r^3 + 35672555520*c^3*r^4 + 8169455616*c^3*r^5 + 1339312128*c^4 + 6409998336*c^4*r + 11324866560*c^4*r^2 + 8759869440*c^4*r^3 + 2504785920*c^4*r^4 + 315420672*c^5 + 1113305088*c^5*r + 1290240000*c^5*r^2 + 491323392*c^5*r^3 + 45588480*c^6 + 105541632*c^6*r + 60211200*c^6*r^2 + 3698688*c^7 + 4214784*c^7*r + 129024*c^8

theorem onsetG0_4_11M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_11M1B c r := by
 unfold onsetG0_4_11M1B
 positivity

def onsetG0_4_12M1B (c r : ℤ) : ℤ :=
 25804800 + 264929280*r + 1168556032*r^2 + 2893348864*r^3 + 4400807936*r^4 + 4213178368*r^5 + 2480930816*r^6 + 822083584*r^7 + 117440512*r^8 + 66232320*c + 584278016*c*r + 2170011648*c*r^2 + 4400807936*c*r^3 + 5266472960*c*r^4 + 3721396224*c*r^5 + 1438646272*c*r^6 + 234881024*c*r^7 + 73034752*c^2 + 542502912*c^2*r + 1650302976*c^2*r^2 + 2633236480*c^2*r^3 + 2325872640*c^2*r^4 + 1078984704*c^2*r^5 + 205520896*c^2*r^6 + 45208576*c^3 + 275050496*c^3*r + 658309120*c^3*r^2 + 775290880*c^3*r^3 + 449576960*c^3*r^4 + 102760448*c^3*r^5 + 17190656*c^4 + 82288640*c^4*r + 145367040*c^4*r^2 + 112394240*c^4*r^3 + 32112640*c^4*r^4 + 4114432*c^5 + 14536704*c^5*r + 16859136*c^5*r^2 + 6422528*c^5*r^3 + 605696*c^6 + 1404928*c^6*r + 802816*c^6*r^2 + 50176*c^7 + 57344*c^7*r + 1792*c^8

theorem onsetG0_4_12M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_12M1B c r := by
 unfold onsetG0_4_12M1B
 positivity

def onsetG0_4_13M1B (c r : ℤ) : ℤ :=
 0

theorem onsetG0_4_13M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_13M1B c r := by
 unfold onsetG0_4_13M1B
 positivity

def onsetG0_4_14M1B (c r : ℤ) : ℤ :=
 0

theorem onsetG0_4_14M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_4_14M1B c r := by
 unfold onsetG0_4_14M1B
 positivity

theorem onset_stage0_4_0M1B (n c r : ℤ) :
 onsetValue0_4M1B (n+7) (5 + 4*r + 1*c) (1 + 1*r)=onsetP0_4_0_0M1B c r*n^0 + onsetP0_4_0_1M1B c r*n^1 + onsetP0_4_0_2M1B c r*n^2 + onsetP0_4_0_3M1B c r*n^3 + onsetP0_4_0_4M1B c r*n^4 + onsetP0_4_0_5M1B c r*n^5 + onsetP0_4_0_6M1B c r*n^6 + onsetP0_4_0_7M1B c r*n^7 := by
 unfold onsetValue0_4M1B backShape0M94 onsetCorrection0_4M1B onsetP0_4_0_0M1B onsetP0_4_0_1M1B onsetP0_4_0_2M1B onsetP0_4_0_3M1B onsetP0_4_0_4M1B onsetP0_4_0_5M1B onsetP0_4_0_6M1B onsetP0_4_0_7M1B
 ring

theorem onset_stage0_4_1M1B (n c r : ℤ) :
 onsetValue0_5M1B (n+7) (5 + 4*r + 1*c) (1 + 1*r)=onsetP0_4_1_0M1B c r*n^0 + onsetP0_4_1_1M1B c r*n^1 + onsetP0_4_1_2M1B c r*n^2 + onsetP0_4_1_3M1B c r*n^3 + onsetP0_4_1_4M1B c r*n^4 + onsetP0_4_1_5M1B c r*n^5 + onsetP0_4_1_6M1B c r*n^6 + onsetP0_4_1_7M1B c r*n^7 := by
 unfold onsetValue0_5M1B backShape0M94 onsetCorrection0_5M1B onsetP0_4_1_0M1B onsetP0_4_1_1M1B onsetP0_4_1_2M1B onsetP0_4_1_3M1B onsetP0_4_1_4M1B onsetP0_4_1_5M1B onsetP0_4_1_6M1B onsetP0_4_1_7M1B
 ring

theorem onset_stage0_4_2M1B (n c r : ℤ) :
 onsetValue0_6M1B (n+7) (5 + 4*r + 1*c) (1 + 1*r)=onsetP0_4_2_0M1B c r*n^0 + onsetP0_4_2_1M1B c r*n^1 + onsetP0_4_2_2M1B c r*n^2 + onsetP0_4_2_3M1B c r*n^3 + onsetP0_4_2_4M1B c r*n^4 + onsetP0_4_2_5M1B c r*n^5 + onsetP0_4_2_6M1B c r*n^6 + onsetP0_4_2_7M1B c r*n^7 := by
 unfold onsetValue0_6M1B backShape0M94 onsetCorrection0_6M1B onsetP0_4_2_0M1B onsetP0_4_2_1M1B onsetP0_4_2_2M1B onsetP0_4_2_3M1B onsetP0_4_2_4M1B onsetP0_4_2_5M1B onsetP0_4_2_6M1B onsetP0_4_2_7M1B
 ring

theorem onset_column0_4_0M1B (c r : ℤ) :
 (onsetP0_4_1_0M1B c r*onsetP0_4_1_0M1B c r)-(onsetP0_4_0_0M1B c r*onsetP0_4_2_0M1B c r)=onsetG0_4_0M1B c r := by
 unfold onsetG0_4_0M1B onsetP0_4_0_0M1B onsetP0_4_1_0M1B onsetP0_4_2_0M1B
 ring

theorem onset_column0_4_1M1B (c r : ℤ) :
 (onsetP0_4_1_0M1B c r*onsetP0_4_1_1M1B c r + onsetP0_4_1_1M1B c r*onsetP0_4_1_0M1B c r)-(onsetP0_4_0_0M1B c r*onsetP0_4_2_1M1B c r + onsetP0_4_0_1M1B c r*onsetP0_4_2_0M1B c r)=onsetG0_4_1M1B c r := by
 unfold onsetG0_4_1M1B onsetP0_4_0_0M1B onsetP0_4_0_1M1B onsetP0_4_1_0M1B onsetP0_4_1_1M1B onsetP0_4_2_0M1B onsetP0_4_2_1M1B
 ring

theorem onset_column0_4_2M1B (c r : ℤ) :
 (onsetP0_4_1_0M1B c r*onsetP0_4_1_2M1B c r + onsetP0_4_1_1M1B c r*onsetP0_4_1_1M1B c r + onsetP0_4_1_2M1B c r*onsetP0_4_1_0M1B c r)-(onsetP0_4_0_0M1B c r*onsetP0_4_2_2M1B c r + onsetP0_4_0_1M1B c r*onsetP0_4_2_1M1B c r + onsetP0_4_0_2M1B c r*onsetP0_4_2_0M1B c r)=onsetG0_4_2M1B c r := by
 unfold onsetG0_4_2M1B onsetP0_4_0_0M1B onsetP0_4_0_1M1B onsetP0_4_0_2M1B onsetP0_4_1_0M1B onsetP0_4_1_1M1B onsetP0_4_1_2M1B onsetP0_4_2_0M1B onsetP0_4_2_1M1B onsetP0_4_2_2M1B
 ring

theorem onset_column0_4_3M1B (c r : ℤ) :
 (onsetP0_4_1_0M1B c r*onsetP0_4_1_3M1B c r + onsetP0_4_1_1M1B c r*onsetP0_4_1_2M1B c r + onsetP0_4_1_2M1B c r*onsetP0_4_1_1M1B c r + onsetP0_4_1_3M1B c r*onsetP0_4_1_0M1B c r)-(onsetP0_4_0_0M1B c r*onsetP0_4_2_3M1B c r + onsetP0_4_0_1M1B c r*onsetP0_4_2_2M1B c r + onsetP0_4_0_2M1B c r*onsetP0_4_2_1M1B c r + onsetP0_4_0_3M1B c r*onsetP0_4_2_0M1B c r)=onsetG0_4_3M1B c r := by
 unfold onsetG0_4_3M1B onsetP0_4_0_0M1B onsetP0_4_0_1M1B onsetP0_4_0_2M1B onsetP0_4_0_3M1B onsetP0_4_1_0M1B onsetP0_4_1_1M1B onsetP0_4_1_2M1B onsetP0_4_1_3M1B onsetP0_4_2_0M1B onsetP0_4_2_1M1B onsetP0_4_2_2M1B onsetP0_4_2_3M1B
 ring

theorem onset_column0_4_4M1B (c r : ℤ) :
 (onsetP0_4_1_0M1B c r*onsetP0_4_1_4M1B c r + onsetP0_4_1_1M1B c r*onsetP0_4_1_3M1B c r + onsetP0_4_1_2M1B c r*onsetP0_4_1_2M1B c r + onsetP0_4_1_3M1B c r*onsetP0_4_1_1M1B c r + onsetP0_4_1_4M1B c r*onsetP0_4_1_0M1B c r)-(onsetP0_4_0_0M1B c r*onsetP0_4_2_4M1B c r + onsetP0_4_0_1M1B c r*onsetP0_4_2_3M1B c r + onsetP0_4_0_2M1B c r*onsetP0_4_2_2M1B c r + onsetP0_4_0_3M1B c r*onsetP0_4_2_1M1B c r + onsetP0_4_0_4M1B c r*onsetP0_4_2_0M1B c r)=onsetG0_4_4M1B c r := by
 unfold onsetG0_4_4M1B onsetP0_4_0_0M1B onsetP0_4_0_1M1B onsetP0_4_0_2M1B onsetP0_4_0_3M1B onsetP0_4_0_4M1B onsetP0_4_1_0M1B onsetP0_4_1_1M1B onsetP0_4_1_2M1B onsetP0_4_1_3M1B onsetP0_4_1_4M1B onsetP0_4_2_0M1B onsetP0_4_2_1M1B onsetP0_4_2_2M1B onsetP0_4_2_3M1B onsetP0_4_2_4M1B
 ring

theorem onset_column0_4_5M1B (c r : ℤ) :
 (onsetP0_4_1_0M1B c r*onsetP0_4_1_5M1B c r + onsetP0_4_1_1M1B c r*onsetP0_4_1_4M1B c r + onsetP0_4_1_2M1B c r*onsetP0_4_1_3M1B c r + onsetP0_4_1_3M1B c r*onsetP0_4_1_2M1B c r + onsetP0_4_1_4M1B c r*onsetP0_4_1_1M1B c r + onsetP0_4_1_5M1B c r*onsetP0_4_1_0M1B c r)-(onsetP0_4_0_0M1B c r*onsetP0_4_2_5M1B c r + onsetP0_4_0_1M1B c r*onsetP0_4_2_4M1B c r + onsetP0_4_0_2M1B c r*onsetP0_4_2_3M1B c r + onsetP0_4_0_3M1B c r*onsetP0_4_2_2M1B c r + onsetP0_4_0_4M1B c r*onsetP0_4_2_1M1B c r + onsetP0_4_0_5M1B c r*onsetP0_4_2_0M1B c r)=onsetG0_4_5M1B c r := by
 unfold onsetG0_4_5M1B onsetP0_4_0_0M1B onsetP0_4_0_1M1B onsetP0_4_0_2M1B onsetP0_4_0_3M1B onsetP0_4_0_4M1B onsetP0_4_0_5M1B onsetP0_4_1_0M1B onsetP0_4_1_1M1B onsetP0_4_1_2M1B onsetP0_4_1_3M1B onsetP0_4_1_4M1B onsetP0_4_1_5M1B onsetP0_4_2_0M1B onsetP0_4_2_1M1B onsetP0_4_2_2M1B onsetP0_4_2_3M1B onsetP0_4_2_4M1B onsetP0_4_2_5M1B
 ring

theorem onset_column0_4_6M1B (c r : ℤ) :
 (onsetP0_4_1_0M1B c r*onsetP0_4_1_6M1B c r + onsetP0_4_1_1M1B c r*onsetP0_4_1_5M1B c r + onsetP0_4_1_2M1B c r*onsetP0_4_1_4M1B c r + onsetP0_4_1_3M1B c r*onsetP0_4_1_3M1B c r + onsetP0_4_1_4M1B c r*onsetP0_4_1_2M1B c r + onsetP0_4_1_5M1B c r*onsetP0_4_1_1M1B c r + onsetP0_4_1_6M1B c r*onsetP0_4_1_0M1B c r)-(onsetP0_4_0_0M1B c r*onsetP0_4_2_6M1B c r + onsetP0_4_0_1M1B c r*onsetP0_4_2_5M1B c r + onsetP0_4_0_2M1B c r*onsetP0_4_2_4M1B c r + onsetP0_4_0_3M1B c r*onsetP0_4_2_3M1B c r + onsetP0_4_0_4M1B c r*onsetP0_4_2_2M1B c r + onsetP0_4_0_5M1B c r*onsetP0_4_2_1M1B c r + onsetP0_4_0_6M1B c r*onsetP0_4_2_0M1B c r)=onsetG0_4_6M1B c r := by
 unfold onsetG0_4_6M1B onsetP0_4_0_0M1B onsetP0_4_0_1M1B onsetP0_4_0_2M1B onsetP0_4_0_3M1B onsetP0_4_0_4M1B onsetP0_4_0_5M1B onsetP0_4_0_6M1B onsetP0_4_1_0M1B onsetP0_4_1_1M1B onsetP0_4_1_2M1B onsetP0_4_1_3M1B onsetP0_4_1_4M1B onsetP0_4_1_5M1B onsetP0_4_1_6M1B onsetP0_4_2_0M1B onsetP0_4_2_1M1B onsetP0_4_2_2M1B onsetP0_4_2_3M1B onsetP0_4_2_4M1B onsetP0_4_2_5M1B onsetP0_4_2_6M1B
 ring

theorem onset_column0_4_7M1B (c r : ℤ) :
 (onsetP0_4_1_0M1B c r*onsetP0_4_1_7M1B c r + onsetP0_4_1_1M1B c r*onsetP0_4_1_6M1B c r + onsetP0_4_1_2M1B c r*onsetP0_4_1_5M1B c r + onsetP0_4_1_3M1B c r*onsetP0_4_1_4M1B c r + onsetP0_4_1_4M1B c r*onsetP0_4_1_3M1B c r + onsetP0_4_1_5M1B c r*onsetP0_4_1_2M1B c r + onsetP0_4_1_6M1B c r*onsetP0_4_1_1M1B c r + onsetP0_4_1_7M1B c r*onsetP0_4_1_0M1B c r)-(onsetP0_4_0_0M1B c r*onsetP0_4_2_7M1B c r + onsetP0_4_0_1M1B c r*onsetP0_4_2_6M1B c r + onsetP0_4_0_2M1B c r*onsetP0_4_2_5M1B c r + onsetP0_4_0_3M1B c r*onsetP0_4_2_4M1B c r + onsetP0_4_0_4M1B c r*onsetP0_4_2_3M1B c r + onsetP0_4_0_5M1B c r*onsetP0_4_2_2M1B c r + onsetP0_4_0_6M1B c r*onsetP0_4_2_1M1B c r + onsetP0_4_0_7M1B c r*onsetP0_4_2_0M1B c r)=onsetG0_4_7M1B c r := by
 unfold onsetG0_4_7M1B onsetP0_4_0_0M1B onsetP0_4_0_1M1B onsetP0_4_0_2M1B onsetP0_4_0_3M1B onsetP0_4_0_4M1B onsetP0_4_0_5M1B onsetP0_4_0_6M1B onsetP0_4_0_7M1B onsetP0_4_1_0M1B onsetP0_4_1_1M1B onsetP0_4_1_2M1B onsetP0_4_1_3M1B onsetP0_4_1_4M1B onsetP0_4_1_5M1B onsetP0_4_1_6M1B onsetP0_4_1_7M1B onsetP0_4_2_0M1B onsetP0_4_2_1M1B onsetP0_4_2_2M1B onsetP0_4_2_3M1B onsetP0_4_2_4M1B onsetP0_4_2_5M1B onsetP0_4_2_6M1B onsetP0_4_2_7M1B
 ring

theorem onset_column0_4_8M1B (c r : ℤ) :
 (onsetP0_4_1_1M1B c r*onsetP0_4_1_7M1B c r + onsetP0_4_1_2M1B c r*onsetP0_4_1_6M1B c r + onsetP0_4_1_3M1B c r*onsetP0_4_1_5M1B c r + onsetP0_4_1_4M1B c r*onsetP0_4_1_4M1B c r + onsetP0_4_1_5M1B c r*onsetP0_4_1_3M1B c r + onsetP0_4_1_6M1B c r*onsetP0_4_1_2M1B c r + onsetP0_4_1_7M1B c r*onsetP0_4_1_1M1B c r)-(onsetP0_4_0_1M1B c r*onsetP0_4_2_7M1B c r + onsetP0_4_0_2M1B c r*onsetP0_4_2_6M1B c r + onsetP0_4_0_3M1B c r*onsetP0_4_2_5M1B c r + onsetP0_4_0_4M1B c r*onsetP0_4_2_4M1B c r + onsetP0_4_0_5M1B c r*onsetP0_4_2_3M1B c r + onsetP0_4_0_6M1B c r*onsetP0_4_2_2M1B c r + onsetP0_4_0_7M1B c r*onsetP0_4_2_1M1B c r)=onsetG0_4_8M1B c r := by
 unfold onsetG0_4_8M1B onsetP0_4_0_1M1B onsetP0_4_0_2M1B onsetP0_4_0_3M1B onsetP0_4_0_4M1B onsetP0_4_0_5M1B onsetP0_4_0_6M1B onsetP0_4_0_7M1B onsetP0_4_1_1M1B onsetP0_4_1_2M1B onsetP0_4_1_3M1B onsetP0_4_1_4M1B onsetP0_4_1_5M1B onsetP0_4_1_6M1B onsetP0_4_1_7M1B onsetP0_4_2_1M1B onsetP0_4_2_2M1B onsetP0_4_2_3M1B onsetP0_4_2_4M1B onsetP0_4_2_5M1B onsetP0_4_2_6M1B onsetP0_4_2_7M1B
 ring

theorem onset_column0_4_9M1B (c r : ℤ) :
 (onsetP0_4_1_2M1B c r*onsetP0_4_1_7M1B c r + onsetP0_4_1_3M1B c r*onsetP0_4_1_6M1B c r + onsetP0_4_1_4M1B c r*onsetP0_4_1_5M1B c r + onsetP0_4_1_5M1B c r*onsetP0_4_1_4M1B c r + onsetP0_4_1_6M1B c r*onsetP0_4_1_3M1B c r + onsetP0_4_1_7M1B c r*onsetP0_4_1_2M1B c r)-(onsetP0_4_0_2M1B c r*onsetP0_4_2_7M1B c r + onsetP0_4_0_3M1B c r*onsetP0_4_2_6M1B c r + onsetP0_4_0_4M1B c r*onsetP0_4_2_5M1B c r + onsetP0_4_0_5M1B c r*onsetP0_4_2_4M1B c r + onsetP0_4_0_6M1B c r*onsetP0_4_2_3M1B c r + onsetP0_4_0_7M1B c r*onsetP0_4_2_2M1B c r)=onsetG0_4_9M1B c r := by
 unfold onsetG0_4_9M1B onsetP0_4_0_2M1B onsetP0_4_0_3M1B onsetP0_4_0_4M1B onsetP0_4_0_5M1B onsetP0_4_0_6M1B onsetP0_4_0_7M1B onsetP0_4_1_2M1B onsetP0_4_1_3M1B onsetP0_4_1_4M1B onsetP0_4_1_5M1B onsetP0_4_1_6M1B onsetP0_4_1_7M1B onsetP0_4_2_2M1B onsetP0_4_2_3M1B onsetP0_4_2_4M1B onsetP0_4_2_5M1B onsetP0_4_2_6M1B onsetP0_4_2_7M1B
 ring

theorem onset_column0_4_10M1B (c r : ℤ) :
 (onsetP0_4_1_3M1B c r*onsetP0_4_1_7M1B c r + onsetP0_4_1_4M1B c r*onsetP0_4_1_6M1B c r + onsetP0_4_1_5M1B c r*onsetP0_4_1_5M1B c r + onsetP0_4_1_6M1B c r*onsetP0_4_1_4M1B c r + onsetP0_4_1_7M1B c r*onsetP0_4_1_3M1B c r)-(onsetP0_4_0_3M1B c r*onsetP0_4_2_7M1B c r + onsetP0_4_0_4M1B c r*onsetP0_4_2_6M1B c r + onsetP0_4_0_5M1B c r*onsetP0_4_2_5M1B c r + onsetP0_4_0_6M1B c r*onsetP0_4_2_4M1B c r + onsetP0_4_0_7M1B c r*onsetP0_4_2_3M1B c r)=onsetG0_4_10M1B c r := by
 unfold onsetG0_4_10M1B onsetP0_4_0_3M1B onsetP0_4_0_4M1B onsetP0_4_0_5M1B onsetP0_4_0_6M1B onsetP0_4_0_7M1B onsetP0_4_1_3M1B onsetP0_4_1_4M1B onsetP0_4_1_5M1B onsetP0_4_1_6M1B onsetP0_4_1_7M1B onsetP0_4_2_3M1B onsetP0_4_2_4M1B onsetP0_4_2_5M1B onsetP0_4_2_6M1B onsetP0_4_2_7M1B
 ring

theorem onset_column0_4_11M1B (c r : ℤ) :
 (onsetP0_4_1_4M1B c r*onsetP0_4_1_7M1B c r + onsetP0_4_1_5M1B c r*onsetP0_4_1_6M1B c r + onsetP0_4_1_6M1B c r*onsetP0_4_1_5M1B c r + onsetP0_4_1_7M1B c r*onsetP0_4_1_4M1B c r)-(onsetP0_4_0_4M1B c r*onsetP0_4_2_7M1B c r + onsetP0_4_0_5M1B c r*onsetP0_4_2_6M1B c r + onsetP0_4_0_6M1B c r*onsetP0_4_2_5M1B c r + onsetP0_4_0_7M1B c r*onsetP0_4_2_4M1B c r)=onsetG0_4_11M1B c r := by
 unfold onsetG0_4_11M1B onsetP0_4_0_4M1B onsetP0_4_0_5M1B onsetP0_4_0_6M1B onsetP0_4_0_7M1B onsetP0_4_1_4M1B onsetP0_4_1_5M1B onsetP0_4_1_6M1B onsetP0_4_1_7M1B onsetP0_4_2_4M1B onsetP0_4_2_5M1B onsetP0_4_2_6M1B onsetP0_4_2_7M1B
 ring

theorem onset_column0_4_12M1B (c r : ℤ) :
 (onsetP0_4_1_5M1B c r*onsetP0_4_1_7M1B c r + onsetP0_4_1_6M1B c r*onsetP0_4_1_6M1B c r + onsetP0_4_1_7M1B c r*onsetP0_4_1_5M1B c r)-(onsetP0_4_0_5M1B c r*onsetP0_4_2_7M1B c r + onsetP0_4_0_6M1B c r*onsetP0_4_2_6M1B c r + onsetP0_4_0_7M1B c r*onsetP0_4_2_5M1B c r)=onsetG0_4_12M1B c r := by
 unfold onsetG0_4_12M1B onsetP0_4_0_5M1B onsetP0_4_0_6M1B onsetP0_4_0_7M1B onsetP0_4_1_5M1B onsetP0_4_1_6M1B onsetP0_4_1_7M1B onsetP0_4_2_5M1B onsetP0_4_2_6M1B onsetP0_4_2_7M1B
 ring

theorem onset_column0_4_13M1B (c r : ℤ) :
 (onsetP0_4_1_6M1B c r*onsetP0_4_1_7M1B c r + onsetP0_4_1_7M1B c r*onsetP0_4_1_6M1B c r)-(onsetP0_4_0_6M1B c r*onsetP0_4_2_7M1B c r + onsetP0_4_0_7M1B c r*onsetP0_4_2_6M1B c r)=onsetG0_4_13M1B c r := by
 unfold onsetG0_4_13M1B onsetP0_4_0_6M1B onsetP0_4_0_7M1B onsetP0_4_1_6M1B onsetP0_4_1_7M1B onsetP0_4_2_6M1B onsetP0_4_2_7M1B
 ring

theorem onset_column0_4_14M1B (c r : ℤ) :
 (onsetP0_4_1_7M1B c r*onsetP0_4_1_7M1B c r)-(onsetP0_4_0_7M1B c r*onsetP0_4_2_7M1B c r)=onsetG0_4_14M1B c r := by
 unfold onsetG0_4_14M1B onsetP0_4_0_7M1B onsetP0_4_1_7M1B onsetP0_4_2_7M1B
 ring

attribute [local irreducible] onsetP0_4_0_0M1B onsetP0_4_0_1M1B onsetP0_4_0_2M1B onsetP0_4_0_3M1B onsetP0_4_0_4M1B onsetP0_4_0_5M1B onsetP0_4_0_6M1B onsetP0_4_0_7M1B onsetP0_4_1_0M1B onsetP0_4_1_1M1B onsetP0_4_1_2M1B onsetP0_4_1_3M1B onsetP0_4_1_4M1B onsetP0_4_1_5M1B onsetP0_4_1_6M1B onsetP0_4_1_7M1B onsetP0_4_2_0M1B onsetP0_4_2_1M1B onsetP0_4_2_2M1B onsetP0_4_2_3M1B onsetP0_4_2_4M1B onsetP0_4_2_5M1B onsetP0_4_2_6M1B onsetP0_4_2_7M1B onsetG0_4_0M1B onsetG0_4_1M1B onsetG0_4_2M1B onsetG0_4_3M1B onsetG0_4_4M1B onsetG0_4_5M1B onsetG0_4_6M1B onsetG0_4_7M1B onsetG0_4_8M1B onsetG0_4_9M1B onsetG0_4_10M1B onsetG0_4_11M1B onsetG0_4_12M1B onsetG0_4_13M1B onsetG0_4_14M1B

theorem onset_columns_lc0_4M1B (n c r : ℤ) (hn : 0≤n) (hc : 0≤c) (hr : 0≤r) :
 onsetValue0_4M1B (n+7) (5 + 4*r + 1*c) (1 + 1*r)*
 onsetValue0_6M1B (n+7) (5 + 4*r + 1*c) (1 + 1*r)≤
 onsetValue0_5M1B (n+7) (5 + 4*r + 1*c) (1 + 1*r)^2 := by
 apply sub_nonneg.mp
 rw [onset_stage0_4_0M1B,onset_stage0_4_1M1B,onset_stage0_4_2M1B]
 have hgap : (onsetP0_4_1_0M1B c r*n^0 + onsetP0_4_1_1M1B c r*n^1 + onsetP0_4_1_2M1B c r*n^2 + onsetP0_4_1_3M1B c r*n^3 + onsetP0_4_1_4M1B c r*n^4 + onsetP0_4_1_5M1B c r*n^5 + onsetP0_4_1_6M1B c r*n^6 + onsetP0_4_1_7M1B c r*n^7)^2-(onsetP0_4_0_0M1B c r*n^0 + onsetP0_4_0_1M1B c r*n^1 + onsetP0_4_0_2M1B c r*n^2 + onsetP0_4_0_3M1B c r*n^3 + onsetP0_4_0_4M1B c r*n^4 + onsetP0_4_0_5M1B c r*n^5 + onsetP0_4_0_6M1B c r*n^6 + onsetP0_4_0_7M1B c r*n^7)*(onsetP0_4_2_0M1B c r*n^0 + onsetP0_4_2_1M1B c r*n^1 + onsetP0_4_2_2M1B c r*n^2 + onsetP0_4_2_3M1B c r*n^3 + onsetP0_4_2_4M1B c r*n^4 + onsetP0_4_2_5M1B c r*n^5 + onsetP0_4_2_6M1B c r*n^6 + onsetP0_4_2_7M1B c r*n^7)=onsetG0_4_0M1B c r*n^0 + onsetG0_4_1M1B c r*n^1 + onsetG0_4_2M1B c r*n^2 + onsetG0_4_3M1B c r*n^3 + onsetG0_4_4M1B c r*n^4 + onsetG0_4_5M1B c r*n^5 + onsetG0_4_6M1B c r*n^6 + onsetG0_4_7M1B c r*n^7 + onsetG0_4_8M1B c r*n^8 + onsetG0_4_9M1B c r*n^9 + onsetG0_4_10M1B c r*n^10 + onsetG0_4_11M1B c r*n^11 + onsetG0_4_12M1B c r*n^12 + onsetG0_4_13M1B c r*n^13 + onsetG0_4_14M1B c r*n^14 := by
  rw [←onset_column0_4_0M1B,←onset_column0_4_1M1B,←onset_column0_4_2M1B,←onset_column0_4_3M1B,←onset_column0_4_4M1B,←onset_column0_4_5M1B,←onset_column0_4_6M1B,←onset_column0_4_7M1B,←onset_column0_4_8M1B,←onset_column0_4_9M1B,←onset_column0_4_10M1B,←onset_column0_4_11M1B,←onset_column0_4_12M1B,←onset_column0_4_13M1B,←onset_column0_4_14M1B]
  ring
 rw [hgap]
 have h0 := onsetG0_4_0M1B_nonneg c r hc hr
 have h1 := onsetG0_4_1M1B_nonneg c r hc hr
 have h2 := onsetG0_4_2M1B_nonneg c r hc hr
 have h3 := onsetG0_4_3M1B_nonneg c r hc hr
 have h4 := onsetG0_4_4M1B_nonneg c r hc hr
 have h5 := onsetG0_4_5M1B_nonneg c r hc hr
 have h6 := onsetG0_4_6M1B_nonneg c r hc hr
 have h7 := onsetG0_4_7M1B_nonneg c r hc hr
 have h8 := onsetG0_4_8M1B_nonneg c r hc hr
 have h9 := onsetG0_4_9M1B_nonneg c r hc hr
 have h10 := onsetG0_4_10M1B_nonneg c r hc hr
 have h11 := onsetG0_4_11M1B_nonneg c r hc hr
 have h12 := onsetG0_4_12M1B_nonneg c r hc hr
 have h13 := onsetG0_4_13M1B_nonneg c r hc hr
 have h14 := onsetG0_4_14M1B_nonneg c r hc hr
 positivity
end
end MathGKM.Markov
