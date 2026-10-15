import MarkovBackwardChamber1M94
/-! Machine-authored 94b1de05. Staged backwards third-block gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false

def backChartP1_0_0M94 (c r : ℤ) : ℤ :=
 2099744640 + 4683813120*r + 3885073920*r^2 + 1425392640*r^3 + 195632640*r^4 + 5717053440*c + 9383996160*c*r + 5107898880*c*r^2 + 924456960*c*r^3 + 5655484800*c^2 + 6088158720*c^2*r + 1634411520*c^2*r^2 + 2413393920*c^3 + 1281208320*c^3*r + 375701760*c^4

def backChartP1_0_1M94 (c r : ℤ) : ℤ :=
 2509930080 + 5651096256*r + 4726373664*r^2 + 1746263808*r^3 + 241142208*r^4 + 6991590528*c + 11589219072*c*r + 6360909696*c*r^2 + 1159456512*c*r^3 + 7093052160*c^2 + 7709157504*c^2*r + 2086280064*c^2*r^2 + 3108409344*c^3 + 1664865024*c^3*r + 497108352*c^4

def backChartP1_0_2M94 (c r : ℤ) : ℤ :=
 1306448640 + 2965554816*r + 2498407296*r^2 + 928628736*r^3 + 128854656*r^4 + 3717479808*c + 6217469888*c*r + 3438477504*c*r^2 + 630680064*c*r^3 + 3863413120*c^2 + 4237662912*c^2*r + 1155575232*c^2*r^2 + 1738179072*c^3 + 939336832*c^3*r + 285797120*c^4

def backChartP1_0_3M94 (c r : ℤ) : ℤ :=
 384666240 + 878964576*r + 744841104*r^2 + 278099136*r^3 + 38703504*r^4 + 1115975168*c + 1880606784*c*r + 1046594304*c*r^2 + 192873408*c*r^3 + 1185986816*c^2 + 1311452352*c^2*r + 359948736*c^2*r^2 + 547144192*c^3 + 298136832*c^3*r + 92466304*c^4

def backChartP1_0_4M94 (c r : ℤ) : ℤ :=
 69350400 + 159183360*r + 135401280*r^2 + 50675520*r^3 + 7056000*r^4 + 204637440*c + 346727360*c*r + 193777920*c*r^2 + 35797440*c*r^3 + 221831680*c^2 + 246805440*c^2*r + 68040000*c^2*r^2 + 104697600*c^3 + 57420160*c^3*r + 18152960*c^4

def backChartP1_0_5M94 (c r : ℤ) : ℤ :=
 7674240 + 17644704*r + 15021216*r^2 + 5618592*r^3 + 780192*r^4 + 22961792*c + 38998848*c*r + 21821184*c*r^2 + 4027968*c*r^3 + 25303040*c^2 + 28236096*c^2*r + 7793856*c^2*r^2 + 12173056*c^3 + 6698496*c^3*r + 2157568*c^4

def backChartP1_0_6M94 (c r : ℤ) : ℤ :=
 483840 + 1110144*r + 942144*r^2 + 350784*r^3 + 48384*r^4 + 1462272*c + 2479232*c*r + 1382976*c*r^2 + 254016*c*r^3 + 1630720*c^2 + 1817088*c^2*r + 499968*c^2*r^2 + 795648*c^3 + 437248*c^3*r + 143360*c^4

def backChartP1_0_7M94 (c r : ℤ) : ℤ :=
 13440 + 30624*r + 25776*r^2 + 9504*r^3 + 1296*r^4 + 40832*c + 68736*c*r + 38016*c*r^2 + 6912*c*r^3 + 45824*c^2 + 50688*c^2*r + 13824*c^2*r^2 + 22528*c^3 + 12288*c^3*r + 4096*c^4

def backChartP1_1_0M94 (c r : ℤ) : ℤ :=
 573743520 + 1261925280*r + 1033562880*r^2 + 375056640*r^3 + 50964480*r^4 + 1510064640*c + 2441779200*c*r + 1312174080*c*r^2 + 234823680*c*r^3 + 1437972480*c^2 + 1525547520*c^2*r + 404490240*c^2*r^2 + 589317120*c^3 + 308689920*c^3*r + 88058880*c^4

def backChartP1_1_1M94 (c r : ℤ) : ℤ :=
 809192160 + 1801923936*r + 1492110912*r^2 + 546656448*r^3 + 74939136*r^4 + 2192327808*c + 3589790208*c*r + 1949700096*c*r^2 + 352190976*c*r^3 + 2153911296*c^2 + 2311599744*c^2*r + 618882048*c^2*r^2 + 910942464*c^3 + 481876224*c^3*r + 140257536*c^4

def backChartP1_1_2M94 (c r : ℤ) : ℤ :=
 498785280 + 1123323264*r + 939670368*r^2 + 347260704*r^3 + 47976768*r^4 + 1388837632*c + 2301770240*c*r + 1263096576*c*r^2 + 230229888*c*r^3 + 1406910848*c^2 + 1527969408*c^2*r + 413239680*c^2*r^2 + 614663168*c^3 + 328763008*c^3*r + 97804672*c^4

def backChartP1_1_3M94 (c r : ℤ) : ℤ :=
 174800640 + 397547136*r + 335507424*r^2 + 124899936*r^3 + 17359104*r^4 + 499227008*c + 836506944*c*r + 463365504*c*r^2 + 85124928*c*r^3 + 520679936*c^2 + 572023872*c^2*r + 156211776*c^2*r^2 + 234959872*c^3 + 127126272*c^3*r + 38706304*c^4

def backChartP1_1_4M94 (c r : ℤ) : ℤ :=
 37766400 + 86540160*r + 73525200*r^2 + 27511680*r^3 + 3835440*r^4 + 110333440*c + 186515840*c*r + 104086080*c*r^2 + 19225920*c*r^3 + 118173440*c^2 + 131107200*c^2*r + 36086400*c^2*r^2 + 54978560*c^3 + 30056320*c^3*r + 9372160*c^4

def backChartP1_1_5M94 (c r : ℤ) : ℤ :=
 5053440 + 11626944*r + 9909648*r^2 + 3713472*r^3 + 517104*r^4 + 15045632*c + 25566912*c*r + 14321664*c*r^2 + 2649024*c*r^3 + 16481024*c^2 + 18398016*c^2*r + 5084352*c^2*r^2 + 7872256*c^3 + 4333056*c^3*r + 1383424*c^4

def backChartP1_1_6M94 (c r : ℤ) : ℤ :=
 389760 + 895776*r + 761712*r^2 + 284256*r^3 + 39312*r^4 + 1176448*c + 1998080*c*r + 1116864*c*r^2 + 205632*c*r^3 + 1309952*c^2 + 1462272*c^2*r + 403200*c^2*r^2 + 637952*c^3 + 351232*c^3*r + 114688*c^4

def backChartP1_1_7M94 (c r : ℤ) : ℤ :=
 13440 + 30624*r + 25776*r^2 + 9504*r^3 + 1296*r^4 + 40832*c + 68736*c*r + 38016*c*r^2 + 6912*c*r^3 + 45824*c^2 + 50688*c^2*r + 13824*c^2*r^2 + 22528*c^3 + 12288*c^3*r + 4096*c^4

def backChartP1_2_0M94 (c r : ℤ) : ℤ :=
 121625280 + 261555840*r + 209966400*r^2 + 74833920*r^3 + 9999360*r^4 + 303770880*c + 480130560*c*r + 253048320*c*r^2 + 44513280*c*r^3 + 273248640*c^2 + 284014080*c^2*r + 74027520*c^2*r^2 + 105799680*c^3 + 54512640*c^3*r + 14999040*c^4

def backChartP1_2_1M94 (c r : ℤ) : ℤ :=
 207980640 + 454732608*r + 370350048*r^2 + 133716480*r^3 + 18079872*r^4 + 539455104*c + 866034432*c*r + 462432384*c*r^2 + 82262016*c*r^3 + 504301824*c^2 + 530875008*c^2*r + 139791744*c^2*r^2 + 202272768*c^3 + 105147648*c^3*r + 29536128*c^4

def backChartP1_2_2M94 (c r : ℤ) : ℤ :=
 156011520 + 346446912*r + 286087200*r^2 + 104560512*r^3 + 14303520*r^4 + 419490176*c + 684203072*c*r + 370254528*c*r^2 + 66659712*c*r^3 + 407788416*c^2 + 435430464*c^2*r + 116036928*c^2*r^2 + 170028544*c^3 + 89401984*c^3*r + 25718784*c^4

def backChartP1_2_3M94 (c r : ℤ) : ℤ :=
 66944640 + 150812256*r + 126171024*r^2 + 46635456*r^3 + 6447504*r^4 + 186249728*c + 308556864*c*r + 169231104*c*r^2 + 30840768*c*r^3 + 188201216*c^2 + 204103872*c^2*r + 55129536*c^2*r^2 + 81797632*c^3 + 43636992*c^3*r + 12901504*c^4

def backChartP1_2_4M94 (c r : ℤ) : ℤ :=
 17875200 + 40770240*r + 34500480*r^2 + 12875520*r^3 + 1794240*r^4 + 51322880*c + 86246720*c*r + 47900160*c*r^2 + 8823360*c*r^3 + 53813760*c^2 + 59277120*c^2*r + 16228800*c^2*r^2 + 24398080*c^3 + 13229440*c^3*r + 4032000*c^4

def backChartP1_2_5M94 (c r : ℤ) : ℤ :=
 2997120 + 6895392*r + 5880672*r^2 + 2207520*r^3 + 308448*r^4 + 8844416*c + 15021888*c*r + 8418816*c*r^2 + 1560384*c*r^3 + 9583616*c^2 + 10688832*c^2*r + 2955456*c^2*r^2 + 4517632*c^3 + 2483712*c^3*r + 781312*c^4

def backChartP1_2_6M94 (c r : ℤ) : ℤ :=
 295680 + 681408*r + 581280*r^2 + 217728*r^3 + 30240*r^4 + 890624*c + 1516928*c*r + 850752*c*r^2 + 157248*c*r^3 + 989184*c^2 + 1107456*c^2*r + 306432*c^2*r^2 + 480256*c^3 + 265216*c^3*r + 86016*c^4

def backChartP1_2_7M94 (c r : ℤ) : ℤ :=
 13440 + 30624*r + 25776*r^2 + 9504*r^3 + 1296*r^4 + 40832*c + 68736*c*r + 38016*c*r^2 + 6912*c*r^3 + 45824*c^2 + 50688*c^2*r + 13824*c^2*r^2 + 22528*c^3 + 12288*c^3*r + 4096*c^4

def backChartG1_0M94 (c r : ℤ) : ℤ :=
 73799596973491200 + 329172348960000000*r + 639977720802739200*r^2 + 708827834102169600*r^3 + 489467390611046400*r^4 + 215892108214272000*r^5 + 59425219974758400*r^6 + 9336161776435200*r^7 + 641177026560000*r^8 + 399600101479219200*c + 1545469995460608000*c*r + 2553453316502323200*c*r^2 + 2337748055141990400*c*r^3 + 1281521313076838400*c*r^4 + 420834538517299200*c*r^5 + 76683029623603200*c*r^6 + 5983105056768000*c*r^7 + 932073357616128000*c^2 + 3062843979400396800*c^2*r + 4182287272082841600*c^2*r^2 + 3039265544491008000*c^2*r^3 + 1240281109109145600*c^2*r^4 + 269600633487360000*c^2*r^5 + 24395550326784000*c^2*r^6 + 1223265854258380800*c^3 + 3321601917574348800*c^3*r + 3599686379829657600*c^3*r^2 + 1947139646983372800*c^3*r^3 + 525930567244185600*c^3*r^4 + 56768227246080000*c^3*r^5 + 988101431009280000*c^4 + 2129134679897702400*c^4*r + 1717339054852915200*c^4*r^2 + 614803425597849600*c^4*r^3 + 82455625728000000*c^4*r^4 + 503110146967142400*c^5 + 806794678222848000*c^5*r + 430660621968998400*c^5*r^2 + 76550294274048000*c^5*r^3 + 157724017894195200*c^6 + 167375491153920000*c^6*r + 44358460489728000*c^6*r^2 + 27841493178777600*c^7 + 14668387614720000*c^7*r + 2119200620544000*c^8

theorem backChartG1_0M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_0M94 c r := by
 unfold backChartG1_0M94
 positivity

def backChartG1_1M94 (c r : ℤ) : ℤ :=
 186560333645414400 + 837196608311562240*r + 1637198651879884800*r^2 + 1823421873610874880*r^3 + 1265769688644679680*r^4 + 561098032457195520*r^5 + 155187270758338560*r^6 + 24495602679152640*r^7 + 1690187356569600*r^8 + 1024980461410590720*c + 3989581751555850240*c*r + 6631910305085399040*c*r^2 + 6106805493263032320*c*r^3 + 3366043312474644480*c*r^4 + 1111165526175989760*c*r^5 + 203504081496145920*c*r^6 + 15958374727680000*c*r^7 + 2428289714682961920*c^2 + 8032497863594803200*c^2*r + 11037303771630796800*c^2*r^2 + 8068590193039810560*c^2*r^3 + 3311374715744256000*c^2*r^4 + 723740287256985600*c^2*r^5 + 65842554168115200*c^2*r^6 + 3239763692820480000*c^3 + 8856815701414625280*c^3*r + 9659901394978652160*c^3*r^2 + 5257087711778488320*c^3*r^3 + 1428276647267205120*c^3*r^4 + 155047425387724800*c^3*r^5 + 2662326945073152000*c^4 + 5776098943968460800*c^4*r + 4689251443078594560*c^4*r^2 + 1689182536918302720*c^4*r^3 + 227914612531200000*c^4*r^4 + 1379948908461096960*c^5 + 2228176214423470080*c^5*r + 1197198944933806080*c^5*r^2 + 214151569293312000*c^5*r^3 + 440619022825390080*c^6 + 470813093976637440*c^6*r + 125604077005209600*c^6*r^2 + 79251873269022720*c^7 + 42042981231820800*c^7*r + 6148919734272000*c^8

theorem backChartG1_1M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_1M94 c r := by
 unfold backChartG1_1M94
 positivity

def backChartG1_2M94 (c r : ℤ) : ℤ :=
 218643197410713600 + 986823615005706240*r + 1940508680421362688*r^2 + 2172643365886930944*r^3 + 1515714406148404224*r^4 + 675054196268949504*r^5 + 187534708864505856*r^6 + 29726970466959360*r^7 + 2059576444477440*r^8 + 1218239074467717120*c + 4770761264289312768*c*r + 7976741682705223680*c*r^2 + 7385801910646247424*c*r^3 + 4092320112407654400*c*r^4 + 1357611465939369984*c*r^5 + 249814664139350016*c*r^6 + 19679416431575040*c*r^7 + 2929932415689818112*c^2 + 9753794988719910912*c^2*r + 13483946712806793216*c^2*r^2 + 9913921571645263872*c^2*r^3 + 4090928732826034176*c^2*r^4 + 898778945802608640*c^2*r^5 + 82177152957849600*c^2*r^6 + 3972137079768367104*c^3 + 10930822356967833600*c^3*r + 11996853029555724288*c^3*r^2 + 6567833397997412352*c^3*r^3 + 1794533478351667200*c^3*r^4 + 195871375827025920*c^3*r^5 + 3319783098997800960*c^4 + 7251468651543158784*c^4*r + 5925036144073826304*c^4*r^2 + 2147481103772712960*c^4*r^3 + 291462387664896000*c^4*r^4 + 1751466837299429376*c^5 + 2847709127501070336*c^5*r + 1540202418542592000*c^5*r^2 + 277254343690813440*c^5*r^3 + 569661320424849408*c^6 + 613005863879098368*c^6*r + 164646065708974080*c^6*r^2 + 104442426379468800*c^7 + 55805431485726720*c^7*r + 8265385391800320*c^8

theorem backChartG1_2M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_2M94 c r := by
 unfold backChartG1_2M94
 positivity

def backChartG1_3M94 (c r : ℤ) : ℤ :=
 157161925870387200 + 713070054657515520*r + 1409319113477603328*r^2 + 1585540778477580288*r^3 + 1111162764470814720*r^4 + 496977507898454016*r^5 + 138606020320997376*r^6 + 22050726259580928*r^7 + 1532859920492544*r^8 + 887473738411868160*c + 3495004985962979328*c*r + 5875178385944641536*c*r^2 + 5467727052036243456*c*r^3 + 3044102572010078208*c*r^4 + 1014399638520791040*c*r^5 + 187439888373276672*c*r^6 + 14823210506452992*c*r^7 + 2165366654558994432*c^2 + 7251444973648404480*c^2*r + 10081490061106028544*c^2*r^2 + 7452063364909449216*c^2*r^3 + 3090565604617666560*c^2*r^4 + 682208680520392704*c^2*r^5 + 62651872577839104*c^2*r^6 + 2981128811055316992*c^3 + 8254865590813212672*c^3*r + 9113616083531538432*c^3*r^2 + 5017310518023659520*c^3*r^3 + 1378115116700958720*c^3*r^4 + 151166341541117952*c^3*r^5 + 2532611740102950912*c^4 + 5567930959321350144*c^4*r + 4577454347530444800*c^4*r^2 + 1668718554667745280*c^4*r^3 + 227728271825510400*c^4*r^4 + 1359463708700246016*c^5 + 2225180348931391488*c^5*r + 1211162773397520384*c^5*r^2 + 219337622705897472*c^5*r^3 + 450273453322076160*c^6 + 487879319809867776*c^6*r + 131897760603979776*c^6*r^2 + 84139681653522432*c^7 + 45275754635231232*c^7*r + 6792165966544896*c^8

theorem backChartG1_3M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_3M94 c r := by
 unfold backChartG1_3M94
 positivity

def backChartG1_4M94 (c r : ℤ) : ℤ :=
 77199173246361600 + 351880201846978560*r + 698549954723131392*r^2 + 789207578461725696*r^3 + 555256361578576896*r^4 + 249236620430257152*r^5 + 69736331003867136*r^6 + 11125862030094336*r^7 + 775302898793472*r^8 + 441450025994772480*c + 1747140887838216192*c*r + 2950959546228363264*c*r^2 + 2758631576737462272*c*r^3 + 1542243837740820480*c*r^4 + 515888929689090048*c*r^5 + 95652686460635136*c*r^6 + 7587373408247808*c*r^7 + 1091810606768078848*c^2 + 3675710464249270272*c^2*r + 5136067346536648704*c^2*r^2 + 3814506672775464960*c^2*r^3 + 1588932412709160960*c^2*r^4 + 352149677903407104*c^2*r^5 + 32457422743087104*c^2*r^6 + 1525174315578540032*c^3 + 4247021631629672448*c^3*r + 4713801541833646080*c^3*r^2 + 2608014893296619520*c^3*r^3 + 719650931108659200*c^3*r^4 + 79271519140122624*c^3*r^5 + 1316019328890699776*c^4 + 2910348633657507840*c^4*r + 2405952964389273600*c^4*r^2 + 881654032801382400*c^4*r^3 + 120896345746391040*c^4*r^4 + 718195304266366976*c^5 + 1182785139217317888*c^5*r + 647514679782555648*c^5*r^2 + 117895233141374976*c^5*r^3 + 242074561511358464*c^6 + 263964626320539648*c^6*r + 71789483393531904*c^6*r^2 + 46076081071849472*c^7 + 24956483810721792*c^7*r + 3792056495030272*c^8

theorem backChartG1_4M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_4M94 c r := by
 unfold backChartG1_4M94
 positivity

def backChartG1_5M94 (c r : ℤ) : ℤ :=
 27307569158553600 + 124942896786677760*r + 248937776720640000*r^2 + 282203751399413760*r^3 + 199167029855700480*r^4 + 89647206278676480*r^5 + 25142591675980800*r^6 + 4018960248145920*r^7 + 280454660236800*r^8 + 157980486888161280*c + 627834798494023680*c*r + 1064602590192046080*c*r^2 + 998866907472107520*c*r^3 + 560290285070530560*c*r^4 + 187972617645066240*c*r^5 + 34940060054968320*c*r^6 + 2777119656837120*c*r^7 + 395666190069104640*c^2 + 1338015797540782080*c^2*r + 1877500904662978560*c^2*r^2 + 1399848968833136640*c^2*r^3 + 585167862371420160*c^2*r^4 + 130091993994332160*c^2*r^5 + 12022095083120640*c^2*r^6 + 560246613994045440*c^3 + 1567530995803422720*c^3*r + 1747614401940234240*c^3*r^2 + 970894513528934400*c^3*r^3 + 268901486978826240*c^3*r^4 + 29716525627084800*c^3*r^5 + 490483136969441280*c^4 + 1090186512631480320*c^4*r + 905497782990151680*c^4*r^2 + 333249611563008000*c^4*r^3 + 45873413268480000*c^4*r^4 + 271851030748200960*c^5 + 450087362559098880*c^5*r + 247613417476669440*c^5*r^2 + 45286002103910400*c^5*r^3 + 93150316129812480*c^6 + 102135610899087360*c^6*r + 27919117686620160*c^6*r^2 + 18041328749445120*c^7 + 9827680022200320*c^7*r + 1512248052940800*c^8

theorem backChartG1_5M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_5M94 c r := by
 unfold backChartG1_5M94
 positivity

def backChartG1_6M94 (c r : ℤ) : ℤ :=
 7133375486361600 + 32731089792307200*r + 65388771198987264*r^2 + 74308306419551232*r^3 + 52556255508379392*r^4 + 23698324555057152*r^5 + 6655456834887168*r^6 + 1064763338849280*r^7 + 74324051746560*r^8 + 41706986418585600*c + 166272977944141824*c*r + 282776823265628160*c*r^2 + 266025878550577152*c*r^3 + 149568511614197760*c*r^4 + 50275286234836992*c*r^5 + 9358583451291648*c*r^6 + 744513758392320*c*r^7 + 105658810222493696*c^2 + 358541024636583936*c^2*r + 504717277896695808*c^2*r^2 + 377397907245305856*c^2*r^3 + 158153857518440448*c^2*r^4 + 35231662439608320*c^2*r^5 + 3260769324503040*c^2*r^6 + 151467271915896832*c^3 + 425382315779850240*c^3*r + 475884132446306304*c^3*r^2 + 265191091406954496*c^3*r^3 + 73641341083484160*c^3*r^4 + 8155501206773760*c^3*r^5 + 134377719768678400*c^4 + 299875423082790912*c^4*r + 249983319102676992*c^4*r^2 + 92298510850129920*c^4*r^3 + 12740246313984000*c^4*r^4 + 75544661683929088*c^5 + 125605141550235648*c^5*r + 69366090371235840*c^5*r^2 + 12729073421352960*c^5*r^3 + 26280469673672704*c^6 + 28943461600886784*c^6*r + 7943334019891200*c^6*r^2 + 5172435061964800*c^7 + 2830564569907200*c^7*r + 440979929169920*c^8

theorem backChartG1_6M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_6M94 c r := by
 unfold backChartG1_6M94
 positivity

def backChartG1_7M94 (c r : ℤ) : ℤ :=
 1386451029196800 + 6373135897067520*r + 12752567021666304*r^2 + 14511958454697984*r^3 + 10274771204167680*r^4 + 4636181848854528*r^5 + 1302332830138368*r^6 + 208292741443584*r^7 + 14526843512832*r^8 + 8183126806364160*c + 32691026847596544*c*r + 55699311910330368*c*r^2 + 52481212946362368*c*r^3 + 29541998671847424*c*r^4 + 9937792252846080*c*r^5 + 1850404496080896*c*r^6 + 147165114249216*c*r^7 + 20943945373188096*c^2 + 71235864086446080*c^2*r + 100484671685271552*c^2*r^2 + 75265914224406528*c^2*r^3 + 31582847310336000*c^2*r^4 + 7041617302228992*c^2*r^5 + 651916070572032*c^2*r^6 + 30357765146935296*c^3 + 85475784186003456*c^3*r + 95839034371670016*c^3*r^2 + 53507213763010560*c^3*r^3 + 14879615375278080*c^3*r^4 + 1649345093738496*c^3*r^5 + 27254877994745856*c^4 + 60991398469435392*c^4*r + 50967467638456320*c^4*r^2 + 18855769194823680*c^4*r^3 + 2606623668633600*c^4*r^4 + 15518979618766848*c^5 + 25880085516386304*c^5*r + 14329331407060992*c^5*r^2 + 2635043762405376*c^5*r^3 + 5472884458782720*c^6 + 6046565112741888*c^6*r + 1663932793356288*c^6*r^2 + 1092909133725696*c^7 + 600067015704576*c^7*r + 94621849878528*c^8

theorem backChartG1_7M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_7M94 c r := by
 unfold backChartG1_7M94
 positivity

def backChartG1_8M94 (c r : ℤ) : ℤ :=
 198957794918400 + 915189088665600*r + 1832159706402816*r^2 + 2085371098288128*r^3 + 1476316252147968*r^4 + 665808053492736*r^5 + 186850867972608*r^6 + 29840470668288*r^7 + 2076846863616*r^8 + 1184039055360000*c + 4734397134544896*c*r + 8071763337695232*c*r^2 + 7608038214260736*c*r^3 + 4282523382896640*c*r^4 + 1439969987119104*c*r^5 + 267865815103488*c*r^6 + 21271391576064*c*r^7 + 3057707105746944*c^2 + 10411476351123456*c^2*r + 14698294828019712*c^2*r^2 + 11014612086159360*c^2*r^3 + 4622190392494080*c^2*r^4 + 1030119343368192*c^2*r^5 + 95277107423232*c^2*r^6 + 4475205017665536*c^3 + 12616708357177344*c^3*r + 14160051314196480*c^3*r^2 + 7910161924976640*c^3*r^3 + 2199974046842880*c^3*r^4 + 243760305180672*c^3*r^5 + 4059956453081088*c^4 + 9098795588198400*c^4*r + 7611791812853760*c^4*r^2 + 2817914862551040*c^4*r^3 + 389613305733120*c^4*r^4 + 2337833963716608*c^5 + 3905040685400064*c^5*r + 2164786938445824*c^5*r^2 + 398379853283328*c^5*r^3 + 834426809352192*c^6 + 923532685737984*c^6*r + 254477953400832*c^6*r^2 + 168784057860096*c^7 + 92847536603136*c^7*r + 14813931503616*c^8

theorem backChartG1_8M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_8M94 c r := by
 unfold backChartG1_8M94
 positivity

def backChartG1_9M94 (c r : ℤ) : ℤ :=
 20554297344000 + 94504738406400*r + 189060096153600*r^2 + 214974152386560*r^3 + 151984500272640*r^4 + 68424749568000*r^5 + 19160473328640*r^6 + 3051693066240*r^7 + 211696934400*r^8 + 123191083008000*c + 492424309063680*c*r + 839045984071680*c*r^2 + 790117381724160*c*r^3 + 444176779253760*c*r^4 + 149093138073600*c*r^5 + 27672921077760*c*r^6 + 2191423610880*c*r^7 + 320581016125440*c^2 + 1091379361873920*c^2*r + 1539995482583040*c^2*r^2 + 1153067664537600*c^2*r^3 + 483265486448640*c^2*r^4 + 107515613399040*c^2*r^5 + 9921702389760*c^2*r^6 + 473101879541760*c^3 + 1333728175718400*c^3*r + 1496298269491200*c^3*r^2 + 835215364730880*c^3*r^3 + 232002358640640*c^3*r^4 + 25661112422400*c^3*r^5 + 433059243294720*c^4 + 970608421601280*c^4*r + 811740807413760*c^4*r^2 + 300288675348480*c^4*r^3 + 41467668480000*c^4*r^4 + 251779539271680*c^5 + 420645716951040*c^5*r + 233135674490880*c^5*r^2 + 42873195724800*c^5*r^3 + 90799508029440*c^6 + 100525316505600*c^6*r + 27695005040640*c^6*r^2 + 18570868162560*c^7 + 10219636654080*c^7*r + 1649305190400*c^8

theorem backChartG1_9M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_9M94 c r := by
 unfold backChartG1_9M94
 positivity

def backChartG1_10M94 (c r : ℤ) : ℤ :=
 1451029708800 + 6660546600960*r + 13298915202048*r^2 + 15087710260224*r^3 + 10638978787584*r^4 + 4775308038144*r^5 + 1332558936576*r^6 + 211396469760*r^7 + 14598662400*r^8 + 8747782471680*c + 34911798878208*c*r + 59374533980160*c*r^2 + 55787568205824*c*r^3 + 31279779901440*c*r^4 + 10467391463424*c*r^5 + 1935974670336*c*r^6 + 152688291840*c*r^7 + 22909439393792*c^2 + 77874927255552*c^2*r + 109684006526976*c^2*r^2 + 81944178204672*c^2*r^3 + 34253591371776*c^2*r^4 + 7597069885440*c^2*r^5 + 698541096960*c^2*r^6 + 34041970622464*c^3 + 95830267330560*c^3*r + 107318214033408*c^3*r^2 + 59772025700352*c^3*r^3 + 16559218851840*c^3*r^4 + 1825803141120*c^3*r^5 + 31392672317440*c^4 + 70263282991104*c^4*r + 58659242901504*c^4*r^2 + 21652250296320*c^4*r^3 + 2982002688000*c^4*r^4 + 18398050779136*c^5 + 30697026748416*c^5*r + 16983769743360*c^5*r^2 + 3116394086400*c^5*r^3 + 6692156735488*c^6 + 7399589019648*c^6*r + 2035097272320*c^6*r^2 + 1381394022400*c^7 + 759252910080*c^7*r + 123899740160*c^8

theorem backChartG1_10M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_10M94 c r := by
 unfold backChartG1_10M94
 positivity

def backChartG1_11M94 (c r : ℤ) : ℤ :=
 62860492800 + 287702876160*r + 572593287168*r^2 + 647290441728*r^3 + 454630579200*r^4 + 203173318656*r^5 + 56424646656*r^6 + 8904204288*r^7 + 611380224*r^8 + 380713697280*c + 1514983292928*c*r + 2568184528896*c*r^2 + 2404339531776*c*r^3 + 1342711738368*c*r^4 + 447335239680*c*r^5 + 82332536832*c*r^6 + 6458683392*c*r^7 + 1002034102272*c^2 + 3396276387840*c^2*r + 4767965282304*c^2*r^2 + 3549159161856*c^2*r^3 + 1477577687040*c^2*r^4 + 326236667904*c^2*r^5 + 29847896064*c^2*r^6 + 1497025216512*c^3 + 4202001334272*c^3*r + 4690338250752*c^3*r^2 + 2602734059520*c^3*r^3 + 718095974400*c^3*r^4 + 78814052352*c^3*r^5 + 1388603768832*c^4 + 3098976190464*c^4*r + 2578663342080*c^4*r^2 + 948295434240*c^4*r^3 + 130056192000*c^4*r^4 + 818949390336*c^5 + 1362449399808*c^5*r + 751303655424*c^5*r^2 + 137339338752*c^5*r^3 + 299913707520*c^6 + 330653761536*c^6*r + 90634715136*c^6*r^2 + 62360911872*c^7 + 34175188992*c^7*r + 5637144576*c^8

theorem backChartG1_11M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_11M94 c r := by
 unfold backChartG1_11M94
 positivity

def backChartG1_12M94 (c r : ℤ) : ℤ :=
 1264435200 + 5762211840*r + 11414817792*r^2 + 12839371776*r^3 + 8969377536*r^4 + 3985293312*r^5 + 1099961856*r^6 + 172440576*r^7 + 11757312*r^8 + 7682949120*c + 30439514112*c*r + 51357487104*c*r^2 + 47836680192*c*r^3 + 26568622080*c*r^4 + 8799694848*c*r^5 + 1609445376*c*r^6 + 125411328*c*r^7 + 20293009408*c^2 + 68476649472*c^2*r + 95673360384*c^2*r^2 + 70849658880*c^2*r^3 + 29332316160*c^2*r^4 + 6437781504*c^2*r^5 + 585252864*c^2*r^6 + 30434066432*c^3 + 85042987008*c^3*r + 94466211840*c^3*r^2 + 52146339840*c^3*r^3 + 14306181120*c^3*r^4 + 1560674304*c^3*r^5 + 28347662336*c^4 + 62977474560*c^4*r + 52146339840*c^4*r^2 + 19074908160*c^4*r^3 + 2601123840*c^4*r^4 + 16793993216*c^5 + 27811381248*c^5*r + 15259926528*c^5*r^2 + 2774532096*c^5*r^3 + 6180306944*c^6 + 6782189568*c^6*r + 1849688064*c^6*r^2 + 1291845632*c^7 + 704643072*c^7*r + 117440512*c^8

theorem backChartG1_12M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_12M94 c r := by
 unfold backChartG1_12M94
 positivity

def backChartG1_13M94 (c r : ℤ) : ℤ :=
 0

theorem backChartG1_13M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_13M94 c r := by
 unfold backChartG1_13M94
 positivity

def backChartG1_14M94 (c r : ℤ) : ℤ :=
 0

theorem backChartG1_14M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG1_14M94 c r := by
 unfold backChartG1_14M94
 positivity

theorem back_stage1_0M94 (c r e : ℤ) :
 backShape1M94 (7 + 3*r + 4*c) (2 + 1*r + 1*c) (e-0)=backChartP1_0_0M94 c r*e^0 + backChartP1_0_1M94 c r*e^1 + backChartP1_0_2M94 c r*e^2 + backChartP1_0_3M94 c r*e^3 + backChartP1_0_4M94 c r*e^4 + backChartP1_0_5M94 c r*e^5 + backChartP1_0_6M94 c r*e^6 + backChartP1_0_7M94 c r*e^7 := by
 unfold backShape1M94 backChartP1_0_0M94 backChartP1_0_1M94 backChartP1_0_2M94 backChartP1_0_3M94 backChartP1_0_4M94 backChartP1_0_5M94 backChartP1_0_6M94 backChartP1_0_7M94
 ring

theorem back_stage1_1M94 (c r e : ℤ) :
 backShape1M94 (7 + 3*r + 4*c) (2 + 1*r + 1*c) (e-1)=backChartP1_1_0M94 c r*e^0 + backChartP1_1_1M94 c r*e^1 + backChartP1_1_2M94 c r*e^2 + backChartP1_1_3M94 c r*e^3 + backChartP1_1_4M94 c r*e^4 + backChartP1_1_5M94 c r*e^5 + backChartP1_1_6M94 c r*e^6 + backChartP1_1_7M94 c r*e^7 := by
 unfold backShape1M94 backChartP1_1_0M94 backChartP1_1_1M94 backChartP1_1_2M94 backChartP1_1_3M94 backChartP1_1_4M94 backChartP1_1_5M94 backChartP1_1_6M94 backChartP1_1_7M94
 ring

theorem back_stage1_2M94 (c r e : ℤ) :
 backShape1M94 (7 + 3*r + 4*c) (2 + 1*r + 1*c) (e-2)=backChartP1_2_0M94 c r*e^0 + backChartP1_2_1M94 c r*e^1 + backChartP1_2_2M94 c r*e^2 + backChartP1_2_3M94 c r*e^3 + backChartP1_2_4M94 c r*e^4 + backChartP1_2_5M94 c r*e^5 + backChartP1_2_6M94 c r*e^6 + backChartP1_2_7M94 c r*e^7 := by
 unfold backShape1M94 backChartP1_2_0M94 backChartP1_2_1M94 backChartP1_2_2M94 backChartP1_2_3M94 backChartP1_2_4M94 backChartP1_2_5M94 backChartP1_2_6M94 backChartP1_2_7M94
 ring

theorem back_column1_0M94 (c r : ℤ) :
 (backChartP1_1_0M94 c r*backChartP1_1_0M94 c r)-(backChartP1_0_0M94 c r*backChartP1_2_0M94 c r)=backChartG1_0M94 c r := by
 unfold backChartG1_0M94 backChartP1_0_0M94 backChartP1_1_0M94 backChartP1_2_0M94
 ring

theorem back_column1_1M94 (c r : ℤ) :
 (backChartP1_1_0M94 c r*backChartP1_1_1M94 c r + backChartP1_1_1M94 c r*backChartP1_1_0M94 c r)-(backChartP1_0_0M94 c r*backChartP1_2_1M94 c r + backChartP1_0_1M94 c r*backChartP1_2_0M94 c r)=backChartG1_1M94 c r := by
 unfold backChartG1_1M94 backChartP1_0_0M94 backChartP1_0_1M94 backChartP1_1_0M94 backChartP1_1_1M94 backChartP1_2_0M94 backChartP1_2_1M94
 ring

theorem back_column1_2M94 (c r : ℤ) :
 (backChartP1_1_0M94 c r*backChartP1_1_2M94 c r + backChartP1_1_1M94 c r*backChartP1_1_1M94 c r + backChartP1_1_2M94 c r*backChartP1_1_0M94 c r)-(backChartP1_0_0M94 c r*backChartP1_2_2M94 c r + backChartP1_0_1M94 c r*backChartP1_2_1M94 c r + backChartP1_0_2M94 c r*backChartP1_2_0M94 c r)=backChartG1_2M94 c r := by
 unfold backChartG1_2M94 backChartP1_0_0M94 backChartP1_0_1M94 backChartP1_0_2M94 backChartP1_1_0M94 backChartP1_1_1M94 backChartP1_1_2M94 backChartP1_2_0M94 backChartP1_2_1M94 backChartP1_2_2M94
 ring

theorem back_column1_3M94 (c r : ℤ) :
 (backChartP1_1_0M94 c r*backChartP1_1_3M94 c r + backChartP1_1_1M94 c r*backChartP1_1_2M94 c r + backChartP1_1_2M94 c r*backChartP1_1_1M94 c r + backChartP1_1_3M94 c r*backChartP1_1_0M94 c r)-(backChartP1_0_0M94 c r*backChartP1_2_3M94 c r + backChartP1_0_1M94 c r*backChartP1_2_2M94 c r + backChartP1_0_2M94 c r*backChartP1_2_1M94 c r + backChartP1_0_3M94 c r*backChartP1_2_0M94 c r)=backChartG1_3M94 c r := by
 unfold backChartG1_3M94 backChartP1_0_0M94 backChartP1_0_1M94 backChartP1_0_2M94 backChartP1_0_3M94 backChartP1_1_0M94 backChartP1_1_1M94 backChartP1_1_2M94 backChartP1_1_3M94 backChartP1_2_0M94 backChartP1_2_1M94 backChartP1_2_2M94 backChartP1_2_3M94
 ring

theorem back_column1_4M94 (c r : ℤ) :
 (backChartP1_1_0M94 c r*backChartP1_1_4M94 c r + backChartP1_1_1M94 c r*backChartP1_1_3M94 c r + backChartP1_1_2M94 c r*backChartP1_1_2M94 c r + backChartP1_1_3M94 c r*backChartP1_1_1M94 c r + backChartP1_1_4M94 c r*backChartP1_1_0M94 c r)-(backChartP1_0_0M94 c r*backChartP1_2_4M94 c r + backChartP1_0_1M94 c r*backChartP1_2_3M94 c r + backChartP1_0_2M94 c r*backChartP1_2_2M94 c r + backChartP1_0_3M94 c r*backChartP1_2_1M94 c r + backChartP1_0_4M94 c r*backChartP1_2_0M94 c r)=backChartG1_4M94 c r := by
 unfold backChartG1_4M94 backChartP1_0_0M94 backChartP1_0_1M94 backChartP1_0_2M94 backChartP1_0_3M94 backChartP1_0_4M94 backChartP1_1_0M94 backChartP1_1_1M94 backChartP1_1_2M94 backChartP1_1_3M94 backChartP1_1_4M94 backChartP1_2_0M94 backChartP1_2_1M94 backChartP1_2_2M94 backChartP1_2_3M94 backChartP1_2_4M94
 ring

theorem back_column1_5M94 (c r : ℤ) :
 (backChartP1_1_0M94 c r*backChartP1_1_5M94 c r + backChartP1_1_1M94 c r*backChartP1_1_4M94 c r + backChartP1_1_2M94 c r*backChartP1_1_3M94 c r + backChartP1_1_3M94 c r*backChartP1_1_2M94 c r + backChartP1_1_4M94 c r*backChartP1_1_1M94 c r + backChartP1_1_5M94 c r*backChartP1_1_0M94 c r)-(backChartP1_0_0M94 c r*backChartP1_2_5M94 c r + backChartP1_0_1M94 c r*backChartP1_2_4M94 c r + backChartP1_0_2M94 c r*backChartP1_2_3M94 c r + backChartP1_0_3M94 c r*backChartP1_2_2M94 c r + backChartP1_0_4M94 c r*backChartP1_2_1M94 c r + backChartP1_0_5M94 c r*backChartP1_2_0M94 c r)=backChartG1_5M94 c r := by
 unfold backChartG1_5M94 backChartP1_0_0M94 backChartP1_0_1M94 backChartP1_0_2M94 backChartP1_0_3M94 backChartP1_0_4M94 backChartP1_0_5M94 backChartP1_1_0M94 backChartP1_1_1M94 backChartP1_1_2M94 backChartP1_1_3M94 backChartP1_1_4M94 backChartP1_1_5M94 backChartP1_2_0M94 backChartP1_2_1M94 backChartP1_2_2M94 backChartP1_2_3M94 backChartP1_2_4M94 backChartP1_2_5M94
 ring

theorem back_column1_6M94 (c r : ℤ) :
 (backChartP1_1_0M94 c r*backChartP1_1_6M94 c r + backChartP1_1_1M94 c r*backChartP1_1_5M94 c r + backChartP1_1_2M94 c r*backChartP1_1_4M94 c r + backChartP1_1_3M94 c r*backChartP1_1_3M94 c r + backChartP1_1_4M94 c r*backChartP1_1_2M94 c r + backChartP1_1_5M94 c r*backChartP1_1_1M94 c r + backChartP1_1_6M94 c r*backChartP1_1_0M94 c r)-(backChartP1_0_0M94 c r*backChartP1_2_6M94 c r + backChartP1_0_1M94 c r*backChartP1_2_5M94 c r + backChartP1_0_2M94 c r*backChartP1_2_4M94 c r + backChartP1_0_3M94 c r*backChartP1_2_3M94 c r + backChartP1_0_4M94 c r*backChartP1_2_2M94 c r + backChartP1_0_5M94 c r*backChartP1_2_1M94 c r + backChartP1_0_6M94 c r*backChartP1_2_0M94 c r)=backChartG1_6M94 c r := by
 unfold backChartG1_6M94 backChartP1_0_0M94 backChartP1_0_1M94 backChartP1_0_2M94 backChartP1_0_3M94 backChartP1_0_4M94 backChartP1_0_5M94 backChartP1_0_6M94 backChartP1_1_0M94 backChartP1_1_1M94 backChartP1_1_2M94 backChartP1_1_3M94 backChartP1_1_4M94 backChartP1_1_5M94 backChartP1_1_6M94 backChartP1_2_0M94 backChartP1_2_1M94 backChartP1_2_2M94 backChartP1_2_3M94 backChartP1_2_4M94 backChartP1_2_5M94 backChartP1_2_6M94
 ring

theorem back_column1_7M94 (c r : ℤ) :
 (backChartP1_1_0M94 c r*backChartP1_1_7M94 c r + backChartP1_1_1M94 c r*backChartP1_1_6M94 c r + backChartP1_1_2M94 c r*backChartP1_1_5M94 c r + backChartP1_1_3M94 c r*backChartP1_1_4M94 c r + backChartP1_1_4M94 c r*backChartP1_1_3M94 c r + backChartP1_1_5M94 c r*backChartP1_1_2M94 c r + backChartP1_1_6M94 c r*backChartP1_1_1M94 c r + backChartP1_1_7M94 c r*backChartP1_1_0M94 c r)-(backChartP1_0_0M94 c r*backChartP1_2_7M94 c r + backChartP1_0_1M94 c r*backChartP1_2_6M94 c r + backChartP1_0_2M94 c r*backChartP1_2_5M94 c r + backChartP1_0_3M94 c r*backChartP1_2_4M94 c r + backChartP1_0_4M94 c r*backChartP1_2_3M94 c r + backChartP1_0_5M94 c r*backChartP1_2_2M94 c r + backChartP1_0_6M94 c r*backChartP1_2_1M94 c r + backChartP1_0_7M94 c r*backChartP1_2_0M94 c r)=backChartG1_7M94 c r := by
 unfold backChartG1_7M94 backChartP1_0_0M94 backChartP1_0_1M94 backChartP1_0_2M94 backChartP1_0_3M94 backChartP1_0_4M94 backChartP1_0_5M94 backChartP1_0_6M94 backChartP1_0_7M94 backChartP1_1_0M94 backChartP1_1_1M94 backChartP1_1_2M94 backChartP1_1_3M94 backChartP1_1_4M94 backChartP1_1_5M94 backChartP1_1_6M94 backChartP1_1_7M94 backChartP1_2_0M94 backChartP1_2_1M94 backChartP1_2_2M94 backChartP1_2_3M94 backChartP1_2_4M94 backChartP1_2_5M94 backChartP1_2_6M94 backChartP1_2_7M94
 ring

theorem back_column1_8M94 (c r : ℤ) :
 (backChartP1_1_1M94 c r*backChartP1_1_7M94 c r + backChartP1_1_2M94 c r*backChartP1_1_6M94 c r + backChartP1_1_3M94 c r*backChartP1_1_5M94 c r + backChartP1_1_4M94 c r*backChartP1_1_4M94 c r + backChartP1_1_5M94 c r*backChartP1_1_3M94 c r + backChartP1_1_6M94 c r*backChartP1_1_2M94 c r + backChartP1_1_7M94 c r*backChartP1_1_1M94 c r)-(backChartP1_0_1M94 c r*backChartP1_2_7M94 c r + backChartP1_0_2M94 c r*backChartP1_2_6M94 c r + backChartP1_0_3M94 c r*backChartP1_2_5M94 c r + backChartP1_0_4M94 c r*backChartP1_2_4M94 c r + backChartP1_0_5M94 c r*backChartP1_2_3M94 c r + backChartP1_0_6M94 c r*backChartP1_2_2M94 c r + backChartP1_0_7M94 c r*backChartP1_2_1M94 c r)=backChartG1_8M94 c r := by
 unfold backChartG1_8M94 backChartP1_0_1M94 backChartP1_0_2M94 backChartP1_0_3M94 backChartP1_0_4M94 backChartP1_0_5M94 backChartP1_0_6M94 backChartP1_0_7M94 backChartP1_1_1M94 backChartP1_1_2M94 backChartP1_1_3M94 backChartP1_1_4M94 backChartP1_1_5M94 backChartP1_1_6M94 backChartP1_1_7M94 backChartP1_2_1M94 backChartP1_2_2M94 backChartP1_2_3M94 backChartP1_2_4M94 backChartP1_2_5M94 backChartP1_2_6M94 backChartP1_2_7M94
 ring

theorem back_column1_9M94 (c r : ℤ) :
 (backChartP1_1_2M94 c r*backChartP1_1_7M94 c r + backChartP1_1_3M94 c r*backChartP1_1_6M94 c r + backChartP1_1_4M94 c r*backChartP1_1_5M94 c r + backChartP1_1_5M94 c r*backChartP1_1_4M94 c r + backChartP1_1_6M94 c r*backChartP1_1_3M94 c r + backChartP1_1_7M94 c r*backChartP1_1_2M94 c r)-(backChartP1_0_2M94 c r*backChartP1_2_7M94 c r + backChartP1_0_3M94 c r*backChartP1_2_6M94 c r + backChartP1_0_4M94 c r*backChartP1_2_5M94 c r + backChartP1_0_5M94 c r*backChartP1_2_4M94 c r + backChartP1_0_6M94 c r*backChartP1_2_3M94 c r + backChartP1_0_7M94 c r*backChartP1_2_2M94 c r)=backChartG1_9M94 c r := by
 unfold backChartG1_9M94 backChartP1_0_2M94 backChartP1_0_3M94 backChartP1_0_4M94 backChartP1_0_5M94 backChartP1_0_6M94 backChartP1_0_7M94 backChartP1_1_2M94 backChartP1_1_3M94 backChartP1_1_4M94 backChartP1_1_5M94 backChartP1_1_6M94 backChartP1_1_7M94 backChartP1_2_2M94 backChartP1_2_3M94 backChartP1_2_4M94 backChartP1_2_5M94 backChartP1_2_6M94 backChartP1_2_7M94
 ring

theorem back_column1_10M94 (c r : ℤ) :
 (backChartP1_1_3M94 c r*backChartP1_1_7M94 c r + backChartP1_1_4M94 c r*backChartP1_1_6M94 c r + backChartP1_1_5M94 c r*backChartP1_1_5M94 c r + backChartP1_1_6M94 c r*backChartP1_1_4M94 c r + backChartP1_1_7M94 c r*backChartP1_1_3M94 c r)-(backChartP1_0_3M94 c r*backChartP1_2_7M94 c r + backChartP1_0_4M94 c r*backChartP1_2_6M94 c r + backChartP1_0_5M94 c r*backChartP1_2_5M94 c r + backChartP1_0_6M94 c r*backChartP1_2_4M94 c r + backChartP1_0_7M94 c r*backChartP1_2_3M94 c r)=backChartG1_10M94 c r := by
 unfold backChartG1_10M94 backChartP1_0_3M94 backChartP1_0_4M94 backChartP1_0_5M94 backChartP1_0_6M94 backChartP1_0_7M94 backChartP1_1_3M94 backChartP1_1_4M94 backChartP1_1_5M94 backChartP1_1_6M94 backChartP1_1_7M94 backChartP1_2_3M94 backChartP1_2_4M94 backChartP1_2_5M94 backChartP1_2_6M94 backChartP1_2_7M94
 ring

theorem back_column1_11M94 (c r : ℤ) :
 (backChartP1_1_4M94 c r*backChartP1_1_7M94 c r + backChartP1_1_5M94 c r*backChartP1_1_6M94 c r + backChartP1_1_6M94 c r*backChartP1_1_5M94 c r + backChartP1_1_7M94 c r*backChartP1_1_4M94 c r)-(backChartP1_0_4M94 c r*backChartP1_2_7M94 c r + backChartP1_0_5M94 c r*backChartP1_2_6M94 c r + backChartP1_0_6M94 c r*backChartP1_2_5M94 c r + backChartP1_0_7M94 c r*backChartP1_2_4M94 c r)=backChartG1_11M94 c r := by
 unfold backChartG1_11M94 backChartP1_0_4M94 backChartP1_0_5M94 backChartP1_0_6M94 backChartP1_0_7M94 backChartP1_1_4M94 backChartP1_1_5M94 backChartP1_1_6M94 backChartP1_1_7M94 backChartP1_2_4M94 backChartP1_2_5M94 backChartP1_2_6M94 backChartP1_2_7M94
 ring

theorem back_column1_12M94 (c r : ℤ) :
 (backChartP1_1_5M94 c r*backChartP1_1_7M94 c r + backChartP1_1_6M94 c r*backChartP1_1_6M94 c r + backChartP1_1_7M94 c r*backChartP1_1_5M94 c r)-(backChartP1_0_5M94 c r*backChartP1_2_7M94 c r + backChartP1_0_6M94 c r*backChartP1_2_6M94 c r + backChartP1_0_7M94 c r*backChartP1_2_5M94 c r)=backChartG1_12M94 c r := by
 unfold backChartG1_12M94 backChartP1_0_5M94 backChartP1_0_6M94 backChartP1_0_7M94 backChartP1_1_5M94 backChartP1_1_6M94 backChartP1_1_7M94 backChartP1_2_5M94 backChartP1_2_6M94 backChartP1_2_7M94
 ring

theorem back_column1_13M94 (c r : ℤ) :
 (backChartP1_1_6M94 c r*backChartP1_1_7M94 c r + backChartP1_1_7M94 c r*backChartP1_1_6M94 c r)-(backChartP1_0_6M94 c r*backChartP1_2_7M94 c r + backChartP1_0_7M94 c r*backChartP1_2_6M94 c r)=backChartG1_13M94 c r := by
 unfold backChartG1_13M94 backChartP1_0_6M94 backChartP1_0_7M94 backChartP1_1_6M94 backChartP1_1_7M94 backChartP1_2_6M94 backChartP1_2_7M94
 ring

theorem back_column1_14M94 (c r : ℤ) :
 (backChartP1_1_7M94 c r*backChartP1_1_7M94 c r)-(backChartP1_0_7M94 c r*backChartP1_2_7M94 c r)=backChartG1_14M94 c r := by
 unfold backChartG1_14M94 backChartP1_0_7M94 backChartP1_1_7M94 backChartP1_2_7M94
 ring

attribute [local irreducible] backChartP1_0_0M94 backChartP1_0_1M94 backChartP1_0_2M94 backChartP1_0_3M94 backChartP1_0_4M94 backChartP1_0_5M94 backChartP1_0_6M94 backChartP1_0_7M94 backChartP1_1_0M94 backChartP1_1_1M94 backChartP1_1_2M94 backChartP1_1_3M94 backChartP1_1_4M94 backChartP1_1_5M94 backChartP1_1_6M94 backChartP1_1_7M94 backChartP1_2_0M94 backChartP1_2_1M94 backChartP1_2_2M94 backChartP1_2_3M94 backChartP1_2_4M94 backChartP1_2_5M94 backChartP1_2_6M94 backChartP1_2_7M94 backChartG1_0M94 backChartG1_1M94 backChartG1_2M94 backChartG1_3M94 backChartG1_4M94 backChartG1_5M94 backChartG1_6M94 backChartG1_7M94 backChartG1_8M94 backChartG1_9M94 backChartG1_10M94 backChartG1_11M94 backChartG1_12M94 backChartG1_13M94 backChartG1_14M94

theorem back_columns_lc1M94 (c r e : ℤ) (hc : 0≤c) (hr : 0≤r) (he : 0≤e) :
 backShape1M94 (7 + 3*r + 4*c) (2 + 1*r + 1*c) e*backShape1M94 (7 + 3*r + 4*c) (2 + 1*r + 1*c) (e-2)≤
 backShape1M94 (7 + 3*r + 4*c) (2 + 1*r + 1*c) (e-1)^2 := by
 apply sub_nonneg.mp
 have hzero := back_stage1_0M94 c r e
 simp only [sub_zero] at hzero
 rw [hzero,back_stage1_1M94,back_stage1_2M94]
 have hgap : (backChartP1_1_0M94 c r*e^0 + backChartP1_1_1M94 c r*e^1 + backChartP1_1_2M94 c r*e^2 + backChartP1_1_3M94 c r*e^3 + backChartP1_1_4M94 c r*e^4 + backChartP1_1_5M94 c r*e^5 + backChartP1_1_6M94 c r*e^6 + backChartP1_1_7M94 c r*e^7)^2-(backChartP1_0_0M94 c r*e^0 + backChartP1_0_1M94 c r*e^1 + backChartP1_0_2M94 c r*e^2 + backChartP1_0_3M94 c r*e^3 + backChartP1_0_4M94 c r*e^4 + backChartP1_0_5M94 c r*e^5 + backChartP1_0_6M94 c r*e^6 + backChartP1_0_7M94 c r*e^7)*(backChartP1_2_0M94 c r*e^0 + backChartP1_2_1M94 c r*e^1 + backChartP1_2_2M94 c r*e^2 + backChartP1_2_3M94 c r*e^3 + backChartP1_2_4M94 c r*e^4 + backChartP1_2_5M94 c r*e^5 + backChartP1_2_6M94 c r*e^6 + backChartP1_2_7M94 c r*e^7)=backChartG1_0M94 c r*e^0 + backChartG1_1M94 c r*e^1 + backChartG1_2M94 c r*e^2 + backChartG1_3M94 c r*e^3 + backChartG1_4M94 c r*e^4 + backChartG1_5M94 c r*e^5 + backChartG1_6M94 c r*e^6 + backChartG1_7M94 c r*e^7 + backChartG1_8M94 c r*e^8 + backChartG1_9M94 c r*e^9 + backChartG1_10M94 c r*e^10 + backChartG1_11M94 c r*e^11 + backChartG1_12M94 c r*e^12 + backChartG1_13M94 c r*e^13 + backChartG1_14M94 c r*e^14 := by
  rw [←back_column1_0M94,←back_column1_1M94,←back_column1_2M94,←back_column1_3M94,←back_column1_4M94,←back_column1_5M94,←back_column1_6M94,←back_column1_7M94,←back_column1_8M94,←back_column1_9M94,←back_column1_10M94,←back_column1_11M94,←back_column1_12M94,←back_column1_13M94,←back_column1_14M94]
  ring
 rw [hgap]
 have h0 := backChartG1_0M94_nonneg c r hc hr
 have h1 := backChartG1_1M94_nonneg c r hc hr
 have h2 := backChartG1_2M94_nonneg c r hc hr
 have h3 := backChartG1_3M94_nonneg c r hc hr
 have h4 := backChartG1_4M94_nonneg c r hc hr
 have h5 := backChartG1_5M94_nonneg c r hc hr
 have h6 := backChartG1_6M94_nonneg c r hc hr
 have h7 := backChartG1_7M94_nonneg c r hc hr
 have h8 := backChartG1_8M94_nonneg c r hc hr
 have h9 := backChartG1_9M94_nonneg c r hc hr
 have h10 := backChartG1_10M94_nonneg c r hc hr
 have h11 := backChartG1_11M94_nonneg c r hc hr
 have h12 := backChartG1_12M94_nonneg c r hc hr
 have h13 := backChartG1_13M94_nonneg c r hc hr
 have h14 := backChartG1_14M94_nonneg c r hc hr
 positivity
end
end MathGKM.Markov
