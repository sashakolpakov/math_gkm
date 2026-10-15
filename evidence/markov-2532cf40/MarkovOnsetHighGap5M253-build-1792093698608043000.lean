import MarkovOnsetHighSplitDefsM253
/-! Machine-authored request 2532cf40. Coefficient-wise onset gap proof. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536

def onsetHighGC5_0_0M253 (N : ℤ) : ℤ := ((((((((((((39715445145600*N + 3406586361937920)*N + 134036064867188736)*N + 3199421598683627520)*N + 51609607835741061120)*N + 592797966837845852160)*N + 4972339816954369671168)*N + 30693001516876561121280)*N + 138395926247984187310080)*N + 444606864141690655211520)*N + 966070051233625278775296)*N + 1274877880425882825523200)*N + 772767095403925536768000)

theorem onsetHighGC5_0_0M253_eq (N : ℤ) : (onsetHighC6_0_0M253 N*onsetHighC6_0_0M253 N-onsetHighC5_0_0M253 N*onsetHighC7_0_0M253 N)=onsetHighGC5_0_0M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC6_0_0M253 onsetHighC7_0_0M253 onsetHighGC5_0_0M253
 ring

theorem onsetHighGC5_0_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_0_0M253 N := by
 unfold onsetHighGC5_0_0M253
 positivity

def onsetHighGC5_0_1M253 (N : ℤ) : ℤ := ((((((((((((95039615139840*N + 8266396534308864)*N + 329661272077369344)*N + 7971704016265543680)*N + 130201220107232870400)*N + 1513410928187529756672)*N + 12838956632291482140672)*N + 80107947326587779809280)*N + 364900385908847615016960)*N + 1183564460168243607896064)*N + 2595045769046643188957184)*N + 3453747342281314562211840)*N + 2110243420080885635481600)

theorem onsetHighGC5_0_1M253_eq (N : ℤ) : ((onsetHighC6_0_0M253 N*onsetHighC6_0_1M253 N-onsetHighC5_0_0M253 N*onsetHighC7_0_1M253 N) + (onsetHighC6_0_1M253 N*onsetHighC6_0_0M253 N-onsetHighC5_0_1M253 N*onsetHighC7_0_0M253 N))=onsetHighGC5_0_1M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC7_0_0M253 onsetHighC7_0_1M253 onsetHighGC5_0_1M253
 ring

theorem onsetHighGC5_0_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_0_1M253 N := by
 unfold onsetHighGC5_0_1M253
 positivity

def onsetHighGC5_0_2M253 (N : ℤ) : ℤ := ((((((((((((99044387979264*N + 8734701483196416)*N + 353037336918884352)*N + 8648263991694458880)*N + 143025142229757591552)*N + 1682517959941831262208)*N + 14438337082841397067776)*N + 91079783170660694753280)*N + 419229284701339660713984)*N + 1373321577603585967128576)*N + 3039507649311129223299072)*N + 4081376302751434345021440)*N + 2514743187873847934976000)

theorem onsetHighGC5_0_2M253_eq (N : ℤ) : ((onsetHighC6_0_0M253 N*onsetHighC6_0_2M253 N-onsetHighC5_0_0M253 N*onsetHighC7_0_2M253 N) + ((onsetHighC6_0_1M253 N*onsetHighC6_0_1M253 N-onsetHighC5_0_1M253 N*onsetHighC7_0_1M253 N) + (onsetHighC6_0_2M253 N*onsetHighC6_0_0M253 N-onsetHighC5_0_2M253 N*onsetHighC7_0_0M253 N)))=onsetHighGC5_0_2M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC7_0_0M253 onsetHighC7_0_1M253 onsetHighC7_0_2M253 onsetHighGC5_0_2M253
 ring

theorem onsetHighGC5_0_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_0_2M253 N := by
 unfold onsetHighGC5_0_2M253
 positivity

def onsetHighGC5_0_3M253 (N : ℤ) : ℤ := ((((((((((((58583452483584*N + 5239022385364992)*N + 214640752142057472)*N + 5327636765501030400)*N + 89237861972041531392)*N + 1062764553218837446656)*N + 9228643837882649542656)*N + 58882095326025783705600)*N + 273997434043782763905024)*N + 906966579413100713213952)*N + 2027384944376578392195072)*N + 2748174759000478738022400)*N + 1708557461779980091392000)

theorem onsetHighGC5_0_3M253_eq (N : ℤ) : (((onsetHighC6_0_0M253 N*onsetHighC6_0_3M253 N-onsetHighC5_0_0M253 N*onsetHighC7_0_3M253 N) + (onsetHighC6_0_1M253 N*onsetHighC6_0_2M253 N-onsetHighC5_0_1M253 N*onsetHighC7_0_2M253 N)) + ((onsetHighC6_0_2M253 N*onsetHighC6_0_1M253 N-onsetHighC5_0_2M253 N*onsetHighC7_0_1M253 N) + (onsetHighC6_0_3M253 N*onsetHighC6_0_0M253 N-onsetHighC5_0_3M253 N*onsetHighC7_0_0M253 N)))=onsetHighGC5_0_3M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC7_0_0M253 onsetHighC7_0_1M253 onsetHighC7_0_2M253 onsetHighC7_0_3M253 onsetHighGC5_0_3M253
 ring

theorem onsetHighGC5_0_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_0_3M253 N := by
 unfold onsetHighGC5_0_3M253
 positivity

def onsetHighGC5_0_4M253 (N : ℤ) : ℤ := ((((((((((((21475472965632*N + 1948143920873472)*N + 80934930713935872)*N + 2036364784828416000)*N + 34562468484056088576)*N + 416924885301734670336)*N + 3665620364121599901696)*N + 23670035808196519526400)*N + 111424226625218666299392)*N + 372948089749472796475392)*N + 842597071598982798508032)*N + 1153864296186991312896000)*N + 724378183116370771968000)

theorem onsetHighGC5_0_4M253_eq (N : ℤ) : (((onsetHighC6_0_0M253 N*onsetHighC6_0_4M253 N-onsetHighC5_0_0M253 N*onsetHighC7_0_4M253 N) + (onsetHighC6_0_1M253 N*onsetHighC6_0_3M253 N-onsetHighC5_0_1M253 N*onsetHighC7_0_3M253 N)) + ((onsetHighC6_0_2M253 N*onsetHighC6_0_2M253 N-onsetHighC5_0_2M253 N*onsetHighC7_0_2M253 N) + ((onsetHighC6_0_3M253 N*onsetHighC6_0_1M253 N-onsetHighC5_0_3M253 N*onsetHighC7_0_1M253 N) + (onsetHighC6_0_4M253 N*onsetHighC6_0_0M253 N-onsetHighC5_0_4M253 N*onsetHighC7_0_0M253 N))))=onsetHighGC5_0_4M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC7_0_0M253 onsetHighC7_0_1M253 onsetHighC7_0_2M253 onsetHighC7_0_3M253 onsetHighC7_0_4M253 onsetHighGC5_0_4M253
 ring

theorem onsetHighGC5_0_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_0_4M253 N := by
 unfold onsetHighGC5_0_4M253
 positivity

def onsetHighGC5_0_5M253 (N : ℤ) : ℤ := ((((((((((((4990194155520*N + 459442961252352)*N + 19366450311462912)*N + 494237172246773760)*N + 8505630717216030720)*N + 103999399549955997696)*N + 926475252494146338816)*N + 6059451357851098152960)*N + 28879490289622267330560)*N + 97825996280491631050752)*N + 223581499992844681347072)*N + 309591447604572971335680)*N + 196436085878961576345600)

theorem onsetHighGC5_0_5M253_eq (N : ℤ) : (((onsetHighC6_0_1M253 N*onsetHighC6_0_4M253 N-onsetHighC5_0_1M253 N*onsetHighC7_0_4M253 N) + (onsetHighC6_0_2M253 N*onsetHighC6_0_3M253 N-onsetHighC5_0_2M253 N*onsetHighC7_0_3M253 N)) + ((onsetHighC6_0_3M253 N*onsetHighC6_0_2M253 N-onsetHighC5_0_3M253 N*onsetHighC7_0_2M253 N) + (onsetHighC6_0_4M253 N*onsetHighC6_0_1M253 N-onsetHighC5_0_4M253 N*onsetHighC7_0_1M253 N)))=onsetHighGC5_0_5M253 N := by
 unfold onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC7_0_1M253 onsetHighC7_0_2M253 onsetHighC7_0_3M253 onsetHighC7_0_4M253 onsetHighGC5_0_5M253
 ring

theorem onsetHighGC5_0_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_0_5M253 N := by
 unfold onsetHighGC5_0_5M253
 positivity

def onsetHighGC5_0_6M253 (N : ℤ) : ℤ := ((((((((((((717216546816*N + 67066650427392)*N + 2870475680120832)*N + 74361649055662080)*N + 1298685857349500928)*N + 16109390782568595456)*N + 145543018540456083456)*N + 965050599033903513600)*N + 4661294729664544505856)*N + 15995710930232503959552)*N + 37020331056719632269312)*N + 51887490694370238136320)*N + 33309640655091479347200)

theorem onsetHighGC5_0_6M253_eq (N : ℤ) : ((onsetHighC6_0_2M253 N*onsetHighC6_0_4M253 N-onsetHighC5_0_2M253 N*onsetHighC7_0_4M253 N) + ((onsetHighC6_0_3M253 N*onsetHighC6_0_3M253 N-onsetHighC5_0_3M253 N*onsetHighC7_0_3M253 N) + (onsetHighC6_0_4M253 N*onsetHighC6_0_2M253 N-onsetHighC5_0_4M253 N*onsetHighC7_0_2M253 N)))=onsetHighGC5_0_6M253 N := by
 unfold onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC7_0_2M253 onsetHighC7_0_3M253 onsetHighC7_0_4M253 onsetHighGC5_0_6M253
 ring

theorem onsetHighGC5_0_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_0_6M253 N := by
 unfold onsetHighGC5_0_6M253
 positivity

def onsetHighGC5_0_7M253 (N : ℤ) : ℤ := ((((((((((((58265174016*N + 5538230304768)*N + 240898617114624)*N + 6340858179747840)*N + 112490415000649728)*N + 1417056226067349504)*N + 12997795942946045952)*N + 87470495651762012160)*N + 428649643570659065856)*N + 1491842911181501104128)*N + 3500341646579963265024)*N + 4971619062372630528000)*N + 3232749360029840179200)

theorem onsetHighGC5_0_7M253_eq (N : ℤ) : ((onsetHighC6_0_3M253 N*onsetHighC6_0_4M253 N-onsetHighC5_0_3M253 N*onsetHighC7_0_4M253 N) + (onsetHighC6_0_4M253 N*onsetHighC6_0_3M253 N-onsetHighC5_0_4M253 N*onsetHighC7_0_3M253 N))=onsetHighGC5_0_7M253 N := by
 unfold onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC7_0_3M253 onsetHighC7_0_4M253 onsetHighGC5_0_7M253
 ring

theorem onsetHighGC5_0_7M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_0_7M253 N := by
 unfold onsetHighGC5_0_7M253
 positivity

def onsetHighGC5_0_8M253 (N : ℤ) : ℤ := ((((((((((((2047868928*N + 198048743424)*N + 8763689926656)*N + 234629958205440)*N + 4233030077251584)*N + 54215909506547712)*N + 505477218508996608)*N + 3456673147115274240)*N + 17207603361002815488)*N + 60813747755877924864)*N + 144834602383401025536)*N + 208712366039991582720)*N + 137625464039119257600)

theorem onsetHighGC5_0_8M253_eq (N : ℤ) : (onsetHighC6_0_4M253 N*onsetHighC6_0_4M253 N-onsetHighC5_0_4M253 N*onsetHighC7_0_4M253 N)=onsetHighGC5_0_8M253 N := by
 unfold onsetHighC5_0_4M253 onsetHighC6_0_4M253 onsetHighC7_0_4M253 onsetHighGC5_0_8M253
 ring

theorem onsetHighGC5_0_8M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_0_8M253 N := by
 unfold onsetHighGC5_0_8M253
 positivity

def onsetHighGC5_1_0M253 (N : ℤ) : ℤ := ((((((((((((190079230279680*N + 16336641576665088)*N + 643882349141950464)*N + 15390648792011243520)*N + 248520830426095288320)*N + 2856410083990156345344)*N + 23965235057928635154432)*N + 147905915384625793597440)*N + 666512580450068751974400)*N + 2139004081191791256403968)*N + 4640947497840344037064704)*N + 6112860942793533963632640)*N + 3696774951798044747366400)

theorem onsetHighGC5_1_0M253_eq (N : ℤ) : ((onsetHighC6_0_0M253 N*onsetHighC6_1_0M253 N-onsetHighC5_0_0M253 N*onsetHighC7_1_0M253 N) + (onsetHighC6_1_0M253 N*onsetHighC6_0_0M253 N-onsetHighC5_1_0M253 N*onsetHighC7_0_0M253 N))=onsetHighGC5_1_0M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_1_0M253 onsetHighC6_0_0M253 onsetHighC6_1_0M253 onsetHighC7_0_0M253 onsetHighC7_1_0M253 onsetHighGC5_1_0M253
 ring

theorem onsetHighGC5_1_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_1_0M253 N := by
 unfold onsetHighGC5_1_0M253
 positivity

def onsetHighGC5_1_1M253 (N : ℤ) : ℤ := ((((((((((((396177551917056*N + 34516626787270656)*N + 1378414760810250240)*N + 33367634471320289280)*N + 545386326794788405248)*N + 6341690859584794656768)*N + 53798949832304331325440)*N + 335541900211499076157440)*N + 1527214105923855455748096)*N + 4947631342673263356542976)*N + 10830674747897059401400320)*N + 14385769298061519197306880)*N + 8768743285905432281088000)

theorem onsetHighGC5_1_1M253_eq (N : ℤ) : (((onsetHighC6_0_0M253 N*onsetHighC6_1_1M253 N-onsetHighC5_0_0M253 N*onsetHighC7_1_1M253 N) + (onsetHighC6_0_1M253 N*onsetHighC6_1_0M253 N-onsetHighC5_0_1M253 N*onsetHighC7_1_0M253 N)) + ((onsetHighC6_1_0M253 N*onsetHighC6_0_1M253 N-onsetHighC5_1_0M253 N*onsetHighC7_0_1M253 N) + (onsetHighC6_1_1M253 N*onsetHighC6_0_0M253 N-onsetHighC5_1_1M253 N*onsetHighC7_0_0M253 N)))=onsetHighGC5_1_1M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC7_0_0M253 onsetHighC7_0_1M253 onsetHighC7_1_0M253 onsetHighC7_1_1M253 onsetHighGC5_1_1M253
 ring

theorem onsetHighGC5_1_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_1_1M253 N := by
 unfold onsetHighGC5_1_1M253
 positivity

def onsetHighGC5_1_2M253 (N : ℤ) : ℤ := ((((((((((((351500714901504*N + 31045022568677376)*N + 1256283994639564800)*N + 30802591786897244160)*N + 509708967278358822912)*N + 5997562844928811204608)*N + 51461825774366384455680)*N + 324478301005956918804480)*N + 1492278358044216871747584)*N + 4882489197413687810850816)*N + 10788920162618144605470720)*N + 14458451425375745589903360)*N + 8887607623729492387430400)

theorem onsetHighGC5_1_2M253_eq (N : ℤ) : (((onsetHighC6_0_0M253 N*onsetHighC6_1_2M253 N-onsetHighC5_0_0M253 N*onsetHighC7_1_2M253 N) + ((onsetHighC6_0_1M253 N*onsetHighC6_1_1M253 N-onsetHighC5_0_1M253 N*onsetHighC7_1_1M253 N) + (onsetHighC6_0_2M253 N*onsetHighC6_1_0M253 N-onsetHighC5_0_2M253 N*onsetHighC7_1_0M253 N))) + ((onsetHighC6_1_0M253 N*onsetHighC6_0_2M253 N-onsetHighC5_1_0M253 N*onsetHighC7_0_2M253 N) + ((onsetHighC6_1_1M253 N*onsetHighC6_0_1M253 N-onsetHighC5_1_1M253 N*onsetHighC7_0_1M253 N) + (onsetHighC6_1_2M253 N*onsetHighC6_0_0M253 N-onsetHighC5_1_2M253 N*onsetHighC7_0_0M253 N))))=onsetHighGC5_1_2M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC7_0_0M253 onsetHighC7_0_1M253 onsetHighC7_0_2M253 onsetHighC7_1_0M253 onsetHighC7_1_1M253 onsetHighC7_1_2M253 onsetHighGC5_1_2M253
 ring

theorem onsetHighGC5_1_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_1_2M253 N := by
 unfold onsetHighGC5_1_2M253
 positivity

def onsetHighGC5_1_3M253 (N : ℤ) : ℤ := ((((((((((((171803783725056*N + 15386610342297600)*N + 631130492875309056)*N + 15679393928419737600)*N + 262784082685505568768)*N + 3130431116147750338560)*N + 27181844036954541785088)*N + 173360545157229234094080)*N + 806097179091940643045376)*N + 2665327385633715050250240)*N + 5949159628985332409696256)*N + 8049403071441063157432320)*N + 4993297404316589142835200)

theorem onsetHighGC5_1_3M253_eq (N : ℤ) : ((((onsetHighC6_0_0M253 N*onsetHighC6_1_3M253 N-onsetHighC5_0_0M253 N*onsetHighC7_1_3M253 N) + (onsetHighC6_0_1M253 N*onsetHighC6_1_2M253 N-onsetHighC5_0_1M253 N*onsetHighC7_1_2M253 N)) + ((onsetHighC6_0_2M253 N*onsetHighC6_1_1M253 N-onsetHighC5_0_2M253 N*onsetHighC7_1_1M253 N) + (onsetHighC6_0_3M253 N*onsetHighC6_1_0M253 N-onsetHighC5_0_3M253 N*onsetHighC7_1_0M253 N))) + (((onsetHighC6_1_0M253 N*onsetHighC6_0_3M253 N-onsetHighC5_1_0M253 N*onsetHighC7_0_3M253 N) + (onsetHighC6_1_1M253 N*onsetHighC6_0_2M253 N-onsetHighC5_1_1M253 N*onsetHighC7_0_2M253 N)) + ((onsetHighC6_1_2M253 N*onsetHighC6_0_1M253 N-onsetHighC5_1_2M253 N*onsetHighC7_0_1M253 N) + (onsetHighC6_1_3M253 N*onsetHighC6_0_0M253 N-onsetHighC5_1_3M253 N*onsetHighC7_0_0M253 N))))=onsetHighGC5_1_3M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC7_0_0M253 onsetHighC7_0_1M253 onsetHighC7_0_2M253 onsetHighC7_0_3M253 onsetHighC7_1_0M253 onsetHighC7_1_1M253 onsetHighC7_1_2M253 onsetHighC7_1_3M253 onsetHighGC5_1_3M253
 ring

theorem onsetHighGC5_1_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_1_3M253 N := by
 unfold onsetHighGC5_1_3M253
 positivity

def onsetHighGC5_1_4M253 (N : ℤ) : ℤ := ((((((((((((49901941555200*N + 4533999246508032)*N + 188610193485987840)*N + 4750417310137712640)*N + 80686582695812136960)*N + 973740440042690052096)*N + 8562197936162045952000)*N + 55277440610388431339520)*N + 260072354041983964938240)*N + 869718168230853296259072)*N + 1962509575541178545602560)*N + 2683185795361502582538240)*N + 1681143673650064352870400)

theorem onsetHighGC5_1_4M253_eq (N : ℤ) : ((((onsetHighC6_0_1M253 N*onsetHighC6_1_3M253 N-onsetHighC5_0_1M253 N*onsetHighC7_1_3M253 N) + (onsetHighC6_0_2M253 N*onsetHighC6_1_2M253 N-onsetHighC5_0_2M253 N*onsetHighC7_1_2M253 N)) + ((onsetHighC6_0_3M253 N*onsetHighC6_1_1M253 N-onsetHighC5_0_3M253 N*onsetHighC7_1_1M253 N) + (onsetHighC6_0_4M253 N*onsetHighC6_1_0M253 N-onsetHighC5_0_4M253 N*onsetHighC7_1_0M253 N))) + (((onsetHighC6_1_0M253 N*onsetHighC6_0_4M253 N-onsetHighC5_1_0M253 N*onsetHighC7_0_4M253 N) + (onsetHighC6_1_1M253 N*onsetHighC6_0_3M253 N-onsetHighC5_1_1M253 N*onsetHighC7_0_3M253 N)) + ((onsetHighC6_1_2M253 N*onsetHighC6_0_2M253 N-onsetHighC5_1_2M253 N*onsetHighC7_0_2M253 N) + (onsetHighC6_1_3M253 N*onsetHighC6_0_1M253 N-onsetHighC5_1_3M253 N*onsetHighC7_0_1M253 N))))=onsetHighGC5_1_4M253 N := by
 unfold onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC7_0_1M253 onsetHighC7_0_2M253 onsetHighC7_0_3M253 onsetHighC7_0_4M253 onsetHighC7_1_0M253 onsetHighC7_1_1M253 onsetHighC7_1_2M253 onsetHighC7_1_3M253 onsetHighGC5_1_4M253
 ring

theorem onsetHighGC5_1_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_1_4M253 N := by
 unfold onsetHighGC5_1_4M253
 positivity

def onsetHighGC5_1_5M253 (N : ℤ) : ℤ := ((((((((((((8606598561792*N + 793848066342912)*N + 33514655783583744)*N + 856410329312133120)*N + 14753425900734775296)*N + 180522062267034894336)*N + 1608846388829065838592)*N + 10523457004936613068800)*N + 50143758022686309875712)*N + 169760429800525754007552)*N + 387632536570903581425664)*N + 536065158339945777070080)*N + 339571378936064507904000)

theorem onsetHighGC5_1_5M253_eq (N : ℤ) : (((onsetHighC6_0_2M253 N*onsetHighC6_1_3M253 N-onsetHighC5_0_2M253 N*onsetHighC7_1_3M253 N) + ((onsetHighC6_0_3M253 N*onsetHighC6_1_2M253 N-onsetHighC5_0_3M253 N*onsetHighC7_1_2M253 N) + (onsetHighC6_0_4M253 N*onsetHighC6_1_1M253 N-onsetHighC5_0_4M253 N*onsetHighC7_1_1M253 N))) + ((onsetHighC6_1_1M253 N*onsetHighC6_0_4M253 N-onsetHighC5_1_1M253 N*onsetHighC7_0_4M253 N) + ((onsetHighC6_1_2M253 N*onsetHighC6_0_3M253 N-onsetHighC5_1_2M253 N*onsetHighC7_0_3M253 N) + (onsetHighC6_1_3M253 N*onsetHighC6_0_2M253 N-onsetHighC5_1_3M253 N*onsetHighC7_0_2M253 N))))=onsetHighGC5_1_5M253 N := by
 unfold onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC7_0_2M253 onsetHighC7_0_3M253 onsetHighC7_0_4M253 onsetHighC7_1_1M253 onsetHighC7_1_2M253 onsetHighC7_1_3M253 onsetHighGC5_1_5M253
 ring

theorem onsetHighGC5_1_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_1_5M253 N := by
 unfold onsetHighGC5_1_5M253
 positivity

def onsetHighGC5_1_6M253 (N : ℤ) : ℤ := ((((((((((((815712436224*N + 76442587103232)*N + 3278068978286592)*N + 85062271547473920)*N + 1487642622379425792)*N + 18473838699044929536)*N + 167041296835697442816)*N + 1108157754455548231680)*N + 5353466886717377347584)*N + 18367937765988297080832)*N + 42488335061977836552192)*N + 59497915751398165708800)*N + 38145952605376453017600)

theorem onsetHighGC5_1_6M253_eq (N : ℤ) : (((onsetHighC6_0_3M253 N*onsetHighC6_1_3M253 N-onsetHighC5_0_3M253 N*onsetHighC7_1_3M253 N) + (onsetHighC6_0_4M253 N*onsetHighC6_1_2M253 N-onsetHighC5_0_4M253 N*onsetHighC7_1_2M253 N)) + ((onsetHighC6_1_2M253 N*onsetHighC6_0_4M253 N-onsetHighC5_1_2M253 N*onsetHighC7_0_4M253 N) + (onsetHighC6_1_3M253 N*onsetHighC6_0_3M253 N-onsetHighC5_1_3M253 N*onsetHighC7_0_3M253 N)))=onsetHighGC5_1_6M253 N := by
 unfold onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC7_0_3M253 onsetHighC7_0_4M253 onsetHighC7_1_2M253 onsetHighC7_1_3M253 onsetHighGC5_1_6M253
 ring

theorem onsetHighGC5_1_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_1_6M253 N := by
 unfold onsetHighGC5_1_6M253
 positivity

def onsetHighGC5_1_7M253 (N : ℤ) : ℤ := ((((((((((((32765902848*N + 3122537693184)*N + 136144176021504)*N + 3591185891328000)*N + 63829219888594944)*N + 805352565513388032)*N + 7396661354343432192)*N + 49826205026400337920)*N + 244333398246354321408)*N + 850613341025608925184)*N + 1995645545878130786304)*N + 2833090478073163284480)*N + 1840520915990662348800)

theorem onsetHighGC5_1_7M253_eq (N : ℤ) : ((onsetHighC6_0_4M253 N*onsetHighC6_1_3M253 N-onsetHighC5_0_4M253 N*onsetHighC7_1_3M253 N) + (onsetHighC6_1_3M253 N*onsetHighC6_0_4M253 N-onsetHighC5_1_3M253 N*onsetHighC7_0_4M253 N))=onsetHighGC5_1_7M253 N := by
 unfold onsetHighC5_0_4M253 onsetHighC5_1_3M253 onsetHighC6_0_4M253 onsetHighC6_1_3M253 onsetHighC7_0_4M253 onsetHighC7_1_3M253 onsetHighGC5_1_7M253
 ring

theorem onsetHighGC5_1_7M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_1_7M253 N := by
 unfold onsetHighGC5_1_7M253
 positivity

def onsetHighGC5_2_0M253 (N : ℤ) : ℤ := ((((((((((((396177551917056*N + 34094447641755648)*N + 1345109738102194176)*N + 32172987309002588160)*N + 519664598437161074688)*N + 5972287624959391432704)*N + 50082827082988863356928)*N + 308817651602331606712320)*N + 1389806247126909052256256)*N + 4452525789166567107330048)*N + 9639884010224022319005696)*N + 12664997844615319592632320)*N + 7636766026517784369561600)

theorem onsetHighGC5_2_0M253_eq (N : ℤ) : ((onsetHighC6_0_0M253 N*onsetHighC6_2_0M253 N-onsetHighC5_0_0M253 N*onsetHighC7_2_0M253 N) + ((onsetHighC6_1_0M253 N*onsetHighC6_1_0M253 N-onsetHighC5_1_0M253 N*onsetHighC7_1_0M253 N) + (onsetHighC6_2_0M253 N*onsetHighC6_0_0M253 N-onsetHighC5_2_0M253 N*onsetHighC7_0_0M253 N)))=onsetHighGC5_2_0M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_1_0M253 onsetHighC5_2_0M253 onsetHighC6_0_0M253 onsetHighC6_1_0M253 onsetHighC6_2_0M253 onsetHighC7_0_0M253 onsetHighC7_1_0M253 onsetHighC7_2_0M253 onsetHighGC5_2_0M253
 ring

theorem onsetHighGC5_2_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_2_0M253 N := by
 unfold onsetHighGC5_2_0M253
 positivity

def onsetHighGC5_2_1M253 (N : ℤ) : ℤ := ((((((((((((703001429803008*N + 61311821650329600)*N + 2450265927346814976)*N + 59338352317075292160)*N + 969935055456335560704)*N + 11275005469727950110720)*N + 95586887001473289289728)*N + 595551937518640335421440)*N + 2706787584121354908991488)*N + 8753161255854428053831680)*N + 19119163739499319898013696)*N + 25329492862436416801996800)*N + 15393876444217087229952000)

theorem onsetHighGC5_2_1M253_eq (N : ℤ) : (((onsetHighC6_0_0M253 N*onsetHighC6_2_1M253 N-onsetHighC5_0_0M253 N*onsetHighC7_2_1M253 N) + ((onsetHighC6_0_1M253 N*onsetHighC6_2_0M253 N-onsetHighC5_0_1M253 N*onsetHighC7_2_0M253 N) + (onsetHighC6_1_0M253 N*onsetHighC6_1_1M253 N-onsetHighC5_1_0M253 N*onsetHighC7_1_1M253 N))) + ((onsetHighC6_1_1M253 N*onsetHighC6_1_0M253 N-onsetHighC5_1_1M253 N*onsetHighC7_1_0M253 N) + ((onsetHighC6_2_0M253 N*onsetHighC6_0_1M253 N-onsetHighC5_2_0M253 N*onsetHighC7_0_1M253 N) + (onsetHighC6_2_1M253 N*onsetHighC6_0_0M253 N-onsetHighC5_2_1M253 N*onsetHighC7_0_0M253 N))))=onsetHighGC5_2_1M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC7_0_0M253 onsetHighC7_0_1M253 onsetHighC7_1_0M253 onsetHighC7_1_1M253 onsetHighC7_2_0M253 onsetHighC7_2_1M253 onsetHighGC5_2_1M253
 ring

theorem onsetHighGC5_2_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_2_1M253 N := by
 unfold onsetHighGC5_2_1M253
 positivity

def onsetHighGC5_2_2M253 (N : ℤ) : ℤ := ((((((((((((515411351175168*N + 45564207952822272)*N + 1844997824509378560)*N + 45251940618684334080)*N + 748813901469994450944)*N + 8808105034601192226816)*N + 75526374860415439994880)*N + 475719292831895381606400)*N + 2184789211957330631589888)*N + 7135698978961815240179712)*N + 15734342303394512451010560)*N + 21033302150506349049937920)*N + 12892167440926815721881600)

theorem onsetHighGC5_2_2M253_eq (N : ℤ) : ((((onsetHighC6_0_0M253 N*onsetHighC6_2_2M253 N-onsetHighC5_0_0M253 N*onsetHighC7_2_2M253 N) + (onsetHighC6_0_1M253 N*onsetHighC6_2_1M253 N-onsetHighC5_0_1M253 N*onsetHighC7_2_1M253 N)) + ((onsetHighC6_0_2M253 N*onsetHighC6_2_0M253 N-onsetHighC5_0_2M253 N*onsetHighC7_2_0M253 N) + (onsetHighC6_1_0M253 N*onsetHighC6_1_2M253 N-onsetHighC5_1_0M253 N*onsetHighC7_1_2M253 N))) + (((onsetHighC6_1_1M253 N*onsetHighC6_1_1M253 N-onsetHighC5_1_1M253 N*onsetHighC7_1_1M253 N) + (onsetHighC6_1_2M253 N*onsetHighC6_1_0M253 N-onsetHighC5_1_2M253 N*onsetHighC7_1_0M253 N)) + ((onsetHighC6_2_0M253 N*onsetHighC6_0_2M253 N-onsetHighC5_2_0M253 N*onsetHighC7_0_2M253 N) + ((onsetHighC6_2_1M253 N*onsetHighC6_0_1M253 N-onsetHighC5_2_1M253 N*onsetHighC7_0_1M253 N) + (onsetHighC6_2_2M253 N*onsetHighC6_0_0M253 N-onsetHighC5_2_2M253 N*onsetHighC7_0_0M253 N)))))=onsetHighGC5_2_2M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC7_0_0M253 onsetHighC7_0_1M253 onsetHighC7_0_2M253 onsetHighC7_1_0M253 onsetHighC7_1_1M253 onsetHighC7_1_2M253 onsetHighC7_2_0M253 onsetHighC7_2_1M253 onsetHighC7_2_2M253 onsetHighGC5_2_2M253
 ring

theorem onsetHighGC5_2_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_2_2M253 N := by
 unfold onsetHighGC5_2_2M253
 positivity

def onsetHighGC5_2_3M253 (N : ℤ) : ℤ := ((((((((((((199607766220800*N + 17894275521970176)*N + 734501613305069568)*N + 18254767966912512000)*N + 305974858433848934400)*N + 3644114789312199917568)*N + 31624618619089682694144)*N + 201515520417121130250240)*N + 935852519435617360281600)*N + 3089436722408312071520256)*N + 6882363267254412329484288)*N + 9290549970469208362844160)*N + 5747805535508500178534400)

theorem onsetHighGC5_2_3M253_eq (N : ℤ) : ((((onsetHighC6_0_1M253 N*onsetHighC6_2_2M253 N-onsetHighC5_0_1M253 N*onsetHighC7_2_2M253 N) + (onsetHighC6_0_2M253 N*onsetHighC6_2_1M253 N-onsetHighC5_0_2M253 N*onsetHighC7_2_1M253 N)) + ((onsetHighC6_0_3M253 N*onsetHighC6_2_0M253 N-onsetHighC5_0_3M253 N*onsetHighC7_2_0M253 N) + ((onsetHighC6_1_0M253 N*onsetHighC6_1_3M253 N-onsetHighC5_1_0M253 N*onsetHighC7_1_3M253 N) + (onsetHighC6_1_1M253 N*onsetHighC6_1_2M253 N-onsetHighC5_1_1M253 N*onsetHighC7_1_2M253 N)))) + (((onsetHighC6_1_2M253 N*onsetHighC6_1_1M253 N-onsetHighC5_1_2M253 N*onsetHighC7_1_1M253 N) + (onsetHighC6_1_3M253 N*onsetHighC6_1_0M253 N-onsetHighC5_1_3M253 N*onsetHighC7_1_0M253 N)) + ((onsetHighC6_2_0M253 N*onsetHighC6_0_3M253 N-onsetHighC5_2_0M253 N*onsetHighC7_0_3M253 N) + ((onsetHighC6_2_1M253 N*onsetHighC6_0_2M253 N-onsetHighC5_2_1M253 N*onsetHighC7_0_2M253 N) + (onsetHighC6_2_2M253 N*onsetHighC6_0_1M253 N-onsetHighC5_2_2M253 N*onsetHighC7_0_1M253 N)))))=onsetHighGC5_2_3M253 N := by
 unfold onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC7_0_1M253 onsetHighC7_0_2M253 onsetHighC7_0_3M253 onsetHighC7_1_0M253 onsetHighC7_1_1M253 onsetHighC7_1_2M253 onsetHighC7_1_3M253 onsetHighC7_2_0M253 onsetHighC7_2_1M253 onsetHighC7_2_2M253 onsetHighGC5_2_3M253
 ring

theorem onsetHighGC5_2_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_2_3M253 N := by
 unfold onsetHighGC5_2_3M253
 positivity

def onsetHighGC5_2_4M253 (N : ℤ) : ℤ := ((((((((((((43032992808960*N + 3914481637785600)*N + 162984464165634048)*N + 4107488027171880960)*N + 69787924826884669440)*N + 842215376588683345920)*N + 7403353807878560415744)*N + 47765303709306680770560)*N + 224509240001212327526400)*N + 749797759604998188564480)*N + 1689076794920571927134208)*N + 2304641221679740307374080)*N + 1440495976274470305792000)

theorem onsetHighGC5_2_4M253_eq (N : ℤ) : ((((onsetHighC6_0_2M253 N*onsetHighC6_2_2M253 N-onsetHighC5_0_2M253 N*onsetHighC7_2_2M253 N) + (onsetHighC6_0_3M253 N*onsetHighC6_2_1M253 N-onsetHighC5_0_3M253 N*onsetHighC7_2_1M253 N)) + ((onsetHighC6_0_4M253 N*onsetHighC6_2_0M253 N-onsetHighC5_0_4M253 N*onsetHighC7_2_0M253 N) + (onsetHighC6_1_1M253 N*onsetHighC6_1_3M253 N-onsetHighC5_1_1M253 N*onsetHighC7_1_3M253 N))) + (((onsetHighC6_1_2M253 N*onsetHighC6_1_2M253 N-onsetHighC5_1_2M253 N*onsetHighC7_1_2M253 N) + (onsetHighC6_1_3M253 N*onsetHighC6_1_1M253 N-onsetHighC5_1_3M253 N*onsetHighC7_1_1M253 N)) + ((onsetHighC6_2_0M253 N*onsetHighC6_0_4M253 N-onsetHighC5_2_0M253 N*onsetHighC7_0_4M253 N) + ((onsetHighC6_2_1M253 N*onsetHighC6_0_3M253 N-onsetHighC5_2_1M253 N*onsetHighC7_0_3M253 N) + (onsetHighC6_2_2M253 N*onsetHighC6_0_2M253 N-onsetHighC5_2_2M253 N*onsetHighC7_0_2M253 N)))))=onsetHighGC5_2_4M253 N := by
 unfold onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC7_0_2M253 onsetHighC7_0_3M253 onsetHighC7_0_4M253 onsetHighC7_1_1M253 onsetHighC7_1_2M253 onsetHighC7_1_3M253 onsetHighC7_2_0M253 onsetHighC7_2_1M253 onsetHighC7_2_2M253 onsetHighGC5_2_4M253
 ring

theorem onsetHighGC5_2_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_2_4M253 N := by
 unfold onsetHighGC5_2_4M253
 positivity

def onsetHighGC5_2_5M253 (N : ℤ) : ℤ := ((((((((((((4894274617344*N + 452099699638272)*N + 19109772930318336)*N + 488771674649395200)*N + 8425490018642952192)*N + 103128980476053159936)*N + 919132794339037544448)*N + 6010290712284199649280)*N + 28620841772560025124864)*N + 96801156979548767649792)*N + 220743500968369275273216)*N + 304753689932955537899520)*N + 192646564246735080652800)

theorem onsetHighGC5_2_5M253_eq (N : ℤ) : (((onsetHighC6_0_3M253 N*onsetHighC6_2_2M253 N-onsetHighC5_0_3M253 N*onsetHighC7_2_2M253 N) + ((onsetHighC6_0_4M253 N*onsetHighC6_2_1M253 N-onsetHighC5_0_4M253 N*onsetHighC7_2_1M253 N) + (onsetHighC6_1_2M253 N*onsetHighC6_1_3M253 N-onsetHighC5_1_2M253 N*onsetHighC7_1_3M253 N))) + ((onsetHighC6_1_3M253 N*onsetHighC6_1_2M253 N-onsetHighC5_1_3M253 N*onsetHighC7_1_2M253 N) + ((onsetHighC6_2_1M253 N*onsetHighC6_0_4M253 N-onsetHighC5_2_1M253 N*onsetHighC7_0_4M253 N) + (onsetHighC6_2_2M253 N*onsetHighC6_0_3M253 N-onsetHighC5_2_2M253 N*onsetHighC7_0_3M253 N))))=onsetHighGC5_2_5M253 N := by
 unfold onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC7_0_3M253 onsetHighC7_0_4M253 onsetHighC7_1_2M253 onsetHighC7_1_3M253 onsetHighC7_2_1M253 onsetHighC7_2_2M253 onsetHighGC5_2_5M253
 ring

theorem onsetHighGC5_2_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_2_5M253 N := by
 unfold onsetHighGC5_2_5M253
 positivity

def onsetHighGC5_2_6M253 (N : ℤ) : ℤ := ((((((((((((229361319936*N + 21534068441088)*N + 924927796445184)*N + 24033180663152640)*N + 420762200957779968)*N + 5229160056565530624)*N + 47304399783054016512)*N + 313864078310454067200)*N + 1515968245169280516096)*N + 5198477390304811941888)*N + 12013937700041448751104)*N + 16801573445835486658560)*N + 10753644094848132710400)

theorem onsetHighGC5_2_6M253_eq (N : ℤ) : ((onsetHighC6_0_4M253 N*onsetHighC6_2_2M253 N-onsetHighC5_0_4M253 N*onsetHighC7_2_2M253 N) + ((onsetHighC6_1_3M253 N*onsetHighC6_1_3M253 N-onsetHighC5_1_3M253 N*onsetHighC7_1_3M253 N) + (onsetHighC6_2_2M253 N*onsetHighC6_0_4M253 N-onsetHighC5_2_2M253 N*onsetHighC7_0_4M253 N)))=onsetHighGC5_2_6M253 N := by
 unfold onsetHighC5_0_4M253 onsetHighC5_1_3M253 onsetHighC5_2_2M253 onsetHighC6_0_4M253 onsetHighC6_1_3M253 onsetHighC6_2_2M253 onsetHighC7_0_4M253 onsetHighC7_1_3M253 onsetHighC7_2_2M253 onsetHighGC5_2_6M253
 ring

theorem onsetHighGC5_2_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_2_6M253 N := by
 unfold onsetHighGC5_2_6M253
 positivity

def onsetHighGC5_3_0M253 (N : ℤ) : ℤ := ((((((((((((468667619868672*N + 40355732108869632)*N + 1592521893271830528)*N + 38086882380050595840)*N + 614901697819145404416)*N + 7060859187876332568576)*N + 59138597948286371364864)*N + 364064135820654005452800)*N + 1635124814152249356582912)*N + 5225791635801093483528192)*N + 11282286517026551262609408)*N + 14775588315507615423528960)*N + 8877757845234020843520000)

theorem onsetHighGC5_3_0M253_eq (N : ℤ) : (((onsetHighC6_0_0M253 N*onsetHighC6_3_0M253 N-onsetHighC5_0_0M253 N*onsetHighC7_3_0M253 N) + (onsetHighC6_1_0M253 N*onsetHighC6_2_0M253 N-onsetHighC5_1_0M253 N*onsetHighC7_2_0M253 N)) + ((onsetHighC6_2_0M253 N*onsetHighC6_1_0M253 N-onsetHighC5_2_0M253 N*onsetHighC7_1_0M253 N) + (onsetHighC6_3_0M253 N*onsetHighC6_0_0M253 N-onsetHighC5_3_0M253 N*onsetHighC7_0_0M253 N)))=onsetHighGC5_3_0M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_1_0M253 onsetHighC5_2_0M253 onsetHighC5_3_0M253 onsetHighC6_0_0M253 onsetHighC6_1_0M253 onsetHighC6_2_0M253 onsetHighC6_3_0M253 onsetHighC7_0_0M253 onsetHighC7_1_0M253 onsetHighC7_2_0M253 onsetHighC7_3_0M253 onsetHighGC5_3_0M253
 ring

theorem onsetHighGC5_3_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_3_0M253 N := by
 unfold onsetHighGC5_3_0M253
 positivity

def onsetHighGC5_3_1M253 (N : ℤ) : ℤ := ((((((((((((687215134900224*N + 59958113171668992)*N + 2396343166379753472)*N + 58017798848249856000)*N + 947785880557880082432)*N + 11007100026424321376256)*N + 93193549086349526040576)*N + 579667047905869226311680)*N + 2629196951434512367878144)*N + 8481683800586179420618752)*N + 18474526768861244590129152)*N + 24398277038037744872325120)*N + 14775853227199261566566400)

theorem onsetHighGC5_3_1M253_eq (N : ℤ) : ((((onsetHighC6_0_0M253 N*onsetHighC6_3_1M253 N-onsetHighC5_0_0M253 N*onsetHighC7_3_1M253 N) + (onsetHighC6_0_1M253 N*onsetHighC6_3_0M253 N-onsetHighC5_0_1M253 N*onsetHighC7_3_0M253 N)) + ((onsetHighC6_1_0M253 N*onsetHighC6_2_1M253 N-onsetHighC5_1_0M253 N*onsetHighC7_2_1M253 N) + (onsetHighC6_1_1M253 N*onsetHighC6_2_0M253 N-onsetHighC5_1_1M253 N*onsetHighC7_2_0M253 N))) + (((onsetHighC6_2_0M253 N*onsetHighC6_1_1M253 N-onsetHighC5_2_0M253 N*onsetHighC7_1_1M253 N) + (onsetHighC6_2_1M253 N*onsetHighC6_1_0M253 N-onsetHighC5_2_1M253 N*onsetHighC7_1_0M253 N)) + ((onsetHighC6_3_0M253 N*onsetHighC6_0_1M253 N-onsetHighC5_3_0M253 N*onsetHighC7_0_1M253 N) + (onsetHighC6_3_1M253 N*onsetHighC6_0_0M253 N-onsetHighC5_3_1M253 N*onsetHighC7_0_0M253 N))))=onsetHighGC5_3_1M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC7_0_0M253 onsetHighC7_0_1M253 onsetHighC7_1_0M253 onsetHighC7_1_1M253 onsetHighC7_2_0M253 onsetHighC7_2_1M253 onsetHighC7_3_0M253 onsetHighC7_3_1M253 onsetHighGC5_3_1M253
 ring

theorem onsetHighGC5_3_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_3_1M253 N := by
 unfold onsetHighGC5_3_1M253
 positivity

def onsetHighGC5_3_2M253 (N : ℤ) : ℤ := ((((((((((((399215532441600*N + 35305108115816448)*N + 1429681061083742208)*N + 35056957772865208320)*N + 579780971399447838720)*N + 6813663212809013428224)*N + 58352087920613336285184)*N + 366958251986627065282560)*N + 1682015311490689943470080)*N + 5480956721145786928201728)*N + 12053470878570571151966208)*N + 16064190656984820830699520)*N + 9813183410513391235891200)

theorem onsetHighGC5_3_2M253_eq (N : ℤ) : ((((onsetHighC6_0_1M253 N*onsetHighC6_3_1M253 N-onsetHighC5_0_1M253 N*onsetHighC7_3_1M253 N) + (onsetHighC6_0_2M253 N*onsetHighC6_3_0M253 N-onsetHighC5_0_2M253 N*onsetHighC7_3_0M253 N)) + ((onsetHighC6_1_0M253 N*onsetHighC6_2_2M253 N-onsetHighC5_1_0M253 N*onsetHighC7_2_2M253 N) + ((onsetHighC6_1_1M253 N*onsetHighC6_2_1M253 N-onsetHighC5_1_1M253 N*onsetHighC7_2_1M253 N) + (onsetHighC6_1_2M253 N*onsetHighC6_2_0M253 N-onsetHighC5_1_2M253 N*onsetHighC7_2_0M253 N)))) + (((onsetHighC6_2_0M253 N*onsetHighC6_1_2M253 N-onsetHighC5_2_0M253 N*onsetHighC7_1_2M253 N) + (onsetHighC6_2_1M253 N*onsetHighC6_1_1M253 N-onsetHighC5_2_1M253 N*onsetHighC7_1_1M253 N)) + ((onsetHighC6_2_2M253 N*onsetHighC6_1_0M253 N-onsetHighC5_2_2M253 N*onsetHighC7_1_0M253 N) + ((onsetHighC6_3_0M253 N*onsetHighC6_0_2M253 N-onsetHighC5_3_0M253 N*onsetHighC7_0_2M253 N) + (onsetHighC6_3_1M253 N*onsetHighC6_0_1M253 N-onsetHighC5_3_1M253 N*onsetHighC7_0_1M253 N)))))=onsetHighGC5_3_2M253 N := by
 unfold onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC7_0_1M253 onsetHighC7_0_2M253 onsetHighC7_1_0M253 onsetHighC7_1_1M253 onsetHighC7_1_2M253 onsetHighC7_2_0M253 onsetHighC7_2_1M253 onsetHighC7_2_2M253 onsetHighC7_3_0M253 onsetHighC7_3_1M253 onsetHighGC5_3_2M253
 ring

theorem onsetHighGC5_3_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_3_2M253 N := by
 unfold onsetHighGC5_3_2M253
 positivity

def onsetHighGC5_3_3M253 (N : ℤ) : ℤ := ((((((((((((114754647490560*N + 10292594516951040)*N + 422565590801055744)*N + 10501150394925711360)*N + 175942188360731197440)*N + 2093922761904252518400)*N + 18152457345134923087872)*N + 115508551702755551477760)*N + 535500366641150341939200)*N + 1764116306444594561679360)*N + 3920377644858191894544384)*N + 5277392511617750052372480)*N + 3254705727179569496064000)

theorem onsetHighGC5_3_3M253_eq (N : ℤ) : ((((onsetHighC6_0_2M253 N*onsetHighC6_3_1M253 N-onsetHighC5_0_2M253 N*onsetHighC7_3_1M253 N) + (onsetHighC6_0_3M253 N*onsetHighC6_3_0M253 N-onsetHighC5_0_3M253 N*onsetHighC7_3_0M253 N)) + ((onsetHighC6_1_1M253 N*onsetHighC6_2_2M253 N-onsetHighC5_1_1M253 N*onsetHighC7_2_2M253 N) + ((onsetHighC6_1_2M253 N*onsetHighC6_2_1M253 N-onsetHighC5_1_2M253 N*onsetHighC7_2_1M253 N) + (onsetHighC6_1_3M253 N*onsetHighC6_2_0M253 N-onsetHighC5_1_3M253 N*onsetHighC7_2_0M253 N)))) + (((onsetHighC6_2_0M253 N*onsetHighC6_1_3M253 N-onsetHighC5_2_0M253 N*onsetHighC7_1_3M253 N) + (onsetHighC6_2_1M253 N*onsetHighC6_1_2M253 N-onsetHighC5_2_1M253 N*onsetHighC7_1_2M253 N)) + ((onsetHighC6_2_2M253 N*onsetHighC6_1_1M253 N-onsetHighC5_2_2M253 N*onsetHighC7_1_1M253 N) + ((onsetHighC6_3_0M253 N*onsetHighC6_0_3M253 N-onsetHighC5_3_0M253 N*onsetHighC7_0_3M253 N) + (onsetHighC6_3_1M253 N*onsetHighC6_0_2M253 N-onsetHighC5_3_1M253 N*onsetHighC7_0_2M253 N)))))=onsetHighGC5_3_3M253 N := by
 unfold onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC7_0_2M253 onsetHighC7_0_3M253 onsetHighC7_1_1M253 onsetHighC7_1_2M253 onsetHighC7_1_3M253 onsetHighC7_2_0M253 onsetHighC7_2_1M253 onsetHighC7_2_2M253 onsetHighC7_3_0M253 onsetHighC7_3_1M253 onsetHighGC5_3_3M253
 ring

theorem onsetHighGC5_3_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_3_3M253 N := by
 unfold onsetHighGC5_3_3M253
 positivity

def onsetHighGC5_3_4M253 (N : ℤ) : ℤ := ((((((((((((16314248724480*N + 1485146255523840)*N + 61865203398082560)*N + 1559386337134510080)*N + 26491274674380472320)*N + 319561879995600076800)*N + 2806918639583318507520)*N + 18090060813930426531840)*N + 84906521744079303475200)*N + 283061133302063573237760)*N + 636299610516065145323520)*N + 866035752702734924513280)*N + 539766925123463125401600)

theorem onsetHighGC5_3_4M253_eq (N : ℤ) : ((((onsetHighC6_0_3M253 N*onsetHighC6_3_1M253 N-onsetHighC5_0_3M253 N*onsetHighC7_3_1M253 N) + (onsetHighC6_0_4M253 N*onsetHighC6_3_0M253 N-onsetHighC5_0_4M253 N*onsetHighC7_3_0M253 N)) + ((onsetHighC6_1_2M253 N*onsetHighC6_2_2M253 N-onsetHighC5_1_2M253 N*onsetHighC7_2_2M253 N) + (onsetHighC6_1_3M253 N*onsetHighC6_2_1M253 N-onsetHighC5_1_3M253 N*onsetHighC7_2_1M253 N))) + (((onsetHighC6_2_1M253 N*onsetHighC6_1_3M253 N-onsetHighC5_2_1M253 N*onsetHighC7_1_3M253 N) + (onsetHighC6_2_2M253 N*onsetHighC6_1_2M253 N-onsetHighC5_2_2M253 N*onsetHighC7_1_2M253 N)) + ((onsetHighC6_3_0M253 N*onsetHighC6_0_4M253 N-onsetHighC5_3_0M253 N*onsetHighC7_0_4M253 N) + (onsetHighC6_3_1M253 N*onsetHighC6_0_3M253 N-onsetHighC5_3_1M253 N*onsetHighC7_0_3M253 N))))=onsetHighGC5_3_4M253 N := by
 unfold onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC7_0_3M253 onsetHighC7_0_4M253 onsetHighC7_1_2M253 onsetHighC7_1_3M253 onsetHighC7_2_1M253 onsetHighC7_2_2M253 onsetHighC7_3_0M253 onsetHighC7_3_1M253 onsetHighGC5_3_4M253
 ring

theorem onsetHighGC5_3_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_3_4M253 N := by
 unfold onsetHighGC5_3_4M253
 positivity

def onsetHighGC5_3_5M253 (N : ℤ) : ℤ := ((((((((((((917445279744*N + 84841492119552)*N + 3589155858677760)*N + 91850464894648320)*N + 1583726209554972672)*N + 19383916090890387456)*N + 172693649067092213760)*N + 1128463722144533053440)*N + 5368100778901959081984)*N + 18130620775637861793792)*N + 41272193669523182714880)*N + 56858576291750152765440)*N + 35852727718060543180800)

theorem onsetHighGC5_3_5M253_eq (N : ℤ) : (((onsetHighC6_0_4M253 N*onsetHighC6_3_1M253 N-onsetHighC5_0_4M253 N*onsetHighC7_3_1M253 N) + (onsetHighC6_1_3M253 N*onsetHighC6_2_2M253 N-onsetHighC5_1_3M253 N*onsetHighC7_2_2M253 N)) + ((onsetHighC6_2_2M253 N*onsetHighC6_1_3M253 N-onsetHighC5_2_2M253 N*onsetHighC7_1_3M253 N) + (onsetHighC6_3_1M253 N*onsetHighC6_0_4M253 N-onsetHighC5_3_1M253 N*onsetHighC7_0_4M253 N)))=onsetHighGC5_3_5M253 N := by
 unfold onsetHighC5_0_4M253 onsetHighC5_1_3M253 onsetHighC5_2_2M253 onsetHighC5_3_1M253 onsetHighC6_0_4M253 onsetHighC6_1_3M253 onsetHighC6_2_2M253 onsetHighC6_3_1M253 onsetHighC7_0_4M253 onsetHighC7_1_3M253 onsetHighC7_2_2M253 onsetHighC7_3_1M253 onsetHighGC5_3_5M253
 ring

theorem onsetHighGC5_3_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_3_5M253 N := by
 unfold onsetHighGC5_3_5M253
 positivity

def onsetHighGC5_4_0M253 (N : ℤ) : ℤ := ((((((((((((343607567450112*N + 29581974536454144)*N + 1166780086301491200)*N + 27881150091865620480)*N + 449589775050888708096)*N + 5154456726723763372032)*N + 43087079432792828805120)*N + 264630106849632961167360)*N + 1185311194434624597000192)*N + 3776506019136929843380224)*N + 8125149927276178039111680)*N + 10600319736481546080092160)*N + 6342583816207693342310400)

theorem onsetHighGC5_4_0M253_eq (N : ℤ) : (((onsetHighC6_0_0M253 N*onsetHighC6_4_0M253 N-onsetHighC5_0_0M253 N*onsetHighC7_4_0M253 N) + (onsetHighC6_1_0M253 N*onsetHighC6_3_0M253 N-onsetHighC5_1_0M253 N*onsetHighC7_3_0M253 N)) + ((onsetHighC6_2_0M253 N*onsetHighC6_2_0M253 N-onsetHighC5_2_0M253 N*onsetHighC7_2_0M253 N) + ((onsetHighC6_3_0M253 N*onsetHighC6_1_0M253 N-onsetHighC5_3_0M253 N*onsetHighC7_1_0M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_0_0M253 N-onsetHighC5_4_0M253 N*onsetHighC7_0_0M253 N))))=onsetHighGC5_4_0M253 N := by
 unfold onsetHighC5_0_0M253 onsetHighC5_1_0M253 onsetHighC5_2_0M253 onsetHighC5_3_0M253 onsetHighC5_4_0M253 onsetHighC6_0_0M253 onsetHighC6_1_0M253 onsetHighC6_2_0M253 onsetHighC6_3_0M253 onsetHighC6_4_0M253 onsetHighC7_0_0M253 onsetHighC7_1_0M253 onsetHighC7_2_0M253 onsetHighC7_3_0M253 onsetHighC7_4_0M253 onsetHighGC5_4_0M253
 ring

theorem onsetHighGC5_4_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_4_0M253 N := by
 unfold onsetHighGC5_4_0M253
 positivity

def onsetHighGC5_4_1M253 (N : ℤ) : ℤ := ((((((((((((399215532441600*N + 34821665187692544)*N + 1390915051308711936)*N + 33644995633175592960)*N + 548946407086494842880)*N + 6365054555504951427072)*N + 53786190394214027624448)*N + 333782624290765366886400)*N + 1509913898110571650744320)*N + 4856229411335149357891584)*N + 10542020930167869987618816)*N + 13870452408211007408701440)*N + 8365948872554583333273600)

theorem onsetHighGC5_4_1M253_eq (N : ℤ) : ((((onsetHighC6_0_1M253 N*onsetHighC6_4_0M253 N-onsetHighC5_0_1M253 N*onsetHighC7_4_0M253 N) + (onsetHighC6_1_0M253 N*onsetHighC6_3_1M253 N-onsetHighC5_1_0M253 N*onsetHighC7_3_1M253 N)) + ((onsetHighC6_1_1M253 N*onsetHighC6_3_0M253 N-onsetHighC5_1_1M253 N*onsetHighC7_3_0M253 N) + (onsetHighC6_2_0M253 N*onsetHighC6_2_1M253 N-onsetHighC5_2_0M253 N*onsetHighC7_2_1M253 N))) + (((onsetHighC6_2_1M253 N*onsetHighC6_2_0M253 N-onsetHighC5_2_1M253 N*onsetHighC7_2_0M253 N) + (onsetHighC6_3_0M253 N*onsetHighC6_1_1M253 N-onsetHighC5_3_0M253 N*onsetHighC7_1_1M253 N)) + ((onsetHighC6_3_1M253 N*onsetHighC6_1_0M253 N-onsetHighC5_3_1M253 N*onsetHighC7_1_0M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_0_1M253 N-onsetHighC5_4_0M253 N*onsetHighC7_0_1M253 N))))=onsetHighGC5_4_1M253 N := by
 unfold onsetHighC5_0_1M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_0_1M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighC7_0_1M253 onsetHighC7_1_0M253 onsetHighC7_1_1M253 onsetHighC7_2_0M253 onsetHighC7_2_1M253 onsetHighC7_3_0M253 onsetHighC7_3_1M253 onsetHighC7_4_0M253 onsetHighGC5_4_1M253
 ring

theorem onsetHighGC5_4_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_4_1M253 N := by
 unfold onsetHighGC5_4_1M253
 positivity

def onsetHighGC5_4_2M253 (N : ℤ) : ℤ := ((((((((((((172131971235840*N + 15219856999710720)*N + 616024704288817152)*N + 15093220289040875520)*N + 249332737081564200960)*N + 2925898780957967646720)*N + 25012162238741795045376)*N + 156956226393966787952640)*N + 717642815806253275545600)*N + 2331846640455247866101760)*N + 5111749200890636124291072)*N + 6788582566646961238179840)*N + 4130883928055322456883200)

theorem onsetHighGC5_4_2M253_eq (N : ℤ) : ((((onsetHighC6_0_2M253 N*onsetHighC6_4_0M253 N-onsetHighC5_0_2M253 N*onsetHighC7_4_0M253 N) + (onsetHighC6_1_1M253 N*onsetHighC6_3_1M253 N-onsetHighC5_1_1M253 N*onsetHighC7_3_1M253 N)) + ((onsetHighC6_1_2M253 N*onsetHighC6_3_0M253 N-onsetHighC5_1_2M253 N*onsetHighC7_3_0M253 N) + (onsetHighC6_2_0M253 N*onsetHighC6_2_2M253 N-onsetHighC5_2_0M253 N*onsetHighC7_2_2M253 N))) + (((onsetHighC6_2_1M253 N*onsetHighC6_2_1M253 N-onsetHighC5_2_1M253 N*onsetHighC7_2_1M253 N) + (onsetHighC6_2_2M253 N*onsetHighC6_2_0M253 N-onsetHighC5_2_2M253 N*onsetHighC7_2_0M253 N)) + ((onsetHighC6_3_0M253 N*onsetHighC6_1_2M253 N-onsetHighC5_3_0M253 N*onsetHighC7_1_2M253 N) + ((onsetHighC6_3_1M253 N*onsetHighC6_1_1M253 N-onsetHighC5_3_1M253 N*onsetHighC7_1_1M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_0_2M253 N-onsetHighC5_4_0M253 N*onsetHighC7_0_2M253 N)))))=onsetHighGC5_4_2M253 N := by
 unfold onsetHighC5_0_2M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_0_2M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighC7_0_2M253 onsetHighC7_1_1M253 onsetHighC7_1_2M253 onsetHighC7_2_0M253 onsetHighC7_2_1M253 onsetHighC7_2_2M253 onsetHighC7_3_0M253 onsetHighC7_3_1M253 onsetHighC7_4_0M253 onsetHighGC5_4_2M253
 ring

theorem onsetHighGC5_4_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_4_2M253 N := by
 unfold onsetHighGC5_4_2M253
 positivity

def onsetHighGC5_4_3M253 (N : ℤ) : ℤ := ((((((((((((32628497448960*N + 2926587024506880)*N + 120118520913592320)*N + 2983306578037309440)*N + 49938863878884556800)*N + 593603390991803351040)*N + 5138008369266976358400)*N + 32632582014655007293440)*N + 150947975613180283453440)*N + 495993228964763381268480)*N + 1099023966573475992698880)*N + 1474614268601765705809920)*N + 906148381370858628710400)

theorem onsetHighGC5_4_3M253_eq (N : ℤ) : ((((onsetHighC6_0_3M253 N*onsetHighC6_4_0M253 N-onsetHighC5_0_3M253 N*onsetHighC7_4_0M253 N) + (onsetHighC6_1_2M253 N*onsetHighC6_3_1M253 N-onsetHighC5_1_2M253 N*onsetHighC7_3_1M253 N)) + ((onsetHighC6_1_3M253 N*onsetHighC6_3_0M253 N-onsetHighC5_1_3M253 N*onsetHighC7_3_0M253 N) + (onsetHighC6_2_1M253 N*onsetHighC6_2_2M253 N-onsetHighC5_2_1M253 N*onsetHighC7_2_2M253 N))) + (((onsetHighC6_2_2M253 N*onsetHighC6_2_1M253 N-onsetHighC5_2_2M253 N*onsetHighC7_2_1M253 N) + (onsetHighC6_3_0M253 N*onsetHighC6_1_3M253 N-onsetHighC5_3_0M253 N*onsetHighC7_1_3M253 N)) + ((onsetHighC6_3_1M253 N*onsetHighC6_1_2M253 N-onsetHighC5_3_1M253 N*onsetHighC7_1_2M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_0_3M253 N-onsetHighC5_4_0M253 N*onsetHighC7_0_3M253 N))))=onsetHighGC5_4_3M253 N := by
 unfold onsetHighC5_0_3M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_0_3M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighC7_0_3M253 onsetHighC7_1_2M253 onsetHighC7_1_3M253 onsetHighC7_2_1M253 onsetHighC7_2_2M253 onsetHighC7_3_0M253 onsetHighC7_3_1M253 onsetHighC7_4_0M253 onsetHighGC5_4_3M253
 ring

theorem onsetHighGC5_4_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_4_3M253 N := by
 unfold onsetHighGC5_4_3M253
 positivity

def onsetHighGC5_4_4M253 (N : ℤ) : ℤ := ((((((((((((2293613199360*N + 208866776186880)*N + 8700927368232960)*N + 219260305539072000)*N + 3722725086587781120)*N + 44866901546096394240)*N + 393615234167985930240)*N + 2532842003367670579200)*N + 11865542020888547819520)*N + 39468944814617741230080)*N + 88494081223741459660800)*N + 120091693261658259456000)*N + 74602694999638278144000)

theorem onsetHighGC5_4_4M253_eq (N : ℤ) : (((onsetHighC6_0_4M253 N*onsetHighC6_4_0M253 N-onsetHighC5_0_4M253 N*onsetHighC7_4_0M253 N) + (onsetHighC6_1_3M253 N*onsetHighC6_3_1M253 N-onsetHighC5_1_3M253 N*onsetHighC7_3_1M253 N)) + ((onsetHighC6_2_2M253 N*onsetHighC6_2_2M253 N-onsetHighC5_2_2M253 N*onsetHighC7_2_2M253 N) + ((onsetHighC6_3_1M253 N*onsetHighC6_1_3M253 N-onsetHighC5_3_1M253 N*onsetHighC7_1_3M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_0_4M253 N-onsetHighC5_4_0M253 N*onsetHighC7_0_4M253 N))))=onsetHighGC5_4_4M253 N := by
 unfold onsetHighC5_0_4M253 onsetHighC5_1_3M253 onsetHighC5_2_2M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_0_4M253 onsetHighC6_1_3M253 onsetHighC6_2_2M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighC7_0_4M253 onsetHighC7_1_3M253 onsetHighC7_2_2M253 onsetHighC7_3_1M253 onsetHighC7_4_0M253 onsetHighGC5_4_4M253
 ring

theorem onsetHighGC5_4_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_4_4M253 N := by
 unfold onsetHighGC5_4_4M253
 positivity

def onsetHighGC5_5_0M253 (N : ℤ) : ℤ := ((((((((((((159686212976640*N + 13735288903827456)*N + 541082078914019328)*N + 12909216459883806720)*N + 207762655863908597760)*N + 2376508066815560122368)*N + 19813006496281745424384)*N + 121319524923489339310080)*N + 541569464490234662092800)*N + 1719043432280164166270976)*N + 3683418010248899815538688)*N + 4784252798701738052812800)*N + 2849014876949728749158400)

theorem onsetHighGC5_5_0M253_eq (N : ℤ) : (((onsetHighC6_1_0M253 N*onsetHighC6_4_0M253 N-onsetHighC5_1_0M253 N*onsetHighC7_4_0M253 N) + (onsetHighC6_2_0M253 N*onsetHighC6_3_0M253 N-onsetHighC5_2_0M253 N*onsetHighC7_3_0M253 N)) + ((onsetHighC6_3_0M253 N*onsetHighC6_2_0M253 N-onsetHighC5_3_0M253 N*onsetHighC7_2_0M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_1_0M253 N-onsetHighC5_4_0M253 N*onsetHighC7_1_0M253 N)))=onsetHighGC5_5_0M253 N := by
 unfold onsetHighC5_1_0M253 onsetHighC5_2_0M253 onsetHighC5_3_0M253 onsetHighC5_4_0M253 onsetHighC6_1_0M253 onsetHighC6_2_0M253 onsetHighC6_3_0M253 onsetHighC6_4_0M253 onsetHighC7_1_0M253 onsetHighC7_2_0M253 onsetHighC7_3_0M253 onsetHighC7_4_0M253 onsetHighGC5_5_0M253
 ring

theorem onsetHighGC5_5_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_5_0M253 N := by
 unfold onsetHighGC5_5_0M253
 positivity

def onsetHighGC5_5_1M253 (N : ℤ) : ℤ := ((((((((((((137705576988672*N + 12000657779195904)*N + 478773448739389440)*N + 11563303560271626240)*N + 188311895010114011136)*N + 2178651799815456817152)*N + 18363016719230734172160)*N + 113624841790812098396160)*N + 512326619367515715796992)*N + 1641832921808214209593344)*N + 3550098272831127237427200)*N + 4651019713426619577139200)*N + 2792359658114498691072000)

theorem onsetHighGC5_5_1M253_eq (N : ℤ) : (((onsetHighC6_1_1M253 N*onsetHighC6_4_0M253 N-onsetHighC5_1_1M253 N*onsetHighC7_4_0M253 N) + ((onsetHighC6_2_0M253 N*onsetHighC6_3_1M253 N-onsetHighC5_2_0M253 N*onsetHighC7_3_1M253 N) + (onsetHighC6_2_1M253 N*onsetHighC6_3_0M253 N-onsetHighC5_2_1M253 N*onsetHighC7_3_0M253 N))) + ((onsetHighC6_3_0M253 N*onsetHighC6_2_1M253 N-onsetHighC5_3_0M253 N*onsetHighC7_2_1M253 N) + ((onsetHighC6_3_1M253 N*onsetHighC6_2_0M253 N-onsetHighC5_3_1M253 N*onsetHighC7_2_0M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_1_1M253 N-onsetHighC5_4_0M253 N*onsetHighC7_1_1M253 N))))=onsetHighGC5_5_1M253 N := by
 unfold onsetHighC5_1_1M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_1_1M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighC7_1_1M253 onsetHighC7_2_0M253 onsetHighC7_2_1M253 onsetHighC7_3_0M253 onsetHighC7_3_1M253 onsetHighC7_4_0M253 onsetHighGC5_5_1M253
 ring

theorem onsetHighGC5_5_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_5_1M253 N := by
 unfold onsetHighGC5_5_1M253
 positivity

def onsetHighGC5_5_2M253 (N : ℤ) : ℤ := ((((((((((((39154196938752*N + 3459457845559296)*N + 139875394265284608)*N + 3422412874344038400)*N + 56441122088986607616)*N + 660994054411002052608)*N + 5637228501858521186304)*N + 35279477106703545139200)*N + 160817629916376446533632)*N + 520786507649151292932096)*N + 1137410421897316965285888)*N + 1504421720005021138944000)*N + 911450599451545750732800)

theorem onsetHighGC5_5_2M253_eq (N : ℤ) : (((onsetHighC6_1_2M253 N*onsetHighC6_4_0M253 N-onsetHighC5_1_2M253 N*onsetHighC7_4_0M253 N) + ((onsetHighC6_2_1M253 N*onsetHighC6_3_1M253 N-onsetHighC5_2_1M253 N*onsetHighC7_3_1M253 N) + (onsetHighC6_2_2M253 N*onsetHighC6_3_0M253 N-onsetHighC5_2_2M253 N*onsetHighC7_3_0M253 N))) + ((onsetHighC6_3_0M253 N*onsetHighC6_2_2M253 N-onsetHighC5_3_0M253 N*onsetHighC7_2_2M253 N) + ((onsetHighC6_3_1M253 N*onsetHighC6_2_1M253 N-onsetHighC5_3_1M253 N*onsetHighC7_2_1M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_1_2M253 N-onsetHighC5_4_0M253 N*onsetHighC7_1_2M253 N))))=onsetHighGC5_5_2M253 N := by
 unfold onsetHighC5_1_2M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_1_2M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighC7_1_2M253 onsetHighC7_2_1M253 onsetHighC7_2_2M253 onsetHighC7_3_0M253 onsetHighC7_3_1M253 onsetHighC7_4_0M253 onsetHighGC5_5_2M253
 ring

theorem onsetHighGC5_5_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_5_2M253 N := by
 unfold onsetHighGC5_5_2M253
 positivity

def onsetHighGC5_5_3M253 (N : ℤ) : ℤ := ((((((((((((3669781118976*N + 329007715319808)*N + 13493425806508032)*N + 334765540591534080)*N + 5595931224569806848)*N + 66401637503141412864)*N + 573563974887759937536)*N + 3634106687420450734080)*N + 16764337405848585240576)*N + 54916283348868743036928)*N + 121269779039279049080832)*N + 162105790957203845283840)*N + 99208797158632115404800)

theorem onsetHighGC5_5_3M253_eq (N : ℤ) : (((onsetHighC6_1_3M253 N*onsetHighC6_4_0M253 N-onsetHighC5_1_3M253 N*onsetHighC7_4_0M253 N) + (onsetHighC6_2_2M253 N*onsetHighC6_3_1M253 N-onsetHighC5_2_2M253 N*onsetHighC7_3_1M253 N)) + ((onsetHighC6_3_1M253 N*onsetHighC6_2_2M253 N-onsetHighC5_3_1M253 N*onsetHighC7_2_2M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_1_3M253 N-onsetHighC5_4_0M253 N*onsetHighC7_1_3M253 N)))=onsetHighGC5_5_3M253 N := by
 unfold onsetHighC5_1_3M253 onsetHighC5_2_2M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_1_3M253 onsetHighC6_2_2M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighC7_1_3M253 onsetHighC7_2_2M253 onsetHighC7_3_1M253 onsetHighC7_4_0M253 onsetHighGC5_5_3M253
 ring

theorem onsetHighGC5_5_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_5_3M253 N := by
 unfold onsetHighGC5_5_3M253
 positivity

def onsetHighGC5_6_0M253 (N : ℤ) : ℤ := ((((((((((((45901858996224*N + 3941809986207744)*N + 154979921628758016)*N + 3689105687461232640)*N + 59217285302810836992)*N + 675349528074856169472)*N + 5611713667755889655808)*N + 34235722112334487879680)*N + 152214534766060722192384)*N + 481054525766932925251584)*N + 1025935902167276533579776)*N + 1325886135664561257185280)*N + 785373850575233482752000)

theorem onsetHighGC5_6_0M253_eq (N : ℤ) : ((onsetHighC6_2_0M253 N*onsetHighC6_4_0M253 N-onsetHighC5_2_0M253 N*onsetHighC7_4_0M253 N) + ((onsetHighC6_3_0M253 N*onsetHighC6_3_0M253 N-onsetHighC5_3_0M253 N*onsetHighC7_3_0M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_2_0M253 N-onsetHighC5_4_0M253 N*onsetHighC7_2_0M253 N)))=onsetHighGC5_6_0M253 N := by
 unfold onsetHighC5_2_0M253 onsetHighC5_3_0M253 onsetHighC5_4_0M253 onsetHighC6_2_0M253 onsetHighC6_3_0M253 onsetHighC6_4_0M253 onsetHighC7_2_0M253 onsetHighC7_3_0M253 onsetHighC7_4_0M253 onsetHighGC5_6_0M253
 ring

theorem onsetHighGC5_6_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_6_0M253 N := by
 unfold onsetHighGC5_6_0M253
 positivity

def onsetHighGC5_6_1M253 (N : ℤ) : ℤ := ((((((((((((26102797959168*N + 2271340841140224)*N + 90450663774879744)*N + 2179853049869107200)*N + 35411387474629361664)*N + 408533088455771553792)*N + 3432502979664178839552)*N + 21165123374768329850880)*N + 95066828169908079034368)*N + 303390005522312026128384)*N + 653072070605427550715904)*N + 851488593320039358136320)*N + 508601182786828133990400)

theorem onsetHighGC5_6_1M253_eq (N : ℤ) : (((onsetHighC6_2_1M253 N*onsetHighC6_4_0M253 N-onsetHighC5_2_1M253 N*onsetHighC7_4_0M253 N) + (onsetHighC6_3_0M253 N*onsetHighC6_3_1M253 N-onsetHighC5_3_0M253 N*onsetHighC7_3_1M253 N)) + ((onsetHighC6_3_1M253 N*onsetHighC6_3_0M253 N-onsetHighC5_3_1M253 N*onsetHighC7_3_0M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_2_1M253 N-onsetHighC5_4_0M253 N*onsetHighC7_2_1M253 N)))=onsetHighGC5_6_1M253 N := by
 unfold onsetHighC5_2_1M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_2_1M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighC7_2_1M253 onsetHighC7_3_0M253 onsetHighC7_3_1M253 onsetHighC7_4_0M253 onsetHighGC5_6_1M253
 ring

theorem onsetHighGC5_6_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_6_1M253 N := by
 unfold onsetHighGC5_6_1M253
 positivity

def onsetHighGC5_6_2M253 (N : ℤ) : ℤ := ((((((((((((3669781118976*N + 323828588740608)*N + 13072449486716928)*N + 319239776894976000)*N + 5252999670543679488)*N + 61361075797301919744)*N + 521795476114473222144)*N + 3255003188634782269440)*N + 14784730404373854683136)*N + 47692168464238167195648)*N + 103722081594105793609728)*N + 136568959725671609794560)*N + 82339621907363109273600)

theorem onsetHighGC5_6_2M253_eq (N : ℤ) : ((onsetHighC6_2_2M253 N*onsetHighC6_4_0M253 N-onsetHighC5_2_2M253 N*onsetHighC7_4_0M253 N) + ((onsetHighC6_3_1M253 N*onsetHighC6_3_1M253 N-onsetHighC5_3_1M253 N*onsetHighC7_3_1M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_2_2M253 N-onsetHighC5_4_0M253 N*onsetHighC7_2_2M253 N)))=onsetHighGC5_6_2M253 N := by
 unfold onsetHighC5_2_2M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_2_2M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighC7_2_2M253 onsetHighC7_3_1M253 onsetHighC7_4_0M253 onsetHighGC5_6_2M253
 ring

theorem onsetHighGC5_6_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_6_2M253 N := by
 unfold onsetHighGC5_6_2M253
 positivity

def onsetHighGC5_7_0M253 (N : ℤ) : ℤ := ((((((((((((7457942274048*N + 638964700545024)*N + 25056005578555392)*N + 594663889258414080)*N + 9514128718675574784)*N + 108111902703806840832)*N + 894784974758646644736)*N + 5435451347354108559360)*N + 24054803265534629511168)*N + 75646567352080734879744)*N + 160482656763761469161472)*N + 206250836735634136104960)*N + 121456812276855078912000)

theorem onsetHighGC5_7_0M253_eq (N : ℤ) : ((onsetHighC6_3_0M253 N*onsetHighC6_4_0M253 N-onsetHighC5_3_0M253 N*onsetHighC7_4_0M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_3_0M253 N-onsetHighC5_4_0M253 N*onsetHighC7_3_0M253 N))=onsetHighGC5_7_0M253 N := by
 unfold onsetHighC5_3_0M253 onsetHighC5_4_0M253 onsetHighC6_3_0M253 onsetHighC6_4_0M253 onsetHighC7_3_0M253 onsetHighC7_4_0M253 onsetHighGC5_7_0M253
 ring

theorem onsetHighGC5_7_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_7_0M253 N := by
 unfold onsetHighGC5_7_0M253
 positivity

def onsetHighGC5_7_1M253 (N : ℤ) : ℤ := ((((((((((((2097017782272*N + 182085406949376)*N + 7233459902742528)*N + 173845691372666880)*N + 2815404866657058816)*N + 32370088200653242368)*N + 270958917166672379904)*N + 1663975319243902156800)*N + 7441281274886605504512)*N + 23636000680697508397056)*N + 50623514142505401581568)*N + 65653325382722644869120)*N + 38995518722481428889600)

theorem onsetHighGC5_7_1M253_eq (N : ℤ) : ((onsetHighC6_3_1M253 N*onsetHighC6_4_0M253 N-onsetHighC5_3_1M253 N*onsetHighC7_4_0M253 N) + (onsetHighC6_4_0M253 N*onsetHighC6_3_1M253 N-onsetHighC5_4_0M253 N*onsetHighC7_3_1M253 N))=onsetHighGC5_7_1M253 N := by
 unfold onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighC7_3_1M253 onsetHighC7_4_0M253 onsetHighGC5_7_1M253
 ring

theorem onsetHighGC5_7_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_7_1M253 N := by
 unfold onsetHighGC5_7_1M253
 positivity

def onsetHighGC5_8_0M253 (N : ℤ) : ℤ := ((((((((((((524254445568*N + 44781476511744)*N + 1750248833679360)*N + 41389550248919040)*N + 659601752718311424)*N + 7463475340023693312)*N + 61489651738906460160)*N + 371703343903282298880)*N + 1636453596214704734208)*N + 5117977392554384031744)*N + 10794791629252492001280)*N + 13789007021765170298880)*N + 8068436593616093184000)

theorem onsetHighGC5_8_0M253_eq (N : ℤ) : (onsetHighC6_4_0M253 N*onsetHighC6_4_0M253 N-onsetHighC5_4_0M253 N*onsetHighC7_4_0M253 N)=onsetHighGC5_8_0M253 N := by
 unfold onsetHighC5_4_0M253 onsetHighC6_4_0M253 onsetHighC7_4_0M253 onsetHighGC5_8_0M253
 ring

theorem onsetHighGC5_8_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC5_8_0M253 N := by
 unfold onsetHighGC5_8_0M253
 positivity

attribute [local irreducible] onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighC7_0_0M253 onsetHighC7_0_1M253 onsetHighC7_0_2M253 onsetHighC7_0_3M253 onsetHighC7_0_4M253 onsetHighC7_1_0M253 onsetHighC7_1_1M253 onsetHighC7_1_2M253 onsetHighC7_1_3M253 onsetHighC7_2_0M253 onsetHighC7_2_1M253 onsetHighC7_2_2M253 onsetHighC7_3_0M253 onsetHighC7_3_1M253 onsetHighC7_4_0M253

def onsetHighCol5_5_0M253 (N R : ℤ) : ℤ := ((onsetHighC5_0_0M253 N*R^0 + onsetHighC5_0_1M253 N*R^1) + (onsetHighC5_0_2M253 N*R^2 + (onsetHighC5_0_3M253 N*R^3 + onsetHighC5_0_4M253 N*R^4)))

def onsetHighCol5_5_1M253 (N R : ℤ) : ℤ := ((onsetHighC5_1_0M253 N*R^0 + onsetHighC5_1_1M253 N*R^1) + (onsetHighC5_1_2M253 N*R^2 + onsetHighC5_1_3M253 N*R^3))

def onsetHighCol5_5_2M253 (N R : ℤ) : ℤ := (onsetHighC5_2_0M253 N*R^0 + (onsetHighC5_2_1M253 N*R^1 + onsetHighC5_2_2M253 N*R^2))

def onsetHighCol5_5_3M253 (N R : ℤ) : ℤ := (onsetHighC5_3_0M253 N*R^0 + onsetHighC5_3_1M253 N*R^1)

def onsetHighCol5_5_4M253 (N R : ℤ) : ℤ := onsetHighC5_4_0M253 N*R^0

theorem onsetHigh_cols5_5M253 (N C R : ℤ) : onsetHighV5M253 N C R=((onsetHighCol5_5_0M253 N R*C^0 + onsetHighCol5_5_1M253 N R*C^1) + (onsetHighCol5_5_2M253 N R*C^2 + (onsetHighCol5_5_3M253 N R*C^3 + onsetHighCol5_5_4M253 N R*C^4))) := by
 rw [onsetHigh_decomp5M253]
 unfold onsetHighCol5_5_0M253 onsetHighCol5_5_1M253 onsetHighCol5_5_2M253 onsetHighCol5_5_3M253 onsetHighCol5_5_4M253
 ring

def onsetHighCol5_6_0M253 (N R : ℤ) : ℤ := ((onsetHighC6_0_0M253 N*R^0 + onsetHighC6_0_1M253 N*R^1) + (onsetHighC6_0_2M253 N*R^2 + (onsetHighC6_0_3M253 N*R^3 + onsetHighC6_0_4M253 N*R^4)))

def onsetHighCol5_6_1M253 (N R : ℤ) : ℤ := ((onsetHighC6_1_0M253 N*R^0 + onsetHighC6_1_1M253 N*R^1) + (onsetHighC6_1_2M253 N*R^2 + onsetHighC6_1_3M253 N*R^3))

def onsetHighCol5_6_2M253 (N R : ℤ) : ℤ := (onsetHighC6_2_0M253 N*R^0 + (onsetHighC6_2_1M253 N*R^1 + onsetHighC6_2_2M253 N*R^2))

def onsetHighCol5_6_3M253 (N R : ℤ) : ℤ := (onsetHighC6_3_0M253 N*R^0 + onsetHighC6_3_1M253 N*R^1)

def onsetHighCol5_6_4M253 (N R : ℤ) : ℤ := onsetHighC6_4_0M253 N*R^0

theorem onsetHigh_cols5_6M253 (N C R : ℤ) : onsetHighV6M253 N C R=((onsetHighCol5_6_0M253 N R*C^0 + onsetHighCol5_6_1M253 N R*C^1) + (onsetHighCol5_6_2M253 N R*C^2 + (onsetHighCol5_6_3M253 N R*C^3 + onsetHighCol5_6_4M253 N R*C^4))) := by
 rw [onsetHigh_decomp6M253]
 unfold onsetHighCol5_6_0M253 onsetHighCol5_6_1M253 onsetHighCol5_6_2M253 onsetHighCol5_6_3M253 onsetHighCol5_6_4M253
 ring

def onsetHighCol5_7_0M253 (N R : ℤ) : ℤ := ((onsetHighC7_0_0M253 N*R^0 + onsetHighC7_0_1M253 N*R^1) + (onsetHighC7_0_2M253 N*R^2 + (onsetHighC7_0_3M253 N*R^3 + onsetHighC7_0_4M253 N*R^4)))

def onsetHighCol5_7_1M253 (N R : ℤ) : ℤ := ((onsetHighC7_1_0M253 N*R^0 + onsetHighC7_1_1M253 N*R^1) + (onsetHighC7_1_2M253 N*R^2 + onsetHighC7_1_3M253 N*R^3))

def onsetHighCol5_7_2M253 (N R : ℤ) : ℤ := (onsetHighC7_2_0M253 N*R^0 + (onsetHighC7_2_1M253 N*R^1 + onsetHighC7_2_2M253 N*R^2))

def onsetHighCol5_7_3M253 (N R : ℤ) : ℤ := (onsetHighC7_3_0M253 N*R^0 + onsetHighC7_3_1M253 N*R^1)

def onsetHighCol5_7_4M253 (N R : ℤ) : ℤ := onsetHighC7_4_0M253 N*R^0

theorem onsetHigh_cols5_7M253 (N C R : ℤ) : onsetHighV7M253 N C R=((onsetHighCol5_7_0M253 N R*C^0 + onsetHighCol5_7_1M253 N R*C^1) + (onsetHighCol5_7_2M253 N R*C^2 + (onsetHighCol5_7_3M253 N R*C^3 + onsetHighCol5_7_4M253 N R*C^4))) := by
 rw [onsetHigh_decomp7M253]
 unfold onsetHighCol5_7_0M253 onsetHighCol5_7_1M253 onsetHighCol5_7_2M253 onsetHighCol5_7_3M253 onsetHighCol5_7_4M253
 ring

def onsetHighGCol5_0M253 (N R : ℤ) : ℤ := (((onsetHighGC5_0_0M253 N*R^0 + onsetHighGC5_0_1M253 N*R^1) + (onsetHighGC5_0_2M253 N*R^2 + onsetHighGC5_0_3M253 N*R^3)) + ((onsetHighGC5_0_4M253 N*R^4 + onsetHighGC5_0_5M253 N*R^5) + (onsetHighGC5_0_6M253 N*R^6 + (onsetHighGC5_0_7M253 N*R^7 + onsetHighGC5_0_8M253 N*R^8))))

theorem onsetHighGCol5_0M253_eq (N R : ℤ) : (onsetHighCol5_6_0M253 N R*onsetHighCol5_6_0M253 N R-onsetHighCol5_5_0M253 N R*onsetHighCol5_7_0M253 N R)=onsetHighGCol5_0M253 N R := by
 unfold onsetHighGCol5_0M253 onsetHighCol5_5_0M253 onsetHighCol5_6_0M253 onsetHighCol5_7_0M253
 rw [←onsetHighGC5_0_0M253_eq,←onsetHighGC5_0_1M253_eq,←onsetHighGC5_0_2M253_eq,←onsetHighGC5_0_3M253_eq,←onsetHighGC5_0_4M253_eq,←onsetHighGC5_0_5M253_eq,←onsetHighGC5_0_6M253_eq,←onsetHighGC5_0_7M253_eq,←onsetHighGC5_0_8M253_eq]
 ring

theorem onsetHighGCol5_0M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol5_0M253 N R := by
 unfold onsetHighGCol5_0M253
 have h0 := onsetHighGC5_0_0M253_nonneg N hN
 have h1 := onsetHighGC5_0_1M253_nonneg N hN
 have h2 := onsetHighGC5_0_2M253_nonneg N hN
 have h3 := onsetHighGC5_0_3M253_nonneg N hN
 have h4 := onsetHighGC5_0_4M253_nonneg N hN
 have h5 := onsetHighGC5_0_5M253_nonneg N hN
 have h6 := onsetHighGC5_0_6M253_nonneg N hN
 have h7 := onsetHighGC5_0_7M253_nonneg N hN
 have h8 := onsetHighGC5_0_8M253_nonneg N hN
 positivity

def onsetHighGCol5_1M253 (N R : ℤ) : ℤ := (((onsetHighGC5_1_0M253 N*R^0 + onsetHighGC5_1_1M253 N*R^1) + (onsetHighGC5_1_2M253 N*R^2 + onsetHighGC5_1_3M253 N*R^3)) + ((onsetHighGC5_1_4M253 N*R^4 + onsetHighGC5_1_5M253 N*R^5) + (onsetHighGC5_1_6M253 N*R^6 + onsetHighGC5_1_7M253 N*R^7)))

theorem onsetHighGCol5_1M253_eq (N R : ℤ) : ((onsetHighCol5_6_0M253 N R*onsetHighCol5_6_1M253 N R-onsetHighCol5_5_0M253 N R*onsetHighCol5_7_1M253 N R) + (onsetHighCol5_6_1M253 N R*onsetHighCol5_6_0M253 N R-onsetHighCol5_5_1M253 N R*onsetHighCol5_7_0M253 N R))=onsetHighGCol5_1M253 N R := by
 unfold onsetHighGCol5_1M253 onsetHighCol5_5_0M253 onsetHighCol5_5_1M253 onsetHighCol5_6_0M253 onsetHighCol5_6_1M253 onsetHighCol5_7_0M253 onsetHighCol5_7_1M253
 rw [←onsetHighGC5_1_0M253_eq,←onsetHighGC5_1_1M253_eq,←onsetHighGC5_1_2M253_eq,←onsetHighGC5_1_3M253_eq,←onsetHighGC5_1_4M253_eq,←onsetHighGC5_1_5M253_eq,←onsetHighGC5_1_6M253_eq,←onsetHighGC5_1_7M253_eq]
 ring

theorem onsetHighGCol5_1M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol5_1M253 N R := by
 unfold onsetHighGCol5_1M253
 have h0 := onsetHighGC5_1_0M253_nonneg N hN
 have h1 := onsetHighGC5_1_1M253_nonneg N hN
 have h2 := onsetHighGC5_1_2M253_nonneg N hN
 have h3 := onsetHighGC5_1_3M253_nonneg N hN
 have h4 := onsetHighGC5_1_4M253_nonneg N hN
 have h5 := onsetHighGC5_1_5M253_nonneg N hN
 have h6 := onsetHighGC5_1_6M253_nonneg N hN
 have h7 := onsetHighGC5_1_7M253_nonneg N hN
 positivity

def onsetHighGCol5_2M253 (N R : ℤ) : ℤ := ((onsetHighGC5_2_0M253 N*R^0 + (onsetHighGC5_2_1M253 N*R^1 + onsetHighGC5_2_2M253 N*R^2)) + ((onsetHighGC5_2_3M253 N*R^3 + onsetHighGC5_2_4M253 N*R^4) + (onsetHighGC5_2_5M253 N*R^5 + onsetHighGC5_2_6M253 N*R^6)))

theorem onsetHighGCol5_2M253_eq (N R : ℤ) : ((onsetHighCol5_6_0M253 N R*onsetHighCol5_6_2M253 N R-onsetHighCol5_5_0M253 N R*onsetHighCol5_7_2M253 N R) + ((onsetHighCol5_6_1M253 N R*onsetHighCol5_6_1M253 N R-onsetHighCol5_5_1M253 N R*onsetHighCol5_7_1M253 N R) + (onsetHighCol5_6_2M253 N R*onsetHighCol5_6_0M253 N R-onsetHighCol5_5_2M253 N R*onsetHighCol5_7_0M253 N R)))=onsetHighGCol5_2M253 N R := by
 unfold onsetHighGCol5_2M253 onsetHighCol5_5_0M253 onsetHighCol5_5_1M253 onsetHighCol5_5_2M253 onsetHighCol5_6_0M253 onsetHighCol5_6_1M253 onsetHighCol5_6_2M253 onsetHighCol5_7_0M253 onsetHighCol5_7_1M253 onsetHighCol5_7_2M253
 rw [←onsetHighGC5_2_0M253_eq,←onsetHighGC5_2_1M253_eq,←onsetHighGC5_2_2M253_eq,←onsetHighGC5_2_3M253_eq,←onsetHighGC5_2_4M253_eq,←onsetHighGC5_2_5M253_eq,←onsetHighGC5_2_6M253_eq]
 ring

theorem onsetHighGCol5_2M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol5_2M253 N R := by
 unfold onsetHighGCol5_2M253
 have h0 := onsetHighGC5_2_0M253_nonneg N hN
 have h1 := onsetHighGC5_2_1M253_nonneg N hN
 have h2 := onsetHighGC5_2_2M253_nonneg N hN
 have h3 := onsetHighGC5_2_3M253_nonneg N hN
 have h4 := onsetHighGC5_2_4M253_nonneg N hN
 have h5 := onsetHighGC5_2_5M253_nonneg N hN
 have h6 := onsetHighGC5_2_6M253_nonneg N hN
 positivity

def onsetHighGCol5_3M253 (N R : ℤ) : ℤ := ((onsetHighGC5_3_0M253 N*R^0 + (onsetHighGC5_3_1M253 N*R^1 + onsetHighGC5_3_2M253 N*R^2)) + (onsetHighGC5_3_3M253 N*R^3 + (onsetHighGC5_3_4M253 N*R^4 + onsetHighGC5_3_5M253 N*R^5)))

theorem onsetHighGCol5_3M253_eq (N R : ℤ) : (((onsetHighCol5_6_0M253 N R*onsetHighCol5_6_3M253 N R-onsetHighCol5_5_0M253 N R*onsetHighCol5_7_3M253 N R) + (onsetHighCol5_6_1M253 N R*onsetHighCol5_6_2M253 N R-onsetHighCol5_5_1M253 N R*onsetHighCol5_7_2M253 N R)) + ((onsetHighCol5_6_2M253 N R*onsetHighCol5_6_1M253 N R-onsetHighCol5_5_2M253 N R*onsetHighCol5_7_1M253 N R) + (onsetHighCol5_6_3M253 N R*onsetHighCol5_6_0M253 N R-onsetHighCol5_5_3M253 N R*onsetHighCol5_7_0M253 N R)))=onsetHighGCol5_3M253 N R := by
 unfold onsetHighGCol5_3M253 onsetHighCol5_5_0M253 onsetHighCol5_5_1M253 onsetHighCol5_5_2M253 onsetHighCol5_5_3M253 onsetHighCol5_6_0M253 onsetHighCol5_6_1M253 onsetHighCol5_6_2M253 onsetHighCol5_6_3M253 onsetHighCol5_7_0M253 onsetHighCol5_7_1M253 onsetHighCol5_7_2M253 onsetHighCol5_7_3M253
 rw [←onsetHighGC5_3_0M253_eq,←onsetHighGC5_3_1M253_eq,←onsetHighGC5_3_2M253_eq,←onsetHighGC5_3_3M253_eq,←onsetHighGC5_3_4M253_eq,←onsetHighGC5_3_5M253_eq]
 ring

theorem onsetHighGCol5_3M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol5_3M253 N R := by
 unfold onsetHighGCol5_3M253
 have h0 := onsetHighGC5_3_0M253_nonneg N hN
 have h1 := onsetHighGC5_3_1M253_nonneg N hN
 have h2 := onsetHighGC5_3_2M253_nonneg N hN
 have h3 := onsetHighGC5_3_3M253_nonneg N hN
 have h4 := onsetHighGC5_3_4M253_nonneg N hN
 have h5 := onsetHighGC5_3_5M253_nonneg N hN
 positivity

def onsetHighGCol5_4M253 (N R : ℤ) : ℤ := ((onsetHighGC5_4_0M253 N*R^0 + onsetHighGC5_4_1M253 N*R^1) + (onsetHighGC5_4_2M253 N*R^2 + (onsetHighGC5_4_3M253 N*R^3 + onsetHighGC5_4_4M253 N*R^4)))

theorem onsetHighGCol5_4M253_eq (N R : ℤ) : (((onsetHighCol5_6_0M253 N R*onsetHighCol5_6_4M253 N R-onsetHighCol5_5_0M253 N R*onsetHighCol5_7_4M253 N R) + (onsetHighCol5_6_1M253 N R*onsetHighCol5_6_3M253 N R-onsetHighCol5_5_1M253 N R*onsetHighCol5_7_3M253 N R)) + ((onsetHighCol5_6_2M253 N R*onsetHighCol5_6_2M253 N R-onsetHighCol5_5_2M253 N R*onsetHighCol5_7_2M253 N R) + ((onsetHighCol5_6_3M253 N R*onsetHighCol5_6_1M253 N R-onsetHighCol5_5_3M253 N R*onsetHighCol5_7_1M253 N R) + (onsetHighCol5_6_4M253 N R*onsetHighCol5_6_0M253 N R-onsetHighCol5_5_4M253 N R*onsetHighCol5_7_0M253 N R))))=onsetHighGCol5_4M253 N R := by
 unfold onsetHighGCol5_4M253 onsetHighCol5_5_0M253 onsetHighCol5_5_1M253 onsetHighCol5_5_2M253 onsetHighCol5_5_3M253 onsetHighCol5_5_4M253 onsetHighCol5_6_0M253 onsetHighCol5_6_1M253 onsetHighCol5_6_2M253 onsetHighCol5_6_3M253 onsetHighCol5_6_4M253 onsetHighCol5_7_0M253 onsetHighCol5_7_1M253 onsetHighCol5_7_2M253 onsetHighCol5_7_3M253 onsetHighCol5_7_4M253
 rw [←onsetHighGC5_4_0M253_eq,←onsetHighGC5_4_1M253_eq,←onsetHighGC5_4_2M253_eq,←onsetHighGC5_4_3M253_eq,←onsetHighGC5_4_4M253_eq]
 ring

theorem onsetHighGCol5_4M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol5_4M253 N R := by
 unfold onsetHighGCol5_4M253
 have h0 := onsetHighGC5_4_0M253_nonneg N hN
 have h1 := onsetHighGC5_4_1M253_nonneg N hN
 have h2 := onsetHighGC5_4_2M253_nonneg N hN
 have h3 := onsetHighGC5_4_3M253_nonneg N hN
 have h4 := onsetHighGC5_4_4M253_nonneg N hN
 positivity

def onsetHighGCol5_5M253 (N R : ℤ) : ℤ := ((onsetHighGC5_5_0M253 N*R^0 + onsetHighGC5_5_1M253 N*R^1) + (onsetHighGC5_5_2M253 N*R^2 + onsetHighGC5_5_3M253 N*R^3))

theorem onsetHighGCol5_5M253_eq (N R : ℤ) : (((onsetHighCol5_6_1M253 N R*onsetHighCol5_6_4M253 N R-onsetHighCol5_5_1M253 N R*onsetHighCol5_7_4M253 N R) + (onsetHighCol5_6_2M253 N R*onsetHighCol5_6_3M253 N R-onsetHighCol5_5_2M253 N R*onsetHighCol5_7_3M253 N R)) + ((onsetHighCol5_6_3M253 N R*onsetHighCol5_6_2M253 N R-onsetHighCol5_5_3M253 N R*onsetHighCol5_7_2M253 N R) + (onsetHighCol5_6_4M253 N R*onsetHighCol5_6_1M253 N R-onsetHighCol5_5_4M253 N R*onsetHighCol5_7_1M253 N R)))=onsetHighGCol5_5M253 N R := by
 unfold onsetHighGCol5_5M253 onsetHighCol5_5_1M253 onsetHighCol5_5_2M253 onsetHighCol5_5_3M253 onsetHighCol5_5_4M253 onsetHighCol5_6_1M253 onsetHighCol5_6_2M253 onsetHighCol5_6_3M253 onsetHighCol5_6_4M253 onsetHighCol5_7_1M253 onsetHighCol5_7_2M253 onsetHighCol5_7_3M253 onsetHighCol5_7_4M253
 rw [←onsetHighGC5_5_0M253_eq,←onsetHighGC5_5_1M253_eq,←onsetHighGC5_5_2M253_eq,←onsetHighGC5_5_3M253_eq]
 ring

theorem onsetHighGCol5_5M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol5_5M253 N R := by
 unfold onsetHighGCol5_5M253
 have h0 := onsetHighGC5_5_0M253_nonneg N hN
 have h1 := onsetHighGC5_5_1M253_nonneg N hN
 have h2 := onsetHighGC5_5_2M253_nonneg N hN
 have h3 := onsetHighGC5_5_3M253_nonneg N hN
 positivity

def onsetHighGCol5_6M253 (N R : ℤ) : ℤ := (onsetHighGC5_6_0M253 N*R^0 + (onsetHighGC5_6_1M253 N*R^1 + onsetHighGC5_6_2M253 N*R^2))

theorem onsetHighGCol5_6M253_eq (N R : ℤ) : ((onsetHighCol5_6_2M253 N R*onsetHighCol5_6_4M253 N R-onsetHighCol5_5_2M253 N R*onsetHighCol5_7_4M253 N R) + ((onsetHighCol5_6_3M253 N R*onsetHighCol5_6_3M253 N R-onsetHighCol5_5_3M253 N R*onsetHighCol5_7_3M253 N R) + (onsetHighCol5_6_4M253 N R*onsetHighCol5_6_2M253 N R-onsetHighCol5_5_4M253 N R*onsetHighCol5_7_2M253 N R)))=onsetHighGCol5_6M253 N R := by
 unfold onsetHighGCol5_6M253 onsetHighCol5_5_2M253 onsetHighCol5_5_3M253 onsetHighCol5_5_4M253 onsetHighCol5_6_2M253 onsetHighCol5_6_3M253 onsetHighCol5_6_4M253 onsetHighCol5_7_2M253 onsetHighCol5_7_3M253 onsetHighCol5_7_4M253
 rw [←onsetHighGC5_6_0M253_eq,←onsetHighGC5_6_1M253_eq,←onsetHighGC5_6_2M253_eq]
 ring

theorem onsetHighGCol5_6M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol5_6M253 N R := by
 unfold onsetHighGCol5_6M253
 have h0 := onsetHighGC5_6_0M253_nonneg N hN
 have h1 := onsetHighGC5_6_1M253_nonneg N hN
 have h2 := onsetHighGC5_6_2M253_nonneg N hN
 positivity

def onsetHighGCol5_7M253 (N R : ℤ) : ℤ := (onsetHighGC5_7_0M253 N*R^0 + onsetHighGC5_7_1M253 N*R^1)

theorem onsetHighGCol5_7M253_eq (N R : ℤ) : ((onsetHighCol5_6_3M253 N R*onsetHighCol5_6_4M253 N R-onsetHighCol5_5_3M253 N R*onsetHighCol5_7_4M253 N R) + (onsetHighCol5_6_4M253 N R*onsetHighCol5_6_3M253 N R-onsetHighCol5_5_4M253 N R*onsetHighCol5_7_3M253 N R))=onsetHighGCol5_7M253 N R := by
 unfold onsetHighGCol5_7M253 onsetHighCol5_5_3M253 onsetHighCol5_5_4M253 onsetHighCol5_6_3M253 onsetHighCol5_6_4M253 onsetHighCol5_7_3M253 onsetHighCol5_7_4M253
 rw [←onsetHighGC5_7_0M253_eq,←onsetHighGC5_7_1M253_eq]
 ring

theorem onsetHighGCol5_7M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol5_7M253 N R := by
 unfold onsetHighGCol5_7M253
 have h0 := onsetHighGC5_7_0M253_nonneg N hN
 have h1 := onsetHighGC5_7_1M253_nonneg N hN
 positivity

def onsetHighGCol5_8M253 (N R : ℤ) : ℤ := onsetHighGC5_8_0M253 N*R^0

theorem onsetHighGCol5_8M253_eq (N R : ℤ) : (onsetHighCol5_6_4M253 N R*onsetHighCol5_6_4M253 N R-onsetHighCol5_5_4M253 N R*onsetHighCol5_7_4M253 N R)=onsetHighGCol5_8M253 N R := by
 unfold onsetHighGCol5_8M253 onsetHighCol5_5_4M253 onsetHighCol5_6_4M253 onsetHighCol5_7_4M253
 rw [←onsetHighGC5_8_0M253_eq]
 ring

theorem onsetHighGCol5_8M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol5_8M253 N R := by
 unfold onsetHighGCol5_8M253
 have h0 := onsetHighGC5_8_0M253_nonneg N hN
 positivity

attribute [local irreducible] onsetHighCol5_5_0M253 onsetHighCol5_5_1M253 onsetHighCol5_5_2M253 onsetHighCol5_5_3M253 onsetHighCol5_5_4M253 onsetHighCol5_6_0M253 onsetHighCol5_6_1M253 onsetHighCol5_6_2M253 onsetHighCol5_6_3M253 onsetHighCol5_6_4M253 onsetHighCol5_7_0M253 onsetHighCol5_7_1M253 onsetHighCol5_7_2M253 onsetHighCol5_7_3M253 onsetHighCol5_7_4M253

theorem onsetHigh_lc5M253 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 onsetHighV5M253 N C R*onsetHighV7M253 N C R ≤ (onsetHighV6M253 N C R)^2 := by
 apply sub_nonneg.mp
 rw [onsetHigh_cols5_5M253,onsetHigh_cols5_6M253,onsetHigh_cols5_7M253]
 have he : ((onsetHighCol5_6_0M253 N R*C^0 + onsetHighCol5_6_1M253 N R*C^1) + (onsetHighCol5_6_2M253 N R*C^2 + (onsetHighCol5_6_3M253 N R*C^3 + onsetHighCol5_6_4M253 N R*C^4)))^2-((onsetHighCol5_5_0M253 N R*C^0 + onsetHighCol5_5_1M253 N R*C^1) + (onsetHighCol5_5_2M253 N R*C^2 + (onsetHighCol5_5_3M253 N R*C^3 + onsetHighCol5_5_4M253 N R*C^4)))*((onsetHighCol5_7_0M253 N R*C^0 + onsetHighCol5_7_1M253 N R*C^1) + (onsetHighCol5_7_2M253 N R*C^2 + (onsetHighCol5_7_3M253 N R*C^3 + onsetHighCol5_7_4M253 N R*C^4)))=(((onsetHighGCol5_0M253 N R*C^0 + onsetHighGCol5_1M253 N R*C^1) + (onsetHighGCol5_2M253 N R*C^2 + onsetHighGCol5_3M253 N R*C^3)) + ((onsetHighGCol5_4M253 N R*C^4 + onsetHighGCol5_5M253 N R*C^5) + (onsetHighGCol5_6M253 N R*C^6 + (onsetHighGCol5_7M253 N R*C^7 + onsetHighGCol5_8M253 N R*C^8)))) := by
  rw [←onsetHighGCol5_0M253_eq,←onsetHighGCol5_1M253_eq,←onsetHighGCol5_2M253_eq,←onsetHighGCol5_3M253_eq,←onsetHighGCol5_4M253_eq,←onsetHighGCol5_5M253_eq,←onsetHighGCol5_6M253_eq,←onsetHighGCol5_7M253_eq,←onsetHighGCol5_8M253_eq]
  ring
 rw [he]
 have h0 := onsetHighGCol5_0M253_nonneg N R hN hR
 have h1 := onsetHighGCol5_1M253_nonneg N R hN hR
 have h2 := onsetHighGCol5_2M253_nonneg N R hN hR
 have h3 := onsetHighGCol5_3M253_nonneg N R hN hR
 have h4 := onsetHighGCol5_4M253_nonneg N R hN hR
 have h5 := onsetHighGCol5_5M253_nonneg N R hN hR
 have h6 := onsetHighGCol5_6M253_nonneg N R hN hR
 have h7 := onsetHighGCol5_7M253_nonneg N R hN hR
 have h8 := onsetHighGCol5_8M253_nonneg N R hN hR
 positivity
end
end MathGKM.Markov
