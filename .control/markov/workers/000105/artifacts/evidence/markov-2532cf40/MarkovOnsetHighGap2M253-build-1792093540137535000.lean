import MarkovOnsetHighSplitDefsM253
/-! Machine-authored request 2532cf40. Coefficient-wise onset gap proof. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536

def onsetHighGC2_0_0M253 (N : ℤ) : ℤ := ((((((((((((39715445145600*N + 4162844538961920)*N + 200134456441307136)*N + 5834715216457236480)*N + 114865661768541143040)*N + 1608335733787396669440)*N + 16419923553761139621888)*N + 123126454487393218068480)*N + 672874133322183695400960)*N + 2612910165761975270768640)*N + 6842034207339311583461376)*N + 10844879790049678841610240)*N + 7866928306812904597094400)

theorem onsetHighGC2_0_0M253_eq (N : ℤ) : (onsetHighC3_0_0M253 N*onsetHighC3_0_0M253 N-onsetHighC2_0_0M253 N*onsetHighC4_0_0M253 N)=onsetHighGC2_0_0M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC3_0_0M253 onsetHighC4_0_0M253 onsetHighGC2_0_0M253
 ring

theorem onsetHighGC2_0_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_0_0M253 N := by
 unfold onsetHighGC2_0_0M253
 positivity

def onsetHighGC2_0_1M253 (N : ℤ) : ℤ := ((((((((((((95039615139840*N + 10016254291083264)*N + 484055945003925504)*N + 14181464845980794880)*N + 280461334476965806080)*N + 3943517610280979791872)*N + 40414747991866607665152)*N + 304101340657077253570560)*N + 1667012556998900349665280)*N + 6491038850989791944638464)*N + 17037888181253829067014144)*N + 27062237789809663774556160)*N + 19666780408332195928473600)

theorem onsetHighGC2_0_1M253_eq (N : ℤ) : ((onsetHighC3_0_0M253 N*onsetHighC3_0_1M253 N-onsetHighC2_0_0M253 N*onsetHighC4_0_1M253 N) + (onsetHighC3_0_1M253 N*onsetHighC3_0_0M253 N-onsetHighC2_0_1M253 N*onsetHighC4_0_0M253 N))=onsetHighGC2_0_1M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighGC2_0_1M253
 ring

theorem onsetHighGC2_0_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_0_1M253 N := by
 unfold onsetHighGC2_0_1M253
 positivity

def onsetHighGC2_0_2M253 (N : ℤ) : ℤ := ((((((((((((99044387979264*N + 10503509294186496)*N + 510633608623423488)*N + 15044328909035274240)*N + 299086357743757688832)*N + 4225731869546709516288)*N + 43498136439935652593664)*N + 328610025016881834885120)*N + 1807829859154764494536704)*N + 7061914647524217314082816)*N + 18589097587395644848078848)*N + 29600452809519463421706240)*N + 21559172054702459756544000)

theorem onsetHighGC2_0_2M253_eq (N : ℤ) : ((onsetHighC3_0_0M253 N*onsetHighC3_0_2M253 N-onsetHighC2_0_0M253 N*onsetHighC4_0_2M253 N) + ((onsetHighC3_0_1M253 N*onsetHighC3_0_1M253 N-onsetHighC2_0_1M253 N*onsetHighC4_0_1M253 N) + (onsetHighC3_0_2M253 N*onsetHighC3_0_0M253 N-onsetHighC2_0_2M253 N*onsetHighC4_0_0M253 N)))=onsetHighGC2_0_2M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighGC2_0_2M253
 ring

theorem onsetHighGC2_0_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_0_2M253 N := by
 unfold onsetHighGC2_0_2M253
 positivity

def onsetHighGC2_0_3M253 (N : ℤ) : ℤ := ((((((((((((58583452483584*N + 6257245541105664)*N + 306291381758853120)*N + 9082637009572331520)*N + 181661882351431974912)*N + 2581066639097129336832)*N + 26705212465441690091520)*N + 202691134018302687313920)*N + 1119818634973023631048704)*N + 4391036199565569468923904)*N + 11598142142340232056668160)*N + 18525058826530845488578560)*N + 13529609500614223822848000)

theorem onsetHighGC2_0_3M253_eq (N : ℤ) : (((onsetHighC3_0_0M253 N*onsetHighC3_0_3M253 N-onsetHighC2_0_0M253 N*onsetHighC4_0_3M253 N) + (onsetHighC3_0_1M253 N*onsetHighC3_0_2M253 N-onsetHighC2_0_1M253 N*onsetHighC4_0_2M253 N)) + ((onsetHighC3_0_2M253 N*onsetHighC3_0_1M253 N-onsetHighC2_0_2M253 N*onsetHighC4_0_1M253 N) + (onsetHighC3_0_3M253 N*onsetHighC3_0_0M253 N-onsetHighC2_0_3M253 N*onsetHighC4_0_0M253 N)))=onsetHighGC2_0_3M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighGC2_0_3M253
 ring

theorem onsetHighGC2_0_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_0_3M253 N := by
 unfold onsetHighGC2_0_3M253
 positivity

def onsetHighGC2_0_4M253 (N : ℤ) : ℤ := ((((((((((((21475472965632*N + 2312624689643520)*N + 114097689288769536)*N + 3408760798744412160)*N + 68657277483844632576)*N + 981843462607931965440)*N + 10219687255308800360448)*N + 77993159891201981153280)*N + 433051761614150118408192)*N + 1705813749997202901565440)*N + 4524199875231549505929216)*N + 7253263706194454233743360)*N + 5315296759068610982707200)

theorem onsetHighGC2_0_4M253_eq (N : ℤ) : (((onsetHighC3_0_0M253 N*onsetHighC3_0_4M253 N-onsetHighC2_0_0M253 N*onsetHighC4_0_4M253 N) + (onsetHighC3_0_1M253 N*onsetHighC3_0_3M253 N-onsetHighC2_0_1M253 N*onsetHighC4_0_3M253 N)) + ((onsetHighC3_0_2M253 N*onsetHighC3_0_2M253 N-onsetHighC2_0_2M253 N*onsetHighC4_0_2M253 N) + ((onsetHighC3_0_3M253 N*onsetHighC3_0_1M253 N-onsetHighC2_0_3M253 N*onsetHighC4_0_1M253 N) + (onsetHighC3_0_4M253 N*onsetHighC3_0_0M253 N-onsetHighC2_0_4M253 N*onsetHighC4_0_0M253 N))))=onsetHighGC2_0_4M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighGC2_0_4M253
 ring

theorem onsetHighGC2_0_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_0_4M253 N := by
 unfold onsetHighGC2_0_4M253
 positivity

def onsetHighGC2_0_5M253 (N : ℤ) : ℤ := ((((((((((((4990194155520*N + 542403056369664)*N + 27002087889960960)*N + 813636934938132480)*N + 16520135492008673280)*N + 238026856808570683392)*N + 2494810463264739164160)*N + 19161789048846994636800)*N + 107021628397575379353600)*N + 423839120383186377375744)*N + 1129664324326203331706880)*N + 1819265351645213734993920)*N + 1338685525957021020979200)

theorem onsetHighGC2_0_5M253_eq (N : ℤ) : (((onsetHighC3_0_1M253 N*onsetHighC3_0_4M253 N-onsetHighC2_0_1M253 N*onsetHighC4_0_4M253 N) + (onsetHighC3_0_2M253 N*onsetHighC3_0_3M253 N-onsetHighC2_0_2M253 N*onsetHighC4_0_3M253 N)) + ((onsetHighC3_0_3M253 N*onsetHighC3_0_2M253 N-onsetHighC2_0_3M253 N*onsetHighC4_0_2M253 N) + (onsetHighC3_0_4M253 N*onsetHighC3_0_1M253 N-onsetHighC2_0_4M253 N*onsetHighC4_0_1M253 N)))=onsetHighGC2_0_5M253 N := by
 unfold onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighGC2_0_5M253
 ring

theorem onsetHighGC2_0_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_0_5M253 N := by
 unfold onsetHighGC2_0_5M253
 positivity

def onsetHighGC2_0_6M253 (N : ℤ) : ℤ := ((((((((((((717216546816*N + 78779139489792)*N + 3961899316150272)*N + 120546780181954560)*N + 2470152079311372288)*N + 35897915180319768576)*N + 379276991939344859136)*N + 2934786375646319738880)*N + 16503977687432353284096)*N + 65775329140822043000832)*N + 176335616398226762760192)*N + 285506295248784894197760)*N + 211127501076649707110400)

theorem onsetHighGC2_0_6M253_eq (N : ℤ) : ((onsetHighC3_0_2M253 N*onsetHighC3_0_4M253 N-onsetHighC2_0_2M253 N*onsetHighC4_0_4M253 N) + ((onsetHighC3_0_3M253 N*onsetHighC3_0_3M253 N-onsetHighC2_0_3M253 N*onsetHighC4_0_3M253 N) + (onsetHighC3_0_4M253 N*onsetHighC3_0_2M253 N-onsetHighC2_0_4M253 N*onsetHighC4_0_2M253 N)))=onsetHighGC2_0_6M253 N := by
 unfold onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighGC2_0_6M253
 ring

theorem onsetHighGC2_0_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_0_6M253 N := by
 unfold onsetHighGC2_0_6M253
 positivity

def onsetHighGC2_0_7M253 (N : ℤ) : ℤ := ((((((((((((58265174016*N + 6475229429760)*N + 329381616549888)*N + 10132191549849600)*N + 209788432380592128)*N + 3078739629755596800)*N + 32827184445615243264)*N + 256186453769138995200)*N + 1452139287626815635456)*N + 5830056223736675696640)*N + 15736391343966576181248)*N + 25640011421890235596800)*N + 19071471996194468659200)

theorem onsetHighGC2_0_7M253_eq (N : ℤ) : ((onsetHighC3_0_3M253 N*onsetHighC3_0_4M253 N-onsetHighC2_0_3M253 N*onsetHighC4_0_4M253 N) + (onsetHighC3_0_4M253 N*onsetHighC3_0_3M253 N-onsetHighC2_0_4M253 N*onsetHighC4_0_3M253 N))=onsetHighGC2_0_7M253 N := by
 unfold onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighGC2_0_7M253
 ring

theorem onsetHighGC2_0_7M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_0_7M253 N := by
 unfold onsetHighGC2_0_7M253
 positivity

def onsetHighGC2_0_8M253 (N : ℤ) : ℤ := ((((((((((((2047868928*N + 230550405120)*N + 11877111300096)*N + 369847440506880)*N + 7747573483044864)*N + 114960930318581760)*N + 1238565642652090368)*N + 9760288836377640960)*N + 55828356604050014208)*N + 226042139776930283520)*N + 614945044170747150336)*N + 1009310030247438581760)*N + 755864671458793881600)

theorem onsetHighGC2_0_8M253_eq (N : ℤ) : (onsetHighC3_0_4M253 N*onsetHighC3_0_4M253 N-onsetHighC2_0_4M253 N*onsetHighC4_0_4M253 N)=onsetHighGC2_0_8M253 N := by
 unfold onsetHighC2_0_4M253 onsetHighC3_0_4M253 onsetHighC4_0_4M253 onsetHighGC2_0_8M253
 ring

theorem onsetHighGC2_0_8M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_0_8M253 N := by
 unfold onsetHighGC2_0_8M253
 positivity

def onsetHighGC2_1_0M253 (N : ℤ) : ℤ := ((((((((((((190079230279680*N + 19836357090213888)*N + 949295644340649984)*N + 27542256646021447680)*N + 539445841965109739520)*N + 7512427211298139275264)*N + 76257938621296627679232)*N + 568383796350761576693760)*N + 3086546742148627641139200)*N + 11906794261427771091714048)*N + 30965863395273619704643584)*N + 48737445689257451622236160)*N + 35100570633086937504153600)

theorem onsetHighGC2_1_0M253_eq (N : ℤ) : ((onsetHighC3_0_0M253 N*onsetHighC3_1_0M253 N-onsetHighC2_0_0M253 N*onsetHighC4_1_0M253 N) + (onsetHighC3_1_0M253 N*onsetHighC3_0_0M253 N-onsetHighC2_1_0M253 N*onsetHighC4_0_0M253 N))=onsetHighGC2_1_0M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_1_0M253 onsetHighC3_0_0M253 onsetHighC3_1_0M253 onsetHighC4_0_0M253 onsetHighC4_1_0M253 onsetHighGC2_1_0M253
 ring

theorem onsetHighGC2_1_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_1_0M253 N := by
 unfold onsetHighGC2_1_0M253
 positivity

def onsetHighGC2_1_1M253 (N : ℤ) : ℤ := ((((((((((((396177551917056*N + 41591858031230976)*N + 2001801272742641664)*N + 58391246855869562880)*N + 1149377105857487044608)*N + 16080094666579444236288)*N + 163911733266716999811072)*N + 1226330384060334169128960)*N + 6682038413067895896539136)*N + 25854687651980460331892736)*N + 67419401060414163322404864)*N + 106361180468744857017384960)*N + 76758817581659174672793600)

theorem onsetHighGC2_1_1M253_eq (N : ℤ) : (((onsetHighC3_0_0M253 N*onsetHighC3_1_1M253 N-onsetHighC2_0_0M253 N*onsetHighC4_1_1M253 N) + (onsetHighC3_0_1M253 N*onsetHighC3_1_0M253 N-onsetHighC2_0_1M253 N*onsetHighC4_1_0M253 N)) + ((onsetHighC3_1_0M253 N*onsetHighC3_0_1M253 N-onsetHighC2_1_0M253 N*onsetHighC4_0_1M253 N) + (onsetHighC3_1_1M253 N*onsetHighC3_0_0M253 N-onsetHighC2_1_1M253 N*onsetHighC4_0_0M253 N)))=onsetHighGC2_1_1M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighGC2_1_1M253
 ring

theorem onsetHighGC2_1_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_1_1M253 N := by
 unfold onsetHighGC2_1_1M253
 positivity

def onsetHighGC2_1_2M253 (N : ℤ) : ℤ := ((((((((((((351500714901504*N + 37154361503121408)*N + 1799957531188002816)*N + 52828719565944913920)*N + 1045889483439244050432)*N + 14710289132893759340544)*N + 150680424042417097801728)*N + 1132337030629535435980800)*N + 6194592878097744476504064)*N + 24054865857109116372123648)*N + 62928147765658651505197056)*N + 99561149975652482592276480)*N + 72035492994202497358233600)

theorem onsetHighGC2_1_2M253_eq (N : ℤ) : (((onsetHighC3_0_0M253 N*onsetHighC3_1_2M253 N-onsetHighC2_0_0M253 N*onsetHighC4_1_2M253 N) + ((onsetHighC3_0_1M253 N*onsetHighC3_1_1M253 N-onsetHighC2_0_1M253 N*onsetHighC4_1_1M253 N) + (onsetHighC3_0_2M253 N*onsetHighC3_1_0M253 N-onsetHighC2_0_2M253 N*onsetHighC4_1_0M253 N))) + ((onsetHighC3_1_0M253 N*onsetHighC3_0_2M253 N-onsetHighC2_1_0M253 N*onsetHighC4_0_2M253 N) + ((onsetHighC3_1_1M253 N*onsetHighC3_0_1M253 N-onsetHighC2_1_1M253 N*onsetHighC4_0_1M253 N) + (onsetHighC3_1_2M253 N*onsetHighC3_0_0M253 N-onsetHighC2_1_2M253 N*onsetHighC4_0_0M253 N))))=onsetHighGC2_1_2M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighGC2_1_2M253
 ring

theorem onsetHighGC2_1_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_1_2M253 N := by
 unfold onsetHighGC2_1_2M253
 positivity

def onsetHighGC2_1_3M253 (N : ℤ) : ℤ := ((((((((((((171803783725056*N + 18302456492457984)*N + 893351652067639296)*N + 26406930873204080640)*N + 526288113009602592768)*N + 7447980973289323364352)*N + 76725554927136798670848)*N + 579581346040398945976320)*N + 3185698866481825947058176)*N + 12423882543762421384740864)*N + 32627549818719387379040256)*N + 51802642041815123338199040)*N + 37599644303607059251200000)

theorem onsetHighGC2_1_3M253_eq (N : ℤ) : ((((onsetHighC3_0_0M253 N*onsetHighC3_1_3M253 N-onsetHighC2_0_0M253 N*onsetHighC4_1_3M253 N) + (onsetHighC3_0_1M253 N*onsetHighC3_1_2M253 N-onsetHighC2_0_1M253 N*onsetHighC4_1_2M253 N)) + ((onsetHighC3_0_2M253 N*onsetHighC3_1_1M253 N-onsetHighC2_0_2M253 N*onsetHighC4_1_1M253 N) + (onsetHighC3_0_3M253 N*onsetHighC3_1_0M253 N-onsetHighC2_0_3M253 N*onsetHighC4_1_0M253 N))) + (((onsetHighC3_1_0M253 N*onsetHighC3_0_3M253 N-onsetHighC2_1_0M253 N*onsetHighC4_0_3M253 N) + (onsetHighC3_1_1M253 N*onsetHighC3_0_2M253 N-onsetHighC2_1_1M253 N*onsetHighC4_0_2M253 N)) + ((onsetHighC3_1_2M253 N*onsetHighC3_0_1M253 N-onsetHighC2_1_2M253 N*onsetHighC4_0_1M253 N) + (onsetHighC3_1_3M253 N*onsetHighC3_0_0M253 N-onsetHighC2_1_3M253 N*onsetHighC4_0_0M253 N))))=onsetHighGC2_1_3M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighGC2_1_3M253
 ring

theorem onsetHighGC2_1_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_1_3M253 N := by
 unfold onsetHighGC2_1_3M253
 positivity

def onsetHighGC2_1_4M253 (N : ℤ) : ℤ := ((((((((((((49901941555200*N + 5363600197681152)*N + 264054437880791040)*N + 7869140569329500160)*N + 158036415924236451840)*N + 2252517431699325321216)*N + 23357898560680262369280)*N + 177518760639630220984320)*N + 981186810734485147484160)*N + 3846048703465016191352832)*N + 10147524068615512593530880)*N + 16179643410983315224657920)*N + 11789120073359054890598400)

theorem onsetHighGC2_1_4M253_eq (N : ℤ) : ((((onsetHighC3_0_1M253 N*onsetHighC3_1_3M253 N-onsetHighC2_0_1M253 N*onsetHighC4_1_3M253 N) + (onsetHighC3_0_2M253 N*onsetHighC3_1_2M253 N-onsetHighC2_0_2M253 N*onsetHighC4_1_2M253 N)) + ((onsetHighC3_0_3M253 N*onsetHighC3_1_1M253 N-onsetHighC2_0_3M253 N*onsetHighC4_1_1M253 N) + (onsetHighC3_0_4M253 N*onsetHighC3_1_0M253 N-onsetHighC2_0_4M253 N*onsetHighC4_1_0M253 N))) + (((onsetHighC3_1_0M253 N*onsetHighC3_0_4M253 N-onsetHighC2_1_0M253 N*onsetHighC4_0_4M253 N) + (onsetHighC3_1_1M253 N*onsetHighC3_0_3M253 N-onsetHighC2_1_1M253 N*onsetHighC4_0_3M253 N)) + ((onsetHighC3_1_2M253 N*onsetHighC3_0_2M253 N-onsetHighC2_1_2M253 N*onsetHighC4_0_2M253 N) + (onsetHighC3_1_3M253 N*onsetHighC3_0_1M253 N-onsetHighC2_1_3M253 N*onsetHighC4_0_1M253 N))))=onsetHighGC2_1_4M253 N := by
 unfold onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighGC2_1_4M253
 ring

theorem onsetHighGC2_1_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_1_4M253 N := by
 unfold onsetHighGC2_1_4M253
 positivity

def onsetHighGC2_1_5M253 (N : ℤ) : ℤ := ((((((((((((8606598561792*N + 934397935091712)*N + 46450374214680576)*N + 1397165570591293440)*N + 28305739839848841216)*N + 406759662433333149696)*N + 4250176235211501600768)*N + 32529371467313609441280)*N + 180969514392543013896192)*N + 713621091672543741345792)*N + 1893232518474908768403456)*N + 3033972142559996207431680)*N + 2220992623909124171366400)

theorem onsetHighGC2_1_5M253_eq (N : ℤ) : (((onsetHighC3_0_2M253 N*onsetHighC3_1_3M253 N-onsetHighC2_0_2M253 N*onsetHighC4_1_3M253 N) + ((onsetHighC3_0_3M253 N*onsetHighC3_1_2M253 N-onsetHighC2_0_3M253 N*onsetHighC4_1_2M253 N) + (onsetHighC3_0_4M253 N*onsetHighC3_1_1M253 N-onsetHighC2_0_4M253 N*onsetHighC4_1_1M253 N))) + ((onsetHighC3_1_1M253 N*onsetHighC3_0_4M253 N-onsetHighC2_1_1M253 N*onsetHighC4_0_4M253 N) + ((onsetHighC3_1_2M253 N*onsetHighC3_0_3M253 N-onsetHighC2_1_2M253 N*onsetHighC4_0_3M253 N) + (onsetHighC3_1_3M253 N*onsetHighC3_0_2M253 N-onsetHighC2_1_3M253 N*onsetHighC4_0_2M253 N))))=onsetHighGC2_1_5M253 N := by
 unfold onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighGC2_1_5M253
 ring

theorem onsetHighGC2_1_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_1_5M253 N := by
 unfold onsetHighGC2_1_5M253
 positivity

def onsetHighGC2_1_6M253 (N : ℤ) : ℤ := ((((((((((((815712436224*N + 89560574853120)*N + 4501062908116992)*N + 136808877942374400)*N + 2799260910587215872)*N + 40602374678595502080)*N + 427957665941507014656)*N + 3302083494216849162240)*N + 18509010683800011669504)*N + 73497132460383141888000)*N + 196248384963588419223552)*N + 316376234551453152706560)*N + 232882599189955844505600)

theorem onsetHighGC2_1_6M253_eq (N : ℤ) : (((onsetHighC3_0_3M253 N*onsetHighC3_1_3M253 N-onsetHighC2_0_3M253 N*onsetHighC4_1_3M253 N) + (onsetHighC3_0_4M253 N*onsetHighC3_1_2M253 N-onsetHighC2_0_4M253 N*onsetHighC4_1_2M253 N)) + ((onsetHighC3_1_2M253 N*onsetHighC3_0_4M253 N-onsetHighC2_1_2M253 N*onsetHighC4_0_4M253 N) + (onsetHighC3_1_3M253 N*onsetHighC3_0_3M253 N-onsetHighC2_1_3M253 N*onsetHighC4_0_3M253 N)))=onsetHighGC2_1_6M253 N := by
 unfold onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighGC2_1_6M253
 ring

theorem onsetHighGC2_1_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_1_6M253 N := by
 unfold onsetHighGC2_1_6M253
 positivity

def onsetHighGC2_1_7M253 (N : ℤ) : ℤ := ((((((((((((32765902848*N + 3642564280320)*N + 185303335698432)*N + 5698528896614400)*N + 117904396605456384)*N + 1728259604569128960)*N + 18397193407269175296)*N + 143269652332412928000)*N + 810016513164528058368)*N + 3242397339098095288320)*N + 8722523731287418601472)*N + 14159609183318822092800)*N + 10490203472179337625600)

theorem onsetHighGC2_1_7M253_eq (N : ℤ) : ((onsetHighC3_0_4M253 N*onsetHighC3_1_3M253 N-onsetHighC2_0_4M253 N*onsetHighC4_1_3M253 N) + (onsetHighC3_1_3M253 N*onsetHighC3_0_4M253 N-onsetHighC2_1_3M253 N*onsetHighC4_0_4M253 N))=onsetHighGC2_1_7M253 N := by
 unfold onsetHighC2_0_4M253 onsetHighC2_1_3M253 onsetHighC3_0_4M253 onsetHighC3_1_3M253 onsetHighC4_0_4M253 onsetHighC4_1_3M253 onsetHighGC2_1_7M253
 ring

theorem onsetHighGC2_1_7M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_1_7M253 N := by
 unfold onsetHighGC2_1_7M253
 positivity

def onsetHighGC2_2_0M253 (N : ℤ) : ℤ := ((((((((((((396177551917056*N + 41169678885715968)*N + 1961497675148820480)*N + 56642544054891970560)*N + 1103870752382530879488)*N + 15291132448484096999424)*N + 154345328634280311521280)*N + 1143570489276433516462080)*N + 6171331051726019736109056)*N + 23652067009596935892369408)*N + 61097510101290113881866240)*N + 95495569603347777123778560)*N + 68288356853513326146355200)

theorem onsetHighGC2_2_0M253_eq (N : ℤ) : ((onsetHighC3_0_0M253 N*onsetHighC3_2_0M253 N-onsetHighC2_0_0M253 N*onsetHighC4_2_0M253 N) + ((onsetHighC3_1_0M253 N*onsetHighC3_1_0M253 N-onsetHighC2_1_0M253 N*onsetHighC4_1_0M253 N) + (onsetHighC3_2_0M253 N*onsetHighC3_0_0M253 N-onsetHighC2_2_0M253 N*onsetHighC4_0_0M253 N)))=onsetHighGC2_2_0M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_1_0M253 onsetHighC2_2_0M253 onsetHighC3_0_0M253 onsetHighC3_1_0M253 onsetHighC3_2_0M253 onsetHighC4_0_0M253 onsetHighC4_1_0M253 onsetHighC4_2_0M253 onsetHighGC2_2_0M253
 ring

theorem onsetHighGC2_2_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_2_0M253 N := by
 unfold onsetHighGC2_2_0M253
 positivity

def onsetHighGC2_2_1M253 (N : ℤ) : ℤ := ((((((((((((703001429803008*N + 73530499519217664)*N + 3525152518139019264)*N + 102394883754940170240)*N + 2006433013199584886784)*N + 27933929194597724454912)*N + 283258931226598595100672)*N + 2107487693235245143818240)*N + 11415996140552588363563008)*N + 43900296620544198461620224)*N + 113743733735555357109387264)*N + 178257602869419934726225920)*N + 127773685437382096964812800)

theorem onsetHighGC2_2_1M253_eq (N : ℤ) : (((onsetHighC3_0_0M253 N*onsetHighC3_2_1M253 N-onsetHighC2_0_0M253 N*onsetHighC4_2_1M253 N) + ((onsetHighC3_0_1M253 N*onsetHighC3_2_0M253 N-onsetHighC2_0_1M253 N*onsetHighC4_2_0M253 N) + (onsetHighC3_1_0M253 N*onsetHighC3_1_1M253 N-onsetHighC2_1_0M253 N*onsetHighC4_1_1M253 N))) + ((onsetHighC3_1_1M253 N*onsetHighC3_1_0M253 N-onsetHighC2_1_1M253 N*onsetHighC4_1_0M253 N) + ((onsetHighC3_2_0M253 N*onsetHighC3_0_1M253 N-onsetHighC2_2_0M253 N*onsetHighC4_0_1M253 N) + (onsetHighC3_2_1M253 N*onsetHighC3_0_0M253 N-onsetHighC2_2_1M253 N*onsetHighC4_0_0M253 N))))=onsetHighGC2_2_1M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighGC2_2_1M253
 ring

theorem onsetHighGC2_2_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_2_1M253 N := by
 unfold onsetHighGC2_2_1M253
 positivity

def onsetHighGC2_2_2M253 (N : ℤ) : ℤ := ((((((((((((515411351175168*N + 54311746403303424)*N + 2622418573867352064)*N + 76688842427549614080)*N + 1512228851099371044864)*N + 21176849939465837740032)*N + 215895692691582223122432)*N + 1614188748916368223764480)*N + 8782894009867413178810368)*N + 33911135965586698522066944)*N + 88182561896558622039343104)*N + 138652239069064074378608640)*N + 99678530201899359810355200)

theorem onsetHighGC2_2_2M253_eq (N : ℤ) : ((((onsetHighC3_0_0M253 N*onsetHighC3_2_2M253 N-onsetHighC2_0_0M253 N*onsetHighC4_2_2M253 N) + (onsetHighC3_0_1M253 N*onsetHighC3_2_1M253 N-onsetHighC2_0_1M253 N*onsetHighC4_2_1M253 N)) + ((onsetHighC3_0_2M253 N*onsetHighC3_2_0M253 N-onsetHighC2_0_2M253 N*onsetHighC4_2_0M253 N) + (onsetHighC3_1_0M253 N*onsetHighC3_1_2M253 N-onsetHighC2_1_0M253 N*onsetHighC4_1_2M253 N))) + (((onsetHighC3_1_1M253 N*onsetHighC3_1_1M253 N-onsetHighC2_1_1M253 N*onsetHighC4_1_1M253 N) + (onsetHighC3_1_2M253 N*onsetHighC3_1_0M253 N-onsetHighC2_1_2M253 N*onsetHighC4_1_0M253 N)) + ((onsetHighC3_2_0M253 N*onsetHighC3_0_2M253 N-onsetHighC2_2_0M253 N*onsetHighC4_0_2M253 N) + ((onsetHighC3_2_1M253 N*onsetHighC3_0_1M253 N-onsetHighC2_2_1M253 N*onsetHighC4_0_1M253 N) + (onsetHighC3_2_2M253 N*onsetHighC3_0_0M253 N-onsetHighC2_2_2M253 N*onsetHighC4_0_0M253 N)))))=onsetHighGC2_2_2M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighGC2_2_2M253
 ring

theorem onsetHighGC2_2_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_2_2M253 N := by
 unfold onsetHighGC2_2_2M253
 positivity

def onsetHighGC2_2_3M253 (N : ℤ) : ℤ := ((((((((((((199607766220800*N + 21212679326662656)*N + 1032630065323573248)*N + 30432317316173660160)*N + 604468182726428590080)*N + 8522176776428514705408)*N + 87426584015765146435584)*N + 657423447258157575045120)*N + 3595915798491649384120320)*N + 13950721200960352516571136)*N + 36436330701747995285127168)*N + 57518335218233084006891520)*N + 41500529717284377015091200)

theorem onsetHighGC2_2_3M253_eq (N : ℤ) : ((((onsetHighC3_0_1M253 N*onsetHighC3_2_2M253 N-onsetHighC2_0_1M253 N*onsetHighC4_2_2M253 N) + (onsetHighC3_0_2M253 N*onsetHighC3_2_1M253 N-onsetHighC2_0_2M253 N*onsetHighC4_2_1M253 N)) + ((onsetHighC3_0_3M253 N*onsetHighC3_2_0M253 N-onsetHighC2_0_3M253 N*onsetHighC4_2_0M253 N) + ((onsetHighC3_1_0M253 N*onsetHighC3_1_3M253 N-onsetHighC2_1_0M253 N*onsetHighC4_1_3M253 N) + (onsetHighC3_1_1M253 N*onsetHighC3_1_2M253 N-onsetHighC2_1_1M253 N*onsetHighC4_1_2M253 N)))) + (((onsetHighC3_1_2M253 N*onsetHighC3_1_1M253 N-onsetHighC2_1_2M253 N*onsetHighC4_1_1M253 N) + (onsetHighC3_1_3M253 N*onsetHighC3_1_0M253 N-onsetHighC2_1_3M253 N*onsetHighC4_1_0M253 N)) + ((onsetHighC3_2_0M253 N*onsetHighC3_0_3M253 N-onsetHighC2_2_0M253 N*onsetHighC4_0_3M253 N) + ((onsetHighC3_2_1M253 N*onsetHighC3_0_2M253 N-onsetHighC2_2_1M253 N*onsetHighC4_0_2M253 N) + (onsetHighC3_2_2M253 N*onsetHighC3_0_1M253 N-onsetHighC2_2_2M253 N*onsetHighC4_0_1M253 N)))))=onsetHighGC2_2_3M253 N := by
 unfold onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighGC2_2_3M253
 ring

theorem onsetHighGC2_2_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_2_3M253 N := by
 unfold onsetHighGC2_2_3M253
 positivity

def onsetHighGC2_2_4M253 (N : ℤ) : ℤ := ((((((((((((43032992808960*N + 4617230981529600)*N + 226856230314835968)*N + 6744796621134888960)*N + 135086983345644503040)*N + 1919378285767289733120)*N + 19832782447229755981824)*N + 150134171206961226055680)*N + 826249790750895105638400)*N + 3223678119222814282874880)*N + 8463360296256902209732608)*N + 13424034344572224665026560)*N + 9728145725589455870361600)

theorem onsetHighGC2_2_4M253_eq (N : ℤ) : ((((onsetHighC3_0_2M253 N*onsetHighC3_2_2M253 N-onsetHighC2_0_2M253 N*onsetHighC4_2_2M253 N) + (onsetHighC3_0_3M253 N*onsetHighC3_2_1M253 N-onsetHighC2_0_3M253 N*onsetHighC4_2_1M253 N)) + ((onsetHighC3_0_4M253 N*onsetHighC3_2_0M253 N-onsetHighC2_0_4M253 N*onsetHighC4_2_0M253 N) + (onsetHighC3_1_1M253 N*onsetHighC3_1_3M253 N-onsetHighC2_1_1M253 N*onsetHighC4_1_3M253 N))) + (((onsetHighC3_1_2M253 N*onsetHighC3_1_2M253 N-onsetHighC2_1_2M253 N*onsetHighC4_1_2M253 N) + (onsetHighC3_1_3M253 N*onsetHighC3_1_1M253 N-onsetHighC2_1_3M253 N*onsetHighC4_1_1M253 N)) + ((onsetHighC3_2_0M253 N*onsetHighC3_0_4M253 N-onsetHighC2_2_0M253 N*onsetHighC4_0_4M253 N) + ((onsetHighC3_2_1M253 N*onsetHighC3_0_3M253 N-onsetHighC2_2_1M253 N*onsetHighC4_0_3M253 N) + (onsetHighC3_2_2M253 N*onsetHighC3_0_2M253 N-onsetHighC2_2_2M253 N*onsetHighC4_0_2M253 N)))))=onsetHighGC2_2_4M253 N := by
 unfold onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighGC2_2_4M253
 ring

theorem onsetHighGC2_2_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_2_4M253 N := by
 unfold onsetHighGC2_2_4M253
 positivity

def onsetHighGC2_2_5M253 (N : ℤ) : ℤ := ((((((((((((4894274617344*N + 530807626137600)*N + 26353128135720960)*N + 791364953261998080)*N + 15999797573404065792)*N + 229352732739179642880)*N + 2389536095321645383680)*N + 18228196549779530711040)*N + 101033707098499175153664)*N + 396795247515668101201920)*N + 1048096293100955196456960)*N + 1671800230387930312212480)*N + 1217839204344894927667200)

theorem onsetHighGC2_2_5M253_eq (N : ℤ) : (((onsetHighC3_0_3M253 N*onsetHighC3_2_2M253 N-onsetHighC2_0_3M253 N*onsetHighC4_2_2M253 N) + ((onsetHighC3_0_4M253 N*onsetHighC3_2_1M253 N-onsetHighC2_0_4M253 N*onsetHighC4_2_1M253 N) + (onsetHighC3_1_2M253 N*onsetHighC3_1_3M253 N-onsetHighC2_1_2M253 N*onsetHighC4_1_3M253 N))) + ((onsetHighC3_1_3M253 N*onsetHighC3_1_2M253 N-onsetHighC2_1_3M253 N*onsetHighC4_1_2M253 N) + ((onsetHighC3_2_1M253 N*onsetHighC3_0_4M253 N-onsetHighC2_2_1M253 N*onsetHighC4_0_4M253 N) + (onsetHighC3_2_2M253 N*onsetHighC3_0_3M253 N-onsetHighC2_2_2M253 N*onsetHighC4_0_3M253 N))))=onsetHighGC2_2_5M253 N := by
 unfold onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighGC2_2_5M253
 ring

theorem onsetHighGC2_2_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_2_5M253 N := by
 unfold onsetHighGC2_2_5M253
 positivity

def onsetHighGC2_2_6M253 (N : ℤ) : ℤ := ((((((((((((229361319936*N + 25174254551040)*N + 1264452838096896)*N + 38397031093370880)*N + 784594438209404928)*N + 11360113306482769920)*N + 119473191236405035008)*N + 919412218866177146880)*N + 5137856151988920385536)*N + 20332111028068747837440)*N + 54085790878910803869696)*N + 86838786140763287715840)*N + 63645032375753342976000)

theorem onsetHighGC2_2_6M253_eq (N : ℤ) : ((onsetHighC3_0_4M253 N*onsetHighC3_2_2M253 N-onsetHighC2_0_4M253 N*onsetHighC4_2_2M253 N) + ((onsetHighC3_1_3M253 N*onsetHighC3_1_3M253 N-onsetHighC2_1_3M253 N*onsetHighC4_1_3M253 N) + (onsetHighC3_2_2M253 N*onsetHighC3_0_4M253 N-onsetHighC2_2_2M253 N*onsetHighC4_0_4M253 N)))=onsetHighGC2_2_6M253 N := by
 unfold onsetHighC2_0_4M253 onsetHighC2_1_3M253 onsetHighC2_2_2M253 onsetHighC3_0_4M253 onsetHighC3_1_3M253 onsetHighC3_2_2M253 onsetHighC4_0_4M253 onsetHighC4_1_3M253 onsetHighC4_2_2M253 onsetHighGC2_2_6M253
 ring

theorem onsetHighGC2_2_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_2_6M253 N := by
 unfold onsetHighGC2_2_6M253
 positivity

def onsetHighGC2_3_0M253 (N : ℤ) : ℤ := ((((((((((((468667619868672*N + 48501517354795008)*N + 2300805965596852224)*N + 66135436092160081920)*N + 1282560333506895937536)*N + 17673753594109413556224)*N + 177408023995149689290752)*N + 1306770698141934897070080)*N + 7008855524392998670958592)*N + 26690480088505496193466368)*N + 68490640374290062074445824)*N + 106323309053848693584691200)*N + 75502856008141260875366400)

theorem onsetHighGC2_3_0M253_eq (N : ℤ) : (((onsetHighC3_0_0M253 N*onsetHighC3_3_0M253 N-onsetHighC2_0_0M253 N*onsetHighC4_3_0M253 N) + (onsetHighC3_1_0M253 N*onsetHighC3_2_0M253 N-onsetHighC2_1_0M253 N*onsetHighC4_2_0M253 N)) + ((onsetHighC3_2_0M253 N*onsetHighC3_1_0M253 N-onsetHighC2_2_0M253 N*onsetHighC4_1_0M253 N) + (onsetHighC3_3_0M253 N*onsetHighC3_0_0M253 N-onsetHighC2_3_0M253 N*onsetHighC4_0_0M253 N)))=onsetHighGC2_3_0M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_1_0M253 onsetHighC2_2_0M253 onsetHighC2_3_0M253 onsetHighC3_0_0M253 onsetHighC3_1_0M253 onsetHighC3_2_0M253 onsetHighC3_3_0M253 onsetHighC4_0_0M253 onsetHighC4_1_0M253 onsetHighC4_2_0M253 onsetHighC4_3_0M253 onsetHighGC2_3_0M253
 ring

theorem onsetHighGC2_3_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_3_0M253 N := by
 unfold onsetHighGC2_3_0M253
 positivity

def onsetHighGC2_3_1M253 (N : ℤ) : ℤ := ((((((((((((687215134900224*N + 71621497772310528)*N + 3420580527898361856)*N + 98951635191610736640)*N + 1930419660096386629632)*N + 26748142715188961869824)*N + 269856041541523635437568)*N + 1996911038041208169431040)*N + 10755254377731463243628544)*N + 41111969257181329500930048)*N + 105856517868686443014782976)*N + 164830928103841783566827520)*N + 117370932633529936891084800)

theorem onsetHighGC2_3_1M253_eq (N : ℤ) : ((((onsetHighC3_0_0M253 N*onsetHighC3_3_1M253 N-onsetHighC2_0_0M253 N*onsetHighC4_3_1M253 N) + (onsetHighC3_0_1M253 N*onsetHighC3_3_0M253 N-onsetHighC2_0_1M253 N*onsetHighC4_3_0M253 N)) + ((onsetHighC3_1_0M253 N*onsetHighC3_2_1M253 N-onsetHighC2_1_0M253 N*onsetHighC4_2_1M253 N) + (onsetHighC3_1_1M253 N*onsetHighC3_2_0M253 N-onsetHighC2_1_1M253 N*onsetHighC4_2_0M253 N))) + (((onsetHighC3_2_0M253 N*onsetHighC3_1_1M253 N-onsetHighC2_2_0M253 N*onsetHighC4_1_1M253 N) + (onsetHighC3_2_1M253 N*onsetHighC3_1_0M253 N-onsetHighC2_2_1M253 N*onsetHighC4_1_0M253 N)) + ((onsetHighC3_3_0M253 N*onsetHighC3_0_1M253 N-onsetHighC2_3_0M253 N*onsetHighC4_0_1M253 N) + (onsetHighC3_3_1M253 N*onsetHighC3_0_0M253 N-onsetHighC2_3_1M253 N*onsetHighC4_0_0M253 N))))=onsetHighGC2_3_1M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighGC2_3_1M253
 ring

theorem onsetHighGC2_3_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_3_1M253 N := by
 unfold onsetHighGC2_3_1M253
 positivity

def onsetHighGC2_3_2M253 (N : ℤ) : ℤ := ((((((((((((399215532441600*N + 41941915725201408)*N + 2018640913999331328)*N + 58824876663137894400)*N + 1155498026363309260800)*N + 16113117792947949010944)*N + 163520813861902859894784)*N + 1216591797788167168327680)*N + 6584923646511875378380800)*N + 25284364748740907209064448)*N + 65369909721984381288972288)*N + 102167383187343899539537920)*N + 72995918131243483162214400)

theorem onsetHighGC2_3_2M253_eq (N : ℤ) : ((((onsetHighC3_0_1M253 N*onsetHighC3_3_1M253 N-onsetHighC2_0_1M253 N*onsetHighC4_3_1M253 N) + (onsetHighC3_0_2M253 N*onsetHighC3_3_0M253 N-onsetHighC2_0_2M253 N*onsetHighC4_3_0M253 N)) + ((onsetHighC3_1_0M253 N*onsetHighC3_2_2M253 N-onsetHighC2_1_0M253 N*onsetHighC4_2_2M253 N) + ((onsetHighC3_1_1M253 N*onsetHighC3_2_1M253 N-onsetHighC2_1_1M253 N*onsetHighC4_2_1M253 N) + (onsetHighC3_1_2M253 N*onsetHighC3_2_0M253 N-onsetHighC2_1_2M253 N*onsetHighC4_2_0M253 N)))) + (((onsetHighC3_2_0M253 N*onsetHighC3_1_2M253 N-onsetHighC2_2_0M253 N*onsetHighC4_1_2M253 N) + (onsetHighC3_2_1M253 N*onsetHighC3_1_1M253 N-onsetHighC2_2_1M253 N*onsetHighC4_1_1M253 N)) + ((onsetHighC3_2_2M253 N*onsetHighC3_1_0M253 N-onsetHighC2_2_2M253 N*onsetHighC4_1_0M253 N) + ((onsetHighC3_3_0M253 N*onsetHighC3_0_2M253 N-onsetHighC2_3_0M253 N*onsetHighC4_0_2M253 N) + (onsetHighC3_3_1M253 N*onsetHighC3_0_1M253 N-onsetHighC2_3_1M253 N*onsetHighC4_0_1M253 N)))))=onsetHighGC2_3_2M253 N := by
 unfold onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighGC2_3_2M253
 ring

theorem onsetHighGC2_3_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_3_2M253 N := by
 unfold onsetHighGC2_3_2M253
 positivity

def onsetHighGC2_3_3M253 (N : ℤ) : ℤ := ((((((((((((114754647490560*N + 12166592766935040)*N + 590738764515508224)*N + 17359030475670159360)*N + 343674390476803276800)*N + 4827736977158244925440)*N + 49327917127442840420352)*N + 369312649132718437171200)*N + 2010538348444223172771840)*N + 7761053479870611109969920)*N + 20163314949257355308826624)*N + 31654450697827556972298240)*N + 22708977998838039517593600)

theorem onsetHighGC2_3_3M253_eq (N : ℤ) : ((((onsetHighC3_0_2M253 N*onsetHighC3_3_1M253 N-onsetHighC2_0_2M253 N*onsetHighC4_3_1M253 N) + (onsetHighC3_0_3M253 N*onsetHighC3_3_0M253 N-onsetHighC2_0_3M253 N*onsetHighC4_3_0M253 N)) + ((onsetHighC3_1_1M253 N*onsetHighC3_2_2M253 N-onsetHighC2_1_1M253 N*onsetHighC4_2_2M253 N) + ((onsetHighC3_1_2M253 N*onsetHighC3_2_1M253 N-onsetHighC2_1_2M253 N*onsetHighC4_2_1M253 N) + (onsetHighC3_1_3M253 N*onsetHighC3_2_0M253 N-onsetHighC2_1_3M253 N*onsetHighC4_2_0M253 N)))) + (((onsetHighC3_2_0M253 N*onsetHighC3_1_3M253 N-onsetHighC2_2_0M253 N*onsetHighC4_1_3M253 N) + (onsetHighC3_2_1M253 N*onsetHighC3_1_2M253 N-onsetHighC2_2_1M253 N*onsetHighC4_1_2M253 N)) + ((onsetHighC3_2_2M253 N*onsetHighC3_1_1M253 N-onsetHighC2_2_2M253 N*onsetHighC4_1_1M253 N) + ((onsetHighC3_3_0M253 N*onsetHighC3_0_3M253 N-onsetHighC2_3_0M253 N*onsetHighC4_0_3M253 N) + (onsetHighC3_3_1M253 N*onsetHighC3_0_2M253 N-onsetHighC2_3_1M253 N*onsetHighC4_0_2M253 N)))))=onsetHighGC2_3_3M253 N := by
 unfold onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighGC2_3_3M253
 ring

theorem onsetHighGC2_3_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_3_3M253 N := by
 unfold onsetHighGC2_3_3M253
 positivity

def onsetHighGC2_3_4M253 (N : ℤ) : ℤ := ((((((((((((16314248724480*N + 1747506010521600)*N + 85694359504158720)*N + 2542096083195002880)*N + 50780332039250903040)*N + 719334724911476244480)*N + 7407517403034282885120)*N + 55862959806877689446400)*N + 306167046976051949076480)*N + 1189219061763710708613120)*N + 3107357181591467088936960)*N + 4904109643943449507921920)*N + 3535433890304594116608000)

theorem onsetHighGC2_3_4M253_eq (N : ℤ) : ((((onsetHighC3_0_3M253 N*onsetHighC3_3_1M253 N-onsetHighC2_0_3M253 N*onsetHighC4_3_1M253 N) + (onsetHighC3_0_4M253 N*onsetHighC3_3_0M253 N-onsetHighC2_0_4M253 N*onsetHighC4_3_0M253 N)) + ((onsetHighC3_1_2M253 N*onsetHighC3_2_2M253 N-onsetHighC2_1_2M253 N*onsetHighC4_2_2M253 N) + (onsetHighC3_1_3M253 N*onsetHighC3_2_1M253 N-onsetHighC2_1_3M253 N*onsetHighC4_2_1M253 N))) + (((onsetHighC3_2_1M253 N*onsetHighC3_1_3M253 N-onsetHighC2_2_1M253 N*onsetHighC4_1_3M253 N) + (onsetHighC3_2_2M253 N*onsetHighC3_1_2M253 N-onsetHighC2_2_2M253 N*onsetHighC4_1_2M253 N)) + ((onsetHighC3_3_0M253 N*onsetHighC3_0_4M253 N-onsetHighC2_3_0M253 N*onsetHighC4_0_4M253 N) + (onsetHighC3_3_1M253 N*onsetHighC3_0_3M253 N-onsetHighC2_3_1M253 N*onsetHighC4_0_3M253 N))))=onsetHighGC2_3_4M253 N := by
 unfold onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighGC2_3_4M253
 ring

theorem onsetHighGC2_3_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_3_4M253 N := by
 unfold onsetHighGC2_3_4M253
 positivity

def onsetHighGC2_3_5M253 (N : ℤ) : ℤ := ((((((((((((917445279744*N + 99402236559360)*N + 4928899720937472)*N + 147777289684254720)*N + 2981890426401718272)*N + 42643401551653109760)*N + 443053971725760331776)*N + 3369087522129169612800)*N + 18608053450686892867584)*N + 72798153050837397012480)*N + 191488085652587808817152)*N + 304084502157392876666880)*N + 220479248879701681766400)

theorem onsetHighGC2_3_5M253_eq (N : ℤ) : (((onsetHighC3_0_4M253 N*onsetHighC3_3_1M253 N-onsetHighC2_0_4M253 N*onsetHighC4_3_1M253 N) + (onsetHighC3_1_3M253 N*onsetHighC3_2_2M253 N-onsetHighC2_1_3M253 N*onsetHighC4_2_2M253 N)) + ((onsetHighC3_2_2M253 N*onsetHighC3_1_3M253 N-onsetHighC2_2_2M253 N*onsetHighC4_1_3M253 N) + (onsetHighC3_3_1M253 N*onsetHighC3_0_4M253 N-onsetHighC2_3_1M253 N*onsetHighC4_0_4M253 N)))=onsetHighGC2_3_5M253 N := by
 unfold onsetHighC2_0_4M253 onsetHighC2_1_3M253 onsetHighC2_2_2M253 onsetHighC2_3_1M253 onsetHighC3_0_4M253 onsetHighC3_1_3M253 onsetHighC3_2_2M253 onsetHighC3_3_1M253 onsetHighC4_0_4M253 onsetHighC4_1_3M253 onsetHighC4_2_2M253 onsetHighC4_3_1M253 onsetHighGC2_3_5M253
 ring

theorem onsetHighGC2_3_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_3_5M253 N := by
 unfold onsetHighGC2_3_5M253
 positivity

def onsetHighGC2_4_0M253 (N : ℤ) : ℤ := ((((((((((((343607567450112*N + 35413666836774912)*N + 1672736948248117248)*N + 47863174878745067520)*N + 923712834206554914816)*N + 12663269296413276635136)*N + 126419693283804435185664)*N + 925843322560948296744960)*N + 4935866221598295743004672)*N + 18678594924307673961725952)*N + 47620894795329306532773888)*N + 73433628339593529702481920)*N + 51792539688979196844441600)

theorem onsetHighGC2_4_0M253_eq (N : ℤ) : (((onsetHighC3_0_0M253 N*onsetHighC3_4_0M253 N-onsetHighC2_0_0M253 N*onsetHighC4_4_0M253 N) + (onsetHighC3_1_0M253 N*onsetHighC3_3_0M253 N-onsetHighC2_1_0M253 N*onsetHighC4_3_0M253 N)) + ((onsetHighC3_2_0M253 N*onsetHighC3_2_0M253 N-onsetHighC2_2_0M253 N*onsetHighC4_2_0M253 N) + ((onsetHighC3_3_0M253 N*onsetHighC3_1_0M253 N-onsetHighC2_3_0M253 N*onsetHighC4_1_0M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_0_0M253 N-onsetHighC2_4_0M253 N*onsetHighC4_0_0M253 N))))=onsetHighGC2_4_0M253 N := by
 unfold onsetHighC2_0_0M253 onsetHighC2_1_0M253 onsetHighC2_2_0M253 onsetHighC2_3_0M253 onsetHighC2_4_0M253 onsetHighC3_0_0M253 onsetHighC3_1_0M253 onsetHighC3_2_0M253 onsetHighC3_3_0M253 onsetHighC3_4_0M253 onsetHighC4_0_0M253 onsetHighC4_1_0M253 onsetHighC4_2_0M253 onsetHighC4_3_0M253 onsetHighC4_4_0M253 onsetHighGC2_4_0M253
 ring

theorem onsetHighGC2_4_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_4_0M253 N := by
 unfold onsetHighGC2_4_0M253
 positivity

def onsetHighGC2_4_1M253 (N : ℤ) : ℤ := ((((((((((((399215532441600*N + 41458472797077504)*N + 1972577853102882816)*N + 56833242281961062400)*N + 1103929016757151334400)*N + 15224802867633567301632)*N + 152833480441371658027008)*N + 1124965594111101449011200)*N + 6025193307321100428902400)*N + 22896870365762843051556864)*N + 58598226955496917337112576)*N + 90673579211373133981286400)*N + 64151859790307840753664000)

theorem onsetHighGC2_4_1M253_eq (N : ℤ) : ((((onsetHighC3_0_1M253 N*onsetHighC3_4_0M253 N-onsetHighC2_0_1M253 N*onsetHighC4_4_0M253 N) + (onsetHighC3_1_0M253 N*onsetHighC3_3_1M253 N-onsetHighC2_1_0M253 N*onsetHighC4_3_1M253 N)) + ((onsetHighC3_1_1M253 N*onsetHighC3_3_0M253 N-onsetHighC2_1_1M253 N*onsetHighC4_3_0M253 N) + (onsetHighC3_2_0M253 N*onsetHighC3_2_1M253 N-onsetHighC2_2_0M253 N*onsetHighC4_2_1M253 N))) + (((onsetHighC3_2_1M253 N*onsetHighC3_2_0M253 N-onsetHighC2_2_1M253 N*onsetHighC4_2_0M253 N) + (onsetHighC3_3_0M253 N*onsetHighC3_1_1M253 N-onsetHighC2_3_0M253 N*onsetHighC4_1_1M253 N)) + ((onsetHighC3_3_1M253 N*onsetHighC3_1_0M253 N-onsetHighC2_3_1M253 N*onsetHighC4_1_0M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_0_1M253 N-onsetHighC2_4_0M253 N*onsetHighC4_0_1M253 N))))=onsetHighGC2_4_1M253 N := by
 unfold onsetHighC2_0_1M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_0_1M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_0_1M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighGC2_4_1M253
 ring

theorem onsetHighGC2_4_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_4_1M253 N := by
 unfold onsetHighGC2_4_1M253
 positivity

def onsetHighGC2_4_2M253 (N : ℤ) : ℤ := ((((((((((((172131971235840*N + 18030854374686720)*N + 865057160835366912)*N + 25121082350418001920)*N + 491581767186036817920)*N + 6826639658107372830720)*N + 68969047986437812125696)*N + 510668850521954050375680)*N + 2749970738390452662435840)*N + 10502534222363963055144960)*N + 27001028011894036016136192)*N + 41955147367268156021145600)*N + 29796649621585325221478400)

theorem onsetHighGC2_4_2M253_eq (N : ℤ) : ((((onsetHighC3_0_2M253 N*onsetHighC3_4_0M253 N-onsetHighC2_0_2M253 N*onsetHighC4_4_0M253 N) + (onsetHighC3_1_1M253 N*onsetHighC3_3_1M253 N-onsetHighC2_1_1M253 N*onsetHighC4_3_1M253 N)) + ((onsetHighC3_1_2M253 N*onsetHighC3_3_0M253 N-onsetHighC2_1_2M253 N*onsetHighC4_3_0M253 N) + (onsetHighC3_2_0M253 N*onsetHighC3_2_2M253 N-onsetHighC2_2_0M253 N*onsetHighC4_2_2M253 N))) + (((onsetHighC3_2_1M253 N*onsetHighC3_2_1M253 N-onsetHighC2_2_1M253 N*onsetHighC4_2_1M253 N) + (onsetHighC3_2_2M253 N*onsetHighC3_2_0M253 N-onsetHighC2_2_2M253 N*onsetHighC4_2_0M253 N)) + ((onsetHighC3_3_0M253 N*onsetHighC3_1_2M253 N-onsetHighC2_3_0M253 N*onsetHighC4_1_2M253 N) + ((onsetHighC3_3_1M253 N*onsetHighC3_1_1M253 N-onsetHighC2_3_1M253 N*onsetHighC4_1_1M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_0_2M253 N-onsetHighC2_4_0M253 N*onsetHighC4_0_2M253 N)))))=onsetHighGC2_4_2M253 N := by
 unfold onsetHighC2_0_2M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_0_2M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_0_2M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighGC2_4_2M253
 ring

theorem onsetHighGC2_4_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_4_2M253 N := by
 unfold onsetHighGC2_4_2M253
 positivity

def onsetHighGC2_4_3M253 (N : ℤ) : ℤ := ((((((((((((32628497448960*N + 3451306534502400)*N + 167146110635212800)*N + 4897563737944227840)*N + 96651056987882127360)*N + 1352859814001466408960)*N + 13768867340340001505280)*N + 102647667494034824232960)*N + 556262953510100997242880)*N + 2136865092888869394186240)*N + 5523272576499676140011520)*N + 8624845877273149715251200)*N + 6153397472294285849395200)

theorem onsetHighGC2_4_3M253_eq (N : ℤ) : ((((onsetHighC3_0_3M253 N*onsetHighC3_4_0M253 N-onsetHighC2_0_3M253 N*onsetHighC4_4_0M253 N) + (onsetHighC3_1_2M253 N*onsetHighC3_3_1M253 N-onsetHighC2_1_2M253 N*onsetHighC4_3_1M253 N)) + ((onsetHighC3_1_3M253 N*onsetHighC3_3_0M253 N-onsetHighC2_1_3M253 N*onsetHighC4_3_0M253 N) + (onsetHighC3_2_1M253 N*onsetHighC3_2_2M253 N-onsetHighC2_2_1M253 N*onsetHighC4_2_2M253 N))) + (((onsetHighC3_2_2M253 N*onsetHighC3_2_1M253 N-onsetHighC2_2_2M253 N*onsetHighC4_2_1M253 N) + (onsetHighC3_3_0M253 N*onsetHighC3_1_3M253 N-onsetHighC2_3_0M253 N*onsetHighC4_1_3M253 N)) + ((onsetHighC3_3_1M253 N*onsetHighC3_1_2M253 N-onsetHighC2_3_1M253 N*onsetHighC4_1_2M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_0_3M253 N-onsetHighC2_4_0M253 N*onsetHighC4_0_3M253 N))))=onsetHighGC2_4_3M253 N := by
 unfold onsetHighC2_0_3M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_0_3M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_0_3M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighGC2_4_3M253
 ring

theorem onsetHighGC2_4_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_4_3M253 N := by
 unfold onsetHighGC2_4_3M253
 positivity

def onsetHighGC2_4_4M253 (N : ℤ) : ℤ := ((((((((((((2293613199360*N + 245268637286400)*N + 12004396263014400)*N + 355309988924620800)*N + 7079193886190469120)*N + 99984165891625451520)*N + 1026184142822013665280)*N + 7710385400925207920640)*N + 42088872007311662776320)*N + 162778404319628773294080)*N + 423384614030227624427520)*N + 664982415701806098677760)*N + 476991475010046414028800)

theorem onsetHighGC2_4_4M253_eq (N : ℤ) : (((onsetHighC3_0_4M253 N*onsetHighC3_4_0M253 N-onsetHighC2_0_4M253 N*onsetHighC4_4_0M253 N) + (onsetHighC3_1_3M253 N*onsetHighC3_3_1M253 N-onsetHighC2_1_3M253 N*onsetHighC4_3_1M253 N)) + ((onsetHighC3_2_2M253 N*onsetHighC3_2_2M253 N-onsetHighC2_2_2M253 N*onsetHighC4_2_2M253 N) + ((onsetHighC3_3_1M253 N*onsetHighC3_1_3M253 N-onsetHighC2_3_1M253 N*onsetHighC4_1_3M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_0_4M253 N-onsetHighC2_4_0M253 N*onsetHighC4_0_4M253 N))))=onsetHighGC2_4_4M253 N := by
 unfold onsetHighC2_0_4M253 onsetHighC2_1_3M253 onsetHighC2_2_2M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_0_4M253 onsetHighC3_1_3M253 onsetHighC3_2_2M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_0_4M253 onsetHighC4_1_3M253 onsetHighC4_2_2M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighGC2_4_4M253
 ring

theorem onsetHighGC2_4_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_4_4M253 N := by
 unfold onsetHighGC2_4_4M253
 positivity

def onsetHighGC2_5_0M253 (N : ℤ) : ℤ := ((((((((((((159686212976640*N + 16390011947581440)*N + 770828379183120384)*N + 21955649249508065280)*N + 421673070828988661760)*N + 5751129033217073479680)*N + 57103920412737370324992)*N + 415828273877918070865920)*N + 2203716212963051647795200)*N + 8288079177945088162529280)*N + 20996109836570406327681024)*N + 32165883879746887168819200)*N + 22535568424240646455296000)

theorem onsetHighGC2_5_0M253_eq (N : ℤ) : (((onsetHighC3_1_0M253 N*onsetHighC3_4_0M253 N-onsetHighC2_1_0M253 N*onsetHighC4_4_0M253 N) + (onsetHighC3_2_0M253 N*onsetHighC3_3_0M253 N-onsetHighC2_2_0M253 N*onsetHighC4_3_0M253 N)) + ((onsetHighC3_3_0M253 N*onsetHighC3_2_0M253 N-onsetHighC2_3_0M253 N*onsetHighC4_2_0M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_1_0M253 N-onsetHighC2_4_0M253 N*onsetHighC4_1_0M253 N)))=onsetHighGC2_5_0M253 N := by
 unfold onsetHighC2_1_0M253 onsetHighC2_2_0M253 onsetHighC2_3_0M253 onsetHighC2_4_0M253 onsetHighC3_1_0M253 onsetHighC3_2_0M253 onsetHighC3_3_0M253 onsetHighC3_4_0M253 onsetHighC4_1_0M253 onsetHighC4_2_0M253 onsetHighC4_3_0M253 onsetHighC4_4_0M253 onsetHighGC2_5_0M253
 ring

theorem onsetHighGC2_5_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_5_0M253 N := by
 unfold onsetHighGC2_5_0M253
 positivity

def onsetHighGC2_5_1M253 (N : ℤ) : ℤ := ((((((((((((137705576988672*N + 14249455679176704)*N + 675417570756526080)*N + 19381191717578342400)*N + 374827862123008229376)*N + 5145446490144937869312)*N + 51397291662498579087360)*N + 376345934184229172674560)*N + 2004612696299592458698752)*N + 7574320987306479933456384)*N + 19269449630853499870248960)*N + 29635027176181138682019840)*N + 20835781253608066331443200)

theorem onsetHighGC2_5_1M253_eq (N : ℤ) : (((onsetHighC3_1_1M253 N*onsetHighC3_4_0M253 N-onsetHighC2_1_1M253 N*onsetHighC4_4_0M253 N) + ((onsetHighC3_2_0M253 N*onsetHighC3_3_1M253 N-onsetHighC2_2_0M253 N*onsetHighC4_3_1M253 N) + (onsetHighC3_2_1M253 N*onsetHighC3_3_0M253 N-onsetHighC2_2_1M253 N*onsetHighC4_3_0M253 N))) + ((onsetHighC3_3_0M253 N*onsetHighC3_2_1M253 N-onsetHighC2_3_0M253 N*onsetHighC4_2_1M253 N) + ((onsetHighC3_3_1M253 N*onsetHighC3_2_0M253 N-onsetHighC2_3_1M253 N*onsetHighC4_2_0M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_1_1M253 N-onsetHighC2_4_0M253 N*onsetHighC4_1_1M253 N))))=onsetHighGC2_5_1M253 N := by
 unfold onsetHighC2_1_1M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_1_1M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_1_1M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighGC2_5_1M253
 ring

theorem onsetHighGC2_5_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_5_1M253 N := by
 unfold onsetHighGC2_5_1M253
 positivity

def onsetHighGC2_5_2M253 (N : ℤ) : ℤ := ((((((((((((39154196938752*N + 4089121257553920)*N + 195551634942590976)*N + 5658974707274219520)*N + 110317386876422455296)*N + 1525687107724435783680)*N + 15345695818488587747328)*N + 113087792086175192186880)*N + 605937955912432709271552)*N + 2302020069639223010918400)*N + 5885915035078967842308096)*N + 9093993124593596379955200)*N + 6421005630712945469030400)

theorem onsetHighGC2_5_2M253_eq (N : ℤ) : (((onsetHighC3_1_2M253 N*onsetHighC3_4_0M253 N-onsetHighC2_1_2M253 N*onsetHighC4_4_0M253 N) + ((onsetHighC3_2_1M253 N*onsetHighC3_3_1M253 N-onsetHighC2_2_1M253 N*onsetHighC4_3_1M253 N) + (onsetHighC3_2_2M253 N*onsetHighC3_3_0M253 N-onsetHighC2_2_2M253 N*onsetHighC4_3_0M253 N))) + ((onsetHighC3_3_0M253 N*onsetHighC3_2_2M253 N-onsetHighC2_3_0M253 N*onsetHighC4_2_2M253 N) + ((onsetHighC3_3_1M253 N*onsetHighC3_2_1M253 N-onsetHighC2_3_1M253 N*onsetHighC4_2_1M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_1_2M253 N-onsetHighC2_4_0M253 N*onsetHighC4_1_2M253 N))))=onsetHighGC2_5_2M253 N := by
 unfold onsetHighC2_1_2M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_1_2M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_1_2M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighGC2_5_2M253
 ring

theorem onsetHighGC2_5_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_5_2M253 N := by
 unfold onsetHighGC2_5_2M253
 positivity

def onsetHighGC2_5_3M253 (N : ℤ) : ℤ := ((((((((((((3669781118976*N + 387250693079040)*N + 18705550820769792)*N + 546503730250383360)*N + 10750233729520631808)*N + 149939989247573360640)*N + 1520105394990776057856)*N + 11284949307462805094400)*N + 60880704572797147938816)*N + 232761487460941713899520)*N + 598636264619736670666752)*N + 929954242365892358307840)*N + 659923342014046666752000)

theorem onsetHighGC2_5_3M253_eq (N : ℤ) : (((onsetHighC3_1_3M253 N*onsetHighC3_4_0M253 N-onsetHighC2_1_3M253 N*onsetHighC4_4_0M253 N) + (onsetHighC3_2_2M253 N*onsetHighC3_3_1M253 N-onsetHighC2_2_2M253 N*onsetHighC4_3_1M253 N)) + ((onsetHighC3_3_1M253 N*onsetHighC3_2_2M253 N-onsetHighC2_3_1M253 N*onsetHighC4_2_2M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_1_3M253 N-onsetHighC2_4_0M253 N*onsetHighC4_1_3M253 N)))=onsetHighGC2_5_3M253 N := by
 unfold onsetHighC2_1_3M253 onsetHighC2_2_2M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_1_3M253 onsetHighC3_2_2M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_1_3M253 onsetHighC4_2_2M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighGC2_5_3M253
 ring

theorem onsetHighGC2_5_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_5_3M253 N := by
 unfold onsetHighGC2_5_3M253
 positivity

def onsetHighGC2_6_0M253 (N : ℤ) : ℤ := ((((((((((((45901858996224*N + 4691409286201344)*N + 219667347894435840)*N + 6227856227964026880)*N + 119025987585218445312)*N + 1615020219175903690752)*N + 15949121379060783513600)*N + 115484483597362129797120)*N + 608422559336207392702464)*N + 2274337939805867348066304)*N + 5725509679855427030876160)*N + 8715247668985816704614400)*N + 6066088669109358231552000)

theorem onsetHighGC2_6_0M253_eq (N : ℤ) : ((onsetHighC3_2_0M253 N*onsetHighC3_4_0M253 N-onsetHighC2_2_0M253 N*onsetHighC4_4_0M253 N) + ((onsetHighC3_3_0M253 N*onsetHighC3_3_0M253 N-onsetHighC2_3_0M253 N*onsetHighC4_3_0M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_2_0M253 N-onsetHighC2_4_0M253 N*onsetHighC4_2_0M253 N)))=onsetHighGC2_6_0M253 N := by
 unfold onsetHighC2_2_0M253 onsetHighC2_3_0M253 onsetHighC2_4_0M253 onsetHighC3_2_0M253 onsetHighC3_3_0M253 onsetHighC3_4_0M253 onsetHighC4_2_0M253 onsetHighC4_3_0M253 onsetHighC4_4_0M253 onsetHighGC2_6_0M253
 ring

theorem onsetHighGC2_6_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_6_0M253 N := by
 unfold onsetHighGC2_6_0M253
 positivity

def onsetHighGC2_6_1M253 (N : ℤ) : ℤ := ((((((((((((26102797959168*N + 2691116449136640)*N + 127063579567325184)*N + 3631095125649653760)*N + 69916560161048100864)*N + 955303825072843653120)*N + 9495337764250013663232)*N + 69166651526321185751040)*N + 366417042958503424032768)*N + 1376674410393707992842240)*N + 3481907238524213300035584)*N + 5322840502938880455475200)*N + 3719462713140386503065600)

theorem onsetHighGC2_6_1M253_eq (N : ℤ) : (((onsetHighC3_2_1M253 N*onsetHighC3_4_0M253 N-onsetHighC2_2_1M253 N*onsetHighC4_4_0M253 N) + (onsetHighC3_3_0M253 N*onsetHighC3_3_1M253 N-onsetHighC2_3_0M253 N*onsetHighC4_3_1M253 N)) + ((onsetHighC3_3_1M253 N*onsetHighC3_3_0M253 N-onsetHighC2_3_1M253 N*onsetHighC4_3_0M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_2_1M253 N-onsetHighC2_4_0M253 N*onsetHighC4_2_1M253 N)))=onsetHighGC2_6_1M253 N := by
 unfold onsetHighC2_2_1M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_2_1M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_2_1M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighGC2_6_1M253
 ring

theorem onsetHighGC2_6_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_6_1M253 N := by
 unfold onsetHighGC2_6_1M253
 positivity

def onsetHighGC2_6_2M253 (N : ℤ) : ℤ := ((((((((((((3669781118976*N + 382071566499840)*N + 18211149283590144)*N + 525123164779315200)*N + 10197420887683104768)*N + 140445351802369474560)*N + 1406369136426784653312)*N + 10315284972499029196800)*N + 54996795751039742509056)*N + 207856480535885905920000)*N + 528599326502597053906944)*N + 812176034025773452492800)*N + 570188416460115227443200)

theorem onsetHighGC2_6_2M253_eq (N : ℤ) : ((onsetHighC3_2_2M253 N*onsetHighC3_4_0M253 N-onsetHighC2_2_2M253 N*onsetHighC4_4_0M253 N) + ((onsetHighC3_3_1M253 N*onsetHighC3_3_1M253 N-onsetHighC2_3_1M253 N*onsetHighC4_3_1M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_2_2M253 N-onsetHighC2_4_0M253 N*onsetHighC4_2_2M253 N)))=onsetHighGC2_6_2M253 N := by
 unfold onsetHighC2_2_2M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_2_2M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_2_2M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighGC2_6_2M253
 ring

theorem onsetHighGC2_6_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_6_2M253 N := by
 unfold onsetHighGC2_6_2M253
 positivity

def onsetHighGC2_7_0M253 (N : ℤ) : ℤ := ((((((((((((7457942274048*N + 758900588544000)*N + 35372673521418240)*N + 998094829088931840)*N + 18980459507513032704)*N + 256196273508408360960)*N + 2516296567792116695040)*N + 18116929774607149301760)*N + 94888910089817683918848)*N + 352562923286537636413440)*N + 882062769650876201041920)*N + 1334170622910841041715200)*N + 922656380420803579084800)

theorem onsetHighGC2_7_0M253_eq (N : ℤ) : ((onsetHighC3_3_0M253 N*onsetHighC3_4_0M253 N-onsetHighC2_3_0M253 N*onsetHighC4_4_0M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_3_0M253 N-onsetHighC2_4_0M253 N*onsetHighC4_3_0M253 N))=onsetHighGC2_7_0M253 N := by
 unfold onsetHighC2_3_0M253 onsetHighC2_4_0M253 onsetHighC3_3_0M253 onsetHighC3_4_0M253 onsetHighC4_3_0M253 onsetHighC4_4_0M253 onsetHighGC2_7_0M253
 ring

theorem onsetHighGC2_7_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_7_0M253 N := by
 unfold onsetHighGC2_7_0M253
 positivity

def onsetHighGC2_7_1M253 (N : ℤ) : ℤ := ((((((((((((2097017782272*N + 215367108526080)*N + 10127902519590912)*N + 288197170283151360)*N + 5524326746041614336)*N + 75124165282313011200)*N + 742987927070353391616)*N + 5383956796672762183680)*N + 28367576402850943598592)*N + 105983221773924166533120)*N + 266507825477715882934272)*N + 405005679843824275292160)*N + 281301064582877518233600)

theorem onsetHighGC2_7_1M253_eq (N : ℤ) : ((onsetHighC3_3_1M253 N*onsetHighC3_4_0M253 N-onsetHighC2_3_1M253 N*onsetHighC4_4_0M253 N) + (onsetHighC3_4_0M253 N*onsetHighC3_3_1M253 N-onsetHighC2_4_0M253 N*onsetHighC4_3_1M253 N))=onsetHighGC2_7_1M253 N := by
 unfold onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighGC2_7_1M253
 ring

theorem onsetHighGC2_7_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_7_1M253 N := by
 unfold onsetHighGC2_7_1M253
 positivity

def onsetHighGC2_8_0M253 (N : ℤ) : ℤ := ((((((((((((524254445568*N + 53101901905920)*N + 2463370171121664)*N + 69165734575472640)*N + 1308571151760359424)*N + 17569012331021598720)*N + 171606990913485668352)*N + 1228502005382790512640)*N + 6396625358265576849408)*N + 23623815497119338332160)*N + 58739869110778183286784)*N + 88290878849322602987520)*N + 60670187061944411750400)

theorem onsetHighGC2_8_0M253_eq (N : ℤ) : (onsetHighC3_4_0M253 N*onsetHighC3_4_0M253 N-onsetHighC2_4_0M253 N*onsetHighC4_4_0M253 N)=onsetHighGC2_8_0M253 N := by
 unfold onsetHighC2_4_0M253 onsetHighC3_4_0M253 onsetHighC4_4_0M253 onsetHighGC2_8_0M253
 ring

theorem onsetHighGC2_8_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC2_8_0M253 N := by
 unfold onsetHighGC2_8_0M253
 positivity

attribute [local irreducible] onsetHighC2_0_0M253 onsetHighC2_0_1M253 onsetHighC2_0_2M253 onsetHighC2_0_3M253 onsetHighC2_0_4M253 onsetHighC2_1_0M253 onsetHighC2_1_1M253 onsetHighC2_1_2M253 onsetHighC2_1_3M253 onsetHighC2_2_0M253 onsetHighC2_2_1M253 onsetHighC2_2_2M253 onsetHighC2_3_0M253 onsetHighC2_3_1M253 onsetHighC2_4_0M253 onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253

def onsetHighCol2_2_0M253 (N R : ℤ) : ℤ := ((onsetHighC2_0_0M253 N*R^0 + onsetHighC2_0_1M253 N*R^1) + (onsetHighC2_0_2M253 N*R^2 + (onsetHighC2_0_3M253 N*R^3 + onsetHighC2_0_4M253 N*R^4)))

def onsetHighCol2_2_1M253 (N R : ℤ) : ℤ := ((onsetHighC2_1_0M253 N*R^0 + onsetHighC2_1_1M253 N*R^1) + (onsetHighC2_1_2M253 N*R^2 + onsetHighC2_1_3M253 N*R^3))

def onsetHighCol2_2_2M253 (N R : ℤ) : ℤ := (onsetHighC2_2_0M253 N*R^0 + (onsetHighC2_2_1M253 N*R^1 + onsetHighC2_2_2M253 N*R^2))

def onsetHighCol2_2_3M253 (N R : ℤ) : ℤ := (onsetHighC2_3_0M253 N*R^0 + onsetHighC2_3_1M253 N*R^1)

def onsetHighCol2_2_4M253 (N R : ℤ) : ℤ := onsetHighC2_4_0M253 N*R^0

theorem onsetHigh_cols2_2M253 (N C R : ℤ) : onsetHighV2M253 N C R=((onsetHighCol2_2_0M253 N R*C^0 + onsetHighCol2_2_1M253 N R*C^1) + (onsetHighCol2_2_2M253 N R*C^2 + (onsetHighCol2_2_3M253 N R*C^3 + onsetHighCol2_2_4M253 N R*C^4))) := by
 rw [onsetHigh_decomp2M253]
 unfold onsetHighCol2_2_0M253 onsetHighCol2_2_1M253 onsetHighCol2_2_2M253 onsetHighCol2_2_3M253 onsetHighCol2_2_4M253
 ring

def onsetHighCol2_3_0M253 (N R : ℤ) : ℤ := ((onsetHighC3_0_0M253 N*R^0 + onsetHighC3_0_1M253 N*R^1) + (onsetHighC3_0_2M253 N*R^2 + (onsetHighC3_0_3M253 N*R^3 + onsetHighC3_0_4M253 N*R^4)))

def onsetHighCol2_3_1M253 (N R : ℤ) : ℤ := ((onsetHighC3_1_0M253 N*R^0 + onsetHighC3_1_1M253 N*R^1) + (onsetHighC3_1_2M253 N*R^2 + onsetHighC3_1_3M253 N*R^3))

def onsetHighCol2_3_2M253 (N R : ℤ) : ℤ := (onsetHighC3_2_0M253 N*R^0 + (onsetHighC3_2_1M253 N*R^1 + onsetHighC3_2_2M253 N*R^2))

def onsetHighCol2_3_3M253 (N R : ℤ) : ℤ := (onsetHighC3_3_0M253 N*R^0 + onsetHighC3_3_1M253 N*R^1)

def onsetHighCol2_3_4M253 (N R : ℤ) : ℤ := onsetHighC3_4_0M253 N*R^0

theorem onsetHigh_cols2_3M253 (N C R : ℤ) : onsetHighV3M253 N C R=((onsetHighCol2_3_0M253 N R*C^0 + onsetHighCol2_3_1M253 N R*C^1) + (onsetHighCol2_3_2M253 N R*C^2 + (onsetHighCol2_3_3M253 N R*C^3 + onsetHighCol2_3_4M253 N R*C^4))) := by
 rw [onsetHigh_decomp3M253]
 unfold onsetHighCol2_3_0M253 onsetHighCol2_3_1M253 onsetHighCol2_3_2M253 onsetHighCol2_3_3M253 onsetHighCol2_3_4M253
 ring

def onsetHighCol2_4_0M253 (N R : ℤ) : ℤ := ((onsetHighC4_0_0M253 N*R^0 + onsetHighC4_0_1M253 N*R^1) + (onsetHighC4_0_2M253 N*R^2 + (onsetHighC4_0_3M253 N*R^3 + onsetHighC4_0_4M253 N*R^4)))

def onsetHighCol2_4_1M253 (N R : ℤ) : ℤ := ((onsetHighC4_1_0M253 N*R^0 + onsetHighC4_1_1M253 N*R^1) + (onsetHighC4_1_2M253 N*R^2 + onsetHighC4_1_3M253 N*R^3))

def onsetHighCol2_4_2M253 (N R : ℤ) : ℤ := (onsetHighC4_2_0M253 N*R^0 + (onsetHighC4_2_1M253 N*R^1 + onsetHighC4_2_2M253 N*R^2))

def onsetHighCol2_4_3M253 (N R : ℤ) : ℤ := (onsetHighC4_3_0M253 N*R^0 + onsetHighC4_3_1M253 N*R^1)

def onsetHighCol2_4_4M253 (N R : ℤ) : ℤ := onsetHighC4_4_0M253 N*R^0

theorem onsetHigh_cols2_4M253 (N C R : ℤ) : onsetHighV4M253 N C R=((onsetHighCol2_4_0M253 N R*C^0 + onsetHighCol2_4_1M253 N R*C^1) + (onsetHighCol2_4_2M253 N R*C^2 + (onsetHighCol2_4_3M253 N R*C^3 + onsetHighCol2_4_4M253 N R*C^4))) := by
 rw [onsetHigh_decomp4M253]
 unfold onsetHighCol2_4_0M253 onsetHighCol2_4_1M253 onsetHighCol2_4_2M253 onsetHighCol2_4_3M253 onsetHighCol2_4_4M253
 ring

def onsetHighGCol2_0M253 (N R : ℤ) : ℤ := (((onsetHighGC2_0_0M253 N*R^0 + onsetHighGC2_0_1M253 N*R^1) + (onsetHighGC2_0_2M253 N*R^2 + onsetHighGC2_0_3M253 N*R^3)) + ((onsetHighGC2_0_4M253 N*R^4 + onsetHighGC2_0_5M253 N*R^5) + (onsetHighGC2_0_6M253 N*R^6 + (onsetHighGC2_0_7M253 N*R^7 + onsetHighGC2_0_8M253 N*R^8))))

theorem onsetHighGCol2_0M253_eq (N R : ℤ) : (onsetHighCol2_3_0M253 N R*onsetHighCol2_3_0M253 N R-onsetHighCol2_2_0M253 N R*onsetHighCol2_4_0M253 N R)=onsetHighGCol2_0M253 N R := by
 unfold onsetHighGCol2_0M253 onsetHighCol2_2_0M253 onsetHighCol2_3_0M253 onsetHighCol2_4_0M253
 rw [←onsetHighGC2_0_0M253_eq,←onsetHighGC2_0_1M253_eq,←onsetHighGC2_0_2M253_eq,←onsetHighGC2_0_3M253_eq,←onsetHighGC2_0_4M253_eq,←onsetHighGC2_0_5M253_eq,←onsetHighGC2_0_6M253_eq,←onsetHighGC2_0_7M253_eq,←onsetHighGC2_0_8M253_eq]
 ring

theorem onsetHighGCol2_0M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol2_0M253 N R := by
 unfold onsetHighGCol2_0M253
 have h0 := onsetHighGC2_0_0M253_nonneg N hN
 have h1 := onsetHighGC2_0_1M253_nonneg N hN
 have h2 := onsetHighGC2_0_2M253_nonneg N hN
 have h3 := onsetHighGC2_0_3M253_nonneg N hN
 have h4 := onsetHighGC2_0_4M253_nonneg N hN
 have h5 := onsetHighGC2_0_5M253_nonneg N hN
 have h6 := onsetHighGC2_0_6M253_nonneg N hN
 have h7 := onsetHighGC2_0_7M253_nonneg N hN
 have h8 := onsetHighGC2_0_8M253_nonneg N hN
 positivity

def onsetHighGCol2_1M253 (N R : ℤ) : ℤ := (((onsetHighGC2_1_0M253 N*R^0 + onsetHighGC2_1_1M253 N*R^1) + (onsetHighGC2_1_2M253 N*R^2 + onsetHighGC2_1_3M253 N*R^3)) + ((onsetHighGC2_1_4M253 N*R^4 + onsetHighGC2_1_5M253 N*R^5) + (onsetHighGC2_1_6M253 N*R^6 + onsetHighGC2_1_7M253 N*R^7)))

theorem onsetHighGCol2_1M253_eq (N R : ℤ) : ((onsetHighCol2_3_0M253 N R*onsetHighCol2_3_1M253 N R-onsetHighCol2_2_0M253 N R*onsetHighCol2_4_1M253 N R) + (onsetHighCol2_3_1M253 N R*onsetHighCol2_3_0M253 N R-onsetHighCol2_2_1M253 N R*onsetHighCol2_4_0M253 N R))=onsetHighGCol2_1M253 N R := by
 unfold onsetHighGCol2_1M253 onsetHighCol2_2_0M253 onsetHighCol2_2_1M253 onsetHighCol2_3_0M253 onsetHighCol2_3_1M253 onsetHighCol2_4_0M253 onsetHighCol2_4_1M253
 rw [←onsetHighGC2_1_0M253_eq,←onsetHighGC2_1_1M253_eq,←onsetHighGC2_1_2M253_eq,←onsetHighGC2_1_3M253_eq,←onsetHighGC2_1_4M253_eq,←onsetHighGC2_1_5M253_eq,←onsetHighGC2_1_6M253_eq,←onsetHighGC2_1_7M253_eq]
 ring

theorem onsetHighGCol2_1M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol2_1M253 N R := by
 unfold onsetHighGCol2_1M253
 have h0 := onsetHighGC2_1_0M253_nonneg N hN
 have h1 := onsetHighGC2_1_1M253_nonneg N hN
 have h2 := onsetHighGC2_1_2M253_nonneg N hN
 have h3 := onsetHighGC2_1_3M253_nonneg N hN
 have h4 := onsetHighGC2_1_4M253_nonneg N hN
 have h5 := onsetHighGC2_1_5M253_nonneg N hN
 have h6 := onsetHighGC2_1_6M253_nonneg N hN
 have h7 := onsetHighGC2_1_7M253_nonneg N hN
 positivity

def onsetHighGCol2_2M253 (N R : ℤ) : ℤ := ((onsetHighGC2_2_0M253 N*R^0 + (onsetHighGC2_2_1M253 N*R^1 + onsetHighGC2_2_2M253 N*R^2)) + ((onsetHighGC2_2_3M253 N*R^3 + onsetHighGC2_2_4M253 N*R^4) + (onsetHighGC2_2_5M253 N*R^5 + onsetHighGC2_2_6M253 N*R^6)))

theorem onsetHighGCol2_2M253_eq (N R : ℤ) : ((onsetHighCol2_3_0M253 N R*onsetHighCol2_3_2M253 N R-onsetHighCol2_2_0M253 N R*onsetHighCol2_4_2M253 N R) + ((onsetHighCol2_3_1M253 N R*onsetHighCol2_3_1M253 N R-onsetHighCol2_2_1M253 N R*onsetHighCol2_4_1M253 N R) + (onsetHighCol2_3_2M253 N R*onsetHighCol2_3_0M253 N R-onsetHighCol2_2_2M253 N R*onsetHighCol2_4_0M253 N R)))=onsetHighGCol2_2M253 N R := by
 unfold onsetHighGCol2_2M253 onsetHighCol2_2_0M253 onsetHighCol2_2_1M253 onsetHighCol2_2_2M253 onsetHighCol2_3_0M253 onsetHighCol2_3_1M253 onsetHighCol2_3_2M253 onsetHighCol2_4_0M253 onsetHighCol2_4_1M253 onsetHighCol2_4_2M253
 rw [←onsetHighGC2_2_0M253_eq,←onsetHighGC2_2_1M253_eq,←onsetHighGC2_2_2M253_eq,←onsetHighGC2_2_3M253_eq,←onsetHighGC2_2_4M253_eq,←onsetHighGC2_2_5M253_eq,←onsetHighGC2_2_6M253_eq]
 ring

theorem onsetHighGCol2_2M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol2_2M253 N R := by
 unfold onsetHighGCol2_2M253
 have h0 := onsetHighGC2_2_0M253_nonneg N hN
 have h1 := onsetHighGC2_2_1M253_nonneg N hN
 have h2 := onsetHighGC2_2_2M253_nonneg N hN
 have h3 := onsetHighGC2_2_3M253_nonneg N hN
 have h4 := onsetHighGC2_2_4M253_nonneg N hN
 have h5 := onsetHighGC2_2_5M253_nonneg N hN
 have h6 := onsetHighGC2_2_6M253_nonneg N hN
 positivity

def onsetHighGCol2_3M253 (N R : ℤ) : ℤ := ((onsetHighGC2_3_0M253 N*R^0 + (onsetHighGC2_3_1M253 N*R^1 + onsetHighGC2_3_2M253 N*R^2)) + (onsetHighGC2_3_3M253 N*R^3 + (onsetHighGC2_3_4M253 N*R^4 + onsetHighGC2_3_5M253 N*R^5)))

theorem onsetHighGCol2_3M253_eq (N R : ℤ) : (((onsetHighCol2_3_0M253 N R*onsetHighCol2_3_3M253 N R-onsetHighCol2_2_0M253 N R*onsetHighCol2_4_3M253 N R) + (onsetHighCol2_3_1M253 N R*onsetHighCol2_3_2M253 N R-onsetHighCol2_2_1M253 N R*onsetHighCol2_4_2M253 N R)) + ((onsetHighCol2_3_2M253 N R*onsetHighCol2_3_1M253 N R-onsetHighCol2_2_2M253 N R*onsetHighCol2_4_1M253 N R) + (onsetHighCol2_3_3M253 N R*onsetHighCol2_3_0M253 N R-onsetHighCol2_2_3M253 N R*onsetHighCol2_4_0M253 N R)))=onsetHighGCol2_3M253 N R := by
 unfold onsetHighGCol2_3M253 onsetHighCol2_2_0M253 onsetHighCol2_2_1M253 onsetHighCol2_2_2M253 onsetHighCol2_2_3M253 onsetHighCol2_3_0M253 onsetHighCol2_3_1M253 onsetHighCol2_3_2M253 onsetHighCol2_3_3M253 onsetHighCol2_4_0M253 onsetHighCol2_4_1M253 onsetHighCol2_4_2M253 onsetHighCol2_4_3M253
 rw [←onsetHighGC2_3_0M253_eq,←onsetHighGC2_3_1M253_eq,←onsetHighGC2_3_2M253_eq,←onsetHighGC2_3_3M253_eq,←onsetHighGC2_3_4M253_eq,←onsetHighGC2_3_5M253_eq]
 ring

theorem onsetHighGCol2_3M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol2_3M253 N R := by
 unfold onsetHighGCol2_3M253
 have h0 := onsetHighGC2_3_0M253_nonneg N hN
 have h1 := onsetHighGC2_3_1M253_nonneg N hN
 have h2 := onsetHighGC2_3_2M253_nonneg N hN
 have h3 := onsetHighGC2_3_3M253_nonneg N hN
 have h4 := onsetHighGC2_3_4M253_nonneg N hN
 have h5 := onsetHighGC2_3_5M253_nonneg N hN
 positivity

def onsetHighGCol2_4M253 (N R : ℤ) : ℤ := ((onsetHighGC2_4_0M253 N*R^0 + onsetHighGC2_4_1M253 N*R^1) + (onsetHighGC2_4_2M253 N*R^2 + (onsetHighGC2_4_3M253 N*R^3 + onsetHighGC2_4_4M253 N*R^4)))

theorem onsetHighGCol2_4M253_eq (N R : ℤ) : (((onsetHighCol2_3_0M253 N R*onsetHighCol2_3_4M253 N R-onsetHighCol2_2_0M253 N R*onsetHighCol2_4_4M253 N R) + (onsetHighCol2_3_1M253 N R*onsetHighCol2_3_3M253 N R-onsetHighCol2_2_1M253 N R*onsetHighCol2_4_3M253 N R)) + ((onsetHighCol2_3_2M253 N R*onsetHighCol2_3_2M253 N R-onsetHighCol2_2_2M253 N R*onsetHighCol2_4_2M253 N R) + ((onsetHighCol2_3_3M253 N R*onsetHighCol2_3_1M253 N R-onsetHighCol2_2_3M253 N R*onsetHighCol2_4_1M253 N R) + (onsetHighCol2_3_4M253 N R*onsetHighCol2_3_0M253 N R-onsetHighCol2_2_4M253 N R*onsetHighCol2_4_0M253 N R))))=onsetHighGCol2_4M253 N R := by
 unfold onsetHighGCol2_4M253 onsetHighCol2_2_0M253 onsetHighCol2_2_1M253 onsetHighCol2_2_2M253 onsetHighCol2_2_3M253 onsetHighCol2_2_4M253 onsetHighCol2_3_0M253 onsetHighCol2_3_1M253 onsetHighCol2_3_2M253 onsetHighCol2_3_3M253 onsetHighCol2_3_4M253 onsetHighCol2_4_0M253 onsetHighCol2_4_1M253 onsetHighCol2_4_2M253 onsetHighCol2_4_3M253 onsetHighCol2_4_4M253
 rw [←onsetHighGC2_4_0M253_eq,←onsetHighGC2_4_1M253_eq,←onsetHighGC2_4_2M253_eq,←onsetHighGC2_4_3M253_eq,←onsetHighGC2_4_4M253_eq]
 ring

theorem onsetHighGCol2_4M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol2_4M253 N R := by
 unfold onsetHighGCol2_4M253
 have h0 := onsetHighGC2_4_0M253_nonneg N hN
 have h1 := onsetHighGC2_4_1M253_nonneg N hN
 have h2 := onsetHighGC2_4_2M253_nonneg N hN
 have h3 := onsetHighGC2_4_3M253_nonneg N hN
 have h4 := onsetHighGC2_4_4M253_nonneg N hN
 positivity

def onsetHighGCol2_5M253 (N R : ℤ) : ℤ := ((onsetHighGC2_5_0M253 N*R^0 + onsetHighGC2_5_1M253 N*R^1) + (onsetHighGC2_5_2M253 N*R^2 + onsetHighGC2_5_3M253 N*R^3))

theorem onsetHighGCol2_5M253_eq (N R : ℤ) : (((onsetHighCol2_3_1M253 N R*onsetHighCol2_3_4M253 N R-onsetHighCol2_2_1M253 N R*onsetHighCol2_4_4M253 N R) + (onsetHighCol2_3_2M253 N R*onsetHighCol2_3_3M253 N R-onsetHighCol2_2_2M253 N R*onsetHighCol2_4_3M253 N R)) + ((onsetHighCol2_3_3M253 N R*onsetHighCol2_3_2M253 N R-onsetHighCol2_2_3M253 N R*onsetHighCol2_4_2M253 N R) + (onsetHighCol2_3_4M253 N R*onsetHighCol2_3_1M253 N R-onsetHighCol2_2_4M253 N R*onsetHighCol2_4_1M253 N R)))=onsetHighGCol2_5M253 N R := by
 unfold onsetHighGCol2_5M253 onsetHighCol2_2_1M253 onsetHighCol2_2_2M253 onsetHighCol2_2_3M253 onsetHighCol2_2_4M253 onsetHighCol2_3_1M253 onsetHighCol2_3_2M253 onsetHighCol2_3_3M253 onsetHighCol2_3_4M253 onsetHighCol2_4_1M253 onsetHighCol2_4_2M253 onsetHighCol2_4_3M253 onsetHighCol2_4_4M253
 rw [←onsetHighGC2_5_0M253_eq,←onsetHighGC2_5_1M253_eq,←onsetHighGC2_5_2M253_eq,←onsetHighGC2_5_3M253_eq]
 ring

theorem onsetHighGCol2_5M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol2_5M253 N R := by
 unfold onsetHighGCol2_5M253
 have h0 := onsetHighGC2_5_0M253_nonneg N hN
 have h1 := onsetHighGC2_5_1M253_nonneg N hN
 have h2 := onsetHighGC2_5_2M253_nonneg N hN
 have h3 := onsetHighGC2_5_3M253_nonneg N hN
 positivity

def onsetHighGCol2_6M253 (N R : ℤ) : ℤ := (onsetHighGC2_6_0M253 N*R^0 + (onsetHighGC2_6_1M253 N*R^1 + onsetHighGC2_6_2M253 N*R^2))

theorem onsetHighGCol2_6M253_eq (N R : ℤ) : ((onsetHighCol2_3_2M253 N R*onsetHighCol2_3_4M253 N R-onsetHighCol2_2_2M253 N R*onsetHighCol2_4_4M253 N R) + ((onsetHighCol2_3_3M253 N R*onsetHighCol2_3_3M253 N R-onsetHighCol2_2_3M253 N R*onsetHighCol2_4_3M253 N R) + (onsetHighCol2_3_4M253 N R*onsetHighCol2_3_2M253 N R-onsetHighCol2_2_4M253 N R*onsetHighCol2_4_2M253 N R)))=onsetHighGCol2_6M253 N R := by
 unfold onsetHighGCol2_6M253 onsetHighCol2_2_2M253 onsetHighCol2_2_3M253 onsetHighCol2_2_4M253 onsetHighCol2_3_2M253 onsetHighCol2_3_3M253 onsetHighCol2_3_4M253 onsetHighCol2_4_2M253 onsetHighCol2_4_3M253 onsetHighCol2_4_4M253
 rw [←onsetHighGC2_6_0M253_eq,←onsetHighGC2_6_1M253_eq,←onsetHighGC2_6_2M253_eq]
 ring

theorem onsetHighGCol2_6M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol2_6M253 N R := by
 unfold onsetHighGCol2_6M253
 have h0 := onsetHighGC2_6_0M253_nonneg N hN
 have h1 := onsetHighGC2_6_1M253_nonneg N hN
 have h2 := onsetHighGC2_6_2M253_nonneg N hN
 positivity

def onsetHighGCol2_7M253 (N R : ℤ) : ℤ := (onsetHighGC2_7_0M253 N*R^0 + onsetHighGC2_7_1M253 N*R^1)

theorem onsetHighGCol2_7M253_eq (N R : ℤ) : ((onsetHighCol2_3_3M253 N R*onsetHighCol2_3_4M253 N R-onsetHighCol2_2_3M253 N R*onsetHighCol2_4_4M253 N R) + (onsetHighCol2_3_4M253 N R*onsetHighCol2_3_3M253 N R-onsetHighCol2_2_4M253 N R*onsetHighCol2_4_3M253 N R))=onsetHighGCol2_7M253 N R := by
 unfold onsetHighGCol2_7M253 onsetHighCol2_2_3M253 onsetHighCol2_2_4M253 onsetHighCol2_3_3M253 onsetHighCol2_3_4M253 onsetHighCol2_4_3M253 onsetHighCol2_4_4M253
 rw [←onsetHighGC2_7_0M253_eq,←onsetHighGC2_7_1M253_eq]
 ring

theorem onsetHighGCol2_7M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol2_7M253 N R := by
 unfold onsetHighGCol2_7M253
 have h0 := onsetHighGC2_7_0M253_nonneg N hN
 have h1 := onsetHighGC2_7_1M253_nonneg N hN
 positivity

def onsetHighGCol2_8M253 (N R : ℤ) : ℤ := onsetHighGC2_8_0M253 N*R^0

theorem onsetHighGCol2_8M253_eq (N R : ℤ) : (onsetHighCol2_3_4M253 N R*onsetHighCol2_3_4M253 N R-onsetHighCol2_2_4M253 N R*onsetHighCol2_4_4M253 N R)=onsetHighGCol2_8M253 N R := by
 unfold onsetHighGCol2_8M253 onsetHighCol2_2_4M253 onsetHighCol2_3_4M253 onsetHighCol2_4_4M253
 rw [←onsetHighGC2_8_0M253_eq]
 ring

theorem onsetHighGCol2_8M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol2_8M253 N R := by
 unfold onsetHighGCol2_8M253
 have h0 := onsetHighGC2_8_0M253_nonneg N hN
 positivity

attribute [local irreducible] onsetHighCol2_2_0M253 onsetHighCol2_2_1M253 onsetHighCol2_2_2M253 onsetHighCol2_2_3M253 onsetHighCol2_2_4M253 onsetHighCol2_3_0M253 onsetHighCol2_3_1M253 onsetHighCol2_3_2M253 onsetHighCol2_3_3M253 onsetHighCol2_3_4M253 onsetHighCol2_4_0M253 onsetHighCol2_4_1M253 onsetHighCol2_4_2M253 onsetHighCol2_4_3M253 onsetHighCol2_4_4M253

theorem onsetHigh_lc2M253 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 onsetHighV2M253 N C R*onsetHighV4M253 N C R ≤ (onsetHighV3M253 N C R)^2 := by
 apply sub_nonneg.mp
 rw [onsetHigh_cols2_2M253,onsetHigh_cols2_3M253,onsetHigh_cols2_4M253]
 have he : ((onsetHighCol2_3_0M253 N R*C^0 + onsetHighCol2_3_1M253 N R*C^1) + (onsetHighCol2_3_2M253 N R*C^2 + (onsetHighCol2_3_3M253 N R*C^3 + onsetHighCol2_3_4M253 N R*C^4)))^2-((onsetHighCol2_2_0M253 N R*C^0 + onsetHighCol2_2_1M253 N R*C^1) + (onsetHighCol2_2_2M253 N R*C^2 + (onsetHighCol2_2_3M253 N R*C^3 + onsetHighCol2_2_4M253 N R*C^4)))*((onsetHighCol2_4_0M253 N R*C^0 + onsetHighCol2_4_1M253 N R*C^1) + (onsetHighCol2_4_2M253 N R*C^2 + (onsetHighCol2_4_3M253 N R*C^3 + onsetHighCol2_4_4M253 N R*C^4)))=(((onsetHighGCol2_0M253 N R*C^0 + onsetHighGCol2_1M253 N R*C^1) + (onsetHighGCol2_2M253 N R*C^2 + onsetHighGCol2_3M253 N R*C^3)) + ((onsetHighGCol2_4M253 N R*C^4 + onsetHighGCol2_5M253 N R*C^5) + (onsetHighGCol2_6M253 N R*C^6 + (onsetHighGCol2_7M253 N R*C^7 + onsetHighGCol2_8M253 N R*C^8)))) := by
  rw [←onsetHighGCol2_0M253_eq,←onsetHighGCol2_1M253_eq,←onsetHighGCol2_2M253_eq,←onsetHighGCol2_3M253_eq,←onsetHighGCol2_4M253_eq,←onsetHighGCol2_5M253_eq,←onsetHighGCol2_6M253_eq,←onsetHighGCol2_7M253_eq,←onsetHighGCol2_8M253_eq]
  ring
 rw [he]
 have h0 := onsetHighGCol2_0M253_nonneg N R hN hR
 have h1 := onsetHighGCol2_1M253_nonneg N R hN hR
 have h2 := onsetHighGCol2_2M253_nonneg N R hN hR
 have h3 := onsetHighGCol2_3M253_nonneg N R hN hR
 have h4 := onsetHighGCol2_4M253_nonneg N R hN hR
 have h5 := onsetHighGCol2_5M253_nonneg N R hN hR
 have h6 := onsetHighGCol2_6M253_nonneg N R hN hR
 have h7 := onsetHighGCol2_7M253_nonneg N R hN hR
 have h8 := onsetHighGCol2_8M253_nonneg N R hN hR
 positivity
end
end MathGKM.Markov
