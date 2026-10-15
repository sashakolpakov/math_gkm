import MarkovOnsetValues3M1B
/-! Machine-authored 1b02dddc. Column-wise exact onset gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false

def onsetP3_6_0_0M1B (c r : ℤ) : ℤ :=
 3377354400 + 12839430240*r + 17498396160*r^2 + 10186606080*r^3 + 2129541120*r^4 + 7795609920*c + 20889832320*c*r + 17930142720*c*r^2 + 4953231360*c*r^3 + 6219480960*c^2 + 10492554240*c^2*r + 4311982080*c^2*r^2 + 2041159680*c^3 + 1665054720*c^3*r + 240629760*c^4

def onsetP3_6_0_1M1B (c r : ℤ) : ℤ :=
 2890824480 + 11078384352*r + 15254169024*r^2 + 8997256128*r^3 + 1921756416*r^4 + 6817540800*c + 18508816512*c*r + 16134539904*c*r^2 + 4545240576*c*r^3 + 5603617536*c^2 + 9623553408*c^2*r + 4023650304*c^2*r^2 + 1909017600*c^3 + 1580010240*c^3*r + 232207104*c^4

def onsetP3_6_0_2M1B (c r : ℤ) : ℤ :=
 1075127424 + 4145925504*r + 5754550368*r^2 + 3428317536*r^3 + 743295168*r^4 + 2585175040*c + 7093100672*c*r + 6260079168*c*r^2 + 1789468800*c*r^3 + 2182449920*c^2 + 3803498496*c^2*r + 1612662912*c^2*r^2 + 768884480*c^3 + 644742784*c^3*r + 96482176*c^4

def onsetP3_6_0_3M1B (c r : ℤ) : ℤ :=
 225482880 + 873293568*r + 1218801696*r^2 + 730901472*r^3 + 159849984*r^4 + 551677952*c + 1525677888*c*r + 1358570304*c*r^2 + 392113344*c*r^3 + 476905856*c^2 + 840563136*c^2*r + 360126144*c^2*r^2 + 173100928*c^3 + 146759424*c^3*r + 22390144*c^4

def onsetP3_6_0_4M1B (c r : ℤ) : ℤ :=
 28835520 + 111935040*r + 156641520*r^2 + 94200960*r^3 + 20658960*r^4 + 71639680*c + 199115840*c*r + 178234560*c*r^2 + 51683520*c*r^3 + 63224000*c^2 + 112291200*c^2*r + 48424320*c^2*r^2 + 23555840*c^3 + 20137600*c^3*r + 3136000*c^4

def onsetP3_6_0_5M1B (c r : ℤ) : ℤ :=
 2251200 + 8738688*r + 12224016*r^2 + 7342272*r^3 + 1605744*r^4 + 5667200*c + 15781248*c*r + 14144256*c*r^2 + 4100544*c*r^3 + 5090624*c^2 + 9076032*c^2*r + 3923136*c^2*r^2 + 1939840*c^3 + 1666560*c^3*r + 265216*c^4

def onsetP3_6_0_6M1B (c r : ℤ) : ℤ :=
 99456 + 385056*r + 536592*r^2 + 320544*r^3 + 69552*r^4 + 253120*c + 703808*c*r + 628992*c*r^2 + 181440*c*r^3 + 230720*c^2 + 411264*c^2*r + 177408*c^2*r^2 + 89600*c^3 + 77056*c^3*r + 12544*c^4

def onsetP3_6_0_7M1B (c r : ℤ) : ℤ :=
 1920 + 7392*r + 10224*r^2 + 6048*r^3 + 1296*r^4 + 4928*c + 13632*c*r + 12096*c*r^2 + 3456*c*r^3 + 4544*c^2 + 8064*c^2*r + 3456*c^2*r^2 + 1792*c^3 + 1536*c^3*r + 256*c^4

def onsetP3_6_1_0M1B (c r : ℤ) : ℤ :=
 1362856320 + 5137251840*r + 6924919680*r^2 + 3973939200*r^3 + 810351360*r^4 + 3077786880*c + 8132463360*c*r + 6861818880*c*r^2 + 1853107200*c*r^3 + 2379767040*c^2 + 3935554560*c^2*r + 1585543680*c^2*r^2 + 749629440*c^3 + 601574400*c^3*r + 85397760*c^4

def onsetP3_6_1_1M1B (c r : ℤ) : ℤ :=
 1312348896 + 5000108736*r + 6832879392*r^2 + 3991352064*r^3 + 839700672*r^4 + 3042517632*c + 8177964288*c*r + 7044186240*c*r^2 + 1955347200*c*r^3 + 2440639872*c^2 + 4132050048*c^2*r + 1703581056*c^2*r^2 + 805502208*c^3 + 658133760*c^3*r + 95121792*c^4

def onsetP3_6_1_2M1B (c r : ℤ) : ℤ :=
 550631424 + 2115888768*r + 2923588416*r^2 + 1732077312*r^3 + 372657600*r^4 + 1307000576*c + 3563220416*c*r + 3121513920*c*r^2 + 884873472*c*r^3 + 1083535488*c^2 + 1870795584*c^2*r + 786187584*c^2*r^2 + 372824704*c^3 + 309748096*c^3*r + 45658368*c^4

def onsetP3_6_1_3M1B (c r : ℤ) : ℤ :=
 130730880 + 505497888*r + 704101776*r^2 + 421321152*r^3 + 91925904*r^4 + 316901312*c + 873427968*c*r + 774918144*c*r^2 + 222876864*c*r^3 + 270460736*c^2 + 474215616*c^2*r + 202233024*c^2*r^2 + 96546688*c^3 + 81387264*c^3*r + 12256384*c^4

def onsetP3_6_1_4M1B (c r : ℤ) : ℤ :=
 19004160 + 73758720*r + 103212480*r^2 + 62086080*r^3 + 13628160*r^4 + 46928000*c + 130289600*c*r + 116524800*c*r^2 + 33781440*c*r^3 + 41072640*c^2 + 72797760*c^2*r + 31348800*c^2*r^2 + 15137920*c^3 + 12906880*c^3*r + 1989120*c^4

def onsetP3_6_1_5M1B (c r : ℤ) : ℤ :=
 1694784 + 6583584*r + 9219168*r^2 + 5546016*r^3 + 1215648*r^4 + 4251968*c + 11844672*c*r + 10624320*c*r^2 + 3084480*c*r^3 + 3801728*c^2 + 6777792*c^2*r + 2931264*c^2*r^2 + 1439872*c^3 + 1236480*c^3*r + 195328*c^4

def onsetP3_6_1_6M1B (c r : ℤ) : ℤ :=
 86016 + 333312*r + 465024*r^2 + 278208*r^3 + 60480*r^4 + 218624*c + 608384*c*r + 544320*c*r^2 + 157248*c*r^3 + 198912*c^2 + 354816*c^2*r + 153216*c^2*r^2 + 77056*c^3 + 66304*c^3*r + 10752*c^4

def onsetP3_6_1_7M1B (c r : ℤ) : ℤ :=
 1920 + 7392*r + 10224*r^2 + 6048*r^3 + 1296*r^4 + 4928*c + 13632*c*r + 12096*c*r^2 + 3456*c*r^3 + 4544*c^2 + 8064*c^2*r + 3456*c^2*r^2 + 1792*c^3 + 1536*c^3*r + 256*c^4

def onsetP3_6_2_0M1B (c r : ℤ) : ℤ :=
 487801440 + 1815035040*r + 2405975040*r^2 + 1350155520*r^3 + 263854080*r^4 + 1068258240*c + 2763331200*c*r + 2270661120*c*r^2 + 590607360*c*r^3 + 789667200*c^2 + 1266451200*c^2*r + 494484480*c^2*r^2 + 234178560*c^3 + 183536640*c^3*r + 25482240*c^4

def onsetP3_6_2_1M1B (c r : ℤ) : ℤ :=
 535233312 + 2020759776*r + 2728535232*r^2 + 1568919744*r^3 + 321374976*r^4 + 1211491008*c + 3206317440*c*r + 2709753984*c*r^2 + 733608192*c*r^3 + 938507520*c^2 + 1553731200*c^2*r + 626270976*c^2*r^2 + 295690752*c^3 + 236967168*c^3*r + 33531648*c^4

def onsetP3_6_2_2M1B (c r : ℤ) : ℤ :=
 256765824 + 980956032*r + 1345126944*r^2 + 789216288*r^3 + 167372352*r^4 + 598520832*c + 1615066880*c*r + 1397575872*c*r^2 + 390372864*c*r^3 + 483460096*c^2 + 822310272*c^2*r + 340494336*c^2*r^2 + 160731648*c^3 + 131625088*c^3*r + 19026560*c^4

def onsetP3_6_2_3M1B (c r : ℤ) : ℤ :=
 70008960 + 269891328*r + 374500896*r^2 + 223084512*r^3 + 48405504*r^4 + 167508992*c + 459025728*c*r + 404599104*c*r^2 + 115571904*c*r^3 + 140368256*c^2 + 243988416*c^2*r + 103207104*c^2*r^2 + 48915328*c^3 + 40852224*c^3*r + 6047104*c^4

def onsetP3_6_2_4M1B (c r : ℤ) : ℤ :=
 11753280 + 45581760*r + 63734160*r^2 + 38317440*r^3 + 8411760*r^4 + 28775040*c + 79714880*c*r + 71144640*c*r^2 + 20596800*c*r^3 + 24888640*c^2 + 43948800*c^2*r + 18869760*c^2*r^2 + 9031680*c^3 + 7665280*c^3*r + 1164800*c^4

def onsetP3_6_2_5M1B (c r : ℤ) : ℤ :=
 1219008 + 4738944*r + 6643728*r^2 + 4003776*r^3 + 879984*r^4 + 3043712*c + 8480640*c*r + 7612416*c*r^2 + 2213568*c*r^3 + 2703680*c^2 + 4818240*c^2*r + 2084544*c^2*r^2 + 1015168*c^3 + 870912*c^3*r + 136192*c^4

def onsetP3_6_2_6M1B (c r : ℤ) : ℤ :=
 72576 + 281568*r + 393456*r^2 + 235872*r^3 + 51408*r^4 + 184128*c + 512960*c*r + 459648*c*r^2 + 133056*c*r^3 + 167104*c^2 + 298368*c^2*r + 129024*c^2*r^2 + 64512*c^3 + 55552*c^3*r + 8960*c^4

def onsetP3_6_2_7M1B (c r : ℤ) : ℤ :=
 1920 + 7392*r + 10224*r^2 + 6048*r^3 + 1296*r^4 + 4928*c + 13632*c*r + 12096*c*r^2 + 3456*c*r^3 + 4544*c^2 + 8064*c^2*r + 3456*c^2*r^2 + 1792*c^3 + 1536*c^3*r + 256*c^4

def onsetG3_6_0M1B (c r : ℤ) : ℤ :=
 209899009253606400 + 1609563136801536000*r + 5301108558935884800*r^2 + 9801383383740211200*r^3 + 11138649503759769600*r^4 + 7977173633836646400*r^5 + 3521280495830630400*r^6 + 877584796758835200*r^7 + 94781213614080000*r^8 + 978566190187622400*c + 6401519411715993600*c*r + 17627823697204224000*c*r^2 + 26517801080416665600*c*r^3 + 23567807094541516800*c*r^4 + 12395105560844697600*c*r^5 + 3578914487638425600*c*r^6 + 438682917076992000*c*r^7 + 1930750886221516800*c^2 + 10557516059093606400*c^2*r + 23651522260028006400*c^2*r^2 + 27827082295920230400*c^2*r^3 + 18165264685321420800*c^2*r^4 + 6250231995472281600*c^2*r^5 + 887527254491136000*c^2*r^6 + 2105572123223654400*c^3 + 9366524043112857600*c^3*r + 16413603695729049600*c^3*r^2 + 14186937773791641600*c^3*r^3 + 6059410377198796800*c^3*r^4 + 1025173395800064000*c^3*r^5 + 1389647662457241600*c^4 + 4836465654438297600*c^4*r + 6227583275379916800*c^4*r^2 + 3521931979810406400*c^4*r^3 + 739458995208192000*c^4*r^4 + 569548806414336000*c^5 + 1456855739213414400*c^5*r + 1227303035810611200*c^5*r^2 + 341059826103091200*c^5*r^3 + 141898276483891200*c^6 + 237423509058355200*c^6*r + 98230323334348800*c^6*r^2 + 19669698478080000*c^7 + 16152510844108800*c^7*r + 1160992117555200*c^8

theorem onsetG3_6_0M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_0M1B c r := by
 unfold onsetG3_6_0M1B
 positivity

def onsetG3_6_1M1B (c r : ℤ) : ℤ :=
 359265048476221440 + 2764680886651944960*r + 9143650604891013120*r^2 + 16987809021988331520*r^3 + 19411283178804142080*r^4 + 13986215161279119360*r^5 + 6214256736936837120*r^6 + 1559201815411752960*r^7 + 169460665637437440*r^8 + 1693431301524480000*c + 11131638664737669120*c*r + 30821096172705914880*c*r^2 + 46645699881757777920*c*r^3 + 41728860859301683200*c*r^4 + 22098752578267545600*c*r^5 + 6425466951629537280*c*r^6 + 792770073589186560*c*r^7 + 3385100616615567360*c^2 + 18623084871798005760*c^2*r + 41996544307538042880*c^2*r^2 + 49757660176098631680*c^2*r^3 + 32717414811319418880*c^2*r^4 + 11339015468123750400*c^2*r^5 + 1621146743895490560*c^2*r^6 + 3747500880283238400*c^3 + 16789624535466639360*c^3*r + 29640003819266211840*c^3*r^2 + 25812717218364948480*c^3*r^3 + 11107580870387957760*c^3*r^4 + 1892675527563018240*c^3*r^5 + 2514794850461859840*c^4 + 8820427966910300160*c^4*r + 11446097200596172800*c^4*r^2 + 6523223607835361280*c^4*r^3 + 1379828507981414400*c^4*r^4 + 1049017618358599680*c^5 + 2704760191045140480*c^5*r + 2296707164285829120*c^5*r^2 + 643231912535654400*c^5*r^3 + 266097725589749760*c^6 + 448877965857914880*c^6*r + 187241564263219200*c^6*r^2 + 37568947340574720*c^7 + 31117874341478400*c^7*r + 2260506363494400*c^8

theorem onsetG3_6_1M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_1M1B c r := by
 unfold onsetG3_6_1M1B
 positivity

def onsetG3_6_2M1B (c r : ℤ) : ℤ :=
 284219205302624256 + 2193816099977607168*r + 7281362274625797120*r^2 + 13582645408932139008*r^3 + 15590439184462248960*r^4 + 11288579395824783360*r^5 + 5041873150694424576*r^6 + 1271762764829835264*r^7 + 138912213779877888*r^8 + 1353837833982111744*c + 8936372205975674880*c*r + 24858102978605740032*c*r^2 + 37812907526801412096*c*r^3 + 34011734516433580032*c*r^4 + 18114303924945027072*c*r^5 + 5296931165578493952*c*r^6 + 657032401620467712*c*r^7 + 2739826029474164736*c^2 + 15152411606771625984*c^2*r + 34363285039050670080*c^2*r^2 + 40956223596931657728*c^2*r^3 + 27094741426854936576*c^2*r^4 + 9447268776742895616*c^2*r^5 + 1358410003561562112*c^2*r^6 + 3076236754822619136*c^3 + 13867655459042230272*c^3*r + 24638788522145193984*c^3*r^2 + 21596871132300312576*c^3*r^3 + 9353100175756001280*c^3*r^4 + 1603446340044423168*c^3*r^5 + 2096880532915617792*c^4 + 7404982206591836160*c^4*r + 9675251156686381056*c^4*r^2 + 5551313554405785600*c^4*r^3 + 1181880414373478400*c^4*r^4 + 889448991108120576*c^5 + 2309804746745610240*c^5*r + 1975271967006621696*c^5*r^2 + 557039909998559232*c^5*r^3 + 229572747149082624*c^6 + 390144758369845248*c^6*r + 163942348952567808*c^6*r^2 + 32998109541433344*c^7 + 27546634387980288*c^7*r + 2023174612795392*c^8

theorem onsetG3_6_2M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_2M1B c r := by
 unfold onsetG3_6_2M1B
 positivity

def onsetG3_6_3M1B (c r : ℤ) : ℤ :=
 137431010562048000 + 1063458555353800704*r + 3539832608085774336*r^2 + 6624570188917997568*r^3 + 7630828213326409728*r^4 + 5546265331931799552*r^5 + 2486932349851385856*r^6 + 629772139438718976*r^7 + 69042297180487680*r^8 + 661206467110404096*c + 4379611926934659072*c*r + 12229325420142845952*c*r^2 + 18679589567257952256*c*r^3 + 16875090597042413568*c*r^4 + 9027660467643826176*c*r^5 + 2651481039528566784*c*r^6 + 330246792847835136*c*r^7 + 1353748391190085632*c^2 + 7519907588532928512*c^2*r + 17134247885423284224*c^2*r^2 + 20521682050454151168*c^2*r^3 + 13643631765412024320*c^2*r^4 + 4780376363812331520*c^2*r^5 + 690506029963911168*c^2*r^6 + 1540218025267396608*c^3 + 6979845960535375872*c^3*r + 12468297443156287488*c^3*r^2 + 10988430475652259840*c^3*r^3 + 4784168461425131520*c^3*r^4 + 824296008897478656*c^3*r^5 + 1065413675068538880*c^4 + 3784641808352821248*c^4*r + 4974090579518054400*c^4*r^2 + 2870408322188574720*c^4*r^3 + 614471076709539840*c^4*r^4 + 459147267136782336*c^5 + 1199881040596353024*c^5*r + 1032457717740847104*c^5*r^2 + 292900379889008640*c^5*r^3 + 120502884416323584*c^6 + 206142388672905216*c^6*r + 87183969254129664*c^6*r^2 + 17624775801077760*c^7 + 14816021712371712*c^7*r + 1100574078664704*c^8

theorem onsetG3_6_3M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_3M1B c r := by
 unfold onsetG3_6_3M1B
 positivity

def onsetG3_6_4M1B (c r : ℤ) : ℤ :=
 45237353224089600 + 350736891792537600*r + 1170029203381075968*r^2 + 2194926293853361152*r^3 + 2534886609250738176*r^4 + 1847393430109387776*r^5 + 830618614178648064*r^6 + 210889950002307072*r^7 + 23174796696532992*r^8 + 219714207325777920*c + 1459343398371446784*c*r + 4087205294111299584*c*r^2 + 6262843206831353856*c*r^3 + 5676431893762775040*c*r^4 + 3046702230670565376*c*r^5 + 897664376600764416*c*r^6 + 112128410222567424*c*r^7 + 454780367274999808*c^2 + 2535315706054311936*c^2*r + 5798518783219900416*c^2*r^2 + 6971677107348602880*c^2*r^3 + 4652855980169564160*c^2*r^4 + 1636266555633733632*c^2*r^5 + 237156681193721856*c^2*r^6 + 523879870113087488*c^3 + 2384385009490477056*c^3*r + 4278095969644707840*c^3*r^2 + 3786839192274001920*c^3*r^3 + 1655683621938339840*c^3*r^4 + 286388743373365248*c^3*r^5 + 367416151064969216*c^4 + 1311628446807490560*c^4*r + 1732296010349936640*c^4*r^2 + 1004395533518684160*c^4*r^3 + 215969588153303040*c^4*r^4 + 160732536322555904*c^5 + 422306915265478656*c^5*r + 365286472684535808*c^5*r^2 + 104145988675534848*c^5*r^3 + 42862939941699584*c^6 + 73745833411805184*c^6*r + 31361962493116416*c^6*r^2 + 6375434822156288*c^7 + 5392053013315584*c^7*r + 405237077819392*c^8

theorem onsetG3_6_4M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_4M1B c r := by
 unfold onsetG3_6_4M1B
 positivity

def onsetG3_6_5M1B (c r : ℤ) : ℤ :=
 10678320837918720 + 82905460144496640*r + 276979943659991040*r^2 + 520431635855093760*r^3 + 602028108267264000*r^4 + 439467165510266880*r^5 + 197895798903398400*r^6 + 50312722164203520*r^7 + 5534812005488640*r^8 + 52328044385648640*c + 348279661075046400*c*r + 977557476074618880*c*r^2 + 1501277417781442560*c*r^3 + 1363753523321763840*c*r^4 + 733534567857100800*c*r^5 + 216546067776890880*c*r^6 + 27093702848163840*c*r^7 + 109426878860328960*c^2 + 611721094700728320*c^2*r + 1403038686243962880*c^2*r^2 + 1691686089908398080*c^2*r^3 + 1132114553168578560*c^2*r^4 + 399140824865126400*c^2*r^5 + 57979561798932480*c^2*r^6 + 127524223028428800*c^3 + 582404145719746560*c^3*r + 1048536770911580160*c^3*r^2 + 931218953443430400*c^3*r^3 + 408418977196339200*c^3*r^4 + 70843991197593600*c^3*r^5 + 90601309456465920*c^4 + 324730466969395200*c^4*r + 430550985564241920*c^4*r^2 + 250558802296750080*c^4*r^3 + 54058916433715200*c^4*r^4 + 40199747311288320*c^5 + 106091560308572160*c^5*r + 92158156679823360*c^5*r^2 + 26379378202705920*c^5*r^3 + 10884451052912640*c^6 + 18817024435077120*c^6*r + 8038805922201600*c^6*r^2 + 1645331529891840*c^7 + 1398708408975360*c^7*r + 106386047631360*c^8

theorem onsetG3_6_5M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_5M1B c r := by
 unfold onsetG3_6_5M1B
 positivity

def onsetG3_6_6M1B (c r : ℤ) : ℤ :=
 1853332389715968 + 14400150112825344*r + 48147602221716480*r^2 + 90537250786827264*r^3 + 104807422417824000*r^4 + 76552818258309120*r^5 + 34486363338029568*r^6 + 8768962623439872*r^7 + 964461414115584*r^8 + 9158244668547072*c + 61036704376811520*c*r + 171552138307393536*c*r^2 + 263808540078225408*c*r^3 + 239934383919046656*c*r^4 + 129189437320882176*c*r^5 + 38167337144272896*c*r^6 + 4777444481273856*c*r^7 + 19335508617678848*c^2 + 108300640026120192*c^2*r + 248876423274608640*c^2*r^2 + 300628822213730304*c^2*r^3 + 201522155916146688*c^2*r^4 + 71148768216035328*c^2*r^5 + 10346064853856256*c^2*r^6 + 22778654915043328*c^3 + 104293876307582976*c^3*r + 188226723568730112*c^3*r^2 + 167548474847674368*c^3*r^3 + 73633415079813120*c^3*r^4 + 12793917567320064*c^3*r^5 + 16380363391307776*c^4 + 58889805065011200*c^4*r + 78306807180607488*c^4*r^2 + 45691366192496640*c^4*r^3 + 9880864745472000*c^4*r^4 + 7365337446842368*c^5 + 19506158276935680*c^5*r + 16999683309600768*c^5*r^2 + 4880289631666176*c^5*r^3 + 2023218442534912*c^6 + 3511293145350144*c^6*r + 1505399598710784*c^6*r^2 + 310602166239232*c^7 + 265150119542784*c^7*r + 20416355434496*c^8

theorem onsetG3_6_6M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_6M1B c r := by
 unfold onsetG3_6_6M1B
 positivity

def onsetG3_6_7M1B (c r : ℤ) : ℤ :=
 238277064130560 + 1851652744445952*r + 6191551296258048*r^2 + 11642250068434944*r^3 + 13474669574467584*r^4 + 9838075313074176*r^5 + 4428914609000448*r^6 + 1124987986096128*r^7 + 123553568194560*r^8 + 1186649627885568*c + 7913632398852096*c*r + 22254624735952896*c*r^2 + 34236919393947648*c*r^3 + 31145522148163584*c*r^4 + 16769227507458048*c*r^5 + 4952396395118592*c*r^6 + 619414721630208*c*r^7 + 2527737959448576*c^2 + 14174361720078336*c^2*r + 32606522332618752*c^2*r^2 + 39420629128065024*c^2*r^3 + 26441156541542400*c^2*r^4 + 9337909751009280*c^2*r^5 + 1357721702313984*c^2*r^6 + 3008038184976384*c^3 + 13795266850799616*c^3*r + 24934463802630144*c^3*r^2 + 22223134652866560*c^3*r^3 + 9775765446451200*c^3*r^4 + 1699506364243968*c^3*r^5 + 2187668981514240*c^4 + 7881720742232064*c^4*r + 10500434112430080*c^4*r^2 + 6136746495344640*c^4*r^3 + 1328714192977920*c^4*r^4 + 996030076059648*c^5 + 2644588852641792*c^5*r + 2309976555651072*c^5*r^2 + 664405041807360*c^5*r^3 + 277359915958272*c^6 + 482759464255488*c^6*r + 207502214234112*c^6*r^2 + 43211479449600*c^7 + 37006568718336*c^7*r + 2885447319552*c^8

theorem onsetG3_6_7M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_7M1B c r := by
 unfold onsetG3_6_7M1B
 positivity

def onsetG3_6_8M1B (c r : ℤ) : ℤ :=
 22520023142400 + 174917689712640*r + 584512022513664*r^2 + 1098158407428096*r^3 + 1269619043551488*r^4 + 925681641550848*r^5 + 415994618737152*r^6 + 105436976956416*r^7 + 11549007703296*r^8 + 112964816240640*c + 753283710369792*c*r + 2117837138522112*c*r^2 + 3256578736846848*c*r^3 + 2960307377879040*c*r^4 + 1592138198181888*c*r^5 + 469498072393728*c*r^6 + 58606782861312*c*r^7 + 242624709648384*c^2 + 1360988010160128*c^2*r + 3131263371737088*c^2*r^2 + 3785235431362560*c^2*r^3 + 2537845992622080*c^2*r^4 + 895533978157056*c^2*r^5 + 130045401980928*c^2*r^6 + 291438916091904*c^3 + 1337613526867968*c^3*r + 2419003700305920*c^3*r^2 + 2156490045480960*c^3*r^3 + 948501449441280*c^3*r^4 + 164803263012864*c^3*r^5 + 214193068658688*c^4 + 772616941608960*c^4*r + 1030261142937600*c^4*r^2 + 602450380062720*c^4*r^3 + 130459041054720*c^4*r^4 + 98664832745472*c^5 + 262383871131648*c^5*r + 229470971756544*c^5*r^2 + 66056543207424*c^5*r^3 + 27829340700672*c^6 + 48532136067072*c^6*r + 20892313387008*c^6*r^2 + 4396606685184*c^7 + 3773669179392*c^7*r + 298029613056*c^8

theorem onsetG3_6_8M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_8M1B c r := by
 unfold onsetG3_6_8M1B
 positivity

def onsetG3_6_9M1B (c r : ℤ) : ℤ :=
 1525806858240 + 11837771366400*r + 39503285821440*r^2 + 74094732472320*r^3 + 85494109317120*r^4 + 62186999132160*r^5 + 27868347924480*r^6 + 7040243589120*r^7 + 768196638720*r^8 + 7704776540160*c + 51335934074880*c*r + 144176444375040*c*r^2 + 221397451806720*c*r^3 + 200910878300160*c*r^4 + 107826134169600*c*r^5 + 31713871472640*c*r^6 + 3946450636800*c*r^7 + 16674492334080*c^2 + 93491106078720*c^2*r + 214939831357440*c^2*r^2 + 259554893015040*c^2*r^3 + 173768873564160*c^2*r^4 + 61201802188800*c^2*r^5 + 8866098984960*c^2*r^6 + 20202878976000*c^3 + 92715616788480*c^3*r + 167603924275200*c^3*r^2 + 149300731883520*c^3*r^3 + 65589351690240*c^3*r^4 + 11377064079360*c^3*r^5 + 14993116938240*c^4 + 54096046448640*c^4*r + 72129760174080*c^4*r^2 + 42157692272640*c^4*r^3 + 9120396902400*c^4*r^4 + 6981686476800*c^5 + 18578153717760*c^5*r + 16251408875520*c^5*r^2 + 4677126881280*c^5*r^3 + 1993025126400*c^6 + 3478951526400*c^6*r + 1498381516800*c^6*r^2 + 319036784640*c^7 + 274170839040*c^7*r + 21937520640*c^8

theorem onsetG3_6_9M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_9M1B c r := by
 unfold onsetG3_6_9M1B
 positivity

def onsetG3_6_10M1B (c r : ℤ) : ℤ :=
 70346981376 + 544792485888*r + 1814156467200*r^2 + 3394335587328*r^3 + 3905301738240*r^4 + 2831212984320*r^5 + 1263922361856*r^6 + 317902040064*r^7 + 34515548928*r^8 + 357389942784*c + 2377536000000*c*r + 6664733816832*c*r^2 + 10211317917696*c*r^3 + 9241632755712*c*r^4 + 4944222001152*c*r^5 + 1448845719552*c*r^6 + 179526316032*c*r^7 + 778850594816*c^2 + 4361294106624*c^2*r + 10010511329280*c^2*r^2 + 12063967469568*c^2*r^3 + 8056715175936*c^2*r^4 + 2829147181056*c^2*r^5 + 408401989632*c^2*r^6 + 951154548736*c^3 + 4360763645952*c^3*r + 7872360136704*c^3*r^2 + 7000164089856*c^3*r^3 + 3068281036800*c^3*r^4 + 530731450368*c^3*r^5 + 712217669632*c^4 + 2567976714240*c^4*r + 3420345901056*c^4*r^2 + 1996006440960*c^4*r^3 + 430927257600*c^4*r^4 + 334993555456*c^5 + 891081031680*c^5*r + 778848731136*c^5*r^2 + 223857672192*c^5*r^3 + 96702398464*c^6 + 168788164608*c^6*r + 72656683008*c^6*r^2 + 15671885824*c^7 + 13470793728*c^7*r + 1092288512*c^8

theorem onsetG3_6_10M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_10M1B c r := by
 unfold onsetG3_6_10M1B
 positivity

def onsetG3_6_11M1B (c r : ℤ) : ℤ :=
 1981808640 + 15309471744*r + 50833391616*r^2 + 94795481088*r^3 + 108652658688*r^4 + 78430851072*r^5 + 34843447296*r^6 + 8716087296*r^7 + 940584960*r^8 + 10123739136*c + 67191570432*c*r + 187839332352*c*r^2 + 286885380096*c*r^3 + 258693378048*c*r^4 + 137820082176*c*r^5 + 40194330624*c*r^6 + 4953747456*c*r^7 + 22201761792*c^2 + 124058468352*c^2*r + 284030337024*c^2*r^2 + 341267447808*c^2*r^3 + 227110625280*c^2*r^4 + 79427174400*c^2*r^5 + 11412430848*c^2*r^6 + 27309047808*c^3 + 124966797312*c^3*r + 225073594368*c^3*r^2 + 199574323200*c^3*r^3 + 87184097280*c^3*r^4 + 15021490176*c^3*r^5 + 20616314880*c^4 + 74211852288*c^4*r + 98636267520*c^4*r^2 + 57410519040*c^4*r^3 + 12355338240*c^4*r^4 + 9786556416*c^5 + 25996099584*c^5*r + 22679322624*c^5*r^2 + 6502809600*c^5*r^3 + 2854354944*c^6 + 4976541696*c^6*r + 2138701824*c^6*r^2 + 467927040*c^7 + 401866752*c^7*r + 33030144*c^8

theorem onsetG3_6_11M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_11M1B c r := by
 unfold onsetG3_6_11M1B
 positivity

def onsetG3_6_12M1B (c r : ℤ) : ℤ :=
 25804800 + 198696960*r + 657312768*r^2 + 1220631552*r^3 + 1392443136*r^4 + 999806976*r^5 + 441552384*r^6 + 109734912*r^7 + 11757312*r^8 + 132464640*c + 876417024*c*r + 2441263104*c*r^2 + 3713181696*c*r^3 + 3332689920*c*r^4 + 1766209536*c*r^5 + 512096256*c*r^6 + 62705664*c*r^7 + 292139008*c^2 + 1627508736*c^2*r + 3713181696*c^2*r^2 + 4443586560*c^2*r^3 + 2943682560*c^2*r^4 + 1024192512*c^2*r^5 + 146313216*c^2*r^6 + 361668608*c^3 + 1650302976*c^3*r + 2962391040*c^3*r^2 + 2616606720*c^3*r^3 + 1137991680*c^3*r^4 + 195084288*c^3*r^5 + 275050496*c^4 + 987463680*c^4*r + 1308303360*c^4*r^2 + 758661120*c^4*r^3 + 162570240*c^4*r^4 + 131661824*c^5 + 348880896*c^5*r + 303464448*c^5*r^2 + 86704128*c^5*r^3 + 38764544*c^6 + 67436544*c^6*r + 28901376*c^6*r^2 + 6422528*c^7 + 5505024*c^7*r + 458752*c^8

theorem onsetG3_6_12M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_12M1B c r := by
 unfold onsetG3_6_12M1B
 positivity

def onsetG3_6_13M1B (c r : ℤ) : ℤ :=
 0

theorem onsetG3_6_13M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_13M1B c r := by
 unfold onsetG3_6_13M1B
 positivity

def onsetG3_6_14M1B (c r : ℤ) : ℤ :=
 0

theorem onsetG3_6_14M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG3_6_14M1B c r := by
 unfold onsetG3_6_14M1B
 positivity

theorem onset_stage3_6_0M1B (n c r : ℤ) :
 onsetValue3_6M1B (n+7) (5 + 3*r + 2*c) (3 + 2*r + 1*c)=onsetP3_6_0_0M1B c r*n^0 + onsetP3_6_0_1M1B c r*n^1 + onsetP3_6_0_2M1B c r*n^2 + onsetP3_6_0_3M1B c r*n^3 + onsetP3_6_0_4M1B c r*n^4 + onsetP3_6_0_5M1B c r*n^5 + onsetP3_6_0_6M1B c r*n^6 + onsetP3_6_0_7M1B c r*n^7 := by
 unfold onsetValue3_6M1B backShape3M94 onsetCorrection3_6M1B onsetP3_6_0_0M1B onsetP3_6_0_1M1B onsetP3_6_0_2M1B onsetP3_6_0_3M1B onsetP3_6_0_4M1B onsetP3_6_0_5M1B onsetP3_6_0_6M1B onsetP3_6_0_7M1B
 ring

theorem onset_stage3_6_1M1B (n c r : ℤ) :
 onsetValue3_7M1B (n+7) (5 + 3*r + 2*c) (3 + 2*r + 1*c)=onsetP3_6_1_0M1B c r*n^0 + onsetP3_6_1_1M1B c r*n^1 + onsetP3_6_1_2M1B c r*n^2 + onsetP3_6_1_3M1B c r*n^3 + onsetP3_6_1_4M1B c r*n^4 + onsetP3_6_1_5M1B c r*n^5 + onsetP3_6_1_6M1B c r*n^6 + onsetP3_6_1_7M1B c r*n^7 := by
 unfold onsetValue3_7M1B backShape3M94 onsetCorrection3_7M1B onsetP3_6_1_0M1B onsetP3_6_1_1M1B onsetP3_6_1_2M1B onsetP3_6_1_3M1B onsetP3_6_1_4M1B onsetP3_6_1_5M1B onsetP3_6_1_6M1B onsetP3_6_1_7M1B
 ring

theorem onset_stage3_6_2M1B (n c r : ℤ) :
 onsetValue3_8M1B (n+7) (5 + 3*r + 2*c) (3 + 2*r + 1*c)=onsetP3_6_2_0M1B c r*n^0 + onsetP3_6_2_1M1B c r*n^1 + onsetP3_6_2_2M1B c r*n^2 + onsetP3_6_2_3M1B c r*n^3 + onsetP3_6_2_4M1B c r*n^4 + onsetP3_6_2_5M1B c r*n^5 + onsetP3_6_2_6M1B c r*n^6 + onsetP3_6_2_7M1B c r*n^7 := by
 unfold onsetValue3_8M1B backShape3M94 onsetCorrection3_8M1B onsetP3_6_2_0M1B onsetP3_6_2_1M1B onsetP3_6_2_2M1B onsetP3_6_2_3M1B onsetP3_6_2_4M1B onsetP3_6_2_5M1B onsetP3_6_2_6M1B onsetP3_6_2_7M1B
 ring

theorem onset_column3_6_0M1B (c r : ℤ) :
 (onsetP3_6_1_0M1B c r*onsetP3_6_1_0M1B c r)-(onsetP3_6_0_0M1B c r*onsetP3_6_2_0M1B c r)=onsetG3_6_0M1B c r := by
 unfold onsetG3_6_0M1B onsetP3_6_0_0M1B onsetP3_6_1_0M1B onsetP3_6_2_0M1B
 ring

theorem onset_column3_6_1M1B (c r : ℤ) :
 (onsetP3_6_1_0M1B c r*onsetP3_6_1_1M1B c r + onsetP3_6_1_1M1B c r*onsetP3_6_1_0M1B c r)-(onsetP3_6_0_0M1B c r*onsetP3_6_2_1M1B c r + onsetP3_6_0_1M1B c r*onsetP3_6_2_0M1B c r)=onsetG3_6_1M1B c r := by
 unfold onsetG3_6_1M1B onsetP3_6_0_0M1B onsetP3_6_0_1M1B onsetP3_6_1_0M1B onsetP3_6_1_1M1B onsetP3_6_2_0M1B onsetP3_6_2_1M1B
 ring

theorem onset_column3_6_2M1B (c r : ℤ) :
 (onsetP3_6_1_0M1B c r*onsetP3_6_1_2M1B c r + onsetP3_6_1_1M1B c r*onsetP3_6_1_1M1B c r + onsetP3_6_1_2M1B c r*onsetP3_6_1_0M1B c r)-(onsetP3_6_0_0M1B c r*onsetP3_6_2_2M1B c r + onsetP3_6_0_1M1B c r*onsetP3_6_2_1M1B c r + onsetP3_6_0_2M1B c r*onsetP3_6_2_0M1B c r)=onsetG3_6_2M1B c r := by
 unfold onsetG3_6_2M1B onsetP3_6_0_0M1B onsetP3_6_0_1M1B onsetP3_6_0_2M1B onsetP3_6_1_0M1B onsetP3_6_1_1M1B onsetP3_6_1_2M1B onsetP3_6_2_0M1B onsetP3_6_2_1M1B onsetP3_6_2_2M1B
 ring

theorem onset_column3_6_3M1B (c r : ℤ) :
 (onsetP3_6_1_0M1B c r*onsetP3_6_1_3M1B c r + onsetP3_6_1_1M1B c r*onsetP3_6_1_2M1B c r + onsetP3_6_1_2M1B c r*onsetP3_6_1_1M1B c r + onsetP3_6_1_3M1B c r*onsetP3_6_1_0M1B c r)-(onsetP3_6_0_0M1B c r*onsetP3_6_2_3M1B c r + onsetP3_6_0_1M1B c r*onsetP3_6_2_2M1B c r + onsetP3_6_0_2M1B c r*onsetP3_6_2_1M1B c r + onsetP3_6_0_3M1B c r*onsetP3_6_2_0M1B c r)=onsetG3_6_3M1B c r := by
 unfold onsetG3_6_3M1B onsetP3_6_0_0M1B onsetP3_6_0_1M1B onsetP3_6_0_2M1B onsetP3_6_0_3M1B onsetP3_6_1_0M1B onsetP3_6_1_1M1B onsetP3_6_1_2M1B onsetP3_6_1_3M1B onsetP3_6_2_0M1B onsetP3_6_2_1M1B onsetP3_6_2_2M1B onsetP3_6_2_3M1B
 ring

theorem onset_column3_6_4M1B (c r : ℤ) :
 (onsetP3_6_1_0M1B c r*onsetP3_6_1_4M1B c r + onsetP3_6_1_1M1B c r*onsetP3_6_1_3M1B c r + onsetP3_6_1_2M1B c r*onsetP3_6_1_2M1B c r + onsetP3_6_1_3M1B c r*onsetP3_6_1_1M1B c r + onsetP3_6_1_4M1B c r*onsetP3_6_1_0M1B c r)-(onsetP3_6_0_0M1B c r*onsetP3_6_2_4M1B c r + onsetP3_6_0_1M1B c r*onsetP3_6_2_3M1B c r + onsetP3_6_0_2M1B c r*onsetP3_6_2_2M1B c r + onsetP3_6_0_3M1B c r*onsetP3_6_2_1M1B c r + onsetP3_6_0_4M1B c r*onsetP3_6_2_0M1B c r)=onsetG3_6_4M1B c r := by
 unfold onsetG3_6_4M1B onsetP3_6_0_0M1B onsetP3_6_0_1M1B onsetP3_6_0_2M1B onsetP3_6_0_3M1B onsetP3_6_0_4M1B onsetP3_6_1_0M1B onsetP3_6_1_1M1B onsetP3_6_1_2M1B onsetP3_6_1_3M1B onsetP3_6_1_4M1B onsetP3_6_2_0M1B onsetP3_6_2_1M1B onsetP3_6_2_2M1B onsetP3_6_2_3M1B onsetP3_6_2_4M1B
 ring

theorem onset_column3_6_5M1B (c r : ℤ) :
 (onsetP3_6_1_0M1B c r*onsetP3_6_1_5M1B c r + onsetP3_6_1_1M1B c r*onsetP3_6_1_4M1B c r + onsetP3_6_1_2M1B c r*onsetP3_6_1_3M1B c r + onsetP3_6_1_3M1B c r*onsetP3_6_1_2M1B c r + onsetP3_6_1_4M1B c r*onsetP3_6_1_1M1B c r + onsetP3_6_1_5M1B c r*onsetP3_6_1_0M1B c r)-(onsetP3_6_0_0M1B c r*onsetP3_6_2_5M1B c r + onsetP3_6_0_1M1B c r*onsetP3_6_2_4M1B c r + onsetP3_6_0_2M1B c r*onsetP3_6_2_3M1B c r + onsetP3_6_0_3M1B c r*onsetP3_6_2_2M1B c r + onsetP3_6_0_4M1B c r*onsetP3_6_2_1M1B c r + onsetP3_6_0_5M1B c r*onsetP3_6_2_0M1B c r)=onsetG3_6_5M1B c r := by
 unfold onsetG3_6_5M1B onsetP3_6_0_0M1B onsetP3_6_0_1M1B onsetP3_6_0_2M1B onsetP3_6_0_3M1B onsetP3_6_0_4M1B onsetP3_6_0_5M1B onsetP3_6_1_0M1B onsetP3_6_1_1M1B onsetP3_6_1_2M1B onsetP3_6_1_3M1B onsetP3_6_1_4M1B onsetP3_6_1_5M1B onsetP3_6_2_0M1B onsetP3_6_2_1M1B onsetP3_6_2_2M1B onsetP3_6_2_3M1B onsetP3_6_2_4M1B onsetP3_6_2_5M1B
 ring

theorem onset_column3_6_6M1B (c r : ℤ) :
 (onsetP3_6_1_0M1B c r*onsetP3_6_1_6M1B c r + onsetP3_6_1_1M1B c r*onsetP3_6_1_5M1B c r + onsetP3_6_1_2M1B c r*onsetP3_6_1_4M1B c r + onsetP3_6_1_3M1B c r*onsetP3_6_1_3M1B c r + onsetP3_6_1_4M1B c r*onsetP3_6_1_2M1B c r + onsetP3_6_1_5M1B c r*onsetP3_6_1_1M1B c r + onsetP3_6_1_6M1B c r*onsetP3_6_1_0M1B c r)-(onsetP3_6_0_0M1B c r*onsetP3_6_2_6M1B c r + onsetP3_6_0_1M1B c r*onsetP3_6_2_5M1B c r + onsetP3_6_0_2M1B c r*onsetP3_6_2_4M1B c r + onsetP3_6_0_3M1B c r*onsetP3_6_2_3M1B c r + onsetP3_6_0_4M1B c r*onsetP3_6_2_2M1B c r + onsetP3_6_0_5M1B c r*onsetP3_6_2_1M1B c r + onsetP3_6_0_6M1B c r*onsetP3_6_2_0M1B c r)=onsetG3_6_6M1B c r := by
 unfold onsetG3_6_6M1B onsetP3_6_0_0M1B onsetP3_6_0_1M1B onsetP3_6_0_2M1B onsetP3_6_0_3M1B onsetP3_6_0_4M1B onsetP3_6_0_5M1B onsetP3_6_0_6M1B onsetP3_6_1_0M1B onsetP3_6_1_1M1B onsetP3_6_1_2M1B onsetP3_6_1_3M1B onsetP3_6_1_4M1B onsetP3_6_1_5M1B onsetP3_6_1_6M1B onsetP3_6_2_0M1B onsetP3_6_2_1M1B onsetP3_6_2_2M1B onsetP3_6_2_3M1B onsetP3_6_2_4M1B onsetP3_6_2_5M1B onsetP3_6_2_6M1B
 ring

theorem onset_column3_6_7M1B (c r : ℤ) :
 (onsetP3_6_1_0M1B c r*onsetP3_6_1_7M1B c r + onsetP3_6_1_1M1B c r*onsetP3_6_1_6M1B c r + onsetP3_6_1_2M1B c r*onsetP3_6_1_5M1B c r + onsetP3_6_1_3M1B c r*onsetP3_6_1_4M1B c r + onsetP3_6_1_4M1B c r*onsetP3_6_1_3M1B c r + onsetP3_6_1_5M1B c r*onsetP3_6_1_2M1B c r + onsetP3_6_1_6M1B c r*onsetP3_6_1_1M1B c r + onsetP3_6_1_7M1B c r*onsetP3_6_1_0M1B c r)-(onsetP3_6_0_0M1B c r*onsetP3_6_2_7M1B c r + onsetP3_6_0_1M1B c r*onsetP3_6_2_6M1B c r + onsetP3_6_0_2M1B c r*onsetP3_6_2_5M1B c r + onsetP3_6_0_3M1B c r*onsetP3_6_2_4M1B c r + onsetP3_6_0_4M1B c r*onsetP3_6_2_3M1B c r + onsetP3_6_0_5M1B c r*onsetP3_6_2_2M1B c r + onsetP3_6_0_6M1B c r*onsetP3_6_2_1M1B c r + onsetP3_6_0_7M1B c r*onsetP3_6_2_0M1B c r)=onsetG3_6_7M1B c r := by
 unfold onsetG3_6_7M1B onsetP3_6_0_0M1B onsetP3_6_0_1M1B onsetP3_6_0_2M1B onsetP3_6_0_3M1B onsetP3_6_0_4M1B onsetP3_6_0_5M1B onsetP3_6_0_6M1B onsetP3_6_0_7M1B onsetP3_6_1_0M1B onsetP3_6_1_1M1B onsetP3_6_1_2M1B onsetP3_6_1_3M1B onsetP3_6_1_4M1B onsetP3_6_1_5M1B onsetP3_6_1_6M1B onsetP3_6_1_7M1B onsetP3_6_2_0M1B onsetP3_6_2_1M1B onsetP3_6_2_2M1B onsetP3_6_2_3M1B onsetP3_6_2_4M1B onsetP3_6_2_5M1B onsetP3_6_2_6M1B onsetP3_6_2_7M1B
 ring

theorem onset_column3_6_8M1B (c r : ℤ) :
 (onsetP3_6_1_1M1B c r*onsetP3_6_1_7M1B c r + onsetP3_6_1_2M1B c r*onsetP3_6_1_6M1B c r + onsetP3_6_1_3M1B c r*onsetP3_6_1_5M1B c r + onsetP3_6_1_4M1B c r*onsetP3_6_1_4M1B c r + onsetP3_6_1_5M1B c r*onsetP3_6_1_3M1B c r + onsetP3_6_1_6M1B c r*onsetP3_6_1_2M1B c r + onsetP3_6_1_7M1B c r*onsetP3_6_1_1M1B c r)-(onsetP3_6_0_1M1B c r*onsetP3_6_2_7M1B c r + onsetP3_6_0_2M1B c r*onsetP3_6_2_6M1B c r + onsetP3_6_0_3M1B c r*onsetP3_6_2_5M1B c r + onsetP3_6_0_4M1B c r*onsetP3_6_2_4M1B c r + onsetP3_6_0_5M1B c r*onsetP3_6_2_3M1B c r + onsetP3_6_0_6M1B c r*onsetP3_6_2_2M1B c r + onsetP3_6_0_7M1B c r*onsetP3_6_2_1M1B c r)=onsetG3_6_8M1B c r := by
 unfold onsetG3_6_8M1B onsetP3_6_0_1M1B onsetP3_6_0_2M1B onsetP3_6_0_3M1B onsetP3_6_0_4M1B onsetP3_6_0_5M1B onsetP3_6_0_6M1B onsetP3_6_0_7M1B onsetP3_6_1_1M1B onsetP3_6_1_2M1B onsetP3_6_1_3M1B onsetP3_6_1_4M1B onsetP3_6_1_5M1B onsetP3_6_1_6M1B onsetP3_6_1_7M1B onsetP3_6_2_1M1B onsetP3_6_2_2M1B onsetP3_6_2_3M1B onsetP3_6_2_4M1B onsetP3_6_2_5M1B onsetP3_6_2_6M1B onsetP3_6_2_7M1B
 ring

theorem onset_column3_6_9M1B (c r : ℤ) :
 (onsetP3_6_1_2M1B c r*onsetP3_6_1_7M1B c r + onsetP3_6_1_3M1B c r*onsetP3_6_1_6M1B c r + onsetP3_6_1_4M1B c r*onsetP3_6_1_5M1B c r + onsetP3_6_1_5M1B c r*onsetP3_6_1_4M1B c r + onsetP3_6_1_6M1B c r*onsetP3_6_1_3M1B c r + onsetP3_6_1_7M1B c r*onsetP3_6_1_2M1B c r)-(onsetP3_6_0_2M1B c r*onsetP3_6_2_7M1B c r + onsetP3_6_0_3M1B c r*onsetP3_6_2_6M1B c r + onsetP3_6_0_4M1B c r*onsetP3_6_2_5M1B c r + onsetP3_6_0_5M1B c r*onsetP3_6_2_4M1B c r + onsetP3_6_0_6M1B c r*onsetP3_6_2_3M1B c r + onsetP3_6_0_7M1B c r*onsetP3_6_2_2M1B c r)=onsetG3_6_9M1B c r := by
 unfold onsetG3_6_9M1B onsetP3_6_0_2M1B onsetP3_6_0_3M1B onsetP3_6_0_4M1B onsetP3_6_0_5M1B onsetP3_6_0_6M1B onsetP3_6_0_7M1B onsetP3_6_1_2M1B onsetP3_6_1_3M1B onsetP3_6_1_4M1B onsetP3_6_1_5M1B onsetP3_6_1_6M1B onsetP3_6_1_7M1B onsetP3_6_2_2M1B onsetP3_6_2_3M1B onsetP3_6_2_4M1B onsetP3_6_2_5M1B onsetP3_6_2_6M1B onsetP3_6_2_7M1B
 ring

theorem onset_column3_6_10M1B (c r : ℤ) :
 (onsetP3_6_1_3M1B c r*onsetP3_6_1_7M1B c r + onsetP3_6_1_4M1B c r*onsetP3_6_1_6M1B c r + onsetP3_6_1_5M1B c r*onsetP3_6_1_5M1B c r + onsetP3_6_1_6M1B c r*onsetP3_6_1_4M1B c r + onsetP3_6_1_7M1B c r*onsetP3_6_1_3M1B c r)-(onsetP3_6_0_3M1B c r*onsetP3_6_2_7M1B c r + onsetP3_6_0_4M1B c r*onsetP3_6_2_6M1B c r + onsetP3_6_0_5M1B c r*onsetP3_6_2_5M1B c r + onsetP3_6_0_6M1B c r*onsetP3_6_2_4M1B c r + onsetP3_6_0_7M1B c r*onsetP3_6_2_3M1B c r)=onsetG3_6_10M1B c r := by
 unfold onsetG3_6_10M1B onsetP3_6_0_3M1B onsetP3_6_0_4M1B onsetP3_6_0_5M1B onsetP3_6_0_6M1B onsetP3_6_0_7M1B onsetP3_6_1_3M1B onsetP3_6_1_4M1B onsetP3_6_1_5M1B onsetP3_6_1_6M1B onsetP3_6_1_7M1B onsetP3_6_2_3M1B onsetP3_6_2_4M1B onsetP3_6_2_5M1B onsetP3_6_2_6M1B onsetP3_6_2_7M1B
 ring

theorem onset_column3_6_11M1B (c r : ℤ) :
 (onsetP3_6_1_4M1B c r*onsetP3_6_1_7M1B c r + onsetP3_6_1_5M1B c r*onsetP3_6_1_6M1B c r + onsetP3_6_1_6M1B c r*onsetP3_6_1_5M1B c r + onsetP3_6_1_7M1B c r*onsetP3_6_1_4M1B c r)-(onsetP3_6_0_4M1B c r*onsetP3_6_2_7M1B c r + onsetP3_6_0_5M1B c r*onsetP3_6_2_6M1B c r + onsetP3_6_0_6M1B c r*onsetP3_6_2_5M1B c r + onsetP3_6_0_7M1B c r*onsetP3_6_2_4M1B c r)=onsetG3_6_11M1B c r := by
 unfold onsetG3_6_11M1B onsetP3_6_0_4M1B onsetP3_6_0_5M1B onsetP3_6_0_6M1B onsetP3_6_0_7M1B onsetP3_6_1_4M1B onsetP3_6_1_5M1B onsetP3_6_1_6M1B onsetP3_6_1_7M1B onsetP3_6_2_4M1B onsetP3_6_2_5M1B onsetP3_6_2_6M1B onsetP3_6_2_7M1B
 ring

theorem onset_column3_6_12M1B (c r : ℤ) :
 (onsetP3_6_1_5M1B c r*onsetP3_6_1_7M1B c r + onsetP3_6_1_6M1B c r*onsetP3_6_1_6M1B c r + onsetP3_6_1_7M1B c r*onsetP3_6_1_5M1B c r)-(onsetP3_6_0_5M1B c r*onsetP3_6_2_7M1B c r + onsetP3_6_0_6M1B c r*onsetP3_6_2_6M1B c r + onsetP3_6_0_7M1B c r*onsetP3_6_2_5M1B c r)=onsetG3_6_12M1B c r := by
 unfold onsetG3_6_12M1B onsetP3_6_0_5M1B onsetP3_6_0_6M1B onsetP3_6_0_7M1B onsetP3_6_1_5M1B onsetP3_6_1_6M1B onsetP3_6_1_7M1B onsetP3_6_2_5M1B onsetP3_6_2_6M1B onsetP3_6_2_7M1B
 ring

theorem onset_column3_6_13M1B (c r : ℤ) :
 (onsetP3_6_1_6M1B c r*onsetP3_6_1_7M1B c r + onsetP3_6_1_7M1B c r*onsetP3_6_1_6M1B c r)-(onsetP3_6_0_6M1B c r*onsetP3_6_2_7M1B c r + onsetP3_6_0_7M1B c r*onsetP3_6_2_6M1B c r)=onsetG3_6_13M1B c r := by
 unfold onsetG3_6_13M1B onsetP3_6_0_6M1B onsetP3_6_0_7M1B onsetP3_6_1_6M1B onsetP3_6_1_7M1B onsetP3_6_2_6M1B onsetP3_6_2_7M1B
 ring

theorem onset_column3_6_14M1B (c r : ℤ) :
 (onsetP3_6_1_7M1B c r*onsetP3_6_1_7M1B c r)-(onsetP3_6_0_7M1B c r*onsetP3_6_2_7M1B c r)=onsetG3_6_14M1B c r := by
 unfold onsetG3_6_14M1B onsetP3_6_0_7M1B onsetP3_6_1_7M1B onsetP3_6_2_7M1B
 ring

attribute [local irreducible] onsetP3_6_0_0M1B onsetP3_6_0_1M1B onsetP3_6_0_2M1B onsetP3_6_0_3M1B onsetP3_6_0_4M1B onsetP3_6_0_5M1B onsetP3_6_0_6M1B onsetP3_6_0_7M1B onsetP3_6_1_0M1B onsetP3_6_1_1M1B onsetP3_6_1_2M1B onsetP3_6_1_3M1B onsetP3_6_1_4M1B onsetP3_6_1_5M1B onsetP3_6_1_6M1B onsetP3_6_1_7M1B onsetP3_6_2_0M1B onsetP3_6_2_1M1B onsetP3_6_2_2M1B onsetP3_6_2_3M1B onsetP3_6_2_4M1B onsetP3_6_2_5M1B onsetP3_6_2_6M1B onsetP3_6_2_7M1B onsetG3_6_0M1B onsetG3_6_1M1B onsetG3_6_2M1B onsetG3_6_3M1B onsetG3_6_4M1B onsetG3_6_5M1B onsetG3_6_6M1B onsetG3_6_7M1B onsetG3_6_8M1B onsetG3_6_9M1B onsetG3_6_10M1B onsetG3_6_11M1B onsetG3_6_12M1B onsetG3_6_13M1B onsetG3_6_14M1B

theorem onset_columns_lc3_6M1B (n c r : ℤ) (hn : 0≤n) (hc : 0≤c) (hr : 0≤r) :
 onsetValue3_6M1B (n+7) (5 + 3*r + 2*c) (3 + 2*r + 1*c)*
 onsetValue3_8M1B (n+7) (5 + 3*r + 2*c) (3 + 2*r + 1*c)≤
 onsetValue3_7M1B (n+7) (5 + 3*r + 2*c) (3 + 2*r + 1*c)^2 := by
 apply sub_nonneg.mp
 rw [onset_stage3_6_0M1B,onset_stage3_6_1M1B,onset_stage3_6_2M1B]
 have hgap : (onsetP3_6_1_0M1B c r*n^0 + onsetP3_6_1_1M1B c r*n^1 + onsetP3_6_1_2M1B c r*n^2 + onsetP3_6_1_3M1B c r*n^3 + onsetP3_6_1_4M1B c r*n^4 + onsetP3_6_1_5M1B c r*n^5 + onsetP3_6_1_6M1B c r*n^6 + onsetP3_6_1_7M1B c r*n^7)^2-(onsetP3_6_0_0M1B c r*n^0 + onsetP3_6_0_1M1B c r*n^1 + onsetP3_6_0_2M1B c r*n^2 + onsetP3_6_0_3M1B c r*n^3 + onsetP3_6_0_4M1B c r*n^4 + onsetP3_6_0_5M1B c r*n^5 + onsetP3_6_0_6M1B c r*n^6 + onsetP3_6_0_7M1B c r*n^7)*(onsetP3_6_2_0M1B c r*n^0 + onsetP3_6_2_1M1B c r*n^1 + onsetP3_6_2_2M1B c r*n^2 + onsetP3_6_2_3M1B c r*n^3 + onsetP3_6_2_4M1B c r*n^4 + onsetP3_6_2_5M1B c r*n^5 + onsetP3_6_2_6M1B c r*n^6 + onsetP3_6_2_7M1B c r*n^7)=onsetG3_6_0M1B c r*n^0 + onsetG3_6_1M1B c r*n^1 + onsetG3_6_2M1B c r*n^2 + onsetG3_6_3M1B c r*n^3 + onsetG3_6_4M1B c r*n^4 + onsetG3_6_5M1B c r*n^5 + onsetG3_6_6M1B c r*n^6 + onsetG3_6_7M1B c r*n^7 + onsetG3_6_8M1B c r*n^8 + onsetG3_6_9M1B c r*n^9 + onsetG3_6_10M1B c r*n^10 + onsetG3_6_11M1B c r*n^11 + onsetG3_6_12M1B c r*n^12 + onsetG3_6_13M1B c r*n^13 + onsetG3_6_14M1B c r*n^14 := by
  rw [←onset_column3_6_0M1B,←onset_column3_6_1M1B,←onset_column3_6_2M1B,←onset_column3_6_3M1B,←onset_column3_6_4M1B,←onset_column3_6_5M1B,←onset_column3_6_6M1B,←onset_column3_6_7M1B,←onset_column3_6_8M1B,←onset_column3_6_9M1B,←onset_column3_6_10M1B,←onset_column3_6_11M1B,←onset_column3_6_12M1B,←onset_column3_6_13M1B,←onset_column3_6_14M1B]
  ring
 rw [hgap]
 have h0 := onsetG3_6_0M1B_nonneg c r hc hr
 have h1 := onsetG3_6_1M1B_nonneg c r hc hr
 have h2 := onsetG3_6_2M1B_nonneg c r hc hr
 have h3 := onsetG3_6_3M1B_nonneg c r hc hr
 have h4 := onsetG3_6_4M1B_nonneg c r hc hr
 have h5 := onsetG3_6_5M1B_nonneg c r hc hr
 have h6 := onsetG3_6_6M1B_nonneg c r hc hr
 have h7 := onsetG3_6_7M1B_nonneg c r hc hr
 have h8 := onsetG3_6_8M1B_nonneg c r hc hr
 have h9 := onsetG3_6_9M1B_nonneg c r hc hr
 have h10 := onsetG3_6_10M1B_nonneg c r hc hr
 have h11 := onsetG3_6_11M1B_nonneg c r hc hr
 have h12 := onsetG3_6_12M1B_nonneg c r hc hr
 have h13 := onsetG3_6_13M1B_nonneg c r hc hr
 have h14 := onsetG3_6_14M1B_nonneg c r hc hr
 positivity
end
end MathGKM.Markov
