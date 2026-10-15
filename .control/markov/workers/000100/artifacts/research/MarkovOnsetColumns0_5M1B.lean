import MarkovOnsetValues0M1B
/-! Machine-authored 1b02dddc. Column-wise exact onset gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false

def onsetP0_5_0_0M1B (c r : ℤ) : ℤ :=
 1906511040 + 9378270720*r + 16598977920*r^2 + 12734668800*r^3 + 3622026240*r^4 + 1970075520*c + 6666589440*c*r + 7254696960*c*r^2 + 2572093440*c*r^3 + 659534400*c^2 + 1347978240*c^2*r + 664796160*c^2*r^2 + 81285120*c^3 + 73543680*c^3*r + 2903040*c^4

def onsetP0_5_0_1M1B (c r : ℤ) : ℤ :=
 1769730912 + 8835501696*r + 15870163200*r^2 + 12319620096*r^3 + 3532752768*r^4 + 1909314624*c + 6617641728*c*r + 7369229952*c*r^2 + 2668375296*c*r^3 + 682760160*c^2 + 1446899328*c^2*r + 739550592*c^2*r^2 + 92972544*c^3 + 88705536*c^3*r + 3858048*c^4

def onsetP0_5_0_2M1B (c r : ℤ) : ℤ :=
 713465088 + 3606735104*r + 6561707264*r^2 + 5147209984*r^3 + 1486030336*r^4 + 800402624*c + 2833019840*c*r + 3220988736*c*r^2 + 1188802944*c*r^3 + 303631776*c^2 + 664821696*c^2*r + 351244992*c^2*r^2 + 45184384*c^3 + 45297280*c^3*r + 2143008*c^4

def onsetP0_5_0_3M1B (c r : ℤ) : ℤ :=
 162180480 + 827956864*r + 1521828224*r^2 + 1203905024*r^3 + 349224064*r^4 + 188435296*c + 678728512*c*r + 785456448*c*r^2 + 294617344*c*r^3 + 75323024*c^2 + 169636992*c^2*r + 92266944*c^2*r^2 + 12117056*c^3 + 12693184*c^3*r + 645904*c^4

def onsetP0_5_0_4M1B (c r : ℤ) : ℤ :=
 22485120 + 115579520*r + 213960320*r^2 + 170222080*r^3 + 49477120*r^4 + 26949440*c + 98383040*c*r + 115429440*c*r^2 + 43827840*c*r^3 + 11276160*c^2 + 25979520*c^2*r + 14468160*c^2*r^2 + 1939840*c^3 + 2107840*c^3*r + 114240*c^4

def onsetP0_5_0_5M1B (c r : ℤ) : ℤ :=
 1904448 + 9823744*r + 18247040*r^2 + 14545664*r^3 + 4221952*r^4 + 2345056*c + 8636992*c*r + 10223808*c*r^2 + 3910144*c*r^3 + 1020320*c^2 + 2389632*c^2*r + 1353408*c^2*r^2 + 185696*c^3 + 207424*c^3*r + 11872*c^4

def onsetP0_5_0_6M1B (c r : ℤ) : ℤ :=
 91392 + 471296*r + 874496*r^2 + 695296*r^3 + 200704*r^4 + 115136*c + 425600*c*r + 505344*c*r^2 + 193536*c*r^3 + 51744*c^2 + 122304*c^2*r + 69888*c^2*r^2 + 9856*c^3 + 11200*c^3*r + 672*c^4

def onsetP0_5_0_7M1B (c r : ℤ) : ℤ :=
 1920 + 9856*r + 18176*r^2 + 14336*r^3 + 4096*r^4 + 2464*c + 9088*c*r + 10752*c*r^2 + 4096*c*r^3 + 1136*c^2 + 2688*c^2*r + 1536*c^2*r^2 + 224*c^3 + 256*c^3*r + 16*c^4

def onsetP0_5_1_0M1B (c r : ℤ) : ℤ :=
 708734880 + 3427764480*r + 5965263360*r^2 + 4514711040*r^3 + 1271531520*r^4 + 697445280*c + 2293401600*c*r + 2426699520*c*r^2 + 838010880*c*r^3 + 215389440*c^2 + 419973120*c^2*r + 197406720*c^2*r^2 + 23143680*c^3 + 19353600*c^3*r + 645120*c^4

def onsetP0_5_1_1M1B (c r : ℤ) : ℤ :=
 748389024 + 3689943936*r + 6542507520*r^2 + 5024683776*r^3 + 1430390016*r^4 + 777069216*c + 2634950400*c*r + 2870066304*c*r^2 + 1017728256*c*r^3 + 261160128*c^2 + 533481984*c^2*r + 262347264*c^2*r^2 + 32066496*c^3 + 28730880*c^3*r + 1108224*c^4

def onsetP0_5_1_2M1B (c r : ℤ) : ℤ :=
 344120448 + 1724966656*r + 3110249856*r^2 + 2421499136*r^3 + 695925888*r^4 + 375018112*c + 1306955776*c*r + 1462312320*c*r^2 + 531633536*c*r^3 + 135868768*c^2 + 289669632*c^2*r + 148735104*c^2*r^2 + 18758432*c^3 + 17953152*c^3*r + 781760*c^4

def onsetP0_5_1_3M1B (c r : ℤ) : ℤ :=
 89523840 + 454795264*r + 831603584*r^2 + 655069184*r^3 + 189664384*r^4 + 101871616*c + 363372352*c*r + 416246208*c*r^2 + 154680064*c*r^3 + 39426464*c^2 + 87263232*c^2*r + 46584384*c^2*r^2 + 6025376*c^3 + 6121024*c^3*r + 294784*c^4

def onsetP0_5_1_4M1B (c r : ℤ) : ℤ :=
 14266560 + 73185280*r + 135206400*r^2 + 107421440*r^3 + 31234560*r^4 + 16864960*c + 61264000*c*r + 71514240*c*r^2 + 27036800*c*r^3 + 6910960*c^2 + 15771840*c^2*r + 8695680*c^2*r^2 + 1151360*c^3 + 1229760*c^3*r + 64400*c^4

def onsetP0_5_1_5M1B (c r : ℤ) : ℤ :=
 1396416 + 7202944*r + 13381760*r^2 + 10674944*r^3 + 3103744*r^4 + 1705984*c + 6274240*c*r + 7417536*c*r^2 + 2834944*c*r^3 + 733712*c^2 + 1712256*c^2*r + 966336*c^2*r^2 + 131264*c^3 + 145600*c^3*r + 8176*c^4

def onsetP0_5_1_6M1B (c r : ℤ) : ℤ :=
 77952 + 402304*r + 747264*r^2 + 594944*r^3 + 172032*r^4 + 97888*c + 361984*c*r + 430080*c*r^2 + 164864*c*r^3 + 43792*c^2 + 103488*c^2*r + 59136*c^2*r^2 + 8288*c^3 + 9408*c^3*r + 560*c^4

def onsetP0_5_1_7M1B (c r : ℤ) : ℤ :=
 1920 + 9856*r + 18176*r^2 + 14336*r^3 + 4096*r^4 + 2464*c + 9088*c*r + 10752*c*r^2 + 4096*c*r^3 + 1136*c^2 + 2688*c^2*r + 1536*c^2*r^2 + 224*c^3 + 256*c^3*r + 16*c^4

def onsetP0_5_2_0M1B (c r : ℤ) : ℤ :=
 227888640 + 1074366720*r + 1823955840*r^2 + 1353784320*r^3 + 375701760*r^4 + 208776960*c + 657377280*c*r + 667215360*c*r^2 + 221598720*c*r^3 + 56891520*c^2 + 103057920*c^2*r + 44997120*c^2*r^2 + 4838400*c^3 + 3548160*c^3*r + 80640*c^4

def onsetP0_5_2_1M1B (c r : ℤ) : ℤ :=
 278181216 + 1345325184*r + 2338545408*r^2 + 1767112704*r^3 + 497108352*r^4 + 273147840*c + 895362816*c*r + 942705792*c*r^2 + 323568384*c*r^3 + 83471904*c^2 + 160804224*c^2*r + 74335104*c^2*r^2 + 8628480*c^3 + 6941952*c^3*r + 209088*c^4

def onsetP0_5_2_2M1B (c r : ℤ) : ℤ :=
 148313088 + 733490688*r + 1303687168*r^2 + 1002693888*r^3 + 285797120*r^4 + 154949760*c + 526919232*c*r + 574709184*c*r^2 + 203851648*c*r^3 + 52351040*c^2 + 106884288*c^2*r + 52347456*c^2*r^2 + 6397440*c^3 + 5648384*c^3*r + 210112*c^4

def onsetP0_5_2_3M1B (c r : ℤ) : ℤ :=
 44929920 + 226382464*r + 410286464*r^2 + 320735744*r^3 + 92466304*r^4 + 49600096*c + 174137152*c*r + 196139328*c*r^2 + 71728384*c*r^3 + 18283664*c^2 + 39322752*c^2*r + 20336064*c^2*r^2 + 2574656*c^3 + 2478784*c^3*r + 108304*c^4

def onsetP0_5_2_4M1B (c r : ℤ) : ℤ :=
 8386560 + 42860160*r + 78870400*r^2 + 62469120*r^3 + 18152960*r^4 + 9717120*c + 35004480*c*r + 40501440*c*r^2 + 15191680*c*r^3 + 3859520*c^2 + 8668800*c^2*r + 4697280*c^2*r^2 + 611520*c^3 + 633920*c^3*r + 31360*c^4

def onsetP0_5_2_5M1B (c r : ℤ) : ℤ :=
 969024 + 4996096*r + 9279872*r^2 + 7406336*r^3 + 2157568*r^4 + 1170400*c + 4293184*c*r + 5062848*c*r^2 + 1931776*c*r^3 + 494816*c^2 + 1147776*c^2*r + 643776*c^2*r^2 + 86240*c^3 + 94528*c^3*r + 5152*c^4

def onsetP0_5_2_6M1B (c r : ℤ) : ℤ :=
 64512 + 333312*r + 620032*r^2 + 494592*r^3 + 143360*r^4 + 80640*c + 298368*c*r + 354816*c*r^2 + 136192*c*r^3 + 35840*c^2 + 84672*c^2*r + 48384*c^2*r^2 + 6720*c^3 + 7616*c^3*r + 448*c^4

def onsetP0_5_2_7M1B (c r : ℤ) : ℤ :=
 1920 + 9856*r + 18176*r^2 + 14336*r^3 + 4096*r^4 + 2464*c + 9088*c*r + 10752*c*r^2 + 4096*c*r^3 + 1136*c^2 + 2688*c^2*r + 1536*c^2*r^2 + 224*c^3 + 256*c^3*r + 16*c^4

def onsetG0_5_0M1B (c r : ℤ) : ℤ :=
 67832922078028800 + 673259122180915200*r + 2869337351855923200*r^2 + 6872469875195904000*r^3 + 10142095612723200000*r^4 + 9466175023880601600*r^5 + 5469980475720499200*r^6 + 1793314970586316800*r^7 + 255990773219328000*r^8 + 141614183567001600*c + 1185096262352486400*c*r + 4171588520524185600*c*r^2 + 8025899777925120000*c*r^3 + 9136662727746355200*c*r^4 + 6168424394229350400*c*r^5 + 2291683769509478400*c*r^6 + 362138085163008000*c*r^7 + 121666849969996800*c^2 + 838242943366348800*c^2*r + 2362476168093081600*c^2*r^2 + 3494811921334272000*c^2*r^3 + 2868506324490240000*c^2*r^4 + 1241185779980697600*c^2*r^5 + 221561517735936000*c^2*r^6 + 55725566754816000*c^3 + 306336575346278400*c^3*r + 661600553486745600*c^3*r^2 + 703411535064268800*c^3*r^3 + 368987104346112000*c^3*r^4 + 76538589216768000*c^3*r^5 + 14750250671923200*c^4 + 61920894254284800*c^4*r + 95821676155699200*c^4*r^2 + 64963692173721600*c^4*r^3 + 16326994231296000*c^4*r^4 + 2289200320512000*c^5 + 6866342667878400*c^5*r + 6766225411276800*c^5*r^2 + 2203516049817600*c^5*r^3 + 201900858163200*c^6 + 385564586803200*c^6*r + 184081534156800*c^6*r^2 + 9260000870400*c^7 + 8739776102400*c^7*r + 182078668800*c^8

theorem onsetG0_5_0M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_0M1B c r := by
 unfold onsetG0_5_0M1B
 positivity

def onsetG0_5_1M1B (c r : ℤ) : ℤ :=
 127161680109649920 + 1272400043773501440*r + 5469079126878904320*r^2 + 13211806169914490880*r^3 + 19660108856433131520*r^4 + 18494133652092026880*r^5 + 10763805790841241600*r^6 + 3551555732202455040*r^7 + 509771054824980480*r^8 + 272005370793676800*c + 2300958965789245440*c*r + 8190226688505200640*c*r^2 + 15934600499149946880*c*r^3 + 18340220120545935360*c*r^4 + 12514591878990888960*c*r^5 + 4697243386570506240*c*r^6 + 749562809756221440*c*r^7 + 240874353803704320*c^2 + 1682840593891860480*c^2*r + 4810918319430451200*c^2*r^2 + 7219415176594145280*c^2*r^3 + 6010715835897937920*c^2*r^4 + 2637858726360023040*c^2*r^5 + 477547288343838720*c^2*r^6 + 114551952577413120*c^3 + 640883853652008960*c^3*r + 1409082963780280320*c^3*r^2 + 1525376618437754880*c^3*r^3 + 814791076046438400*c^3*r^4 + 172122119912816640*c^3*r^5 + 31762341249730560*c^4 + 136257847236403200*c^4*r + 215536380793896960*c^4*r^2 + 149391284756152320*c^4*r^3 + 38382289595596800*c^4*r^4 + 5217502938439680*c^5 + 16062294300917760*c^5*r + 16245746177310720*c^5*r^2 + 5423947100651520*c^5*r^3 + 492655793172480*c^6 + 969379803463680*c^6*r + 474809362513920*c^6*r^2 + 24461587906560*c^7 + 23593927311360*c^7*r + 511771115520*c^8

theorem onsetG0_5_1M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_1M1B c r := by
 unfold onsetG0_5_1M1B
 positivity

def onsetG0_5_2M1B (c r : ℤ) : ℤ :=
 110209434748084224 + 1110723190943514624*r + 4810312311833419776*r^2 + 11709468612028809216*r^3 + 17554837204940636160*r^4 + 16630335970896936960*r^5 + 9741518292049625088*r^6 + 3232494548969914368*r^7 + 466169215095521280*r^8 + 241194552466581504*c + 2060117211320856576*c*r + 7406791450730090496*c*r^2 + 14556673332196982784*c*r^3 + 16921950836549197824*c*r^4 + 11658756415556468736*c*r^5 + 4416509097270853632*c*r^6 + 710911756164169728*c*r^7 + 219717082036472832*c^2 + 1554471647589740544*c^2*r + 4501785727970205696*c^2*r^2 + 6844228608490463232*c^2*r^3 + 5772853701911568384*c^2*r^4 + 2566187995363098624*c^2*r^5 + 470481597286170624*c^2*r^6 + 108204292537012224*c^3 + 615123572316696576*c^3*r + 1374703176891985920*c^3*r^2 + 1512879770797645824*c^3*r^3 + 821556877846118400*c^3*r^4 + 176433643910135808*c^3*r^5 + 31317833552753664*c^4 + 137040133943881728*c^4*r + 221176337250484224*c^4*r^2 + 156422878049894400*c^4*r^3 + 40999175920926720*c^4*r^4 + 5420470306922496*c^5 + 17090449481097216*c^5*r + 17701469715750912*c^5*r^2 + 6045657249300480*c^5*r^3 + 544854109943808*c^6 + 1101688327692288*c^6*r + 552676052017152*c^6*r^2 + 29070271512576*c^7 + 28668067577856*c^7*r + 647371210752*c^8

theorem onsetG0_5_2M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_2M1B c r := by
 unfold onsetG0_5_2M1B
 positivity

def onsetG0_5_3M1B (c r : ℤ) : ℤ :=
 58403948664176640 + 592295269656674304*r + 2581975507785203712*r^2 + 6327066699465523200*r^3 + 9547375607889788928*r^4 + 9100162090542071808*r^5 + 5360272009030041600*r^6 + 1787223375478259712*r^7 + 258731236096671744*r^8 + 130591157610848256*c + 1124942078454620160*c*r + 4080456367626067968*c*r^2 + 8091415371640258560*c*r^3 + 9489545384724873216*c*r^4 + 6593982292981235712*c*r^5 + 2518121705337176064*c*r^6 + 408378594862006272*c*r^7 + 122142854007595008*c^2 + 873874354677080064*c^2*r + 2560146178670395392*c^2*r^2 + 3937969114568810496*c^2*r^3 + 3360303325328302080*c^2*r^4 + 1510871303505199104*c^2*r^5 + 280098388932870144*c^2*r^6 + 62131456298569728*c^3 + 358304170330251264*c^3*r + 812593939863207936*c^3*r^2 + 907618692743454720*c^3*r^3 + 500213637890211840*c^3*r^4 + 109008689120378880*c^3*r^5 + 18708638125234176*c^4 + 83341581169975296*c^4*r + 136974198149160960*c^4*r^2 + 98648570918338560*c^4*r^3 + 26323493269463040*c^4*r^4 + 3397144923475968*c^5 + 10945290220462080*c^5*r + 11583118304206848*c^5*r^2 + 4038453012873216*c^5*r^3 + 361572793602048*c^6 + 749402029694976*c^6*r + 384425127518208*c^6*r^2 + 20597864964096*c^7 + 20767343149056*c^7*r + 487876515840*c^8

theorem onsetG0_5_3M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_3M1B c r := by
 unfold onsetG0_5_3M1B
 positivity

def onsetG0_5_4M1B (c r : ℤ) : ℤ :=
 21079804133928960 + 214909500128870400*r + 942047665355087872*r^2 + 2321440343251369984*r^3 + 3522200245517090816*r^4 + 3374454976642613248*r^5 + 1996764726761455616*r^6 + 668311858941067264*r^7 + 97027260108685312*r^8 + 48092488634480640*c + 417328161874620416*c*r + 1525348474803621888*c*r^2 + 3048154386737954816*c*r^3 + 3602140072419983360*c*r^4 + 2521349620791558144*c*r^5 + 969451132206333952*c*r^6 + 158200130795700224*c*r^7 + 46099966798047232*c^2 + 333064868660600832*c^2*r + 985670513464713216*c^2*r^2 + 1531706925426442240*c^2*r^3 + 1320331079862681600*c^2*r^4 + 599552401922310144*c^2*r^5 + 112215594431266816*c^2*r^6 + 24163240177785856*c^3 + 141118247736252416*c^3*r + 324217888733132800*c^3*r^2 + 366900383425515520*c^3*r^3 + 204855694033141760*c^3*r^4 + 45218173292085248*c^3*r^5 + 7545564242349056*c^4 + 34151394539816960*c^4*r + 57042619951994880*c^4*r^2 + 41750531529728000*c^4*r^3 + 11319050542858240*c^4*r^4 + 1431619131937792*c^5 + 4702641660401664*c^5*r + 5073491522942976*c^5*r^2 + 1802056523337728*c^5*r^3 + 160536553189376*c^6 + 340239692412928*c^6*r + 178174301218816*c^6*r^2 + 9709704933376*c^7 + 10003044122624*c^7*r + 244197409792*c^8

theorem onsetG0_5_4M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_4M1B c r := by
 unfold onsetG0_5_4M1B
 positivity

def onsetG0_5_5M1B (c r : ℤ) : ℤ :=
 5459452487516160 + 55899880181268480*r + 246138822217236480*r^2 + 609299947766415360*r^3 + 928519060294533120*r^4 + 893175929570426880*r^5 + 530377352522465280*r^6 + 178010000316825600*r^7 + 25891595415060480*r^8 + 12692157985382400*c + 110817610708869120*c*r + 407638151092838400*c*r^2 + 819867054424965120*c*r^3 + 975018535514849280*c*r^4 + 686586258854952960*c*r^5 + 265451965821665280*c*r^6 + 43529653896314880*c*r^7 + 12447274160670720*c^2 + 90684171158568960*c^2*r + 270695642406174720*c^2*r^2 + 424334312375500800*c^2*r^3 + 368937116979486720*c^2*r^4 + 168932898544435200*c^2*r^5 + 31870065143562240*c^2*r^6 + 6707215788779520*c^3 + 39602028284528640*c^3*r + 92012022976419840*c^3*r^2 + 105308907306086400*c^3*r^3 + 59460262383943680*c^3*r^4 + 13269183781109760*c^3*r^5 + 2165634218119680*c^4 + 9938586052577280*c^4*r + 16836241983375360*c^4*r^2 + 12497750072156160*c^4*r^3 + 3435549586022400*c^4*r^4 + 427690845388800*c^5 + 1429041095301120*c^5*r + 1568209286891520*c^5*r^2 + 566307581521920*c^5*r^3 + 50293985817600*c^6 + 108738680494080*c^6*r + 58027726632960*c^6*r^2 + 3213077575680*c^7 + 3378840084480*c^7*r + 85591994880*c^8

theorem onsetG0_5_5M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_5M1B c r := by
 unfold onsetG0_5_5M1B
 positivity

def onsetG0_5_6M1B (c r : ℤ) : ℤ :=
 1040342614843392 + 10687808730611712*r + 47223069684482048*r^2 + 117298894825914368*r^3 + 179336396190515200*r^4 + 173013965188628480*r^5 + 102983650348171264*r^6 + 34622501534695424*r^7 + 5039766878289920*r^8 + 2461475733491712*c + 21598874166059008*c*r + 79859978689118208*c*r^2 + 161449095627538432*c*r^3 + 192964120754470912*c*r^4 + 136517496210751488*c*r^5 + 53002073979846656*c*r^6 + 8722106760822784*c*r^7 + 2465648236706816*c^2 + 18088455685558272*c^2*r + 54381686008086528*c^2*r^2 + 85861301168685056*c^2*r^3 + 75179614607204352*c^2*r^4 + 34656823145398272*c^2*r^5 + 6579495645642752*c^2*r^6 + 1362915879406592*c^3 + 8121831501242368*c^3*r + 19049823241809920*c^3*r^2 + 22011012277624832*c^3*r^3 + 12544974843412480*c^3*r^4 + 2825076246544384*c^3*r^5 + 453729229364992*c^4 + 2107114465705984*c^4*r + 3612861550620672*c^4*r^2 + 2714390953738240*c^4*r^3 + 755042665717760*c^4*r^4 + 92940136153088*c^5 + 315153201205248*c^5*r + 350995664818176*c^5*r^2 + 128597878743040*c^5*r^3 + 11411526321664*c^6 + 25109096198144*c^6*r + 13628052279296*c^6*r^2 + 766379844608*c^7 + 821431840768*c^7*r + 21556887296*c^8

theorem onsetG0_5_6M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_6M1B c r := by
 unfold onsetG0_5_6M1B
 positivity

def onsetG0_5_7M1B (c r : ℤ) : ℤ :=
 146962660884480 + 1513379035348992*r + 6702748646178816*r^2 + 16687791845867520*r^3 + 25567597811073024*r^4 + 24709535404130304*r^5 + 14726123728404480*r^6 + 4953552297394176*r^7 + 720828987604992*r^8 + 353457082073088*c + 3113346389852160*c*r + 11556202948706304*c*r^2 + 23452628494417920*c*r^3 + 28133252057530368*c*r^4 + 19969567025135616*c*r^5 + 7774832253468672*c*r^6 + 1282190355726336*c*r^7 + 361064546648064*c^2 + 2663540243546112*c^2*r + 8053186481012736*c^2*r^2 + 12786783894355968*c^2*r^3 + 11257355601838080*c^2*r^4 + 5216192094339072*c^2*r^5 + 994904782405632*c^2*r^6 + 204315890171904*c^3 + 1226786063634432*c^3*r + 2899711877787648*c^3*r^2 + 3376365749084160*c^3*r^3 + 1938873148047360*c^3*r^4 + 439785157754880*c^3*r^5 + 69947085293568*c^4 + 328059680514048*c^4*r + 568165801512960*c^4*r^2 + 431159619502080*c^4*r^3 + 121110349086720*c^4*r^4 + 14811310854144*c^5 + 50854296084480*c^5*r + 57352195805184*c^5*r^2 + 21273215459328*c^5*r^3 + 1891166183424*c^6 + 4224603414528*c^6*r + 2327136989184*c^6*r^2 + 132910460928*c^7 + 144927756288*c^7*r + 3933296640*c^8

theorem onsetG0_5_7M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_7M1B c r := by
 unfold onsetG0_5_7M1B
 positivity

def onsetG0_5_8M1B (c r : ℤ) : ℤ :=
 15273385021440 + 157500923166720*r + 698508381290496*r^2 + 1741161562570752*r^3 + 2670191215362048*r^4 + 2582051067101184*r^5 + 1538903761747968*r^6 + 517337647153152*r^7 + 75174537854976*r^8 + 37296898007040*c + 329394284986368*c*r + 1225895193944064*c*r^2 + 2494194970165248*c*r^3 + 2998866161786880*c*r^4 + 2132763206418432*c*r^5 + 831533043941376*c*r^6 + 137237760049152*c*r^7 + 38795528841216*c^2 + 287381844320256*c^2*r + 872540333457408*c^2*r^2 + 1391101306183680*c^2*r^3 + 1229466888437760*c^2*r^4 + 571688989949952*c^2*r^5 + 109370167001088*c^2*r^6 + 22430421178368*c^3 + 135478271244288*c^3*r + 322144081889280*c^3*r^2 + 377318660812800*c^3*r^3 + 217910128558080*c^3*r^4 + 49691627618304*c^3*r^5 + 7877176543488*c^4 + 37239112243200*c^4*r + 65013302753280*c^4*r^2 + 49729127669760*c^4*r^3 + 14076481413120*c^4*r^4 + 1718944152576*c^5 + 5962565855232*c^5*r + 6793776396288*c^5*r^2 + 2545523871744*c^5*r^3 + 227376726528*c^6 + 514401183744*c^6*r + 286928775168*c^6*r^2 + 16650267648*c^7 + 18429100032*c^7*r + 516316416*c^8

theorem onsetG0_5_8M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_8M1B c r := by
 unfold onsetG0_5_8M1B
 positivity

def onsetG0_5_9M1B (c r : ℤ) : ℤ :=
 1138827755520 + 11748708679680*r + 52119932928000*r^2 + 129928644034560*r^3 + 199209801154560*r^4 + 192512602275840*r^5 + 114605543915520*r^6 + 38458317864960*r^7 + 5574167101440*r^8 + 2820438835200*c + 24946634711040*c*r + 92973568450560*c*r^2 + 189394114560000*c*r^3 + 227928255528960*c*r^4 + 162186477895680*c*r^5 + 63234944532480*c*r^6 + 10429928570880*c*r^7 + 2983062620160*c^2 + 22158905180160*c^2*r + 67461495521280*c^2*r^2 + 107830102302720*c^2*r^3 + 95518846402560*c^2*r^4 + 44499118325760*c^2*r^5 + 8524859965440*c^2*r^6 + 1758971074560*c^3 + 10669640755200*c^3*r + 25478603888640*c^3*r^2 + 29965096734720*c^3*r^3 + 17371990917120*c^3*r^4 + 3975109017600*c^3*r^5 + 632186472960*c^4 + 3006661969920*c^4*r + 5280723732480*c^4*r^2 + 4062988984320*c^4*r^3 + 1156510924800*c^4*r^4 + 141753937920*c^5 + 495646341120*c^5*r + 569255823360*c^5*r^2 + 214956994560*c^5*r^3 + 19355857920*c^6 + 44236093440*c^6*r + 24923781120*c^6*r^2 + 1470658560*c^7 + 1648066560*c^7*r + 47577600*c^8

theorem onsetG0_5_9M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_9M1B c r := by
 unfold onsetG0_5_9M1B
 positivity

def onsetG0_5_10M1B (c r : ℤ) : ℤ :=
 57830621184 + 596271857664*r + 2643125682176*r^2 + 6581982396416*r^3 + 10077357015040*r^4 + 9720532828160*r^5 + 5773037928448*r^6 + 1931485380608*r^7 + 278921216000*r^8 + 145098153984*c + 1283819708416*c*r + 4785393156096*c*r^2 + 9747157417984*c*r^3 + 11725050609664*c*r^4 + 8335839461376*c*r^5 + 3245512589312*c*r^6 + 534236889088*c*r^7 + 155826148352*c^2 + 1159147229184*c^2*r + 3533372645376*c^2*r^2 + 5653427290112*c^2*r^3 + 5011352715264*c^2*r^4 + 2335209160704*c^2*r^5 + 447242829824*c^2*r^6 + 93543209984*c^3 + 568929120256*c^3*r + 1362009743360*c^3*r^2 + 1605527404544*c^3*r^3 + 932624465920*c^3*r^4 + 213734391808*c^3*r^5 + 34331148544*c^4 + 163948761088*c^4*r + 289099259904*c^4*r^2 + 223271157760*c^4*r^3 + 63771115520*c^4*r^4 + 7888111616*c^5 + 27739815936*c^5*r + 32039411712*c^5*r^2 + 12163809280*c^5*r^3 + 1108054528*c^6 + 2551635968*c^6*r + 1448394752*c^6*r^2 + 86998016*c^7 + 98430976*c^7*r + 2922752*c^8

theorem onsetG0_5_10M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_10M1B c r := by
 unfold onsetG0_5_10M1B
 positivity

def onsetG0_5_11M1B (c r : ℤ) : ℤ :=
 1796014080 + 18488623104*r + 81800527872*r^2 + 203245486080*r^3 + 310356738048*r^4 + 298438361088*r^5 + 176601169920*r^6 + 58837696512*r^7 + 8455716864*r^8 + 4560224256*c + 40313978880*c*r + 150098608128*c*r^2 + 305281105920*c*r^3 + 366546518016*c*r^4 + 259991273472*c*r^5 + 100940120064*c*r^6 + 16559112192*c*r^7 + 4965961728*c^2 + 36940775424*c^2*r + 112577052672*c^2*r^2 + 180022542336*c^2*r^3 + 159425495040*c^2*r^4 + 74185703424*c^2*r^5 + 14180941824*c^2*r^6 + 3029741568*c^3 + 18445615104*c^3*r + 44192956416*c^3*r^2 + 52118814720*c^3*r^3 + 30277632000*c^3*r^4 + 6936330240*c^3*r^5 + 1133024256*c^4 + 5422534656*c^4*r + 9580462080*c^4*r^2 + 7411138560*c^4*r^3 + 2119434240*c^4*r^4 + 266047488*c^5 + 938864640*c^5*r + 1087930368*c^5*r^2 + 414253056*c^5*r^3 + 38320128*c^6 + 88682496*c^6*r + 50577408*c^6*r^2 + 3096576*c^7 + 3526656*c^7*r + 107520*c^8

theorem onsetG0_5_11M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_11M1B c r := by
 unfold onsetG0_5_11M1B
 positivity

def onsetG0_5_12M1B (c r : ℤ) : ℤ :=
 25804800 + 264929280*r + 1168556032*r^2 + 2893348864*r^3 + 4400807936*r^4 + 4213178368*r^5 + 2480930816*r^6 + 822083584*r^7 + 117440512*r^8 + 66232320*c + 584278016*c*r + 2170011648*c*r^2 + 4400807936*c*r^3 + 5266472960*c*r^4 + 3721396224*c*r^5 + 1438646272*c*r^6 + 234881024*c*r^7 + 73034752*c^2 + 542502912*c^2*r + 1650302976*c^2*r^2 + 2633236480*c^2*r^3 + 2325872640*c^2*r^4 + 1078984704*c^2*r^5 + 205520896*c^2*r^6 + 45208576*c^3 + 275050496*c^3*r + 658309120*c^3*r^2 + 775290880*c^3*r^3 + 449576960*c^3*r^4 + 102760448*c^3*r^5 + 17190656*c^4 + 82288640*c^4*r + 145367040*c^4*r^2 + 112394240*c^4*r^3 + 32112640*c^4*r^4 + 4114432*c^5 + 14536704*c^5*r + 16859136*c^5*r^2 + 6422528*c^5*r^3 + 605696*c^6 + 1404928*c^6*r + 802816*c^6*r^2 + 50176*c^7 + 57344*c^7*r + 1792*c^8

theorem onsetG0_5_12M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_12M1B c r := by
 unfold onsetG0_5_12M1B
 positivity

def onsetG0_5_13M1B (c r : ℤ) : ℤ :=
 0

theorem onsetG0_5_13M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_13M1B c r := by
 unfold onsetG0_5_13M1B
 positivity

def onsetG0_5_14M1B (c r : ℤ) : ℤ :=
 0

theorem onsetG0_5_14M1B_nonneg (c r : ℤ) (hc : 0≤c) (hr : 0≤r) : 0≤onsetG0_5_14M1B c r := by
 unfold onsetG0_5_14M1B
 positivity

theorem onset_stage0_5_0M1B (n c r : ℤ) :
 onsetValue0_5M1B (n+7) (5 + 4*r + 1*c) (1 + 1*r)=onsetP0_5_0_0M1B c r*n^0 + onsetP0_5_0_1M1B c r*n^1 + onsetP0_5_0_2M1B c r*n^2 + onsetP0_5_0_3M1B c r*n^3 + onsetP0_5_0_4M1B c r*n^4 + onsetP0_5_0_5M1B c r*n^5 + onsetP0_5_0_6M1B c r*n^6 + onsetP0_5_0_7M1B c r*n^7 := by
 unfold onsetValue0_5M1B backShape0M94 onsetCorrection0_5M1B onsetP0_5_0_0M1B onsetP0_5_0_1M1B onsetP0_5_0_2M1B onsetP0_5_0_3M1B onsetP0_5_0_4M1B onsetP0_5_0_5M1B onsetP0_5_0_6M1B onsetP0_5_0_7M1B
 ring

theorem onset_stage0_5_1M1B (n c r : ℤ) :
 onsetValue0_6M1B (n+7) (5 + 4*r + 1*c) (1 + 1*r)=onsetP0_5_1_0M1B c r*n^0 + onsetP0_5_1_1M1B c r*n^1 + onsetP0_5_1_2M1B c r*n^2 + onsetP0_5_1_3M1B c r*n^3 + onsetP0_5_1_4M1B c r*n^4 + onsetP0_5_1_5M1B c r*n^5 + onsetP0_5_1_6M1B c r*n^6 + onsetP0_5_1_7M1B c r*n^7 := by
 unfold onsetValue0_6M1B backShape0M94 onsetCorrection0_6M1B onsetP0_5_1_0M1B onsetP0_5_1_1M1B onsetP0_5_1_2M1B onsetP0_5_1_3M1B onsetP0_5_1_4M1B onsetP0_5_1_5M1B onsetP0_5_1_6M1B onsetP0_5_1_7M1B
 ring

theorem onset_stage0_5_2M1B (n c r : ℤ) :
 onsetValue0_7M1B (n+7) (5 + 4*r + 1*c) (1 + 1*r)=onsetP0_5_2_0M1B c r*n^0 + onsetP0_5_2_1M1B c r*n^1 + onsetP0_5_2_2M1B c r*n^2 + onsetP0_5_2_3M1B c r*n^3 + onsetP0_5_2_4M1B c r*n^4 + onsetP0_5_2_5M1B c r*n^5 + onsetP0_5_2_6M1B c r*n^6 + onsetP0_5_2_7M1B c r*n^7 := by
 unfold onsetValue0_7M1B backShape0M94 onsetCorrection0_7M1B onsetP0_5_2_0M1B onsetP0_5_2_1M1B onsetP0_5_2_2M1B onsetP0_5_2_3M1B onsetP0_5_2_4M1B onsetP0_5_2_5M1B onsetP0_5_2_6M1B onsetP0_5_2_7M1B
 ring

theorem onset_column0_5_0M1B (c r : ℤ) :
 (onsetP0_5_1_0M1B c r*onsetP0_5_1_0M1B c r)-(onsetP0_5_0_0M1B c r*onsetP0_5_2_0M1B c r)=onsetG0_5_0M1B c r := by
 unfold onsetG0_5_0M1B onsetP0_5_0_0M1B onsetP0_5_1_0M1B onsetP0_5_2_0M1B
 ring

theorem onset_column0_5_1M1B (c r : ℤ) :
 (onsetP0_5_1_0M1B c r*onsetP0_5_1_1M1B c r + onsetP0_5_1_1M1B c r*onsetP0_5_1_0M1B c r)-(onsetP0_5_0_0M1B c r*onsetP0_5_2_1M1B c r + onsetP0_5_0_1M1B c r*onsetP0_5_2_0M1B c r)=onsetG0_5_1M1B c r := by
 unfold onsetG0_5_1M1B onsetP0_5_0_0M1B onsetP0_5_0_1M1B onsetP0_5_1_0M1B onsetP0_5_1_1M1B onsetP0_5_2_0M1B onsetP0_5_2_1M1B
 ring

theorem onset_column0_5_2M1B (c r : ℤ) :
 (onsetP0_5_1_0M1B c r*onsetP0_5_1_2M1B c r + onsetP0_5_1_1M1B c r*onsetP0_5_1_1M1B c r + onsetP0_5_1_2M1B c r*onsetP0_5_1_0M1B c r)-(onsetP0_5_0_0M1B c r*onsetP0_5_2_2M1B c r + onsetP0_5_0_1M1B c r*onsetP0_5_2_1M1B c r + onsetP0_5_0_2M1B c r*onsetP0_5_2_0M1B c r)=onsetG0_5_2M1B c r := by
 unfold onsetG0_5_2M1B onsetP0_5_0_0M1B onsetP0_5_0_1M1B onsetP0_5_0_2M1B onsetP0_5_1_0M1B onsetP0_5_1_1M1B onsetP0_5_1_2M1B onsetP0_5_2_0M1B onsetP0_5_2_1M1B onsetP0_5_2_2M1B
 ring

theorem onset_column0_5_3M1B (c r : ℤ) :
 (onsetP0_5_1_0M1B c r*onsetP0_5_1_3M1B c r + onsetP0_5_1_1M1B c r*onsetP0_5_1_2M1B c r + onsetP0_5_1_2M1B c r*onsetP0_5_1_1M1B c r + onsetP0_5_1_3M1B c r*onsetP0_5_1_0M1B c r)-(onsetP0_5_0_0M1B c r*onsetP0_5_2_3M1B c r + onsetP0_5_0_1M1B c r*onsetP0_5_2_2M1B c r + onsetP0_5_0_2M1B c r*onsetP0_5_2_1M1B c r + onsetP0_5_0_3M1B c r*onsetP0_5_2_0M1B c r)=onsetG0_5_3M1B c r := by
 unfold onsetG0_5_3M1B onsetP0_5_0_0M1B onsetP0_5_0_1M1B onsetP0_5_0_2M1B onsetP0_5_0_3M1B onsetP0_5_1_0M1B onsetP0_5_1_1M1B onsetP0_5_1_2M1B onsetP0_5_1_3M1B onsetP0_5_2_0M1B onsetP0_5_2_1M1B onsetP0_5_2_2M1B onsetP0_5_2_3M1B
 ring

theorem onset_column0_5_4M1B (c r : ℤ) :
 (onsetP0_5_1_0M1B c r*onsetP0_5_1_4M1B c r + onsetP0_5_1_1M1B c r*onsetP0_5_1_3M1B c r + onsetP0_5_1_2M1B c r*onsetP0_5_1_2M1B c r + onsetP0_5_1_3M1B c r*onsetP0_5_1_1M1B c r + onsetP0_5_1_4M1B c r*onsetP0_5_1_0M1B c r)-(onsetP0_5_0_0M1B c r*onsetP0_5_2_4M1B c r + onsetP0_5_0_1M1B c r*onsetP0_5_2_3M1B c r + onsetP0_5_0_2M1B c r*onsetP0_5_2_2M1B c r + onsetP0_5_0_3M1B c r*onsetP0_5_2_1M1B c r + onsetP0_5_0_4M1B c r*onsetP0_5_2_0M1B c r)=onsetG0_5_4M1B c r := by
 unfold onsetG0_5_4M1B onsetP0_5_0_0M1B onsetP0_5_0_1M1B onsetP0_5_0_2M1B onsetP0_5_0_3M1B onsetP0_5_0_4M1B onsetP0_5_1_0M1B onsetP0_5_1_1M1B onsetP0_5_1_2M1B onsetP0_5_1_3M1B onsetP0_5_1_4M1B onsetP0_5_2_0M1B onsetP0_5_2_1M1B onsetP0_5_2_2M1B onsetP0_5_2_3M1B onsetP0_5_2_4M1B
 ring

theorem onset_column0_5_5M1B (c r : ℤ) :
 (onsetP0_5_1_0M1B c r*onsetP0_5_1_5M1B c r + onsetP0_5_1_1M1B c r*onsetP0_5_1_4M1B c r + onsetP0_5_1_2M1B c r*onsetP0_5_1_3M1B c r + onsetP0_5_1_3M1B c r*onsetP0_5_1_2M1B c r + onsetP0_5_1_4M1B c r*onsetP0_5_1_1M1B c r + onsetP0_5_1_5M1B c r*onsetP0_5_1_0M1B c r)-(onsetP0_5_0_0M1B c r*onsetP0_5_2_5M1B c r + onsetP0_5_0_1M1B c r*onsetP0_5_2_4M1B c r + onsetP0_5_0_2M1B c r*onsetP0_5_2_3M1B c r + onsetP0_5_0_3M1B c r*onsetP0_5_2_2M1B c r + onsetP0_5_0_4M1B c r*onsetP0_5_2_1M1B c r + onsetP0_5_0_5M1B c r*onsetP0_5_2_0M1B c r)=onsetG0_5_5M1B c r := by
 unfold onsetG0_5_5M1B onsetP0_5_0_0M1B onsetP0_5_0_1M1B onsetP0_5_0_2M1B onsetP0_5_0_3M1B onsetP0_5_0_4M1B onsetP0_5_0_5M1B onsetP0_5_1_0M1B onsetP0_5_1_1M1B onsetP0_5_1_2M1B onsetP0_5_1_3M1B onsetP0_5_1_4M1B onsetP0_5_1_5M1B onsetP0_5_2_0M1B onsetP0_5_2_1M1B onsetP0_5_2_2M1B onsetP0_5_2_3M1B onsetP0_5_2_4M1B onsetP0_5_2_5M1B
 ring

theorem onset_column0_5_6M1B (c r : ℤ) :
 (onsetP0_5_1_0M1B c r*onsetP0_5_1_6M1B c r + onsetP0_5_1_1M1B c r*onsetP0_5_1_5M1B c r + onsetP0_5_1_2M1B c r*onsetP0_5_1_4M1B c r + onsetP0_5_1_3M1B c r*onsetP0_5_1_3M1B c r + onsetP0_5_1_4M1B c r*onsetP0_5_1_2M1B c r + onsetP0_5_1_5M1B c r*onsetP0_5_1_1M1B c r + onsetP0_5_1_6M1B c r*onsetP0_5_1_0M1B c r)-(onsetP0_5_0_0M1B c r*onsetP0_5_2_6M1B c r + onsetP0_5_0_1M1B c r*onsetP0_5_2_5M1B c r + onsetP0_5_0_2M1B c r*onsetP0_5_2_4M1B c r + onsetP0_5_0_3M1B c r*onsetP0_5_2_3M1B c r + onsetP0_5_0_4M1B c r*onsetP0_5_2_2M1B c r + onsetP0_5_0_5M1B c r*onsetP0_5_2_1M1B c r + onsetP0_5_0_6M1B c r*onsetP0_5_2_0M1B c r)=onsetG0_5_6M1B c r := by
 unfold onsetG0_5_6M1B onsetP0_5_0_0M1B onsetP0_5_0_1M1B onsetP0_5_0_2M1B onsetP0_5_0_3M1B onsetP0_5_0_4M1B onsetP0_5_0_5M1B onsetP0_5_0_6M1B onsetP0_5_1_0M1B onsetP0_5_1_1M1B onsetP0_5_1_2M1B onsetP0_5_1_3M1B onsetP0_5_1_4M1B onsetP0_5_1_5M1B onsetP0_5_1_6M1B onsetP0_5_2_0M1B onsetP0_5_2_1M1B onsetP0_5_2_2M1B onsetP0_5_2_3M1B onsetP0_5_2_4M1B onsetP0_5_2_5M1B onsetP0_5_2_6M1B
 ring

theorem onset_column0_5_7M1B (c r : ℤ) :
 (onsetP0_5_1_0M1B c r*onsetP0_5_1_7M1B c r + onsetP0_5_1_1M1B c r*onsetP0_5_1_6M1B c r + onsetP0_5_1_2M1B c r*onsetP0_5_1_5M1B c r + onsetP0_5_1_3M1B c r*onsetP0_5_1_4M1B c r + onsetP0_5_1_4M1B c r*onsetP0_5_1_3M1B c r + onsetP0_5_1_5M1B c r*onsetP0_5_1_2M1B c r + onsetP0_5_1_6M1B c r*onsetP0_5_1_1M1B c r + onsetP0_5_1_7M1B c r*onsetP0_5_1_0M1B c r)-(onsetP0_5_0_0M1B c r*onsetP0_5_2_7M1B c r + onsetP0_5_0_1M1B c r*onsetP0_5_2_6M1B c r + onsetP0_5_0_2M1B c r*onsetP0_5_2_5M1B c r + onsetP0_5_0_3M1B c r*onsetP0_5_2_4M1B c r + onsetP0_5_0_4M1B c r*onsetP0_5_2_3M1B c r + onsetP0_5_0_5M1B c r*onsetP0_5_2_2M1B c r + onsetP0_5_0_6M1B c r*onsetP0_5_2_1M1B c r + onsetP0_5_0_7M1B c r*onsetP0_5_2_0M1B c r)=onsetG0_5_7M1B c r := by
 unfold onsetG0_5_7M1B onsetP0_5_0_0M1B onsetP0_5_0_1M1B onsetP0_5_0_2M1B onsetP0_5_0_3M1B onsetP0_5_0_4M1B onsetP0_5_0_5M1B onsetP0_5_0_6M1B onsetP0_5_0_7M1B onsetP0_5_1_0M1B onsetP0_5_1_1M1B onsetP0_5_1_2M1B onsetP0_5_1_3M1B onsetP0_5_1_4M1B onsetP0_5_1_5M1B onsetP0_5_1_6M1B onsetP0_5_1_7M1B onsetP0_5_2_0M1B onsetP0_5_2_1M1B onsetP0_5_2_2M1B onsetP0_5_2_3M1B onsetP0_5_2_4M1B onsetP0_5_2_5M1B onsetP0_5_2_6M1B onsetP0_5_2_7M1B
 ring

theorem onset_column0_5_8M1B (c r : ℤ) :
 (onsetP0_5_1_1M1B c r*onsetP0_5_1_7M1B c r + onsetP0_5_1_2M1B c r*onsetP0_5_1_6M1B c r + onsetP0_5_1_3M1B c r*onsetP0_5_1_5M1B c r + onsetP0_5_1_4M1B c r*onsetP0_5_1_4M1B c r + onsetP0_5_1_5M1B c r*onsetP0_5_1_3M1B c r + onsetP0_5_1_6M1B c r*onsetP0_5_1_2M1B c r + onsetP0_5_1_7M1B c r*onsetP0_5_1_1M1B c r)-(onsetP0_5_0_1M1B c r*onsetP0_5_2_7M1B c r + onsetP0_5_0_2M1B c r*onsetP0_5_2_6M1B c r + onsetP0_5_0_3M1B c r*onsetP0_5_2_5M1B c r + onsetP0_5_0_4M1B c r*onsetP0_5_2_4M1B c r + onsetP0_5_0_5M1B c r*onsetP0_5_2_3M1B c r + onsetP0_5_0_6M1B c r*onsetP0_5_2_2M1B c r + onsetP0_5_0_7M1B c r*onsetP0_5_2_1M1B c r)=onsetG0_5_8M1B c r := by
 unfold onsetG0_5_8M1B onsetP0_5_0_1M1B onsetP0_5_0_2M1B onsetP0_5_0_3M1B onsetP0_5_0_4M1B onsetP0_5_0_5M1B onsetP0_5_0_6M1B onsetP0_5_0_7M1B onsetP0_5_1_1M1B onsetP0_5_1_2M1B onsetP0_5_1_3M1B onsetP0_5_1_4M1B onsetP0_5_1_5M1B onsetP0_5_1_6M1B onsetP0_5_1_7M1B onsetP0_5_2_1M1B onsetP0_5_2_2M1B onsetP0_5_2_3M1B onsetP0_5_2_4M1B onsetP0_5_2_5M1B onsetP0_5_2_6M1B onsetP0_5_2_7M1B
 ring

theorem onset_column0_5_9M1B (c r : ℤ) :
 (onsetP0_5_1_2M1B c r*onsetP0_5_1_7M1B c r + onsetP0_5_1_3M1B c r*onsetP0_5_1_6M1B c r + onsetP0_5_1_4M1B c r*onsetP0_5_1_5M1B c r + onsetP0_5_1_5M1B c r*onsetP0_5_1_4M1B c r + onsetP0_5_1_6M1B c r*onsetP0_5_1_3M1B c r + onsetP0_5_1_7M1B c r*onsetP0_5_1_2M1B c r)-(onsetP0_5_0_2M1B c r*onsetP0_5_2_7M1B c r + onsetP0_5_0_3M1B c r*onsetP0_5_2_6M1B c r + onsetP0_5_0_4M1B c r*onsetP0_5_2_5M1B c r + onsetP0_5_0_5M1B c r*onsetP0_5_2_4M1B c r + onsetP0_5_0_6M1B c r*onsetP0_5_2_3M1B c r + onsetP0_5_0_7M1B c r*onsetP0_5_2_2M1B c r)=onsetG0_5_9M1B c r := by
 unfold onsetG0_5_9M1B onsetP0_5_0_2M1B onsetP0_5_0_3M1B onsetP0_5_0_4M1B onsetP0_5_0_5M1B onsetP0_5_0_6M1B onsetP0_5_0_7M1B onsetP0_5_1_2M1B onsetP0_5_1_3M1B onsetP0_5_1_4M1B onsetP0_5_1_5M1B onsetP0_5_1_6M1B onsetP0_5_1_7M1B onsetP0_5_2_2M1B onsetP0_5_2_3M1B onsetP0_5_2_4M1B onsetP0_5_2_5M1B onsetP0_5_2_6M1B onsetP0_5_2_7M1B
 ring

theorem onset_column0_5_10M1B (c r : ℤ) :
 (onsetP0_5_1_3M1B c r*onsetP0_5_1_7M1B c r + onsetP0_5_1_4M1B c r*onsetP0_5_1_6M1B c r + onsetP0_5_1_5M1B c r*onsetP0_5_1_5M1B c r + onsetP0_5_1_6M1B c r*onsetP0_5_1_4M1B c r + onsetP0_5_1_7M1B c r*onsetP0_5_1_3M1B c r)-(onsetP0_5_0_3M1B c r*onsetP0_5_2_7M1B c r + onsetP0_5_0_4M1B c r*onsetP0_5_2_6M1B c r + onsetP0_5_0_5M1B c r*onsetP0_5_2_5M1B c r + onsetP0_5_0_6M1B c r*onsetP0_5_2_4M1B c r + onsetP0_5_0_7M1B c r*onsetP0_5_2_3M1B c r)=onsetG0_5_10M1B c r := by
 unfold onsetG0_5_10M1B onsetP0_5_0_3M1B onsetP0_5_0_4M1B onsetP0_5_0_5M1B onsetP0_5_0_6M1B onsetP0_5_0_7M1B onsetP0_5_1_3M1B onsetP0_5_1_4M1B onsetP0_5_1_5M1B onsetP0_5_1_6M1B onsetP0_5_1_7M1B onsetP0_5_2_3M1B onsetP0_5_2_4M1B onsetP0_5_2_5M1B onsetP0_5_2_6M1B onsetP0_5_2_7M1B
 ring

theorem onset_column0_5_11M1B (c r : ℤ) :
 (onsetP0_5_1_4M1B c r*onsetP0_5_1_7M1B c r + onsetP0_5_1_5M1B c r*onsetP0_5_1_6M1B c r + onsetP0_5_1_6M1B c r*onsetP0_5_1_5M1B c r + onsetP0_5_1_7M1B c r*onsetP0_5_1_4M1B c r)-(onsetP0_5_0_4M1B c r*onsetP0_5_2_7M1B c r + onsetP0_5_0_5M1B c r*onsetP0_5_2_6M1B c r + onsetP0_5_0_6M1B c r*onsetP0_5_2_5M1B c r + onsetP0_5_0_7M1B c r*onsetP0_5_2_4M1B c r)=onsetG0_5_11M1B c r := by
 unfold onsetG0_5_11M1B onsetP0_5_0_4M1B onsetP0_5_0_5M1B onsetP0_5_0_6M1B onsetP0_5_0_7M1B onsetP0_5_1_4M1B onsetP0_5_1_5M1B onsetP0_5_1_6M1B onsetP0_5_1_7M1B onsetP0_5_2_4M1B onsetP0_5_2_5M1B onsetP0_5_2_6M1B onsetP0_5_2_7M1B
 ring

theorem onset_column0_5_12M1B (c r : ℤ) :
 (onsetP0_5_1_5M1B c r*onsetP0_5_1_7M1B c r + onsetP0_5_1_6M1B c r*onsetP0_5_1_6M1B c r + onsetP0_5_1_7M1B c r*onsetP0_5_1_5M1B c r)-(onsetP0_5_0_5M1B c r*onsetP0_5_2_7M1B c r + onsetP0_5_0_6M1B c r*onsetP0_5_2_6M1B c r + onsetP0_5_0_7M1B c r*onsetP0_5_2_5M1B c r)=onsetG0_5_12M1B c r := by
 unfold onsetG0_5_12M1B onsetP0_5_0_5M1B onsetP0_5_0_6M1B onsetP0_5_0_7M1B onsetP0_5_1_5M1B onsetP0_5_1_6M1B onsetP0_5_1_7M1B onsetP0_5_2_5M1B onsetP0_5_2_6M1B onsetP0_5_2_7M1B
 ring

theorem onset_column0_5_13M1B (c r : ℤ) :
 (onsetP0_5_1_6M1B c r*onsetP0_5_1_7M1B c r + onsetP0_5_1_7M1B c r*onsetP0_5_1_6M1B c r)-(onsetP0_5_0_6M1B c r*onsetP0_5_2_7M1B c r + onsetP0_5_0_7M1B c r*onsetP0_5_2_6M1B c r)=onsetG0_5_13M1B c r := by
 unfold onsetG0_5_13M1B onsetP0_5_0_6M1B onsetP0_5_0_7M1B onsetP0_5_1_6M1B onsetP0_5_1_7M1B onsetP0_5_2_6M1B onsetP0_5_2_7M1B
 ring

theorem onset_column0_5_14M1B (c r : ℤ) :
 (onsetP0_5_1_7M1B c r*onsetP0_5_1_7M1B c r)-(onsetP0_5_0_7M1B c r*onsetP0_5_2_7M1B c r)=onsetG0_5_14M1B c r := by
 unfold onsetG0_5_14M1B onsetP0_5_0_7M1B onsetP0_5_1_7M1B onsetP0_5_2_7M1B
 ring

attribute [local irreducible] onsetP0_5_0_0M1B onsetP0_5_0_1M1B onsetP0_5_0_2M1B onsetP0_5_0_3M1B onsetP0_5_0_4M1B onsetP0_5_0_5M1B onsetP0_5_0_6M1B onsetP0_5_0_7M1B onsetP0_5_1_0M1B onsetP0_5_1_1M1B onsetP0_5_1_2M1B onsetP0_5_1_3M1B onsetP0_5_1_4M1B onsetP0_5_1_5M1B onsetP0_5_1_6M1B onsetP0_5_1_7M1B onsetP0_5_2_0M1B onsetP0_5_2_1M1B onsetP0_5_2_2M1B onsetP0_5_2_3M1B onsetP0_5_2_4M1B onsetP0_5_2_5M1B onsetP0_5_2_6M1B onsetP0_5_2_7M1B onsetG0_5_0M1B onsetG0_5_1M1B onsetG0_5_2M1B onsetG0_5_3M1B onsetG0_5_4M1B onsetG0_5_5M1B onsetG0_5_6M1B onsetG0_5_7M1B onsetG0_5_8M1B onsetG0_5_9M1B onsetG0_5_10M1B onsetG0_5_11M1B onsetG0_5_12M1B onsetG0_5_13M1B onsetG0_5_14M1B

theorem onset_columns_lc0_5M1B (n c r : ℤ) (hn : 0≤n) (hc : 0≤c) (hr : 0≤r) :
 onsetValue0_5M1B (n+7) (5 + 4*r + 1*c) (1 + 1*r)*
 onsetValue0_7M1B (n+7) (5 + 4*r + 1*c) (1 + 1*r)≤
 onsetValue0_6M1B (n+7) (5 + 4*r + 1*c) (1 + 1*r)^2 := by
 apply sub_nonneg.mp
 rw [onset_stage0_5_0M1B,onset_stage0_5_1M1B,onset_stage0_5_2M1B]
 have hgap : (onsetP0_5_1_0M1B c r*n^0 + onsetP0_5_1_1M1B c r*n^1 + onsetP0_5_1_2M1B c r*n^2 + onsetP0_5_1_3M1B c r*n^3 + onsetP0_5_1_4M1B c r*n^4 + onsetP0_5_1_5M1B c r*n^5 + onsetP0_5_1_6M1B c r*n^6 + onsetP0_5_1_7M1B c r*n^7)^2-(onsetP0_5_0_0M1B c r*n^0 + onsetP0_5_0_1M1B c r*n^1 + onsetP0_5_0_2M1B c r*n^2 + onsetP0_5_0_3M1B c r*n^3 + onsetP0_5_0_4M1B c r*n^4 + onsetP0_5_0_5M1B c r*n^5 + onsetP0_5_0_6M1B c r*n^6 + onsetP0_5_0_7M1B c r*n^7)*(onsetP0_5_2_0M1B c r*n^0 + onsetP0_5_2_1M1B c r*n^1 + onsetP0_5_2_2M1B c r*n^2 + onsetP0_5_2_3M1B c r*n^3 + onsetP0_5_2_4M1B c r*n^4 + onsetP0_5_2_5M1B c r*n^5 + onsetP0_5_2_6M1B c r*n^6 + onsetP0_5_2_7M1B c r*n^7)=onsetG0_5_0M1B c r*n^0 + onsetG0_5_1M1B c r*n^1 + onsetG0_5_2M1B c r*n^2 + onsetG0_5_3M1B c r*n^3 + onsetG0_5_4M1B c r*n^4 + onsetG0_5_5M1B c r*n^5 + onsetG0_5_6M1B c r*n^6 + onsetG0_5_7M1B c r*n^7 + onsetG0_5_8M1B c r*n^8 + onsetG0_5_9M1B c r*n^9 + onsetG0_5_10M1B c r*n^10 + onsetG0_5_11M1B c r*n^11 + onsetG0_5_12M1B c r*n^12 + onsetG0_5_13M1B c r*n^13 + onsetG0_5_14M1B c r*n^14 := by
  rw [←onset_column0_5_0M1B,←onset_column0_5_1M1B,←onset_column0_5_2M1B,←onset_column0_5_3M1B,←onset_column0_5_4M1B,←onset_column0_5_5M1B,←onset_column0_5_6M1B,←onset_column0_5_7M1B,←onset_column0_5_8M1B,←onset_column0_5_9M1B,←onset_column0_5_10M1B,←onset_column0_5_11M1B,←onset_column0_5_12M1B,←onset_column0_5_13M1B,←onset_column0_5_14M1B]
  ring
 rw [hgap]
 have h0 := onsetG0_5_0M1B_nonneg c r hc hr
 have h1 := onsetG0_5_1M1B_nonneg c r hc hr
 have h2 := onsetG0_5_2M1B_nonneg c r hc hr
 have h3 := onsetG0_5_3M1B_nonneg c r hc hr
 have h4 := onsetG0_5_4M1B_nonneg c r hc hr
 have h5 := onsetG0_5_5M1B_nonneg c r hc hr
 have h6 := onsetG0_5_6M1B_nonneg c r hc hr
 have h7 := onsetG0_5_7M1B_nonneg c r hc hr
 have h8 := onsetG0_5_8M1B_nonneg c r hc hr
 have h9 := onsetG0_5_9M1B_nonneg c r hc hr
 have h10 := onsetG0_5_10M1B_nonneg c r hc hr
 have h11 := onsetG0_5_11M1B_nonneg c r hc hr
 have h12 := onsetG0_5_12M1B_nonneg c r hc hr
 have h13 := onsetG0_5_13M1B_nonneg c r hc hr
 have h14 := onsetG0_5_14M1B_nonneg c r hc hr
 positivity
end
end MathGKM.Markov
