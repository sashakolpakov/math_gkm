import MarkovOnsetValues2M1B
/-! Machine-authored 1b02dddc. Column-wise exact onset gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false

def onsetP2_5_0_0M1B (c r : ℤ) : ℤ :=
 3977043840 + 10287133920*r + 9657960480*r^2 + 3942328320*r^3 + 595123200*r^4 + 14062023360*c + 25944770880*c*r + 15599969280*c*r^2 + 3083028480*c*r^3 + 17379230400*c^2 + 20517719040*c^2*r + 5971553280*c^2*r^2 + 8968458240*c^3 + 5124833280*c^3*r + 1644088320*c^4

def onsetP2_5_0_1M1B (c r : ℤ) : ℤ :=
 3337056000 + 8672196960*r + 8176712256*r^2 + 3347769600*r^3 + 506289024*r^4 + 12016146912*c + 22326640032*c*r + 13494515328*c*r^2 + 2676337920*c*r^3 + 15209282784*c^2 + 18087560064*c^2*r + 5291190144*c^2*r^2 + 8060763648*c^3 + 4636363776*c^3*r + 1519080576*c^4

def onsetP2_5_0_2M1B (c r : ℤ) : ℤ :=
 1215250176 + 3167964800*r + 2994073600*r^2 + 1226673280*r^3 + 185314304*r^4 + 4448101056*c + 8306740288*c*r + 5036802624*c*r^2 + 1000071296*c*r^3 + 5752313952*c^2 + 6880168512*c^2*r + 2019221568*c^2*r^2 + 3126232704*c^3 + 1807639680*c^3*r + 605318112*c^4

def onsetP2_5_0_3M1B (c r : ℤ) : ℤ :=
 249271680 + 650697152*r + 615169856*r^2 + 251590528*r^3 + 37846144*r^4 + 925659168*c + 1733695488*c*r + 1052243136*c*r^2 + 208583424*c*r^3 + 1220036496*c^2 + 1464712704*c^2*r + 430282944*c^2*r^2 + 678535872*c^3 + 393726144*c^3*r + 134826384*c^4

def onsetP2_5_0_4M1B (c r : ℤ) : ℤ :=
 31140480 + 81240320*r + 76652800*r^2 + 31212160*r^3 + 4659200*r^4 + 117082560*c + 219405760*c*r + 132955200*c*r^2 + 26230400*c*r^3 + 156871680*c^2 + 188576640*c^2*r + 55298880*c^2*r^2 + 89053440*c^3 + 51737280*c^3*r + 18123840*c^4

def onsetP2_5_0_5M1B (c r : ℤ) : ℤ :=
 2372160 + 6171200*r + 5796224*r^2 + 2343040*r^3 + 345856*r^4 + 9010848*c + 16849728*c*r + 10164672*c*r^2 + 1989120*c*r^3 + 12239136*c^2 + 14688576*c^2*r + 4286016*c^2*r^2 + 7070112*c^3 + 4100544*c^3*r + 1469664*c^4

def onsetP2_5_0_6M1B (c r : ℤ) : ℤ :=
 102144 + 264320*r + 246400*r^2 + 98560*r^3 + 14336*r^4 + 391104*c + 727552*c*r + 435456*c*r^2 + 84224*c*r^3 + 536928*c^2 + 641088*c^2*r + 185472*c^2*r^2 + 314496*c^3 + 181440*c^3*r + 66528*c^4

def onsetP2_5_0_7M1B (c r : ℤ) : ℤ :=
 1920 + 4928*r + 4544*r^2 + 1792*r^3 + 256*r^4 + 7392*c + 13632*c*r + 8064*c*r^2 + 1536*c*r^3 + 10224*c^2 + 12096*c^2*r + 3456*c^2*r^2 + 6048*c^3 + 3456*c^3*r + 1296*c^4

def onsetP2_5_1_0M1B (c r : ℤ) : ℤ :=
 1634683680 + 4207775040*r + 3931643520*r^2 + 1598607360*r^3 + 240629760*r^4 + 5677348320*c + 10395020160*c*r + 6213231360*c*r^2 + 1222502400*c*r^3 + 6847384320*c^2 + 8020131840*c^2*r + 2320496640*c^2*r^2 + 3437683200*c^3 + 1950197760*c^3*r + 612218880*c^4

def onsetP2_5_1_1M1B (c r : ℤ) : ℤ :=
 1541039904 + 3992732352*r + 3755058432*r^2 + 1535482368*r^3 + 232207104*r^4 + 5471442144*c + 10116692352*c*r + 6094085760*c*r^2 + 1206475008*c*r^3 + 6795323328*c^2 + 8036735616*c^2*r + 2342741760*c^2*r^2 + 3521198016*c^3 + 2014752000*c^3*r + 647386368*c^4

def onsetP2_5_1_2M1B (c r : ℤ) : ℤ :=
 632048256 + 1645464576*r + 1554119168*r^2 + 637185024*r^3 + 96482176*r^4 + 2289221760*c + 4264218112*c*r + 2582520192*c*r^2 + 513043328*c*r^3 + 2918882400*c^2 + 3479966784*c^2*r + 1020015360*c^2*r^2 + 1558835040*c^3 + 898528512*c^3*r + 295856064*c^4

def onsetP2_5_1_3M1B (c r : ℤ) : ℤ :=
 146455680 + 382333952*r + 361751936*r^2 + 148263808*r^3 + 22390144*r^4 + 539874048*c + 1010495808*c*r + 613642176*c*r^2 + 121922304*c*r^3 + 704560416*c^2 + 844893504*c^2*r + 248359104*c^2*r^2 + 386944992*c^3 + 224274624*c^3*r + 75742464*c^4

def onsetP2_5_1_4M1B (c r : ℤ) : ℤ :=
 20744640 + 54176640*r + 51208640*r^2 + 20912640*r^3 + 3136000*r^4 + 77636160*c + 145593280*c*r + 88381440*c*r^2 + 17494400*c*r^3 + 103372080*c^2 + 124326720*c^2*r + 36529920*c^2*r^2 + 58208640*c^3 + 33835200*c^3*r + 11728080*c^4

def onsetP2_5_1_5M1B (c r : ℤ) : ℤ :=
 1799616 + 4688768*r + 4413248*r^2 + 1789312*r^3 + 265216*r^4 + 6819456*c + 12770688*c*r + 7721280*c*r^2 + 1516032*c*r^3 + 9232272*c^2 + 11096064*c^2*r + 3245760*c^2*r^2 + 5310144*c^3 + 3084480*c^3*r + 1097712*c^4

def onsetP2_5_1_6M1B (c r : ℤ) : ℤ :=
 88704 + 229824*r + 214592*r^2 + 86016*r^3 + 12544*r^4 + 339360*c + 632128*c*r + 379008*c*r^2 + 73472*c*r^3 + 465360*c^2 + 556416*c^2*r + 161280*c^2*r^2 + 272160*c^3 + 157248*c^3*r + 57456*c^4

def onsetP2_5_1_7M1B (c r : ℤ) : ℤ :=
 1920 + 4928*r + 4544*r^2 + 1792*r^3 + 256*r^4 + 7392*c + 13632*c*r + 8064*c*r^2 + 1536*c*r^3 + 10224*c^2 + 12096*c^2*r + 3456*c^2*r^2 + 6048*c^3 + 3456*c^3*r + 1296*c^4

def onsetP2_5_2_0M1B (c r : ℤ) : ℤ :=
 598268160 + 1527886080*r + 1415957760*r^2 + 571253760*r^3 + 85397760*r^4 + 2026402560*c + 3665491200*c*r + 2169054720*c*r^2 + 423198720*c*r^3 + 2360977920*c^2 + 2732244480*c^2*r + 782853120*c^2*r^2 + 1141539840*c^3 + 640604160*c^3*r + 195632640*c^4

def onsetP2_5_2_1M1B (c r : ℤ) : ℤ :=
 641811168 + 1654197888*r + 1548051840*r^2 + 630696192*r^3 + 95121792*r^4 + 2234188992*c + 4097526528*c*r + 2452834944*c*r^2 + 483327744*c*r^3 + 2701192224*c^2 + 3166402176*c^2*r + 916953984*c^2*r^2 + 1356488448*c^3 + 769681152*c^3*r + 241142208*c^4

def onsetP2_5_2_2M1B (c r : ℤ) : ℤ :=
 300443136 + 779978752*r + 735106176*r^2 + 301228928*r^3 + 45658368*r^4 + 1072157184*c + 1987779136*c*r + 1200185280*c*r^2 + 238152320*c*r^3 + 1339876608*c^2 + 1588378176*c^2*r + 464006592*c^2*r^2 + 698105856*c^3 + 400157184*c^3*r + 128854656*c^4

def onsetP2_5_2_3M1B (c r : ℤ) : ℤ :=
 79766400 + 208091072*r + 196917056*r^2 + 80848768*r^3 + 12256384*r^4 + 290995488*c + 543664128*c*r + 330031296*c*r^2 + 65689344*c*r^3 + 374445456*c^2 + 447842304*c^2*r + 131592384*c^2*r^2 + 201980352*c^3 + 116754624*c^3*r + 38703504*c^4

def onsetP2_5_2_4M1B (c r : ℤ) : ℤ :=
 13009920 + 34007680*r + 32202240*r^2 + 13193600*r^3 + 1989120*r^4 + 48370560*c + 90744640*c*r + 55177920*c*r^2 + 10962560*c*r^3 + 63833280*c^2 + 76769280*c^2*r + 22599360*c^2*r^2 + 35528640*c^3 + 20650560*c^3*r + 7056000*c^4

def onsetP2_5_2_5M1B (c r : ℤ) : ℤ :=
 1307712 + 3413312*r + 3221120*r^2 + 1310848*r^3 + 195328*r^4 + 4938528*c + 9264192*c*r + 5616576*c*r^2 + 1107456*c*r^3 + 6654816*c^2 + 8011584*c^2*r + 2350656*c^2*r^2 + 3804192*c^3 + 2213568*c^3*r + 780192*c^4

def onsetP2_5_2_6M1B (c r : ℤ) : ℤ :=
 75264 + 195328*r + 182784*r^2 + 73472*r^3 + 10752*r^4 + 287616*c + 536704*c*r + 322560*c*r^2 + 62720*c*r^3 + 393792*c^2 + 471744*c^2*r + 137088*c^2*r^2 + 229824*c^3 + 133056*c^3*r + 48384*c^4

def onsetP2_5_2_7M1B (c r : ℤ) : ℤ :=
 1920 + 4928*r + 4544*r^2 + 1792*r^3 + 256*r^4 + 7392*c + 13632*c*r + 8064*c*r^2 + 1536*c*r^3 + 10224*c^2 + 12096*c^2*r + 3456*c^2*r^2 + 6048*c^3 + 3456*c^3*r + 1296*c^4

def onsetG2_5_0M1B (c r : ℤ) : ℤ :=
 292852033262208000 + 1525827769320960000*r + 3432412730396160000*r^2 + 4360496425334784000*r^3 + 3426757668917452800*r^4 + 1708245069898752000*r^5 + 528178984381440000*r^6 + 92712637366272000*r^7 + 7080493193625600*r^8 + 2089384628686387200*c + 9332354933746790400*c*r + 17646177311555788800*c*r^2 + 18339811376547225600*c*r^3 + 11331838514574950400*c*r^4 + 4168238713583616000*c*r^5 + 846142281724723200*c*r^6 + 73201815532339200*c*r^7 + 6336425721570739200*c^2 + 23776256045432217600*c^2*r + 36763460555880038400*c^2*r^2 + 30031220276073676800*c^2*r^3 + 13688826432480460800*c^2*r^4 + 3305401191648460800*c^2*r^5 + 330688182937190400*c^2*r^6 + 10666080344250777600*c^3 + 32713285695893913600*c^3*r + 39743665388885606400*c^3*r^2 + 23945447877790924800*c^3*r^3 + 7164378865218355200*c^3*r^4 + 852576811823923200*c^3*r^5 + 10902399175522713600*c^4 + 26264857873301913600*c^4*r + 23530855069196697600*c^4*r^2 + 9305152374531686400*c^4*r^3 + 1372083851722752000*c^4*r^4 + 6933844435901644800*c^5 + 12316232271148646400*c^5*r + 7241900211044352000*c^5*r^2 + 1411422130195660800*c^5*r^3 + 2682408371495731200*c^6 + 3127056618199449600*c^6*r + 906275088669081600*c^6*r^2 + 577913637018009600*c^7 + 332101295485747200*c^7*r + 53174618593689600*c^8

theorem onsetG2_5_0M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_0M1B c r := by
 unfold onsetG2_5_0M1B
 positivity

def onsetG2_5_1M1B (c r : ℤ) : ℤ :=
 489260057520568320 + 2554251630058920960*r + 5756005554331898880*r^2 + 7322523911979171840*r^3 + 5759944480017100800*r^4 + 2872791893733027840*r^5 + 888377272781967360*r^6 + 155926674485084160*r^7 + 11906745604669440*r^8 + 3524466848027166720*c + 15780535478708797440*c*r + 29902153909293066240*c*r^2 + 31130679811115888640*c*r^3 + 19259519941275586560*c*r^4 + 7090556911795445760*c*r^5 + 1440234246762823680*c*r^6 + 124658189375569920*c*r^7 + 10805501090969948160*c^2 + 40660841015480448000*c^2*r + 63025609460466723840*c^2*r^2 + 51588373239012556800*c^2*r^3 + 23552782441015726080*c^2*r^4 + 5694455361218641920*c^2*r^5 + 570308421496504320*c^2*r^6 + 18410821280670873600*c^3 + 56647421019936552960*c^3*r + 69011850618918789120*c^3*r^2 + 41675839736161075200*c^3*r^3 + 12493237435791114240*c^3*r^4 + 1489154000580771840*c^3*r^5 + 19071366602117437440*c^4 + 46105339282335406080*c^4*r + 41430665933738403840*c^4*r^2 + 16425499371353210880*c^4*r^3 + 2427306380616499200*c^4*r^4 + 12305933173106012160*c^5 + 21939285643611033600*c^5*r + 12941256336777216000*c^5*r^2 + 2529073923489792000*c^5*r^3 + 4834678267941580800*c^6 + 5657421120557875200*c^6*r + 1644932082831851520*c^6*r^2 + 1058606187123179520*c^7 + 610610488533319680*c^7*r + 99043483201044480*c^8

theorem onsetG2_5_1M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_1M1B c r := by
 unfold onsetG2_5_1M1B
 positivity

def onsetG2_5_2M1B (c r : ℤ) : ℤ :=
 377521104755966976 + 1973753075823492096*r + 4453129031503767552*r^2 + 5669675316716027904*r^3 + 4461427904851685376*r^4 + 2224908065781080064*r^5 + 687641984946782208*r^6 + 120579772834676736*r^7 + 9196205097074688*r^8 + 2744135575114945536*c + 12309475027862154240*c*r + 23360800473408448512*c*r^2 + 24347842324406415360*c*r^3 + 15073102229308655616*c*r^4 + 5550383003307835392*c*r^5 + 1127146157221625856*c*r^6 + 97504269359874048*c*r^7 + 8499453294337818624*c^2 + 32055400953745247232*c^2*r + 49779903080251072512*c^2*r^2 + 40804078900084899840*c^2*r^3 + 18646746614838429696*c^2*r^4 + 4510524250849591296*c^2*r^5 + 451780919066050560*c^2*r^6 + 14648397377542290432*c^3 + 45188900078409464832*c^3*r + 55171640164212117504*c^3*r^2 + 33373706894462140416*c^3*r^3 + 10016415433894625280*c^3*r^4 + 1194815730101059584*c^3*r^5 + 15367322615289523200*c^4 + 37258935108983175168*c^4*r + 33561594003912339456*c^4*r^2 + 13330708380372418560*c^4*r^3 + 1972681098698096640*c^4*r^4 + 10053744925308069888*c^5 + 17979819565712836608*c^5*r + 10632690005859016704*c^5*r^2 + 2082055172942610432*c^5*r^3 + 4008799939399686144*c^6 + 4705999905513037824*c^6*r + 1371842184179884032*c^6*r^2 + 891597735054802944*c^7 + 515908173601013760*c^7*r + 84783586334662656*c^8

theorem onsetG2_5_2M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_2M1B c r := by
 unfold onsetG2_5_2M1B
 positivity

def onsetG2_5_3M1B (c r : ℤ) : ℤ :=
 177918103766753280 + 931008075875426304*r + 2101775616056395776*r^2 + 2676543446072832000*r^3 + 2105638303378692096*r^4 + 1049281827252707328*r^5 + 323876892158668800*r^6 + 56688935826259968*r^7 + 4313369666715648*r^8 + 1304148605575366656*c + 5857442941057354752*c*r + 11126517265512090624*c*r^2 + 11602424687737626624*c*r^3 + 7182775633980291072*c*r^4 + 2643523385205276672*c*r^5 + 536260808785379328*c*r^6 + 46315282010898432*c*r^7 + 4078081152865262592*c^2 + 15405546391766641152*c^2*r + 23953500166759951872*c^2*r^2 + 19649397813437048832*c^2*r^3 + 8981503201443440640*c^2*r^4 + 2171866967191240704*c^2*r^5 + 217347125780692992*c^2*r^6 + 7104283887584185344*c^3 + 21959506607094819840*c^3*r + 26851268158248210432*c^3*r^2 + 16258474531056844800*c^3*r^3 + 4881658851791339520*c^3*r^4 + 582216814315143168*c^3*r^5 + 7542494798807743488*c^4 + 18328654641437102592*c^4*r + 16538320292670328320*c^4*r^2 + 6576515013859983360*c^4*r^3 + 973712214984499200*c^4*r^4 + 4999516622131497984*c^5 + 8962973155897850880*c^5*r + 5310211462885711872*c^5*r^2 + 1041088302983135232*c^5*r^3 + 2021826549381746688*c^6 + 2379496979771154432*c^6*r + 694947771537481728*c^6*r^2 + 456462526345814016*c^7 + 264791121748328448*c^7*r + 44091526964631552*c^8

theorem onsetG2_5_3M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_3M1B c r := by
 unfold onsetG2_5_3M1B
 positivity

def onsetG2_5_4M1B (c r : ℤ) : ℤ :=
 57039695341977600 + 298566444307998720*r + 674021131464368128*r^2 + 858002628158240768*r^3 + 674394987118125056*r^4 + 335580256614170624*r^5 + 103369175302529024*r^6 + 18043930158399488*r^7 + 1368270011809792*r^8 + 421370280005391360*c + 1893759820629003264*c*r + 3598351772684261376*c*r^2 + 3751677259023568896*c*r^3 + 2320972873469429760*c*r^4 + 853104664885272576*c*r^5 + 172725104806969344*c*r^6 + 14878736950984704*c*r^7 + 1329371928293810688*c^2 + 5026868661604253184*c^2*r + 7820576949010861056*c^2*r^2 + 6415745384864471040*c^2*r^3 + 2931034931664107520*c^2*r^4 + 707946710197321728*c^2*r^5 + 70716232567013376*c^2*r^6 + 2339181363662664192*c^3 + 7239915220780279296*c^3*r + 8859929767342295040*c^3*r^2 + 5365990513371156480*c^3*r^3 + 1610513207287971840*c^3*r^4 + 191871284730789888*c^3*r^5 + 2511401033098492416*c^4 + 6112403973781701120*c^4*r + 5520844921882752000*c^4*r^2 + 2196159714992517120*c^4*r^3 + 325051419733770240*c^4*r^4 + 1685290334073647616*c^5 + 3026611815278317056*c^5*r + 1795117873878669312*c^5*r^2 + 352079630519758848*c^5*r^3 + 690694370867257344*c^6 + 814368923690305536*c^6*r + 238107129392756736*c^6*r^2 + 158174991496876032*c^7 + 91923115232600064*c^7*r + 15509959926193152*c^8

theorem onsetG2_5_4M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_4M1B c r := by
 unfold onsetG2_5_4M1B
 positivity

def onsetG2_5_5M1B (c r : ℤ) : ℤ :=
 13105104046755840 + 68577193356134400*r + 154719428266045440*r^2 + 196747683450501120*r^3 + 154405091460157440*r^4 + 76666992268554240*r^5 + 23548939144765440*r^6 + 4095917082378240*r^7 + 309223239843840*r^8 + 97510041713387520*c + 438244101323320320*c*r + 832408680511349760*c*r^2 + 867147825156372480*c*r^3 + 535703437398743040*c*r^4 + 196497999391088640*c*r^5 + 39672893472522240*c*r^6 + 3405155024732160*c*r^7 + 310168589826170880*c^2 + 1173236827466511360*c^2*r + 1825038753475875840*c^2*r^2 + 1496201139851120640*c^2*r^3 + 682649875431659520*c^2*r^4 + 164551242461921280*c^2*r^5 + 16390835167150080*c^2*r^6 + 550872986596853760*c^3 + 1705998775522728960*c^3*r + 2087895336303651840*c^3*r^2 + 1263847003203133440*c^3*r^3 + 378853392940646400*c^3*r^4 + 45044680599797760*c^3*r^5 + 597613829795136000*c^4 + 1455707510138004480*c^4*r + 1315118193432099840*c^4*r^2 + 522903413586677760*c^4*r^3 + 77299599747686400*c^4*r^4 + 405666773609932800*c^5 + 729253138777067520*c^5*r + 432659041434224640*c^5*r^2 + 84819824116715520*c^5*r^3 + 168351964943016960*c^6 + 198707387797739520*c^6*r + 58116467427379200*c^6*r^2 + 39076486055147520*c^7 + 22733179613061120*c^7*r + 3886799364241920*c^8

theorem onsetG2_5_5M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_5M1B c r := by
 unfold onsetG2_5_5M1B
 positivity

def onsetG2_5_6M1B (c r : ℤ) : ℤ :=
 2212479109306368 + 11567407964356608*r + 26065210259142656*r^2 + 33089435899727872*r^3 + 25909959326261248*r^4 + 12828006419587072*r^5 + 3925967828844544*r^6 + 679813371854848*r^7 + 51047131971584*r^8 + 16571339025712128*c + 74430320329559040*c*r + 141226942535110656*c*r^2 + 146892573777868800*c*r^3 + 90550769303543808*c*r^4 + 33119191222419456*c*r^5 + 6662256097394688*c*r^6 + 569222363480064*c*r^7 + 53111219963784192*c^2 + 200820725698553856*c^2*r + 312121622730387456*c^2*r^2 + 255517158617118720*c^2*r^3 + 116335443517267968*c^2*r^4 + 27961686646161408*c^2*r^5 + 2774828985384960*c^2*r^6 + 95138847120393216*c^3 + 294591387081148416*c^3*r + 360286135813804032*c^3*r^2 + 217795044289794048*c^3*r^3 + 65150000378265600*c^3*r^4 + 7723477264269312*c^3*r^5 + 104207047219296000*c^4 + 253845237532207104*c^4*r + 229195195654699008*c^4*r^2 + 91010701553909760*c^4*r^3 + 13425324837765120*c^4*r^4 + 71493857626512384*c^5 + 128544886377944064*c^5*r + 76223974206062592*c^5*r^2 + 14923367125180416*c^5*r^3 + 30017862126024192*c^6 + 35439048245164032*c^6*r + 10359382526631936*c^6*r^2 + 7055917126659072*c^7 + 4105847652802560*c^7*r + 711352480866048*c^8

theorem onsetG2_5_6M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_6M1B c r := by
 unfold onsetG2_5_6M1B
 positivity

def onsetG2_5_7M1B (c r : ℤ) : ℤ :=
 276532047912960 + 1443643176148992*r + 3246888109344768*r^2 + 4112108923023360*r^3 + 3210385176004608*r^4 + 1583682128953344*r^5 + 482540369633280*r^6 + 83113247637504*r^7 + 6201772867584*r^8 + 2083747592521728*c + 9347121317108736*c*r + 17704778563648512*c*r^2 + 18373007302981632*c*r^3 + 11292729556340736*c*r^4 + 4115168620609536*c*r^5 + 824064533397504*c*r^6 + 70023005208576*c*r^7 + 6724670664047616*c^2 + 25399064156530176*c^2*r + 39412694621938176*c^2*r^2 + 32193590817540096*c^2*r^3 + 14614622208184320*c^2*r^4 + 3499534772600832*c^2*r^5 + 345666266136576*c^2*r^6 + 12140673060805632*c^3 + 37558393269626880*c^3*r + 45865384156118016*c^3*r^2 + 27665506516193280*c^3*r^3 + 8251192096358400*c^3*r^4 + 974413909131264*c^3*r^5 + 13415366655581184*c^4 + 32654359372110336*c^4*r + 29441472319526400*c^4*r^2 + 11665380472381440*c^4*r^3 + 1715588569497600*c^4*r^4 + 9294436341292032*c^5 + 16700187233479680*c^5*r + 9888982225145856*c^5*r^2 + 1931793993916416*c^5*r^3 + 3944653009403904*c^6 + 4654205304569856*c^6*r + 1358567810740224*c^6*r^2 + 938146915012608*c^7 + 545571110375424*c^7*r + 95781532686336*c^8

theorem onsetG2_5_7M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_7M1B c r := by
 unfold onsetG2_5_7M1B
 positivity

def onsetG2_5_8M1B (c r : ℤ) : ℤ :=
 25394206924800 + 132295008061440*r + 296790542168064*r^2 + 374726895642624*r^3 + 291476882178048*r^4 + 143152697597952*r^5 + 43390517624832*r^6 + 7427844931584*r^7 + 550297337856*r^8 + 192402209018880*c + 861377474829312*c*r + 1627578804031488*c*r^2 + 1683886759446528*c*r^3 + 1031135956623360*c*r^4 + 374066867478528*c*r^5 + 74504842739712*c*r^6 + 6290710659072*c*r^7 + 624816681721344*c^2 + 2355631679181312*c^2*r + 3646657584718848*c^2*r^2 + 2969722774609920*c^2*r^3 + 1343063842283520*c^2*r^4 + 320120694964224*c^2*r^5 + 31444484456448*c^2*r^6 + 1136078312173056*c^3 + 3508597328721408*c^3*r + 4274702759577600*c^3*r^2 + 2570650551705600*c^3*r^3 + 763748685987840*c^3*r^4 + 89765817974784*c^3*r^5 + 1265432806165248*c^4 + 3075263234588160*c^4*r + 2766356083491840*c^4*r^2 + 1092732686438400*c^4*r^3 + 160070978027520*c^4*r^4 + 884568024119808*c^5 + 1586951773521408*c^5*r + 937560934066176*c^5*r^2 + 182576312561664*c^5*r^3 + 379136542966272*c^6 + 446661662404608*c^6*r + 130077329614848*c^6*r^2 + 91146983187456*c^7 + 52925022646272*c^7*r + 9415290721536*c^8

theorem onsetG2_5_8M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_8M1B c r := by
 unfold onsetG2_5_8M1B
 positivity

def onsetG2_5_9M1B (c r : ℤ) : ℤ :=
 1670881443840 + 8681219850240*r + 19413177262080*r^2 + 24418517975040*r^3 + 18909440040960*r^4 + 9238859857920*r^5 + 2783512166400*r^6 + 473191219200*r^7 + 34777989120*r^8 + 12721900584960*c + 56805503139840*c*r + 106993736908800*c*r^2 + 110274716590080*c*r^3 + 67222454476800*c*r^4 + 24256727040000*c*r^5 + 4801333985280*c*r^6 + 402479185920*c*r^7 + 41546233128960*c^2 + 156232466288640*c^2*r + 241093899755520*c^2*r^2 + 195585919119360*c^2*r^3 + 88046446387200*c^2*r^4 + 20871128678400*c^2*r^5 + 2036944896000*c^2*r^6 + 76024951511040*c^3 + 234203510446080*c^3*r + 284443078563840*c^3*r^2 + 170387957698560*c^3*r^3 + 50383636316160*c^3*r^4 + 5888328499200*c^3*r^5 + 85292119503360*c^4 + 206768776919040*c^4*r + 185410365880320*c^4*r^2 + 72947897487360*c^4*r^3 + 10633977446400*c^4*r^4 + 60102631895040*c^5 + 107564779284480*c^5*r + 63344954050560*c^5*r^2 + 12285313044480*c^5*r^3 + 25991645783040*c^6 + 30546373294080*c^6*r + 8866644756480*c^6*r^2 + 6310262568960*c^7 + 3655043481600*c^7*r + 658866700800*c^8

theorem onsetG2_5_9M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_9M1B c r := by
 unfold onsetG2_5_9M1B
 positivity

def onsetG2_5_10M1B (c r : ℤ) : ℤ :=
 74775085056 + 387205840896*r + 862517153792*r^2 + 1080012365824*r^3 + 831997874176*r^4 + 404071972864*r^5 + 120909365248*r^6 + 20395196416*r^7 + 1485897728*r^8 + 571803918336*c + 2544696913920*c*r + 4774165573632*c*r^2 + 4897991024640*c*r^3 + 2969851723776*c*r^4 + 1065056305152*c*r^5 + 209329913856*c*r^6 + 17406885888*c*r^7 + 1876648080384*c^2 + 7033557952512*c^2*r + 10811001772032*c^2*r^2 + 8729345802240*c^2*r^3 + 3908175323136*c^2*r^4 + 920548048896*c^2*r^5 + 89188270080*c^2*r^6 + 3453506122752*c^3 + 10603537201152*c^3*r + 12826486923264*c^3*r^2 + 7646667227136*c^3*r^3 + 2248408350720*c^3*r^4 + 261053743104*c^3*r^5 + 3899282284800*c^4 + 9421303062528*c^4*r + 8413731035136*c^4*r^2 + 3294114324480*c^4*r^3 + 477422346240*c^4*r^4 + 2767448291328*c^5 + 4936251414528*c^5*r + 2894904520704*c^5*r^2 + 558628503552*c^5*r^3 + 1206384689664*c^6 + 1412978079744*c^6*r + 408401989632*c^6*r^2 + 295484765184*c^7 + 170559406080*c^7*r + 31152957696*c^8

theorem onsetG2_5_10M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_10M1B c r := by
 unfold onsetG2_5_10M1B
 positivity

def onsetG2_5_11M1B (c r : ℤ) : ℤ :=
 2043740160 + 10540744704*r + 23371923456*r^2 + 29111255040*r^3 + 22291562496*r^4 + 10752688128*r^5 + 3192913920*r^6 + 533987328*r^7 + 38535168*r^8 + 15687254016*c + 69529485312*c*r + 129832894464*c*r^2 + 132480466944*c*r^3 + 79832481792*c*r^4 + 28429320192*c*r^5 + 5543559168*c*r^6 + 456916992*c*r^7 + 51707400192*c^2 + 192997711872*c^2*r + 295226007552*c^2*r^2 + 237059407872*c^2*r^3 + 105459056640*c^2*r^4 + 24661131264*c^2*r^5 + 2369912832*c^2*r^6 + 95623041024*c^3 + 292370964480*c^3*r + 351932055552*c^3*r^2 + 208616325120*c^3*r^3 + 60940615680*c^3*r^4 + 7023034368*c^3*r^5 + 108568470528*c^4 + 261206249472*c^4*r + 232103854080*c^4*r^2 + 90342604800*c^4*r^3 + 13005619200*c^4*r^4 + 77539037184*c^5 + 137708605440*c^5*r + 80346857472*c^5*r^2 + 15411658752*c^5*r^3 + 34038724608*c^6 + 39692685312*c^6*r + 11412430848*c^6*r^2 + 8402558976*c^7 + 4828336128*c^7*r + 893555712*c^8

theorem onsetG2_5_11M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_11M1B c r := by
 unfold onsetG2_5_11M1B
 positivity

def onsetG2_5_12M1B (c r : ℤ) : ℤ :=
 25804800 + 132464640*r + 292139008*r^2 + 361668608*r^3 + 275050496*r^4 + 131661824*r^5 + 38764544*r^6 + 6422528*r^7 + 458752*r^8 + 198696960*c + 876417024*c*r + 1627508736*c*r^2 + 1650302976*c*r^3 + 987463680*c*r^4 + 348880896*c*r^5 + 67436544*c*r^6 + 5505024*c*r^7 + 657312768*c^2 + 2441263104*c^2*r + 3713181696*c^2*r^2 + 2962391040*c^2*r^3 + 1308303360*c^2*r^4 + 303464448*c^2*r^5 + 28901376*c^2*r^6 + 1220631552*c^3 + 3713181696*c^3*r + 4443586560*c^3*r^2 + 2616606720*c^3*r^3 + 758661120*c^3*r^4 + 86704128*c^3*r^5 + 1392443136*c^4 + 3332689920*c^4*r + 2943682560*c^4*r^2 + 1137991680*c^4*r^3 + 162570240*c^4*r^4 + 999806976*c^5 + 1766209536*c^5*r + 1024192512*c^5*r^2 + 195084288*c^5*r^3 + 441552384*c^6 + 512096256*c^6*r + 146313216*c^6*r^2 + 109734912*c^7 + 62705664*c^7*r + 11757312*c^8

theorem onsetG2_5_12M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_12M1B c r := by
 unfold onsetG2_5_12M1B
 positivity

def onsetG2_5_13M1B (c r : ℤ) : ℤ :=
 0

theorem onsetG2_5_13M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_13M1B c r := by
 unfold onsetG2_5_13M1B
 positivity

def onsetG2_5_14M1B (c r : ℤ) : ℤ :=
 0

theorem onsetG2_5_14M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_5_14M1B c r := by
 unfold onsetG2_5_14M1B
 positivity

theorem onset_stage2_5_0M1B (n c r : ℤ) :
 onsetValue2_5M1B (n+7) (5 + 2*r + 3*c) (2 + 1*r + 1*c)=onsetP2_5_0_0M1B c r*n^0 + onsetP2_5_0_1M1B c r*n^1 + onsetP2_5_0_2M1B c r*n^2 + onsetP2_5_0_3M1B c r*n^3 + onsetP2_5_0_4M1B c r*n^4 + onsetP2_5_0_5M1B c r*n^5 + onsetP2_5_0_6M1B c r*n^6 + onsetP2_5_0_7M1B c r*n^7 := by
 unfold onsetValue2_5M1B backShape2M94 onsetCorrection2_5M1B onsetP2_5_0_0M1B onsetP2_5_0_1M1B onsetP2_5_0_2M1B onsetP2_5_0_3M1B onsetP2_5_0_4M1B onsetP2_5_0_5M1B onsetP2_5_0_6M1B onsetP2_5_0_7M1B
 ring

theorem onset_stage2_5_1M1B (n c r : ℤ) :
 onsetValue2_6M1B (n+7) (5 + 2*r + 3*c) (2 + 1*r + 1*c)=onsetP2_5_1_0M1B c r*n^0 + onsetP2_5_1_1M1B c r*n^1 + onsetP2_5_1_2M1B c r*n^2 + onsetP2_5_1_3M1B c r*n^3 + onsetP2_5_1_4M1B c r*n^4 + onsetP2_5_1_5M1B c r*n^5 + onsetP2_5_1_6M1B c r*n^6 + onsetP2_5_1_7M1B c r*n^7 := by
 unfold onsetValue2_6M1B backShape2M94 onsetCorrection2_6M1B onsetP2_5_1_0M1B onsetP2_5_1_1M1B onsetP2_5_1_2M1B onsetP2_5_1_3M1B onsetP2_5_1_4M1B onsetP2_5_1_5M1B onsetP2_5_1_6M1B onsetP2_5_1_7M1B
 ring

theorem onset_stage2_5_2M1B (n c r : ℤ) :
 onsetValue2_7M1B (n+7) (5 + 2*r + 3*c) (2 + 1*r + 1*c)=onsetP2_5_2_0M1B c r*n^0 + onsetP2_5_2_1M1B c r*n^1 + onsetP2_5_2_2M1B c r*n^2 + onsetP2_5_2_3M1B c r*n^3 + onsetP2_5_2_4M1B c r*n^4 + onsetP2_5_2_5M1B c r*n^5 + onsetP2_5_2_6M1B c r*n^6 + onsetP2_5_2_7M1B c r*n^7 := by
 unfold onsetValue2_7M1B backShape2M94 onsetCorrection2_7M1B onsetP2_5_2_0M1B onsetP2_5_2_1M1B onsetP2_5_2_2M1B onsetP2_5_2_3M1B onsetP2_5_2_4M1B onsetP2_5_2_5M1B onsetP2_5_2_6M1B onsetP2_5_2_7M1B
 ring

theorem onset_column2_5_0M1B (c r : ℤ) :
 (onsetP2_5_1_0M1B c r*onsetP2_5_1_0M1B c r)-(onsetP2_5_0_0M1B c r*onsetP2_5_2_0M1B c r)=onsetG2_5_0M1B c r := by
 unfold onsetG2_5_0M1B onsetP2_5_0_0M1B onsetP2_5_1_0M1B onsetP2_5_2_0M1B
 ring

theorem onset_column2_5_1M1B (c r : ℤ) :
 (onsetP2_5_1_0M1B c r*onsetP2_5_1_1M1B c r + onsetP2_5_1_1M1B c r*onsetP2_5_1_0M1B c r)-(onsetP2_5_0_0M1B c r*onsetP2_5_2_1M1B c r + onsetP2_5_0_1M1B c r*onsetP2_5_2_0M1B c r)=onsetG2_5_1M1B c r := by
 unfold onsetG2_5_1M1B onsetP2_5_0_0M1B onsetP2_5_0_1M1B onsetP2_5_1_0M1B onsetP2_5_1_1M1B onsetP2_5_2_0M1B onsetP2_5_2_1M1B
 ring

theorem onset_column2_5_2M1B (c r : ℤ) :
 (onsetP2_5_1_0M1B c r*onsetP2_5_1_2M1B c r + onsetP2_5_1_1M1B c r*onsetP2_5_1_1M1B c r + onsetP2_5_1_2M1B c r*onsetP2_5_1_0M1B c r)-(onsetP2_5_0_0M1B c r*onsetP2_5_2_2M1B c r + onsetP2_5_0_1M1B c r*onsetP2_5_2_1M1B c r + onsetP2_5_0_2M1B c r*onsetP2_5_2_0M1B c r)=onsetG2_5_2M1B c r := by
 unfold onsetG2_5_2M1B onsetP2_5_0_0M1B onsetP2_5_0_1M1B onsetP2_5_0_2M1B onsetP2_5_1_0M1B onsetP2_5_1_1M1B onsetP2_5_1_2M1B onsetP2_5_2_0M1B onsetP2_5_2_1M1B onsetP2_5_2_2M1B
 ring

theorem onset_column2_5_3M1B (c r : ℤ) :
 (onsetP2_5_1_0M1B c r*onsetP2_5_1_3M1B c r + onsetP2_5_1_1M1B c r*onsetP2_5_1_2M1B c r + onsetP2_5_1_2M1B c r*onsetP2_5_1_1M1B c r + onsetP2_5_1_3M1B c r*onsetP2_5_1_0M1B c r)-(onsetP2_5_0_0M1B c r*onsetP2_5_2_3M1B c r + onsetP2_5_0_1M1B c r*onsetP2_5_2_2M1B c r + onsetP2_5_0_2M1B c r*onsetP2_5_2_1M1B c r + onsetP2_5_0_3M1B c r*onsetP2_5_2_0M1B c r)=onsetG2_5_3M1B c r := by
 unfold onsetG2_5_3M1B onsetP2_5_0_0M1B onsetP2_5_0_1M1B onsetP2_5_0_2M1B onsetP2_5_0_3M1B onsetP2_5_1_0M1B onsetP2_5_1_1M1B onsetP2_5_1_2M1B onsetP2_5_1_3M1B onsetP2_5_2_0M1B onsetP2_5_2_1M1B onsetP2_5_2_2M1B onsetP2_5_2_3M1B
 ring

theorem onset_column2_5_4M1B (c r : ℤ) :
 (onsetP2_5_1_0M1B c r*onsetP2_5_1_4M1B c r + onsetP2_5_1_1M1B c r*onsetP2_5_1_3M1B c r + onsetP2_5_1_2M1B c r*onsetP2_5_1_2M1B c r + onsetP2_5_1_3M1B c r*onsetP2_5_1_1M1B c r + onsetP2_5_1_4M1B c r*onsetP2_5_1_0M1B c r)-(onsetP2_5_0_0M1B c r*onsetP2_5_2_4M1B c r + onsetP2_5_0_1M1B c r*onsetP2_5_2_3M1B c r + onsetP2_5_0_2M1B c r*onsetP2_5_2_2M1B c r + onsetP2_5_0_3M1B c r*onsetP2_5_2_1M1B c r + onsetP2_5_0_4M1B c r*onsetP2_5_2_0M1B c r)=onsetG2_5_4M1B c r := by
 unfold onsetG2_5_4M1B onsetP2_5_0_0M1B onsetP2_5_0_1M1B onsetP2_5_0_2M1B onsetP2_5_0_3M1B onsetP2_5_0_4M1B onsetP2_5_1_0M1B onsetP2_5_1_1M1B onsetP2_5_1_2M1B onsetP2_5_1_3M1B onsetP2_5_1_4M1B onsetP2_5_2_0M1B onsetP2_5_2_1M1B onsetP2_5_2_2M1B onsetP2_5_2_3M1B onsetP2_5_2_4M1B
 ring

theorem onset_column2_5_5M1B (c r : ℤ) :
 (onsetP2_5_1_0M1B c r*onsetP2_5_1_5M1B c r + onsetP2_5_1_1M1B c r*onsetP2_5_1_4M1B c r + onsetP2_5_1_2M1B c r*onsetP2_5_1_3M1B c r + onsetP2_5_1_3M1B c r*onsetP2_5_1_2M1B c r + onsetP2_5_1_4M1B c r*onsetP2_5_1_1M1B c r + onsetP2_5_1_5M1B c r*onsetP2_5_1_0M1B c r)-(onsetP2_5_0_0M1B c r*onsetP2_5_2_5M1B c r + onsetP2_5_0_1M1B c r*onsetP2_5_2_4M1B c r + onsetP2_5_0_2M1B c r*onsetP2_5_2_3M1B c r + onsetP2_5_0_3M1B c r*onsetP2_5_2_2M1B c r + onsetP2_5_0_4M1B c r*onsetP2_5_2_1M1B c r + onsetP2_5_0_5M1B c r*onsetP2_5_2_0M1B c r)=onsetG2_5_5M1B c r := by
 unfold onsetG2_5_5M1B onsetP2_5_0_0M1B onsetP2_5_0_1M1B onsetP2_5_0_2M1B onsetP2_5_0_3M1B onsetP2_5_0_4M1B onsetP2_5_0_5M1B onsetP2_5_1_0M1B onsetP2_5_1_1M1B onsetP2_5_1_2M1B onsetP2_5_1_3M1B onsetP2_5_1_4M1B onsetP2_5_1_5M1B onsetP2_5_2_0M1B onsetP2_5_2_1M1B onsetP2_5_2_2M1B onsetP2_5_2_3M1B onsetP2_5_2_4M1B onsetP2_5_2_5M1B
 ring

theorem onset_column2_5_6M1B (c r : ℤ) :
 (onsetP2_5_1_0M1B c r*onsetP2_5_1_6M1B c r + onsetP2_5_1_1M1B c r*onsetP2_5_1_5M1B c r + onsetP2_5_1_2M1B c r*onsetP2_5_1_4M1B c r + onsetP2_5_1_3M1B c r*onsetP2_5_1_3M1B c r + onsetP2_5_1_4M1B c r*onsetP2_5_1_2M1B c r + onsetP2_5_1_5M1B c r*onsetP2_5_1_1M1B c r + onsetP2_5_1_6M1B c r*onsetP2_5_1_0M1B c r)-(onsetP2_5_0_0M1B c r*onsetP2_5_2_6M1B c r + onsetP2_5_0_1M1B c r*onsetP2_5_2_5M1B c r + onsetP2_5_0_2M1B c r*onsetP2_5_2_4M1B c r + onsetP2_5_0_3M1B c r*onsetP2_5_2_3M1B c r + onsetP2_5_0_4M1B c r*onsetP2_5_2_2M1B c r + onsetP2_5_0_5M1B c r*onsetP2_5_2_1M1B c r + onsetP2_5_0_6M1B c r*onsetP2_5_2_0M1B c r)=onsetG2_5_6M1B c r := by
 unfold onsetG2_5_6M1B onsetP2_5_0_0M1B onsetP2_5_0_1M1B onsetP2_5_0_2M1B onsetP2_5_0_3M1B onsetP2_5_0_4M1B onsetP2_5_0_5M1B onsetP2_5_0_6M1B onsetP2_5_1_0M1B onsetP2_5_1_1M1B onsetP2_5_1_2M1B onsetP2_5_1_3M1B onsetP2_5_1_4M1B onsetP2_5_1_5M1B onsetP2_5_1_6M1B onsetP2_5_2_0M1B onsetP2_5_2_1M1B onsetP2_5_2_2M1B onsetP2_5_2_3M1B onsetP2_5_2_4M1B onsetP2_5_2_5M1B onsetP2_5_2_6M1B
 ring

theorem onset_column2_5_7M1B (c r : ℤ) :
 (onsetP2_5_1_0M1B c r*onsetP2_5_1_7M1B c r + onsetP2_5_1_1M1B c r*onsetP2_5_1_6M1B c r + onsetP2_5_1_2M1B c r*onsetP2_5_1_5M1B c r + onsetP2_5_1_3M1B c r*onsetP2_5_1_4M1B c r + onsetP2_5_1_4M1B c r*onsetP2_5_1_3M1B c r + onsetP2_5_1_5M1B c r*onsetP2_5_1_2M1B c r + onsetP2_5_1_6M1B c r*onsetP2_5_1_1M1B c r + onsetP2_5_1_7M1B c r*onsetP2_5_1_0M1B c r)-(onsetP2_5_0_0M1B c r*onsetP2_5_2_7M1B c r + onsetP2_5_0_1M1B c r*onsetP2_5_2_6M1B c r + onsetP2_5_0_2M1B c r*onsetP2_5_2_5M1B c r + onsetP2_5_0_3M1B c r*onsetP2_5_2_4M1B c r + onsetP2_5_0_4M1B c r*onsetP2_5_2_3M1B c r + onsetP2_5_0_5M1B c r*onsetP2_5_2_2M1B c r + onsetP2_5_0_6M1B c r*onsetP2_5_2_1M1B c r + onsetP2_5_0_7M1B c r*onsetP2_5_2_0M1B c r)=onsetG2_5_7M1B c r := by
 unfold onsetG2_5_7M1B onsetP2_5_0_0M1B onsetP2_5_0_1M1B onsetP2_5_0_2M1B onsetP2_5_0_3M1B onsetP2_5_0_4M1B onsetP2_5_0_5M1B onsetP2_5_0_6M1B onsetP2_5_0_7M1B onsetP2_5_1_0M1B onsetP2_5_1_1M1B onsetP2_5_1_2M1B onsetP2_5_1_3M1B onsetP2_5_1_4M1B onsetP2_5_1_5M1B onsetP2_5_1_6M1B onsetP2_5_1_7M1B onsetP2_5_2_0M1B onsetP2_5_2_1M1B onsetP2_5_2_2M1B onsetP2_5_2_3M1B onsetP2_5_2_4M1B onsetP2_5_2_5M1B onsetP2_5_2_6M1B onsetP2_5_2_7M1B
 ring

theorem onset_column2_5_8M1B (c r : ℤ) :
 (onsetP2_5_1_1M1B c r*onsetP2_5_1_7M1B c r + onsetP2_5_1_2M1B c r*onsetP2_5_1_6M1B c r + onsetP2_5_1_3M1B c r*onsetP2_5_1_5M1B c r + onsetP2_5_1_4M1B c r*onsetP2_5_1_4M1B c r + onsetP2_5_1_5M1B c r*onsetP2_5_1_3M1B c r + onsetP2_5_1_6M1B c r*onsetP2_5_1_2M1B c r + onsetP2_5_1_7M1B c r*onsetP2_5_1_1M1B c r)-(onsetP2_5_0_1M1B c r*onsetP2_5_2_7M1B c r + onsetP2_5_0_2M1B c r*onsetP2_5_2_6M1B c r + onsetP2_5_0_3M1B c r*onsetP2_5_2_5M1B c r + onsetP2_5_0_4M1B c r*onsetP2_5_2_4M1B c r + onsetP2_5_0_5M1B c r*onsetP2_5_2_3M1B c r + onsetP2_5_0_6M1B c r*onsetP2_5_2_2M1B c r + onsetP2_5_0_7M1B c r*onsetP2_5_2_1M1B c r)=onsetG2_5_8M1B c r := by
 unfold onsetG2_5_8M1B onsetP2_5_0_1M1B onsetP2_5_0_2M1B onsetP2_5_0_3M1B onsetP2_5_0_4M1B onsetP2_5_0_5M1B onsetP2_5_0_6M1B onsetP2_5_0_7M1B onsetP2_5_1_1M1B onsetP2_5_1_2M1B onsetP2_5_1_3M1B onsetP2_5_1_4M1B onsetP2_5_1_5M1B onsetP2_5_1_6M1B onsetP2_5_1_7M1B onsetP2_5_2_1M1B onsetP2_5_2_2M1B onsetP2_5_2_3M1B onsetP2_5_2_4M1B onsetP2_5_2_5M1B onsetP2_5_2_6M1B onsetP2_5_2_7M1B
 ring

theorem onset_column2_5_9M1B (c r : ℤ) :
 (onsetP2_5_1_2M1B c r*onsetP2_5_1_7M1B c r + onsetP2_5_1_3M1B c r*onsetP2_5_1_6M1B c r + onsetP2_5_1_4M1B c r*onsetP2_5_1_5M1B c r + onsetP2_5_1_5M1B c r*onsetP2_5_1_4M1B c r + onsetP2_5_1_6M1B c r*onsetP2_5_1_3M1B c r + onsetP2_5_1_7M1B c r*onsetP2_5_1_2M1B c r)-(onsetP2_5_0_2M1B c r*onsetP2_5_2_7M1B c r + onsetP2_5_0_3M1B c r*onsetP2_5_2_6M1B c r + onsetP2_5_0_4M1B c r*onsetP2_5_2_5M1B c r + onsetP2_5_0_5M1B c r*onsetP2_5_2_4M1B c r + onsetP2_5_0_6M1B c r*onsetP2_5_2_3M1B c r + onsetP2_5_0_7M1B c r*onsetP2_5_2_2M1B c r)=onsetG2_5_9M1B c r := by
 unfold onsetG2_5_9M1B onsetP2_5_0_2M1B onsetP2_5_0_3M1B onsetP2_5_0_4M1B onsetP2_5_0_5M1B onsetP2_5_0_6M1B onsetP2_5_0_7M1B onsetP2_5_1_2M1B onsetP2_5_1_3M1B onsetP2_5_1_4M1B onsetP2_5_1_5M1B onsetP2_5_1_6M1B onsetP2_5_1_7M1B onsetP2_5_2_2M1B onsetP2_5_2_3M1B onsetP2_5_2_4M1B onsetP2_5_2_5M1B onsetP2_5_2_6M1B onsetP2_5_2_7M1B
 ring

theorem onset_column2_5_10M1B (c r : ℤ) :
 (onsetP2_5_1_3M1B c r*onsetP2_5_1_7M1B c r + onsetP2_5_1_4M1B c r*onsetP2_5_1_6M1B c r + onsetP2_5_1_5M1B c r*onsetP2_5_1_5M1B c r + onsetP2_5_1_6M1B c r*onsetP2_5_1_4M1B c r + onsetP2_5_1_7M1B c r*onsetP2_5_1_3M1B c r)-(onsetP2_5_0_3M1B c r*onsetP2_5_2_7M1B c r + onsetP2_5_0_4M1B c r*onsetP2_5_2_6M1B c r + onsetP2_5_0_5M1B c r*onsetP2_5_2_5M1B c r + onsetP2_5_0_6M1B c r*onsetP2_5_2_4M1B c r + onsetP2_5_0_7M1B c r*onsetP2_5_2_3M1B c r)=onsetG2_5_10M1B c r := by
 unfold onsetG2_5_10M1B onsetP2_5_0_3M1B onsetP2_5_0_4M1B onsetP2_5_0_5M1B onsetP2_5_0_6M1B onsetP2_5_0_7M1B onsetP2_5_1_3M1B onsetP2_5_1_4M1B onsetP2_5_1_5M1B onsetP2_5_1_6M1B onsetP2_5_1_7M1B onsetP2_5_2_3M1B onsetP2_5_2_4M1B onsetP2_5_2_5M1B onsetP2_5_2_6M1B onsetP2_5_2_7M1B
 ring

theorem onset_column2_5_11M1B (c r : ℤ) :
 (onsetP2_5_1_4M1B c r*onsetP2_5_1_7M1B c r + onsetP2_5_1_5M1B c r*onsetP2_5_1_6M1B c r + onsetP2_5_1_6M1B c r*onsetP2_5_1_5M1B c r + onsetP2_5_1_7M1B c r*onsetP2_5_1_4M1B c r)-(onsetP2_5_0_4M1B c r*onsetP2_5_2_7M1B c r + onsetP2_5_0_5M1B c r*onsetP2_5_2_6M1B c r + onsetP2_5_0_6M1B c r*onsetP2_5_2_5M1B c r + onsetP2_5_0_7M1B c r*onsetP2_5_2_4M1B c r)=onsetG2_5_11M1B c r := by
 unfold onsetG2_5_11M1B onsetP2_5_0_4M1B onsetP2_5_0_5M1B onsetP2_5_0_6M1B onsetP2_5_0_7M1B onsetP2_5_1_4M1B onsetP2_5_1_5M1B onsetP2_5_1_6M1B onsetP2_5_1_7M1B onsetP2_5_2_4M1B onsetP2_5_2_5M1B onsetP2_5_2_6M1B onsetP2_5_2_7M1B
 ring

theorem onset_column2_5_12M1B (c r : ℤ) :
 (onsetP2_5_1_5M1B c r*onsetP2_5_1_7M1B c r + onsetP2_5_1_6M1B c r*onsetP2_5_1_6M1B c r + onsetP2_5_1_7M1B c r*onsetP2_5_1_5M1B c r)-(onsetP2_5_0_5M1B c r*onsetP2_5_2_7M1B c r + onsetP2_5_0_6M1B c r*onsetP2_5_2_6M1B c r + onsetP2_5_0_7M1B c r*onsetP2_5_2_5M1B c r)=onsetG2_5_12M1B c r := by
 unfold onsetG2_5_12M1B onsetP2_5_0_5M1B onsetP2_5_0_6M1B onsetP2_5_0_7M1B onsetP2_5_1_5M1B onsetP2_5_1_6M1B onsetP2_5_1_7M1B onsetP2_5_2_5M1B onsetP2_5_2_6M1B onsetP2_5_2_7M1B
 ring

theorem onset_column2_5_13M1B (c r : ℤ) :
 (onsetP2_5_1_6M1B c r*onsetP2_5_1_7M1B c r + onsetP2_5_1_7M1B c r*onsetP2_5_1_6M1B c r)-(onsetP2_5_0_6M1B c r*onsetP2_5_2_7M1B c r + onsetP2_5_0_7M1B c r*onsetP2_5_2_6M1B c r)=onsetG2_5_13M1B c r := by
 unfold onsetG2_5_13M1B onsetP2_5_0_6M1B onsetP2_5_0_7M1B onsetP2_5_1_6M1B onsetP2_5_1_7M1B onsetP2_5_2_6M1B onsetP2_5_2_7M1B
 ring

theorem onset_column2_5_14M1B (c r : ℤ) :
 (onsetP2_5_1_7M1B c r*onsetP2_5_1_7M1B c r)-(onsetP2_5_0_7M1B c r*onsetP2_5_2_7M1B c r)=onsetG2_5_14M1B c r := by
 unfold onsetG2_5_14M1B onsetP2_5_0_7M1B onsetP2_5_1_7M1B onsetP2_5_2_7M1B
 ring

attribute [local irreducible] onsetP2_5_0_0M1B onsetP2_5_0_1M1B onsetP2_5_0_2M1B onsetP2_5_0_3M1B onsetP2_5_0_4M1B onsetP2_5_0_5M1B onsetP2_5_0_6M1B onsetP2_5_0_7M1B onsetP2_5_1_0M1B onsetP2_5_1_1M1B onsetP2_5_1_2M1B onsetP2_5_1_3M1B onsetP2_5_1_4M1B onsetP2_5_1_5M1B onsetP2_5_1_6M1B onsetP2_5_1_7M1B onsetP2_5_2_0M1B onsetP2_5_2_1M1B onsetP2_5_2_2M1B onsetP2_5_2_3M1B onsetP2_5_2_4M1B onsetP2_5_2_5M1B onsetP2_5_2_6M1B onsetP2_5_2_7M1B onsetG2_5_0M1B onsetG2_5_1M1B onsetG2_5_2M1B onsetG2_5_3M1B onsetG2_5_4M1B onsetG2_5_5M1B onsetG2_5_6M1B onsetG2_5_7M1B onsetG2_5_8M1B onsetG2_5_9M1B onsetG2_5_10M1B onsetG2_5_11M1B onsetG2_5_12M1B onsetG2_5_13M1B onsetG2_5_14M1B

theorem onset_columns_lc2_5M1B (n c r : ℤ) (hn : 0≤n) (hc : 0≤c) (hr : 0≤r) :
 onsetValue2_5M1B (n+7) (5 + 2*r + 3*c) (2 + 1*r + 1*c)*
 onsetValue2_7M1B (n+7) (5 + 2*r + 3*c) (2 + 1*r + 1*c)≤
 onsetValue2_6M1B (n+7) (5 + 2*r + 3*c) (2 + 1*r + 1*c)^2 := by
 apply sub_nonneg.mp
 rw [onset_stage2_5_0M1B,onset_stage2_5_1M1B,onset_stage2_5_2M1B]
 have hgap : (onsetP2_5_1_0M1B c r*n^0 + onsetP2_5_1_1M1B c r*n^1 + onsetP2_5_1_2M1B c r*n^2 + onsetP2_5_1_3M1B c r*n^3 + onsetP2_5_1_4M1B c r*n^4 + onsetP2_5_1_5M1B c r*n^5 + onsetP2_5_1_6M1B c r*n^6 + onsetP2_5_1_7M1B c r*n^7)^2-(onsetP2_5_0_0M1B c r*n^0 + onsetP2_5_0_1M1B c r*n^1 + onsetP2_5_0_2M1B c r*n^2 + onsetP2_5_0_3M1B c r*n^3 + onsetP2_5_0_4M1B c r*n^4 + onsetP2_5_0_5M1B c r*n^5 + onsetP2_5_0_6M1B c r*n^6 + onsetP2_5_0_7M1B c r*n^7)*(onsetP2_5_2_0M1B c r*n^0 + onsetP2_5_2_1M1B c r*n^1 + onsetP2_5_2_2M1B c r*n^2 + onsetP2_5_2_3M1B c r*n^3 + onsetP2_5_2_4M1B c r*n^4 + onsetP2_5_2_5M1B c r*n^5 + onsetP2_5_2_6M1B c r*n^6 + onsetP2_5_2_7M1B c r*n^7)=onsetG2_5_0M1B c r*n^0 + onsetG2_5_1M1B c r*n^1 + onsetG2_5_2M1B c r*n^2 + onsetG2_5_3M1B c r*n^3 + onsetG2_5_4M1B c r*n^4 + onsetG2_5_5M1B c r*n^5 + onsetG2_5_6M1B c r*n^6 + onsetG2_5_7M1B c r*n^7 + onsetG2_5_8M1B c r*n^8 + onsetG2_5_9M1B c r*n^9 + onsetG2_5_10M1B c r*n^10 + onsetG2_5_11M1B c r*n^11 + onsetG2_5_12M1B c r*n^12 + onsetG2_5_13M1B c r*n^13 + onsetG2_5_14M1B c r*n^14 := by
  rw [←onset_column2_5_0M1B,←onset_column2_5_1M1B,←onset_column2_5_2M1B,←onset_column2_5_3M1B,←onset_column2_5_4M1B,←onset_column2_5_5M1B,←onset_column2_5_6M1B,←onset_column2_5_7M1B,←onset_column2_5_8M1B,←onset_column2_5_9M1B,←onset_column2_5_10M1B,←onset_column2_5_11M1B,←onset_column2_5_12M1B,←onset_column2_5_13M1B,←onset_column2_5_14M1B]
  ring
 rw [hgap]
 have h0 := onsetG2_5_0M1B_nonneg c r hc hr
 have h1 := onsetG2_5_1M1B_nonneg c r hc hr
 have h2 := onsetG2_5_2M1B_nonneg c r hc hr
 have h3 := onsetG2_5_3M1B_nonneg c r hc hr
 have h4 := onsetG2_5_4M1B_nonneg c r hc hr
 have h5 := onsetG2_5_5M1B_nonneg c r hc hr
 have h6 := onsetG2_5_6M1B_nonneg c r hc hr
 have h7 := onsetG2_5_7M1B_nonneg c r hc hr
 have h8 := onsetG2_5_8M1B_nonneg c r hc hr
 have h9 := onsetG2_5_9M1B_nonneg c r hc hr
 have h10 := onsetG2_5_10M1B_nonneg c r hc hr
 have h11 := onsetG2_5_11M1B_nonneg c r hc hr
 have h12 := onsetG2_5_12M1B_nonneg c r hc hr
 have h13 := onsetG2_5_13M1B_nonneg c r hc hr
 have h14 := onsetG2_5_14M1B_nonneg c r hc hr
 positivity
end
end MathGKM.Markov
