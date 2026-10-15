import MarkovOnsetHighSplitDefsM253
/-! Machine-authored request 2532cf40. Coefficient-wise onset gap proof. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536

def onsetHighGC1_0_0M253 (N : ℤ) : ℤ := ((((((((((((39715445145600*N + 4414930597969920)*N + 225021058074279936)*N + 6950829667280486400)*N + 144864670535233044480)*N + 2144953498189493698560)*N + 23123719722034400329728)*N + 182775354311206565314560)*N + 1050683480903664764190720)*N + 4281419308365488660152320)*N + 11732571590465772963495936)*N + 19402878520737091855319040)*N + 14636474102119869245030400)

theorem onsetHighGC1_0_0M253_eq (N : ℤ) : (onsetHighC2_0_0M253 N*onsetHighC2_0_0M253 N-onsetHighC1_0_0M253 N*onsetHighC3_0_0M253 N)=onsetHighGC1_0_0M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC2_0_0M253 onsetHighC3_0_0M253 onsetHighGC1_0_0M253
 ring

theorem onsetHighGC1_0_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_0_0M253 N := by
 unfold onsetHighGC1_0_0M253
 positivity

def onsetHighGC1_0_1M253 (N : ℤ) : ℤ := ((((((((((((95039615139840*N + 10599540210008064)*N + 541894332565684224)*N + 16784703133109452800)*N + 350623812834353479680)*N + 5201036156621618675712)*N + 56144153370037774712832)*N + 444145841483485859020800)*N + 2554128722819343691284480)*N + 10407506764626220415975424)*N + 28509756397159167800377344)*N + 47118490214540204113920000)*N + 35514075787239091411353600)

theorem onsetHighGC1_0_1M253_eq (N : ℤ) : ((onsetHighC2_0_0M253 N*onsetHighC2_0_1M253 N-onsetHighC1_0_0M253 N*onsetHighC3_0_1M253 N) + (onsetHighC2_0_1M253 N*onsetHighC2_0_0M253 N-onsetHighC1_0_1M253 N*onsetHighC3_0_0M253 N))=onsetHighGC1_0_1M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_0_1M253 onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighGC1_0_1M253
 ring

theorem onsetHighGC1_0_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_0_1M253 N := by
 unfold onsetHighGC1_0_1M253
 positivity

def onsetHighGC1_0_2M253 (N : ℤ) : ℤ := ((((((((((((99044387979264*N + 11093111897849856)*N + 569396664100454400)*N + 17699798698945413120)*N + 370872407497326723072)*N + 5515087743372537888768)*N + 59647678064872178319360)*N + 472496778533134915338240)*N + 2719439418408726490251264)*N + 11085462632952700260581376)*N + 30367556247170877668720640)*N + 50175088378835064752701440)*N + 37799037715160281345228800)

theorem onsetHighGC1_0_2M253_eq (N : ℤ) : ((onsetHighC2_0_0M253 N*onsetHighC2_0_2M253 N-onsetHighC1_0_0M253 N*onsetHighC3_0_2M253 N) + ((onsetHighC2_0_1M253 N*onsetHighC2_0_1M253 N-onsetHighC1_0_1M253 N*onsetHighC3_0_1M253 N) + (onsetHighC2_0_2M253 N*onsetHighC2_0_0M253 N-onsetHighC1_0_2M253 N*onsetHighC3_0_0M253 N)))=onsetHighGC1_0_2M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_0_1M253 onsetHighC1_0_2M253 onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighGC1_0_2M253
 ring

theorem onsetHighGC1_0_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_0_2M253 N := by
 unfold onsetHighGC1_0_2M253
 positivity

def onsetHighGC1_0_3M253 (N : ℤ) : ℤ := ((((((((((((58583452483584*N + 6596653259685888)*N + 340319702788079616)*N + 10627441647283077120)*N + 223566885203863928832)*N + 3335571206035555221504)*N + 36170845262202866761728)*N + 287104245229103850455040)*N + 1654817632141137100406784)*N + 6752129350023240976171008)*N + 18506890709325075113312256)*N + 30584637337130855769047040)*N + 23039623962345574563840000)

theorem onsetHighGC1_0_3M253_eq (N : ℤ) : (((onsetHighC2_0_0M253 N*onsetHighC2_0_3M253 N-onsetHighC1_0_0M253 N*onsetHighC3_0_3M253 N) + (onsetHighC2_0_1M253 N*onsetHighC2_0_2M253 N-onsetHighC1_0_1M253 N*onsetHighC3_0_2M253 N)) + ((onsetHighC2_0_2M253 N*onsetHighC2_0_1M253 N-onsetHighC1_0_2M253 N*onsetHighC3_0_1M253 N) + (onsetHighC2_0_3M253 N*onsetHighC2_0_0M253 N-onsetHighC1_0_3M253 N*onsetHighC3_0_0M253 N)))=onsetHighGC1_0_3M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_0_1M253 onsetHighC1_0_2M253 onsetHighC1_0_3M253 onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighGC1_0_3M253
 ring

theorem onsetHighGC1_0_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_0_3M253 N := by
 unfold onsetHighGC1_0_3M253
 positivity

def onsetHighGC1_0_4M253 (N : ℤ) : ℤ := ((((((((((((21475472965632*N + 2434118279233536)*N + 126362701447299072)*N + 3968538708368424960)*N + 83903052501970845696)*N + 1257144555102491639808)*N + 13680368612541040951296)*N + 108893494159783074201600)*N + 629019756026423984259072)*N + 2570810878017861772640256)*N + 7054689353285329532485632)*N + 11668055385847149326499840)*N + 8794089491203203593011200)

theorem onsetHighGC1_0_4M253_eq (N : ℤ) : (((onsetHighC2_0_0M253 N*onsetHighC2_0_4M253 N-onsetHighC1_0_0M253 N*onsetHighC3_0_4M253 N) + (onsetHighC2_0_1M253 N*onsetHighC2_0_3M253 N-onsetHighC1_0_1M253 N*onsetHighC3_0_3M253 N)) + ((onsetHighC2_0_2M253 N*onsetHighC2_0_2M253 N-onsetHighC1_0_2M253 N*onsetHighC3_0_2M253 N) + ((onsetHighC2_0_3M253 N*onsetHighC2_0_1M253 N-onsetHighC1_0_3M253 N*onsetHighC3_0_1M253 N) + (onsetHighC2_0_4M253 N*onsetHighC2_0_0M253 N-onsetHighC1_0_4M253 N*onsetHighC3_0_0M253 N))))=onsetHighGC1_0_4M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_0_1M253 onsetHighC1_0_2M253 onsetHighC1_0_3M253 onsetHighC1_0_4M253 onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighGC1_0_4M253
 ring

theorem onsetHighGC1_0_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_0_4M253 N := by
 unfold onsetHighGC1_0_4M253
 positivity

def onsetHighGC1_0_5M253 (N : ℤ) : ℤ := ((((((((((((4990194155520*N + 570056421408768)*N + 29816099199516672)*N + 942865202597068800)*N + 20056293236098990080)*N + 302103548799404212224)*N + 3302284894482874761216)*N + 26383678968053225226240)*N + 152868161396189469081600)*N + 626298929785819137835008)*N + 1721970012319830061350912)*N + 2852308829358724137615360)*N + 2152228176647023774924800)

theorem onsetHighGC1_0_5M253_eq (N : ℤ) : (((onsetHighC2_0_1M253 N*onsetHighC2_0_4M253 N-onsetHighC1_0_1M253 N*onsetHighC3_0_4M253 N) + (onsetHighC2_0_2M253 N*onsetHighC2_0_3M253 N-onsetHighC1_0_2M253 N*onsetHighC3_0_3M253 N)) + ((onsetHighC2_0_3M253 N*onsetHighC2_0_2M253 N-onsetHighC1_0_3M253 N*onsetHighC3_0_2M253 N) + (onsetHighC2_0_4M253 N*onsetHighC2_0_1M253 N-onsetHighC1_0_4M253 N*onsetHighC3_0_1M253 N)))=onsetHighGC1_0_5M253 N := by
 unfold onsetHighC1_0_1M253 onsetHighC1_0_2M253 onsetHighC1_0_3M253 onsetHighC1_0_4M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighGC1_0_5M253
 ring

theorem onsetHighGC1_0_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_0_5M253 N := by
 unfold onsetHighGC1_0_5M253
 positivity

def onsetHighGC1_0_6M253 (N : ℤ) : ℤ := ((((((((((((717216546816*N + 82683302510592)*N + 4362829905788928)*N + 139090352894115840)*N + 2980359908503584768)*N + 45181387659480662016)*N + 496619424192640057344)*N + 3986510682002156421120)*N + 23189934147829403222016)*N + 95324278734341057544192)*N + 262808954376380255305728)*N + 436309566023647883427840)*N + 329834766187786051584000)

theorem onsetHighGC1_0_6M253_eq (N : ℤ) : ((onsetHighC2_0_2M253 N*onsetHighC2_0_4M253 N-onsetHighC1_0_2M253 N*onsetHighC3_0_4M253 N) + ((onsetHighC2_0_3M253 N*onsetHighC2_0_3M253 N-onsetHighC1_0_3M253 N*onsetHighC3_0_3M253 N) + (onsetHighC2_0_4M253 N*onsetHighC2_0_2M253 N-onsetHighC1_0_4M253 N*onsetHighC3_0_2M253 N)))=onsetHighGC1_0_6M253 N := by
 unfold onsetHighC1_0_2M253 onsetHighC1_0_3M253 onsetHighC1_0_4M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighGC1_0_6M253
 ring

theorem onsetHighGC1_0_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_0_6M253 N := by
 unfold onsetHighGC1_0_6M253
 positivity

def onsetHighGC1_0_7M253 (N : ℤ) : ℤ := ((((((((((((58265174016*N + 6787562471424)*N + 361788944154624)*N + 11643309407600640)*N + 251629401974243328)*N + 3843757749700657152)*N + 42532134732556664832)*N + 343399400362200268800)*N + 2007562338437850464256)*N + 8287512755579531034624)*N + 22931872416704725254144)*N + 38189004848074146447360)*N + 28945823809845067776000)

theorem onsetHighGC1_0_7M253_eq (N : ℤ) : ((onsetHighC2_0_3M253 N*onsetHighC2_0_4M253 N-onsetHighC1_0_3M253 N*onsetHighC3_0_4M253 N) + (onsetHighC2_0_4M253 N*onsetHighC2_0_3M253 N-onsetHighC1_0_4M253 N*onsetHighC3_0_3M253 N))=onsetHighGC1_0_7M253 N := by
 unfold onsetHighC1_0_3M253 onsetHighC1_0_4M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighGC1_0_7M253
 ring

theorem onsetHighGC1_0_7M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_0_7M253 N := by
 unfold onsetHighGC1_0_7M253
 positivity

def onsetHighGC1_0_8M253 (N : ℤ) : ℤ := ((((((((((((2047868928*N + 241384292352)*N + 13014273097728)*N + 423361558609920)*N + 9240075221336064)*N + 142403266890694656)*N + 1588180163220209664)*N + 12911895783250329600)*N + 75943272634589380608)*N + 315162287982737620992)*N + 876069696925055582208)*N + 1464753037403467284480)*N + 1114072862011903180800)

theorem onsetHighGC1_0_8M253_eq (N : ℤ) : (onsetHighC2_0_4M253 N*onsetHighC2_0_4M253 N-onsetHighC1_0_4M253 N*onsetHighC3_0_4M253 N)=onsetHighGC1_0_8M253 N := by
 unfold onsetHighC1_0_4M253 onsetHighC2_0_4M253 onsetHighC3_0_4M253 onsetHighGC1_0_8M253
 ring

theorem onsetHighGC1_0_8M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_0_8M253 N := by
 unfold onsetHighGC1_0_8M253
 positivity

def onsetHighGC1_1_0M253 (N : ℤ) : ℤ := ((((((((((((190079230279680*N + 21002928928063488)*N + 1063847069246029824)*N + 32648360256853770240)*N + 675750819134743511040)*N + 9932320700181233270784)*N + 106243975553714919309312)*N + 832901685659574510551040)*N + 4746966637386277878497280)*N + 19172152393928123275542528)*N + 52062352855154753943896064)*N + 85308912047961188959518720)*N + 63761179273269275905228800)

theorem onsetHighGC1_1_0M253_eq (N : ℤ) : ((onsetHighC2_0_0M253 N*onsetHighC2_1_0M253 N-onsetHighC1_0_0M253 N*onsetHighC3_1_0M253 N) + (onsetHighC2_1_0M253 N*onsetHighC2_0_0M253 N-onsetHighC1_1_0M253 N*onsetHighC3_0_0M253 N))=onsetHighGC1_1_0M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_1_0M253 onsetHighC2_0_0M253 onsetHighC2_1_0M253 onsetHighC3_0_0M253 onsetHighC3_1_0M253 onsetHighGC1_1_0M253
 ring

theorem onsetHighGC1_1_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_1_0M253 N := by
 unfold onsetHighGC1_1_0M253
 positivity

def onsetHighGC1_1_1M253 (N : ℤ) : ℤ := ((((((((((((396177551917056*N + 43950268445884416)*N + 2234520636355510272)*N + 68804553204962426880)*N + 1428155738290255822848)*N + 21039398127006507859968)*N + 225443222961053830742016)*N + 1769473375630508886589440)*N + 10091865493863574558212096)*N + 40770447562494571620335616)*N + 110703702482124792489050112)*N + 181330935633010513233838080)*N + 135449899409133212604825600)

theorem onsetHighGC1_1_1M253_eq (N : ℤ) : (((onsetHighC2_0_0M253 N*onsetHighC2_1_1M253 N-onsetHighC1_0_0M253 N*onsetHighC3_1_1M253 N) + (onsetHighC2_0_1M253 N*onsetHighC2_1_0M253 N-onsetHighC1_0_1M253 N*onsetHighC3_1_0M253 N)) + ((onsetHighC2_1_0M253 N*onsetHighC2_0_1M253 N-onsetHighC1_1_0M253 N*onsetHighC3_0_1M253 N) + (onsetHighC2_1_1M253 N*onsetHighC2_0_0M253 N-onsetHighC1_1_1M253 N*onsetHighC3_0_0M253 N)))=onsetHighGC1_1_1M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_0_1M253 onsetHighC1_1_0M253 onsetHighC1_1_1M253 onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighGC1_1_1M253
 ring

theorem onsetHighGC1_1_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_1_1M253 N := by
 unfold onsetHighGC1_1_1M253
 positivity

def onsetHighGC1_1_2M253 (N : ℤ) : ℤ := ((((((((((((351500714901504*N + 39190807814602752)*N + 2002050710312583168)*N + 61911475229703536640)*N + 1289847413976100503552)*N + 19060282221849200295936)*N + 204734525953270600433664)*N + 1609887623585123810672640)*N + 9193589895420712013266944)*N + 37172015361423539004506112)*N + 100975768416704646708461568)*N + 165413693812956846615429120)*N + 123541921187381941803417600)

theorem onsetHighGC1_1_2M253_eq (N : ℤ) : (((onsetHighC2_0_0M253 N*onsetHighC2_1_2M253 N-onsetHighC1_0_0M253 N*onsetHighC3_1_2M253 N) + ((onsetHighC2_0_1M253 N*onsetHighC2_1_1M253 N-onsetHighC1_0_1M253 N*onsetHighC3_1_1M253 N) + (onsetHighC2_0_2M253 N*onsetHighC2_1_0M253 N-onsetHighC1_0_2M253 N*onsetHighC3_1_0M253 N))) + ((onsetHighC2_1_0M253 N*onsetHighC2_0_2M253 N-onsetHighC1_1_0M253 N*onsetHighC3_0_2M253 N) + ((onsetHighC2_1_1M253 N*onsetHighC2_0_1M253 N-onsetHighC1_1_1M253 N*onsetHighC3_0_1M253 N) + (onsetHighC2_1_2M253 N*onsetHighC2_0_0M253 N-onsetHighC1_1_2M253 N*onsetHighC3_0_0M253 N))))=onsetHighGC1_1_2M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_0_1M253 onsetHighC1_0_2M253 onsetHighC1_1_0M253 onsetHighC1_1_1M253 onsetHighC1_1_2M253 onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighGC1_1_2M253
 ring

theorem onsetHighGC1_1_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_1_2M253 N := by
 unfold onsetHighGC1_1_2M253
 positivity

def onsetHighGC1_1_3M253 (N : ℤ) : ℤ := ((((((((((((171803783725056*N + 19274405209178112)*N + 990444779533762560)*N + 30792938867361054720)*N + 644546744739019358208)*N + 9562510941496075616256)*N + 103051348008495847833600)*N + 812438042322623083315200)*N + 4648921535559500993396736)*N + 18824738050449259738693632)*N + 51189834796807168422051840)*N + 83913883857969385627975680)*N + 62697028575056494303641600)

theorem onsetHighGC1_1_3M253_eq (N : ℤ) : ((((onsetHighC2_0_0M253 N*onsetHighC2_1_3M253 N-onsetHighC1_0_0M253 N*onsetHighC3_1_3M253 N) + (onsetHighC2_0_1M253 N*onsetHighC2_1_2M253 N-onsetHighC1_0_1M253 N*onsetHighC3_1_2M253 N)) + ((onsetHighC2_0_2M253 N*onsetHighC2_1_1M253 N-onsetHighC1_0_2M253 N*onsetHighC3_1_1M253 N) + (onsetHighC2_0_3M253 N*onsetHighC2_1_0M253 N-onsetHighC1_0_3M253 N*onsetHighC3_1_0M253 N))) + (((onsetHighC2_1_0M253 N*onsetHighC2_0_3M253 N-onsetHighC1_1_0M253 N*onsetHighC3_0_3M253 N) + (onsetHighC2_1_1M253 N*onsetHighC2_0_2M253 N-onsetHighC1_1_1M253 N*onsetHighC3_0_2M253 N)) + ((onsetHighC2_1_2M253 N*onsetHighC2_0_1M253 N-onsetHighC1_1_2M253 N*onsetHighC3_0_1M253 N) + (onsetHighC2_1_3M253 N*onsetHighC2_0_0M253 N-onsetHighC1_1_3M253 N*onsetHighC3_0_0M253 N))))=onsetHighGC1_1_3M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_0_1M253 onsetHighC1_0_2M253 onsetHighC1_0_3M253 onsetHighC1_1_0M253 onsetHighC1_1_1M253 onsetHighC1_1_2M253 onsetHighC1_1_3M253 onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighGC1_1_3M253
 ring

theorem onsetHighGC1_1_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_1_3M253 N := by
 unfold onsetHighGC1_1_3M253
 positivity

def onsetHighGC1_1_4M253 (N : ℤ) : ℤ := ((((((((((((49901941555200*N + 5640133848072192)*N + 291890507179622400)*N + 9134052130066268160)*N + 192295890433521745920)*N + 2867145821489417158656)*N + 31028263660111527936000)*N + 245473679667312643276800)*N + 1408618404599690617159680)*N + 5716723549101765612797952)*N + 15572769757522628758732800)*N + 25562407906452352888995840)*N + 19118585926938227363020800)

theorem onsetHighGC1_1_4M253_eq (N : ℤ) : ((((onsetHighC2_0_1M253 N*onsetHighC2_1_3M253 N-onsetHighC1_0_1M253 N*onsetHighC3_1_3M253 N) + (onsetHighC2_0_2M253 N*onsetHighC2_1_2M253 N-onsetHighC1_0_2M253 N*onsetHighC3_1_2M253 N)) + ((onsetHighC2_0_3M253 N*onsetHighC2_1_1M253 N-onsetHighC1_0_3M253 N*onsetHighC3_1_1M253 N) + (onsetHighC2_0_4M253 N*onsetHighC2_1_0M253 N-onsetHighC1_0_4M253 N*onsetHighC3_1_0M253 N))) + (((onsetHighC2_1_0M253 N*onsetHighC2_0_4M253 N-onsetHighC1_1_0M253 N*onsetHighC3_0_4M253 N) + (onsetHighC2_1_1M253 N*onsetHighC2_0_3M253 N-onsetHighC1_1_1M253 N*onsetHighC3_0_3M253 N)) + ((onsetHighC2_1_2M253 N*onsetHighC2_0_2M253 N-onsetHighC1_1_2M253 N*onsetHighC3_0_2M253 N) + (onsetHighC2_1_3M253 N*onsetHighC2_0_1M253 N-onsetHighC1_1_3M253 N*onsetHighC3_0_1M253 N))))=onsetHighGC1_1_4M253 N := by
 unfold onsetHighC1_0_1M253 onsetHighC1_0_2M253 onsetHighC1_0_3M253 onsetHighC1_0_4M253 onsetHighC1_1_0M253 onsetHighC1_1_1M253 onsetHighC1_1_2M253 onsetHighC1_1_3M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighGC1_1_4M253
 ring

theorem onsetHighGC1_1_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_1_4M253 N := by
 unfold onsetHighGC1_1_4M253
 positivity

def onsetHighGC1_1_5M253 (N : ℤ) : ℤ := ((((((((((((8606598561792*N + 981247891341312)*N + 51207752889925632)*N + 1614830300855009280)*N + 34232226598314049536)*N + 513508062477340901376)*N + 5586284256240605331456)*N + 44391203121259720212480)*N + 255683278466054747062272)*N + 1040878675041778387648512)*N + 2842672640300497672077312)*N + 4675960503865940445757440)*N + 3503214702455697447321600)

theorem onsetHighGC1_1_5M253_eq (N : ℤ) : (((onsetHighC2_0_2M253 N*onsetHighC2_1_3M253 N-onsetHighC1_0_2M253 N*onsetHighC3_1_3M253 N) + ((onsetHighC2_0_3M253 N*onsetHighC2_1_2M253 N-onsetHighC1_0_3M253 N*onsetHighC3_1_2M253 N) + (onsetHighC2_0_4M253 N*onsetHighC2_1_1M253 N-onsetHighC1_0_4M253 N*onsetHighC3_1_1M253 N))) + ((onsetHighC2_1_1M253 N*onsetHighC2_0_4M253 N-onsetHighC1_1_1M253 N*onsetHighC3_0_4M253 N) + ((onsetHighC2_1_2M253 N*onsetHighC2_0_3M253 N-onsetHighC1_1_2M253 N*onsetHighC3_0_3M253 N) + (onsetHighC2_1_3M253 N*onsetHighC2_0_2M253 N-onsetHighC1_1_3M253 N*onsetHighC3_0_2M253 N))))=onsetHighGC1_1_5M253 N := by
 unfold onsetHighC1_0_2M253 onsetHighC1_0_3M253 onsetHighC1_0_4M253 onsetHighC1_1_1M253 onsetHighC1_1_2M253 onsetHighC1_1_3M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighGC1_1_5M253
 ring

theorem onsetHighGC1_1_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_1_5M253 N := by
 unfold onsetHighGC1_1_5M253
 positivity

def onsetHighGC1_1_6M253 (N : ℤ) : ℤ := ((((((((((((815712436224*N + 93933237436416)*N + 4949509473828864)*N + 157487735179837440)*N + 3365744347695808512)*N + 50853985438849302528)*N + 556726758604293537792)*N + 4448254348333626163200)*N + 25741492762089044312064)*N + 105213714854567064109056)*N + 288323348755921024057344)*N + 475642728327614992220160)*N + 357227293723027557580800)

theorem onsetHighGC1_1_6M253_eq (N : ℤ) : (((onsetHighC2_0_3M253 N*onsetHighC2_1_3M253 N-onsetHighC1_0_3M253 N*onsetHighC3_1_3M253 N) + (onsetHighC2_0_4M253 N*onsetHighC2_1_2M253 N-onsetHighC1_0_4M253 N*onsetHighC3_1_2M253 N)) + ((onsetHighC2_1_2M253 N*onsetHighC2_0_4M253 N-onsetHighC1_1_2M253 N*onsetHighC3_0_4M253 N) + (onsetHighC2_1_3M253 N*onsetHighC2_0_3M253 N-onsetHighC1_1_3M253 N*onsetHighC3_0_3M253 N)))=onsetHighGC1_1_6M253 N := by
 unfold onsetHighC1_0_3M253 onsetHighC1_0_4M253 onsetHighC1_1_2M253 onsetHighC1_1_3M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighGC1_1_6M253
 ring

theorem onsetHighGC1_1_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_1_6M253 N := by
 unfold onsetHighGC1_1_6M253
 positivity

def onsetHighGC1_1_7M253 (N : ℤ) : ℤ := ((((((((((((32765902848*N + 3815906476032)*N + 203279397027840)*N + 6534816470138880)*N + 140974725449908224)*N + 2148044550319374336)*N + 23692112068041768960)*N + 190546530602204528640)*N + 1109004974537444425728)*N + 4555500060319974162432)*N + 12537791415624558182400)*N + 20761089551085003079680)*N + 15643275497631645696000)

theorem onsetHighGC1_1_7M253_eq (N : ℤ) : ((onsetHighC2_0_4M253 N*onsetHighC2_1_3M253 N-onsetHighC1_0_4M253 N*onsetHighC3_1_3M253 N) + (onsetHighC2_1_3M253 N*onsetHighC2_0_4M253 N-onsetHighC1_1_3M253 N*onsetHighC3_0_4M253 N))=onsetHighGC1_1_7M253 N := by
 unfold onsetHighC1_0_4M253 onsetHighC1_1_3M253 onsetHighC2_0_4M253 onsetHighC2_1_3M253 onsetHighC3_0_4M253 onsetHighC3_1_3M253 onsetHighGC1_1_7M253
 ring

theorem onsetHighGC1_1_7M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_1_7M253 N := by
 unfold onsetHighGC1_1_7M253
 positivity

def onsetHighGC1_2_0M253 (N : ℤ) : ℤ := ((((((((((((396177551917056*N + 43528089300369408)*N + 2191884180466434048)*N + 66849458161629265920)*N + 1374457049139718914048)*N + 20058407610256661151744)*N + 212934523933980836757504)*N + 1655933657440473789235200)*N + 9358605921871647338397696)*N + 37470021610725526311272448)*N + 100847525875873876250984448)*N + 163762559144262825258516480)*N + 121296127783124982752870400)

theorem onsetHighGC1_2_0M253_eq (N : ℤ) : ((onsetHighC2_0_0M253 N*onsetHighC2_2_0M253 N-onsetHighC1_0_0M253 N*onsetHighC3_2_0M253 N) + ((onsetHighC2_1_0M253 N*onsetHighC2_1_0M253 N-onsetHighC1_1_0M253 N*onsetHighC3_1_0M253 N) + (onsetHighC2_2_0M253 N*onsetHighC2_0_0M253 N-onsetHighC1_2_0M253 N*onsetHighC3_0_0M253 N)))=onsetHighGC1_2_0M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_1_0M253 onsetHighC1_2_0M253 onsetHighC2_0_0M253 onsetHighC2_1_0M253 onsetHighC2_2_0M253 onsetHighC3_0_0M253 onsetHighC3_1_0M253 onsetHighC3_2_0M253 onsetHighGC1_2_0M253
 ring

theorem onsetHighGC1_2_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_2_0M253 N := by
 unfold onsetHighGC1_2_0M253
 positivity

def onsetHighGC1_2_1M253 (N : ℤ) : ℤ := ((((((((((((703001429803008*N + 77603392142180352)*N + 3925185382286622720)*N + 120192205514059284480)*N + 2479718732261819940864)*N + 36290876339855321726976)*N + 386112549808876006932480)*N + 3007661890674603212144640)*N + 17017289630113284806934528)*N + 68180462226381012857782272)*N + 183557674894196237244825600)*N + 298070351647564587655495680)*N + 220720860501876760235212800)

theorem onsetHighGC1_2_1M253_eq (N : ℤ) : (((onsetHighC2_0_0M253 N*onsetHighC2_2_1M253 N-onsetHighC1_0_0M253 N*onsetHighC3_2_1M253 N) + ((onsetHighC2_0_1M253 N*onsetHighC2_2_0M253 N-onsetHighC1_0_1M253 N*onsetHighC3_2_0M253 N) + (onsetHighC2_1_0M253 N*onsetHighC2_1_1M253 N-onsetHighC1_1_0M253 N*onsetHighC3_1_1M253 N))) + ((onsetHighC2_1_1M253 N*onsetHighC2_1_0M253 N-onsetHighC1_1_1M253 N*onsetHighC3_1_0M253 N) + ((onsetHighC2_2_0M253 N*onsetHighC2_0_1M253 N-onsetHighC1_2_0M253 N*onsetHighC3_0_1M253 N) + (onsetHighC2_2_1M253 N*onsetHighC2_0_0M253 N-onsetHighC1_2_1M253 N*onsetHighC3_0_0M253 N))))=onsetHighGC1_2_1M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_0_1M253 onsetHighC1_1_0M253 onsetHighC1_1_1M253 onsetHighC1_2_0M253 onsetHighC1_2_1M253 onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighGC1_2_1M253
 ring

theorem onsetHighGC1_2_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_2_1M253 N := by
 unfold onsetHighGC1_2_1M253
 positivity

def onsetHighGC1_2_2M253 (N : ℤ) : ℤ := ((((((((((((515411351175168*N + 57227592553463808)*N + 2910617046859382784)*N + 89573217461788999680)*N + 1856119721016252432384)*N + 27265136095432103952384)*N + 290963543571876462723072)*N + 2271923015070996643184640)*N + 12877960627581599505973248)*N + 51664496513428713224798208)*N + 139218399905750281532473344)*N + 226195161736724832143278080)*N + 167543550741464962773811200)

theorem onsetHighGC1_2_2M253_eq (N : ℤ) : ((((onsetHighC2_0_0M253 N*onsetHighC2_2_2M253 N-onsetHighC1_0_0M253 N*onsetHighC3_2_2M253 N) + (onsetHighC2_0_1M253 N*onsetHighC2_2_1M253 N-onsetHighC1_0_1M253 N*onsetHighC3_2_1M253 N)) + ((onsetHighC2_0_2M253 N*onsetHighC2_2_0M253 N-onsetHighC1_0_2M253 N*onsetHighC3_2_0M253 N) + (onsetHighC2_1_0M253 N*onsetHighC2_1_2M253 N-onsetHighC1_1_0M253 N*onsetHighC3_1_2M253 N))) + (((onsetHighC2_1_1M253 N*onsetHighC2_1_1M253 N-onsetHighC1_1_1M253 N*onsetHighC3_1_1M253 N) + (onsetHighC2_1_2M253 N*onsetHighC2_1_0M253 N-onsetHighC1_1_2M253 N*onsetHighC3_1_0M253 N)) + ((onsetHighC2_2_0M253 N*onsetHighC2_0_2M253 N-onsetHighC1_2_0M253 N*onsetHighC3_0_2M253 N) + ((onsetHighC2_2_1M253 N*onsetHighC2_0_1M253 N-onsetHighC1_2_1M253 N*onsetHighC3_0_1M253 N) + (onsetHighC2_2_2M253 N*onsetHighC2_0_0M253 N-onsetHighC1_2_2M253 N*onsetHighC3_0_0M253 N)))))=onsetHighGC1_2_2M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_0_1M253 onsetHighC1_0_2M253 onsetHighC1_1_0M253 onsetHighC1_1_1M253 onsetHighC1_1_2M253 onsetHighC1_2_0M253 onsetHighC1_2_1M253 onsetHighC1_2_2M253 onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighGC1_2_2M253
 ring

theorem onsetHighGC1_2_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_2_2M253 N := by
 unfold onsetHighGC1_2_2M253
 positivity

def onsetHighGC1_2_3M253 (N : ℤ) : ℤ := ((((((((((((199607766220800*N + 22318813928226816)*N + 1142758167331995648)*N + 35383691957313208320)*N + 737193680706585231360)*N + 10879494104454474498048)*N + 116558620706128395239424)*N + 913069445891120494018560)*N + 5189079893512781263011840)*N + 20860777997464547031515136)*N + 56302313950385581958627328)*N + 91587010617058404146872320)*N + 67898539535639514631372800)

theorem onsetHighGC1_2_3M253_eq (N : ℤ) : ((((onsetHighC2_0_1M253 N*onsetHighC2_2_2M253 N-onsetHighC1_0_1M253 N*onsetHighC3_2_2M253 N) + (onsetHighC2_0_2M253 N*onsetHighC2_2_1M253 N-onsetHighC1_0_2M253 N*onsetHighC3_2_1M253 N)) + ((onsetHighC2_0_3M253 N*onsetHighC2_2_0M253 N-onsetHighC1_0_3M253 N*onsetHighC3_2_0M253 N) + ((onsetHighC2_1_0M253 N*onsetHighC2_1_3M253 N-onsetHighC1_1_0M253 N*onsetHighC3_1_3M253 N) + (onsetHighC2_1_1M253 N*onsetHighC2_1_2M253 N-onsetHighC1_1_1M253 N*onsetHighC3_1_2M253 N)))) + (((onsetHighC2_1_2M253 N*onsetHighC2_1_1M253 N-onsetHighC1_1_2M253 N*onsetHighC3_1_1M253 N) + (onsetHighC2_1_3M253 N*onsetHighC2_1_0M253 N-onsetHighC1_1_3M253 N*onsetHighC3_1_0M253 N)) + ((onsetHighC2_2_0M253 N*onsetHighC2_0_3M253 N-onsetHighC1_2_0M253 N*onsetHighC3_0_3M253 N) + ((onsetHighC2_2_1M253 N*onsetHighC2_0_2M253 N-onsetHighC1_2_1M253 N*onsetHighC3_0_2M253 N) + (onsetHighC2_2_2M253 N*onsetHighC2_0_1M253 N-onsetHighC1_2_2M253 N*onsetHighC3_0_1M253 N)))))=onsetHighGC1_2_3M253 N := by
 unfold onsetHighC1_0_1M253 onsetHighC1_0_2M253 onsetHighC1_0_3M253 onsetHighC1_1_0M253 onsetHighC1_1_1M253 onsetHighC1_1_2M253 onsetHighC1_1_3M253 onsetHighC1_2_0M253 onsetHighC1_2_1M253 onsetHighC1_2_2M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighGC1_2_3M253
 ring

theorem onsetHighGC1_2_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_2_3M253 N := by
 unfold onsetHighGC1_2_3M253
 positivity

def onsetHighGC1_2_4M253 (N : ℤ) : ℤ := ((((((((((((43032992808960*N + 4851480762777600)*N + 250374181688967168)*N + 7809105702294650880)*N + 163761187844653056000)*N + 2430614327618552463360)*N + 26168684373774113439744)*N + 205847415135712334315520)*N + 1173926377766272830013440)*N + 4732922544410326927933440)*N + 12804081314285621543436288)*N + 20868366034766285792870400)*N + 15494896009469817697075200)

theorem onsetHighGC1_2_4M253_eq (N : ℤ) : ((((onsetHighC2_0_2M253 N*onsetHighC2_2_2M253 N-onsetHighC1_0_2M253 N*onsetHighC3_2_2M253 N) + (onsetHighC2_0_3M253 N*onsetHighC2_2_1M253 N-onsetHighC1_0_3M253 N*onsetHighC3_2_1M253 N)) + ((onsetHighC2_0_4M253 N*onsetHighC2_2_0M253 N-onsetHighC1_0_4M253 N*onsetHighC3_2_0M253 N) + (onsetHighC2_1_1M253 N*onsetHighC2_1_3M253 N-onsetHighC1_1_1M253 N*onsetHighC3_1_3M253 N))) + (((onsetHighC2_1_2M253 N*onsetHighC2_1_2M253 N-onsetHighC1_1_2M253 N*onsetHighC3_1_2M253 N) + (onsetHighC2_1_3M253 N*onsetHighC2_1_1M253 N-onsetHighC1_1_3M253 N*onsetHighC3_1_1M253 N)) + ((onsetHighC2_2_0M253 N*onsetHighC2_0_4M253 N-onsetHighC1_2_0M253 N*onsetHighC3_0_4M253 N) + ((onsetHighC2_2_1M253 N*onsetHighC2_0_3M253 N-onsetHighC1_2_1M253 N*onsetHighC3_0_3M253 N) + (onsetHighC2_2_2M253 N*onsetHighC2_0_2M253 N-onsetHighC1_2_2M253 N*onsetHighC3_0_2M253 N)))))=onsetHighGC1_2_4M253 N := by
 unfold onsetHighC1_0_2M253 onsetHighC1_0_3M253 onsetHighC1_0_4M253 onsetHighC1_1_1M253 onsetHighC1_1_2M253 onsetHighC1_1_3M253 onsetHighC1_2_0M253 onsetHighC1_2_1M253 onsetHighC1_2_2M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighGC1_2_4M253
 ring

theorem onsetHighGC1_2_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_2_4M253 N := by
 unfold onsetHighGC1_2_4M253
 positivity

def onsetHighGC1_2_5M253 (N : ℤ) : ℤ := ((((((((((((4894274617344*N + 557043601637376)*N + 29012271405465600)*N + 912610843856732160)*N + 19285595229008166912)*N + 288202183479234920448)*N + 3121393831888205905920)*N + 24680062801204488437760)*N + 141369674145807093202944)*N + 572104450710358223486976)*N + 1552662278507282725601280)*N + 2537386565470518462382080)*N + 1888322912609308626124800)

theorem onsetHighGC1_2_5M253_eq (N : ℤ) : (((onsetHighC2_0_3M253 N*onsetHighC2_2_2M253 N-onsetHighC1_0_3M253 N*onsetHighC3_2_2M253 N) + ((onsetHighC2_0_4M253 N*onsetHighC2_2_1M253 N-onsetHighC1_0_4M253 N*onsetHighC3_2_1M253 N) + (onsetHighC2_1_2M253 N*onsetHighC2_1_3M253 N-onsetHighC1_1_2M253 N*onsetHighC3_1_3M253 N))) + ((onsetHighC2_1_3M253 N*onsetHighC2_1_2M253 N-onsetHighC1_1_3M253 N*onsetHighC3_1_2M253 N) + ((onsetHighC2_2_1M253 N*onsetHighC2_0_4M253 N-onsetHighC1_2_1M253 N*onsetHighC3_0_4M253 N) + (onsetHighC2_2_2M253 N*onsetHighC2_0_3M253 N-onsetHighC1_2_2M253 N*onsetHighC3_0_3M253 N))))=onsetHighGC1_2_5M253 N := by
 unfold onsetHighC1_0_3M253 onsetHighC1_0_4M253 onsetHighC1_1_2M253 onsetHighC1_1_3M253 onsetHighC1_2_1M253 onsetHighC1_2_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighGC1_2_5M253
 ring

theorem onsetHighGC1_2_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_2_5M253 N := by
 unfold onsetHighGC1_2_5M253
 positivity

def onsetHighGC1_2_6M253 (N : ℤ) : ℤ := ((((((((((((229361319936*N + 26387649921024)*N + 1388755575373824)*N + 44113167038545920)*N + 940551518036164608)*N + 14168149011235602432)*N + 154537081478402015232)*N + 1229482136551387299840)*N + 7080749134123191238656)*N + 28789643816746503634944)*N + 78451917463797412921344)*N + 128659470256872609546240)*N + 96040953820426980556800)

theorem onsetHighGC1_2_6M253_eq (N : ℤ) : ((onsetHighC2_0_4M253 N*onsetHighC2_2_2M253 N-onsetHighC1_0_4M253 N*onsetHighC3_2_2M253 N) + ((onsetHighC2_1_3M253 N*onsetHighC2_1_3M253 N-onsetHighC1_1_3M253 N*onsetHighC3_1_3M253 N) + (onsetHighC2_2_2M253 N*onsetHighC2_0_4M253 N-onsetHighC1_2_2M253 N*onsetHighC3_0_4M253 N)))=onsetHighGC1_2_6M253 N := by
 unfold onsetHighC1_0_4M253 onsetHighC1_1_3M253 onsetHighC1_2_2M253 onsetHighC2_0_4M253 onsetHighC2_1_3M253 onsetHighC2_2_2M253 onsetHighC3_0_4M253 onsetHighC3_1_3M253 onsetHighC3_2_2M253 onsetHighGC1_2_6M253
 ring

theorem onsetHighGC1_2_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_2_6M253 N := by
 unfold onsetHighGC1_2_6M253
 positivity

def onsetHighGC1_3_0M253 (N : ℤ) : ℤ := ((((((((((((468667619868672*N + 51216779103436800)*N + 2564725545627549696)*N + 77757494057049784320)*N + 1588537690482536349696)*N + 23023546633307679621120)*N + 242618919658054785957888)*N + 1872135953846391778836480)*N + 10494535032259266616492032)*N + 41664799058486461810606080)*N + 111172222657427184147234816)*N + 178954034317380124095283200)*N + 131388717328703060941209600)

theorem onsetHighGC1_3_0M253_eq (N : ℤ) : (((onsetHighC2_0_0M253 N*onsetHighC2_3_0M253 N-onsetHighC1_0_0M253 N*onsetHighC3_3_0M253 N) + (onsetHighC2_1_0M253 N*onsetHighC2_2_0M253 N-onsetHighC1_1_0M253 N*onsetHighC3_2_0M253 N)) + ((onsetHighC2_2_0M253 N*onsetHighC2_1_0M253 N-onsetHighC1_2_0M253 N*onsetHighC3_1_0M253 N) + (onsetHighC2_3_0M253 N*onsetHighC2_0_0M253 N-onsetHighC1_3_0M253 N*onsetHighC3_0_0M253 N)))=onsetHighGC1_3_0M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_1_0M253 onsetHighC1_2_0M253 onsetHighC1_3_0M253 onsetHighC2_0_0M253 onsetHighC2_1_0M253 onsetHighC2_2_0M253 onsetHighC2_3_0M253 onsetHighC3_0_0M253 onsetHighC3_1_0M253 onsetHighC3_2_0M253 onsetHighC3_3_0M253 onsetHighGC1_3_0M253
 ring

theorem onsetHighGC1_3_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_3_0M253 N := by
 unfold onsetHighGC1_3_0M253
 positivity

def onsetHighGC1_3_1M253 (N : ℤ) : ℤ := ((((((((((((687215134900224*N + 75509292639191040)*N + 3800737279345950720)*N + 115769932506652999680)*N + 2374740715297541455872)*N + 34536310599185753702400)*N + 364952151759998901288960)*N + 2822249079249992291450880)*N + 15846454387212303942549504)*N + 62985833418645252404674560)*N + 168189650183029641046917120)*N + 270850183977546713860669440)*N + 198890834494152951830937600)

theorem onsetHighGC1_3_1M253_eq (N : ℤ) : ((((onsetHighC2_0_0M253 N*onsetHighC2_3_1M253 N-onsetHighC1_0_0M253 N*onsetHighC3_3_1M253 N) + (onsetHighC2_0_1M253 N*onsetHighC2_3_0M253 N-onsetHighC1_0_1M253 N*onsetHighC3_3_0M253 N)) + ((onsetHighC2_1_0M253 N*onsetHighC2_2_1M253 N-onsetHighC1_1_0M253 N*onsetHighC3_2_1M253 N) + (onsetHighC2_1_1M253 N*onsetHighC2_2_0M253 N-onsetHighC1_1_1M253 N*onsetHighC3_2_0M253 N))) + (((onsetHighC2_2_0M253 N*onsetHighC2_1_1M253 N-onsetHighC1_2_0M253 N*onsetHighC3_1_1M253 N) + (onsetHighC2_2_1M253 N*onsetHighC2_1_0M253 N-onsetHighC1_2_1M253 N*onsetHighC3_1_0M253 N)) + ((onsetHighC2_3_0M253 N*onsetHighC2_0_1M253 N-onsetHighC1_3_0M253 N*onsetHighC3_0_1M253 N) + (onsetHighC2_3_1M253 N*onsetHighC2_0_0M253 N-onsetHighC1_3_1M253 N*onsetHighC3_0_0M253 N))))=onsetHighGC1_3_1M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_0_1M253 onsetHighC1_1_0M253 onsetHighC1_1_1M253 onsetHighC1_2_0M253 onsetHighC1_2_1M253 onsetHighC1_3_0M253 onsetHighC1_3_1M253 onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighGC1_3_1M253
 ring

theorem onsetHighGC1_3_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_3_1M253 N := by
 unfold onsetHighGC1_3_1M253
 positivity

def onsetHighGC1_3_2M253 (N : ℤ) : ℤ := ((((((((((((399215532441600*N + 44154184928329728)*N + 2236464767642370048)*N + 68513508465007656960)*N + 1412514018719076188160)*N + 20631922542054519865344)*N + 218817643711806427889664)*N + 1697223139360767643484160)*N + 9552453039273266475171840)*N + 38039808070866022566985728)*N + 101721600113733941317337088)*N + 163983059707039805897441280)*N + 120505781703792632581324800)

theorem onsetHighGC1_3_2M253_eq (N : ℤ) : ((((onsetHighC2_0_1M253 N*onsetHighC2_3_1M253 N-onsetHighC1_0_1M253 N*onsetHighC3_3_1M253 N) + (onsetHighC2_0_2M253 N*onsetHighC2_3_0M253 N-onsetHighC1_0_2M253 N*onsetHighC3_3_0M253 N)) + ((onsetHighC2_1_0M253 N*onsetHighC2_2_2M253 N-onsetHighC1_1_0M253 N*onsetHighC3_2_2M253 N) + ((onsetHighC2_1_1M253 N*onsetHighC2_2_1M253 N-onsetHighC1_1_1M253 N*onsetHighC3_2_1M253 N) + (onsetHighC2_1_2M253 N*onsetHighC2_2_0M253 N-onsetHighC1_1_2M253 N*onsetHighC3_2_0M253 N)))) + (((onsetHighC2_2_0M253 N*onsetHighC2_1_2M253 N-onsetHighC1_2_0M253 N*onsetHighC3_1_2M253 N) + (onsetHighC2_2_1M253 N*onsetHighC2_1_1M253 N-onsetHighC1_2_1M253 N*onsetHighC3_1_1M253 N)) + ((onsetHighC2_2_2M253 N*onsetHighC2_1_0M253 N-onsetHighC1_2_2M253 N*onsetHighC3_1_0M253 N) + ((onsetHighC2_3_0M253 N*onsetHighC2_0_2M253 N-onsetHighC1_3_0M253 N*onsetHighC3_0_2M253 N) + (onsetHighC2_3_1M253 N*onsetHighC2_0_1M253 N-onsetHighC1_3_1M253 N*onsetHighC3_0_1M253 N)))))=onsetHighGC1_3_2M253 N := by
 unfold onsetHighC1_0_1M253 onsetHighC1_0_2M253 onsetHighC1_1_0M253 onsetHighC1_1_1M253 onsetHighC1_1_2M253 onsetHighC1_2_0M253 onsetHighC1_2_1M253 onsetHighC1_2_2M253 onsetHighC1_3_0M253 onsetHighC1_3_1M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighGC1_3_2M253
 ring

theorem onsetHighGC1_3_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_3_2M253 N := by
 unfold onsetHighGC1_3_2M253
 positivity

def onsetHighGC1_3_3M253 (N : ℤ) : ℤ := ((((((((((((114754647490560*N + 12791258850263040)*N + 652736122840940544)*N + 20133885548345425920)*N + 417641131034353336320)*N + 6132998588724318044160)*N + 65344225084729932644352)*N + 508798026884105203875840)*N + 2872910738593353427845120)*N + 11470923087296243171328000)*N + 30740556590322010086703104)*N + 49642558548298774547005440)*N + 36531573334789328732160000)

theorem onsetHighGC1_3_3M253_eq (N : ℤ) : ((((onsetHighC2_0_2M253 N*onsetHighC2_3_1M253 N-onsetHighC1_0_2M253 N*onsetHighC3_3_1M253 N) + (onsetHighC2_0_3M253 N*onsetHighC2_3_0M253 N-onsetHighC1_0_3M253 N*onsetHighC3_3_0M253 N)) + ((onsetHighC2_1_1M253 N*onsetHighC2_2_2M253 N-onsetHighC1_1_1M253 N*onsetHighC3_2_2M253 N) + ((onsetHighC2_1_2M253 N*onsetHighC2_2_1M253 N-onsetHighC1_1_2M253 N*onsetHighC3_2_1M253 N) + (onsetHighC2_1_3M253 N*onsetHighC2_2_0M253 N-onsetHighC1_1_3M253 N*onsetHighC3_2_0M253 N)))) + (((onsetHighC2_2_0M253 N*onsetHighC2_1_3M253 N-onsetHighC1_2_0M253 N*onsetHighC3_1_3M253 N) + (onsetHighC2_2_1M253 N*onsetHighC2_1_2M253 N-onsetHighC1_2_1M253 N*onsetHighC3_1_2M253 N)) + ((onsetHighC2_2_2M253 N*onsetHighC2_1_1M253 N-onsetHighC1_2_2M253 N*onsetHighC3_1_1M253 N) + ((onsetHighC2_3_0M253 N*onsetHighC2_0_3M253 N-onsetHighC1_3_0M253 N*onsetHighC3_0_3M253 N) + (onsetHighC2_3_1M253 N*onsetHighC2_0_2M253 N-onsetHighC1_3_1M253 N*onsetHighC3_0_2M253 N)))))=onsetHighGC1_3_3M253 N := by
 unfold onsetHighC1_0_2M253 onsetHighC1_0_3M253 onsetHighC1_1_1M253 onsetHighC1_1_2M253 onsetHighC1_1_3M253 onsetHighC1_2_0M253 onsetHighC1_2_1M253 onsetHighC1_2_2M253 onsetHighC1_3_0M253 onsetHighC1_3_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighGC1_3_3M253
 ring

theorem onsetHighGC1_3_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_3_3M253 N := by
 unfold onsetHighGC1_3_3M253
 positivity

def onsetHighGC1_3_4M253 (N : ℤ) : ℤ := ((((((((((((16314248724480*N + 1834959262187520)*N + 94453049988218880)*N + 2936936555064852480)*N + 61364671302346997760)*N + 906930716264733081600)*N + 9717130917316090920960)*N + 76027581382061709066240)*N + 431060828037270428712960)*N + 1727170569719300310958080)*N + 4642300493918025296117760)*N + 7515497898115849393274880)*N + 5542206362837675016192000)

theorem onsetHighGC1_3_4M253_eq (N : ℤ) : ((((onsetHighC2_0_3M253 N*onsetHighC2_3_1M253 N-onsetHighC1_0_3M253 N*onsetHighC3_3_1M253 N) + (onsetHighC2_0_4M253 N*onsetHighC2_3_0M253 N-onsetHighC1_0_4M253 N*onsetHighC3_3_0M253 N)) + ((onsetHighC2_1_2M253 N*onsetHighC2_2_2M253 N-onsetHighC1_1_2M253 N*onsetHighC3_2_2M253 N) + (onsetHighC2_1_3M253 N*onsetHighC2_2_1M253 N-onsetHighC1_1_3M253 N*onsetHighC3_2_1M253 N))) + (((onsetHighC2_2_1M253 N*onsetHighC2_1_3M253 N-onsetHighC1_2_1M253 N*onsetHighC3_1_3M253 N) + (onsetHighC2_2_2M253 N*onsetHighC2_1_2M253 N-onsetHighC1_2_2M253 N*onsetHighC3_1_2M253 N)) + ((onsetHighC2_3_0M253 N*onsetHighC2_0_4M253 N-onsetHighC1_3_0M253 N*onsetHighC3_0_4M253 N) + (onsetHighC2_3_1M253 N*onsetHighC2_0_3M253 N-onsetHighC1_3_1M253 N*onsetHighC3_0_3M253 N))))=onsetHighGC1_3_4M253 N := by
 unfold onsetHighC1_0_3M253 onsetHighC1_0_4M253 onsetHighC1_1_2M253 onsetHighC1_1_3M253 onsetHighC1_2_1M253 onsetHighC1_2_2M253 onsetHighC1_3_0M253 onsetHighC1_3_1M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighGC1_3_4M253
 ring

theorem onsetHighGC1_3_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_3_4M253 N := by
 unfold onsetHighGC1_3_4M253
 positivity

def onsetHighGC1_3_5M253 (N : ℤ) : ℤ := ((((((((((((917445279744*N + 104255818039296)*N + 5419991901929472)*N + 170097089760460800)*N + 3584102377709371392)*N + 53371649527495262208)*N + 575662830158081949696)*N + 4530391411533482557440)*N + 25817201692970544267264)*N + 103900616958418612125696)*N + 280330097137788420882432)*N + 455326498655572076789760)*N + 336731372475767429529600)

theorem onsetHighGC1_3_5M253_eq (N : ℤ) : (((onsetHighC2_0_4M253 N*onsetHighC2_3_1M253 N-onsetHighC1_0_4M253 N*onsetHighC3_3_1M253 N) + (onsetHighC2_1_3M253 N*onsetHighC2_2_2M253 N-onsetHighC1_1_3M253 N*onsetHighC3_2_2M253 N)) + ((onsetHighC2_2_2M253 N*onsetHighC2_1_3M253 N-onsetHighC1_2_2M253 N*onsetHighC3_1_3M253 N) + (onsetHighC2_3_1M253 N*onsetHighC2_0_4M253 N-onsetHighC1_3_1M253 N*onsetHighC3_0_4M253 N)))=onsetHighGC1_3_5M253 N := by
 unfold onsetHighC1_0_4M253 onsetHighC1_1_3M253 onsetHighC1_2_2M253 onsetHighC1_3_1M253 onsetHighC2_0_4M253 onsetHighC2_1_3M253 onsetHighC2_2_2M253 onsetHighC2_3_1M253 onsetHighC3_0_4M253 onsetHighC3_1_3M253 onsetHighC3_2_2M253 onsetHighC3_3_1M253 onsetHighGC1_3_5M253
 ring

theorem onsetHighGC1_3_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_3_5M253 N := by
 unfold onsetHighGC1_3_5M253
 positivity

def onsetHighGC1_4_0M253 (N : ℤ) : ℤ := ((((((((((((343607567450112*N + 37357564270215168)*N + 1860761384367685632)*N + 56093886771143639040)*N + 1138928118486653730816)*N + 16397884286087561478144)*N + 171576046689133743046656)*N + 1314032917234732498944000)*N + 7308325862701871684124672)*N + 28780040245726454206169088)*N + 76155574074422240961626112)*N + 121557264525134519347445760)*N + 88494685996367181171916800)

theorem onsetHighGC1_4_0M253_eq (N : ℤ) : (((onsetHighC2_0_0M253 N*onsetHighC2_4_0M253 N-onsetHighC1_0_0M253 N*onsetHighC3_4_0M253 N) + (onsetHighC2_1_0M253 N*onsetHighC2_3_0M253 N-onsetHighC1_1_0M253 N*onsetHighC3_3_0M253 N)) + ((onsetHighC2_2_0M253 N*onsetHighC2_2_0M253 N-onsetHighC1_2_0M253 N*onsetHighC3_2_0M253 N) + ((onsetHighC2_3_0M253 N*onsetHighC2_1_0M253 N-onsetHighC1_3_0M253 N*onsetHighC3_1_0M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_0_0M253 N-onsetHighC1_4_0M253 N*onsetHighC3_0_0M253 N))))=onsetHighGC1_4_0M253 N := by
 unfold onsetHighC1_0_0M253 onsetHighC1_1_0M253 onsetHighC1_2_0M253 onsetHighC1_3_0M253 onsetHighC1_4_0M253 onsetHighC2_0_0M253 onsetHighC2_1_0M253 onsetHighC2_2_0M253 onsetHighC2_3_0M253 onsetHighC2_4_0M253 onsetHighC3_0_0M253 onsetHighC3_1_0M253 onsetHighC3_2_0M253 onsetHighC3_3_0M253 onsetHighC3_4_0M253 onsetHighGC1_4_0M253
 ring

theorem onsetHighGC1_4_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_4_0M253 N := by
 unfold onsetHighGC1_4_0M253
 positivity

def onsetHighGC1_4_1M253 (N : ℤ) : ℤ := ((((((((((((399215532441600*N + 43670742000205824)*N + 2187969356372115456)*N + 66310182326627205120)*N + 1352697575188243415040)*N + 19554188955653014290432)*N + 205290200589389159989248)*N + 1576547996508687874129920)*N + 8787468676469136461660160)*N + 34663088023266471752761344)*N + 91838131040452673531805696)*N + 146721263267682726979829760)*N + 106879312351242024910848000)

theorem onsetHighGC1_4_1M253_eq (N : ℤ) : ((((onsetHighC2_0_1M253 N*onsetHighC2_4_0M253 N-onsetHighC1_0_1M253 N*onsetHighC3_4_0M253 N) + (onsetHighC2_1_0M253 N*onsetHighC2_3_1M253 N-onsetHighC1_1_0M253 N*onsetHighC3_3_1M253 N)) + ((onsetHighC2_1_1M253 N*onsetHighC2_3_0M253 N-onsetHighC1_1_1M253 N*onsetHighC3_3_0M253 N) + (onsetHighC2_2_0M253 N*onsetHighC2_2_1M253 N-onsetHighC1_2_0M253 N*onsetHighC3_2_1M253 N))) + (((onsetHighC2_2_1M253 N*onsetHighC2_2_0M253 N-onsetHighC1_2_1M253 N*onsetHighC3_2_0M253 N) + (onsetHighC2_3_0M253 N*onsetHighC2_1_1M253 N-onsetHighC1_3_0M253 N*onsetHighC3_1_1M253 N)) + ((onsetHighC2_3_1M253 N*onsetHighC2_1_0M253 N-onsetHighC1_3_1M253 N*onsetHighC3_1_0M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_0_1M253 N-onsetHighC1_4_0M253 N*onsetHighC3_0_1M253 N))))=onsetHighGC1_4_1M253 N := by
 unfold onsetHighC1_0_1M253 onsetHighC1_1_0M253 onsetHighC1_1_1M253 onsetHighC1_2_0M253 onsetHighC1_2_1M253 onsetHighC1_3_0M253 onsetHighC1_3_1M253 onsetHighC1_4_0M253 onsetHighC2_0_1M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_0_1M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighGC1_4_1M253
 ring

theorem onsetHighGC1_4_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_4_1M253 N := by
 unfold onsetHighGC1_4_1M253
 positivity

def onsetHighGC1_4_2M253 (N : ℤ) : ℤ := ((((((((((((172131971235840*N + 18967853499678720)*N + 956977430315139072)*N + 29189515808813875200)*N + 598870364226217574400)*N + 8700383782583811440640)*N + 91731756850003612532736)*N + 706997182262246406881280)*N + 3952455191175925239644160)*N + 15628879130540351988695040)*N + 41489430447672053980987392)*N + 66387830564339738235371520)*N + 48420145703942025353625600)

theorem onsetHighGC1_4_2M253_eq (N : ℤ) : ((((onsetHighC2_0_2M253 N*onsetHighC2_4_0M253 N-onsetHighC1_0_2M253 N*onsetHighC3_4_0M253 N) + (onsetHighC2_1_1M253 N*onsetHighC2_3_1M253 N-onsetHighC1_1_1M253 N*onsetHighC3_3_1M253 N)) + ((onsetHighC2_1_2M253 N*onsetHighC2_3_0M253 N-onsetHighC1_1_2M253 N*onsetHighC3_3_0M253 N) + (onsetHighC2_2_0M253 N*onsetHighC2_2_2M253 N-onsetHighC1_2_0M253 N*onsetHighC3_2_2M253 N))) + (((onsetHighC2_2_1M253 N*onsetHighC2_2_1M253 N-onsetHighC1_2_1M253 N*onsetHighC3_2_1M253 N) + (onsetHighC2_2_2M253 N*onsetHighC2_2_0M253 N-onsetHighC1_2_2M253 N*onsetHighC3_2_0M253 N)) + ((onsetHighC2_3_0M253 N*onsetHighC2_1_2M253 N-onsetHighC1_3_0M253 N*onsetHighC3_1_2M253 N) + ((onsetHighC2_3_1M253 N*onsetHighC2_1_1M253 N-onsetHighC1_3_1M253 N*onsetHighC3_1_1M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_0_2M253 N-onsetHighC1_4_0M253 N*onsetHighC3_0_2M253 N)))))=onsetHighGC1_4_2M253 N := by
 unfold onsetHighC1_0_2M253 onsetHighC1_1_1M253 onsetHighC1_1_2M253 onsetHighC1_2_0M253 onsetHighC1_2_1M253 onsetHighC1_2_2M253 onsetHighC1_3_0M253 onsetHighC1_3_1M253 onsetHighC1_4_0M253 onsetHighC2_0_2M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_0_2M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighGC1_4_2M253
 ring

theorem onsetHighGC1_4_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_4_2M253 N := by
 unfold onsetHighGC1_4_2M253
 positivity

def onsetHighGC1_4_3M253 (N : ℤ) : ℤ := ((((((((((((32628497448960*N + 3626213037834240)*N + 184453250773155840)*N + 5668843046767165440)*N + 117100271833416990720)*N + 1711497452101608407040)*N + 18139757946224152412160)*N + 140438302742974971248640)*N + 788137779957537775288320)*N + 3126610794843390942904320)*N + 8322819355195796776550400)*N + 13347999443149074538168320)*N + 9754068490900010119987200)

theorem onsetHighGC1_4_3M253_eq (N : ℤ) : ((((onsetHighC2_0_3M253 N*onsetHighC2_4_0M253 N-onsetHighC1_0_3M253 N*onsetHighC3_4_0M253 N) + (onsetHighC2_1_2M253 N*onsetHighC2_3_1M253 N-onsetHighC1_1_2M253 N*onsetHighC3_3_1M253 N)) + ((onsetHighC2_1_3M253 N*onsetHighC2_3_0M253 N-onsetHighC1_1_3M253 N*onsetHighC3_3_0M253 N) + (onsetHighC2_2_1M253 N*onsetHighC2_2_2M253 N-onsetHighC1_2_1M253 N*onsetHighC3_2_2M253 N))) + (((onsetHighC2_2_2M253 N*onsetHighC2_2_1M253 N-onsetHighC1_2_2M253 N*onsetHighC3_2_1M253 N) + (onsetHighC2_3_0M253 N*onsetHighC2_1_3M253 N-onsetHighC1_3_0M253 N*onsetHighC3_1_3M253 N)) + ((onsetHighC2_3_1M253 N*onsetHighC2_1_2M253 N-onsetHighC1_3_1M253 N*onsetHighC3_1_2M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_0_3M253 N-onsetHighC1_4_0M253 N*onsetHighC3_0_3M253 N))))=onsetHighGC1_4_3M253 N := by
 unfold onsetHighC1_0_3M253 onsetHighC1_1_2M253 onsetHighC1_1_3M253 onsetHighC1_2_1M253 onsetHighC1_2_2M253 onsetHighC1_3_0M253 onsetHighC1_3_1M253 onsetHighC1_4_0M253 onsetHighC2_0_3M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_0_3M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighGC1_4_3M253
 ring

theorem onsetHighGC1_4_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_4_3M253 N := by
 unfold onsetHighGC1_4_3M253
 positivity

def onsetHighGC1_4_4M253 (N : ℤ) : ℤ := ((((((((((((2293613199360*N + 257402590986240)*N + 13216829795205120)*N + 409764541287628800)*N + 8531978739221790720)*N + 125588882175893176320)*N + 1339448886122722099200)*N + 10426969891729267752960)*N + 58795028827680245022720)*N + 234206749803015296778240)*N + 625659271733255319060480)*N + 1006496697777073988567040)*N + 737442175143801441484800)

theorem onsetHighGC1_4_4M253_eq (N : ℤ) : (((onsetHighC2_0_4M253 N*onsetHighC2_4_0M253 N-onsetHighC1_0_4M253 N*onsetHighC3_4_0M253 N) + (onsetHighC2_1_3M253 N*onsetHighC2_3_1M253 N-onsetHighC1_1_3M253 N*onsetHighC3_3_1M253 N)) + ((onsetHighC2_2_2M253 N*onsetHighC2_2_2M253 N-onsetHighC1_2_2M253 N*onsetHighC3_2_2M253 N) + ((onsetHighC2_3_1M253 N*onsetHighC2_1_3M253 N-onsetHighC1_3_1M253 N*onsetHighC3_1_3M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_0_4M253 N-onsetHighC1_4_0M253 N*onsetHighC3_0_4M253 N))))=onsetHighGC1_4_4M253 N := by
 unfold onsetHighC1_0_4M253 onsetHighC1_1_3M253 onsetHighC1_2_2M253 onsetHighC1_3_1M253 onsetHighC1_4_0M253 onsetHighC2_0_4M253 onsetHighC2_1_3M253 onsetHighC2_2_2M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_0_4M253 onsetHighC3_1_3M253 onsetHighC3_2_2M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighGC1_4_4M253
 ring

theorem onsetHighGC1_4_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_4_4M253 N := by
 unfold onsetHighGC1_4_4M253
 positivity

def onsetHighGC1_5_0M253 (N : ℤ) : ℤ := ((((((((((((159686212976640*N + 17274919628832768)*N + 856012040341291008)*N + 25662718853775360000)*N + 517955657771683676160)*N + 7409620744102565904384)*N + 76999674417192363884544)*N + 585457444087554008678400)*N + 3231645085427611100774400)*N + 12627105493344531511246848)*N + 33146835418335962147586048)*N + 52480990945633294614528000)*N + 37896860714012761286246400)

theorem onsetHighGC1_5_0M253_eq (N : ℤ) : (((onsetHighC2_1_0M253 N*onsetHighC2_4_0M253 N-onsetHighC1_1_0M253 N*onsetHighC3_4_0M253 N) + (onsetHighC2_2_0M253 N*onsetHighC2_3_0M253 N-onsetHighC1_2_0M253 N*onsetHighC3_3_0M253 N)) + ((onsetHighC2_3_0M253 N*onsetHighC2_2_0M253 N-onsetHighC1_3_0M253 N*onsetHighC3_2_0M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_1_0M253 N-onsetHighC1_4_0M253 N*onsetHighC3_1_0M253 N)))=onsetHighGC1_5_0M253 N := by
 unfold onsetHighC1_1_0M253 onsetHighC1_2_0M253 onsetHighC1_3_0M253 onsetHighC1_4_0M253 onsetHighC2_1_0M253 onsetHighC2_2_0M253 onsetHighC2_3_0M253 onsetHighC2_4_0M253 onsetHighC3_1_0M253 onsetHighC3_2_0M253 onsetHighC3_3_0M253 onsetHighC3_4_0M253 onsetHighGC1_5_0M253
 ring

theorem onsetHighGC1_5_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_5_0M253 N := by
 unfold onsetHighGC1_5_0M253
 positivity

def onsetHighGC1_5_1M253 (N : ℤ) : ℤ := ((((((((((((137705576988672*N + 14999054979170304)*N + 748093171933642752)*N + 22561742815808716800)*N + 457796870089092366336)*N + 6579391700976493658112)*N + 68642398067319789060096)*N + 523643043372550355681280)*N + 2898334630814946837921792)*N + 11349873435799554971664384)*N + 29846873542390732032049152)*N + 47322148290444974484357120)*N + 34208547565628065893580800)

theorem onsetHighGC1_5_1M253_eq (N : ℤ) : (((onsetHighC2_1_1M253 N*onsetHighC2_4_0M253 N-onsetHighC1_1_1M253 N*onsetHighC3_4_0M253 N) + ((onsetHighC2_2_0M253 N*onsetHighC2_3_1M253 N-onsetHighC1_2_0M253 N*onsetHighC3_3_1M253 N) + (onsetHighC2_2_1M253 N*onsetHighC2_3_0M253 N-onsetHighC1_2_1M253 N*onsetHighC3_3_0M253 N))) + ((onsetHighC2_3_0M253 N*onsetHighC2_2_1M253 N-onsetHighC1_3_0M253 N*onsetHighC3_2_1M253 N) + ((onsetHighC2_3_1M253 N*onsetHighC2_2_0M253 N-onsetHighC1_3_1M253 N*onsetHighC3_2_0M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_1_1M253 N-onsetHighC1_4_0M253 N*onsetHighC3_1_1M253 N))))=onsetHighGC1_5_1M253 N := by
 unfold onsetHighC1_1_1M253 onsetHighC1_2_0M253 onsetHighC1_2_1M253 onsetHighC1_3_0M253 onsetHighC1_3_1M253 onsetHighC1_4_0M253 onsetHighC2_1_1M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_1_1M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighGC1_5_1M253
 ring

theorem onsetHighGC1_5_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_5_1M253 N := by
 unfold onsetHighGC1_5_1M253
 positivity

def onsetHighGC1_5_2M253 (N : ℤ) : ℤ := ((((((((((((39154196938752*N + 4299009061552128)*N + 216067914111909888)*N + 6562695946331750400)*N + 134013452744524824576)*N + 1936870797193714335744)*N + 20306078261136687366144)*N + 155556074990221991608320)*N + 864062008181650643484672)*N + 3393824181379704740118528)*N + 8947200389936362939219968)*N + 14215448977847039903662080)*N + 10294004278736939542118400)

theorem onsetHighGC1_5_2M253_eq (N : ℤ) : (((onsetHighC2_1_2M253 N*onsetHighC2_4_0M253 N-onsetHighC1_1_2M253 N*onsetHighC3_4_0M253 N) + ((onsetHighC2_2_1M253 N*onsetHighC2_3_1M253 N-onsetHighC1_2_1M253 N*onsetHighC3_3_1M253 N) + (onsetHighC2_2_2M253 N*onsetHighC2_3_0M253 N-onsetHighC1_2_2M253 N*onsetHighC3_3_0M253 N))) + ((onsetHighC2_3_0M253 N*onsetHighC2_2_2M253 N-onsetHighC1_3_0M253 N*onsetHighC3_2_2M253 N) + ((onsetHighC2_3_1M253 N*onsetHighC2_2_1M253 N-onsetHighC1_3_1M253 N*onsetHighC3_2_1M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_1_2M253 N-onsetHighC1_4_0M253 N*onsetHighC3_1_2M253 N))))=onsetHighGC1_5_2M253 N := by
 unfold onsetHighC1_1_2M253 onsetHighC1_2_1M253 onsetHighC1_2_2M253 onsetHighC1_3_0M253 onsetHighC1_3_1M253 onsetHighC1_4_0M253 onsetHighC2_1_2M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_1_2M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighGC1_5_2M253
 ring

theorem onsetHighGC1_5_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_5_2M253 N := by
 unfold onsetHighGC1_5_2M253
 positivity

def onsetHighGC1_5_3M253 (N : ℤ) : ℤ := ((((((((((((3669781118976*N + 406665018998784)*N + 20620969399812096)*N + 631506155801149440)*N + 12992346235871428608)*N + 189030610765571162112)*N + 1993446206016237600768)*N + 15349283971951692349440)*N + 85639291794618964770816)*N + 337660667930045898031104)*N + 893118524145909299675136)*N + 1423022322241254425886720)*N + 1032979697684587531468800)

theorem onsetHighGC1_5_3M253_eq (N : ℤ) : (((onsetHighC2_1_3M253 N*onsetHighC2_4_0M253 N-onsetHighC1_1_3M253 N*onsetHighC3_4_0M253 N) + (onsetHighC2_2_2M253 N*onsetHighC2_3_1M253 N-onsetHighC1_2_2M253 N*onsetHighC3_3_1M253 N)) + ((onsetHighC2_3_1M253 N*onsetHighC2_2_2M253 N-onsetHighC1_3_1M253 N*onsetHighC3_2_2M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_1_3M253 N-onsetHighC1_4_0M253 N*onsetHighC3_1_3M253 N)))=onsetHighGC1_5_3M253 N := by
 unfold onsetHighC1_1_3M253 onsetHighC1_2_2M253 onsetHighC1_3_1M253 onsetHighC1_4_0M253 onsetHighC2_1_3M253 onsetHighC2_2_2M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_1_3M253 onsetHighC3_2_2M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighGC1_5_3M253
 ring

theorem onsetHighGC1_5_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_5_3M253 N := by
 unfold onsetHighGC1_5_3M253
 positivity

def onsetHighGC1_6_0M253 (N : ℤ) : ℤ := ((((((((((((45901858996224*N + 4941275719532544)*N + 243605676817907712)*N + 7263602588547809280)*N + 145750543035512389632)*N + 2072056928583592968192)*N + 21390072576747446992896)*N + 161504751604702138859520)*N + 885021587605440895647744)*N + 3432219221609490640011264)*N + 8940935356927860478574592)*N + 14046532827648570792345600)*N + 10064238965987582096179200)

theorem onsetHighGC1_6_0M253_eq (N : ℤ) : ((onsetHighC2_2_0M253 N*onsetHighC2_4_0M253 N-onsetHighC1_2_0M253 N*onsetHighC3_4_0M253 N) + ((onsetHighC2_3_0M253 N*onsetHighC2_3_0M253 N-onsetHighC1_3_0M253 N*onsetHighC3_3_0M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_2_0M253 N-onsetHighC1_4_0M253 N*onsetHighC3_2_0M253 N)))=onsetHighGC1_6_0M253 N := by
 unfold onsetHighC1_2_0M253 onsetHighC1_3_0M253 onsetHighC1_4_0M253 onsetHighC2_2_0M253 onsetHighC2_3_0M253 onsetHighC2_4_0M253 onsetHighC3_2_0M253 onsetHighC3_3_0M253 onsetHighC3_4_0M253 onsetHighGC1_6_0M253
 ring

theorem onsetHighGC1_6_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_6_0M253 N := by
 unfold onsetHighGC1_6_0M253
 positivity

def onsetHighGC1_6_1M253 (N : ℤ) : ℤ := ((((((((((((26102797959168*N + 2831041651802112)*N + 140572906349395968)*N + 4219212017581424640)*N + 85165355004680208384)*N + 1217083738081393115136)*N + 12621041858630872203264)*N + 95664154404918373908480)*N + 525945998540751815835648)*N + 2045297745817789374922752)*N + 5340212129491019857133568)*N + 8405556570748596655226880)*N + 6031899603035846030131200)

theorem onsetHighGC1_6_1M253_eq (N : ℤ) : (((onsetHighC2_2_1M253 N*onsetHighC2_4_0M253 N-onsetHighC1_2_1M253 N*onsetHighC3_4_0M253 N) + (onsetHighC2_3_0M253 N*onsetHighC2_3_1M253 N-onsetHighC1_3_0M253 N*onsetHighC3_3_1M253 N)) + ((onsetHighC2_3_1M253 N*onsetHighC2_3_0M253 N-onsetHighC1_3_1M253 N*onsetHighC3_3_0M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_2_1M253 N-onsetHighC1_4_0M253 N*onsetHighC3_2_1M253 N)))=onsetHighGC1_6_1M253 N := by
 unfold onsetHighC1_2_1M253 onsetHighC1_3_0M253 onsetHighC1_3_1M253 onsetHighC1_4_0M253 onsetHighC2_2_1M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_2_1M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighGC1_6_1M253
 ring

theorem onsetHighGC1_6_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_6_1M253 N := by
 unfold onsetHighGC1_6_1M253
 positivity

def onsetHighGC1_6_2M253 (N : ℤ) : ℤ := ((((((((((((3669781118976*N + 401485892419584)*N + 20102092790169600)*N + 608027790393999360)*N + 12359214267679899648)*N + 177725975421561864192)*N + 1853111299050118840320)*N + 14113178633571800186880)*N + 77912415438241347403776)*N + 304062235525907296026624)*N + 796316119098640438394880)*N + 1256678100448875758223360)*N + 903813597304460830310400)

theorem onsetHighGC1_6_2M253_eq (N : ℤ) : ((onsetHighC2_2_2M253 N*onsetHighC2_4_0M253 N-onsetHighC1_2_2M253 N*onsetHighC3_4_0M253 N) + ((onsetHighC2_3_1M253 N*onsetHighC2_3_1M253 N-onsetHighC1_3_1M253 N*onsetHighC3_3_1M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_2_2M253 N-onsetHighC1_4_0M253 N*onsetHighC3_2_2M253 N)))=onsetHighGC1_6_2M253 N := by
 unfold onsetHighC1_2_2M253 onsetHighC1_3_1M253 onsetHighC1_4_0M253 onsetHighC2_2_2M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_2_2M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighGC1_6_2M253
 ring

theorem onsetHighGC1_6_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_6_2M253 N := by
 unfold onsetHighGC1_6_2M253
 positivity

def onsetHighGC1_7_0M253 (N : ℤ) : ℤ := ((((((((((((7457942274048*N + 798879217876992)*N + 39184426126540800)*N + 1162075299014246400)*N + 23184305389477822464)*N + 327588239175913046016)*N + 3359942880965815173120)*N + 25197983250227952353280)*N + 137114969784262210879488)*N + 527922300638634958651392)*N + 1365147793112202876026880)*N + 2128774093627272902737920)*N + 1513879426668166329139200)

theorem onsetHighGC1_7_0M253_eq (N : ℤ) : ((onsetHighC2_3_0M253 N*onsetHighC2_4_0M253 N-onsetHighC1_3_0M253 N*onsetHighC3_4_0M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_3_0M253 N-onsetHighC1_4_0M253 N*onsetHighC3_3_0M253 N))=onsetHighGC1_7_0M253 N := by
 unfold onsetHighC1_3_0M253 onsetHighC1_4_0M253 onsetHighC2_3_0M253 onsetHighC2_4_0M253 onsetHighC3_3_0M253 onsetHighC3_4_0M253 onsetHighGC1_7_0M253
 ring

theorem onsetHighGC1_7_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_7_0M253 N := by
 unfold onsetHighGC1_7_0M253
 positivity

def onsetHighGC1_7_1M253 (N : ℤ) : ℤ := ((((((((((((2097017782272*N + 226461009051648)*N + 11194455910514688)*N + 334387961124618240)*N + 6714883166642896896)*N + 95430436838581469184)*N + 983778591794144477184)*N + 7410536264773423595520)*N + 40478463256097646968832)*N + 156361327269790265376768)*N + 405464037940687880060928)*N + 633776092013991391395840)*N + 451623901044748478054400)

theorem onsetHighGC1_7_1M253_eq (N : ℤ) : ((onsetHighC2_3_1M253 N*onsetHighC2_4_0M253 N-onsetHighC1_3_1M253 N*onsetHighC3_4_0M253 N) + (onsetHighC2_4_0M253 N*onsetHighC2_3_1M253 N-onsetHighC1_4_0M253 N*onsetHighC3_3_1M253 N))=onsetHighGC1_7_1M253 N := by
 unfold onsetHighC1_3_1M253 onsetHighC1_4_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighGC1_7_1M253
 ring

theorem onsetHighGC1_7_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_7_1M253 N := by
 unfold onsetHighGC1_7_1M253
 positivity

def onsetHighGC1_8_0M253 (N : ℤ) : ℤ := ((((((((((((524254445568*N + 55875377037312)*N + 2726512079929344)*N + 80421477521817600)*N + 1595303855300542464)*N + 22405457578825875456)*N + 228353030920026980352)*N + 1701290529557651128320)*N + 9194806413028510138368)*N + 35156059487438144274432)*N + 90267295137284178837504)*N + 139755744622971589754880)*N + 98675683881102449049600)

theorem onsetHighGC1_8_0M253_eq (N : ℤ) : (onsetHighC2_4_0M253 N*onsetHighC2_4_0M253 N-onsetHighC1_4_0M253 N*onsetHighC3_4_0M253 N)=onsetHighGC1_8_0M253 N := by
 unfold onsetHighC1_4_0M253 onsetHighC2_4_0M253 onsetHighC3_4_0M253 onsetHighGC1_8_0M253
 ring

theorem onsetHighGC1_8_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC1_8_0M253 N := by
 unfold onsetHighGC1_8_0M253
 positivity

attribute [local irreducible] onsetHighC1_0_0M253 onsetHighC1_0_1M253 onsetHighC1_0_2M253 onsetHighC1_0_3M253 onsetHighC1_0_4M253 onsetHighC1_1_0M253 onsetHighC1_1_1M253 onsetHighC1_1_2M253 onsetHighC1_1_3M253 onsetHighC1_2_0M253 onsetHighC1_2_1M253 onsetHighC1_2_2M253 onsetHighC1_3_0M253 onsetHighC1_3_1M253 onsetHighC1_4_0M253 onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253

theorem onsetHigh_lc1M253 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 onsetHighV1M253 N C R*onsetHighV3M253 N C R ≤ (onsetHighV2M253 N C R)^2 := by
 apply sub_nonneg.mp
 rw [onsetHigh_decomp1M253,onsetHigh_decomp2M253,onsetHigh_decomp3M253]
 have he : (((onsetHighC2_0_0M253 N*C^0*R^0 + (onsetHighC2_0_1M253 N*C^0*R^1 + onsetHighC2_0_2M253 N*C^0*R^2)) + ((onsetHighC2_0_3M253 N*C^0*R^3 + onsetHighC2_0_4M253 N*C^0*R^4) + (onsetHighC2_1_0M253 N*C^1*R^0 + onsetHighC2_1_1M253 N*C^1*R^1))) + (((onsetHighC2_1_2M253 N*C^1*R^2 + onsetHighC2_1_3M253 N*C^1*R^3) + (onsetHighC2_2_0M253 N*C^2*R^0 + onsetHighC2_2_1M253 N*C^2*R^1)) + ((onsetHighC2_2_2M253 N*C^2*R^2 + onsetHighC2_3_0M253 N*C^3*R^0) + (onsetHighC2_3_1M253 N*C^3*R^1 + onsetHighC2_4_0M253 N*C^4*R^0))))^2-(((onsetHighC1_0_0M253 N*C^0*R^0 + (onsetHighC1_0_1M253 N*C^0*R^1 + onsetHighC1_0_2M253 N*C^0*R^2)) + ((onsetHighC1_0_3M253 N*C^0*R^3 + onsetHighC1_0_4M253 N*C^0*R^4) + (onsetHighC1_1_0M253 N*C^1*R^0 + onsetHighC1_1_1M253 N*C^1*R^1))) + (((onsetHighC1_1_2M253 N*C^1*R^2 + onsetHighC1_1_3M253 N*C^1*R^3) + (onsetHighC1_2_0M253 N*C^2*R^0 + onsetHighC1_2_1M253 N*C^2*R^1)) + ((onsetHighC1_2_2M253 N*C^2*R^2 + onsetHighC1_3_0M253 N*C^3*R^0) + (onsetHighC1_3_1M253 N*C^3*R^1 + onsetHighC1_4_0M253 N*C^4*R^0))))*(((onsetHighC3_0_0M253 N*C^0*R^0 + (onsetHighC3_0_1M253 N*C^0*R^1 + onsetHighC3_0_2M253 N*C^0*R^2)) + ((onsetHighC3_0_3M253 N*C^0*R^3 + onsetHighC3_0_4M253 N*C^0*R^4) + (onsetHighC3_1_0M253 N*C^1*R^0 + onsetHighC3_1_1M253 N*C^1*R^1))) + (((onsetHighC3_1_2M253 N*C^1*R^2 + onsetHighC3_1_3M253 N*C^1*R^3) + (onsetHighC3_2_0M253 N*C^2*R^0 + onsetHighC3_2_1M253 N*C^2*R^1)) + ((onsetHighC3_2_2M253 N*C^2*R^2 + onsetHighC3_3_0M253 N*C^3*R^0) + (onsetHighC3_3_1M253 N*C^3*R^1 + onsetHighC3_4_0M253 N*C^4*R^0))))=(((((onsetHighGC1_0_0M253 N*C^0*R^0 + onsetHighGC1_0_1M253 N*C^0*R^1) + (onsetHighGC1_0_2M253 N*C^0*R^2 + (onsetHighGC1_0_3M253 N*C^0*R^3 + onsetHighGC1_0_4M253 N*C^0*R^4))) + ((onsetHighGC1_0_5M253 N*C^0*R^5 + (onsetHighGC1_0_6M253 N*C^0*R^6 + onsetHighGC1_0_7M253 N*C^0*R^7)) + (onsetHighGC1_0_8M253 N*C^0*R^8 + (onsetHighGC1_1_0M253 N*C^1*R^0 + onsetHighGC1_1_1M253 N*C^1*R^1)))) + (((onsetHighGC1_1_2M253 N*C^1*R^2 + onsetHighGC1_1_3M253 N*C^1*R^3) + (onsetHighGC1_1_4M253 N*C^1*R^4 + (onsetHighGC1_1_5M253 N*C^1*R^5 + onsetHighGC1_1_6M253 N*C^1*R^6))) + ((onsetHighGC1_1_7M253 N*C^1*R^7 + (onsetHighGC1_2_0M253 N*C^2*R^0 + onsetHighGC1_2_1M253 N*C^2*R^1)) + (onsetHighGC1_2_2M253 N*C^2*R^2 + (onsetHighGC1_2_3M253 N*C^2*R^3 + onsetHighGC1_2_4M253 N*C^2*R^4))))) + ((((onsetHighGC1_2_5M253 N*C^2*R^5 + onsetHighGC1_2_6M253 N*C^2*R^6) + (onsetHighGC1_3_0M253 N*C^3*R^0 + (onsetHighGC1_3_1M253 N*C^3*R^1 + onsetHighGC1_3_2M253 N*C^3*R^2))) + ((onsetHighGC1_3_3M253 N*C^3*R^3 + (onsetHighGC1_3_4M253 N*C^3*R^4 + onsetHighGC1_3_5M253 N*C^3*R^5)) + (onsetHighGC1_4_0M253 N*C^4*R^0 + (onsetHighGC1_4_1M253 N*C^4*R^1 + onsetHighGC1_4_2M253 N*C^4*R^2)))) + (((onsetHighGC1_4_3M253 N*C^4*R^3 + (onsetHighGC1_4_4M253 N*C^4*R^4 + onsetHighGC1_5_0M253 N*C^5*R^0)) + (onsetHighGC1_5_1M253 N*C^5*R^1 + (onsetHighGC1_5_2M253 N*C^5*R^2 + onsetHighGC1_5_3M253 N*C^5*R^3))) + ((onsetHighGC1_6_0M253 N*C^6*R^0 + (onsetHighGC1_6_1M253 N*C^6*R^1 + onsetHighGC1_6_2M253 N*C^6*R^2)) + (onsetHighGC1_7_0M253 N*C^7*R^0 + (onsetHighGC1_7_1M253 N*C^7*R^1 + onsetHighGC1_8_0M253 N*C^8*R^0)))))) := by
  rw [←onsetHighGC1_0_0M253_eq,←onsetHighGC1_0_1M253_eq,←onsetHighGC1_0_2M253_eq,←onsetHighGC1_0_3M253_eq,←onsetHighGC1_0_4M253_eq,←onsetHighGC1_0_5M253_eq,←onsetHighGC1_0_6M253_eq,←onsetHighGC1_0_7M253_eq,←onsetHighGC1_0_8M253_eq,←onsetHighGC1_1_0M253_eq,←onsetHighGC1_1_1M253_eq,←onsetHighGC1_1_2M253_eq,←onsetHighGC1_1_3M253_eq,←onsetHighGC1_1_4M253_eq,←onsetHighGC1_1_5M253_eq,←onsetHighGC1_1_6M253_eq,←onsetHighGC1_1_7M253_eq,←onsetHighGC1_2_0M253_eq,←onsetHighGC1_2_1M253_eq,←onsetHighGC1_2_2M253_eq,←onsetHighGC1_2_3M253_eq,←onsetHighGC1_2_4M253_eq,←onsetHighGC1_2_5M253_eq,←onsetHighGC1_2_6M253_eq,←onsetHighGC1_3_0M253_eq,←onsetHighGC1_3_1M253_eq,←onsetHighGC1_3_2M253_eq,←onsetHighGC1_3_3M253_eq,←onsetHighGC1_3_4M253_eq,←onsetHighGC1_3_5M253_eq,←onsetHighGC1_4_0M253_eq,←onsetHighGC1_4_1M253_eq,←onsetHighGC1_4_2M253_eq,←onsetHighGC1_4_3M253_eq,←onsetHighGC1_4_4M253_eq,←onsetHighGC1_5_0M253_eq,←onsetHighGC1_5_1M253_eq,←onsetHighGC1_5_2M253_eq,←onsetHighGC1_5_3M253_eq,←onsetHighGC1_6_0M253_eq,←onsetHighGC1_6_1M253_eq,←onsetHighGC1_6_2M253_eq,←onsetHighGC1_7_0M253_eq,←onsetHighGC1_7_1M253_eq,←onsetHighGC1_8_0M253_eq]
  ring
 rw [he]
 have h0_0 := onsetHighGC1_0_0M253_nonneg N hN
 have h0_1 := onsetHighGC1_0_1M253_nonneg N hN
 have h0_2 := onsetHighGC1_0_2M253_nonneg N hN
 have h0_3 := onsetHighGC1_0_3M253_nonneg N hN
 have h0_4 := onsetHighGC1_0_4M253_nonneg N hN
 have h0_5 := onsetHighGC1_0_5M253_nonneg N hN
 have h0_6 := onsetHighGC1_0_6M253_nonneg N hN
 have h0_7 := onsetHighGC1_0_7M253_nonneg N hN
 have h0_8 := onsetHighGC1_0_8M253_nonneg N hN
 have h1_0 := onsetHighGC1_1_0M253_nonneg N hN
 have h1_1 := onsetHighGC1_1_1M253_nonneg N hN
 have h1_2 := onsetHighGC1_1_2M253_nonneg N hN
 have h1_3 := onsetHighGC1_1_3M253_nonneg N hN
 have h1_4 := onsetHighGC1_1_4M253_nonneg N hN
 have h1_5 := onsetHighGC1_1_5M253_nonneg N hN
 have h1_6 := onsetHighGC1_1_6M253_nonneg N hN
 have h1_7 := onsetHighGC1_1_7M253_nonneg N hN
 have h2_0 := onsetHighGC1_2_0M253_nonneg N hN
 have h2_1 := onsetHighGC1_2_1M253_nonneg N hN
 have h2_2 := onsetHighGC1_2_2M253_nonneg N hN
 have h2_3 := onsetHighGC1_2_3M253_nonneg N hN
 have h2_4 := onsetHighGC1_2_4M253_nonneg N hN
 have h2_5 := onsetHighGC1_2_5M253_nonneg N hN
 have h2_6 := onsetHighGC1_2_6M253_nonneg N hN
 have h3_0 := onsetHighGC1_3_0M253_nonneg N hN
 have h3_1 := onsetHighGC1_3_1M253_nonneg N hN
 have h3_2 := onsetHighGC1_3_2M253_nonneg N hN
 have h3_3 := onsetHighGC1_3_3M253_nonneg N hN
 have h3_4 := onsetHighGC1_3_4M253_nonneg N hN
 have h3_5 := onsetHighGC1_3_5M253_nonneg N hN
 have h4_0 := onsetHighGC1_4_0M253_nonneg N hN
 have h4_1 := onsetHighGC1_4_1M253_nonneg N hN
 have h4_2 := onsetHighGC1_4_2M253_nonneg N hN
 have h4_3 := onsetHighGC1_4_3M253_nonneg N hN
 have h4_4 := onsetHighGC1_4_4M253_nonneg N hN
 have h5_0 := onsetHighGC1_5_0M253_nonneg N hN
 have h5_1 := onsetHighGC1_5_1M253_nonneg N hN
 have h5_2 := onsetHighGC1_5_2M253_nonneg N hN
 have h5_3 := onsetHighGC1_5_3M253_nonneg N hN
 have h6_0 := onsetHighGC1_6_0M253_nonneg N hN
 have h6_1 := onsetHighGC1_6_1M253_nonneg N hN
 have h6_2 := onsetHighGC1_6_2M253_nonneg N hN
 have h7_0 := onsetHighGC1_7_0M253_nonneg N hN
 have h7_1 := onsetHighGC1_7_1M253_nonneg N hN
 have h8_0 := onsetHighGC1_8_0M253_nonneg N hN
 positivity
end
end MathGKM.Markov
