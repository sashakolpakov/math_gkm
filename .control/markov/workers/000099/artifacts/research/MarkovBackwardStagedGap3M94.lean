import MarkovBackwardChamber3M94
/-! Machine-authored 94b1de05. Staged backwards third-block gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false

def backChartP3_0_0M94 (c r : ℤ) : ℤ :=
 1362856320 + 5137251840*r + 6924919680*r^2 + 3973939200*r^3 + 810351360*r^4 + 3077786880*c + 8132463360*c*r + 6861818880*c*r^2 + 1853107200*c*r^3 + 2379767040*c^2 + 3935554560*c^2*r + 1585543680*c^2*r^2 + 749629440*c^3 + 601574400*c^3*r + 85397760*c^4

def backChartP3_0_1M94 (c r : ℤ) : ℤ :=
 1312348896 + 5000108736*r + 6832879392*r^2 + 3991352064*r^3 + 839700672*r^4 + 3042517632*c + 8177964288*c*r + 7044186240*c*r^2 + 1955347200*c*r^3 + 2440639872*c^2 + 4132050048*c^2*r + 1703581056*c^2*r^2 + 805502208*c^3 + 658133760*c^3*r + 95121792*c^4

def backChartP3_0_2M94 (c r : ℤ) : ℤ :=
 550631424 + 2115888768*r + 2923588416*r^2 + 1732077312*r^3 + 372657600*r^4 + 1307000576*c + 3563220416*c*r + 3121513920*c*r^2 + 884873472*c*r^3 + 1083535488*c^2 + 1870795584*c^2*r + 786187584*c^2*r^2 + 372824704*c^3 + 309748096*c^3*r + 45658368*c^4

def backChartP3_0_3M94 (c r : ℤ) : ℤ :=
 130730880 + 505497888*r + 704101776*r^2 + 421321152*r^3 + 91925904*r^4 + 316901312*c + 873427968*c*r + 774918144*c*r^2 + 222876864*c*r^3 + 270460736*c^2 + 474215616*c^2*r + 202233024*c^2*r^2 + 96546688*c^3 + 81387264*c^3*r + 12256384*c^4

def backChartP3_0_4M94 (c r : ℤ) : ℤ :=
 19004160 + 73758720*r + 103212480*r^2 + 62086080*r^3 + 13628160*r^4 + 46928000*c + 130289600*c*r + 116524800*c*r^2 + 33781440*c*r^3 + 41072640*c^2 + 72797760*c^2*r + 31348800*c^2*r^2 + 15137920*c^3 + 12906880*c^3*r + 1989120*c^4

def backChartP3_0_5M94 (c r : ℤ) : ℤ :=
 1694784 + 6583584*r + 9219168*r^2 + 5546016*r^3 + 1215648*r^4 + 4251968*c + 11844672*c*r + 10624320*c*r^2 + 3084480*c*r^3 + 3801728*c^2 + 6777792*c^2*r + 2931264*c^2*r^2 + 1439872*c^3 + 1236480*c^3*r + 195328*c^4

def backChartP3_0_6M94 (c r : ℤ) : ℤ :=
 86016 + 333312*r + 465024*r^2 + 278208*r^3 + 60480*r^4 + 218624*c + 608384*c*r + 544320*c*r^2 + 157248*c*r^3 + 198912*c^2 + 354816*c^2*r + 153216*c^2*r^2 + 77056*c^3 + 66304*c^3*r + 10752*c^4

def backChartP3_0_7M94 (c r : ℤ) : ℤ :=
 1920 + 7392*r + 10224*r^2 + 6048*r^3 + 1296*r^4 + 4928*c + 13632*c*r + 12096*c*r^2 + 3456*c*r^3 + 4544*c^2 + 8064*c^2*r + 3456*c^2*r^2 + 1792*c^3 + 1536*c^3*r + 256*c^4

def backChartP3_1_0M94 (c r : ℤ) : ℤ :=
 487801440 + 1815035040*r + 2405975040*r^2 + 1350155520*r^3 + 263854080*r^4 + 1068258240*c + 2763331200*c*r + 2270661120*c*r^2 + 590607360*c*r^3 + 789667200*c^2 + 1266451200*c^2*r + 494484480*c^2*r^2 + 234178560*c^3 + 183536640*c^3*r + 25482240*c^4

def backChartP3_1_1M94 (c r : ℤ) : ℤ :=
 535233312 + 2020759776*r + 2728535232*r^2 + 1568919744*r^3 + 321374976*r^4 + 1211491008*c + 3206317440*c*r + 2709753984*c*r^2 + 733608192*c*r^3 + 938507520*c^2 + 1553731200*c^2*r + 626270976*c^2*r^2 + 295690752*c^3 + 236967168*c^3*r + 33531648*c^4

def backChartP3_1_2M94 (c r : ℤ) : ℤ :=
 256765824 + 980956032*r + 1345126944*r^2 + 789216288*r^3 + 167372352*r^4 + 598520832*c + 1615066880*c*r + 1397575872*c*r^2 + 390372864*c*r^3 + 483460096*c^2 + 822310272*c^2*r + 340494336*c^2*r^2 + 160731648*c^3 + 131625088*c^3*r + 19026560*c^4

def backChartP3_1_3M94 (c r : ℤ) : ℤ :=
 70008960 + 269891328*r + 374500896*r^2 + 223084512*r^3 + 48405504*r^4 + 167508992*c + 459025728*c*r + 404599104*c*r^2 + 115571904*c*r^3 + 140368256*c^2 + 243988416*c^2*r + 103207104*c^2*r^2 + 48915328*c^3 + 40852224*c^3*r + 6047104*c^4

def backChartP3_1_4M94 (c r : ℤ) : ℤ :=
 11753280 + 45581760*r + 63734160*r^2 + 38317440*r^3 + 8411760*r^4 + 28775040*c + 79714880*c*r + 71144640*c*r^2 + 20596800*c*r^3 + 24888640*c^2 + 43948800*c^2*r + 18869760*c^2*r^2 + 9031680*c^3 + 7665280*c^3*r + 1164800*c^4

def backChartP3_1_5M94 (c r : ℤ) : ℤ :=
 1219008 + 4738944*r + 6643728*r^2 + 4003776*r^3 + 879984*r^4 + 3043712*c + 8480640*c*r + 7612416*c*r^2 + 2213568*c*r^3 + 2703680*c^2 + 4818240*c^2*r + 2084544*c^2*r^2 + 1015168*c^3 + 870912*c^3*r + 136192*c^4

def backChartP3_1_6M94 (c r : ℤ) : ℤ :=
 72576 + 281568*r + 393456*r^2 + 235872*r^3 + 51408*r^4 + 184128*c + 512960*c*r + 459648*c*r^2 + 133056*c*r^3 + 167104*c^2 + 298368*c^2*r + 129024*c^2*r^2 + 64512*c^3 + 55552*c^3*r + 8960*c^4

def backChartP3_1_7M94 (c r : ℤ) : ℤ :=
 1920 + 7392*r + 10224*r^2 + 6048*r^3 + 1296*r^4 + 4928*c + 13632*c*r + 12096*c*r^2 + 3456*c*r^3 + 4544*c^2 + 8064*c^2*r + 3456*c^2*r^2 + 1792*c^3 + 1536*c^3*r + 256*c^4

def backChartP3_2_0M94 (c r : ℤ) : ℤ :=
 149929920 + 546456960*r + 705539520*r^2 + 381911040*r^3 + 69027840*r^4 + 313689600*c + 784788480*c*r + 617863680*c*r^2 + 150312960*c*r^3 + 216599040*c^2 + 330462720*c^2*r + 122411520*c^2*r^2 + 58383360*c^3 + 44190720*c^3*r + 5967360*c^4

def backChartP3_2_1M94 (c r : ℤ) : ℤ :=
 190388448 + 708251712*r + 937776864*r^2 + 525116928*r^3 + 102300288*r^4 + 416024448*c + 1073822208*c*r + 879209856*c*r^2 + 227484672*c*r^3 + 305685120*c^2 + 487638144*c^2*r + 189097344*c^2*r^2 + 89548032*c^3 + 69644544*c^3*r + 9589632*c^4

def backChartP3_2_2M94 (c r : ℤ) : ℤ :=
 106116864 + 401451456*r + 543279072*r^2 + 313240704*r^3 + 64570464*r^4 + 240865408*c + 638880704*c*r + 541162944*c*r^2 + 147025536*c*r^3 + 187061504*c^2 + 310161600*c^2*r + 125108928*c^2*r^2 + 58954112*c^3 + 47152000*c^3*r + 6641152*c^4

def backChartP3_2_3M94 (c r : ℤ) : ℤ :=
 33801600 + 129581088*r + 178490256*r^2 + 105346752*r^3 + 22575504*r^4 + 79335872*c + 215190528*c*r + 187375104*c*r^2 + 52780224*c*r^3 + 64667456*c^2 + 110690496*c^2*r + 46113984*c^2*r^2 + 21712768*c^3 + 17842944*c^3*r + 2579584*c^4

def backChartP3_2_4M94 (c r : ℤ) : ℤ :=
 6679680 + 25851840*r + 36059520*r^2 + 21624960*r^3 + 4737600*r^4 + 16145920*c + 44528960*c*r + 39553920*c*r^2 + 11403840*c*r^3 + 13717760*c^2 + 24050880*c^2*r + 10261440*c^2*r^2 + 4860800*c^3 + 4090240*c^3*r + 609280*c^4

def backChartP3_2_5M94 (c r : ℤ) : ℤ :=
 823872 + 3204768*r + 4497696*r^2 + 2715552*r^3 + 598752*r^4 + 2042432*c + 5689152*c*r + 5108544*c*r^2 + 1487808*c*r^3 + 1796480*c^2 + 3197376*c^2*r + 1382976*c^2*r^2 + 665728*c^3 + 569856*c^3*r + 87808*c^4

def backChartP3_2_6M94 (c r : ℤ) : ℤ :=
 59136 + 229824*r + 321888*r^2 + 193536*r^3 + 42336*r^4 + 149632*c + 417536*c*r + 374976*c*r^2 + 108864*c*r^3 + 135296*c^2 + 241920*c^2*r + 104832*c^2*r^2 + 51968*c^3 + 44800*c^3*r + 7168*c^4

def backChartP3_2_7M94 (c r : ℤ) : ℤ :=
 1920 + 7392*r + 10224*r^2 + 6048*r^3 + 1296*r^4 + 4928*c + 13632*c*r + 12096*c*r^2 + 3456*c*r^3 + 4544*c^2 + 8064*c^2*r + 3456*c^2*r^2 + 1792*c^3 + 1536*c^3*r + 256*c^4

def backChartG3_0M94 (c r : ℤ) : ℤ :=
 33617305836979200 + 255783333389875200*r + 834539703948518400*r^2 + 1526066604918374400*r^3 + 1712356472894054400*r^4 + 1208779792419225600*r^5 + 525134179532390400*r^6 + 128693515242700800*r^7 + 13682171510784000*r^8 + 153229620954009600*c + 991532094290841600*c*r + 2696430554599219200*c*r^2 + 3999601677367296000*c*r^3 + 3499825769614540800*c*r^4 + 1810073432737382400*c*r^5 + 513670104996249600*c*r^6 + 61946024361984000*c*r^7 + 294115874121216000*c^2 + 1585927830961152000*c^2*r + 3498691157769830400*c^2*r^2 + 4048700284506931200*c^2*r^3 + 2597153871487795200*c^2*r^4 + 877882612432896000*c^2*r^5 + 122571523178496000*c^2*r^6 + 310488396554649600*c^3 + 1358437614737817600*c^3*r + 2339201463975936000*c^3*r^2 + 1985620783620096000*c^3*r^3 + 832769409849753600*c^3*r^4 + 138441304866816000*c^3*r^5 + 197527097688883200*c^4 + 675005165575372800*c^4*r + 853159504206643200*c^4*r^2 + 473567187153715200*c^4*r^3 + 97624404541440000*c^4*r^4 + 77827016894054400*c^5 + 195340849849958400*c^5*r + 161442119584972800*c^5*r^2 + 44011535597568000*c^5*r^3 + 18620691244646400*c^6 + 30550472618803200*c^6*r + 12387657203712000*c^6*r^2 + 2475671637196800*c^7 + 1990249906176000*c^7*r + 139745378304000*c^8

theorem backChartG3_0M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_0M94 c r := by
 unfold backChartG3_0M94
 positivity

def backChartG3_1M94 (c r : ℤ) : ℤ :=
 65942696057978880 + 504266671364198400*r + 1655323873523066880*r^2 + 3048802690577817600*r^3 + 3449536326794557440*r^4 + 2458290858652016640*r^5 + 1079306842076467200*r^6 + 267474436958453760*r^7 + 28730296111104000*r^8 + 304677667231580160*c + 1985342652964823040*c*r + 5442592503648706560*c*r^2 + 8146315931972198400*c*r^3 + 7200152138831339520*c*r^4 + 3764423398767575040*c*r^5 + 1080298711239229440*c*r^6 + 131636680674508800*c*r^7 + 594589295410790400*c^2 + 3234655013069168640*c^2*r + 7205610626898001920*c^2*r^2 + 8426089795889848320*c^2*r^3 + 5465114306966200320*c^2*r^4 + 1868076781157744640*c^2*r^5 + 263579045113036800*c^2*r^6 + 640008518030622720*c^3 + 2829227079266058240*c^3*r + 4924880108005294080*c^3*r^2 + 4227299420826746880*c^3*r^3 + 1792848724154449920*c^3*r^4 + 301247718860390400*c^3*r^5 + 416062750186782720*c^4 + 1437641794806497280*c^4*r + 1837473652440760320*c^4*r^2 + 1031382849848279040*c^4*r^3 + 214947185725440000*c^4*r^4 + 167680487323238400*c^5 + 425558635505418240*c^5*r + 355655964437544960*c^5*r^2 + 98046739729612800*c^5*r^3 + 41027955204096000*c^6 + 68070380569067520*c^6*r + 27920715205017600*c^6*r^2 + 5578388209336320*c^7 + 4538293788672000*c^7*r + 322363935129600*c^8

theorem backChartG3_1M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_1M94 c r := by
 unfold backChartG3_1M94
 positivity

def backChartG3_2M94 (c r : ℤ) : ℤ :=
 59941941999722496 + 460419949583161344*r + 1519454793087286272*r^2 + 2815976394063286272*r^3 + 3208777792385614848*r^4 + 2304968528752533504*r^5 + 1020817618518104064*r^6 + 255281136564142080*r^7 + 27655498022584320*r^8 + 280578437975420928*c + 1839511691617001472*c*r + 5078117508117663744*c*r^2 + 7660234554148786176*c*r^3 + 6828536328597172224*c*r^4 + 3602791164796895232*c*r^5 + 1043590629516632064*c*r^6 + 128286142059479040*c*r^7 + 556171459674550272*c^2 + 3049151661661851648*c^2*r + 6850049236685770752*c^2*r^2 + 8083145330126254080*c^2*r^3 + 5292558795046957056*c^2*r^4 + 1826460886161235968*c^2*r^5 + 260055051656601600*c^2*r^6 + 609605001090441216*c^3 + 2719398604586582016*c^3*r + 4778921850115424256*c^3*r^2 + 4142277717976129536*c^3*r^3 + 1774047079521239040*c^3*r^4 + 300897978143293440*c^3*r^5 + 404376309556789248*c^4 + 1411151092238426112*c^4*r + 1821737833492340736*c^4*r^2 + 1032810228972748800*c^4*r^3 + 217348763730739200*c^4*r^4 + 166494184368390144*c^5 + 426860148457193472*c^5*r + 360395782416875520*c^5*r^2 + 100363687259996160*c^5*r^3 + 41632611236020224*c^6 + 69794780665430016*c^6*r + 28931801278464000*c^6*r^2 + 5786966783066112*c^7 + 4760294124257280*c^7*r + 342267750236160*c^8

theorem backChartG3_2M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_2M94 c r := by
 unfold backChartG3_2M94
 positivity

def backChartG3_3M94 (c r : ℤ) : ℤ :=
 33396781658849280 + 257506522849787904*r + 853643628969062400*r^2 + 1590250247870828544*r^3 + 1822659669632342016*r^4 + 1317698048963358720*r^5 + 587599850645434368*r^6 + 147985063635935232*r^7 + 16140171884046336*r^8 + 158277851270332416*c + 1043131910781886464*c*r + 2896690733978517504*c*r^2 + 4398162432696582144*c*r^3 + 3948336107914641408*c*r^4 + 2098658141155344384*c*r^5 + 612476072904794112*c*r^6 + 75829588499202048*c*r^7 + 318380177484988416*c^2 + 1757080251647508480*c^2*r + 3975808414895665152*c^2*r^2 + 4727417177651847168*c^2*r^3 + 3119897966665052160*c^2*r^4 + 1085234298000039936*c^2*r^5 + 155688938109444096*c^2*r^6 + 354915763685425152*c^3 + 1595682912520273920*c^3*r + 2827159360033333248*c^3*r^2 + 2471073610237747200*c^3*r^3 + 1067146600331427840*c^3*r^4 + 182450757289328640*c^3*r^5 + 239905796938579968*c^4 + 844478205174202368*c^4*r + 1099765265583022080*c^4*r^2 + 628946824493137920*c^4*r^3 + 133480288913448960*c^4*r^4 + 100791516304539648*c^5 + 260770777931661312*c^5*r + 222173864462204928*c^5*r^2 + 62426494250287104*c^5*r^3 + 25736692570423296*c^6 + 43555001740443648*c^6*r + 18226286250934272*c^6*r^2 + 3655494551568384*c^7 + 3037274741243904*c^7*r + 221177159024640*c^8

theorem backChartG3_3M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_3M94 c r := by
 unfold backChartG3_3M94
 positivity

def backChartG3_4M94 (c r : ℤ) : ℤ :=
 12704319234109440 + 98266128445900800*r + 326942173808990208*r^2 + 611565408390730752*r^3 + 704129991597075456*r^4 + 511548560943307776*r^5 + 229285413817012224*r^6 + 58043654152630272*r^7 + 6361864448873472*r^8 + 60923430366597120*c + 403257599889199104*c*r + 1125209305843144704*c*r^2 + 1717408015573211136*c*r^3 + 1550350530285096960*c*r^4 + 828805249671469056*c*r^5 + 243270385272907776*c*r^6 + 30283366792863744*c*r^7 + 124246893951459328*c^2 + 689482192169680896*c^2*r + 1569359752140988416*c^2*r^2 + 1877642549691955200*c^2*r^3 + 1247047836332820480*c^2*r^4 + 436511481574275072*c^2*r^5 + 62997705833158656*c^2*r^6 + 140703313093296128*c^3 + 636764203115421696*c^3*r + 1135899287814574080*c^3*r^2 + 999709716040519680*c^3*r^3 + 434685146247475200*c^3*r^4 + 74804139563102208*c^3*r^5 + 96793920847855616*c^4 + 343245320010915840*c^4*r + 450344296807587840*c^4*r^2 + 259446136381931520*c^4*r^3 + 55452441211453440*c^4*r^4 + 41446838858399744*c^5 + 108085622644801536*c^5*r + 92813274258259968*c^5*r^2 + 26278812813754368*c^5*r^3 + 10797681694736384*c^6 + 18426265436995584*c^6*r + 7774581668560896*c^6*r^2 + 1566111577899008*c^7 + 1312843148918784*c^7*r + 96878168031232*c^8

theorem backChartG3_4M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_4M94 c r := by
 unfold backChartG3_4M94
 positivity

def backChartG3_5M94 (c r : ℤ) : ℤ :=
 3476442933411840 + 26955063570677760*r + 89927445309327360*r^2 + 168721904250869760*r^3 + 194890184834526720*r^4 + 142069205032796160*r^5 + 63897778381409280*r^6 + 16230122722437120*r^7 + 1784444118105600*r^8 + 16857500684451840*c + 111961364414054400*c*r + 313564453288611840*c*r^2 + 480485502339655680*c*r^3 + 435528727819315200*c*r^4 + 233794405491333120*c*r^5 + 68899480039434240*c*r^6 + 8609016391557120*c*r^7 + 34824082086420480*c^2 + 194100381373194240*c^2*r + 443854417835888640*c^2*r^2 + 533591127116974080*c^2*r^3 + 356093709014292480*c^2*r^4 + 125228783743580160*c^2*r^5 + 18152153747159040*c^2*r^6 + 40018718264770560*c^3 + 182074817133404160*c^3*r + 326571859628421120*c^3*r^2 + 288988471372124160*c^3*r^3 + 126323909179453440*c^3*r^4 + 21847687884288000*c^3*r^5 + 27984326654484480*c^4 + 99843698961162240*c^4*r + 131795591231324160*c^4*r^2 + 76379858663915520*c^4*r^3 + 16417175465779200*c^4*r^4 + 12198814826741760*c^5 + 32025508601856000*c^5*r + 27680835213803520*c^5*r^2 + 7886821353062400*c^5*r^3 + 3239295725568000*c^6 + 5567473719951360*c^6*r + 2365437056532480*c^6*r^2 + 479410041815040*c^7 + 404952348917760*c^7*r + 30296417894400*c^8

theorem backChartG3_5M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_5M94 c r := by
 unfold backChartG3_5M94
 positivity

def backChartG3_6M94 (c r : ℤ) : ℤ :=
 701666926829568 + 5449420460961792*r + 18212898957474816*r^2 + 34236121012724736*r^3 + 39623765887528704*r^4 + 28940912598269952*r^5 + 13040603191752192*r^6 + 3317735605201920*r^7 + 365254713573120*r^8 + 3438008016543744*c + 22890052876701696*c*r + 64273451763935232*c*r^2 + 98752189697538048*c*r^3 + 89752127628828672*c*r^4 + 48303564767410176*c*r^5 + 14268704199063552*c*r^6 + 1786499331563520*c*r^7 + 7187748763037696*c^2 + 40194579927527424*c^2*r + 92225611864221696*c^2*r^2 + 111248272863866880*c^2*r^3 + 74486867580131328*c^2*r^4 + 26275771870838784*c^2*r^5 + 3819158946570240*c^2*r^6 + 8373095293739008*c^3 + 38251625879298048*c^3*r + 68890799797198848*c^3*r^2 + 61207240939020288*c^3*r^3 + 26856703466127360*c^3*r^4 + 4660884933304320*c^3*r^5 + 5944959740145664*c^4 + 21312867983425536*c^4*r + 28266092097159168*c^4*r^2 + 16454843911618560*c^4*r^3 + 3551541977088000*c^4*r^4 + 2635229480353792*c^5 + 6955658972430336*c^5*r + 6043277071319040*c^5*r^2 + 1730244818534400*c^5*r^3 + 712531069960192*c^6 + 1231853440892928*c^6*r + 526301354557440*c^6*r^2 + 107508555513856*c^7 + 91384815943680*c^7*r + 6934846177280*c^8

theorem backChartG3_6M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_6M94 c r := by
 unfold backChartG3_6M94
 positivity

def backChartG3_7M94 (c r : ℤ) : ℤ :=
 105237847572480 + 817990655311872*r + 2736129057177600*r^2 + 5147388676104192*r^3 + 5961621515286528*r^4 + 4356698925035520*r^5 + 1963696129081344*r^6 + 499582093602816*r^7 + 54975800936448*r^8 + 520652182192128*c + 3471631118548992*c*r + 9762565066555392*c*r^2 + 15020970949619712*c*r^3 + 13669588137590784*c*r^4 + 7364637901135872*c*r^5 + 2177108251508736*c*r^6 + 272674597515264*c*r^7 + 1100655142207488*c^2 + 6168432472473600*c^2*r + 14183777099390976*c^2*r^2 + 17144144666578944*c^2*r^3 + 11499877337518080*c^2*r^4 + 4062804949905408*c^2*r^5 + 591180033282048*c^2*r^6 + 1298417497767936*c^3 + 5948761205882880*c^3*r + 10743420330123264*c^3*r^2 + 9569808120176640*c^3*r^3 + 4208646250045440*c^3*r^4 + 731769377955840*c^3*r^5 + 934996065583104*c^4 + 3363793515823104*c^4*r + 4476088619089920*c^4*r^2 + 2613644215418880*c^4*r^3 + 565613388103680*c^4*r^4 + 420978188058624*c^5 + 1115704092819456*c^5*r + 973041486004224*c^5*r^2 + 279543600709632*c^5*r^3 + 115781042700288*c^6 + 201078899933184*c^6*r + 86269521494016*c^6*r^2 + 17792653197312*c^7 + 15199126290432*c^7*r + 1170423152640*c^8

theorem backChartG3_7M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_7M94 c r := by
 unfold backChartG3_7M94
 positivity

def backChartG3_8M94 (c r : ℤ) : ℤ :=
 11639150530560 + 90465701437440*r + 302557351348224*r^2 + 569013874845696*r^3 + 658672208587008*r^4 + 480957047682048*r^5 + 216525393326592*r^6 + 54996540834816*r^7 + 6039061007616*r^8 + 58099527843840*c + 387596641001472*c*r + 1090377096302592*c*r^2 + 1678012914106368*c*r^3 + 1526948221317120*c*r^4 + 822326940868608*c*r^5 + 242892709613568*c*r^6 + 30381082324992*c*r^7 + 124083873521664*c^2 + 696162259795968*c^2*r + 1602250918668288*c^2*r^2 + 1938010376816640*c^2*r^3 + 1300462183157760*c^2*r^4 + 459430873122816*c^2*r^5 + 66817974601728*c^2*r^6 + 148087993073664*c^3 + 679604718256128*c^3*r + 1229153828474880*c^3*r^2 + 1096156299571200*c^3*r^3 + 482447860715520*c^3*r^4 + 83910622408704*c^3*r^5 + 108039269388288*c^4 + 389555314606080*c^4*r + 519381492940800*c^4*r^2 + 303754241064960*c^4*r^3 + 65809036984320*c^4*r^4 + 49354755244032*c^5 + 131162473709568*c^5*r + 114664611446784*c^5*r^2 + 33005951483904*c^5*r^3 + 13791942377472*c^6 + 24029291446272*c^6*r + 10337850851328*c^6*r^2 + 2156481675264*c^7 + 1848734318592*c^7*r + 144522018816*c^8

theorem backChartG3_8M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_8M94 c r := by
 unfold backChartG3_8M94
 positivity

def backChartG3_9M94 (c r : ℤ) : ℤ :=
 925659463680 + 7188154122240*r + 24012948879360*r^2 + 45096589117440*r^3 + 52110650672640*r^4 + 37968608563200*r^5 + 17048372382720*r^6 + 4316466309120*r^7 + 472186713600*r^8 + 4658540544000*c + 31063298703360*c*r + 87323191603200*c*r^2 + 134246068561920*c*r^3 + 121989494753280*c*r^4 + 65575452579840*c*r^5 + 19323441285120*c*r^6 + 2409848340480*c*r^7 + 10042812702720*c^2 + 56343328849920*c^2*r + 129639486627840*c^2*r^2 + 156707338905600*c^2*r^3 + 105045196032000*c^2*r^4 + 37053502617600*c^2*r^5 + 5377573877760*c^2*r^6 + 12113764024320*c^3 + 55618087526400*c^3*r + 100607644569600*c^3*r^2 + 89700025282560*c^3*r^3 + 39451308503040*c^3*r^4 + 6853012992000*c^3*r^5 + 8944326451200*c^4 + 32280689172480*c^4*r + 43063469137920*c^4*r^2 + 25188300963840*c^4*r^3 + 5454902476800*c^4*r^4 + 4141045923840*c^5 + 11020375080960*c^5*r + 9643522129920*c^5*r^2 + 2777129779200*c^5*r^3 + 1174462464000*c^6 + 2049943633920*c^6*r + 883084984320*c^6*r^2 + 186640957440*c^7 + 160354467840*c^7*r + 12730368000*c^8

theorem backChartG3_9M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_9M94 c r := by
 unfold backChartG3_9M94
 positivity

def backChartG3_10M94 (c r : ℤ) : ℤ :=
 50250203136 + 389502296064*r + 1298371802112*r^2 + 2432146977792*r^3 + 2802023739648*r^4 + 2034460882944*r^5 + 909786898944*r^6 + 229267584000*r^7 + 24945096960*r^8 + 254771478528*c + 1696272248832*c*r + 4759624525824*c*r^2 + 7300648728576*c*r^3 + 6615963131904*c*r^4 + 3544770926592*c*r^5 + 1040506435584*c*r^6 + 129173667840*c*r^7 + 553912389632*c^2 + 3104066531328*c^2*r + 7131247613952*c^2*r^2 + 8603302256640*c^2*r^3 + 5752781346816*c^2*r^4 + 2023044968448*c^2*r^5 + 292521922560*c^2*r^6 + 674625150976*c^3 + 3095048871936*c^3*r + 5592068407296*c^3*r^2 + 4977542578176*c^3*r^3 + 2184363417600*c^3*r^4 + 378370621440*c^3*r^5 + 503591538688*c^4 + 1816818941952*c^4*r + 2421694980096*c^4*r^2 + 1414562365440*c^4*r^3 + 305748172800*c^4*r^4 + 236031115264*c^5 + 628150075392*c^5*r + 549404835840*c^5*r^2 + 158049239040*c^5*r^3 + 67862953984*c^6 + 118497017856*c^6*r + 51038453760*c^6*r^2 + 10948575232*c^7 + 9413591040*c^7*r + 759234560*c^8

theorem backChartG3_10M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_10M94 c r := by
 unfold backChartG3_10M94
 positivity

def backChartG3_11M94 (c r : ℤ) : ℤ :=
 1672151040 + 12925108224*r + 42945638400*r^2 + 80147902464*r^3 + 91943341056*r^4 + 66433167360*r^5 + 29544818688*r^6 + 7399268352*r^7 + 799497216*r^8 + 8534163456*c + 56674566144*c*r + 158544175104*c*r^2 + 242327199744*c*r^3 + 218701099008*c*r^4 + 116625567744*c*r^5 + 34049175552*c*r^6 + 4201279488*c*r^7 + 18696093696*c^2 + 104528363520*c^2*r + 239472156672*c^2*r^2 + 287944409088*c^2*r^3 + 191786434560*c^2*r^4 + 67136864256*c^2*r^5 + 9656672256*c^2*r^6 + 22969024512*c^3 + 105163161600*c^3*r + 189524901888*c^3*r^2 + 168175042560*c^3*r^3 + 73528197120*c^3*r^4 + 12680478720*c^3*r^5 + 17315708928*c^4 + 62362288128*c^4*r + 82936627200*c^4*r^2 + 48306585600*c^4*r^3 + 10404495360*c^4*r^4 + 8206614528*c^5 + 21809528832*c^5*r + 19037749248*c^5*r^2 + 5462360064*c^5*r^3 + 2389180416*c^6 + 4167303168*c^6*r + 1791885312*c^6*r^2 + 390856704*c^7 + 335806464*c^7*r + 27525120*c^8

theorem backChartG3_11M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_11M94 c r := by
 unfold backChartG3_11M94
 positivity

def backChartG3_12M94 (c r : ℤ) : ℤ :=
 25804800 + 198696960*r + 657312768*r^2 + 1220631552*r^3 + 1392443136*r^4 + 999806976*r^5 + 441552384*r^6 + 109734912*r^7 + 11757312*r^8 + 132464640*c + 876417024*c*r + 2441263104*c*r^2 + 3713181696*c*r^3 + 3332689920*c*r^4 + 1766209536*c*r^5 + 512096256*c*r^6 + 62705664*c*r^7 + 292139008*c^2 + 1627508736*c^2*r + 3713181696*c^2*r^2 + 4443586560*c^2*r^3 + 2943682560*c^2*r^4 + 1024192512*c^2*r^5 + 146313216*c^2*r^6 + 361668608*c^3 + 1650302976*c^3*r + 2962391040*c^3*r^2 + 2616606720*c^3*r^3 + 1137991680*c^3*r^4 + 195084288*c^3*r^5 + 275050496*c^4 + 987463680*c^4*r + 1308303360*c^4*r^2 + 758661120*c^4*r^3 + 162570240*c^4*r^4 + 131661824*c^5 + 348880896*c^5*r + 303464448*c^5*r^2 + 86704128*c^5*r^3 + 38764544*c^6 + 67436544*c^6*r + 28901376*c^6*r^2 + 6422528*c^7 + 5505024*c^7*r + 458752*c^8

theorem backChartG3_12M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG3_12M94 c r := by
 unfold backChartG3_12M94
 positivity

theorem back_stage3_0M94 (c r e : ℤ) :
 backShape3M94 (5 + 3*r + 2*c) (3 + 2*r + 1*c) (e-0)=backChartP3_0_0M94 c r*e^0 + backChartP3_0_1M94 c r*e^1 + backChartP3_0_2M94 c r*e^2 + backChartP3_0_3M94 c r*e^3 + backChartP3_0_4M94 c r*e^4 + backChartP3_0_5M94 c r*e^5 + backChartP3_0_6M94 c r*e^6 + backChartP3_0_7M94 c r*e^7 := by
 unfold backShape3M94 backChartP3_0_0M94 backChartP3_0_1M94 backChartP3_0_2M94 backChartP3_0_3M94 backChartP3_0_4M94 backChartP3_0_5M94 backChartP3_0_6M94 backChartP3_0_7M94
 ring

theorem back_stage3_1M94 (c r e : ℤ) :
 backShape3M94 (5 + 3*r + 2*c) (3 + 2*r + 1*c) (e-1)=backChartP3_1_0M94 c r*e^0 + backChartP3_1_1M94 c r*e^1 + backChartP3_1_2M94 c r*e^2 + backChartP3_1_3M94 c r*e^3 + backChartP3_1_4M94 c r*e^4 + backChartP3_1_5M94 c r*e^5 + backChartP3_1_6M94 c r*e^6 + backChartP3_1_7M94 c r*e^7 := by
 unfold backShape3M94 backChartP3_1_0M94 backChartP3_1_1M94 backChartP3_1_2M94 backChartP3_1_3M94 backChartP3_1_4M94 backChartP3_1_5M94 backChartP3_1_6M94 backChartP3_1_7M94
 ring

theorem back_stage3_2M94 (c r e : ℤ) :
 backShape3M94 (5 + 3*r + 2*c) (3 + 2*r + 1*c) (e-2)=backChartP3_2_0M94 c r*e^0 + backChartP3_2_1M94 c r*e^1 + backChartP3_2_2M94 c r*e^2 + backChartP3_2_3M94 c r*e^3 + backChartP3_2_4M94 c r*e^4 + backChartP3_2_5M94 c r*e^5 + backChartP3_2_6M94 c r*e^6 + backChartP3_2_7M94 c r*e^7 := by
 unfold backShape3M94 backChartP3_2_0M94 backChartP3_2_1M94 backChartP3_2_2M94 backChartP3_2_3M94 backChartP3_2_4M94 backChartP3_2_5M94 backChartP3_2_6M94 backChartP3_2_7M94
 ring

theorem back_column3_0M94 (c r : ℤ) :
 (backChartP3_1_0M94 c r*backChartP3_1_0M94 c r)-(backChartP3_0_0M94 c r*backChartP3_2_0M94 c r)=backChartG3_0M94 c r := by
 unfold backChartG3_0M94 backChartP3_0_0M94 backChartP3_1_0M94 backChartP3_2_0M94
 ring

theorem back_column3_1M94 (c r : ℤ) :
 (backChartP3_1_0M94 c r*backChartP3_1_1M94 c r + backChartP3_1_1M94 c r*backChartP3_1_0M94 c r)-(backChartP3_0_0M94 c r*backChartP3_2_1M94 c r + backChartP3_0_1M94 c r*backChartP3_2_0M94 c r)=backChartG3_1M94 c r := by
 unfold backChartG3_1M94 backChartP3_0_0M94 backChartP3_0_1M94 backChartP3_1_0M94 backChartP3_1_1M94 backChartP3_2_0M94 backChartP3_2_1M94
 ring

theorem back_column3_2M94 (c r : ℤ) :
 (backChartP3_1_0M94 c r*backChartP3_1_2M94 c r + backChartP3_1_1M94 c r*backChartP3_1_1M94 c r + backChartP3_1_2M94 c r*backChartP3_1_0M94 c r)-(backChartP3_0_0M94 c r*backChartP3_2_2M94 c r + backChartP3_0_1M94 c r*backChartP3_2_1M94 c r + backChartP3_0_2M94 c r*backChartP3_2_0M94 c r)=backChartG3_2M94 c r := by
 unfold backChartG3_2M94 backChartP3_0_0M94 backChartP3_0_1M94 backChartP3_0_2M94 backChartP3_1_0M94 backChartP3_1_1M94 backChartP3_1_2M94 backChartP3_2_0M94 backChartP3_2_1M94 backChartP3_2_2M94
 ring

theorem back_column3_3M94 (c r : ℤ) :
 (backChartP3_1_0M94 c r*backChartP3_1_3M94 c r + backChartP3_1_1M94 c r*backChartP3_1_2M94 c r + backChartP3_1_2M94 c r*backChartP3_1_1M94 c r + backChartP3_1_3M94 c r*backChartP3_1_0M94 c r)-(backChartP3_0_0M94 c r*backChartP3_2_3M94 c r + backChartP3_0_1M94 c r*backChartP3_2_2M94 c r + backChartP3_0_2M94 c r*backChartP3_2_1M94 c r + backChartP3_0_3M94 c r*backChartP3_2_0M94 c r)=backChartG3_3M94 c r := by
 unfold backChartG3_3M94 backChartP3_0_0M94 backChartP3_0_1M94 backChartP3_0_2M94 backChartP3_0_3M94 backChartP3_1_0M94 backChartP3_1_1M94 backChartP3_1_2M94 backChartP3_1_3M94 backChartP3_2_0M94 backChartP3_2_1M94 backChartP3_2_2M94 backChartP3_2_3M94
 ring

theorem back_column3_4M94 (c r : ℤ) :
 (backChartP3_1_0M94 c r*backChartP3_1_4M94 c r + backChartP3_1_1M94 c r*backChartP3_1_3M94 c r + backChartP3_1_2M94 c r*backChartP3_1_2M94 c r + backChartP3_1_3M94 c r*backChartP3_1_1M94 c r + backChartP3_1_4M94 c r*backChartP3_1_0M94 c r)-(backChartP3_0_0M94 c r*backChartP3_2_4M94 c r + backChartP3_0_1M94 c r*backChartP3_2_3M94 c r + backChartP3_0_2M94 c r*backChartP3_2_2M94 c r + backChartP3_0_3M94 c r*backChartP3_2_1M94 c r + backChartP3_0_4M94 c r*backChartP3_2_0M94 c r)=backChartG3_4M94 c r := by
 unfold backChartG3_4M94 backChartP3_0_0M94 backChartP3_0_1M94 backChartP3_0_2M94 backChartP3_0_3M94 backChartP3_0_4M94 backChartP3_1_0M94 backChartP3_1_1M94 backChartP3_1_2M94 backChartP3_1_3M94 backChartP3_1_4M94 backChartP3_2_0M94 backChartP3_2_1M94 backChartP3_2_2M94 backChartP3_2_3M94 backChartP3_2_4M94
 ring

theorem back_column3_5M94 (c r : ℤ) :
 (backChartP3_1_0M94 c r*backChartP3_1_5M94 c r + backChartP3_1_1M94 c r*backChartP3_1_4M94 c r + backChartP3_1_2M94 c r*backChartP3_1_3M94 c r + backChartP3_1_3M94 c r*backChartP3_1_2M94 c r + backChartP3_1_4M94 c r*backChartP3_1_1M94 c r + backChartP3_1_5M94 c r*backChartP3_1_0M94 c r)-(backChartP3_0_0M94 c r*backChartP3_2_5M94 c r + backChartP3_0_1M94 c r*backChartP3_2_4M94 c r + backChartP3_0_2M94 c r*backChartP3_2_3M94 c r + backChartP3_0_3M94 c r*backChartP3_2_2M94 c r + backChartP3_0_4M94 c r*backChartP3_2_1M94 c r + backChartP3_0_5M94 c r*backChartP3_2_0M94 c r)=backChartG3_5M94 c r := by
 unfold backChartG3_5M94 backChartP3_0_0M94 backChartP3_0_1M94 backChartP3_0_2M94 backChartP3_0_3M94 backChartP3_0_4M94 backChartP3_0_5M94 backChartP3_1_0M94 backChartP3_1_1M94 backChartP3_1_2M94 backChartP3_1_3M94 backChartP3_1_4M94 backChartP3_1_5M94 backChartP3_2_0M94 backChartP3_2_1M94 backChartP3_2_2M94 backChartP3_2_3M94 backChartP3_2_4M94 backChartP3_2_5M94
 ring

theorem back_column3_6M94 (c r : ℤ) :
 (backChartP3_1_0M94 c r*backChartP3_1_6M94 c r + backChartP3_1_1M94 c r*backChartP3_1_5M94 c r + backChartP3_1_2M94 c r*backChartP3_1_4M94 c r + backChartP3_1_3M94 c r*backChartP3_1_3M94 c r + backChartP3_1_4M94 c r*backChartP3_1_2M94 c r + backChartP3_1_5M94 c r*backChartP3_1_1M94 c r + backChartP3_1_6M94 c r*backChartP3_1_0M94 c r)-(backChartP3_0_0M94 c r*backChartP3_2_6M94 c r + backChartP3_0_1M94 c r*backChartP3_2_5M94 c r + backChartP3_0_2M94 c r*backChartP3_2_4M94 c r + backChartP3_0_3M94 c r*backChartP3_2_3M94 c r + backChartP3_0_4M94 c r*backChartP3_2_2M94 c r + backChartP3_0_5M94 c r*backChartP3_2_1M94 c r + backChartP3_0_6M94 c r*backChartP3_2_0M94 c r)=backChartG3_6M94 c r := by
 unfold backChartG3_6M94 backChartP3_0_0M94 backChartP3_0_1M94 backChartP3_0_2M94 backChartP3_0_3M94 backChartP3_0_4M94 backChartP3_0_5M94 backChartP3_0_6M94 backChartP3_1_0M94 backChartP3_1_1M94 backChartP3_1_2M94 backChartP3_1_3M94 backChartP3_1_4M94 backChartP3_1_5M94 backChartP3_1_6M94 backChartP3_2_0M94 backChartP3_2_1M94 backChartP3_2_2M94 backChartP3_2_3M94 backChartP3_2_4M94 backChartP3_2_5M94 backChartP3_2_6M94
 ring

theorem back_column3_7M94 (c r : ℤ) :
 (backChartP3_1_0M94 c r*backChartP3_1_7M94 c r + backChartP3_1_1M94 c r*backChartP3_1_6M94 c r + backChartP3_1_2M94 c r*backChartP3_1_5M94 c r + backChartP3_1_3M94 c r*backChartP3_1_4M94 c r + backChartP3_1_4M94 c r*backChartP3_1_3M94 c r + backChartP3_1_5M94 c r*backChartP3_1_2M94 c r + backChartP3_1_6M94 c r*backChartP3_1_1M94 c r + backChartP3_1_7M94 c r*backChartP3_1_0M94 c r)-(backChartP3_0_0M94 c r*backChartP3_2_7M94 c r + backChartP3_0_1M94 c r*backChartP3_2_6M94 c r + backChartP3_0_2M94 c r*backChartP3_2_5M94 c r + backChartP3_0_3M94 c r*backChartP3_2_4M94 c r + backChartP3_0_4M94 c r*backChartP3_2_3M94 c r + backChartP3_0_5M94 c r*backChartP3_2_2M94 c r + backChartP3_0_6M94 c r*backChartP3_2_1M94 c r + backChartP3_0_7M94 c r*backChartP3_2_0M94 c r)=backChartG3_7M94 c r := by
 unfold backChartG3_7M94 backChartP3_0_0M94 backChartP3_0_1M94 backChartP3_0_2M94 backChartP3_0_3M94 backChartP3_0_4M94 backChartP3_0_5M94 backChartP3_0_6M94 backChartP3_0_7M94 backChartP3_1_0M94 backChartP3_1_1M94 backChartP3_1_2M94 backChartP3_1_3M94 backChartP3_1_4M94 backChartP3_1_5M94 backChartP3_1_6M94 backChartP3_1_7M94 backChartP3_2_0M94 backChartP3_2_1M94 backChartP3_2_2M94 backChartP3_2_3M94 backChartP3_2_4M94 backChartP3_2_5M94 backChartP3_2_6M94 backChartP3_2_7M94
 ring

theorem back_column3_8M94 (c r : ℤ) :
 (backChartP3_1_1M94 c r*backChartP3_1_7M94 c r + backChartP3_1_2M94 c r*backChartP3_1_6M94 c r + backChartP3_1_3M94 c r*backChartP3_1_5M94 c r + backChartP3_1_4M94 c r*backChartP3_1_4M94 c r + backChartP3_1_5M94 c r*backChartP3_1_3M94 c r + backChartP3_1_6M94 c r*backChartP3_1_2M94 c r + backChartP3_1_7M94 c r*backChartP3_1_1M94 c r)-(backChartP3_0_1M94 c r*backChartP3_2_7M94 c r + backChartP3_0_2M94 c r*backChartP3_2_6M94 c r + backChartP3_0_3M94 c r*backChartP3_2_5M94 c r + backChartP3_0_4M94 c r*backChartP3_2_4M94 c r + backChartP3_0_5M94 c r*backChartP3_2_3M94 c r + backChartP3_0_6M94 c r*backChartP3_2_2M94 c r + backChartP3_0_7M94 c r*backChartP3_2_1M94 c r)=backChartG3_8M94 c r := by
 unfold backChartG3_8M94 backChartP3_0_1M94 backChartP3_0_2M94 backChartP3_0_3M94 backChartP3_0_4M94 backChartP3_0_5M94 backChartP3_0_6M94 backChartP3_0_7M94 backChartP3_1_1M94 backChartP3_1_2M94 backChartP3_1_3M94 backChartP3_1_4M94 backChartP3_1_5M94 backChartP3_1_6M94 backChartP3_1_7M94 backChartP3_2_1M94 backChartP3_2_2M94 backChartP3_2_3M94 backChartP3_2_4M94 backChartP3_2_5M94 backChartP3_2_6M94 backChartP3_2_7M94
 ring

theorem back_column3_9M94 (c r : ℤ) :
 (backChartP3_1_2M94 c r*backChartP3_1_7M94 c r + backChartP3_1_3M94 c r*backChartP3_1_6M94 c r + backChartP3_1_4M94 c r*backChartP3_1_5M94 c r + backChartP3_1_5M94 c r*backChartP3_1_4M94 c r + backChartP3_1_6M94 c r*backChartP3_1_3M94 c r + backChartP3_1_7M94 c r*backChartP3_1_2M94 c r)-(backChartP3_0_2M94 c r*backChartP3_2_7M94 c r + backChartP3_0_3M94 c r*backChartP3_2_6M94 c r + backChartP3_0_4M94 c r*backChartP3_2_5M94 c r + backChartP3_0_5M94 c r*backChartP3_2_4M94 c r + backChartP3_0_6M94 c r*backChartP3_2_3M94 c r + backChartP3_0_7M94 c r*backChartP3_2_2M94 c r)=backChartG3_9M94 c r := by
 unfold backChartG3_9M94 backChartP3_0_2M94 backChartP3_0_3M94 backChartP3_0_4M94 backChartP3_0_5M94 backChartP3_0_6M94 backChartP3_0_7M94 backChartP3_1_2M94 backChartP3_1_3M94 backChartP3_1_4M94 backChartP3_1_5M94 backChartP3_1_6M94 backChartP3_1_7M94 backChartP3_2_2M94 backChartP3_2_3M94 backChartP3_2_4M94 backChartP3_2_5M94 backChartP3_2_6M94 backChartP3_2_7M94
 ring

theorem back_column3_10M94 (c r : ℤ) :
 (backChartP3_1_3M94 c r*backChartP3_1_7M94 c r + backChartP3_1_4M94 c r*backChartP3_1_6M94 c r + backChartP3_1_5M94 c r*backChartP3_1_5M94 c r + backChartP3_1_6M94 c r*backChartP3_1_4M94 c r + backChartP3_1_7M94 c r*backChartP3_1_3M94 c r)-(backChartP3_0_3M94 c r*backChartP3_2_7M94 c r + backChartP3_0_4M94 c r*backChartP3_2_6M94 c r + backChartP3_0_5M94 c r*backChartP3_2_5M94 c r + backChartP3_0_6M94 c r*backChartP3_2_4M94 c r + backChartP3_0_7M94 c r*backChartP3_2_3M94 c r)=backChartG3_10M94 c r := by
 unfold backChartG3_10M94 backChartP3_0_3M94 backChartP3_0_4M94 backChartP3_0_5M94 backChartP3_0_6M94 backChartP3_0_7M94 backChartP3_1_3M94 backChartP3_1_4M94 backChartP3_1_5M94 backChartP3_1_6M94 backChartP3_1_7M94 backChartP3_2_3M94 backChartP3_2_4M94 backChartP3_2_5M94 backChartP3_2_6M94 backChartP3_2_7M94
 ring

theorem back_column3_11M94 (c r : ℤ) :
 (backChartP3_1_4M94 c r*backChartP3_1_7M94 c r + backChartP3_1_5M94 c r*backChartP3_1_6M94 c r + backChartP3_1_6M94 c r*backChartP3_1_5M94 c r + backChartP3_1_7M94 c r*backChartP3_1_4M94 c r)-(backChartP3_0_4M94 c r*backChartP3_2_7M94 c r + backChartP3_0_5M94 c r*backChartP3_2_6M94 c r + backChartP3_0_6M94 c r*backChartP3_2_5M94 c r + backChartP3_0_7M94 c r*backChartP3_2_4M94 c r)=backChartG3_11M94 c r := by
 unfold backChartG3_11M94 backChartP3_0_4M94 backChartP3_0_5M94 backChartP3_0_6M94 backChartP3_0_7M94 backChartP3_1_4M94 backChartP3_1_5M94 backChartP3_1_6M94 backChartP3_1_7M94 backChartP3_2_4M94 backChartP3_2_5M94 backChartP3_2_6M94 backChartP3_2_7M94
 ring

theorem back_column3_12M94 (c r : ℤ) :
 (backChartP3_1_5M94 c r*backChartP3_1_7M94 c r + backChartP3_1_6M94 c r*backChartP3_1_6M94 c r + backChartP3_1_7M94 c r*backChartP3_1_5M94 c r)-(backChartP3_0_5M94 c r*backChartP3_2_7M94 c r + backChartP3_0_6M94 c r*backChartP3_2_6M94 c r + backChartP3_0_7M94 c r*backChartP3_2_5M94 c r)=backChartG3_12M94 c r := by
 unfold backChartG3_12M94 backChartP3_0_5M94 backChartP3_0_6M94 backChartP3_0_7M94 backChartP3_1_5M94 backChartP3_1_6M94 backChartP3_1_7M94 backChartP3_2_5M94 backChartP3_2_6M94 backChartP3_2_7M94
 ring

attribute [local irreducible] backChartP3_0_0M94 backChartP3_0_1M94 backChartP3_0_2M94 backChartP3_0_3M94 backChartP3_0_4M94 backChartP3_0_5M94 backChartP3_0_6M94 backChartP3_0_7M94 backChartP3_1_0M94 backChartP3_1_1M94 backChartP3_1_2M94 backChartP3_1_3M94 backChartP3_1_4M94 backChartP3_1_5M94 backChartP3_1_6M94 backChartP3_1_7M94 backChartP3_2_0M94 backChartP3_2_1M94 backChartP3_2_2M94 backChartP3_2_3M94 backChartP3_2_4M94 backChartP3_2_5M94 backChartP3_2_6M94 backChartP3_2_7M94 backChartG3_0M94 backChartG3_1M94 backChartG3_2M94 backChartG3_3M94 backChartG3_4M94 backChartG3_5M94 backChartG3_6M94 backChartG3_7M94 backChartG3_8M94 backChartG3_9M94 backChartG3_10M94 backChartG3_11M94 backChartG3_12M94

theorem back_lc3M94 (c r e : ℤ) (hc : 0≤c) (hr : 0≤r) (he : 0≤e) :
 backShape3M94 (5 + 3*r + 2*c) (3 + 2*r + 1*c) e*backShape3M94 (5 + 3*r + 2*c) (3 + 2*r + 1*c) (e-2)≤
 backShape3M94 (5 + 3*r + 2*c) (3 + 2*r + 1*c) (e-1)^2 := by
 apply sub_nonneg.mp
 have hzero := back_stage3_0M94 c r e
 simp only [sub_zero] at hzero
 rw [hzero,back_stage3_1M94,back_stage3_2M94]
 have hgap : (backChartP3_1_0M94 c r*e^0 + backChartP3_1_1M94 c r*e^1 + backChartP3_1_2M94 c r*e^2 + backChartP3_1_3M94 c r*e^3 + backChartP3_1_4M94 c r*e^4 + backChartP3_1_5M94 c r*e^5 + backChartP3_1_6M94 c r*e^6 + backChartP3_1_7M94 c r*e^7)^2-(backChartP3_0_0M94 c r*e^0 + backChartP3_0_1M94 c r*e^1 + backChartP3_0_2M94 c r*e^2 + backChartP3_0_3M94 c r*e^3 + backChartP3_0_4M94 c r*e^4 + backChartP3_0_5M94 c r*e^5 + backChartP3_0_6M94 c r*e^6 + backChartP3_0_7M94 c r*e^7)*(backChartP3_2_0M94 c r*e^0 + backChartP3_2_1M94 c r*e^1 + backChartP3_2_2M94 c r*e^2 + backChartP3_2_3M94 c r*e^3 + backChartP3_2_4M94 c r*e^4 + backChartP3_2_5M94 c r*e^5 + backChartP3_2_6M94 c r*e^6 + backChartP3_2_7M94 c r*e^7)=backChartG3_0M94 c r*e^0 + backChartG3_1M94 c r*e^1 + backChartG3_2M94 c r*e^2 + backChartG3_3M94 c r*e^3 + backChartG3_4M94 c r*e^4 + backChartG3_5M94 c r*e^5 + backChartG3_6M94 c r*e^6 + backChartG3_7M94 c r*e^7 + backChartG3_8M94 c r*e^8 + backChartG3_9M94 c r*e^9 + backChartG3_10M94 c r*e^10 + backChartG3_11M94 c r*e^11 + backChartG3_12M94 c r*e^12 := by
  rw [←back_column3_0M94,←back_column3_1M94,←back_column3_2M94,←back_column3_3M94,←back_column3_4M94,←back_column3_5M94,←back_column3_6M94,←back_column3_7M94,←back_column3_8M94,←back_column3_9M94,←back_column3_10M94,←back_column3_11M94,←back_column3_12M94]
  ring
 rw [hgap]
 have h0 := backChartG3_0M94_nonneg c r hc hr
 have h1 := backChartG3_1M94_nonneg c r hc hr
 have h2 := backChartG3_2M94_nonneg c r hc hr
 have h3 := backChartG3_3M94_nonneg c r hc hr
 have h4 := backChartG3_4M94_nonneg c r hc hr
 have h5 := backChartG3_5M94_nonneg c r hc hr
 have h6 := backChartG3_6M94_nonneg c r hc hr
 have h7 := backChartG3_7M94_nonneg c r hc hr
 have h8 := backChartG3_8M94_nonneg c r hc hr
 have h9 := backChartG3_9M94_nonneg c r hc hr
 have h10 := backChartG3_10M94_nonneg c r hc hr
 have h11 := backChartG3_11M94_nonneg c r hc hr
 have h12 := backChartG3_12M94_nonneg c r hc hr
 positivity
end
end MathGKM.Markov
