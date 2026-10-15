import MarkovBackwardChamber5M94
/-! Machine-authored 94b1de05. Staged backwards third-block gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false

def backChartP5_0_0M94 (c r : ℤ) : ℤ :=
 2777846400 + 3703795200*r + 1782708480*r^2 + 365783040*r^3 + 26611200*r^4 + 12970056960*c + 12265666560*c*r + 3718794240*c*r^2 + 358041600*c*r^3 + 21028452480*c^2 + 12565324800*c^2*r + 1802787840*c^2*r^2 + 14109742080*c^3 + 4026193920*c^3*r + 3365187840*c^4

def backChartP5_0_1M94 (c r : ℤ) : ℤ :=
 2444623200 + 3271310784*r + 1586821920*r^2 + 330994944*r^3 + 24922560*r^4 + 11661439104*c + 11138223360*c*r + 3435336576*c*r^2 + 341479680*c*r^3 + 19488630528*c^2 + 11851652736*c^2*r + 1750647168*c^2*r^2 + 13590226944*c^3 + 3980001024*c^3*r + 3385611648*c^4

def backChartP5_0_2M94 (c r : ℤ) : ℤ :=
 935004672 + 1252871424*r + 610118656*r^2 + 128481024*r^3 + 9881984*r^4 + 4546526208*c + 4369073856*c*r + 1362150720*c*r^2 + 138164992*c*r^3 + 7802213888*c^2 + 4801382208*c^2*r + 722715840*c^2*r^2 + 5626430208*c^3 + 1676221568*c^3*r + 1454446336*c^4

def backChartP5_0_3M94 (c r : ℤ) : ℤ :=
 201694080 + 269908576*r + 131394704*r^2 + 27734336*r^3 + 2151184*r^4 + 997300864*c + 960215872*c*r + 300596352*c*r^2 + 30756544*c*r^3 + 1750630784*c^2 + 1083501888*c^2*r + 164520384*c^2*r^2 + 1298737664*c^3 + 390202624*c^3*r + 346213504*c^4

def backChartP5_0_4M94 (c r : ℤ) : ℤ :=
 26530560 + 35347200*r + 17120320*r^2 + 3595200*r^3 + 277760*r^4 + 133042560*c + 127753920*c*r + 39876480*c*r^2 + 4070080*c*r^3 + 237937280*c^2 + 147147840*c^2*r + 22317120*c^2*r^2 + 180633600*c^3 + 54266240*c^3*r + 49369600*c^4

def backChartP5_0_5M94 (c r : ℤ) : ℤ :=
 2130240 + 2815456*r + 1349600*r^2 + 279776*r^3 + 21280*r^4 + 10802176*c + 10292800*c*r + 3179904*c*r^2 + 320320*c*r^3 + 19601792*c^2 + 12030144*c^2*r + 1804992*c^2*r^2 + 15147776*c^3 + 4512256*c^3*r + 4221952*c^4

def backChartP5_0_6M94 (c r : ℤ) : ℤ :=
 96768 + 126336*r + 59584*r^2 + 12096*r^3 + 896*r^4 + 494592*c + 465024*c*r + 141120*c*r^2 + 13888*c*r^3 + 906752*c^2 + 548352*c^2*r + 80640*c^2*r^2 + 709632*c^3 + 207872*c^3*r + 200704*c^4

def backChartP5_0_7M94 (c r : ℤ) : ℤ :=
 1920 + 2464*r + 1136*r^2 + 224*r^3 + 16*r^4 + 9856*c + 9088*c*r + 2688*c*r^2 + 256*c*r^3 + 18176*c^2 + 10752*c^2*r + 1536*c^2*r^2 + 14336*c^3 + 4096*c^3*r + 4096*c^4

def backChartP5_1_0M94 (c r : ℤ) : ℤ :=
 1091028960 + 1448102880*r + 690439680*r^2 + 138862080*r^3 + 9676800*r^4 + 4980568320*c + 4654218240*c*r + 1381847040*c*r^2 + 127733760*c*r^3 + 7810629120*c^2 + 4567207680*c^2*r + 630927360*c^2*r^2 + 5013388800*c^3 + 1382169600*c^3*r + 1133153280*c^4

def backChartP5_1_1M94 (c r : ℤ) : ℤ :=
 1083657888 + 1447241376*r + 698685888*r^2 + 144182976*r^3 + 10602240*r^4 + 5079231360*c + 4818445056*c*r + 1468389888*c*r^2 + 142659072*c*r^3 + 8277041664*c^2 + 4967738496*c^2*r + 718060032*c^2*r^2 + 5582626560*c^3 + 1602443520*c^3*r + 1337815296*c^4

def backChartP5_1_2M94 (c r : ℤ) : ℤ :=
 469214592 + 628917632*r + 306030368*r^2 + 64228192*r^3 + 4895296*r^4 + 2252069120*c + 2158806272*c*r + 669881856*c*r^2 + 67315584*c*r^3 + 3795146880*c^2 + 2321461632*c^2*r + 346184832*c^2*r^2 + 2672884480*c^3 + 789120640*c^3*r + 672728448*c^4

def backChartP5_1_3M94 (c r : ℤ) : ℤ :=
 115006080 + 154233856*r + 75257504*r^2 + 15917216*r^3 + 1235584*r^4 + 563605504*c + 543145792*c*r + 170161152*c*r^2 + 17410624*c*r^3 + 977400704*c^2 + 604621248*c^2*r + 91742784*c^2*r^2 + 713990144*c^3 + 214246144*c^3*r + 187083904*c^4

def backChartP5_1_4M94 (c r : ℤ) : ℤ :=
 17263680 + 23078720*r + 11226320*r^2 + 2369920*r^3 + 184240*r^4 + 86105600*c + 82947200*c*r + 25999680*c*r^2 + 2667840*c*r^3 + 152893440*c^2 + 94846080*c^2*r + 14448000*c^2*r^2 + 115037440*c^3 + 34679680*c^3*r + 31127040*c^4

def backChartP5_1_5M94 (c r : ℤ) : ℤ :=
 1589952 + 2109184*r + 1015952*r^2 + 211904*r^3 + 16240*r^4 + 8041600*c + 7693504*c*r + 2389632*c*r^2 + 242368*c*r^3 + 14542976*c^2 + 8965824*c^2*r + 1353408*c^2*r^2 + 11191040*c^3 + 3351040*c^3*r + 3103744*c^4

def backChartP5_1_6M94 (c r : ℤ) : ℤ :=
 83328 + 109088*r + 51632*r^2 + 10528*r^3 + 784*r^4 + 425600*c + 401408*c*r + 122304*c*r^2 + 12096*c*r^3 + 779520*c^2 + 473088*c^2*r + 69888*c^2*r^2 + 609280*c^3 + 179200*c^3*r + 172032*c^4

def backChartP5_1_7M94 (c r : ℤ) : ℤ :=
 1920 + 2464*r + 1136*r^2 + 224*r^3 + 16*r^4 + 9856*c + 9088*c*r + 2688*c*r^2 + 256*c*r^3 + 18176*c^2 + 10752*c^2*r + 1536*c^2*r^2 + 14336*c^3 + 4096*c^3*r + 4096*c^4

def backChartP5_2_0M94 (c r : ℤ) : ℤ :=
 377334720 + 496621440*r + 232787520*r^2 + 45158400*r^3 + 2903040*r^4 + 1668280320*c + 1527079680*c*r + 436907520*c*r^2 + 37416960*c*r^3 + 2490445440*c^2 + 1402652160*c^2*r + 180472320*c^2*r^2 + 1494097920*c^3 + 386104320*c^3*r + 309173760*c^4

def backChartP5_2_1M94 (c r : ℤ) : ℤ :=
 428655456 + 569701440*r + 272270304*r^2 + 54996480*r^3 + 3858048*r^4 + 1959210624*c + 1834603776*c*r + 546344064*c*r^2 + 50729472*c*r^3 + 3075541248*c^2 + 1801360512*c^2*r + 249485184*c^2*r^2 + 1971078144*c^3 + 543930624*c^3*r + 443617152*c^4

def backChartP5_2_2M94 (c r : ℤ) : ℤ :=
 213088512 + 285181120*r + 138206880*r^2 + 28730240*r^3 + 2143008*r^4 + 1003647232*c + 955947328*c*r + 293278272*c*r^2 + 28843136*c*r^3 + 1646186752*c^2 + 993886656*c^2*r + 145126464*c^2*r^2 + 1118066432*c^3 + 323551872*c^3*r + 269696000*c^4

def backChartP5_2_3M94 (c r : ℤ) : ℤ :=
 60251520 + 80915296*r + 39518864*r^2 + 8353856*r^3 + 645904*r^4 + 291432064*c + 280581952*c*r + 87706752*c*r^2 + 8929984*c*r^3 + 496302464*c^2 + 305809728*c^2*r + 46140864*c^2*r^2 + 354066944*c^3 + 105597184*c^3*r + 90315904*c^4

def backChartP5_2_4M94 (c r : ℤ) : ℤ :=
 10496640 + 14082880*r + 6881280*r^2 + 1460480*r^3 + 114240*r^4 + 51936640*c + 50182720*c*r + 15792000*c*r^2 + 1628480*c*r^3 + 91235200*c^2 + 56736960*c^2*r + 8675520*c^2*r^2 + 67719680*c^3 + 20469120*c^3*r + 18045440*c^4

def backChartP5_2_5M94 (c r : ℤ) : ℤ :=
 1130304 + 1506400*r + 730016*r^2 + 153440*r^3 + 11872*r^4 + 5694976*c + 5475904*c*r + 1712256*c*r^2 + 175168*c*r^3 + 10247552*c^2 + 6353088*c^2*r + 966336*c^2*r^2 + 7836416*c^3 + 2361856*c^3*r + 2157568*c^4

def backChartP5_2_6M94 (c r : ℤ) : ℤ :=
 69888 + 91840*r + 43680*r^2 + 8960*r^3 + 672*r^4 + 356608*c + 337792*c*r + 103488*c*r^2 + 10304*c*r^3 + 652288*c^2 + 397824*c^2*r + 59136*c^2*r^2 + 508928*c^3 + 150528*c^3*r + 143360*c^4

def backChartP5_2_7M94 (c r : ℤ) : ℤ :=
 1920 + 2464*r + 1136*r^2 + 224*r^3 + 16*r^4 + 9856*c + 9088*c*r + 2688*c*r^2 + 256*c*r^3 + 18176*c^2 + 10752*c^2*r + 1536*c^2*r^2 + 14336*c^3 + 4096*c^3*r + 4096*c^4

def backChartG5_0M94 (c r : ℤ) : ℤ :=
 142166298011673600 + 382735754282649600*r + 444871437862118400*r^2 + 291666188117606400*r^3 + 117984465672192000*r^4 + 30155836612608000*r^5 + 4756964541235200*r^6 + 423879140966400*r^7 + 16387080192000*r^8 + 1339609256268595200*c + 3090092773998182400*c*r + 3014807536303718400*c*r^2 + 1613317194355507200*c*r^3 + 511599304787558400*c*r^4 + 96188649209856000*c*r^5 + 9940949080473600*c*r^6 + 436988805120000*c*r^7 + 5358775017544704000*c^2 + 10374558225879859200*c^2*r + 8263163178869760000*c^2*r^2 + 3468116307743539200*c^2*r^3 + 809641374164582400*c^2*r^4 + 99827049214771200*c^2*r^5 + 5093650759680000*c^2*r^6 + 11885205895402291200*c^3 + 18788251727727820800*c^3*r + 11742829116176793600*c^3*r^2 + 3631197115839283200*c^3*r^3 + 556429602639052800*c^3*r^4 + 33897065545728000*c^3*r^5 + 16001191030461235200*c^4 + 19859543819794022400*c^4*r + 9152164387008921600*c^4*r^2 + 1859264176560537600*c^4*r^3 + 140859959869440000*c^4*r^4 + 13420747900256256000*c^5 + 12291278535902822400*c^5*r + 3724303849478553600*c^5*r^2 + 374288194732032000*c^5*r^3 + 6871748547789619200*c^6 + 4140982871565926400*c^6*r + 621038800650240000*c^6*r^2 + 1971593761613414400*c^7 + 588312956141568000*c^7*r + 243608578375680000*c^8

theorem backChartG5_0M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_0M94 c r := by
 unfold backChartG5_0M94
 positivity

def backChartG5_1M94 (c r : ℤ) : ℤ :=
 251424051113410560 + 677834176627077120*r + 789488587343554560*r^2 + 519104448370851840*r^3 + 210840589906974720*r^4 + 54188782000496640*r^5 + 8610132920094720*r^6 + 773872492216320*r^7 + 30173036544000*r^8 + 2396986817246945280*c + 5543630723996467200*c*r + 5427436086924042240*c*r^2 + 2917707684095877120*c*r^3 + 930717694557020160*c*r^4 + 176281374746050560*c*r^5 + 18373476749967360*c*r^6 + 814325170176000*c*r^7 + 9719099167474851840*c^2 + 18891846966137241600*c^2*r + 15123250894159134720*c^2*r^2 + 6387040779952250880*c^2*r^3 + 1502220485412864000*c^2*r^4 + 186766388451901440*c^2*r^5 + 9605526574694400*c^2*r^6 + 21892008405234401280*c^3 + 34797343377848647680*c^3*r + 21890915446254059520*c^3*r^2 + 6820305638493634560*c^3*r^3 + 1053654604297666560*c^3*r^4 + 64680496363929600*c^3*r^5 + 29988560868530503680*c^4 + 37472377606795837440*c^4*r + 17399790426288291840*c^4*r^2 + 3563008205122437120*c^4*r^3 + 271940023885824000*c^4*r^4 + 25629093751560929280*c^5 + 23650199683178987520*c^5*r + 7222009864897658880*c^5*r^2 + 731006812363161600*c^5*r^3 + 13380482459706163200*c^6 + 8124611301397463040*c^6*r + 1226928913846272000*c^6*r^2 + 3913370954231316480*c^7 + 1175574960090316800*c^7*r + 492302252755353600*c^8

theorem backChartG5_1M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_1M94 c r := by
 unfold backChartG5_1M94
 positivity

def backChartG5_2M94 (c r : ℤ) : ℤ :=
 205529880285241344 + 554414386666678272*r + 646367683673263104*r^2 + 425656830944120832*r^3 + 173288306131670016*r^4 + 44686079997124608*r^5 + 7132216903612416*r^6 + 644604001026048*r^7 + 25280851599360*r^8 + 1980922863184183296*c + 4588483786413649920*c*r + 4501904212188278784*c*r^2 + 2427105025093496832*c*r^3 + 777137478706262016*c*r^4 + 147892416776036352*c*r^5 + 15500790788087808*c*r^6 + 690957375897600*c*r^7 + 8133370484301619200*c^2 + 15852010435368210432*c^2*r + 12732683167037546496*c^2*r^2 + 5399807460025724928*c^2*r^3 + 1276342905380143104*c^2*r^4 + 159574145437163520*c^2*r^5 + 8253114468802560*c^2*r^6 + 18583009428050952192*c^3 + 29651351807806783488*c^3*r + 18737929563780833280*c^3*r^2 + 5868127961310633984*c^3*r^3 + 911642866038374400*c^3*r^4 + 56269846153543680*c^3*r^5 + 25862587086214545408*c^4 + 32473320360101978112*c^4*r + 15158903214576328704*c^4*r^2 + 3121520633077432320*c^4*r^3 + 239520899642572800*c^4*r^4 + 22484494518372827136*c^5 + 20861736339376816128*c^5*r + 6406037085554491392*c^5*r^2 + 651810883756032000*c^5*r^3 + 11949253299410337792*c^6 + 7295813968385359872*c^6*r + 1107417240837734400*c^6*r^2 + 3557283287267082240*c^7 + 1073978272325468160*c^7*r + 455188921832816640*c^8

theorem backChartG5_2M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_2M94 c r := by
 unfold backChartG5_2M94
 positivity

def backChartG5_3M94 (c r : ℤ) : ℤ :=
 102694494027202560 + 276921282834653184*r + 322805006941347840*r^2 + 212614155739754496*r^3 + 86609437787056128*r^4 + 22360853119610880*r^5 + 3575778222944256*r^6 + 324028052103168*r^7 + 12747536836608*r^8 + 999814975057575936*c + 2316936396110536704*c*r + 2274948154714497024*c*r^2 + 1227925310120140800*c*r^3 + 393832514116952064*c*r^4 + 75118061385916416*c*r^5 + 7895496841322496*c*r^6 + 353048746229760*c*r^7 + 4152707305301753856*c^2 + 8104420368008208384*c^2*r + 6520758987199414272*c^2*r^2 + 2771306378837950464*c^2*r^3 + 656752554967326720*c^2*r^4 + 82356805550186496*c^2*r^5 + 4272900191379456*c^2*r^6 + 9612484829674438656*c^3 + 15371779636174209024*c^3*r + 9738988384739303424*c^3*r^2 + 3058803078140436480*c^3*r^3 + 476701876210237440*c^3*r^4 + 29517118273929216*c^3*r^5 + 13572453954330034176*c^4 + 17092143761718165504*c^4*r + 8004178293254922240*c^4*r^2 + 1653657837978746880*c^4*r^3 + 127293475558072320*c^4*r^4 + 11984506101346566144*c^5 + 11157672968271642624*c^5*r + 3437927102883151872*c^5*r^2 + 350929017656082432*c^5*r^3 + 6473106981218648064*c^6 + 3966225608347828224*c^6*r + 603967603496140800*c^6*r^2 + 1958778852277223424*c^7 + 593296291679207424*c^7*r + 254688921457065984*c^8

theorem backChartG5_3M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_3M94 c r := by
 unfold backChartG5_3M94
 positivity

def backChartG5_4M94 (c r : ℤ) : ℤ :=
 34929933741158400 + 94068429031127040*r + 109513251347433472*r^2 + 72041656756550656*r^3 + 29314464280994816*r^4 + 7561907852219392*r^5 + 1208598181339136*r^6 + 109504646680576*r^7 + 4309011438592*r^8 + 343232716904448000*c + 794842322425819136*c*r + 779949600297541632*c*r^2 + 420772353091844096*c*r^3 + 134910468650854400*c*r^4 + 25730119828568064*c*r^5 + 2704948503943168*c*r^6 + 121003908644864*c*r^7 + 1440701520779272192*c^2 + 2811562874755289088*c^2*r + 2262298368274538496*c^2*r^2 + 961651034021386240*c^2*r^3 + 227972800491878400*c^2*r^4 + 28602108400244736*c^2*r^5 + 1484859320928256*c^2*r^6 + 3374577723032879104*c^3 + 5399698451064651776*c^3*r + 3423355115532943360*c^3*r^2 + 1076000200037109760*c^3*r^3 + 167823182601052160*c^3*r^4 + 10399622935482368*c^3*r^5 + 4827400782443380736*c^4 + 6086173041130864640*c^4*r + 2853321584363765760*c^4*r^2 + 590123376876830720*c^4*r^3 + 45468735429591040*c^4*r^4 + 4322949163539693568*c^5 + 4030620743228964864*c^5*r + 1243567556384047104*c^5*r^2 + 127077868542722048*c^5*r^3 + 2369540261664751616*c^6 + 1454142738355535872*c^6*r + 221711305204350976*c^6*r^2 + 727865425746264064*c^7 + 220773981276176384*c^7*r + 96065132145590272*c^8

theorem backChartG5_4M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_4M94 c r := by
 unfold backChartG5_4M94
 positivity

def backChartG5_5M94 (c r : ℤ) : ℤ :=
 8519707725742080 + 22891764766187520*r + 26584572696729600*r^2 + 17442240603863040*r^3 + 7077820101649920*r^4 + 1820595603456000*r^5 + 290149774064640*r^6 + 26215405332480*r^7 + 1028827645440*r^8 + 84424491815731200*c + 195143037513768960*c*r + 191101176165580800*c*r^2 + 102874733764884480*c*r^3 + 32909750084843520*c*r^4 + 6261933293414400*c*r^5 + 656756964648960*c*r^6 + 29311454699520*c*r^7 + 357762538339368960*c^2 + 697200258191646720*c^2*r + 560123075181035520*c^2*r^2 + 237691440442337280*c^2*r^3 + 56245526140876800*c^2*r^4 + 7043193767393280*c^2*r^5 + 364917249607680*c^2*r^6 + 846986825375416320*c^3 + 1353949636711956480*c^3*r + 857401041185095680*c^3*r^2 + 269132238193889280*c^3*r^3 + 41913282970460160*c^3*r^4 + 2592950816870400*c^3*r^5 + 1225948546888826880*c^4 + 1544648744123842560*c^4*r + 723536699452170240*c^4*r^2 + 149475775372492800*c^4*r^3 + 11501435134156800*c^4*r^4 + 1111820369612144640*c^5 + 1036201187175383040*c^5*r + 319465218718679040*c^5*r^2 + 32611051783618560*c^5*r^3 + 617592476179660800*c^6 + 378863777339228160*c^6*r + 57720501658337280*c^6*r^2 + 192327882668113920*c^7 + 58307924907294720*c^7*r + 25737800210841600*c^8

theorem backChartG5_5M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_5M94 c r := by
 unfold backChartG5_5M94
 positivity

def backChartG5_6M94 (c r : ℤ) : ℤ :=
 1527795823583232 + 4091552183341056*r + 4734213798444032*r^2 + 3093622440774656*r^3 + 1249827576971008*r^4 + 319959570366464*r^5 + 50733409043968*r^6 + 4559316952064*r^7 + 177938620160*r^8 + 15254420818280448*c + 35152871744757760*c*r + 34307931162365952*c*r^2 + 18399346693267456*c*r^3 + 5861662063280128*c*r^4 + 1110335270424576*c*r^5 + 115894170742784*c*r^6 + 5146255421440*c*r^7 + 65198351353856000*c^2 + 126705874918834176*c^2*r + 101474762180886528*c^2*r^2 + 42909821830098944*c^2*r^3 + 10114251045384192*c^2*r^4 + 1261130131968000*c^2*r^5 + 65041150791680*c^2*r^6 + 155835314101354496*c^3 + 248482232325505024*c^3*r + 156893701644861440*c^3*r^2 + 49083564044705792*c^3*r^3 + 7615406383513600*c^3*r^4 + 469180147179520*c^3*r^5 + 227939769227935744*c^4 + 286523174916407296*c^4*r + 133837679708823552*c^4*r^2 + 27559995157381120*c^4*r^3 + 2112801564876800*c^4*r^4 + 209074962534760448*c^5 + 194415259056635904*c^5*r + 59774023027654656*c^5*r^2 + 6081920169902080*c^5*r^3 + 117537269789556736*c^6 + 71938935295410176*c^6*r + 10929020018524160*c^6*r^2 + 37061609347481600*c^7 + 11208770053734400*c^7*r + 5023230666997760*c^8

theorem backChartG5_6M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_6M94 c r := by
 unfold backChartG5_6M94
 positivity

def backChartG5_7M94 (c r : ℤ) : ℤ :=
 202927512453120 + 541106813140992*r + 623059192627200*r^2 + 404938117398528*r^3 + 162612696766464*r^4 + 41354159616000*r^5 + 6509886824448*r^6 + 580464267264*r^7 + 22464497664*r^8 + 2039829952462848*c + 4680842849206272*c*r + 4546559469699072*c*r^2 + 2425283090657280*c*r^3 + 768049714962432*c*r^4 + 144531685122048*c*r^5 + 14977664851968*c*r^6 + 659917762560*c*r^7 + 8784783517483008*c^2 + 17002042092306432*c^2*r + 13552548883808256*c^2*r^2 + 5700513166774272*c^2*r^3 + 1335710876774400*c^2*r^4 + 165456889049088*c^2*r^5 + 8472064462848*c^2*r^6 + 21175590764740608*c^3 + 33628564419674112*c^3*r + 21134651374190592*c^3*r^2 + 6576938710917120*c^3*r^3 + 1014365739663360*c^3*r^4 + 62082902827008*c^3*r^5 + 31262962205196288*c^4 + 39140343699996672*c^4*r + 18197553754275840*c^4*r^2 + 3727259287879680*c^4*r^3 + 284020304117760*c^4*r^4 + 28965722700644352*c^5 + 26825537121288192*c^5*r + 8208476975333376*c^5*r^2 + 830643493994496*c^5*r^3 + 16459330593226752*c^6 + 10031882734927872*c^6*r + 1516566262579200*c^6*r^2 + 5248530112315392*c^7 + 1580393233907712*c^7*r + 719674253770752*c^8

theorem backChartG5_7M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_7M94 c r := by
 unfold backChartG5_7M94
 positivity

def backChartG5_8M94 (c r : ℤ) : ℤ :=
 19811602944000 + 52544128573440*r + 60135264946176*r^2 + 38816920762368*r^3 + 15469398352128*r^4 + 3900869016576*r^5 + 608360083968*r^6 + 53693058048*r^7 + 2054927616*r^8 + 200324711301120*c + 457204313653248*c*r + 441363730784256*c*r^2 + 233810297591808*c*r^3 + 73471443548160*c*r^4 + 13707063724032*c*r^5 + 1406981474304*c*r^6 + 61347643392*c*r^7 + 868476589080576*c^2 + 1671676262129664*c^2*r + 1324222143971328*c^2*r^2 + 553077732157440*c^2*r^3 + 128570811586560*c^2*r^4 + 15786395670528*c^2*r^5 + 800488163328*c^2*r^6 + 2109019556216832*c^3 + 3330762659954688*c^3*r + 2080013692968960*c^3*r^2 + 642623027343360*c^3*r^3 + 98310038937600*c^3*r^4 + 5962703867904*c^3*r^5 + 3139193909526528*c^4 + 3907963031347200*c^4*r + 1805100982272000*c^4*r^2 + 366984994897920*c^4*r^3 + 27731452600320*c^4*r^4 + 2934408220606464*c^5 + 2701753100992512*c^5*r + 821156088840192*c^5*r^2 + 82458356219904*c^5*r^3 + 1683333020909568*c^6 + 1019759283142656*c^6*r + 153080938364928*c^6*r^2 + 542189527498752*c^7 + 162220439764992*c^7*r + 75126974447616*c^8

theorem backChartG5_8M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_8M94 c r := by
 unfold backChartG5_8M94
 positivity

def backChartG5_9M94 (c r : ℤ) : ℤ :=
 1386368040960 + 3653242306560*r + 4150549616640*r^2 + 2657153157120*r^3 + 1049199029760*r^4 + 261865820160*r^5 + 40376663040*r^6 + 3519129600*r^7 + 132840960*r^8 + 14089534341120*c + 31944148131840*c*r + 30605727989760*c*r^2 + 16075778611200*c*r^3 + 5003564267520*c*r^4 + 923597015040*c*r^5 + 93692282880*c*r^6 + 4032430080*c*r^7 + 61433229312000*c^2 + 117444262010880*c^2*r + 92312144117760*c^2*r^2 + 38217145559040*c^2*r^3 + 8796661708800*c^2*r^4 + 1068234209280*c^2*r^5 + 53509048320*c^2*r^6 + 150140497920000*c^3 + 235449561661440*c^3*r + 145853817446400*c^3*r^2 + 44651760168960*c^3*r^3 + 6761126830080*c^3*r^4 + 405404160000*c^3*r^5 + 225058820259840*c^4 + 278131755417600*c^4*r + 127397301534720*c^4*r^2 + 25655276666880*c^4*r^3 + 1918044979200*c^4*r^4 + 212001405665280*c^5 + 193709360087040*c^5*r + 58362034913280*c^5*r^2 + 5802694410240*c^5*r^3 + 122628400742400*c^6 + 73696582041600*c^6*r + 10962044190720*c^6*r^2 + 39848666726400*c^7 + 11822699642880*c^7*r + 5573286297600*c^8

theorem backChartG5_9M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_9M94 c r := by
 unfold backChartG5_9M94
 positivity

def backChartG5_10M94 (c r : ℤ) : ℤ :=
 66005581824 + 172620521472*r + 194441483264*r^2 + 123279629312*r^3 + 48151941376*r^4 + 11873404928*r^5 + 1806332416*r^6 + 155122688*r^7 + 5761280*r^8 + 673661485056*c + 1515352760320*c*r + 1438912548864*c*r^2 + 748187840512*c*r^3 + 230245421056*c*r^4 + 41966518272*c*r^5 + 4197982208*c*r^6 + 177909760*c*r^7 + 2951412531200*c^2 + 5596167585792*c^2*r + 4357681176576*c^2*r^2 + 1785109372928*c^2*r^3 + 406046613504*c^2*r^4 + 48661831680*c^2*r^5 + 2402140160*c^2*r^6 + 7251965837312*c^3 + 11275330060288*c^3*r + 6916731207680*c^3*r^2 + 2094208385024*c^3*r^3 + 313195724800*c^3*r^4 + 18522112000*c^3*r^5 + 10935546216448*c^4 + 13393469243392*c^4*r + 6072280940544*c^4*r^2 + 1208756469760*c^4*r^3 + 89204326400*c^4*r^4 + 10368716374016*c^5 + 9385141075968*c^5*r + 2797366935552*c^5*r^2 + 274774097920*c^5*r^3 + 6040449974272*c^6 + 3594310909952*c^6*r + 528629104640*c^6*r^2 + 1977991823360*c^7 + 580743331840*c^7*r + 278921216000*c^8

theorem backChartG5_10M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_10M94 c r := by
 unfold backChartG5_10M94
 positivity

def backChartG5_11M94 (c r : ℤ) : ℤ :=
 1919877120 + 4977229824*r + 5551042560*r^2 + 3480293376*r^3 + 1342430208*r^4 + 326430720*r^5 + 48900096*r^6 + 4128768*r^7 + 150528*r^8 + 19661193216*c + 43822055424*c*r + 41179643904*c*r^2 + 21161656320*c*r^3 + 6427029504*c*r^4 + 1154420736*c*r^5 + 113627136*c*r^6 + 4730880*c*r^7 + 86471540736*c^2 + 162383069184*c^2*r + 125066575872*c^2*r^2 + 50603556864*c^2*r^3 + 11352391680*c^2*r^4 + 1339785216*c^2*r^5 + 65028096*c^2*r^6 + 213396750336*c^3 + 328435236864*c^3*r + 199163510784*c^3*r^2 + 59523072000*c^3*r^3 + 8773632000*c^3*r^4 + 510590976*c^3*r^5 + 323359604736*c^4 + 391825588224*c^4*r + 175500165120*c^4*r^2 + 34461450240*c^4*r^3 + 2504785920*c^4*r^4 + 308259323904*c^5 + 275889782784*c^5*r + 81188093952*c^5*r^2 + 7861174272*c^5*r^3 + 180652867584*c^6 + 106224943104*c^6*r + 15414067200*c^6*r^2 + 59542339584*c^7 + 17263755264*c^7*r + 8455716864*c^8

theorem backChartG5_11M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_11M94 c r := by
 unfold backChartG5_11M94
 positivity

def backChartG5_12M94 (c r : ℤ) : ℤ :=
 25804800 + 66232320*r + 73034752*r^2 + 45208576*r^3 + 17190656*r^4 + 4114432*r^5 + 605696*r^6 + 50176*r^7 + 1792*r^8 + 264929280*c + 584278016*c*r + 542502912*c*r^2 + 275050496*c*r^3 + 82288640*c*r^4 + 14536704*c*r^5 + 1404928*c*r^6 + 57344*c*r^7 + 1168556032*c^2 + 2170011648*c^2*r + 1650302976*c^2*r^2 + 658309120*c^2*r^3 + 145367040*c^2*r^4 + 16859136*c^2*r^5 + 802816*c^2*r^6 + 2893348864*c^3 + 4400807936*c^3*r + 2633236480*c^3*r^2 + 775290880*c^3*r^3 + 112394240*c^3*r^4 + 6422528*c^3*r^5 + 4400807936*c^4 + 5266472960*c^4*r + 2325872640*c^4*r^2 + 449576960*c^4*r^3 + 32112640*c^4*r^4 + 4213178368*c^5 + 3721396224*c^5*r + 1078984704*c^5*r^2 + 102760448*c^5*r^3 + 2480930816*c^6 + 1438646272*c^6*r + 205520896*c^6*r^2 + 822083584*c^7 + 234881024*c^7*r + 117440512*c^8

theorem backChartG5_12M94_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤backChartG5_12M94 c r := by
 unfold backChartG5_12M94
 positivity

theorem back_stage5_0M94 (c r e : ℤ) :
 backShape5M94 (5 + 1*r + 4*c) (4 + 1*r + 3*c) (e-0)=backChartP5_0_0M94 c r*e^0 + backChartP5_0_1M94 c r*e^1 + backChartP5_0_2M94 c r*e^2 + backChartP5_0_3M94 c r*e^3 + backChartP5_0_4M94 c r*e^4 + backChartP5_0_5M94 c r*e^5 + backChartP5_0_6M94 c r*e^6 + backChartP5_0_7M94 c r*e^7 := by
 unfold backShape5M94 backChartP5_0_0M94 backChartP5_0_1M94 backChartP5_0_2M94 backChartP5_0_3M94 backChartP5_0_4M94 backChartP5_0_5M94 backChartP5_0_6M94 backChartP5_0_7M94
 ring

theorem back_stage5_1M94 (c r e : ℤ) :
 backShape5M94 (5 + 1*r + 4*c) (4 + 1*r + 3*c) (e-1)=backChartP5_1_0M94 c r*e^0 + backChartP5_1_1M94 c r*e^1 + backChartP5_1_2M94 c r*e^2 + backChartP5_1_3M94 c r*e^3 + backChartP5_1_4M94 c r*e^4 + backChartP5_1_5M94 c r*e^5 + backChartP5_1_6M94 c r*e^6 + backChartP5_1_7M94 c r*e^7 := by
 unfold backShape5M94 backChartP5_1_0M94 backChartP5_1_1M94 backChartP5_1_2M94 backChartP5_1_3M94 backChartP5_1_4M94 backChartP5_1_5M94 backChartP5_1_6M94 backChartP5_1_7M94
 ring

theorem back_stage5_2M94 (c r e : ℤ) :
 backShape5M94 (5 + 1*r + 4*c) (4 + 1*r + 3*c) (e-2)=backChartP5_2_0M94 c r*e^0 + backChartP5_2_1M94 c r*e^1 + backChartP5_2_2M94 c r*e^2 + backChartP5_2_3M94 c r*e^3 + backChartP5_2_4M94 c r*e^4 + backChartP5_2_5M94 c r*e^5 + backChartP5_2_6M94 c r*e^6 + backChartP5_2_7M94 c r*e^7 := by
 unfold backShape5M94 backChartP5_2_0M94 backChartP5_2_1M94 backChartP5_2_2M94 backChartP5_2_3M94 backChartP5_2_4M94 backChartP5_2_5M94 backChartP5_2_6M94 backChartP5_2_7M94
 ring

theorem back_column5_0M94 (c r : ℤ) :
 (backChartP5_1_0M94 c r*backChartP5_1_0M94 c r)-(backChartP5_0_0M94 c r*backChartP5_2_0M94 c r)=backChartG5_0M94 c r := by
 unfold backChartG5_0M94 backChartP5_0_0M94 backChartP5_1_0M94 backChartP5_2_0M94
 ring

theorem back_column5_1M94 (c r : ℤ) :
 (backChartP5_1_0M94 c r*backChartP5_1_1M94 c r + backChartP5_1_1M94 c r*backChartP5_1_0M94 c r)-(backChartP5_0_0M94 c r*backChartP5_2_1M94 c r + backChartP5_0_1M94 c r*backChartP5_2_0M94 c r)=backChartG5_1M94 c r := by
 unfold backChartG5_1M94 backChartP5_0_0M94 backChartP5_0_1M94 backChartP5_1_0M94 backChartP5_1_1M94 backChartP5_2_0M94 backChartP5_2_1M94
 ring

theorem back_column5_2M94 (c r : ℤ) :
 (backChartP5_1_0M94 c r*backChartP5_1_2M94 c r + backChartP5_1_1M94 c r*backChartP5_1_1M94 c r + backChartP5_1_2M94 c r*backChartP5_1_0M94 c r)-(backChartP5_0_0M94 c r*backChartP5_2_2M94 c r + backChartP5_0_1M94 c r*backChartP5_2_1M94 c r + backChartP5_0_2M94 c r*backChartP5_2_0M94 c r)=backChartG5_2M94 c r := by
 unfold backChartG5_2M94 backChartP5_0_0M94 backChartP5_0_1M94 backChartP5_0_2M94 backChartP5_1_0M94 backChartP5_1_1M94 backChartP5_1_2M94 backChartP5_2_0M94 backChartP5_2_1M94 backChartP5_2_2M94
 ring

theorem back_column5_3M94 (c r : ℤ) :
 (backChartP5_1_0M94 c r*backChartP5_1_3M94 c r + backChartP5_1_1M94 c r*backChartP5_1_2M94 c r + backChartP5_1_2M94 c r*backChartP5_1_1M94 c r + backChartP5_1_3M94 c r*backChartP5_1_0M94 c r)-(backChartP5_0_0M94 c r*backChartP5_2_3M94 c r + backChartP5_0_1M94 c r*backChartP5_2_2M94 c r + backChartP5_0_2M94 c r*backChartP5_2_1M94 c r + backChartP5_0_3M94 c r*backChartP5_2_0M94 c r)=backChartG5_3M94 c r := by
 unfold backChartG5_3M94 backChartP5_0_0M94 backChartP5_0_1M94 backChartP5_0_2M94 backChartP5_0_3M94 backChartP5_1_0M94 backChartP5_1_1M94 backChartP5_1_2M94 backChartP5_1_3M94 backChartP5_2_0M94 backChartP5_2_1M94 backChartP5_2_2M94 backChartP5_2_3M94
 ring

theorem back_column5_4M94 (c r : ℤ) :
 (backChartP5_1_0M94 c r*backChartP5_1_4M94 c r + backChartP5_1_1M94 c r*backChartP5_1_3M94 c r + backChartP5_1_2M94 c r*backChartP5_1_2M94 c r + backChartP5_1_3M94 c r*backChartP5_1_1M94 c r + backChartP5_1_4M94 c r*backChartP5_1_0M94 c r)-(backChartP5_0_0M94 c r*backChartP5_2_4M94 c r + backChartP5_0_1M94 c r*backChartP5_2_3M94 c r + backChartP5_0_2M94 c r*backChartP5_2_2M94 c r + backChartP5_0_3M94 c r*backChartP5_2_1M94 c r + backChartP5_0_4M94 c r*backChartP5_2_0M94 c r)=backChartG5_4M94 c r := by
 unfold backChartG5_4M94 backChartP5_0_0M94 backChartP5_0_1M94 backChartP5_0_2M94 backChartP5_0_3M94 backChartP5_0_4M94 backChartP5_1_0M94 backChartP5_1_1M94 backChartP5_1_2M94 backChartP5_1_3M94 backChartP5_1_4M94 backChartP5_2_0M94 backChartP5_2_1M94 backChartP5_2_2M94 backChartP5_2_3M94 backChartP5_2_4M94
 ring

theorem back_column5_5M94 (c r : ℤ) :
 (backChartP5_1_0M94 c r*backChartP5_1_5M94 c r + backChartP5_1_1M94 c r*backChartP5_1_4M94 c r + backChartP5_1_2M94 c r*backChartP5_1_3M94 c r + backChartP5_1_3M94 c r*backChartP5_1_2M94 c r + backChartP5_1_4M94 c r*backChartP5_1_1M94 c r + backChartP5_1_5M94 c r*backChartP5_1_0M94 c r)-(backChartP5_0_0M94 c r*backChartP5_2_5M94 c r + backChartP5_0_1M94 c r*backChartP5_2_4M94 c r + backChartP5_0_2M94 c r*backChartP5_2_3M94 c r + backChartP5_0_3M94 c r*backChartP5_2_2M94 c r + backChartP5_0_4M94 c r*backChartP5_2_1M94 c r + backChartP5_0_5M94 c r*backChartP5_2_0M94 c r)=backChartG5_5M94 c r := by
 unfold backChartG5_5M94 backChartP5_0_0M94 backChartP5_0_1M94 backChartP5_0_2M94 backChartP5_0_3M94 backChartP5_0_4M94 backChartP5_0_5M94 backChartP5_1_0M94 backChartP5_1_1M94 backChartP5_1_2M94 backChartP5_1_3M94 backChartP5_1_4M94 backChartP5_1_5M94 backChartP5_2_0M94 backChartP5_2_1M94 backChartP5_2_2M94 backChartP5_2_3M94 backChartP5_2_4M94 backChartP5_2_5M94
 ring

theorem back_column5_6M94 (c r : ℤ) :
 (backChartP5_1_0M94 c r*backChartP5_1_6M94 c r + backChartP5_1_1M94 c r*backChartP5_1_5M94 c r + backChartP5_1_2M94 c r*backChartP5_1_4M94 c r + backChartP5_1_3M94 c r*backChartP5_1_3M94 c r + backChartP5_1_4M94 c r*backChartP5_1_2M94 c r + backChartP5_1_5M94 c r*backChartP5_1_1M94 c r + backChartP5_1_6M94 c r*backChartP5_1_0M94 c r)-(backChartP5_0_0M94 c r*backChartP5_2_6M94 c r + backChartP5_0_1M94 c r*backChartP5_2_5M94 c r + backChartP5_0_2M94 c r*backChartP5_2_4M94 c r + backChartP5_0_3M94 c r*backChartP5_2_3M94 c r + backChartP5_0_4M94 c r*backChartP5_2_2M94 c r + backChartP5_0_5M94 c r*backChartP5_2_1M94 c r + backChartP5_0_6M94 c r*backChartP5_2_0M94 c r)=backChartG5_6M94 c r := by
 unfold backChartG5_6M94 backChartP5_0_0M94 backChartP5_0_1M94 backChartP5_0_2M94 backChartP5_0_3M94 backChartP5_0_4M94 backChartP5_0_5M94 backChartP5_0_6M94 backChartP5_1_0M94 backChartP5_1_1M94 backChartP5_1_2M94 backChartP5_1_3M94 backChartP5_1_4M94 backChartP5_1_5M94 backChartP5_1_6M94 backChartP5_2_0M94 backChartP5_2_1M94 backChartP5_2_2M94 backChartP5_2_3M94 backChartP5_2_4M94 backChartP5_2_5M94 backChartP5_2_6M94
 ring

theorem back_column5_7M94 (c r : ℤ) :
 (backChartP5_1_0M94 c r*backChartP5_1_7M94 c r + backChartP5_1_1M94 c r*backChartP5_1_6M94 c r + backChartP5_1_2M94 c r*backChartP5_1_5M94 c r + backChartP5_1_3M94 c r*backChartP5_1_4M94 c r + backChartP5_1_4M94 c r*backChartP5_1_3M94 c r + backChartP5_1_5M94 c r*backChartP5_1_2M94 c r + backChartP5_1_6M94 c r*backChartP5_1_1M94 c r + backChartP5_1_7M94 c r*backChartP5_1_0M94 c r)-(backChartP5_0_0M94 c r*backChartP5_2_7M94 c r + backChartP5_0_1M94 c r*backChartP5_2_6M94 c r + backChartP5_0_2M94 c r*backChartP5_2_5M94 c r + backChartP5_0_3M94 c r*backChartP5_2_4M94 c r + backChartP5_0_4M94 c r*backChartP5_2_3M94 c r + backChartP5_0_5M94 c r*backChartP5_2_2M94 c r + backChartP5_0_6M94 c r*backChartP5_2_1M94 c r + backChartP5_0_7M94 c r*backChartP5_2_0M94 c r)=backChartG5_7M94 c r := by
 unfold backChartG5_7M94 backChartP5_0_0M94 backChartP5_0_1M94 backChartP5_0_2M94 backChartP5_0_3M94 backChartP5_0_4M94 backChartP5_0_5M94 backChartP5_0_6M94 backChartP5_0_7M94 backChartP5_1_0M94 backChartP5_1_1M94 backChartP5_1_2M94 backChartP5_1_3M94 backChartP5_1_4M94 backChartP5_1_5M94 backChartP5_1_6M94 backChartP5_1_7M94 backChartP5_2_0M94 backChartP5_2_1M94 backChartP5_2_2M94 backChartP5_2_3M94 backChartP5_2_4M94 backChartP5_2_5M94 backChartP5_2_6M94 backChartP5_2_7M94
 ring

theorem back_column5_8M94 (c r : ℤ) :
 (backChartP5_1_1M94 c r*backChartP5_1_7M94 c r + backChartP5_1_2M94 c r*backChartP5_1_6M94 c r + backChartP5_1_3M94 c r*backChartP5_1_5M94 c r + backChartP5_1_4M94 c r*backChartP5_1_4M94 c r + backChartP5_1_5M94 c r*backChartP5_1_3M94 c r + backChartP5_1_6M94 c r*backChartP5_1_2M94 c r + backChartP5_1_7M94 c r*backChartP5_1_1M94 c r)-(backChartP5_0_1M94 c r*backChartP5_2_7M94 c r + backChartP5_0_2M94 c r*backChartP5_2_6M94 c r + backChartP5_0_3M94 c r*backChartP5_2_5M94 c r + backChartP5_0_4M94 c r*backChartP5_2_4M94 c r + backChartP5_0_5M94 c r*backChartP5_2_3M94 c r + backChartP5_0_6M94 c r*backChartP5_2_2M94 c r + backChartP5_0_7M94 c r*backChartP5_2_1M94 c r)=backChartG5_8M94 c r := by
 unfold backChartG5_8M94 backChartP5_0_1M94 backChartP5_0_2M94 backChartP5_0_3M94 backChartP5_0_4M94 backChartP5_0_5M94 backChartP5_0_6M94 backChartP5_0_7M94 backChartP5_1_1M94 backChartP5_1_2M94 backChartP5_1_3M94 backChartP5_1_4M94 backChartP5_1_5M94 backChartP5_1_6M94 backChartP5_1_7M94 backChartP5_2_1M94 backChartP5_2_2M94 backChartP5_2_3M94 backChartP5_2_4M94 backChartP5_2_5M94 backChartP5_2_6M94 backChartP5_2_7M94
 ring

theorem back_column5_9M94 (c r : ℤ) :
 (backChartP5_1_2M94 c r*backChartP5_1_7M94 c r + backChartP5_1_3M94 c r*backChartP5_1_6M94 c r + backChartP5_1_4M94 c r*backChartP5_1_5M94 c r + backChartP5_1_5M94 c r*backChartP5_1_4M94 c r + backChartP5_1_6M94 c r*backChartP5_1_3M94 c r + backChartP5_1_7M94 c r*backChartP5_1_2M94 c r)-(backChartP5_0_2M94 c r*backChartP5_2_7M94 c r + backChartP5_0_3M94 c r*backChartP5_2_6M94 c r + backChartP5_0_4M94 c r*backChartP5_2_5M94 c r + backChartP5_0_5M94 c r*backChartP5_2_4M94 c r + backChartP5_0_6M94 c r*backChartP5_2_3M94 c r + backChartP5_0_7M94 c r*backChartP5_2_2M94 c r)=backChartG5_9M94 c r := by
 unfold backChartG5_9M94 backChartP5_0_2M94 backChartP5_0_3M94 backChartP5_0_4M94 backChartP5_0_5M94 backChartP5_0_6M94 backChartP5_0_7M94 backChartP5_1_2M94 backChartP5_1_3M94 backChartP5_1_4M94 backChartP5_1_5M94 backChartP5_1_6M94 backChartP5_1_7M94 backChartP5_2_2M94 backChartP5_2_3M94 backChartP5_2_4M94 backChartP5_2_5M94 backChartP5_2_6M94 backChartP5_2_7M94
 ring

theorem back_column5_10M94 (c r : ℤ) :
 (backChartP5_1_3M94 c r*backChartP5_1_7M94 c r + backChartP5_1_4M94 c r*backChartP5_1_6M94 c r + backChartP5_1_5M94 c r*backChartP5_1_5M94 c r + backChartP5_1_6M94 c r*backChartP5_1_4M94 c r + backChartP5_1_7M94 c r*backChartP5_1_3M94 c r)-(backChartP5_0_3M94 c r*backChartP5_2_7M94 c r + backChartP5_0_4M94 c r*backChartP5_2_6M94 c r + backChartP5_0_5M94 c r*backChartP5_2_5M94 c r + backChartP5_0_6M94 c r*backChartP5_2_4M94 c r + backChartP5_0_7M94 c r*backChartP5_2_3M94 c r)=backChartG5_10M94 c r := by
 unfold backChartG5_10M94 backChartP5_0_3M94 backChartP5_0_4M94 backChartP5_0_5M94 backChartP5_0_6M94 backChartP5_0_7M94 backChartP5_1_3M94 backChartP5_1_4M94 backChartP5_1_5M94 backChartP5_1_6M94 backChartP5_1_7M94 backChartP5_2_3M94 backChartP5_2_4M94 backChartP5_2_5M94 backChartP5_2_6M94 backChartP5_2_7M94
 ring

theorem back_column5_11M94 (c r : ℤ) :
 (backChartP5_1_4M94 c r*backChartP5_1_7M94 c r + backChartP5_1_5M94 c r*backChartP5_1_6M94 c r + backChartP5_1_6M94 c r*backChartP5_1_5M94 c r + backChartP5_1_7M94 c r*backChartP5_1_4M94 c r)-(backChartP5_0_4M94 c r*backChartP5_2_7M94 c r + backChartP5_0_5M94 c r*backChartP5_2_6M94 c r + backChartP5_0_6M94 c r*backChartP5_2_5M94 c r + backChartP5_0_7M94 c r*backChartP5_2_4M94 c r)=backChartG5_11M94 c r := by
 unfold backChartG5_11M94 backChartP5_0_4M94 backChartP5_0_5M94 backChartP5_0_6M94 backChartP5_0_7M94 backChartP5_1_4M94 backChartP5_1_5M94 backChartP5_1_6M94 backChartP5_1_7M94 backChartP5_2_4M94 backChartP5_2_5M94 backChartP5_2_6M94 backChartP5_2_7M94
 ring

theorem back_column5_12M94 (c r : ℤ) :
 (backChartP5_1_5M94 c r*backChartP5_1_7M94 c r + backChartP5_1_6M94 c r*backChartP5_1_6M94 c r + backChartP5_1_7M94 c r*backChartP5_1_5M94 c r)-(backChartP5_0_5M94 c r*backChartP5_2_7M94 c r + backChartP5_0_6M94 c r*backChartP5_2_6M94 c r + backChartP5_0_7M94 c r*backChartP5_2_5M94 c r)=backChartG5_12M94 c r := by
 unfold backChartG5_12M94 backChartP5_0_5M94 backChartP5_0_6M94 backChartP5_0_7M94 backChartP5_1_5M94 backChartP5_1_6M94 backChartP5_1_7M94 backChartP5_2_5M94 backChartP5_2_6M94 backChartP5_2_7M94
 ring

attribute [local irreducible] backChartP5_0_0M94 backChartP5_0_1M94 backChartP5_0_2M94 backChartP5_0_3M94 backChartP5_0_4M94 backChartP5_0_5M94 backChartP5_0_6M94 backChartP5_0_7M94 backChartP5_1_0M94 backChartP5_1_1M94 backChartP5_1_2M94 backChartP5_1_3M94 backChartP5_1_4M94 backChartP5_1_5M94 backChartP5_1_6M94 backChartP5_1_7M94 backChartP5_2_0M94 backChartP5_2_1M94 backChartP5_2_2M94 backChartP5_2_3M94 backChartP5_2_4M94 backChartP5_2_5M94 backChartP5_2_6M94 backChartP5_2_7M94 backChartG5_0M94 backChartG5_1M94 backChartG5_2M94 backChartG5_3M94 backChartG5_4M94 backChartG5_5M94 backChartG5_6M94 backChartG5_7M94 backChartG5_8M94 backChartG5_9M94 backChartG5_10M94 backChartG5_11M94 backChartG5_12M94

theorem back_lc5M94 (c r e : ℤ) (hc : 0≤c) (hr : 0≤r) (he : 0≤e) :
 backShape5M94 (5 + 1*r + 4*c) (4 + 1*r + 3*c) e*backShape5M94 (5 + 1*r + 4*c) (4 + 1*r + 3*c) (e-2)≤
 backShape5M94 (5 + 1*r + 4*c) (4 + 1*r + 3*c) (e-1)^2 := by
 apply sub_nonneg.mp
 have hzero := back_stage5_0M94 c r e
 simp only [sub_zero] at hzero
 rw [hzero,back_stage5_1M94,back_stage5_2M94]
 have hgap : (backChartP5_1_0M94 c r*e^0 + backChartP5_1_1M94 c r*e^1 + backChartP5_1_2M94 c r*e^2 + backChartP5_1_3M94 c r*e^3 + backChartP5_1_4M94 c r*e^4 + backChartP5_1_5M94 c r*e^5 + backChartP5_1_6M94 c r*e^6 + backChartP5_1_7M94 c r*e^7)^2-(backChartP5_0_0M94 c r*e^0 + backChartP5_0_1M94 c r*e^1 + backChartP5_0_2M94 c r*e^2 + backChartP5_0_3M94 c r*e^3 + backChartP5_0_4M94 c r*e^4 + backChartP5_0_5M94 c r*e^5 + backChartP5_0_6M94 c r*e^6 + backChartP5_0_7M94 c r*e^7)*(backChartP5_2_0M94 c r*e^0 + backChartP5_2_1M94 c r*e^1 + backChartP5_2_2M94 c r*e^2 + backChartP5_2_3M94 c r*e^3 + backChartP5_2_4M94 c r*e^4 + backChartP5_2_5M94 c r*e^5 + backChartP5_2_6M94 c r*e^6 + backChartP5_2_7M94 c r*e^7)=backChartG5_0M94 c r*e^0 + backChartG5_1M94 c r*e^1 + backChartG5_2M94 c r*e^2 + backChartG5_3M94 c r*e^3 + backChartG5_4M94 c r*e^4 + backChartG5_5M94 c r*e^5 + backChartG5_6M94 c r*e^6 + backChartG5_7M94 c r*e^7 + backChartG5_8M94 c r*e^8 + backChartG5_9M94 c r*e^9 + backChartG5_10M94 c r*e^10 + backChartG5_11M94 c r*e^11 + backChartG5_12M94 c r*e^12 := by
  rw [←back_column5_0M94,←back_column5_1M94,←back_column5_2M94,←back_column5_3M94,←back_column5_4M94,←back_column5_5M94,←back_column5_6M94,←back_column5_7M94,←back_column5_8M94,←back_column5_9M94,←back_column5_10M94,←back_column5_11M94,←back_column5_12M94]
  ring
 rw [hgap]
 have h0 := backChartG5_0M94_nonneg c r hc hr
 have h1 := backChartG5_1M94_nonneg c r hc hr
 have h2 := backChartG5_2M94_nonneg c r hc hr
 have h3 := backChartG5_3M94_nonneg c r hc hr
 have h4 := backChartG5_4M94_nonneg c r hc hr
 have h5 := backChartG5_5M94_nonneg c r hc hr
 have h6 := backChartG5_6M94_nonneg c r hc hr
 have h7 := backChartG5_7M94_nonneg c r hc hr
 have h8 := backChartG5_8M94_nonneg c r hc hr
 have h9 := backChartG5_9M94_nonneg c r hc hr
 have h10 := backChartG5_10M94_nonneg c r hc hr
 have h11 := backChartG5_11M94_nonneg c r hc hr
 have h12 := backChartG5_12M94_nonneg c r hc hr
 positivity
end
end MathGKM.Markov
