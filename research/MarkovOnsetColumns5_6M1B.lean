import MarkovOnsetValues5M1B
/-! Machine-authored 1b02dddc. Column-wise exact onset gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false

def onsetP5_6_0_0M1B (c r : ℤ) : ℤ :=
 6388290720 + 8535875040*r + 4129332480*r^2 + 856880640*r^3 + 63866880*r^4 + 30317978880*c + 28870521120*c*r + 8860078080*c*r^2 + 872847360*c*r^3 + 50327454240*c^2 + 30461598720*c^2*r + 4464875520*c^2*r^2 + 34821642240*c^3 + 10131609600*c^3*r + 8605255680*c^4

def onsetP5_6_0_1M1B (c r : ℤ) : ℤ :=
 5037142752 + 6742990464*r + 3276807840*r^2 + 687013824*r^3 + 52363008*r^4 + 24335400096*c + 23322200928*c*r + 7237698048*c*r^2 + 728046336*c*r^3 + 41400155520*c^2 + 25357030272*c^2*r + 3788428032*c^2*r^2 + 29541931776*c^3 + 8743954176*c^3*r + 7552965888*c^4

def onsetP5_6_0_2M1B (c r : ℤ) : ℤ :=
 1722064512 + 2304781696*r + 1121438304*r^2 + 236239136*r^3 + 18228672*r^4 + 8452331776*c + 8126339200*c*r + 2537170944*c*r^2 + 258272000*c*r^3 + 14691730816*c^2 + 9063527424*c^2*r + 1369471488*c^2*r^2 + 10768868096*c^3 + 3220753536*c^3*r + 2834620544*c^4

def onsetP5_6_0_3M1B (c r : ℤ) : ℤ :=
 331121280 + 442064896*r + 214603424*r^2 + 45162656*r^3 + 3493504*r^4 + 1647729664*c + 1583778112*c*r + 494817792*c*r^2 + 50526784*c*r^3 + 2917169024*c^2 + 1803738048*c^2*r + 273505344*c^2*r^2 + 2187444224*c^3 + 656690944*c^3*r + 590068864*c^4

def onsetP5_6_0_4M1B (c r : ℤ) : ℤ :=
 38700480 + 51405760*r + 24801840*r^2 + 5183360*r^3 + 398160*r^4 + 194817280*c + 186511360*c*r + 57986880*c*r^2 + 5888960*c*r^3 + 350183680*c^2 + 215900160*c^2*r + 32605440*c^2*r^2 + 267518720*c^3 + 80088960*c^3*r + 73633280*c^4

def onsetP5_6_0_5M1B (c r : ℤ) : ℤ :=
 2751168 + 3625216*r + 1730960*r^2 + 357056*r^3 + 26992*r^4 + 13976704*c + 13273792*c*r + 4083072*c*r^2 + 409024*c*r^3 + 25424000*c^2 + 15546048*c^2*r + 2321088*c^2*r^2 + 19706624*c^3 + 5845504*c^3*r + 5512192*c^4

def onsetP5_6_0_6M1B (c r : ℤ) : ℤ :=
 110208 + 143584*r + 67536*r^2 + 13664*r^3 + 1008*r^4 + 563584*c + 528640*c*r + 159936*c*r^2 + 15680*c*r^3 + 1033984*c^2 + 623616*c^2*r + 91392*c^2*r^2 + 809984*c^3 + 236544*c^3*r + 229376*c^4

def onsetP5_6_0_7M1B (c r : ℤ) : ℤ :=
 1920 + 2464*r + 1136*r^2 + 224*r^3 + 16*r^4 + 9856*c + 9088*c*r + 2688*c*r^2 + 256*c*r^3 + 18176*c^2 + 10752*c^2*r + 1536*c^2*r^2 + 14336*c^3 + 4096*c^3*r + 4096*c^4

def onsetP5_6_1_0M1B (c r : ℤ) : ℤ :=
 2777846400 + 3703795200*r + 1782708480*r^2 + 365783040*r^3 + 26611200*r^4 + 12970056960*c + 12265666560*c*r + 3718794240*c*r^2 + 358041600*c*r^3 + 21028452480*c^2 + 12565324800*c^2*r + 1802787840*c^2*r^2 + 14109742080*c^3 + 4026193920*c^3*r + 3365187840*c^4

def onsetP5_6_1_1M1B (c r : ℤ) : ℤ :=
 2444623200 + 3271310784*r + 1586821920*r^2 + 330994944*r^3 + 24922560*r^4 + 11661439104*c + 11138223360*c*r + 3435336576*c*r^2 + 341479680*c*r^3 + 19488630528*c^2 + 11851652736*c^2*r + 1750647168*c^2*r^2 + 13590226944*c^3 + 3980001024*c^3*r + 3385611648*c^4

def onsetP5_6_1_2M1B (c r : ℤ) : ℤ :=
 935004672 + 1252871424*r + 610118656*r^2 + 128481024*r^3 + 9881984*r^4 + 4546526208*c + 4369073856*c*r + 1362150720*c*r^2 + 138164992*c*r^3 + 7802213888*c^2 + 4801382208*c^2*r + 722715840*c^2*r^2 + 5626430208*c^3 + 1676221568*c^3*r + 1454446336*c^4

def onsetP5_6_1_3M1B (c r : ℤ) : ℤ :=
 201694080 + 269908576*r + 131394704*r^2 + 27734336*r^3 + 2151184*r^4 + 997300864*c + 960215872*c*r + 300596352*c*r^2 + 30756544*c*r^3 + 1750630784*c^2 + 1083501888*c^2*r + 164520384*c^2*r^2 + 1298737664*c^3 + 390202624*c^3*r + 346213504*c^4

def onsetP5_6_1_4M1B (c r : ℤ) : ℤ :=
 26530560 + 35347200*r + 17120320*r^2 + 3595200*r^3 + 277760*r^4 + 133042560*c + 127753920*c*r + 39876480*c*r^2 + 4070080*c*r^3 + 237937280*c^2 + 147147840*c^2*r + 22317120*c^2*r^2 + 180633600*c^3 + 54266240*c^3*r + 49369600*c^4

def onsetP5_6_1_5M1B (c r : ℤ) : ℤ :=
 2130240 + 2815456*r + 1349600*r^2 + 279776*r^3 + 21280*r^4 + 10802176*c + 10292800*c*r + 3179904*c*r^2 + 320320*c*r^3 + 19601792*c^2 + 12030144*c^2*r + 1804992*c^2*r^2 + 15147776*c^3 + 4512256*c^3*r + 4221952*c^4

def onsetP5_6_1_6M1B (c r : ℤ) : ℤ :=
 96768 + 126336*r + 59584*r^2 + 12096*r^3 + 896*r^4 + 494592*c + 465024*c*r + 141120*c*r^2 + 13888*c*r^3 + 906752*c^2 + 548352*c^2*r + 80640*c^2*r^2 + 709632*c^3 + 207872*c^3*r + 200704*c^4

def onsetP5_6_1_7M1B (c r : ℤ) : ℤ :=
 1920 + 2464*r + 1136*r^2 + 224*r^3 + 16*r^4 + 9856*c + 9088*c*r + 2688*c*r^2 + 256*c*r^3 + 18176*c^2 + 10752*c^2*r + 1536*c^2*r^2 + 14336*c^3 + 4096*c^3*r + 4096*c^4

def onsetP5_6_2_0M1B (c r : ℤ) : ℤ :=
 1091028960 + 1448102880*r + 690439680*r^2 + 138862080*r^3 + 9676800*r^4 + 4980568320*c + 4654218240*c*r + 1381847040*c*r^2 + 127733760*c*r^3 + 7810629120*c^2 + 4567207680*c^2*r + 630927360*c^2*r^2 + 5013388800*c^3 + 1382169600*c^3*r + 1133153280*c^4

def onsetP5_6_2_1M1B (c r : ℤ) : ℤ :=
 1083657888 + 1447241376*r + 698685888*r^2 + 144182976*r^3 + 10602240*r^4 + 5079231360*c + 4818445056*c*r + 1468389888*c*r^2 + 142659072*c*r^3 + 8277041664*c^2 + 4967738496*c^2*r + 718060032*c^2*r^2 + 5582626560*c^3 + 1602443520*c^3*r + 1337815296*c^4

def onsetP5_6_2_2M1B (c r : ℤ) : ℤ :=
 469214592 + 628917632*r + 306030368*r^2 + 64228192*r^3 + 4895296*r^4 + 2252069120*c + 2158806272*c*r + 669881856*c*r^2 + 67315584*c*r^3 + 3795146880*c^2 + 2321461632*c^2*r + 346184832*c^2*r^2 + 2672884480*c^3 + 789120640*c^3*r + 672728448*c^4

def onsetP5_6_2_3M1B (c r : ℤ) : ℤ :=
 115006080 + 154233856*r + 75257504*r^2 + 15917216*r^3 + 1235584*r^4 + 563605504*c + 543145792*c*r + 170161152*c*r^2 + 17410624*c*r^3 + 977400704*c^2 + 604621248*c^2*r + 91742784*c^2*r^2 + 713990144*c^3 + 214246144*c^3*r + 187083904*c^4

def onsetP5_6_2_4M1B (c r : ℤ) : ℤ :=
 17263680 + 23078720*r + 11226320*r^2 + 2369920*r^3 + 184240*r^4 + 86105600*c + 82947200*c*r + 25999680*c*r^2 + 2667840*c*r^3 + 152893440*c^2 + 94846080*c^2*r + 14448000*c^2*r^2 + 115037440*c^3 + 34679680*c^3*r + 31127040*c^4

def onsetP5_6_2_5M1B (c r : ℤ) : ℤ :=
 1589952 + 2109184*r + 1015952*r^2 + 211904*r^3 + 16240*r^4 + 8041600*c + 7693504*c*r + 2389632*c*r^2 + 242368*c*r^3 + 14542976*c^2 + 8965824*c^2*r + 1353408*c^2*r^2 + 11191040*c^3 + 3351040*c^3*r + 3103744*c^4

def onsetP5_6_2_6M1B (c r : ℤ) : ℤ :=
 83328 + 109088*r + 51632*r^2 + 10528*r^3 + 784*r^4 + 425600*c + 401408*c*r + 122304*c*r^2 + 12096*c*r^3 + 779520*c^2 + 473088*c^2*r + 69888*c^2*r^2 + 609280*c^3 + 179200*c^3*r + 172032*c^4

def onsetP5_6_2_7M1B (c r : ℤ) : ℤ :=
 1920 + 2464*r + 1136*r^2 + 224*r^3 + 16*r^4 + 9856*c + 9088*c*r + 2688*c*r^2 + 256*c*r^3 + 18176*c^2 + 10752*c^2*r + 1536*c^2*r^2 + 14336*c^3 + 4096*c^3*r + 4096*c^4

def onsetG5_6_0M1B (c r : ℤ) : ℤ :=
 746620441573708800 + 2013359267824128000*r + 2345503600021478400*r^2 + 1542574405706342400*r^3 + 626749603806412800*r^4 + 161176063632998400*r^5 + 25634075443200000*r^6 + 2307300891033600*r^7 + 90128941056000*r^8 + 7162540722531532800*c + 16573009655673676800*c*r + 16234462650133324800*c*r^2 + 8733324484542873600*c*r^3 + 2788368713032089600*c*r^4 + 528784409773670400*c*r^5 + 55204795750809600*c*r^6 + 2451507196723200*c*r^7 + 29243954864192947200*c^2 + 56892919544473420800*c^2*r + 45590244040199577600*c^2*r^2 + 19278088738036531200*c^2*r^3 + 4541075742951014400*c^2*r^4 + 565613182491033600*c^2*r^5 + 29149338245529600*c^2*r^6 + 66389627197161676800*c^3 + 105670386627615129600*c^3*r + 66581061032199168000*c^3*r^2 + 20781114371761766400*c^3*r^3 + 3216900580127539200*c^3*r^4 + 197894750286643200*c^3*r^5 + 91756121186967552000*c^4 + 114870948097851187200*c^4*r + 53448364251323596800*c^4*r^2 + 10968731143372800000*c^4*r^3 + 839011092627456000*c^4*r^4 + 79201428259026124800*c^5 + 73254487477248000000*c^5*r + 22422175575677337600*c^5*r^2 + 2274724936286208000*c^5*r^3 + 41798595074568192000*c^6 + 25443708241261363200*c^6*r + 3851394539205427200*c^6*r^2 + 12364114379813683200*c^7 + 3723208191089049600*c^7*r + 1573415499453235200*c^8

theorem onsetG5_6_0M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_0M1B c r := by
 unfold onsetG5_6_0M1B
 positivity

def onsetG5_6_1M1B (c r : ℤ) : ℤ :=
 1163185263301662720 + 3136699347819125760*r + 3655383275673722880*r^2 + 2405935779633146880*r^3 + 978896694486896640*r^4 + 252279612116582400*r^5 + 40245119053332480*r^6 + 3636142229422080*r^7 + 142600111718400*r^8 + 11260794172004213760*c + 26077992771951590400*c*r + 25578503875329914880*c*r^2 + 13785487402669516800*c*r^3 + 4412517382430115840*c*r^4 + 839495014818324480*c*r^5 + 87977478696468480*c*r^6 + 3921984930447360*c*r^7 + 46463123146295761920*c^2 + 90553199831798860800*c^2*r + 72729373247013611520*c^2*r^2 + 30841723096495073280*c^2*r^3 + 7289821661235240960*c^2*r^4 + 911470884261396480*c^2*r^5 + 47150941207265280*c^2*r^6 + 106748971030320353280*c^3 + 170365679413705359360*c^3*r + 107682965414606131200*c^3*r^2 + 33730258090537451520*c^3*r^3 + 5241548669009264640*c^3*r^4 + 323635991705026560*c^3*r^5 + 149502839246231224320*c^4 + 187806408549295656960*c^4*r + 87710366797082910720*c^4*r^2 + 18069525405027532800*c^4*r^3 + 1387149352759296000*c^4*r^4 + 130893545008441958400*c^5 + 121531323310144634880*c^5*r + 37342688527490088960*c^5*r^2 + 3801803117956300800*c^5*r^3 + 70100896291648266240*c^6 + 42836521166597652480*c^6*r + 6506632783285125120*c^6*r^2 + 21041201167763374080*c^7 + 6357781470347919360*c^7*r + 2715527553213726720*c^8

theorem onsetG5_6_1M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_1M1B c r := by
 unfold onsetG5_6_1M1B
 positivity

def onsetG5_6_2M1B (c r : ℤ) : ℤ :=
 835940360645720064 + 2252712690729317376*r + 2623874579427419136*r^2 + 1726545511961109504*r^3 + 702533570804352000*r^4 + 181154776568371200*r^5 + 28930423698505728*r^6 + 2618086899843072*r^7 + 102869228851200*r^8 + 8161709030692826112*c + 18901238833011548160*c*r + 18543873537946229760*c*r^2 + 9999831561414847488*c*r^3 + 3203836572439157760*c*r^4 + 610383822877366272*c*r^5 + 64080449160118272*c*r^6 + 2862164889206784*c*r^7 + 34006031296854478848*c^2 + 66324697685723602944*c^2*r + 53324253382393211904*c^2*r^2 + 22642922588030825472*c^2*r^3 + 5360804191376492544*c^2*r^4 + 671563436906299392*c^2*r^5 + 34808125800333312*c^2*r^6 + 78994408425988349952*c^3 + 126253984987947737088*c^3*r + 79936217852643016704*c^3*r^2 + 25086764993480515584*c^3*r^3 + 3906363861697167360*c^3*r^4 + 241672302183481344*c^3*r^5 + 111985909561855365120*c^4 + 140961825424044527616*c^4*r + 65973648141364690944*c^4*r^2 + 13620920023315906560*c^4*r^3 + 1047734224464936960*c^4*r^4 + 99333198777197887488*c^5 + 92445046366921629696*c^5*r + 28470088103406501888*c^5*r^2 + 2904378516693319680*c^5*r^3 + 53923067895757197312*c^6 + 33029112582013943808*c^6*r + 5027281640440528896*c^6*r^2 + 16406942695318683648*c^7 + 4967904980770357248*c^7*r + 2145803318381592576*c^8

theorem onsetG5_6_2M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_2M1B c r := by
 unfold onsetG5_6_2M1B
 positivity

def onsetG5_6_3M1B (c r : ℤ) : ℤ :=
 366433721958850560 + 986108284146069504*r + 1146997424929327104*r^2 + 753739480297509888*r^3 + 306327386240010240*r^4 + 78909267153368064*r^5 + 12592314620971008*r^6 + 1139025005690880*r^7 + 44743840038912*r^8 + 3605912424946814976*c + 8343610716496613376*c*r + 8179314287051701248*c*r^2 + 4407604562001564672*c*r^3 + 1411350614372450304*c*r^4 + 268782040368113664*c*r^5 + 28212146118008832*c*r^6 + 1259997492461568*c*r^7 + 15159748504584499200*c^2 + 29558694570639790080*c^2*r + 23759526776275067904*c^2*r^2 + 10087567691252481024*c^2*r^3 + 2388188560664094720*c^2*r^4 + 299190604605677568*c^2*r^5 + 15508476503482368*c^2*r^6 + 35572977448194945024*c^3 + 56868606273581254656*c^3*r + 36015477490987137024*c^3*r^2 + 11306250028526530560*c^3*r^3 + 1761050717574758400*c^3*r^4 + 108971896407048192*c^3*r^5 + 50993649638141349888*c^4 + 64230281481893259264*c^4*r + 30079610240968243200*c^4*r^2 + 6213420116211302400*c^4*r^3 + 478104712557158400*c^4*r^4 + 45774688864478515200*c^5 + 42638727761424678912*c^5*r + 13140863139648061440*c^5*r^2 + 1341201322222583808*c^5*r^3 + 25159594151754510336*c^6 + 15425075130467401728*c^6*r + 2349237428746371072*c^6*r^2 + 7752407388732260352*c^7 + 2349110670908424192*c^7*r + 1026690822563954688*c^8

theorem onsetG5_6_3M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_3M1B c r := by
 unfold onsetG5_6_3M1B
 positivity

def onsetG5_6_4M1B (c r : ℤ) : ℤ :=
 109110654531809280 + 293006592634398720*r + 340042203924570112*r^2 + 222923171036855296*r^3 + 90374091285610496*r^4 + 23221481855767552*r^5 + 3696344593657856*r^6 + 333523564466176*r^7 + 13070329710592*r^8 + 1081499882589450240*c + 2498131937173784576*c*r + 2444416978173606912*c*r^2 + 1314657118040301056*c*r^3 + 420108397372697600*c*r^4 + 79840069145915904*c*r^5 + 8362577857650688*c*r^6 + 372693507006464*c*r^7 + 4584320383013926912*c^2 + 8926756237088514048*c^2*r + 7165040812279236096*c^2*r^2 + 3037313338066309120*c^2*r^3 + 717873872347537920*c^2*r^4 + 89776334999801856*c^2*r^5 + 4644887704662016*c^2*r^6 + 10856860853523779584*c^3 + 17339769281420773376*c^3*r + 10969335230728591360*c^3*r^2 + 3439227636740976640*c^3*r^3 + 534925820836413440*c^3*r^4 + 33047512339079168*c^3*r^5 + 15721534960319799296*c^4 + 19789247789437952000*c^4*r + 9259339155623424000*c^4*r^2 + 1910543204356505600*c^4*r^3 + 146811095950704640*c^4*r^4 + 14266664256880365568*c^5 + 13282466648391327744*c^5*r + 4090250005371715584*c^5*r^2 + 416998024344731648*c^5*r^3 + 7931303897529614336*c^6 + 4860121041014751232*c^6*r + 739542016704741376*c^6*r^2 + 2472537166348877824*c^7 + 748731780149018624*c^7*r + 331313736346550272*c^8

theorem onsetG5_6_4M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_4M1B c r := by
 unfold onsetG5_6_4M1B
 positivity

def onsetG5_6_5M1B (c r : ℤ) : ℤ :=
 23248012324884480 + 62251794654013440*r + 72017459076326400*r^2 + 47050569375290880*r^3 + 19003609661191680*r^4 + 4863513716113920*r^5 + 770901243409920*r^6 + 69252316385280*r^7 + 2701550530560*r^8 + 231958187938068480*c + 534399119100241920*c*r + 521398281590914560*c*r^2 + 279528606652968960*c*r^3 + 89016865763535360*c*r^4 + 16854385833062400*c*r^5 + 1758360641157120*c*r^6 + 78037878804480*c*r^7 + 990613906666997760*c^2 + 1924435103373189120*c^2*r + 1540566000375252480*c^2*r^2 + 651136702253076480*c^2*r^3 + 153398480382067200*c^2*r^4 + 19116100011939840*c^2*r^5 + 985283003443200*c^2*r^6 + 2365701217673687040*c^3 + 3770325166836910080*c^3*r + 2379330291170273280*c^3*r^2 + 743924390903930880*c^3*r^3 + 115347733722439680*c^3*r^4 + 7101673551974400*c^3*r^5 + 3457242694863605760*c^4 + 4343251256041420800*c^4*r + 2027476163668408320*c^4*r^2 + 417212799821905920*c^4*r^3 + 31960968057446400*c^4*r^4 + 3168384279006535680*c^5 + 2944245741158400000*c^5*r + 904569030663782400*c^5*r^2 + 91967849942384640*c^5*r^3 + 1779794159655321600*c^6 + 1088515197419274240*c^6*r + 165236762006077440*c^6*r^2 + 560826830249656320*c^7 + 169477317123932160*c^7*r + 75973975885086720*c^8

theorem onsetG5_6_5M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_5M1B c r := by
 unfold onsetG5_6_5M1B
 positivity

def onsetG5_6_6M1B (c r : ℤ) : ℤ :=
 3634113809313792 + 9695924946720768*r + 11171611338180608*r^2 + 7265922171372032*r^3 + 2920191859459840*r^4 + 743317459888640*r^5 + 117131500939264*r^6 + 10456108952576*r^7 + 405167786240*r^8 + 36476477338699776*c + 83743541450598400*c*r + 81385872291709440*c*r^2 + 43441229490770944*c*r^3 + 13767068805414400*c*r^4 + 2592810378525696*c*r^5 + 268938827902976*c*r^6 + 11861737603072*c*r^7 + 156831928939986944*c^2 + 303648989291676672*c^2*r + 242152919429632512*c^2*r^2 + 101909751293643776*c^2*r^3 + 23893889848991232*c^2*r^4 + 2961932650930176*c^2*r^5 + 151789264879616*c^2*r^6 + 377357846717014016*c^3 + 599452302791071744*c^3*r + 376878688995264512*c^3*r^2 + 117334799831846912*c^3*r^3 + 18106510677606400*c^3*r^4 + 1108901595676672*c^3*r^5 + 556038438650920960*c^4 + 696295228668755968*c^4*r + 323824248719204352*c^4*r^2 + 66351608727470080*c^4*r^3 + 5058459936481280*c^4*r^4 + 514133182073176064*c^5 + 476217716761264128*c^5*r + 145754096212967424*c^5*r^2 + 14754114306211840*c^5*r^3 + 291541479388020736*c^6 + 177711097783353344*c^6*r + 26870385155145728*c^6*r^2 + 92773561357697024*c^7 + 27936950759194624*c^7*r + 12695250288508928*c^8

theorem onsetG5_6_6M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_6M1B c r := by
 unfold onsetG5_6_6M1B
 positivity

def onsetG5_6_7M1B (c r : ℤ) : ℤ :=
 419898515742720 + 1115381577848832*r + 1278787257280512*r^2 + 827113936449024*r^3 + 330376067642880*r^4 + 83524471736832*r^5 + 13063731577344*r^6 + 1156714352640*r^7 + 44428640256*r^8 + 4237179848552448*c + 9685263452433408*c*r + 9366017996450304*c*r^2 + 4971507007251456*c*r^3 + 1565771960858112*c*r^4 + 292866706685952*c*r^5 + 30148806352896*c*r^6 + 1318822170624*c*r^7 + 18327888013639680*c^2 + 35330479188802560*c^2*r + 28035213880730112*c^2*r^2 + 11732431568643072*c^2*r^3 + 2733548930219520*c^2*r^4 + 336499387305984*c^2*r^5 + 17112647430144*c^2*r^6 + 44395967957225472*c^3 + 70216083754242048*c^3*r + 43923463043346432*c^3*r^2 + 13596968437678080*c^3*r^3 + 2084814418821120*c^3*r^4 + 126775318634496*c^3*r^5 + 65901343354527744*c^4 + 82157708590497792*c^4*r + 38013143338598400*c^4*r^2 + 7743508326973440*c^4*r^3 + 586478075904000*c^4*r^4 + 61422477938196480*c^5 + 56633363153289216*c^5*r + 17242089602088960*c^5*r^2 + 1734855808057344*c^5*r^3 + 35127076176396288*c^6 + 21310544901832704*c^6*r + 3204532267646976*c^6*r^2 + 11278257415520256*c^7 + 3379346204000256*c^7*r + 1557682301435904*c^8

theorem onsetG5_6_7M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_7M1B c r := by
 unfold onsetG5_6_7M1B
 positivity

def onsetG5_6_8M1B (c r : ℤ) : ℤ :=
 35588603473920 + 94045169756160*r + 107192216334336*r^2 + 68875604464128*r^3 + 27309077499648*r^4 + 6847869590016*r^5 + 1061403829248*r^6 + 93051829248*r^7 + 3535478016*r^8 + 360820334407680*c + 820412938103808*c*r + 788630550898176*c*r^2 + 415789141006848*c*r^3 + 129965884930560*c*r^4 + 24105615432192*c*r^5 + 2458565136384*c*r^6 + 106454433792*c*r^7 + 1569036675526656*c^2 + 3008373135151104*c^2*r + 2372582841366528*c^2*r^2 + 986038273167360*c^2*r^3 + 227958052976640*c^2*r^4 + 27819695812608*c^2*r^5 + 1401292935168*c^2*r^6 + 3823269344305152*c^3 + 6013575090905088*c^3*r + 3738119219036160*c^3*r^2 + 1148933709127680*c^3*r^3 + 174757272453120*c^3*r^4 + 10532263010304*c^3*r^5 + 5712360591802368*c^4 + 7081117531299840*c^4*r + 3255039101583360*c^4*r^2 + 658185205923840*c^4*r^3 + 49437237534720*c^4*r^4 + 5361964021284864*c^5 + 4914833710252032*c^5*r + 1486226048090112*c^5*r^2 + 148395400495104*c^5*r^3 + 3089845155790848*c^6 + 1863011757981696*c^6*r + 278172699721728*c^6*r^2 + 1000068577492992*c^7 + 297722972209152*c^7*r + 139291332182016*c^8

theorem onsetG5_6_8M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_8M1B c r := by
 unfold onsetG5_6_8M1B
 positivity

def onsetG5_6_9M1B (c r : ℤ) : ℤ :=
 2157694156800 + 5667766272000*r + 6416339435520*r^2 + 4091311472640*r^3 + 1608334049280*r^4 + 399458734080*r^5 + 61262745600*r^6 + 5308477440*r^7 + 199127040*r^8 + 21965799260160*c + 49636429946880*c*r + 47379084533760*c*r^2 + 24782059223040*c*r^3 + 7677608601600*c*r^4 + 1409953413120*c*r^5 + 142230681600*c*r^6 + 6084341760*c*r^7 + 95960371691520*c^2 + 182814409236480*c^2*r + 143130684211200*c^2*r^2 + 58996262922240*c^2*r^3 + 13513490135040*c^2*r^4 + 1632249722880*c^2*r^5 + 81283614720*c^2*r^6 + 235033514311680*c^3 + 367234978037760*c^3*r + 226554434641920*c^3*r^2 + 69038176972800*c^3*r^3 + 10400360570880*c^3*r^4 + 620120739840*c^3*r^5 + 353167238430720*c^4 + 434775479255040*c^4*r + 198284312002560*c^4*r^2 + 39737128058880*c^4*r^3 + 2954916249600*c^4*r^4 + 333569731461120*c^5 + 303553416069120*c^5*r + 91038426071040*c^5*r^2 + 9005407272960*c^5*r^3 + 193514612981760*c^6 + 115798565191680*c^6*r + 17141323530240*c^6*r^2 + 63084272025600*c^7 + 18631313326080*c^7*r + 8853399797760*c^8

theorem onsetG5_6_9M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_9M1B c r := by
 unfold onsetG5_6_9M1B
 positivity

def onsetG5_6_10M1B (c r : ℤ) : ℤ :=
 88827346944 + 231741382656*r + 260323245056*r^2 + 164546622464*r^3 + 64053256960*r^4 + 15735695360*r^5 + 2384209408*r^6 + 203850752*r^7 + 7535360*r^8 + 907419942912*c + 2035957719040*c*r + 1927693824000*c*r^2 + 999119392768*c*r^3 + 306373795840*c*r^4 + 55624568832*c*r^5 + 5540605952*c*r^6 + 233734144*c*r^7 + 3979724177408*c^2 + 7525602115584*c^2*r + 5842333507584*c^2*r^2 + 2385196900352*c^2*r^3 + 540517146624*c^2*r^4 + 64512172032*c^2*r^5 + 3170435072*c^2*r^6 + 9790291116032*c^3 + 15178570989568*c^3*r + 9281323433984*c^3*r^2 + 2800131375104*c^3*r^3 + 417123696640*c^3*r^4 + 24562499584*c^3*r^5 + 14782955192320*c^4 + 18051137929216*c^4*r + 8156290351104*c^4*r^2 + 1617504501760*c^4*r^3 + 118876405760*c^4*r^4 + 14037638709248*c^5 + 12665540837376*c^5*r + 3761648959488*c^5*r^2 + 368029204480*c^5*r^3 + 8191372951552*c^6 + 4857735938048*c^6*r + 711748222976*c^6*r^2 + 2687215075328*c^7 + 786146787328*c^7*r + 379685175296*c^8

theorem onsetG5_6_10M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_10M1B c r := by
 unfold onsetG5_6_10M1B
 positivity

def onsetG5_6_11M1B (c r : ℤ) : ℤ :=
 2229534720 + 5772017664*r + 6427459584*r^2 + 4022796288*r^3 + 1548718080*r^4 + 375803904*r^5 + 56168448*r^6 + 4730880*r^7 + 172032*r^8 + 22840344576*c + 50833391616*c*r + 47689678848*c*r^2 + 24462262272*c*r^3 + 7414493184*c*r^4 + 1328861184*c*r^5 + 130486272*c*r^6 + 5419008*c*r^7 + 100494213120*c^2 + 188423208960*c^2*r + 144870211584*c^2*r^2 + 58503266304*c^2*r^3 + 13096796160*c^2*r^4 + 1542094848*c^2*r^5 + 74661888*c^2*r^6 + 248116936704*c^3 + 381244932096*c^3*r + 230762348544*c^3*r^2 + 68826562560*c^3*r^3 + 10122362880*c^3*r^4 + 587661312*c^3*r^5 + 376169299968*c^4 + 455023263744*c^4*r + 203410636800*c^4*r^2 + 39856373760*c^4*r^3 + 2890137600*c^4*r^4 + 358817464320*c^5 + 320546537472*c^5*r + 94135910400*c^5*r^2 + 9094299648*c^5*r^3 + 210424037376*c^6 + 123488698368*c^6*r + 17880317952*c^6*r^2 + 69407342592*c^7 + 20082327552*c^7*r + 9865003008*c^8

theorem onsetG5_6_11M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_11M1B c r := by
 unfold onsetG5_6_11M1B
 positivity

def onsetG5_6_12M1B (c r : ℤ) : ℤ :=
 25804800 + 66232320*r + 73034752*r^2 + 45208576*r^3 + 17190656*r^4 + 4114432*r^5 + 605696*r^6 + 50176*r^7 + 1792*r^8 + 264929280*c + 584278016*c*r + 542502912*c*r^2 + 275050496*c*r^3 + 82288640*c*r^4 + 14536704*c*r^5 + 1404928*c*r^6 + 57344*c*r^7 + 1168556032*c^2 + 2170011648*c^2*r + 1650302976*c^2*r^2 + 658309120*c^2*r^3 + 145367040*c^2*r^4 + 16859136*c^2*r^5 + 802816*c^2*r^6 + 2893348864*c^3 + 4400807936*c^3*r + 2633236480*c^3*r^2 + 775290880*c^3*r^3 + 112394240*c^3*r^4 + 6422528*c^3*r^5 + 4400807936*c^4 + 5266472960*c^4*r + 2325872640*c^4*r^2 + 449576960*c^4*r^3 + 32112640*c^4*r^4 + 4213178368*c^5 + 3721396224*c^5*r + 1078984704*c^5*r^2 + 102760448*c^5*r^3 + 2480930816*c^6 + 1438646272*c^6*r + 205520896*c^6*r^2 + 822083584*c^7 + 234881024*c^7*r + 117440512*c^8

theorem onsetG5_6_12M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_12M1B c r := by
 unfold onsetG5_6_12M1B
 positivity

def onsetG5_6_13M1B (c r : ℤ) : ℤ :=
 0

theorem onsetG5_6_13M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_13M1B c r := by
 unfold onsetG5_6_13M1B
 positivity

def onsetG5_6_14M1B (c r : ℤ) : ℤ :=
 0

theorem onsetG5_6_14M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG5_6_14M1B c r := by
 unfold onsetG5_6_14M1B
 positivity

theorem onset_stage5_6_0M1B (n c r : ℤ) :
 onsetValue5_6M1B (n+7) (5 + 1*r + 4*c) (4 + 1*r + 3*c)=onsetP5_6_0_0M1B c r*n^0 + onsetP5_6_0_1M1B c r*n^1 + onsetP5_6_0_2M1B c r*n^2 + onsetP5_6_0_3M1B c r*n^3 + onsetP5_6_0_4M1B c r*n^4 + onsetP5_6_0_5M1B c r*n^5 + onsetP5_6_0_6M1B c r*n^6 + onsetP5_6_0_7M1B c r*n^7 := by
 unfold onsetValue5_6M1B backShape5M94 onsetCorrection5_6M1B onsetP5_6_0_0M1B onsetP5_6_0_1M1B onsetP5_6_0_2M1B onsetP5_6_0_3M1B onsetP5_6_0_4M1B onsetP5_6_0_5M1B onsetP5_6_0_6M1B onsetP5_6_0_7M1B
 ring

theorem onset_stage5_6_1M1B (n c r : ℤ) :
 onsetValue5_7M1B (n+7) (5 + 1*r + 4*c) (4 + 1*r + 3*c)=onsetP5_6_1_0M1B c r*n^0 + onsetP5_6_1_1M1B c r*n^1 + onsetP5_6_1_2M1B c r*n^2 + onsetP5_6_1_3M1B c r*n^3 + onsetP5_6_1_4M1B c r*n^4 + onsetP5_6_1_5M1B c r*n^5 + onsetP5_6_1_6M1B c r*n^6 + onsetP5_6_1_7M1B c r*n^7 := by
 unfold onsetValue5_7M1B backShape5M94 onsetCorrection5_7M1B onsetP5_6_1_0M1B onsetP5_6_1_1M1B onsetP5_6_1_2M1B onsetP5_6_1_3M1B onsetP5_6_1_4M1B onsetP5_6_1_5M1B onsetP5_6_1_6M1B onsetP5_6_1_7M1B
 ring

theorem onset_stage5_6_2M1B (n c r : ℤ) :
 onsetValue5_8M1B (n+7) (5 + 1*r + 4*c) (4 + 1*r + 3*c)=onsetP5_6_2_0M1B c r*n^0 + onsetP5_6_2_1M1B c r*n^1 + onsetP5_6_2_2M1B c r*n^2 + onsetP5_6_2_3M1B c r*n^3 + onsetP5_6_2_4M1B c r*n^4 + onsetP5_6_2_5M1B c r*n^5 + onsetP5_6_2_6M1B c r*n^6 + onsetP5_6_2_7M1B c r*n^7 := by
 unfold onsetValue5_8M1B backShape5M94 onsetCorrection5_8M1B onsetP5_6_2_0M1B onsetP5_6_2_1M1B onsetP5_6_2_2M1B onsetP5_6_2_3M1B onsetP5_6_2_4M1B onsetP5_6_2_5M1B onsetP5_6_2_6M1B onsetP5_6_2_7M1B
 ring

theorem onset_column5_6_0M1B (c r : ℤ) :
 (onsetP5_6_1_0M1B c r*onsetP5_6_1_0M1B c r)-(onsetP5_6_0_0M1B c r*onsetP5_6_2_0M1B c r)=onsetG5_6_0M1B c r := by
 unfold onsetG5_6_0M1B onsetP5_6_0_0M1B onsetP5_6_1_0M1B onsetP5_6_2_0M1B
 ring

theorem onset_column5_6_1M1B (c r : ℤ) :
 (onsetP5_6_1_0M1B c r*onsetP5_6_1_1M1B c r + onsetP5_6_1_1M1B c r*onsetP5_6_1_0M1B c r)-(onsetP5_6_0_0M1B c r*onsetP5_6_2_1M1B c r + onsetP5_6_0_1M1B c r*onsetP5_6_2_0M1B c r)=onsetG5_6_1M1B c r := by
 unfold onsetG5_6_1M1B onsetP5_6_0_0M1B onsetP5_6_0_1M1B onsetP5_6_1_0M1B onsetP5_6_1_1M1B onsetP5_6_2_0M1B onsetP5_6_2_1M1B
 ring

theorem onset_column5_6_2M1B (c r : ℤ) :
 (onsetP5_6_1_0M1B c r*onsetP5_6_1_2M1B c r + onsetP5_6_1_1M1B c r*onsetP5_6_1_1M1B c r + onsetP5_6_1_2M1B c r*onsetP5_6_1_0M1B c r)-(onsetP5_6_0_0M1B c r*onsetP5_6_2_2M1B c r + onsetP5_6_0_1M1B c r*onsetP5_6_2_1M1B c r + onsetP5_6_0_2M1B c r*onsetP5_6_2_0M1B c r)=onsetG5_6_2M1B c r := by
 unfold onsetG5_6_2M1B onsetP5_6_0_0M1B onsetP5_6_0_1M1B onsetP5_6_0_2M1B onsetP5_6_1_0M1B onsetP5_6_1_1M1B onsetP5_6_1_2M1B onsetP5_6_2_0M1B onsetP5_6_2_1M1B onsetP5_6_2_2M1B
 ring

theorem onset_column5_6_3M1B (c r : ℤ) :
 (onsetP5_6_1_0M1B c r*onsetP5_6_1_3M1B c r + onsetP5_6_1_1M1B c r*onsetP5_6_1_2M1B c r + onsetP5_6_1_2M1B c r*onsetP5_6_1_1M1B c r + onsetP5_6_1_3M1B c r*onsetP5_6_1_0M1B c r)-(onsetP5_6_0_0M1B c r*onsetP5_6_2_3M1B c r + onsetP5_6_0_1M1B c r*onsetP5_6_2_2M1B c r + onsetP5_6_0_2M1B c r*onsetP5_6_2_1M1B c r + onsetP5_6_0_3M1B c r*onsetP5_6_2_0M1B c r)=onsetG5_6_3M1B c r := by
 unfold onsetG5_6_3M1B onsetP5_6_0_0M1B onsetP5_6_0_1M1B onsetP5_6_0_2M1B onsetP5_6_0_3M1B onsetP5_6_1_0M1B onsetP5_6_1_1M1B onsetP5_6_1_2M1B onsetP5_6_1_3M1B onsetP5_6_2_0M1B onsetP5_6_2_1M1B onsetP5_6_2_2M1B onsetP5_6_2_3M1B
 ring

theorem onset_column5_6_4M1B (c r : ℤ) :
 (onsetP5_6_1_0M1B c r*onsetP5_6_1_4M1B c r + onsetP5_6_1_1M1B c r*onsetP5_6_1_3M1B c r + onsetP5_6_1_2M1B c r*onsetP5_6_1_2M1B c r + onsetP5_6_1_3M1B c r*onsetP5_6_1_1M1B c r + onsetP5_6_1_4M1B c r*onsetP5_6_1_0M1B c r)-(onsetP5_6_0_0M1B c r*onsetP5_6_2_4M1B c r + onsetP5_6_0_1M1B c r*onsetP5_6_2_3M1B c r + onsetP5_6_0_2M1B c r*onsetP5_6_2_2M1B c r + onsetP5_6_0_3M1B c r*onsetP5_6_2_1M1B c r + onsetP5_6_0_4M1B c r*onsetP5_6_2_0M1B c r)=onsetG5_6_4M1B c r := by
 unfold onsetG5_6_4M1B onsetP5_6_0_0M1B onsetP5_6_0_1M1B onsetP5_6_0_2M1B onsetP5_6_0_3M1B onsetP5_6_0_4M1B onsetP5_6_1_0M1B onsetP5_6_1_1M1B onsetP5_6_1_2M1B onsetP5_6_1_3M1B onsetP5_6_1_4M1B onsetP5_6_2_0M1B onsetP5_6_2_1M1B onsetP5_6_2_2M1B onsetP5_6_2_3M1B onsetP5_6_2_4M1B
 ring

theorem onset_column5_6_5M1B (c r : ℤ) :
 (onsetP5_6_1_0M1B c r*onsetP5_6_1_5M1B c r + onsetP5_6_1_1M1B c r*onsetP5_6_1_4M1B c r + onsetP5_6_1_2M1B c r*onsetP5_6_1_3M1B c r + onsetP5_6_1_3M1B c r*onsetP5_6_1_2M1B c r + onsetP5_6_1_4M1B c r*onsetP5_6_1_1M1B c r + onsetP5_6_1_5M1B c r*onsetP5_6_1_0M1B c r)-(onsetP5_6_0_0M1B c r*onsetP5_6_2_5M1B c r + onsetP5_6_0_1M1B c r*onsetP5_6_2_4M1B c r + onsetP5_6_0_2M1B c r*onsetP5_6_2_3M1B c r + onsetP5_6_0_3M1B c r*onsetP5_6_2_2M1B c r + onsetP5_6_0_4M1B c r*onsetP5_6_2_1M1B c r + onsetP5_6_0_5M1B c r*onsetP5_6_2_0M1B c r)=onsetG5_6_5M1B c r := by
 unfold onsetG5_6_5M1B onsetP5_6_0_0M1B onsetP5_6_0_1M1B onsetP5_6_0_2M1B onsetP5_6_0_3M1B onsetP5_6_0_4M1B onsetP5_6_0_5M1B onsetP5_6_1_0M1B onsetP5_6_1_1M1B onsetP5_6_1_2M1B onsetP5_6_1_3M1B onsetP5_6_1_4M1B onsetP5_6_1_5M1B onsetP5_6_2_0M1B onsetP5_6_2_1M1B onsetP5_6_2_2M1B onsetP5_6_2_3M1B onsetP5_6_2_4M1B onsetP5_6_2_5M1B
 ring

theorem onset_column5_6_6M1B (c r : ℤ) :
 (onsetP5_6_1_0M1B c r*onsetP5_6_1_6M1B c r + onsetP5_6_1_1M1B c r*onsetP5_6_1_5M1B c r + onsetP5_6_1_2M1B c r*onsetP5_6_1_4M1B c r + onsetP5_6_1_3M1B c r*onsetP5_6_1_3M1B c r + onsetP5_6_1_4M1B c r*onsetP5_6_1_2M1B c r + onsetP5_6_1_5M1B c r*onsetP5_6_1_1M1B c r + onsetP5_6_1_6M1B c r*onsetP5_6_1_0M1B c r)-(onsetP5_6_0_0M1B c r*onsetP5_6_2_6M1B c r + onsetP5_6_0_1M1B c r*onsetP5_6_2_5M1B c r + onsetP5_6_0_2M1B c r*onsetP5_6_2_4M1B c r + onsetP5_6_0_3M1B c r*onsetP5_6_2_3M1B c r + onsetP5_6_0_4M1B c r*onsetP5_6_2_2M1B c r + onsetP5_6_0_5M1B c r*onsetP5_6_2_1M1B c r + onsetP5_6_0_6M1B c r*onsetP5_6_2_0M1B c r)=onsetG5_6_6M1B c r := by
 unfold onsetG5_6_6M1B onsetP5_6_0_0M1B onsetP5_6_0_1M1B onsetP5_6_0_2M1B onsetP5_6_0_3M1B onsetP5_6_0_4M1B onsetP5_6_0_5M1B onsetP5_6_0_6M1B onsetP5_6_1_0M1B onsetP5_6_1_1M1B onsetP5_6_1_2M1B onsetP5_6_1_3M1B onsetP5_6_1_4M1B onsetP5_6_1_5M1B onsetP5_6_1_6M1B onsetP5_6_2_0M1B onsetP5_6_2_1M1B onsetP5_6_2_2M1B onsetP5_6_2_3M1B onsetP5_6_2_4M1B onsetP5_6_2_5M1B onsetP5_6_2_6M1B
 ring

theorem onset_column5_6_7M1B (c r : ℤ) :
 (onsetP5_6_1_0M1B c r*onsetP5_6_1_7M1B c r + onsetP5_6_1_1M1B c r*onsetP5_6_1_6M1B c r + onsetP5_6_1_2M1B c r*onsetP5_6_1_5M1B c r + onsetP5_6_1_3M1B c r*onsetP5_6_1_4M1B c r + onsetP5_6_1_4M1B c r*onsetP5_6_1_3M1B c r + onsetP5_6_1_5M1B c r*onsetP5_6_1_2M1B c r + onsetP5_6_1_6M1B c r*onsetP5_6_1_1M1B c r + onsetP5_6_1_7M1B c r*onsetP5_6_1_0M1B c r)-(onsetP5_6_0_0M1B c r*onsetP5_6_2_7M1B c r + onsetP5_6_0_1M1B c r*onsetP5_6_2_6M1B c r + onsetP5_6_0_2M1B c r*onsetP5_6_2_5M1B c r + onsetP5_6_0_3M1B c r*onsetP5_6_2_4M1B c r + onsetP5_6_0_4M1B c r*onsetP5_6_2_3M1B c r + onsetP5_6_0_5M1B c r*onsetP5_6_2_2M1B c r + onsetP5_6_0_6M1B c r*onsetP5_6_2_1M1B c r + onsetP5_6_0_7M1B c r*onsetP5_6_2_0M1B c r)=onsetG5_6_7M1B c r := by
 unfold onsetG5_6_7M1B onsetP5_6_0_0M1B onsetP5_6_0_1M1B onsetP5_6_0_2M1B onsetP5_6_0_3M1B onsetP5_6_0_4M1B onsetP5_6_0_5M1B onsetP5_6_0_6M1B onsetP5_6_0_7M1B onsetP5_6_1_0M1B onsetP5_6_1_1M1B onsetP5_6_1_2M1B onsetP5_6_1_3M1B onsetP5_6_1_4M1B onsetP5_6_1_5M1B onsetP5_6_1_6M1B onsetP5_6_1_7M1B onsetP5_6_2_0M1B onsetP5_6_2_1M1B onsetP5_6_2_2M1B onsetP5_6_2_3M1B onsetP5_6_2_4M1B onsetP5_6_2_5M1B onsetP5_6_2_6M1B onsetP5_6_2_7M1B
 ring

theorem onset_column5_6_8M1B (c r : ℤ) :
 (onsetP5_6_1_1M1B c r*onsetP5_6_1_7M1B c r + onsetP5_6_1_2M1B c r*onsetP5_6_1_6M1B c r + onsetP5_6_1_3M1B c r*onsetP5_6_1_5M1B c r + onsetP5_6_1_4M1B c r*onsetP5_6_1_4M1B c r + onsetP5_6_1_5M1B c r*onsetP5_6_1_3M1B c r + onsetP5_6_1_6M1B c r*onsetP5_6_1_2M1B c r + onsetP5_6_1_7M1B c r*onsetP5_6_1_1M1B c r)-(onsetP5_6_0_1M1B c r*onsetP5_6_2_7M1B c r + onsetP5_6_0_2M1B c r*onsetP5_6_2_6M1B c r + onsetP5_6_0_3M1B c r*onsetP5_6_2_5M1B c r + onsetP5_6_0_4M1B c r*onsetP5_6_2_4M1B c r + onsetP5_6_0_5M1B c r*onsetP5_6_2_3M1B c r + onsetP5_6_0_6M1B c r*onsetP5_6_2_2M1B c r + onsetP5_6_0_7M1B c r*onsetP5_6_2_1M1B c r)=onsetG5_6_8M1B c r := by
 unfold onsetG5_6_8M1B onsetP5_6_0_1M1B onsetP5_6_0_2M1B onsetP5_6_0_3M1B onsetP5_6_0_4M1B onsetP5_6_0_5M1B onsetP5_6_0_6M1B onsetP5_6_0_7M1B onsetP5_6_1_1M1B onsetP5_6_1_2M1B onsetP5_6_1_3M1B onsetP5_6_1_4M1B onsetP5_6_1_5M1B onsetP5_6_1_6M1B onsetP5_6_1_7M1B onsetP5_6_2_1M1B onsetP5_6_2_2M1B onsetP5_6_2_3M1B onsetP5_6_2_4M1B onsetP5_6_2_5M1B onsetP5_6_2_6M1B onsetP5_6_2_7M1B
 ring

theorem onset_column5_6_9M1B (c r : ℤ) :
 (onsetP5_6_1_2M1B c r*onsetP5_6_1_7M1B c r + onsetP5_6_1_3M1B c r*onsetP5_6_1_6M1B c r + onsetP5_6_1_4M1B c r*onsetP5_6_1_5M1B c r + onsetP5_6_1_5M1B c r*onsetP5_6_1_4M1B c r + onsetP5_6_1_6M1B c r*onsetP5_6_1_3M1B c r + onsetP5_6_1_7M1B c r*onsetP5_6_1_2M1B c r)-(onsetP5_6_0_2M1B c r*onsetP5_6_2_7M1B c r + onsetP5_6_0_3M1B c r*onsetP5_6_2_6M1B c r + onsetP5_6_0_4M1B c r*onsetP5_6_2_5M1B c r + onsetP5_6_0_5M1B c r*onsetP5_6_2_4M1B c r + onsetP5_6_0_6M1B c r*onsetP5_6_2_3M1B c r + onsetP5_6_0_7M1B c r*onsetP5_6_2_2M1B c r)=onsetG5_6_9M1B c r := by
 unfold onsetG5_6_9M1B onsetP5_6_0_2M1B onsetP5_6_0_3M1B onsetP5_6_0_4M1B onsetP5_6_0_5M1B onsetP5_6_0_6M1B onsetP5_6_0_7M1B onsetP5_6_1_2M1B onsetP5_6_1_3M1B onsetP5_6_1_4M1B onsetP5_6_1_5M1B onsetP5_6_1_6M1B onsetP5_6_1_7M1B onsetP5_6_2_2M1B onsetP5_6_2_3M1B onsetP5_6_2_4M1B onsetP5_6_2_5M1B onsetP5_6_2_6M1B onsetP5_6_2_7M1B
 ring

theorem onset_column5_6_10M1B (c r : ℤ) :
 (onsetP5_6_1_3M1B c r*onsetP5_6_1_7M1B c r + onsetP5_6_1_4M1B c r*onsetP5_6_1_6M1B c r + onsetP5_6_1_5M1B c r*onsetP5_6_1_5M1B c r + onsetP5_6_1_6M1B c r*onsetP5_6_1_4M1B c r + onsetP5_6_1_7M1B c r*onsetP5_6_1_3M1B c r)-(onsetP5_6_0_3M1B c r*onsetP5_6_2_7M1B c r + onsetP5_6_0_4M1B c r*onsetP5_6_2_6M1B c r + onsetP5_6_0_5M1B c r*onsetP5_6_2_5M1B c r + onsetP5_6_0_6M1B c r*onsetP5_6_2_4M1B c r + onsetP5_6_0_7M1B c r*onsetP5_6_2_3M1B c r)=onsetG5_6_10M1B c r := by
 unfold onsetG5_6_10M1B onsetP5_6_0_3M1B onsetP5_6_0_4M1B onsetP5_6_0_5M1B onsetP5_6_0_6M1B onsetP5_6_0_7M1B onsetP5_6_1_3M1B onsetP5_6_1_4M1B onsetP5_6_1_5M1B onsetP5_6_1_6M1B onsetP5_6_1_7M1B onsetP5_6_2_3M1B onsetP5_6_2_4M1B onsetP5_6_2_5M1B onsetP5_6_2_6M1B onsetP5_6_2_7M1B
 ring

theorem onset_column5_6_11M1B (c r : ℤ) :
 (onsetP5_6_1_4M1B c r*onsetP5_6_1_7M1B c r + onsetP5_6_1_5M1B c r*onsetP5_6_1_6M1B c r + onsetP5_6_1_6M1B c r*onsetP5_6_1_5M1B c r + onsetP5_6_1_7M1B c r*onsetP5_6_1_4M1B c r)-(onsetP5_6_0_4M1B c r*onsetP5_6_2_7M1B c r + onsetP5_6_0_5M1B c r*onsetP5_6_2_6M1B c r + onsetP5_6_0_6M1B c r*onsetP5_6_2_5M1B c r + onsetP5_6_0_7M1B c r*onsetP5_6_2_4M1B c r)=onsetG5_6_11M1B c r := by
 unfold onsetG5_6_11M1B onsetP5_6_0_4M1B onsetP5_6_0_5M1B onsetP5_6_0_6M1B onsetP5_6_0_7M1B onsetP5_6_1_4M1B onsetP5_6_1_5M1B onsetP5_6_1_6M1B onsetP5_6_1_7M1B onsetP5_6_2_4M1B onsetP5_6_2_5M1B onsetP5_6_2_6M1B onsetP5_6_2_7M1B
 ring

theorem onset_column5_6_12M1B (c r : ℤ) :
 (onsetP5_6_1_5M1B c r*onsetP5_6_1_7M1B c r + onsetP5_6_1_6M1B c r*onsetP5_6_1_6M1B c r + onsetP5_6_1_7M1B c r*onsetP5_6_1_5M1B c r)-(onsetP5_6_0_5M1B c r*onsetP5_6_2_7M1B c r + onsetP5_6_0_6M1B c r*onsetP5_6_2_6M1B c r + onsetP5_6_0_7M1B c r*onsetP5_6_2_5M1B c r)=onsetG5_6_12M1B c r := by
 unfold onsetG5_6_12M1B onsetP5_6_0_5M1B onsetP5_6_0_6M1B onsetP5_6_0_7M1B onsetP5_6_1_5M1B onsetP5_6_1_6M1B onsetP5_6_1_7M1B onsetP5_6_2_5M1B onsetP5_6_2_6M1B onsetP5_6_2_7M1B
 ring

theorem onset_column5_6_13M1B (c r : ℤ) :
 (onsetP5_6_1_6M1B c r*onsetP5_6_1_7M1B c r + onsetP5_6_1_7M1B c r*onsetP5_6_1_6M1B c r)-(onsetP5_6_0_6M1B c r*onsetP5_6_2_7M1B c r + onsetP5_6_0_7M1B c r*onsetP5_6_2_6M1B c r)=onsetG5_6_13M1B c r := by
 unfold onsetG5_6_13M1B onsetP5_6_0_6M1B onsetP5_6_0_7M1B onsetP5_6_1_6M1B onsetP5_6_1_7M1B onsetP5_6_2_6M1B onsetP5_6_2_7M1B
 ring

theorem onset_column5_6_14M1B (c r : ℤ) :
 (onsetP5_6_1_7M1B c r*onsetP5_6_1_7M1B c r)-(onsetP5_6_0_7M1B c r*onsetP5_6_2_7M1B c r)=onsetG5_6_14M1B c r := by
 unfold onsetG5_6_14M1B onsetP5_6_0_7M1B onsetP5_6_1_7M1B onsetP5_6_2_7M1B
 ring

attribute [local irreducible] onsetP5_6_0_0M1B onsetP5_6_0_1M1B onsetP5_6_0_2M1B onsetP5_6_0_3M1B onsetP5_6_0_4M1B onsetP5_6_0_5M1B onsetP5_6_0_6M1B onsetP5_6_0_7M1B onsetP5_6_1_0M1B onsetP5_6_1_1M1B onsetP5_6_1_2M1B onsetP5_6_1_3M1B onsetP5_6_1_4M1B onsetP5_6_1_5M1B onsetP5_6_1_6M1B onsetP5_6_1_7M1B onsetP5_6_2_0M1B onsetP5_6_2_1M1B onsetP5_6_2_2M1B onsetP5_6_2_3M1B onsetP5_6_2_4M1B onsetP5_6_2_5M1B onsetP5_6_2_6M1B onsetP5_6_2_7M1B onsetG5_6_0M1B onsetG5_6_1M1B onsetG5_6_2M1B onsetG5_6_3M1B onsetG5_6_4M1B onsetG5_6_5M1B onsetG5_6_6M1B onsetG5_6_7M1B onsetG5_6_8M1B onsetG5_6_9M1B onsetG5_6_10M1B onsetG5_6_11M1B onsetG5_6_12M1B onsetG5_6_13M1B onsetG5_6_14M1B

theorem onset_columns_lc5_6M1B (n c r : ℤ) (hn : 0≤n) (hc : 0≤c) (hr : 0≤r) :
 onsetValue5_6M1B (n+7) (5 + 1*r + 4*c) (4 + 1*r + 3*c)*
 onsetValue5_8M1B (n+7) (5 + 1*r + 4*c) (4 + 1*r + 3*c)≤
 onsetValue5_7M1B (n+7) (5 + 1*r + 4*c) (4 + 1*r + 3*c)^2 := by
 apply sub_nonneg.mp
 rw [onset_stage5_6_0M1B,onset_stage5_6_1M1B,onset_stage5_6_2M1B]
 have hgap : (onsetP5_6_1_0M1B c r*n^0 + onsetP5_6_1_1M1B c r*n^1 + onsetP5_6_1_2M1B c r*n^2 + onsetP5_6_1_3M1B c r*n^3 + onsetP5_6_1_4M1B c r*n^4 + onsetP5_6_1_5M1B c r*n^5 + onsetP5_6_1_6M1B c r*n^6 + onsetP5_6_1_7M1B c r*n^7)^2-(onsetP5_6_0_0M1B c r*n^0 + onsetP5_6_0_1M1B c r*n^1 + onsetP5_6_0_2M1B c r*n^2 + onsetP5_6_0_3M1B c r*n^3 + onsetP5_6_0_4M1B c r*n^4 + onsetP5_6_0_5M1B c r*n^5 + onsetP5_6_0_6M1B c r*n^6 + onsetP5_6_0_7M1B c r*n^7)*(onsetP5_6_2_0M1B c r*n^0 + onsetP5_6_2_1M1B c r*n^1 + onsetP5_6_2_2M1B c r*n^2 + onsetP5_6_2_3M1B c r*n^3 + onsetP5_6_2_4M1B c r*n^4 + onsetP5_6_2_5M1B c r*n^5 + onsetP5_6_2_6M1B c r*n^6 + onsetP5_6_2_7M1B c r*n^7)=onsetG5_6_0M1B c r*n^0 + onsetG5_6_1M1B c r*n^1 + onsetG5_6_2M1B c r*n^2 + onsetG5_6_3M1B c r*n^3 + onsetG5_6_4M1B c r*n^4 + onsetG5_6_5M1B c r*n^5 + onsetG5_6_6M1B c r*n^6 + onsetG5_6_7M1B c r*n^7 + onsetG5_6_8M1B c r*n^8 + onsetG5_6_9M1B c r*n^9 + onsetG5_6_10M1B c r*n^10 + onsetG5_6_11M1B c r*n^11 + onsetG5_6_12M1B c r*n^12 + onsetG5_6_13M1B c r*n^13 + onsetG5_6_14M1B c r*n^14 := by
  rw [←onset_column5_6_0M1B,←onset_column5_6_1M1B,←onset_column5_6_2M1B,←onset_column5_6_3M1B,←onset_column5_6_4M1B,←onset_column5_6_5M1B,←onset_column5_6_6M1B,←onset_column5_6_7M1B,←onset_column5_6_8M1B,←onset_column5_6_9M1B,←onset_column5_6_10M1B,←onset_column5_6_11M1B,←onset_column5_6_12M1B,←onset_column5_6_13M1B,←onset_column5_6_14M1B]
  ring
 rw [hgap]
 have h0 := onsetG5_6_0M1B_nonneg c r hc hr
 have h1 := onsetG5_6_1M1B_nonneg c r hc hr
 have h2 := onsetG5_6_2M1B_nonneg c r hc hr
 have h3 := onsetG5_6_3M1B_nonneg c r hc hr
 have h4 := onsetG5_6_4M1B_nonneg c r hc hr
 have h5 := onsetG5_6_5M1B_nonneg c r hc hr
 have h6 := onsetG5_6_6M1B_nonneg c r hc hr
 have h7 := onsetG5_6_7M1B_nonneg c r hc hr
 have h8 := onsetG5_6_8M1B_nonneg c r hc hr
 have h9 := onsetG5_6_9M1B_nonneg c r hc hr
 have h10 := onsetG5_6_10M1B_nonneg c r hc hr
 have h11 := onsetG5_6_11M1B_nonneg c r hc hr
 have h12 := onsetG5_6_12M1B_nonneg c r hc hr
 have h13 := onsetG5_6_13M1B_nonneg c r hc hr
 have h14 := onsetG5_6_14M1B_nonneg c r hc hr
 positivity
end
end MathGKM.Markov
