import MarkovOnsetValues2M1B
/-! Machine-authored 1b02dddc. Column-wise exact onset gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false

def onsetP2_6_0_0M1B (c r : ℤ) : ℤ :=
 1634683680 + 4207775040*r + 3931643520*r^2 + 1598607360*r^3 + 240629760*r^4 + 5677348320*c + 10395020160*c*r + 6213231360*c*r^2 + 1222502400*c*r^3 + 6847384320*c^2 + 8020131840*c^2*r + 2320496640*c^2*r^2 + 3437683200*c^3 + 1950197760*c^3*r + 612218880*c^4

def onsetP2_6_0_1M1B (c r : ℤ) : ℤ :=
 1541039904 + 3992732352*r + 3755058432*r^2 + 1535482368*r^3 + 232207104*r^4 + 5471442144*c + 10116692352*c*r + 6094085760*c*r^2 + 1206475008*c*r^3 + 6795323328*c^2 + 8036735616*c^2*r + 2342741760*c^2*r^2 + 3521198016*c^3 + 2014752000*c^3*r + 647386368*c^4

def onsetP2_6_0_2M1B (c r : ℤ) : ℤ :=
 632048256 + 1645464576*r + 1554119168*r^2 + 637185024*r^3 + 96482176*r^4 + 2289221760*c + 4264218112*c*r + 2582520192*c*r^2 + 513043328*c*r^3 + 2918882400*c^2 + 3479966784*c^2*r + 1020015360*c^2*r^2 + 1558835040*c^3 + 898528512*c^3*r + 295856064*c^4

def onsetP2_6_0_3M1B (c r : ℤ) : ℤ :=
 146455680 + 382333952*r + 361751936*r^2 + 148263808*r^3 + 22390144*r^4 + 539874048*c + 1010495808*c*r + 613642176*c*r^2 + 121922304*c*r^3 + 704560416*c^2 + 844893504*c^2*r + 248359104*c^2*r^2 + 386944992*c^3 + 224274624*c^3*r + 75742464*c^4

def onsetP2_6_0_4M1B (c r : ℤ) : ℤ :=
 20744640 + 54176640*r + 51208640*r^2 + 20912640*r^3 + 3136000*r^4 + 77636160*c + 145593280*c*r + 88381440*c*r^2 + 17494400*c*r^3 + 103372080*c^2 + 124326720*c^2*r + 36529920*c^2*r^2 + 58208640*c^3 + 33835200*c^3*r + 11728080*c^4

def onsetP2_6_0_5M1B (c r : ℤ) : ℤ :=
 1799616 + 4688768*r + 4413248*r^2 + 1789312*r^3 + 265216*r^4 + 6819456*c + 12770688*c*r + 7721280*c*r^2 + 1516032*c*r^3 + 9232272*c^2 + 11096064*c^2*r + 3245760*c^2*r^2 + 5310144*c^3 + 3084480*c^3*r + 1097712*c^4

def onsetP2_6_0_6M1B (c r : ℤ) : ℤ :=
 88704 + 229824*r + 214592*r^2 + 86016*r^3 + 12544*r^4 + 339360*c + 632128*c*r + 379008*c*r^2 + 73472*c*r^3 + 465360*c^2 + 556416*c^2*r + 161280*c^2*r^2 + 272160*c^3 + 157248*c^3*r + 57456*c^4

def onsetP2_6_0_7M1B (c r : ℤ) : ℤ :=
 1920 + 4928*r + 4544*r^2 + 1792*r^3 + 256*r^4 + 7392*c + 13632*c*r + 8064*c*r^2 + 1536*c*r^3 + 10224*c^2 + 12096*c^2*r + 3456*c^2*r^2 + 6048*c^3 + 3456*c^3*r + 1296*c^4

def onsetP2_6_1_0M1B (c r : ℤ) : ℤ :=
 598268160 + 1527886080*r + 1415957760*r^2 + 571253760*r^3 + 85397760*r^4 + 2026402560*c + 3665491200*c*r + 2169054720*c*r^2 + 423198720*c*r^3 + 2360977920*c^2 + 2732244480*c^2*r + 782853120*c^2*r^2 + 1141539840*c^3 + 640604160*c^3*r + 195632640*c^4

def onsetP2_6_1_1M1B (c r : ℤ) : ℤ :=
 641811168 + 1654197888*r + 1548051840*r^2 + 630696192*r^3 + 95121792*r^4 + 2234188992*c + 4097526528*c*r + 2452834944*c*r^2 + 483327744*c*r^3 + 2701192224*c^2 + 3166402176*c^2*r + 916953984*c^2*r^2 + 1356488448*c^3 + 769681152*c^3*r + 241142208*c^4

def onsetP2_6_1_2M1B (c r : ℤ) : ℤ :=
 300443136 + 779978752*r + 735106176*r^2 + 301228928*r^3 + 45658368*r^4 + 1072157184*c + 1987779136*c*r + 1200185280*c*r^2 + 238152320*c*r^3 + 1339876608*c^2 + 1588378176*c^2*r + 464006592*c^2*r^2 + 698105856*c^3 + 400157184*c^3*r + 128854656*c^4

def onsetP2_6_1_3M1B (c r : ℤ) : ℤ :=
 79766400 + 208091072*r + 196917056*r^2 + 80848768*r^3 + 12256384*r^4 + 290995488*c + 543664128*c*r + 330031296*c*r^2 + 65689344*c*r^3 + 374445456*c^2 + 447842304*c^2*r + 131592384*c^2*r^2 + 201980352*c^3 + 116754624*c^3*r + 38703504*c^4

def onsetP2_6_1_4M1B (c r : ℤ) : ℤ :=
 13009920 + 34007680*r + 32202240*r^2 + 13193600*r^3 + 1989120*r^4 + 48370560*c + 90744640*c*r + 55177920*c*r^2 + 10962560*c*r^3 + 63833280*c^2 + 76769280*c^2*r + 22599360*c^2*r^2 + 35528640*c^3 + 20650560*c^3*r + 7056000*c^4

def onsetP2_6_1_5M1B (c r : ℤ) : ℤ :=
 1307712 + 3413312*r + 3221120*r^2 + 1310848*r^3 + 195328*r^4 + 4938528*c + 9264192*c*r + 5616576*c*r^2 + 1107456*c*r^3 + 6654816*c^2 + 8011584*c^2*r + 2350656*c^2*r^2 + 3804192*c^3 + 2213568*c^3*r + 780192*c^4

def onsetP2_6_1_6M1B (c r : ℤ) : ℤ :=
 75264 + 195328*r + 182784*r^2 + 73472*r^3 + 10752*r^4 + 287616*c + 536704*c*r + 322560*c*r^2 + 62720*c*r^3 + 393792*c^2 + 471744*c^2*r + 137088*c^2*r^2 + 229824*c^3 + 133056*c^3*r + 48384*c^4

def onsetP2_6_1_7M1B (c r : ℤ) : ℤ :=
 1920 + 4928*r + 4544*r^2 + 1792*r^3 + 256*r^4 + 7392*c + 13632*c*r + 8064*c*r^2 + 1536*c*r^3 + 10224*c^2 + 12096*c^2*r + 3456*c^2*r^2 + 6048*c^3 + 3456*c^3*r + 1296*c^4

def onsetP2_6_2_0M1B (c r : ℤ) : ℤ :=
 188909280 + 476360640*r + 435254400*r^2 + 172892160*r^3 + 25482240*r^4 + 617087520*c + 1094083200*c*r + 636249600*c*r^2 + 122250240*c*r^3 + 682778880*c^2 + 775595520*c^2*r + 218695680*c^2*r^2 + 313125120*c^3 + 172892160*c^3*r + 50964480*c^4

def onsetP2_6_2_1M1B (c r : ℤ) : ℤ :=
 234284832 + 598411968*r + 554822400*r^2 + 224136192*r^3 + 33531648*r^4 + 792397536*c + 1433178240*c*r + 848050560*c*r^2 + 165412608*c*r^3 + 920425152*c^2 + 1063407744*c^2*r + 304275456*c^2*r^2 + 441787584*c^3 + 247322112*c^3*r + 74939136*c^4

def onsetP2_6_2_2M1B (c r : ℤ) : ℤ :=
 127214976 + 328444928*r + 308003584*r^2 + 125800192*r^3 + 19026560*r^4 + 444167808*c + 816376960*c*r + 489662208*c*r^2 + 96693632*c*r^3 + 538683936*c^2 + 632173248*c^2*r + 183302784*c^2*r^2 + 270615072*c^3 + 153584256*c^3*r + 47976768*c^4

def onsetP2_6_2_3M1B (c r : ℤ) : ℤ :=
 39365760 + 102459392*r + 96822656*r^2 + 39776128*r^3 + 6047104*r^4 + 141404928*c + 263070528*c*r + 159316416*c*r^2 + 31713024*c*r^3 + 178142496*c^2 + 211869504*c^2*r + 62080704*c^2*r^2 + 93522912*c^3 + 53747904*c^3*r + 17359104*c^4

def onsetP2_6_2_4M1B (c r : ℤ) : ℤ :=
 7533120 + 19698560*r + 18679360*r^2 + 7678720*r^3 + 1164800*r^4 + 27733440*c + 51997120*c*r + 31651200*c*r^2 + 6312320*c*r^3 + 36108240*c^2 + 43364160*c^2*r + 12781440*c^2*r^2 + 19743360*c^3 + 11457600*c^3*r + 3835440*c^4

def onsetP2_6_2_5M1B (c r : ℤ) : ℤ :=
 896448 + 2344832*r + 2219840*r^2 + 907648*r^3 + 136192*r^4 + 3368064*c + 6330240*c*r + 3850560*c*r^2 + 763392*c*r^3 + 4506768*c^2 + 5435136*c^2*r + 1600704*c^2*r^2 + 2552256*c^3 + 1487808*c^3*r + 517104*c^4

def onsetP2_6_2_6M1B (c r : ℤ) : ℤ :=
 61824 + 160832*r + 150976*r^2 + 60928*r^3 + 8960*r^4 + 235872*c + 441280*c*r + 266112*c*r^2 + 51968*c*r^3 + 322224*c^2 + 387072*c^2*r + 112896*c^2*r^2 + 187488*c^3 + 108864*c^3*r + 39312*c^4

def onsetP2_6_2_7M1B (c r : ℤ) : ℤ :=
 1920 + 4928*r + 4544*r^2 + 1792*r^3 + 256*r^4 + 7392*c + 13632*c*r + 8064*c*r^2 + 1536*c*r^3 + 10224*c^2 + 12096*c^2*r + 3456*c^2*r^2 + 6048*c^3 + 3456*c^3*r + 1296*c^4

def onsetG2_6_0M1B (c r : ℤ) : ℤ :=
 49117874253235200 + 254584470331699200*r + 570035138945126400*r^2 + 721421592979046400*r^3 + 565356557238681600*r^4 + 281297178589593600*r^5 + 86861175187046400*r^6 + 15228487611187200*r^7 + 1160992117555200*r^8 + 343417580464896000*c + 1524891410258227200*c*r + 2868362250679296000*c*r^2 + 2968261621703884800*c*r^3 + 1827745773738393600*c*r^4 + 670440255012864000*c*r^5 + 135753693659136000*c*r^6 + 11711299977216000*c*r^7 + 1018220438248473600*c^2 + 3795498251751628800*c^2*r + 5834500056393523200*c^2*r^2 + 4742384955988377600*c^2*r^3 + 2152495890078105600*c^2*r^4 + 517760879453798400*c^2*r^5 + 51597609231974400*c^2*r^6 + 1671397564212633600*c^3 + 5088604761509068800*c^3*r + 6141908495536128000*c^3*r^2 + 3679327635082444800*c^3*r^3 + 1095172187435827200*c^3*r^4 + 129681526122086400*c^3*r^5 + 1661451003207475200*c^4 + 3970272482788147200*c^4*r + 3531413056698777600*c^4*r^2 + 1387470981876940800*c^4*r^3 + 203357812654080000*c^4*r^4 + 1024760421870796800*c^5 + 1804451318149939200*c^5*r + 1052793273227673600*c^5*r^2 + 203737290611097600*c^5*r^3 + 383473426297651200*c^6 + 443002291303219200*c^6*r + 127350502981632000*c^6*r^2 + 79744058169753600*c^7 + 45407506740019200*c^7*r + 7070712967987200*c^8

theorem onsetG2_6_0M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_0M1B c r := by
 unfold onsetG2_6_0M1B
 positivity

def onsetG2_6_1M1B (c r : ℤ) : ℤ :=
 93852043035770880 + 488149457480294400*r + 1096550283833303040*r^2 + 1391618810623426560*r^3 + 1092994274696970240*r^4 + 544779467841208320*r^5 + 168475979396874240*r^6 + 29585351381483520*r^7 + 2260506363494400*r^8 + 664425256322580480*c + 2962039571094159360*c*r + 5591882378792263680*c*r^2 + 5804700755570196480*c*r^3 + 3583758029379010560*c*r^4 + 1317644866404679680*c*r^5 + 267428462094581760*c*r^6 + 23134278382387200*c*r^7 + 1997604302176788480*c^2 + 7479256626520842240*c^2*r + 11543141670464839680*c^2*r^2 + 9415406707645317120*c^2*r^3 + 4286969156908892160*c^2*r^4 + 1034321692893511680*c^2*r^5 + 103413806692761600*c^2*r^6 + 3329716881597603840*c^3 + 10186424440861777920*c^3*r + 12348577478365470720*c^3*r^2 + 7426602518362030080*c^3*r^3 + 2218777241730416640*c^3*r^4 + 263723615266406400*c^3*r^5 + 3365673050941931520*c^4 + 8084571471220285440*c^4*r + 7224835112421212160*c^4*r^2 + 2850982022690242560*c^4*r^3 + 419640823797350400*c^4*r^4 + 2113653494684712960*c^5 + 3742193324401459200*c^5*r + 2194254995306250240*c^5*r^2 + 426635978483957760*c^5*r^3 + 806234914591948800*c^6 + 936606565487738880*c^6*r + 270633749092761600*c^6*r^2 + 171037038745681920*c^7 + 97932697542328320*c^7*r + 15477710018641920*c^8

theorem onsetG2_6_1M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_1M1B c r := by
 unfold onsetG2_6_1M1B
 positivity

def onsetG2_6_2M1B (c r : ℤ) : ℤ :=
 83014398589280256 + 432988679056453632*r + 975078615246188544*r^2 + 1240000672377987072*r^3 + 975392190226169856*r^4 + 486661622485893120*r^5 + 150603626718461952*r^6 + 26461031472562176*r^7 + 2023174612795392*r^8 + 594573335470356480*c + 2659311702900744192*c*r + 5034970542115713024*c*r^2 + 5239249180506980352*c*r^3 + 3240894761614024704*c*r^4 + 1193415197212901376*c*r^5 + 242536318216077312*c*r^6 + 21009556319109120*c*r^7 + 1811068769397242880*c^2 + 6806218813319245824*c^2*r + 10539159066058162176*c^2*r^2 + 8620734246213132288*c^2*r^3 + 3934517676971728896*c^2*r^4 + 951278362463600640*c^2*r^5 + 95303029229420544*c^2*r^6 + 3062917396325928960*c^3 + 9409398269885042688*c^3*r + 11448819402015485952*c^3*r^2 + 6907675167387058176*c^3*r^3 + 2069628193506263040*c^3*r^4 + 246648486366019584*c^3*r^5 + 3145834275318217728*c^4 + 7591010332305125376*c^4*r + 6811192909242925056*c^4*r^2 + 2697388758588948480*c^4*r^3 + 398329430900244480*c^4*r^4 + 2010184210916904960*c^5 + 3576251593188900864*c^5*r + 2105960639525535744*c^5*r^2 + 411046807949180928*c^5*r^3 + 781129653999206400*c^6 + 911964334468497408*c^6*r + 264678511604613120*c^6*r^2 + 168970704124723200*c^7 + 97230157917290496*c^7*r + 15600908834574336*c^8

theorem onsetG2_6_2M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_2M1B c r := by
 unfold onsetG2_6_2M1B
 positivity

def onsetG2_6_3M1B (c r : ℤ) : ℤ :=
 44958838424371200 + 234981585167745024*r + 530099043104440320*r^2 + 675003371713757184*r^3 + 531374401423294464*r^4 + 265186955891343360*r^5 + 82045566006362112*r^6 + 14406510264287232*r^7 + 1100574078664704*r^8 + 325500985195094016*c + 1459521949541720064*c*r + 2769312480584466432*c*r^2 + 2886480576377782272*c*r^3 + 1787565999857713152*c*r^4 + 658674909099540480*c*r^5 + 133893282126643200*c*r^6 + 11597756175581184*c*r^7 + 1003623435095371776*c^2 + 3783033198760402944*c^2*r + 5872862176440053760*c^2*r^2 + 4813670824475369472*c^2*r^3 + 2200335109852078080*c^2*r^4 + 532562487588569088*c^2*r^5 + 53392181117829120*c^2*r^6 + 1720672813700628480*c^3 + 5304167803478949888*c^3*r + 6472793797511258112*c^3*r^2 + 3914764038928834560*c^3*r^3 + 1175134046182440960*c^3*r^4 + 140250969988104192*c^3*r^5 + 1794201638193893376*c^4 + 4346048571051220992*c^4*r + 3912302149004390400*c^4*r^2 + 1553538530612920320*c^4*r^3 + 229915735519518720*c^4*r^4 + 1165630106969137152*c^5 + 2082247907195731968*c^5*r + 1230448482671321088*c^5*r^2 + 240856626731728896*c^5*r^3 + 461086733076480000*c^6 + 540601105268367360*c^6*r + 157459461408055296*c^6*r^2 + 101635955508068352*c^7 + 58732030891376640*c^7*r + 9569479946600448*c^8

theorem onsetG2_6_3M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_3M1B c r := by
 unfold onsetG2_6_3M1B
 positivity

def onsetG2_6_4M1B (c r : ℤ) : ℤ :=
 16607174028963840 + 86911867002777600*r + 196256444414722048*r^2 + 250034437817335808*r^3 + 196827829798240256*r^4 + 98168592469950464*r^5 + 30335230633508864*r^6 + 5317018663190528*r^7 + 405237077819392*r^8 + 121439756517488640*c + 545471997394243584*c*r + 1036384584359018496*c*r^2 + 1081160170121773056*c*r^3 + 669745189722685440*c*r^4 + 246708803162013696*c*r^5 + 50104754434473984*c*r^6 + 4333636854349824*c*r^7 + 378695589563547648*c^2 + 1430567994668488704*c^2*r + 2224701697626218496*c^2*r^2 + 1825640580959354880*c^2*r^3 + 834997326539980800*c^2*r^4 + 202096094104977408*c^2*r^5 + 20248592823975936*c^2*r^6 + 657585109103956992*c^3 + 2032387363788558336*c^3*r + 2485350740375838720*c^3*r^2 + 1505382610985164800*c^3*r^3 + 452271025617223680*c^3*r^4 + 53989778346835968*c^3*r^5 + 695498236499275776*c^4 + 1689719153801656320*c^4*r + 1524691307715932160*c^4*r^2 + 606477221056143360*c^4*r^3 + 89848828243722240*c^4*r^4 + 458958181201099776*c^5 + 822534590569660416*c^5*r + 487297625554317312*c^5*r^2 + 95562942167605248*c^5*r^3 + 184646559926513664*c^6 + 217221876350631936*c^6*r + 63435943353839616*c^6*r^2 + 41440705110024192*c^7 + 24028414366408704*c^7*r + 3976202887759872*c^8

theorem onsetG2_6_4M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_4M1B c r := by
 unfold onsetG2_6_4M1B
 positivity

def onsetG2_6_5M1B (c r : ℤ) : ℤ :=
 4408301664829440 + 23082260111769600*r + 52130748655534080*r^2 + 66395536770662400*r^3 + 52221327281356800*r^4 + 26005971669565440*r^5 + 8018184757739520*r^6 + 1401179855093760*r^7 + 106386047631360*r^8 + 32532287769354240*c + 146258789984133120*c*r + 278029106885591040*c*r^2 + 290036692996055040*c*r^3 + 179555050260848640*c*r^4 + 66053594166067200*c*r^5 + 13387165554524160*c*r^6 + 1154556734177280*c*r^7 + 102512220301209600*c^2 + 387764657659330560*c^2*r + 603530300662087680*c^2*r^2 + 495398697717288960*c^2*r^3 + 226486969944883200*c^2*r^4 + 54753531095531520*c^2*r^5 + 5475213336821760*c^2*r^6 + 180120841914101760*c^3 + 557651381773731840*c^3*r + 682722820775761920*c^3*r^2 + 413728817251921920*c^3*r^3 + 124267791255552000*c^3*r^4 + 14818943119196160*c^3*r^5 + 193040189469388800*c^4 + 469954233047255040*c^4*r + 424646014482708480*c^4*r^2 + 169021319010324480*c^4*r^3 + 25036486478438400*c^4*r^4 + 129260902446305280*c^5 + 232189257408030720*c^5*r + 137768667977041920*c^5*r^2 + 27037162474721280*c^5*r^3 + 52837173586391040*c^6 + 62309061627402240*c^6*r + 18225202435614720*c^6*r^2 + 12062263447019520*c^7 + 7011021282693120*c^7*r + 1178410554961920*c^8

theorem onsetG2_6_5M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_5M1B c r := by
 unfold onsetG2_6_5M1B
 positivity

def onsetG2_6_6M1B (c r : ℤ) : ℤ :=
 862257386446848 + 4513562449944576*r + 10186924112433152*r^2 + 12959286351241216*r^3 + 10174667508748288*r^4 + 5054366716887040*r^5 + 1553244612591616*r^6 + 270294457581568*r^7 + 20416355434496*r^8 + 6416763655680000*c + 28850128937742336*c*r + 54821289803599872*c*r^2 + 57135061064933376*c*r^3 + 35313973685501952*c*r^4 + 12960083837288448*c*r^5 + 2618088374501376*c*r^6 + 224842410885120*c*r^7 + 20414067387356160*c^2 + 77250314158036992*c^2*r + 120222710298851328*c^2*r^2 + 98610263865114624*c^2*r^3 + 45015937447477248*c^2*r^4 + 10857349936742400*c^2*r^5 + 1082168657805312*c^2*r^6 + 36259930350443520*c^3 + 112343992378619904*c^3*r + 137560755961552896*c^3*r^2 + 83313619936985088*c^3*r^3 + 24989105652940800*c^3*r^4 + 2973059968499712*c^3*r^5 + 39336720745883904*c^4 + 95863829061869568*c^4*r + 86650516269692928*c^4*r^2 + 34473007307612160*c^4*r^3 + 5099338442096640*c^4*r^4 + 26698282262507520*c^5 + 48017337842460672*c^5*r + 28503584698724352*c^5*r^2 + 5591351681040384*c^5*r^3 + 11075838905940480*c^6 + 13079102856873984*c^6*r + 3827401989304320*c^6*r^2 + 2569213408527360*c^7 + 1495371585835008*c^7*r + 255305251531008*c^8

theorem onsetG2_6_6M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_6M1B c r := by
 unfold onsetG2_6_6M1B
 positivity

def onsetG2_6_7M1B (c r : ℤ) : ℤ :=
 125213270999040 + 654719133745152*r + 1475412158545920*r^2 + 1873063977910272*r^3 + 1466595707092992*r^4 + 726010254950400*r^5 + 222135860330496*r^6 + 38449077682176*r^7 + 2885447319552*r^8 + 938922835673088*c + 4217968960192512*c*r + 8004520382939136*c*r^2 + 8326392509546496*c*r^3 + 5132801980809216*c*r^4 + 1877169752801280*c*r^5 + 377530190069760*c*r^6 + 32244166950912*c*r^7 + 3013132328091648*c^2 + 11396036125458432*c^2*r + 17715867022909440*c^2*r^2 + 14505196816244736*c^2*r^3 + 6604554029875200*c^2*r^4 + 1587361908916224*c^2*r^5 + 157496995676160*c^2*r^6 + 5405084424069120*c^3 + 16741977640464384*c^3*r + 20481080597139456*c^3*r^2 + 12383419376885760*c^3*r^3 + 3704714057318400*c^3*r^4 + 439189673803776*c^3*r^5 + 5929212315414528*c^4 + 14448897820901376*c^4*r + 13049997225431040*c^4*r^2 + 5183261341655040*c^4*r^3 + 764716350504960*c^4*r^4 + 4074284825726976*c^5 + 7328595620634624*c^5*r + 4347227858448384*c^5*r^2 + 851350683230208*c^5*r^3 + 1713376820736000*c^6 + 2023717080268800*c^6*r + 591790368411648*c^6*r^2 + 403368264585216*c^7 + 234829053849600*c^7*r + 40725614813184*c^8

theorem onsetG2_6_7M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_7M1B c r := by
 unfold onsetG2_6_7M1B
 positivity

def onsetG2_6_8M1B (c r : ℤ) : ℤ :=
 13396767068160 + 69914730332160*r + 157173332434944*r^2 + 198936077942784*r^3 + 155189547061248*r^4 + 76477060595712*r^5 + 23272171732992*r^6 + 4001979039744*r^7 + 298029613056*r^8 + 101146287513600*c + 453600336494592*c*r + 858854337159168*c*r^2 + 890779932499968*c*r^3 + 547092908974080*c*r^4 + 199165599940608*c*r^5 + 39831376822272*c*r^6 + 3379041533952*c*r^7 + 327143034537984*c^2 + 1235411542536192*c^2*r + 1916430452471808*c^2*r^2 + 1564619937914880*c^2*r^3 + 709760231792640*c^2*r^4 + 169786327302144*c^2*r^5 + 16748723109888*c^2*r^6 + 592087190317056*c^3 + 1831519621306368*c^3*r + 2236035869061120*c^3*r^2 + 1348131961774080*c^3*r^3 + 401794670592000*c^3*r^4 + 47402397794304*c^3*r^5 + 656046385682688*c^4 + 1596852629084160*c^4*r + 1439440282183680*c^4*r^2 + 570093529743360*c^4*r^3 + 83783731691520*c^4*r^4 + 455880355918848*c^5 + 819152309864448*c^5*r + 484976794853376*c^5*r^2 + 94700420849664*c^5*r^3 + 194101220823552*c^6 + 229032510916608*c^6*r + 66844990291968*c^6*r^2 + 46319331050496*c^7 + 26939168428032*c^7*r + 4745756687616*c^8

theorem onsetG2_6_8M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_8M1B c r := by
 unfold onsetG2_6_8M1B
 positivity

def onsetG2_6_9M1B (c r : ℤ) : ℤ :=
 1029859246080 + 5359760179200*r + 12009190932480*r^2 + 15139946250240*r^3 + 11754986127360*r^4 + 5760572375040*r^5 + 1741500579840*r^6 + 297195601920*r^7 + 21937520640*r^8 + 7822947041280*c + 34989843947520*c*r + 66034838446080*c*r^2 + 68218165370880*c*r^3 + 41697481728000*c*r^4 + 15093022801920*c*r^5 + 2998094561280*c*r^6 + 252329656320*c*r^7 + 25479050526720*c^2 + 95974683033600*c^2*r + 148404412477440*c^2*r^2 + 120679002501120*c^2*r^3 + 54477114531840*c^2*r^4 + 12955248230400*c^2*r^5 + 1269049098240*c^2*r^6 + 46480618598400*c^3 + 143431641507840*c^3*r + 174556883343360*c^3*r^2 + 104819529830400*c^3*r^3 + 31084381224960*c^3*r^4 + 3644983050240*c^3*r^5 + 51964225044480*c^4 + 126188898232320*c^4*r + 113391157340160*c^4*r^2 + 44725239336960*c^4*r^3 + 6539297587200*c^4*r^4 + 36472838492160*c^5 + 65387672340480*c^5*r + 38589663651840*c^5*r^2 + 7503750696960*c^5*r^3 + 15702787215360*c^6 + 18487029012480*c^6*r + 5378119649280*c^6*r^2 + 3793413980160*c^7 + 2201212661760*c^7*r + 393896079360*c^8

theorem onsetG2_6_9M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_9M1B c r := by
 unfold onsetG2_6_9M1B
 positivity

def onsetG2_6_10M1B (c r : ℤ) : ℤ :=
 53997060096 + 280000315392*r + 624707170304*r^2 + 783658688512*r^3 + 604944019456*r^4 + 294482083840*r^5 + 88345772032*r^6 + 14945222656*r^7 + 1092288512*r^8 + 412358123520*c + 1837716099072*c*r + 3453419311104*c*r^2 + 3549625884672*c*r^3 + 2156867026944*c*r^4 + 775359922176*c*r^5 + 152801574912*c*r^6 + 12744130560*c*r^7 + 1351249320960*c^2 + 5071706486784*c^2*r + 7808585680896*c^2*r^2 + 6317210124288*c^2*r^3 + 2834473721856*c^2*r^4 + 669304258560*c^2*r^5 + 65026719744*c^2*r^6 + 2482214353920*c^3 + 7632526583808*c^3*r + 9248511025152*c^3*r^2 + 5524583694336*c^3*r^3 + 1628133212160*c^3*r^4 + 189522837504*c^3*r^5 + 2796930355968*c^4 + 6767991853056*c^4*r + 6054871689216*c^4*r^2 + 2375453122560*c^4*r^3 + 345090170880*c^4*r^4 + 1980506142720*c^5 + 3538026584064*c^5*r + 2078685794304*c^5*r^2 + 401975820288*c^5*r^3 + 861101176320*c^6 + 1010156894208*c^6*r + 292521922560*c^6*r^2 + 210299120640*c^7 + 121586282496*c^7*r + 22099827456*c^8

theorem onsetG2_6_10M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_10M1B c r := by
 unfold onsetG2_6_10M1B
 positivity

def onsetG2_6_11M1B (c r : ℤ) : ℤ :=
 1734082560 + 8951169024*r + 19866255360*r^2 + 24771231744*r^3 + 18990956544*r^4 + 9172746240*r^5 + 2727739392*r^6 + 456916992*r^7 + 33030144*r^8 + 13302890496*c + 59012481024*c*r + 110302789632*c*r^2 + 112676831232*c*r^3 + 67982917632*c*r^4 + 24242749440*c*r^5 + 4734320640*c*r^6 + 390856704*c*r^7 + 43819646976*c^2 + 163702554624*c^2*r + 250667827200*c^2*r^2 + 201510715392*c^2*r^3 + 89759416320*c^2*r^4 + 21019557888*c^2*r^5 + 2023096320*c^2*r^6 + 80975462400*c^3 + 247812784128*c^3*r + 298609016832*c^3*r^2 + 177217044480*c^3*r^3 + 51836682240*c^3*r^4 + 5982584832*c^3*r^5 + 91859152896*c^4 + 221213970432*c^4*r + 196779663360*c^4*r^2 + 76686704640*c^4*r^3 + 11054776320*c^4*r^4 + 65541353472*c^5 + 116514091008*c^5*r + 68056547328*c^5*r^2 + 13070647296*c^5*r^3 + 28740096000*c^6 + 33547530240*c^6*r + 9656672256*c^6*r^2 + 7085740032*c^7 + 4075868160*c^7*r + 752467968*c^8

theorem onsetG2_6_11M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_11M1B c r := by
 unfold onsetG2_6_11M1B
 positivity

def onsetG2_6_12M1B (c r : ℤ) : ℤ :=
 25804800 + 132464640*r + 292139008*r^2 + 361668608*r^3 + 275050496*r^4 + 131661824*r^5 + 38764544*r^6 + 6422528*r^7 + 458752*r^8 + 198696960*c + 876417024*c*r + 1627508736*c*r^2 + 1650302976*c*r^3 + 987463680*c*r^4 + 348880896*c*r^5 + 67436544*c*r^6 + 5505024*c*r^7 + 657312768*c^2 + 2441263104*c^2*r + 3713181696*c^2*r^2 + 2962391040*c^2*r^3 + 1308303360*c^2*r^4 + 303464448*c^2*r^5 + 28901376*c^2*r^6 + 1220631552*c^3 + 3713181696*c^3*r + 4443586560*c^3*r^2 + 2616606720*c^3*r^3 + 758661120*c^3*r^4 + 86704128*c^3*r^5 + 1392443136*c^4 + 3332689920*c^4*r + 2943682560*c^4*r^2 + 1137991680*c^4*r^3 + 162570240*c^4*r^4 + 999806976*c^5 + 1766209536*c^5*r + 1024192512*c^5*r^2 + 195084288*c^5*r^3 + 441552384*c^6 + 512096256*c^6*r + 146313216*c^6*r^2 + 109734912*c^7 + 62705664*c^7*r + 11757312*c^8

theorem onsetG2_6_12M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_12M1B c r := by
 unfold onsetG2_6_12M1B
 positivity

def onsetG2_6_13M1B (c r : ℤ) : ℤ :=
 0

theorem onsetG2_6_13M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_13M1B c r := by
 unfold onsetG2_6_13M1B
 positivity

def onsetG2_6_14M1B (c r : ℤ) : ℤ :=
 0

theorem onsetG2_6_14M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG2_6_14M1B c r := by
 unfold onsetG2_6_14M1B
 positivity

theorem onset_stage2_6_0M1B (n c r : ℤ) :
 onsetValue2_6M1B (n+7) (5 + 2*r + 3*c) (2 + 1*r + 1*c)=onsetP2_6_0_0M1B c r*n^0 + onsetP2_6_0_1M1B c r*n^1 + onsetP2_6_0_2M1B c r*n^2 + onsetP2_6_0_3M1B c r*n^3 + onsetP2_6_0_4M1B c r*n^4 + onsetP2_6_0_5M1B c r*n^5 + onsetP2_6_0_6M1B c r*n^6 + onsetP2_6_0_7M1B c r*n^7 := by
 unfold onsetValue2_6M1B backShape2M94 onsetCorrection2_6M1B onsetP2_6_0_0M1B onsetP2_6_0_1M1B onsetP2_6_0_2M1B onsetP2_6_0_3M1B onsetP2_6_0_4M1B onsetP2_6_0_5M1B onsetP2_6_0_6M1B onsetP2_6_0_7M1B
 ring

theorem onset_stage2_6_1M1B (n c r : ℤ) :
 onsetValue2_7M1B (n+7) (5 + 2*r + 3*c) (2 + 1*r + 1*c)=onsetP2_6_1_0M1B c r*n^0 + onsetP2_6_1_1M1B c r*n^1 + onsetP2_6_1_2M1B c r*n^2 + onsetP2_6_1_3M1B c r*n^3 + onsetP2_6_1_4M1B c r*n^4 + onsetP2_6_1_5M1B c r*n^5 + onsetP2_6_1_6M1B c r*n^6 + onsetP2_6_1_7M1B c r*n^7 := by
 unfold onsetValue2_7M1B backShape2M94 onsetCorrection2_7M1B onsetP2_6_1_0M1B onsetP2_6_1_1M1B onsetP2_6_1_2M1B onsetP2_6_1_3M1B onsetP2_6_1_4M1B onsetP2_6_1_5M1B onsetP2_6_1_6M1B onsetP2_6_1_7M1B
 ring

theorem onset_stage2_6_2M1B (n c r : ℤ) :
 onsetValue2_8M1B (n+7) (5 + 2*r + 3*c) (2 + 1*r + 1*c)=onsetP2_6_2_0M1B c r*n^0 + onsetP2_6_2_1M1B c r*n^1 + onsetP2_6_2_2M1B c r*n^2 + onsetP2_6_2_3M1B c r*n^3 + onsetP2_6_2_4M1B c r*n^4 + onsetP2_6_2_5M1B c r*n^5 + onsetP2_6_2_6M1B c r*n^6 + onsetP2_6_2_7M1B c r*n^7 := by
 unfold onsetValue2_8M1B backShape2M94 onsetCorrection2_8M1B onsetP2_6_2_0M1B onsetP2_6_2_1M1B onsetP2_6_2_2M1B onsetP2_6_2_3M1B onsetP2_6_2_4M1B onsetP2_6_2_5M1B onsetP2_6_2_6M1B onsetP2_6_2_7M1B
 ring

theorem onset_column2_6_0M1B (c r : ℤ) :
 (onsetP2_6_1_0M1B c r*onsetP2_6_1_0M1B c r)-(onsetP2_6_0_0M1B c r*onsetP2_6_2_0M1B c r)=onsetG2_6_0M1B c r := by
 unfold onsetG2_6_0M1B onsetP2_6_0_0M1B onsetP2_6_1_0M1B onsetP2_6_2_0M1B
 ring

theorem onset_column2_6_1M1B (c r : ℤ) :
 (onsetP2_6_1_0M1B c r*onsetP2_6_1_1M1B c r + onsetP2_6_1_1M1B c r*onsetP2_6_1_0M1B c r)-(onsetP2_6_0_0M1B c r*onsetP2_6_2_1M1B c r + onsetP2_6_0_1M1B c r*onsetP2_6_2_0M1B c r)=onsetG2_6_1M1B c r := by
 unfold onsetG2_6_1M1B onsetP2_6_0_0M1B onsetP2_6_0_1M1B onsetP2_6_1_0M1B onsetP2_6_1_1M1B onsetP2_6_2_0M1B onsetP2_6_2_1M1B
 ring

theorem onset_column2_6_2M1B (c r : ℤ) :
 (onsetP2_6_1_0M1B c r*onsetP2_6_1_2M1B c r + onsetP2_6_1_1M1B c r*onsetP2_6_1_1M1B c r + onsetP2_6_1_2M1B c r*onsetP2_6_1_0M1B c r)-(onsetP2_6_0_0M1B c r*onsetP2_6_2_2M1B c r + onsetP2_6_0_1M1B c r*onsetP2_6_2_1M1B c r + onsetP2_6_0_2M1B c r*onsetP2_6_2_0M1B c r)=onsetG2_6_2M1B c r := by
 unfold onsetG2_6_2M1B onsetP2_6_0_0M1B onsetP2_6_0_1M1B onsetP2_6_0_2M1B onsetP2_6_1_0M1B onsetP2_6_1_1M1B onsetP2_6_1_2M1B onsetP2_6_2_0M1B onsetP2_6_2_1M1B onsetP2_6_2_2M1B
 ring

theorem onset_column2_6_3M1B (c r : ℤ) :
 (onsetP2_6_1_0M1B c r*onsetP2_6_1_3M1B c r + onsetP2_6_1_1M1B c r*onsetP2_6_1_2M1B c r + onsetP2_6_1_2M1B c r*onsetP2_6_1_1M1B c r + onsetP2_6_1_3M1B c r*onsetP2_6_1_0M1B c r)-(onsetP2_6_0_0M1B c r*onsetP2_6_2_3M1B c r + onsetP2_6_0_1M1B c r*onsetP2_6_2_2M1B c r + onsetP2_6_0_2M1B c r*onsetP2_6_2_1M1B c r + onsetP2_6_0_3M1B c r*onsetP2_6_2_0M1B c r)=onsetG2_6_3M1B c r := by
 unfold onsetG2_6_3M1B onsetP2_6_0_0M1B onsetP2_6_0_1M1B onsetP2_6_0_2M1B onsetP2_6_0_3M1B onsetP2_6_1_0M1B onsetP2_6_1_1M1B onsetP2_6_1_2M1B onsetP2_6_1_3M1B onsetP2_6_2_0M1B onsetP2_6_2_1M1B onsetP2_6_2_2M1B onsetP2_6_2_3M1B
 ring

theorem onset_column2_6_4M1B (c r : ℤ) :
 (onsetP2_6_1_0M1B c r*onsetP2_6_1_4M1B c r + onsetP2_6_1_1M1B c r*onsetP2_6_1_3M1B c r + onsetP2_6_1_2M1B c r*onsetP2_6_1_2M1B c r + onsetP2_6_1_3M1B c r*onsetP2_6_1_1M1B c r + onsetP2_6_1_4M1B c r*onsetP2_6_1_0M1B c r)-(onsetP2_6_0_0M1B c r*onsetP2_6_2_4M1B c r + onsetP2_6_0_1M1B c r*onsetP2_6_2_3M1B c r + onsetP2_6_0_2M1B c r*onsetP2_6_2_2M1B c r + onsetP2_6_0_3M1B c r*onsetP2_6_2_1M1B c r + onsetP2_6_0_4M1B c r*onsetP2_6_2_0M1B c r)=onsetG2_6_4M1B c r := by
 unfold onsetG2_6_4M1B onsetP2_6_0_0M1B onsetP2_6_0_1M1B onsetP2_6_0_2M1B onsetP2_6_0_3M1B onsetP2_6_0_4M1B onsetP2_6_1_0M1B onsetP2_6_1_1M1B onsetP2_6_1_2M1B onsetP2_6_1_3M1B onsetP2_6_1_4M1B onsetP2_6_2_0M1B onsetP2_6_2_1M1B onsetP2_6_2_2M1B onsetP2_6_2_3M1B onsetP2_6_2_4M1B
 ring

theorem onset_column2_6_5M1B (c r : ℤ) :
 (onsetP2_6_1_0M1B c r*onsetP2_6_1_5M1B c r + onsetP2_6_1_1M1B c r*onsetP2_6_1_4M1B c r + onsetP2_6_1_2M1B c r*onsetP2_6_1_3M1B c r + onsetP2_6_1_3M1B c r*onsetP2_6_1_2M1B c r + onsetP2_6_1_4M1B c r*onsetP2_6_1_1M1B c r + onsetP2_6_1_5M1B c r*onsetP2_6_1_0M1B c r)-(onsetP2_6_0_0M1B c r*onsetP2_6_2_5M1B c r + onsetP2_6_0_1M1B c r*onsetP2_6_2_4M1B c r + onsetP2_6_0_2M1B c r*onsetP2_6_2_3M1B c r + onsetP2_6_0_3M1B c r*onsetP2_6_2_2M1B c r + onsetP2_6_0_4M1B c r*onsetP2_6_2_1M1B c r + onsetP2_6_0_5M1B c r*onsetP2_6_2_0M1B c r)=onsetG2_6_5M1B c r := by
 unfold onsetG2_6_5M1B onsetP2_6_0_0M1B onsetP2_6_0_1M1B onsetP2_6_0_2M1B onsetP2_6_0_3M1B onsetP2_6_0_4M1B onsetP2_6_0_5M1B onsetP2_6_1_0M1B onsetP2_6_1_1M1B onsetP2_6_1_2M1B onsetP2_6_1_3M1B onsetP2_6_1_4M1B onsetP2_6_1_5M1B onsetP2_6_2_0M1B onsetP2_6_2_1M1B onsetP2_6_2_2M1B onsetP2_6_2_3M1B onsetP2_6_2_4M1B onsetP2_6_2_5M1B
 ring

theorem onset_column2_6_6M1B (c r : ℤ) :
 (onsetP2_6_1_0M1B c r*onsetP2_6_1_6M1B c r + onsetP2_6_1_1M1B c r*onsetP2_6_1_5M1B c r + onsetP2_6_1_2M1B c r*onsetP2_6_1_4M1B c r + onsetP2_6_1_3M1B c r*onsetP2_6_1_3M1B c r + onsetP2_6_1_4M1B c r*onsetP2_6_1_2M1B c r + onsetP2_6_1_5M1B c r*onsetP2_6_1_1M1B c r + onsetP2_6_1_6M1B c r*onsetP2_6_1_0M1B c r)-(onsetP2_6_0_0M1B c r*onsetP2_6_2_6M1B c r + onsetP2_6_0_1M1B c r*onsetP2_6_2_5M1B c r + onsetP2_6_0_2M1B c r*onsetP2_6_2_4M1B c r + onsetP2_6_0_3M1B c r*onsetP2_6_2_3M1B c r + onsetP2_6_0_4M1B c r*onsetP2_6_2_2M1B c r + onsetP2_6_0_5M1B c r*onsetP2_6_2_1M1B c r + onsetP2_6_0_6M1B c r*onsetP2_6_2_0M1B c r)=onsetG2_6_6M1B c r := by
 unfold onsetG2_6_6M1B onsetP2_6_0_0M1B onsetP2_6_0_1M1B onsetP2_6_0_2M1B onsetP2_6_0_3M1B onsetP2_6_0_4M1B onsetP2_6_0_5M1B onsetP2_6_0_6M1B onsetP2_6_1_0M1B onsetP2_6_1_1M1B onsetP2_6_1_2M1B onsetP2_6_1_3M1B onsetP2_6_1_4M1B onsetP2_6_1_5M1B onsetP2_6_1_6M1B onsetP2_6_2_0M1B onsetP2_6_2_1M1B onsetP2_6_2_2M1B onsetP2_6_2_3M1B onsetP2_6_2_4M1B onsetP2_6_2_5M1B onsetP2_6_2_6M1B
 ring

theorem onset_column2_6_7M1B (c r : ℤ) :
 (onsetP2_6_1_0M1B c r*onsetP2_6_1_7M1B c r + onsetP2_6_1_1M1B c r*onsetP2_6_1_6M1B c r + onsetP2_6_1_2M1B c r*onsetP2_6_1_5M1B c r + onsetP2_6_1_3M1B c r*onsetP2_6_1_4M1B c r + onsetP2_6_1_4M1B c r*onsetP2_6_1_3M1B c r + onsetP2_6_1_5M1B c r*onsetP2_6_1_2M1B c r + onsetP2_6_1_6M1B c r*onsetP2_6_1_1M1B c r + onsetP2_6_1_7M1B c r*onsetP2_6_1_0M1B c r)-(onsetP2_6_0_0M1B c r*onsetP2_6_2_7M1B c r + onsetP2_6_0_1M1B c r*onsetP2_6_2_6M1B c r + onsetP2_6_0_2M1B c r*onsetP2_6_2_5M1B c r + onsetP2_6_0_3M1B c r*onsetP2_6_2_4M1B c r + onsetP2_6_0_4M1B c r*onsetP2_6_2_3M1B c r + onsetP2_6_0_5M1B c r*onsetP2_6_2_2M1B c r + onsetP2_6_0_6M1B c r*onsetP2_6_2_1M1B c r + onsetP2_6_0_7M1B c r*onsetP2_6_2_0M1B c r)=onsetG2_6_7M1B c r := by
 unfold onsetG2_6_7M1B onsetP2_6_0_0M1B onsetP2_6_0_1M1B onsetP2_6_0_2M1B onsetP2_6_0_3M1B onsetP2_6_0_4M1B onsetP2_6_0_5M1B onsetP2_6_0_6M1B onsetP2_6_0_7M1B onsetP2_6_1_0M1B onsetP2_6_1_1M1B onsetP2_6_1_2M1B onsetP2_6_1_3M1B onsetP2_6_1_4M1B onsetP2_6_1_5M1B onsetP2_6_1_6M1B onsetP2_6_1_7M1B onsetP2_6_2_0M1B onsetP2_6_2_1M1B onsetP2_6_2_2M1B onsetP2_6_2_3M1B onsetP2_6_2_4M1B onsetP2_6_2_5M1B onsetP2_6_2_6M1B onsetP2_6_2_7M1B
 ring

theorem onset_column2_6_8M1B (c r : ℤ) :
 (onsetP2_6_1_1M1B c r*onsetP2_6_1_7M1B c r + onsetP2_6_1_2M1B c r*onsetP2_6_1_6M1B c r + onsetP2_6_1_3M1B c r*onsetP2_6_1_5M1B c r + onsetP2_6_1_4M1B c r*onsetP2_6_1_4M1B c r + onsetP2_6_1_5M1B c r*onsetP2_6_1_3M1B c r + onsetP2_6_1_6M1B c r*onsetP2_6_1_2M1B c r + onsetP2_6_1_7M1B c r*onsetP2_6_1_1M1B c r)-(onsetP2_6_0_1M1B c r*onsetP2_6_2_7M1B c r + onsetP2_6_0_2M1B c r*onsetP2_6_2_6M1B c r + onsetP2_6_0_3M1B c r*onsetP2_6_2_5M1B c r + onsetP2_6_0_4M1B c r*onsetP2_6_2_4M1B c r + onsetP2_6_0_5M1B c r*onsetP2_6_2_3M1B c r + onsetP2_6_0_6M1B c r*onsetP2_6_2_2M1B c r + onsetP2_6_0_7M1B c r*onsetP2_6_2_1M1B c r)=onsetG2_6_8M1B c r := by
 unfold onsetG2_6_8M1B onsetP2_6_0_1M1B onsetP2_6_0_2M1B onsetP2_6_0_3M1B onsetP2_6_0_4M1B onsetP2_6_0_5M1B onsetP2_6_0_6M1B onsetP2_6_0_7M1B onsetP2_6_1_1M1B onsetP2_6_1_2M1B onsetP2_6_1_3M1B onsetP2_6_1_4M1B onsetP2_6_1_5M1B onsetP2_6_1_6M1B onsetP2_6_1_7M1B onsetP2_6_2_1M1B onsetP2_6_2_2M1B onsetP2_6_2_3M1B onsetP2_6_2_4M1B onsetP2_6_2_5M1B onsetP2_6_2_6M1B onsetP2_6_2_7M1B
 ring

theorem onset_column2_6_9M1B (c r : ℤ) :
 (onsetP2_6_1_2M1B c r*onsetP2_6_1_7M1B c r + onsetP2_6_1_3M1B c r*onsetP2_6_1_6M1B c r + onsetP2_6_1_4M1B c r*onsetP2_6_1_5M1B c r + onsetP2_6_1_5M1B c r*onsetP2_6_1_4M1B c r + onsetP2_6_1_6M1B c r*onsetP2_6_1_3M1B c r + onsetP2_6_1_7M1B c r*onsetP2_6_1_2M1B c r)-(onsetP2_6_0_2M1B c r*onsetP2_6_2_7M1B c r + onsetP2_6_0_3M1B c r*onsetP2_6_2_6M1B c r + onsetP2_6_0_4M1B c r*onsetP2_6_2_5M1B c r + onsetP2_6_0_5M1B c r*onsetP2_6_2_4M1B c r + onsetP2_6_0_6M1B c r*onsetP2_6_2_3M1B c r + onsetP2_6_0_7M1B c r*onsetP2_6_2_2M1B c r)=onsetG2_6_9M1B c r := by
 unfold onsetG2_6_9M1B onsetP2_6_0_2M1B onsetP2_6_0_3M1B onsetP2_6_0_4M1B onsetP2_6_0_5M1B onsetP2_6_0_6M1B onsetP2_6_0_7M1B onsetP2_6_1_2M1B onsetP2_6_1_3M1B onsetP2_6_1_4M1B onsetP2_6_1_5M1B onsetP2_6_1_6M1B onsetP2_6_1_7M1B onsetP2_6_2_2M1B onsetP2_6_2_3M1B onsetP2_6_2_4M1B onsetP2_6_2_5M1B onsetP2_6_2_6M1B onsetP2_6_2_7M1B
 ring

theorem onset_column2_6_10M1B (c r : ℤ) :
 (onsetP2_6_1_3M1B c r*onsetP2_6_1_7M1B c r + onsetP2_6_1_4M1B c r*onsetP2_6_1_6M1B c r + onsetP2_6_1_5M1B c r*onsetP2_6_1_5M1B c r + onsetP2_6_1_6M1B c r*onsetP2_6_1_4M1B c r + onsetP2_6_1_7M1B c r*onsetP2_6_1_3M1B c r)-(onsetP2_6_0_3M1B c r*onsetP2_6_2_7M1B c r + onsetP2_6_0_4M1B c r*onsetP2_6_2_6M1B c r + onsetP2_6_0_5M1B c r*onsetP2_6_2_5M1B c r + onsetP2_6_0_6M1B c r*onsetP2_6_2_4M1B c r + onsetP2_6_0_7M1B c r*onsetP2_6_2_3M1B c r)=onsetG2_6_10M1B c r := by
 unfold onsetG2_6_10M1B onsetP2_6_0_3M1B onsetP2_6_0_4M1B onsetP2_6_0_5M1B onsetP2_6_0_6M1B onsetP2_6_0_7M1B onsetP2_6_1_3M1B onsetP2_6_1_4M1B onsetP2_6_1_5M1B onsetP2_6_1_6M1B onsetP2_6_1_7M1B onsetP2_6_2_3M1B onsetP2_6_2_4M1B onsetP2_6_2_5M1B onsetP2_6_2_6M1B onsetP2_6_2_7M1B
 ring

theorem onset_column2_6_11M1B (c r : ℤ) :
 (onsetP2_6_1_4M1B c r*onsetP2_6_1_7M1B c r + onsetP2_6_1_5M1B c r*onsetP2_6_1_6M1B c r + onsetP2_6_1_6M1B c r*onsetP2_6_1_5M1B c r + onsetP2_6_1_7M1B c r*onsetP2_6_1_4M1B c r)-(onsetP2_6_0_4M1B c r*onsetP2_6_2_7M1B c r + onsetP2_6_0_5M1B c r*onsetP2_6_2_6M1B c r + onsetP2_6_0_6M1B c r*onsetP2_6_2_5M1B c r + onsetP2_6_0_7M1B c r*onsetP2_6_2_4M1B c r)=onsetG2_6_11M1B c r := by
 unfold onsetG2_6_11M1B onsetP2_6_0_4M1B onsetP2_6_0_5M1B onsetP2_6_0_6M1B onsetP2_6_0_7M1B onsetP2_6_1_4M1B onsetP2_6_1_5M1B onsetP2_6_1_6M1B onsetP2_6_1_7M1B onsetP2_6_2_4M1B onsetP2_6_2_5M1B onsetP2_6_2_6M1B onsetP2_6_2_7M1B
 ring

theorem onset_column2_6_12M1B (c r : ℤ) :
 (onsetP2_6_1_5M1B c r*onsetP2_6_1_7M1B c r + onsetP2_6_1_6M1B c r*onsetP2_6_1_6M1B c r + onsetP2_6_1_7M1B c r*onsetP2_6_1_5M1B c r)-(onsetP2_6_0_5M1B c r*onsetP2_6_2_7M1B c r + onsetP2_6_0_6M1B c r*onsetP2_6_2_6M1B c r + onsetP2_6_0_7M1B c r*onsetP2_6_2_5M1B c r)=onsetG2_6_12M1B c r := by
 unfold onsetG2_6_12M1B onsetP2_6_0_5M1B onsetP2_6_0_6M1B onsetP2_6_0_7M1B onsetP2_6_1_5M1B onsetP2_6_1_6M1B onsetP2_6_1_7M1B onsetP2_6_2_5M1B onsetP2_6_2_6M1B onsetP2_6_2_7M1B
 ring

theorem onset_column2_6_13M1B (c r : ℤ) :
 (onsetP2_6_1_6M1B c r*onsetP2_6_1_7M1B c r + onsetP2_6_1_7M1B c r*onsetP2_6_1_6M1B c r)-(onsetP2_6_0_6M1B c r*onsetP2_6_2_7M1B c r + onsetP2_6_0_7M1B c r*onsetP2_6_2_6M1B c r)=onsetG2_6_13M1B c r := by
 unfold onsetG2_6_13M1B onsetP2_6_0_6M1B onsetP2_6_0_7M1B onsetP2_6_1_6M1B onsetP2_6_1_7M1B onsetP2_6_2_6M1B onsetP2_6_2_7M1B
 ring

theorem onset_column2_6_14M1B (c r : ℤ) :
 (onsetP2_6_1_7M1B c r*onsetP2_6_1_7M1B c r)-(onsetP2_6_0_7M1B c r*onsetP2_6_2_7M1B c r)=onsetG2_6_14M1B c r := by
 unfold onsetG2_6_14M1B onsetP2_6_0_7M1B onsetP2_6_1_7M1B onsetP2_6_2_7M1B
 ring

attribute [local irreducible] onsetP2_6_0_0M1B onsetP2_6_0_1M1B onsetP2_6_0_2M1B onsetP2_6_0_3M1B onsetP2_6_0_4M1B onsetP2_6_0_5M1B onsetP2_6_0_6M1B onsetP2_6_0_7M1B onsetP2_6_1_0M1B onsetP2_6_1_1M1B onsetP2_6_1_2M1B onsetP2_6_1_3M1B onsetP2_6_1_4M1B onsetP2_6_1_5M1B onsetP2_6_1_6M1B onsetP2_6_1_7M1B onsetP2_6_2_0M1B onsetP2_6_2_1M1B onsetP2_6_2_2M1B onsetP2_6_2_3M1B onsetP2_6_2_4M1B onsetP2_6_2_5M1B onsetP2_6_2_6M1B onsetP2_6_2_7M1B onsetG2_6_0M1B onsetG2_6_1M1B onsetG2_6_2M1B onsetG2_6_3M1B onsetG2_6_4M1B onsetG2_6_5M1B onsetG2_6_6M1B onsetG2_6_7M1B onsetG2_6_8M1B onsetG2_6_9M1B onsetG2_6_10M1B onsetG2_6_11M1B onsetG2_6_12M1B onsetG2_6_13M1B onsetG2_6_14M1B

theorem onset_columns_lc2_6M1B (n c r : ℤ) (hn : 0≤n) (hc : 0≤c) (hr : 0≤r) :
 onsetValue2_6M1B (n+7) (5 + 2*r + 3*c) (2 + 1*r + 1*c)*
 onsetValue2_8M1B (n+7) (5 + 2*r + 3*c) (2 + 1*r + 1*c)≤
 onsetValue2_7M1B (n+7) (5 + 2*r + 3*c) (2 + 1*r + 1*c)^2 := by
 apply sub_nonneg.mp
 rw [onset_stage2_6_0M1B,onset_stage2_6_1M1B,onset_stage2_6_2M1B]
 have hgap : (onsetP2_6_1_0M1B c r*n^0 + onsetP2_6_1_1M1B c r*n^1 + onsetP2_6_1_2M1B c r*n^2 + onsetP2_6_1_3M1B c r*n^3 + onsetP2_6_1_4M1B c r*n^4 + onsetP2_6_1_5M1B c r*n^5 + onsetP2_6_1_6M1B c r*n^6 + onsetP2_6_1_7M1B c r*n^7)^2-(onsetP2_6_0_0M1B c r*n^0 + onsetP2_6_0_1M1B c r*n^1 + onsetP2_6_0_2M1B c r*n^2 + onsetP2_6_0_3M1B c r*n^3 + onsetP2_6_0_4M1B c r*n^4 + onsetP2_6_0_5M1B c r*n^5 + onsetP2_6_0_6M1B c r*n^6 + onsetP2_6_0_7M1B c r*n^7)*(onsetP2_6_2_0M1B c r*n^0 + onsetP2_6_2_1M1B c r*n^1 + onsetP2_6_2_2M1B c r*n^2 + onsetP2_6_2_3M1B c r*n^3 + onsetP2_6_2_4M1B c r*n^4 + onsetP2_6_2_5M1B c r*n^5 + onsetP2_6_2_6M1B c r*n^6 + onsetP2_6_2_7M1B c r*n^7)=onsetG2_6_0M1B c r*n^0 + onsetG2_6_1M1B c r*n^1 + onsetG2_6_2M1B c r*n^2 + onsetG2_6_3M1B c r*n^3 + onsetG2_6_4M1B c r*n^4 + onsetG2_6_5M1B c r*n^5 + onsetG2_6_6M1B c r*n^6 + onsetG2_6_7M1B c r*n^7 + onsetG2_6_8M1B c r*n^8 + onsetG2_6_9M1B c r*n^9 + onsetG2_6_10M1B c r*n^10 + onsetG2_6_11M1B c r*n^11 + onsetG2_6_12M1B c r*n^12 + onsetG2_6_13M1B c r*n^13 + onsetG2_6_14M1B c r*n^14 := by
  rw [←onset_column2_6_0M1B,←onset_column2_6_1M1B,←onset_column2_6_2M1B,←onset_column2_6_3M1B,←onset_column2_6_4M1B,←onset_column2_6_5M1B,←onset_column2_6_6M1B,←onset_column2_6_7M1B,←onset_column2_6_8M1B,←onset_column2_6_9M1B,←onset_column2_6_10M1B,←onset_column2_6_11M1B,←onset_column2_6_12M1B,←onset_column2_6_13M1B,←onset_column2_6_14M1B]
  ring
 rw [hgap]
 have h0 := onsetG2_6_0M1B_nonneg c r hc hr
 have h1 := onsetG2_6_1M1B_nonneg c r hc hr
 have h2 := onsetG2_6_2M1B_nonneg c r hc hr
 have h3 := onsetG2_6_3M1B_nonneg c r hc hr
 have h4 := onsetG2_6_4M1B_nonneg c r hc hr
 have h5 := onsetG2_6_5M1B_nonneg c r hc hr
 have h6 := onsetG2_6_6M1B_nonneg c r hc hr
 have h7 := onsetG2_6_7M1B_nonneg c r hc hr
 have h8 := onsetG2_6_8M1B_nonneg c r hc hr
 have h9 := onsetG2_6_9M1B_nonneg c r hc hr
 have h10 := onsetG2_6_10M1B_nonneg c r hc hr
 have h11 := onsetG2_6_11M1B_nonneg c r hc hr
 have h12 := onsetG2_6_12M1B_nonneg c r hc hr
 have h13 := onsetG2_6_13M1B_nonneg c r hc hr
 have h14 := onsetG2_6_14M1B_nonneg c r hc hr
 positivity
end
end MathGKM.Markov
