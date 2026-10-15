import MarkovBackwardChamber2M94
/-! Machine-authored 94b1de05. Staged backwards third-block gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false

def backChartP2_0_0M94 (c r : ℤ) : ℤ :=
 598268160 + 1527886080*r + 1415957760*r^2 + 571253760*r^3 + 85397760*r^4 + 2026402560*c + 3665491200*c*r + 2169054720*c*r^2 + 423198720*c*r^3 + 2360977920*c^2 + 2732244480*c^2*r + 782853120*c^2*r^2 + 1141539840*c^3 + 640604160*c^3*r + 195632640*c^4

def backChartP2_0_1M94 (c r : ℤ) : ℤ :=
 641811168 + 1654197888*r + 1548051840*r^2 + 630696192*r^3 + 95121792*r^4 + 2234188992*c + 4097526528*c*r + 2452834944*c*r^2 + 483327744*c*r^3 + 2701192224*c^2 + 3166402176*c^2*r + 916953984*c^2*r^2 + 1356488448*c^3 + 769681152*c^3*r + 241142208*c^4

def backChartP2_0_2M94 (c r : ℤ) : ℤ :=
 300443136 + 779978752*r + 735106176*r^2 + 301228928*r^3 + 45658368*r^4 + 1072157184*c + 1987779136*c*r + 1200185280*c*r^2 + 238152320*c*r^3 + 1339876608*c^2 + 1588378176*c^2*r + 464006592*c^2*r^2 + 698105856*c^3 + 400157184*c^3*r + 128854656*c^4

def backChartP2_0_3M94 (c r : ℤ) : ℤ :=
 79766400 + 208091072*r + 196917056*r^2 + 80848768*r^3 + 12256384*r^4 + 290995488*c + 543664128*c*r + 330031296*c*r^2 + 65689344*c*r^3 + 374445456*c^2 + 447842304*c^2*r + 131592384*c^2*r^2 + 201980352*c^3 + 116754624*c^3*r + 38703504*c^4

def backChartP2_0_4M94 (c r : ℤ) : ℤ :=
 13009920 + 34007680*r + 32202240*r^2 + 13193600*r^3 + 1989120*r^4 + 48370560*c + 90744640*c*r + 55177920*c*r^2 + 10962560*c*r^3 + 63833280*c^2 + 76769280*c^2*r + 22599360*c^2*r^2 + 35528640*c^3 + 20650560*c^3*r + 7056000*c^4

def backChartP2_0_5M94 (c r : ℤ) : ℤ :=
 1307712 + 3413312*r + 3221120*r^2 + 1310848*r^3 + 195328*r^4 + 4938528*c + 9264192*c*r + 5616576*c*r^2 + 1107456*c*r^3 + 6654816*c^2 + 8011584*c^2*r + 2350656*c^2*r^2 + 3804192*c^3 + 2213568*c^3*r + 780192*c^4

def backChartP2_0_6M94 (c r : ℤ) : ℤ :=
 75264 + 195328*r + 182784*r^2 + 73472*r^3 + 10752*r^4 + 287616*c + 536704*c*r + 322560*c*r^2 + 62720*c*r^3 + 393792*c^2 + 471744*c^2*r + 137088*c^2*r^2 + 229824*c^3 + 133056*c^3*r + 48384*c^4

def backChartP2_0_7M94 (c r : ℤ) : ℤ :=
 1920 + 4928*r + 4544*r^2 + 1792*r^3 + 256*r^4 + 7392*c + 13632*c*r + 8064*c*r^2 + 1536*c*r^3 + 10224*c^2 + 12096*c^2*r + 3456*c^2*r^2 + 6048*c^3 + 3456*c^3*r + 1296*c^4

def backChartP2_1_0M94 (c r : ℤ) : ℤ :=
 188909280 + 476360640*r + 435254400*r^2 + 172892160*r^3 + 25482240*r^4 + 617087520*c + 1094083200*c*r + 636249600*c*r^2 + 122250240*c*r^3 + 682778880*c^2 + 775595520*c^2*r + 218695680*c^2*r^2 + 313125120*c^3 + 172892160*c^3*r + 50964480*c^4

def backChartP2_1_1M94 (c r : ℤ) : ℤ :=
 234284832 + 598411968*r + 554822400*r^2 + 224136192*r^3 + 33531648*r^4 + 792397536*c + 1433178240*c*r + 848050560*c*r^2 + 165412608*c*r^3 + 920425152*c^2 + 1063407744*c^2*r + 304275456*c^2*r^2 + 441787584*c^3 + 247322112*c^3*r + 74939136*c^4

def backChartP2_1_2M94 (c r : ℤ) : ℤ :=
 127214976 + 328444928*r + 308003584*r^2 + 125800192*r^3 + 19026560*r^4 + 444167808*c + 816376960*c*r + 489662208*c*r^2 + 96693632*c*r^3 + 538683936*c^2 + 632173248*c^2*r + 183302784*c^2*r^2 + 270615072*c^3 + 153584256*c^3*r + 47976768*c^4

def backChartP2_1_3M94 (c r : ℤ) : ℤ :=
 39365760 + 102459392*r + 96822656*r^2 + 39776128*r^3 + 6047104*r^4 + 141404928*c + 263070528*c*r + 159316416*c*r^2 + 31713024*c*r^3 + 178142496*c^2 + 211869504*c^2*r + 62080704*c^2*r^2 + 93522912*c^3 + 53747904*c^3*r + 17359104*c^4

def backChartP2_1_4M94 (c r : ℤ) : ℤ :=
 7533120 + 19698560*r + 18679360*r^2 + 7678720*r^3 + 1164800*r^4 + 27733440*c + 51997120*c*r + 31651200*c*r^2 + 6312320*c*r^3 + 36108240*c^2 + 43364160*c^2*r + 12781440*c^2*r^2 + 19743360*c^3 + 11457600*c^3*r + 3835440*c^4

def backChartP2_1_5M94 (c r : ℤ) : ℤ :=
 896448 + 2344832*r + 2219840*r^2 + 907648*r^3 + 136192*r^4 + 3368064*c + 6330240*c*r + 3850560*c*r^2 + 763392*c*r^3 + 4506768*c^2 + 5435136*c^2*r + 1600704*c^2*r^2 + 2552256*c^3 + 1487808*c^3*r + 517104*c^4

def backChartP2_1_6M94 (c r : ℤ) : ℤ :=
 61824 + 160832*r + 150976*r^2 + 60928*r^3 + 8960*r^4 + 235872*c + 441280*c*r + 266112*c*r^2 + 51968*c*r^3 + 322224*c^2 + 387072*c^2*r + 112896*c^2*r^2 + 187488*c^3 + 108864*c^3*r + 39312*c^4

def backChartP2_1_7M94 (c r : ℤ) : ℤ :=
 1920 + 4928*r + 4544*r^2 + 1792*r^3 + 256*r^4 + 7392*c + 13632*c*r + 8064*c*r^2 + 1536*c*r^3 + 10224*c^2 + 12096*c^2*r + 3456*c^2*r^2 + 6048*c^3 + 3456*c^3*r + 1296*c^4

def backChartP2_2_0M94 (c r : ℤ) : ℤ :=
 49170240 + 121443840*r + 108218880*r^2 + 41610240*r^3 + 5967360*r^4 + 152046720*c + 260305920*c*r + 146603520*c*r^2 + 27417600*c*r^3 + 154808640*c^2 + 170795520*c^2*r + 46932480*c^2*r^2 + 65802240*c^3 + 35481600*c^3*r + 9999360*c^4

def backChartP2_2_1M94 (c r : ℤ) : ℤ :=
 71944416 + 180899712*r + 164790912*r^2 + 65334528*r^3 + 9589632*r^4 + 232819776*c + 410746368*c*r + 237783168*c*r^2 + 45431040*c*r^3 + 253723872*c^2 + 286151040*c^2*r + 80136576*c^2*r^2 + 113831424*c^3 + 62376960*c^3*r + 18079872*c^4

def backChartP2_2_2M94 (c r : ℤ) : ℤ :=
 46238976 + 118118784*r + 109582592*r^2 + 44343936*r^3 + 6641152*r^4 + 156055872*c + 282178624*c*r + 166936896*c*r^2 + 32541824*c*r^3 + 180456864*c^2 + 207950400*c^2*r + 59363136*c^2*r^2 + 85669248*c^3 + 47768448*c^3*r + 14303520*c^4

def backChartP2_2_3M94 (c r : ℤ) : ℤ :=
 17028480 + 44069312*r + 41443136*r^2 + 16981888*r^3 + 2579584*r^4 + 59693088*c + 110035968*c*r + 66177216*c*r^2 + 13112064*c*r^3 + 72690576*c^2 + 85446144*c^2*r + 24825024*c^2*r^2 + 36533952*c^3 + 20739264*c^3*r + 6447504*c^4

def backChartP2_2_4M94 (c r : ℤ) : ℤ :=
 3911040 + 10214400*r + 9685760*r^2 + 3991680*r^3 + 609280*r^4 + 14172480*c + 26488000*c*r + 16107840*c*r^2 + 3221120*c*r^3 + 18049920*c^2 + 21571200*c^2*r + 6350400*c^2*r^2 + 9582720*c^3 + 5530560*c^3*r + 1794240*c^4

def backChartP2_2_5M94 (c r : ℤ) : ℤ :=
 565824 + 1483328*r + 1409408*r^2 + 579712*r^3 + 87808*r^4 + 2108064*c + 3968832*c*r + 2423232*c*r^2 + 483840*c*r^3 + 2788128*c^2 + 3366720*c^2*r + 995904*c^2*r^2 + 1554336*c^3 + 907200*c^3*r + 308448*c^4

def backChartP2_2_6M94 (c r : ℤ) : ℤ :=
 48384 + 126336*r + 119168*r^2 + 48384*r^3 + 7168*r^4 + 184128*c + 345856*c*r + 209664*c*r^2 + 41216*c*r^3 + 250656*c^2 + 302400*c^2*r + 88704*c^2*r^2 + 145152*c^3 + 84672*c^3*r + 30240*c^4

def backChartP2_2_7M94 (c r : ℤ) : ℤ :=
 1920 + 4928*r + 4544*r^2 + 1792*r^3 + 256*r^4 + 7392*c + 13632*c*r + 8064*c*r^2 + 1536*c*r^3 + 10224*c^2 + 12096*c^2*r + 3456*c^2*r^2 + 6048*c^3 + 3456*c^3*r + 1296*c^4

def backChartG2_0M94 (c r : ℤ) : ℤ :=
 6269727058560000 + 32195383099084800*r + 71447404241203200*r^2 + 89709761820672000*r^3 + 69838666452172800*r^4 + 34554356534476800*r^5 + 10613027458252800*r^6 + 1849060904140800*r^7 + 139745378304000*r^8 + 42543706580121600*c + 186907349983334400*c*r + 348106344555110400*c*r^2 + 357087616310476800*c*r^3 + 218195302581043200*c*r^4 + 79458623845171200*c*r^5 + 15963396135321600*c*r^6 + 1363639173120000*c*r^7 + 121948746766156800*c^2 + 449229202136064000*c^2*r + 683109103457894400*c^2*r^2 + 549838679968972800*c^2*r^3 + 247289069441433600*c^2*r^4 + 58925092139827200*c^2*r^5 + 5808244506624000*c^2*r^6 + 192792387387801600*c^3 + 579444260213145600*c^3*r + 691134649970688000*c^3*r^2 + 409468901887180800*c^3*r^3 + 120549006331084800*c^3*r^4 + 14104073797632000*c^3*r^5 + 183882933474508800*c^4 + 433319838658560000*c^4*r + 380446426954137600*c^4*r^2 + 147612503369318400*c^4*r^3 + 21355226726400000*c^4*r^4 + 108403630807449600*c^5 + 188052943041331200*c^5*r + 108184147977830400*c^5*r^2 + 20644859805696000*c^5*r^3 + 38632512289996800*c^6 + 43938678118809600*c^6*r + 12443906506752000*c^6*r^2 + 7628784087859200*c^7 + 4275727368192000*c^7*r + 641177026560000*c^8

theorem backChartG2_0M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_0M94 c r := by
 unfold backChartG2_0M94
 positivity

def backChartG2_1M94 (c r : ℤ) : ℤ :=
 13917095308247040 + 71868563523993600*r + 160369152718602240*r^2 + 202360445779968000*r^3 + 158205015283875840*r^4 + 78565633660846080*r^5 + 24219550794055680*r^6 + 4238535075102720*r^7 + 322363935129600*r^8 + 96013088249057280*c + 424481350719283200*c*r + 795279975621304320*c*r^2 + 820114736770990080*c*r^3 + 503484471246274560*c*r^4 + 184186663995801600*c*r^5 + 37193518249574400*c*r^6 + 3198440654438400*c*r^7 + 280322462706370560*c^2 + 1039671807891333120*c^2*r + 1590858410865131520*c^2*r^2 + 1287764808404336640*c^2*r^3 + 582305768703590400*c^2*r^4 + 139554984678359040*c^2*r^5 + 13852257295564800*c^2*r^6 + 452097994051952640*c^3 + 1368533738374225920*c^3*r + 1643127708917882880*c^3*r^2 + 979565150935203840*c^3*r^3 + 290225893391400960*c^3*r^4 + 34202877817651200*c^3*r^5 + 440493909347358720*c^4 + 1045845972662722560*c^4*r + 924714044152012800*c^4*r^2 + 361281448006778880*c^4*r^3 + 52658524348416000*c^4*r^4 + 265639597985341440*c^5 + 464439077428838400*c^5*r + 269188530841681920*c^5*r^2 + 51763683247718400*c^5*r^3 + 96954253507399680*c^6 + 111154801993482240*c^6*r + 31726291916390400*c^6*r^2 + 19621850928906240*c^7 + 11084622977433600*c^7*r + 1690187356569600*c^8

theorem backChartG2_1M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_1M94 c r := by
 unfold backChartG2_1M94
 positivity

def backChartG2_2M94 (c r : ℤ) : ℤ :=
 14342663688708096 + 74423636918120448*r + 166828433117294592*r^2 + 211355866377363456*r^3 + 165792518663159808*r^4 + 82568611308847104*r^5 + 25523035925151744*r^6 + 4480804540219392*r^7 + 342267750236160*r^8 + 100488424110004224*c + 446685209123069952*c*r + 841094068560334848*c*r^2 + 871212844432982016*c*r^3 + 536949038691459072*c*r^4 + 197154908825075712*c*r^5 + 39970501804670976*c*r^6 + 3454131881410560*c*r^7 + 298486229070339072*c^2 + 1113674381068161024*c^2*r + 1713442501391265792*c^2*r^2 + 1393861407261474816*c^2*r^3 + 633204845555982336*c^2*r^4 + 152474413209108480*c^2*r^5 + 15217097728573440*c^2*r^6 + 490605838674481152*c^3 + 1494732669037203456*c^3*r + 1805347900172759040*c^3*r^2 + 1082256260013121536*c^3*r^3 + 322413563798323200*c^3*r^4 + 38221984624803840*c^3*r^5 + 487973725814227968*c^4 + 1166629479278505984*c^4*r + 1038166052874080256*c^4*r^2 + 408125187369123840*c^4*r^3 + 59866823839334400*c^4*r^4 + 300885417119637504*c^5 + 529917628505997312*c^5*r + 309256238232281088*c^5*r^2 + 59873726540759040*c^5*r^3 + 112440480652007424*c^6 + 129881167666274304*c^6*r + 37337884697272320*c^6*r^2 + 23321360715448320*c^7 + 13273806680064000*c^7*r + 2059576444477440*c^8

theorem backChartG2_2M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_2M94 c r := by
 unfold backChartG2_2M94
 positivity

def backChartG2_3M94 (c r : ℤ) : ℤ :=
 9080565733048320 + 47303481675792384*r + 106417009524424704*r^2 + 135233804116819968*r^3 + 106341138530844672*r^4 + 53062646666330112*r^5 + 16429238397272064*r^6 + 2889196885671936*r^7 + 221177159024640*r^8 + 64537466693124096*c + 288174741021597696*c*r + 544852144474767360*c*r^2 + 566368265562193920*c*r^3 + 350121900652511232*c*r^4 + 128900323142320128*c*r^5 + 26201422075379712*c*r^6 + 2270977075347456*c*r^7 + 194806729613905920*c^2 + 730559473968070656*c^2*r + 1129208910700351488*c^2*r^2 + 922364941091069952*c^2*r^3 + 420560035507691520*c^2*r^4 + 101627381677473792*c^2*r^5 + 10180160759021568*c^2*r^6 + 325982860253761536*c^3 + 998828864018743296*c^3*r + 1212624986543480832*c^3*r^2 + 730344212720640000*c^3*r^3 + 218534331847802880*c^3*r^4 + 26021596616687616*c^3*r^5 + 330704219098036224*c^4 + 795548857125076992*c^4*r + 711958078309847040*c^4*r^2 + 281355868309340160*c^4*r^3 + 41481380229488640*c^4*r^4 + 208348082408632320*c^5 + 369370517063417856*c^5*r + 216870334243282944*c^5*r^2 + 42227691231559680*c^5*r^3 + 79674318434414592*c^6 + 92663550491516928*c^6*r + 26807236582662144*c^6*r^2 + 16930063974555648*c^7 + 9702548221427712*c^7*r + 1532859920492544*c^8

theorem backChartG2_3M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_3M94 c r := by
 unfold backChartG2_3M94
 positivity

def backChartG2_4M94 (c r : ℤ) : ℤ :=
 3935853355069440 + 20563446603141120*r + 46380889737699328*r^2 + 59063275078320128*r^3 + 46513403695087616*r^4 + 23230317478559744*r^5 + 7195515516944384*r^6 + 1265501312811008*r^7 + 96878168031232*r^8 + 28344325663180800*c + 127011251238703104*c*r + 240889221290704896*c*r^2 + 251047044701085696*c*r^3 + 155505091810467840*c*r^4 + 57336017838145536*c*r^5 + 11667691475779584*c*r^6 + 1012232883830784*c*r^7 + 86845146679646208*c^2 + 327036397211080704*c^2*r + 507345599332540416*c^2*r^2 + 415698585093550080*c^2*r^3 + 190027513760931840*c^2*r^4 + 46017470155603968*c^2*r^5 + 4618173885136896*c^2*r^6 + 147786592650826752*c^3 + 454978000233179136*c^3*r + 554684344468531200*c^3*r^2 + 335288098326343680*c^3*r^3 + 100637834441195520*c^3*r^4 + 12016092137914368*c^3*r^5 + 152759155056915456*c^4 + 369423810980904960*c^4*r + 332150653274388480*c^4*r^2 + 131796857435443200*c^4*r^3 + 19501211269693440*c^4*r^4 + 98238753818827776*c^5 + 175154749626157056*c^5*r + 103355731455363072*c^5*r^2 + 20213886143582208*c^5*r^3 + 38410186710196224*c^6 + 44937239116363776*c^6*r + 13068119692486656*c^6*r^2 + 8355961594294272*c^7 + 4817472972447744*c^7*r + 775302898793472*c^8

theorem backChartG2_4M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_4M94 c r := by
 unfold backChartG2_4M94
 positivity

def backChartG2_5M94 (c r : ℤ) : ℤ :=
 1230952795914240 + 6443562553344000*r + 14555831380500480*r^2 + 18555050940088320*r^3 + 14618455783464960*r^4 + 7299027495567360*r^5 + 2258723984670720*r^6 + 396619373445120*r^7 + 30296417894400*r^8 + 8972658931138560*c + 40305931202396160*c*r + 76600252104499200*c*r^2 + 79948625856798720*c*r^3 + 49563825085931520*c*r^4 + 18277636363714560*c*r^5 + 3717599961169920*c*r^6 + 322161680547840*c*r^7 + 27873154555545600*c^2 + 105284922091130880*c^2*r + 163751201088491520*c^2*r^2 + 134431900245135360*c^2*r^3 + 61530668634193920*c^2*r^4 + 14909164529172480*c^2*r^5 + 1496135038648320*c^2*r^6 + 48178633908787200*c^3 + 148864397955840000*c^3*r + 182040949447096320*c^3*r^2 + 110298382274949120*c^3*r^3 + 33161341140910080*c^3*r^4 + 3963235575398400*c^3*r^5 + 50678728039134720*c^4 + 123068194280478720*c^4*r + 111034241763379200*c^4*r^2 + 44177819611484160*c^4*r^3 + 6549577535692800*c^4*r^4 + 33227868640296960*c^5 + 59512903721994240*c^5*r + 35249344064686080*c^5*r^2 + 6914251982131200*c^5*r^3 + 13267866927651840*c^6 + 15596582057441280*c^6*r + 4553341833922560*c^6*r^2 + 2951995498260480*c^7 + 1710154906951680*c^7*r + 280454660236800*c^8

theorem backChartG2_5M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_5M94 c r := by
 unfold backChartG2_5M94
 positivity

def backChartG2_6M94 (c r : ℤ) : ℤ :=
 284927870803968 + 1492708131446784*r + 3373400504692736*r^2 + 4299751400562688*r^3 + 3384904610934784*r^4 + 1687489633779712*r^5 + 520956565061632*r^6 + 91175231881216*r^7 + 6934846177280*r^8 + 2099905171402752*c + 9445475170553856*c*r + 17966404118605824*c*r^2 + 18756715336654848*c*r^3 + 11622819190112256*c*r^4 + 4280666250018816*c*r^5 + 868779037851648*c*r^6 + 75051492311040*c*r^7 + 6606030851030016*c^2 + 24999394605115392*c^2*r + 38933148596299776*c^2*r^2 + 31982461627834368*c^2*r^3 + 14636247611424768*c^2*r^4 + 3542716147138560*c^2*r^5 + 354801456414720*c^2*r^6 + 11583390962820096*c^3 + 35876212461508608*c^3*r + 43947753737932800*c^3*r^2 + 26653244768575488*c^3*r^3 + 8013930435624960*c^3*r^4 + 956936770191360*c^3*r^5 + 12382741496934144*c^4 + 30155707318689792*c^4*r + 27263337189193728*c^4*r^2 + 10860344047042560*c^4*r^3 + 1610479322726400*c^4*r^4 + 8265770021117952*c^5 + 14851656747841536*c^5*r + 8816836444545024*c^5*r^2 + 1731750164766720*c^5*r^3 + 3365962534835712*c^6 + 3970190329362432*c^6*r + 1161870502625280*c^6*r^2 + 764920650009600*c^7 + 444671069552640*c^7*r + 74324051746560*c^8

theorem backChartG2_6M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_6M94 c r := by
 unfold backChartG2_6M94
 positivity

def backChartG2_7M94 (c r : ℤ) : ℤ :=
 49186229944320 + 257601593475072*r + 581716002373632*r^2 + 740462441693184*r^3 + 581714724519936*r^4 + 289159255719936*r^5 + 88920467177472*r^6 + 15484556279808*r^7 + 1170423152640*r^8 + 366128240099328*c + 1647054714912768*c*r + 3131640486051840*c*r^2 + 3265928211087360*c*r^3 + 2019996299575296*c*r^4 + 741874377129984*c*r^5 + 149983306776576*c*r^6 + 12891029372928*c*r^7 + 1165023844024320*c^2 + 4411315958611968*c^2*r + 6869731513688064*c^2*r^2 + 5638768510427136*c^2*r^3 + 2576095883182080*c^2*r^4 + 621839826026496*c^2*r^5 + 62034503860224*c^2*r^6 + 2069578611007488*c^3 + 6416293953097728*c^3*r + 7862041776992256*c^3*r^2 + 4765325985423360*c^3*r^3 + 1430523676753920*c^3*r^4 + 170352724082688*c^3*r^5 + 2245132394330112*c^4 + 5475079222050816*c^4*r + 4952577921822720*c^4*r^2 + 1971972668252160*c^4*r^3 + 291969710161920*c^4*r^4 + 1523440226488320*c^5 + 2741820967968768*c^5*r + 1628846595919872*c^5*r^2 + 319804049940480*c^5*r^3 + 631669774934016*c^6 + 746436314824704*c^6*r + 218610944520192*c^6*r^2 + 146392009150464*c^7 + 85264381956096*c^7*r + 14526843512832*c^8

theorem backChartG2_7M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_7M94 c r := by
 unfold backChartG2_7M94
 positivity

def backChartG2_8M94 (c r : ℤ) : ℤ :=
 6284551311360 + 32865530019840*r + 74069113380864*r^2 + 94032975396864*r^3 + 73619794956288*r^4 + 36435272466432*r^5 + 11143337705472*r^6 + 1927541489664*r^7 + 144522018816*r^8 + 47199257763840*c + 212085732483072*c*r + 402550316679168*c*r^2 + 418774831792128*c*r^3 + 258146202746880*c*r^4 + 94392233607168*c*r^5 + 18976814825472*c*r^6 + 1619794132992*c*r^7 + 151732927309824*c^2 + 574063690862592*c^2*r + 892654929266688*c^2*r^2 + 731000486522880*c^2*r^3 + 332854824960000*c^2*r^4 + 79989772713984*c^2*r^5 + 7933978902528*c^2*r^6 + 272704530180096*c^3 + 845047459565568*c^3*r + 1034136002672640*c^3*r^2 + 625416867532800*c^3*r^3 + 187123718799360*c^3*r^4 + 22181870075904*c^3*r^5 + 299762725425408*c^4 + 730861554769920*c^4*r + 660377570549760*c^4*r^2 + 262371765841920*c^4*r^3 + 38715545272320*c^4*r^4 + 206428167042048*c^5 + 371523903787008*c^5*r + 220488327714816*c^5*r^2 + 43195486408704*c^5*r^3 + 87002141409792*c^6 + 102824455200768*c^6*r + 30084474083328*c^6*r^2 + 20527237334016*c^7 + 11958158241792*c^7*r + 2076846863616*c^8

theorem backChartG2_8M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_8M94 c r := by
 unfold backChartG2_8M94
 positivity

def backChartG2_9M94 (c r : ℤ) : ℤ :=
 579586129920 + 3022929100800*r + 6790492692480*r^2 + 8586210017280*r^3 + 6689537433600*r^4 + 3291286978560*r^5 + 999540326400*r^6 + 171460853760*r^7 + 12730368000*r^8 + 4387311452160*c + 19665557667840*c*r + 37209246842880*c*r^2 + 38556065587200*c*r^3 + 23650629918720*c*r^4 + 8596021002240*c*r^5 + 1715630407680*c*r^6 + 145174364160*c*r^7 + 14232029091840*c^2 + 53724180787200*c^2*r + 83288386191360*c^2*r^2 + 67938264576000*c^2*r^3 + 30781318471680*c^2*r^4 + 7351519150080*c^2*r^5 + 723693895680*c^2*r^6 + 25843586549760*c^3 + 79919178823680*c^3*r + 97517679974400*c^3*r^2 + 58744976855040*c^3*r^3 + 17487161180160*c^3*r^4 + 2059721932800*c^3*r^5 + 28740837404160*c^4 + 69942556293120*c^4*r + 63017711769600*c^4*r^2 + 24938118696960*c^4*r^3 + 3660643123200*c^4*r^4 + 20052593971200*c^5 + 36027115407360*c^5*r + 21320593459200*c^5*r^2 + 4159959552000*c^5*r^3 + 8575339207680*c^6 + 10117913057280*c^6*r + 2951828490240*c^6*r^2 + 2055996794880*c^7 + 1195727339520*c^7*r + 211696934400*c^8

theorem backChartG2_9M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_9M94 c r := by
 unfold backChartG2_9M94
 positivity

def backChartG2_10M94 (c r : ℤ) : ℤ :=
 36625268736 + 190280122368*r + 425459535872*r^2 + 535045267456*r^3 + 414196830208*r^4 + 202271555584*r^5 + 60899098624*r^6 + 10343022592*r^7 + 759234560*r^8 + 279140327424*c + 1246422331392*c*r + 2347504201728*c*r^2 + 2419100737536*c*r^3 + 1474227535872*c*r^4 + 531715817472*c*r^5 + 105174859776*c*r^6 + 8808038400*c*r^7 + 912615846912*c^2 + 3432101750784*c^2*r + 5296309573632*c^2*r^2 + 4296110063616*c^2*r^3 + 1933468164096*c^2*r^4 + 458117775360*c^2*r^5 + 44680151040*c^2*r^6 + 1672045949952*c^3 + 5151655950336*c^3*r + 6257088552960*c^3*r^2 + 3747892248576*c^3*r^3 + 1108001341440*c^3*r^4 + 129436876800*c^3*r^5 + 1878380921088*c^4 + 4554595713024*c^4*r + 4084578441216*c^4*r^2 + 1607006822400*c^4*r^3 + 234217267200*c^4*r^4 + 1325538514944*c^5 + 2372941412352*c^5*r + 1397660479488*c^5*r^2 + 271074263040*c^5*r^3 + 574102577664*c^6 + 674932414464*c^6*r + 195955200000*c^6*r^2 + 139598484480*c^7 + 80890306560*c^7*r + 14598662400*c^8

theorem backChartG2_10M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_10M94 c r := by
 unfold backChartG2_10M94
 positivity

def backChartG2_11M94 (c r : ℤ) : ℤ :=
 1424424960 + 7361593344*r + 16360587264*r^2 + 20431208448*r^3 + 15690350592*r^4 + 7592804352*r^5 + 2262564864*r^6 + 379846656*r^7 + 27525120*r^8 + 10918526976*c + 48495476736*c*r + 90772684800*c*r^2 + 92873195520*c*r^3 + 56133353472*c*r^4 + 20056178688*c*r^5 + 3925082112*c*r^6 + 324796416*c*r^7 + 35931893760*c^2 + 134407397376*c^2*r + 206109646848*c^2*r^2 + 165962022912*c^2*r^3 + 74059776000*c^2*r^4 + 17377984512*c^2*r^5 + 1676279808*c^2*r^6 + 66327883776*c^3 + 203254603776*c^3*r + 245285978112*c^3*r^2 + 145817763840*c^3*r^3 + 42732748800*c^3*r^4 + 4942135296*c^3*r^5 + 75149835264*c^4 + 181221691392*c^4*r + 161455472640*c^4*r^2 + 63030804480*c^4*r^3 + 9103933440*c^4*r^4 + 53543669760*c^5 + 95319576576*c^5*r + 55766237184*c^5*r^2 + 10729635840*c^5*r^3 + 23441467392*c^6 + 27402375168*c^6*r + 7900913664*c^6*r^2 + 5768921088*c^7 + 3323400192*c^7*r + 611380224*c^8

theorem backChartG2_11M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_11M94 c r := by
 unfold backChartG2_11M94
 positivity

def backChartG2_12M94 (c r : ℤ) : ℤ :=
 25804800 + 132464640*r + 292139008*r^2 + 361668608*r^3 + 275050496*r^4 + 131661824*r^5 + 38764544*r^6 + 6422528*r^7 + 458752*r^8 + 198696960*c + 876417024*c*r + 1627508736*c*r^2 + 1650302976*c*r^3 + 987463680*c*r^4 + 348880896*c*r^5 + 67436544*c*r^6 + 5505024*c*r^7 + 657312768*c^2 + 2441263104*c^2*r + 3713181696*c^2*r^2 + 2962391040*c^2*r^3 + 1308303360*c^2*r^4 + 303464448*c^2*r^5 + 28901376*c^2*r^6 + 1220631552*c^3 + 3713181696*c^3*r + 4443586560*c^3*r^2 + 2616606720*c^3*r^3 + 758661120*c^3*r^4 + 86704128*c^3*r^5 + 1392443136*c^4 + 3332689920*c^4*r + 2943682560*c^4*r^2 + 1137991680*c^4*r^3 + 162570240*c^4*r^4 + 999806976*c^5 + 1766209536*c^5*r + 1024192512*c^5*r^2 + 195084288*c^5*r^3 + 441552384*c^6 + 512096256*c^6*r + 146313216*c^6*r^2 + 109734912*c^7 + 62705664*c^7*r + 11757312*c^8

theorem backChartG2_12M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_12M94 c r := by
 unfold backChartG2_12M94
 positivity

def backChartG2_13M94 (c r : ℤ) : ℤ :=
 0

theorem backChartG2_13M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_13M94 c r := by
 unfold backChartG2_13M94
 positivity

def backChartG2_14M94 (c r : ℤ) : ℤ :=
 0

theorem backChartG2_14M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG2_14M94 c r := by
 unfold backChartG2_14M94
 positivity

theorem back_stage2_0M94 (c r e : ℤ) :
 backShape2M94 (5 + 2*r + 3*c) (2 + 1*r + 1*c) (e-0)=backChartP2_0_0M94 c r*e^0 + backChartP2_0_1M94 c r*e^1 + backChartP2_0_2M94 c r*e^2 + backChartP2_0_3M94 c r*e^3 + backChartP2_0_4M94 c r*e^4 + backChartP2_0_5M94 c r*e^5 + backChartP2_0_6M94 c r*e^6 + backChartP2_0_7M94 c r*e^7 := by
 unfold backShape2M94 backChartP2_0_0M94 backChartP2_0_1M94 backChartP2_0_2M94 backChartP2_0_3M94 backChartP2_0_4M94 backChartP2_0_5M94 backChartP2_0_6M94 backChartP2_0_7M94
 ring

theorem back_stage2_1M94 (c r e : ℤ) :
 backShape2M94 (5 + 2*r + 3*c) (2 + 1*r + 1*c) (e-1)=backChartP2_1_0M94 c r*e^0 + backChartP2_1_1M94 c r*e^1 + backChartP2_1_2M94 c r*e^2 + backChartP2_1_3M94 c r*e^3 + backChartP2_1_4M94 c r*e^4 + backChartP2_1_5M94 c r*e^5 + backChartP2_1_6M94 c r*e^6 + backChartP2_1_7M94 c r*e^7 := by
 unfold backShape2M94 backChartP2_1_0M94 backChartP2_1_1M94 backChartP2_1_2M94 backChartP2_1_3M94 backChartP2_1_4M94 backChartP2_1_5M94 backChartP2_1_6M94 backChartP2_1_7M94
 ring

theorem back_stage2_2M94 (c r e : ℤ) :
 backShape2M94 (5 + 2*r + 3*c) (2 + 1*r + 1*c) (e-2)=backChartP2_2_0M94 c r*e^0 + backChartP2_2_1M94 c r*e^1 + backChartP2_2_2M94 c r*e^2 + backChartP2_2_3M94 c r*e^3 + backChartP2_2_4M94 c r*e^4 + backChartP2_2_5M94 c r*e^5 + backChartP2_2_6M94 c r*e^6 + backChartP2_2_7M94 c r*e^7 := by
 unfold backShape2M94 backChartP2_2_0M94 backChartP2_2_1M94 backChartP2_2_2M94 backChartP2_2_3M94 backChartP2_2_4M94 backChartP2_2_5M94 backChartP2_2_6M94 backChartP2_2_7M94
 ring

theorem back_column2_0M94 (c r : ℤ) :
 (backChartP2_1_0M94 c r*backChartP2_1_0M94 c r)-(backChartP2_0_0M94 c r*backChartP2_2_0M94 c r)=backChartG2_0M94 c r := by
 unfold backChartG2_0M94 backChartP2_0_0M94 backChartP2_1_0M94 backChartP2_2_0M94
 ring

theorem back_column2_1M94 (c r : ℤ) :
 (backChartP2_1_0M94 c r*backChartP2_1_1M94 c r + backChartP2_1_1M94 c r*backChartP2_1_0M94 c r)-(backChartP2_0_0M94 c r*backChartP2_2_1M94 c r + backChartP2_0_1M94 c r*backChartP2_2_0M94 c r)=backChartG2_1M94 c r := by
 unfold backChartG2_1M94 backChartP2_0_0M94 backChartP2_0_1M94 backChartP2_1_0M94 backChartP2_1_1M94 backChartP2_2_0M94 backChartP2_2_1M94
 ring

theorem back_column2_2M94 (c r : ℤ) :
 (backChartP2_1_0M94 c r*backChartP2_1_2M94 c r + backChartP2_1_1M94 c r*backChartP2_1_1M94 c r + backChartP2_1_2M94 c r*backChartP2_1_0M94 c r)-(backChartP2_0_0M94 c r*backChartP2_2_2M94 c r + backChartP2_0_1M94 c r*backChartP2_2_1M94 c r + backChartP2_0_2M94 c r*backChartP2_2_0M94 c r)=backChartG2_2M94 c r := by
 unfold backChartG2_2M94 backChartP2_0_0M94 backChartP2_0_1M94 backChartP2_0_2M94 backChartP2_1_0M94 backChartP2_1_1M94 backChartP2_1_2M94 backChartP2_2_0M94 backChartP2_2_1M94 backChartP2_2_2M94
 ring

theorem back_column2_3M94 (c r : ℤ) :
 (backChartP2_1_0M94 c r*backChartP2_1_3M94 c r + backChartP2_1_1M94 c r*backChartP2_1_2M94 c r + backChartP2_1_2M94 c r*backChartP2_1_1M94 c r + backChartP2_1_3M94 c r*backChartP2_1_0M94 c r)-(backChartP2_0_0M94 c r*backChartP2_2_3M94 c r + backChartP2_0_1M94 c r*backChartP2_2_2M94 c r + backChartP2_0_2M94 c r*backChartP2_2_1M94 c r + backChartP2_0_3M94 c r*backChartP2_2_0M94 c r)=backChartG2_3M94 c r := by
 unfold backChartG2_3M94 backChartP2_0_0M94 backChartP2_0_1M94 backChartP2_0_2M94 backChartP2_0_3M94 backChartP2_1_0M94 backChartP2_1_1M94 backChartP2_1_2M94 backChartP2_1_3M94 backChartP2_2_0M94 backChartP2_2_1M94 backChartP2_2_2M94 backChartP2_2_3M94
 ring

theorem back_column2_4M94 (c r : ℤ) :
 (backChartP2_1_0M94 c r*backChartP2_1_4M94 c r + backChartP2_1_1M94 c r*backChartP2_1_3M94 c r + backChartP2_1_2M94 c r*backChartP2_1_2M94 c r + backChartP2_1_3M94 c r*backChartP2_1_1M94 c r + backChartP2_1_4M94 c r*backChartP2_1_0M94 c r)-(backChartP2_0_0M94 c r*backChartP2_2_4M94 c r + backChartP2_0_1M94 c r*backChartP2_2_3M94 c r + backChartP2_0_2M94 c r*backChartP2_2_2M94 c r + backChartP2_0_3M94 c r*backChartP2_2_1M94 c r + backChartP2_0_4M94 c r*backChartP2_2_0M94 c r)=backChartG2_4M94 c r := by
 unfold backChartG2_4M94 backChartP2_0_0M94 backChartP2_0_1M94 backChartP2_0_2M94 backChartP2_0_3M94 backChartP2_0_4M94 backChartP2_1_0M94 backChartP2_1_1M94 backChartP2_1_2M94 backChartP2_1_3M94 backChartP2_1_4M94 backChartP2_2_0M94 backChartP2_2_1M94 backChartP2_2_2M94 backChartP2_2_3M94 backChartP2_2_4M94
 ring

theorem back_column2_5M94 (c r : ℤ) :
 (backChartP2_1_0M94 c r*backChartP2_1_5M94 c r + backChartP2_1_1M94 c r*backChartP2_1_4M94 c r + backChartP2_1_2M94 c r*backChartP2_1_3M94 c r + backChartP2_1_3M94 c r*backChartP2_1_2M94 c r + backChartP2_1_4M94 c r*backChartP2_1_1M94 c r + backChartP2_1_5M94 c r*backChartP2_1_0M94 c r)-(backChartP2_0_0M94 c r*backChartP2_2_5M94 c r + backChartP2_0_1M94 c r*backChartP2_2_4M94 c r + backChartP2_0_2M94 c r*backChartP2_2_3M94 c r + backChartP2_0_3M94 c r*backChartP2_2_2M94 c r + backChartP2_0_4M94 c r*backChartP2_2_1M94 c r + backChartP2_0_5M94 c r*backChartP2_2_0M94 c r)=backChartG2_5M94 c r := by
 unfold backChartG2_5M94 backChartP2_0_0M94 backChartP2_0_1M94 backChartP2_0_2M94 backChartP2_0_3M94 backChartP2_0_4M94 backChartP2_0_5M94 backChartP2_1_0M94 backChartP2_1_1M94 backChartP2_1_2M94 backChartP2_1_3M94 backChartP2_1_4M94 backChartP2_1_5M94 backChartP2_2_0M94 backChartP2_2_1M94 backChartP2_2_2M94 backChartP2_2_3M94 backChartP2_2_4M94 backChartP2_2_5M94
 ring

theorem back_column2_6M94 (c r : ℤ) :
 (backChartP2_1_0M94 c r*backChartP2_1_6M94 c r + backChartP2_1_1M94 c r*backChartP2_1_5M94 c r + backChartP2_1_2M94 c r*backChartP2_1_4M94 c r + backChartP2_1_3M94 c r*backChartP2_1_3M94 c r + backChartP2_1_4M94 c r*backChartP2_1_2M94 c r + backChartP2_1_5M94 c r*backChartP2_1_1M94 c r + backChartP2_1_6M94 c r*backChartP2_1_0M94 c r)-(backChartP2_0_0M94 c r*backChartP2_2_6M94 c r + backChartP2_0_1M94 c r*backChartP2_2_5M94 c r + backChartP2_0_2M94 c r*backChartP2_2_4M94 c r + backChartP2_0_3M94 c r*backChartP2_2_3M94 c r + backChartP2_0_4M94 c r*backChartP2_2_2M94 c r + backChartP2_0_5M94 c r*backChartP2_2_1M94 c r + backChartP2_0_6M94 c r*backChartP2_2_0M94 c r)=backChartG2_6M94 c r := by
 unfold backChartG2_6M94 backChartP2_0_0M94 backChartP2_0_1M94 backChartP2_0_2M94 backChartP2_0_3M94 backChartP2_0_4M94 backChartP2_0_5M94 backChartP2_0_6M94 backChartP2_1_0M94 backChartP2_1_1M94 backChartP2_1_2M94 backChartP2_1_3M94 backChartP2_1_4M94 backChartP2_1_5M94 backChartP2_1_6M94 backChartP2_2_0M94 backChartP2_2_1M94 backChartP2_2_2M94 backChartP2_2_3M94 backChartP2_2_4M94 backChartP2_2_5M94 backChartP2_2_6M94
 ring

theorem back_column2_7M94 (c r : ℤ) :
 (backChartP2_1_0M94 c r*backChartP2_1_7M94 c r + backChartP2_1_1M94 c r*backChartP2_1_6M94 c r + backChartP2_1_2M94 c r*backChartP2_1_5M94 c r + backChartP2_1_3M94 c r*backChartP2_1_4M94 c r + backChartP2_1_4M94 c r*backChartP2_1_3M94 c r + backChartP2_1_5M94 c r*backChartP2_1_2M94 c r + backChartP2_1_6M94 c r*backChartP2_1_1M94 c r + backChartP2_1_7M94 c r*backChartP2_1_0M94 c r)-(backChartP2_0_0M94 c r*backChartP2_2_7M94 c r + backChartP2_0_1M94 c r*backChartP2_2_6M94 c r + backChartP2_0_2M94 c r*backChartP2_2_5M94 c r + backChartP2_0_3M94 c r*backChartP2_2_4M94 c r + backChartP2_0_4M94 c r*backChartP2_2_3M94 c r + backChartP2_0_5M94 c r*backChartP2_2_2M94 c r + backChartP2_0_6M94 c r*backChartP2_2_1M94 c r + backChartP2_0_7M94 c r*backChartP2_2_0M94 c r)=backChartG2_7M94 c r := by
 unfold backChartG2_7M94 backChartP2_0_0M94 backChartP2_0_1M94 backChartP2_0_2M94 backChartP2_0_3M94 backChartP2_0_4M94 backChartP2_0_5M94 backChartP2_0_6M94 backChartP2_0_7M94 backChartP2_1_0M94 backChartP2_1_1M94 backChartP2_1_2M94 backChartP2_1_3M94 backChartP2_1_4M94 backChartP2_1_5M94 backChartP2_1_6M94 backChartP2_1_7M94 backChartP2_2_0M94 backChartP2_2_1M94 backChartP2_2_2M94 backChartP2_2_3M94 backChartP2_2_4M94 backChartP2_2_5M94 backChartP2_2_6M94 backChartP2_2_7M94
 ring

theorem back_column2_8M94 (c r : ℤ) :
 (backChartP2_1_1M94 c r*backChartP2_1_7M94 c r + backChartP2_1_2M94 c r*backChartP2_1_6M94 c r + backChartP2_1_3M94 c r*backChartP2_1_5M94 c r + backChartP2_1_4M94 c r*backChartP2_1_4M94 c r + backChartP2_1_5M94 c r*backChartP2_1_3M94 c r + backChartP2_1_6M94 c r*backChartP2_1_2M94 c r + backChartP2_1_7M94 c r*backChartP2_1_1M94 c r)-(backChartP2_0_1M94 c r*backChartP2_2_7M94 c r + backChartP2_0_2M94 c r*backChartP2_2_6M94 c r + backChartP2_0_3M94 c r*backChartP2_2_5M94 c r + backChartP2_0_4M94 c r*backChartP2_2_4M94 c r + backChartP2_0_5M94 c r*backChartP2_2_3M94 c r + backChartP2_0_6M94 c r*backChartP2_2_2M94 c r + backChartP2_0_7M94 c r*backChartP2_2_1M94 c r)=backChartG2_8M94 c r := by
 unfold backChartG2_8M94 backChartP2_0_1M94 backChartP2_0_2M94 backChartP2_0_3M94 backChartP2_0_4M94 backChartP2_0_5M94 backChartP2_0_6M94 backChartP2_0_7M94 backChartP2_1_1M94 backChartP2_1_2M94 backChartP2_1_3M94 backChartP2_1_4M94 backChartP2_1_5M94 backChartP2_1_6M94 backChartP2_1_7M94 backChartP2_2_1M94 backChartP2_2_2M94 backChartP2_2_3M94 backChartP2_2_4M94 backChartP2_2_5M94 backChartP2_2_6M94 backChartP2_2_7M94
 ring

theorem back_column2_9M94 (c r : ℤ) :
 (backChartP2_1_2M94 c r*backChartP2_1_7M94 c r + backChartP2_1_3M94 c r*backChartP2_1_6M94 c r + backChartP2_1_4M94 c r*backChartP2_1_5M94 c r + backChartP2_1_5M94 c r*backChartP2_1_4M94 c r + backChartP2_1_6M94 c r*backChartP2_1_3M94 c r + backChartP2_1_7M94 c r*backChartP2_1_2M94 c r)-(backChartP2_0_2M94 c r*backChartP2_2_7M94 c r + backChartP2_0_3M94 c r*backChartP2_2_6M94 c r + backChartP2_0_4M94 c r*backChartP2_2_5M94 c r + backChartP2_0_5M94 c r*backChartP2_2_4M94 c r + backChartP2_0_6M94 c r*backChartP2_2_3M94 c r + backChartP2_0_7M94 c r*backChartP2_2_2M94 c r)=backChartG2_9M94 c r := by
 unfold backChartG2_9M94 backChartP2_0_2M94 backChartP2_0_3M94 backChartP2_0_4M94 backChartP2_0_5M94 backChartP2_0_6M94 backChartP2_0_7M94 backChartP2_1_2M94 backChartP2_1_3M94 backChartP2_1_4M94 backChartP2_1_5M94 backChartP2_1_6M94 backChartP2_1_7M94 backChartP2_2_2M94 backChartP2_2_3M94 backChartP2_2_4M94 backChartP2_2_5M94 backChartP2_2_6M94 backChartP2_2_7M94
 ring

theorem back_column2_10M94 (c r : ℤ) :
 (backChartP2_1_3M94 c r*backChartP2_1_7M94 c r + backChartP2_1_4M94 c r*backChartP2_1_6M94 c r + backChartP2_1_5M94 c r*backChartP2_1_5M94 c r + backChartP2_1_6M94 c r*backChartP2_1_4M94 c r + backChartP2_1_7M94 c r*backChartP2_1_3M94 c r)-(backChartP2_0_3M94 c r*backChartP2_2_7M94 c r + backChartP2_0_4M94 c r*backChartP2_2_6M94 c r + backChartP2_0_5M94 c r*backChartP2_2_5M94 c r + backChartP2_0_6M94 c r*backChartP2_2_4M94 c r + backChartP2_0_7M94 c r*backChartP2_2_3M94 c r)=backChartG2_10M94 c r := by
 unfold backChartG2_10M94 backChartP2_0_3M94 backChartP2_0_4M94 backChartP2_0_5M94 backChartP2_0_6M94 backChartP2_0_7M94 backChartP2_1_3M94 backChartP2_1_4M94 backChartP2_1_5M94 backChartP2_1_6M94 backChartP2_1_7M94 backChartP2_2_3M94 backChartP2_2_4M94 backChartP2_2_5M94 backChartP2_2_6M94 backChartP2_2_7M94
 ring

theorem back_column2_11M94 (c r : ℤ) :
 (backChartP2_1_4M94 c r*backChartP2_1_7M94 c r + backChartP2_1_5M94 c r*backChartP2_1_6M94 c r + backChartP2_1_6M94 c r*backChartP2_1_5M94 c r + backChartP2_1_7M94 c r*backChartP2_1_4M94 c r)-(backChartP2_0_4M94 c r*backChartP2_2_7M94 c r + backChartP2_0_5M94 c r*backChartP2_2_6M94 c r + backChartP2_0_6M94 c r*backChartP2_2_5M94 c r + backChartP2_0_7M94 c r*backChartP2_2_4M94 c r)=backChartG2_11M94 c r := by
 unfold backChartG2_11M94 backChartP2_0_4M94 backChartP2_0_5M94 backChartP2_0_6M94 backChartP2_0_7M94 backChartP2_1_4M94 backChartP2_1_5M94 backChartP2_1_6M94 backChartP2_1_7M94 backChartP2_2_4M94 backChartP2_2_5M94 backChartP2_2_6M94 backChartP2_2_7M94
 ring

theorem back_column2_12M94 (c r : ℤ) :
 (backChartP2_1_5M94 c r*backChartP2_1_7M94 c r + backChartP2_1_6M94 c r*backChartP2_1_6M94 c r + backChartP2_1_7M94 c r*backChartP2_1_5M94 c r)-(backChartP2_0_5M94 c r*backChartP2_2_7M94 c r + backChartP2_0_6M94 c r*backChartP2_2_6M94 c r + backChartP2_0_7M94 c r*backChartP2_2_5M94 c r)=backChartG2_12M94 c r := by
 unfold backChartG2_12M94 backChartP2_0_5M94 backChartP2_0_6M94 backChartP2_0_7M94 backChartP2_1_5M94 backChartP2_1_6M94 backChartP2_1_7M94 backChartP2_2_5M94 backChartP2_2_6M94 backChartP2_2_7M94
 ring

theorem back_column2_13M94 (c r : ℤ) :
 (backChartP2_1_6M94 c r*backChartP2_1_7M94 c r + backChartP2_1_7M94 c r*backChartP2_1_6M94 c r)-(backChartP2_0_6M94 c r*backChartP2_2_7M94 c r + backChartP2_0_7M94 c r*backChartP2_2_6M94 c r)=backChartG2_13M94 c r := by
 unfold backChartG2_13M94 backChartP2_0_6M94 backChartP2_0_7M94 backChartP2_1_6M94 backChartP2_1_7M94 backChartP2_2_6M94 backChartP2_2_7M94
 ring

theorem back_column2_14M94 (c r : ℤ) :
 (backChartP2_1_7M94 c r*backChartP2_1_7M94 c r)-(backChartP2_0_7M94 c r*backChartP2_2_7M94 c r)=backChartG2_14M94 c r := by
 unfold backChartG2_14M94 backChartP2_0_7M94 backChartP2_1_7M94 backChartP2_2_7M94
 ring

attribute [local irreducible] backChartP2_0_0M94 backChartP2_0_1M94 backChartP2_0_2M94 backChartP2_0_3M94 backChartP2_0_4M94 backChartP2_0_5M94 backChartP2_0_6M94 backChartP2_0_7M94 backChartP2_1_0M94 backChartP2_1_1M94 backChartP2_1_2M94 backChartP2_1_3M94 backChartP2_1_4M94 backChartP2_1_5M94 backChartP2_1_6M94 backChartP2_1_7M94 backChartP2_2_0M94 backChartP2_2_1M94 backChartP2_2_2M94 backChartP2_2_3M94 backChartP2_2_4M94 backChartP2_2_5M94 backChartP2_2_6M94 backChartP2_2_7M94 backChartG2_0M94 backChartG2_1M94 backChartG2_2M94 backChartG2_3M94 backChartG2_4M94 backChartG2_5M94 backChartG2_6M94 backChartG2_7M94 backChartG2_8M94 backChartG2_9M94 backChartG2_10M94 backChartG2_11M94 backChartG2_12M94 backChartG2_13M94 backChartG2_14M94

theorem back_columns_lc2M94 (c r e : ℤ) (hc : 0≤c) (hr : 0≤r) (he : 0≤e) :
 backShape2M94 (5 + 2*r + 3*c) (2 + 1*r + 1*c) e*backShape2M94 (5 + 2*r + 3*c) (2 + 1*r + 1*c) (e-2)≤
 backShape2M94 (5 + 2*r + 3*c) (2 + 1*r + 1*c) (e-1)^2 := by
 apply sub_nonneg.mp
 have hzero := back_stage2_0M94 c r e
 simp only [sub_zero] at hzero
 rw [hzero,back_stage2_1M94,back_stage2_2M94]
 have hgap : (backChartP2_1_0M94 c r*e^0 + backChartP2_1_1M94 c r*e^1 + backChartP2_1_2M94 c r*e^2 + backChartP2_1_3M94 c r*e^3 + backChartP2_1_4M94 c r*e^4 + backChartP2_1_5M94 c r*e^5 + backChartP2_1_6M94 c r*e^6 + backChartP2_1_7M94 c r*e^7)^2-(backChartP2_0_0M94 c r*e^0 + backChartP2_0_1M94 c r*e^1 + backChartP2_0_2M94 c r*e^2 + backChartP2_0_3M94 c r*e^3 + backChartP2_0_4M94 c r*e^4 + backChartP2_0_5M94 c r*e^5 + backChartP2_0_6M94 c r*e^6 + backChartP2_0_7M94 c r*e^7)*(backChartP2_2_0M94 c r*e^0 + backChartP2_2_1M94 c r*e^1 + backChartP2_2_2M94 c r*e^2 + backChartP2_2_3M94 c r*e^3 + backChartP2_2_4M94 c r*e^4 + backChartP2_2_5M94 c r*e^5 + backChartP2_2_6M94 c r*e^6 + backChartP2_2_7M94 c r*e^7)=backChartG2_0M94 c r*e^0 + backChartG2_1M94 c r*e^1 + backChartG2_2M94 c r*e^2 + backChartG2_3M94 c r*e^3 + backChartG2_4M94 c r*e^4 + backChartG2_5M94 c r*e^5 + backChartG2_6M94 c r*e^6 + backChartG2_7M94 c r*e^7 + backChartG2_8M94 c r*e^8 + backChartG2_9M94 c r*e^9 + backChartG2_10M94 c r*e^10 + backChartG2_11M94 c r*e^11 + backChartG2_12M94 c r*e^12 + backChartG2_13M94 c r*e^13 + backChartG2_14M94 c r*e^14 := by
  rw [←back_column2_0M94,←back_column2_1M94,←back_column2_2M94,←back_column2_3M94,←back_column2_4M94,←back_column2_5M94,←back_column2_6M94,←back_column2_7M94,←back_column2_8M94,←back_column2_9M94,←back_column2_10M94,←back_column2_11M94,←back_column2_12M94,←back_column2_13M94,←back_column2_14M94]
  ring
 rw [hgap]
 have h0 := backChartG2_0M94_nonneg c r hc hr
 have h1 := backChartG2_1M94_nonneg c r hc hr
 have h2 := backChartG2_2M94_nonneg c r hc hr
 have h3 := backChartG2_3M94_nonneg c r hc hr
 have h4 := backChartG2_4M94_nonneg c r hc hr
 have h5 := backChartG2_5M94_nonneg c r hc hr
 have h6 := backChartG2_6M94_nonneg c r hc hr
 have h7 := backChartG2_7M94_nonneg c r hc hr
 have h8 := backChartG2_8M94_nonneg c r hc hr
 have h9 := backChartG2_9M94_nonneg c r hc hr
 have h10 := backChartG2_10M94_nonneg c r hc hr
 have h11 := backChartG2_11M94_nonneg c r hc hr
 have h12 := backChartG2_12M94_nonneg c r hc hr
 have h13 := backChartG2_13M94_nonneg c r hc hr
 have h14 := backChartG2_14M94_nonneg c r hc hr
 positivity
end
end MathGKM.Markov
