import MarkovOnsetHighSplitDefsM253
/-! Machine-authored request 2532cf40. Coefficient-wise onset gap proof. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536

def onsetHighGC4_0_0M253 (N : ℤ) : ℤ := ((((((((((((39715445145600*N + 3658672420945920)*N + 154641959837761536)*N + 3965750768346071040)*N + 68726789315320872960)*N + 847976627970228879360)*N + 7638518316915978928128)*N + 50617629966395367751680)*N + 244907330634180556554240)*N + 843796589223202433925120)*N + 1965134306290202948468736)*N + 2777738849943637182382080)*N + 1802237718435101363404800)

theorem onsetHighGC4_0_0M253_eq (N : ℤ) : (onsetHighC5_0_0M253 N*onsetHighC5_0_0M253 N-onsetHighC4_0_0M253 N*onsetHighC6_0_0M253 N)=onsetHighGC4_0_0M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC5_0_0M253 onsetHighC6_0_0M253 onsetHighGC4_0_0M253
 ring

theorem onsetHighGC4_0_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_0_0M253 N := by
 unfold onsetHighGC4_0_0M253
 positivity

def onsetHighGC4_0_1M253 (N : ℤ) : ℤ := ((((((((((((95039615139840*N + 8849682453233664)*N + 377939414759768064)*N + 9789042364168273920)*N + 171272579140665999360)*N + 2132641771812851023872)*N + 19379362045344964411392)*N + 129494740533438873600000)*N + 631533194229355226726400)*N + 2192309067108907029233664)*N + 5142258333236897762770944)*N + 7317828931762455195156480)*N + 4778242271066338099200000)

theorem onsetHighGC4_0_1M253_eq (N : ℤ) : ((onsetHighC5_0_0M253 N*onsetHighC5_0_1M253 N-onsetHighC4_0_0M253 N*onsetHighC6_0_1M253 N) + (onsetHighC5_0_1M253 N*onsetHighC5_0_0M253 N-onsetHighC4_0_1M253 N*onsetHighC6_0_0M253 N))=onsetHighGC4_0_1M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighGC4_0_1M253
 ring

theorem onsetHighGC4_0_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_0_1M253 N := by
 unfold onsetHighGC4_0_1M253
 positivity

def onsetHighGC4_0_2M253 (N : ℤ) : ℤ := ((((((((((((99044387979264*N + 9324304086859776)*N + 402453945032638464)*N + 10531222337098874880)*N + 186083601107654541312)*N + 2339134201496291770368)*N + 21450011964370508316672)*N + 144585266132692807188480)*N + 711024752371934675533824)*N + 2487941737202223441248256)*N + 5879991671225584849649664)*N + 8428028919139747976970240)*N + 5540797306760370742886400)

theorem onsetHighGC4_0_2M253_eq (N : ℤ) : ((onsetHighC5_0_0M253 N*onsetHighC5_0_2M253 N-onsetHighC4_0_0M253 N*onsetHighC6_0_2M253 N) + ((onsetHighC5_0_1M253 N*onsetHighC5_0_1M253 N-onsetHighC4_0_1M253 N*onsetHighC6_0_1M253 N) + (onsetHighC5_0_2M253 N*onsetHighC5_0_0M253 N-onsetHighC4_0_2M253 N*onsetHighC6_0_0M253 N)))=onsetHighGC4_0_2M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighGC4_0_2M253
 ring

theorem onsetHighGC4_0_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_0_2M253 N := by
 unfold onsetHighGC4_0_2M253
 positivity

def onsetHighGC4_0_3M253 (N : ℤ) : ℤ := ((((((((((((58583452483584*N + 5578430103945216)*N + 243451906435842048)*N + 6439104094383636480)*N + 114960917779777585152)*N + 1459608245692546940928)*N + 13514173187580129705984)*N + 91940524082047219138560)*N + 456171126240156924248064)*N + 1609837174957198724038656)*N + 3835796778994610011373568)*N + 5540908598083536070901760)*N + 3669808334196788350156800)

theorem onsetHighGC4_0_3M253_eq (N : ℤ) : (((onsetHighC5_0_0M253 N*onsetHighC5_0_3M253 N-onsetHighC4_0_0M253 N*onsetHighC6_0_3M253 N) + (onsetHighC5_0_1M253 N*onsetHighC5_0_2M253 N-onsetHighC4_0_1M253 N*onsetHighC6_0_2M253 N)) + ((onsetHighC5_0_2M253 N*onsetHighC5_0_1M253 N-onsetHighC4_0_2M253 N*onsetHighC6_0_1M253 N) + (onsetHighC5_0_3M253 N*onsetHighC5_0_0M253 N-onsetHighC4_0_3M253 N*onsetHighC6_0_0M253 N)))=onsetHighGC4_0_3M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighGC4_0_3M253
 ring

theorem onsetHighGC4_0_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_0_3M253 N := by
 unfold onsetHighGC4_0_3M253
 positivity

def onsetHighGC4_0_4M253 (N : ℤ) : ℤ := ((((((((((((21475472965632*N + 2069637510463488)*N + 91383803922087936)*N + 2444619545318522880)*N + 44128474891862409216)*N + 566289192736890814464)*N + 5297521233677859422208)*N + 36401333734760204206080)*N + 182351426348754954289152)*N + 649496412140449570357248)*N + 1561366947505393082105856)*N + 2274706064351145272279040)*N + 1518876689415681835008000)

theorem onsetHighGC4_0_4M253_eq (N : ℤ) : (((onsetHighC5_0_0M253 N*onsetHighC5_0_4M253 N-onsetHighC4_0_0M253 N*onsetHighC6_0_4M253 N) + (onsetHighC5_0_1M253 N*onsetHighC5_0_3M253 N-onsetHighC4_0_1M253 N*onsetHighC6_0_3M253 N)) + ((onsetHighC5_0_2M253 N*onsetHighC5_0_2M253 N-onsetHighC4_0_2M253 N*onsetHighC6_0_2M253 N) + ((onsetHighC5_0_3M253 N*onsetHighC5_0_1M253 N-onsetHighC4_0_3M253 N*onsetHighC6_0_1M253 N) + (onsetHighC5_0_4M253 N*onsetHighC5_0_0M253 N-onsetHighC4_0_4M253 N*onsetHighC6_0_0M253 N))))=onsetHighGC4_0_4M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighGC4_0_4M253
 ring

theorem onsetHighGC4_0_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_0_4M253 N := by
 unfold onsetHighGC4_0_4M253
 positivity

def onsetHighGC4_0_5M253 (N : ℤ) : ℤ := ((((((((((((4990194155520*N + 487096326291456)*N + 21777263445934080)*N + 589688194014904320)*N + 10771272916496547840)*N + 139823390896323821568)*N + 1322699084461953515520)*N + 9187616374826576117760)*N + 46509281027492930519040)*N + 167339048232908021170176)*N + 406217350780702949376000)*N + 597382576026048378961920)*N + 402496994605502929305600)

theorem onsetHighGC4_0_5M253_eq (N : ℤ) : (((onsetHighC5_0_1M253 N*onsetHighC5_0_4M253 N-onsetHighC4_0_1M253 N*onsetHighC6_0_4M253 N) + (onsetHighC5_0_2M253 N*onsetHighC5_0_3M253 N-onsetHighC4_0_2M253 N*onsetHighC6_0_3M253 N)) + ((onsetHighC5_0_3M253 N*onsetHighC5_0_2M253 N-onsetHighC4_0_3M253 N*onsetHighC6_0_2M253 N) + (onsetHighC5_0_4M253 N*onsetHighC5_0_1M253 N-onsetHighC4_0_4M253 N*onsetHighC6_0_1M253 N)))=onsetHighGC4_0_5M253 N := by
 unfold onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighGC4_0_5M253
 ring

theorem onsetHighGC4_0_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_0_5M253 N := by
 unfold onsetHighGC4_0_5M253
 positivity

def onsetHighGC4_0_6M253 (N : ℤ) : ℤ := ((((((((((((717216546816*N + 70970813448192)*N + 3215722203316224)*N + 88222763848826880)*N + 1632209605895651328)*N + 21453708509261070336)*N + 205426186952135933952)*N + 1443857011158417408000)*N + 7393292977554988793856)*N + 26897944356572112617472)*N + 66000413274555920154624)*N + 98072335349333643755520)*N + 66741886470158548992000)

theorem onsetHighGC4_0_6M253_eq (N : ℤ) : ((onsetHighC5_0_2M253 N*onsetHighC5_0_4M253 N-onsetHighC4_0_2M253 N*onsetHighC6_0_4M253 N) + ((onsetHighC5_0_3M253 N*onsetHighC5_0_3M253 N-onsetHighC4_0_3M253 N*onsetHighC6_0_3M253 N) + (onsetHighC5_0_4M253 N*onsetHighC5_0_2M253 N-onsetHighC4_0_4M253 N*onsetHighC6_0_2M253 N)))=onsetHighGC4_0_6M253 N := by
 unfold onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighGC4_0_6M253
 ring

theorem onsetHighGC4_0_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_0_6M253 N := by
 unfold onsetHighGC4_0_6M253
 positivity

def onsetHighGC4_0_7M253 (N : ℤ) : ℤ := ((((((((((((58265174016*N + 5850563346432)*N + 268936453029888)*N + 7483264503644160)*N + 140379635581452288)*N + 1870335672045797376)*N + 18147899791927148544)*N + 129212920588483952640)*N + 670011625432706973696)*N + 2467581786896719675392)*N + 6126982756832161824768)*N + 9209326424038362316800)*N + 6337084300827033600000)

theorem onsetHighGC4_0_7M253_eq (N : ℤ) : ((onsetHighC5_0_3M253 N*onsetHighC5_0_4M253 N-onsetHighC4_0_3M253 N*onsetHighC6_0_4M253 N) + (onsetHighC5_0_4M253 N*onsetHighC5_0_3M253 N-onsetHighC4_0_4M253 N*onsetHighC6_0_3M253 N))=onsetHighGC4_0_7M253 N := by
 unfold onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighGC4_0_7M253
 ring

theorem onsetHighGC4_0_7M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_0_7M253 N := by
 unfold onsetHighGC4_0_7M253
 positivity

def onsetHighGC4_0_8M253 (N : ℤ) : ℤ := ((((((((((((2047868928*N + 208882630656)*N + 9751819714560)*N + 275527882506240)*N + 5247009751302144)*N + 70948558959280128)*N + 698454558395596800)*N + 5043894134243328000)*N + 26517983435335139328)*N + 98984604088772591616)*N + 249006614967814717440)*N + 379036757233772789760)*N + 264024800540334489600)

theorem onsetHighGC4_0_8M253_eq (N : ℤ) : (onsetHighC5_0_4M253 N*onsetHighC5_0_4M253 N-onsetHighC4_0_4M253 N*onsetHighC6_0_4M253 N)=onsetHighGC4_0_8M253 N := by
 unfold onsetHighC4_0_4M253 onsetHighC5_0_4M253 onsetHighC6_0_4M253 onsetHighGC4_0_8M253
 ring

theorem onsetHighGC4_0_8M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_0_8M253 N := by
 unfold onsetHighGC4_0_8M253
 positivity

def onsetHighGC4_1_0M253 (N : ℤ) : ℤ := ((((((((((((190079230279680*N + 17503213414514688)*N + 739313284288610304)*N + 18941621952860651520)*N + 327859805625620889600)*N + 4039175130322786320384)*N + 36319337845896107261952)*N + 240171527372312629739520)*N + 1159262064396297602334720)*N + 3983327454513282459107328)*N + 9249048894420892447801344)*N + 13030522259467349924904960)*N + 8424006516983148753715200)

theorem onsetHighGC4_1_0M253_eq (N : ℤ) : ((onsetHighC5_0_0M253 N*onsetHighC5_1_0M253 N-onsetHighC4_0_0M253 N*onsetHighC6_1_0M253 N) + (onsetHighC5_1_0M253 N*onsetHighC5_0_0M253 N-onsetHighC4_1_0M253 N*onsetHighC6_0_0M253 N))=onsetHighGC4_1_0M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_1_0M253 onsetHighC5_0_0M253 onsetHighC5_1_0M253 onsetHighC6_0_0M253 onsetHighC6_1_0M253 onsetHighGC4_1_0M253
 ring

theorem onsetHighGC4_1_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_1_0M253 N := by
 unfold onsetHighGC4_1_0M253
 positivity

def onsetHighGC4_1_1M253 (N : ℤ) : ℤ := ((((((((((((396177551917056*N + 36875037201924096)*N + 1573748334970011648)*N + 40723661372648325120)*N + 711655737790235148288)*N + 8848195726983580090368)*N + 80261593387810602614784)*N + 535213192124013045350400)*N + 2604058493488878046150656)*N + 9015895586702042469236736)*N + 21085600446465018867744768)*N + 29909708761276107189780480)*N + 19461210863541374759731200)

theorem onsetHighGC4_1_1M253_eq (N : ℤ) : (((onsetHighC5_0_0M253 N*onsetHighC5_1_1M253 N-onsetHighC4_0_0M253 N*onsetHighC6_1_1M253 N) + (onsetHighC5_0_1M253 N*onsetHighC5_1_0M253 N-onsetHighC4_0_1M253 N*onsetHighC6_1_0M253 N)) + ((onsetHighC5_1_0M253 N*onsetHighC5_0_1M253 N-onsetHighC4_1_0M253 N*onsetHighC6_0_1M253 N) + (onsetHighC5_1_1M253 N*onsetHighC5_0_0M253 N-onsetHighC4_1_1M253 N*onsetHighC6_0_0M253 N)))=onsetHighGC4_1_1M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighGC4_1_1M253
 ring

theorem onsetHighGC4_1_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_1_1M253 N := by
 unfold onsetHighGC4_1_1M253
 positivity

def onsetHighGC4_1_2M253 (N : ℤ) : ℤ := ((((((((((((351500714901504*N + 33081468880158720)*N + 1427074173351493632)*N + 37312811295414681600)*N + 658597608261389647872)*N + 8267641053055061852160)*N + 75691638402774866067456)*N + 509232389730656916602880)*N + 2498760640302015504973824)*N + 8721746336043392166789120)*N + 20555972857628435106496512)*N + 29373793361829761697054720)*N + 19246593605795846612582400)

theorem onsetHighGC4_1_2M253_eq (N : ℤ) : (((onsetHighC5_0_0M253 N*onsetHighC5_1_2M253 N-onsetHighC4_0_0M253 N*onsetHighC6_1_2M253 N) + ((onsetHighC5_0_1M253 N*onsetHighC5_1_1M253 N-onsetHighC4_0_1M253 N*onsetHighC6_1_1M253 N) + (onsetHighC5_0_2M253 N*onsetHighC5_1_0M253 N-onsetHighC4_0_2M253 N*onsetHighC6_1_0M253 N))) + ((onsetHighC5_1_0M253 N*onsetHighC5_0_2M253 N-onsetHighC4_1_0M253 N*onsetHighC6_0_2M253 N) + ((onsetHighC5_1_1M253 N*onsetHighC5_0_1M253 N-onsetHighC4_1_1M253 N*onsetHighC6_0_1M253 N) + (onsetHighC5_1_2M253 N*onsetHighC5_0_0M253 N-onsetHighC4_1_2M253 N*onsetHighC6_0_0M253 N))))=onsetHighGC4_1_2M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighGC4_1_2M253
 ring

theorem onsetHighGC4_1_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_1_2M253 N := by
 unfold onsetHighGC4_1_2M253
 positivity

def onsetHighGC4_1_3M253 (N : ℤ) : ℤ := ((((((((((((171803783725056*N + 16358559059017728)*N + 713694508738412544)*N + 18865947559046676480)*N + 336544635300398235648)*N + 4268261524636034924544)*N + 39464577945809329324032)*N + 268044880110491365539840)*N + 1327359991030614749085696)*N + 4673905123548810946019328)*N + 11108775900995994083917824)*N + 16002183728248446715822080)*N + 10565835998654603132928000)

theorem onsetHighGC4_1_3M253_eq (N : ℤ) : ((((onsetHighC5_0_0M253 N*onsetHighC5_1_3M253 N-onsetHighC4_0_0M253 N*onsetHighC6_1_3M253 N) + (onsetHighC5_0_1M253 N*onsetHighC5_1_2M253 N-onsetHighC4_0_1M253 N*onsetHighC6_1_2M253 N)) + ((onsetHighC5_0_2M253 N*onsetHighC5_1_1M253 N-onsetHighC4_0_2M253 N*onsetHighC6_1_1M253 N) + (onsetHighC5_0_3M253 N*onsetHighC5_1_0M253 N-onsetHighC4_0_3M253 N*onsetHighC6_1_0M253 N))) + (((onsetHighC5_1_0M253 N*onsetHighC5_0_3M253 N-onsetHighC4_1_0M253 N*onsetHighC6_0_3M253 N) + (onsetHighC5_1_1M253 N*onsetHighC5_0_2M253 N-onsetHighC4_1_1M253 N*onsetHighC6_0_2M253 N)) + ((onsetHighC5_1_2M253 N*onsetHighC5_0_1M253 N-onsetHighC4_1_2M253 N*onsetHighC6_0_1M253 N) + (onsetHighC5_1_3M253 N*onsetHighC5_0_0M253 N-onsetHighC4_1_3M253 N*onsetHighC6_0_0M253 N))))=onsetHighGC4_1_3M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighGC4_1_3M253
 ring

theorem onsetHighGC4_1_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_1_3M253 N := by
 unfold onsetHighGC4_1_3M253
 positivity

def onsetHighGC4_1_4M253 (N : ℤ) : ℤ := ((((((((((((49901941555200*N + 4810532896899072)*N + 212414281033973760)*N + 5681064756274790400)*N + 102500774959487385600)*N + 1314376447236768792576)*N + 12283126434521449758720)*N + 84292293582104816517120)*N + 421591742608580090265600)*N + 1498816824431291153252352)*N + 3595347162717425996267520)*N + 5225154770615172692705280)*N + 3479423867363015353958400)

theorem onsetHighGC4_1_4M253_eq (N : ℤ) : ((((onsetHighC5_0_1M253 N*onsetHighC5_1_3M253 N-onsetHighC4_0_1M253 N*onsetHighC6_1_3M253 N) + (onsetHighC5_0_2M253 N*onsetHighC5_1_2M253 N-onsetHighC4_0_2M253 N*onsetHighC6_1_2M253 N)) + ((onsetHighC5_0_3M253 N*onsetHighC5_1_1M253 N-onsetHighC4_0_3M253 N*onsetHighC6_1_1M253 N) + (onsetHighC5_0_4M253 N*onsetHighC5_1_0M253 N-onsetHighC4_0_4M253 N*onsetHighC6_1_0M253 N))) + (((onsetHighC5_1_0M253 N*onsetHighC5_0_4M253 N-onsetHighC4_1_0M253 N*onsetHighC6_0_4M253 N) + (onsetHighC5_1_1M253 N*onsetHighC5_0_3M253 N-onsetHighC4_1_1M253 N*onsetHighC6_0_3M253 N)) + ((onsetHighC5_1_2M253 N*onsetHighC5_0_2M253 N-onsetHighC4_1_2M253 N*onsetHighC6_0_2M253 N) + (onsetHighC5_1_3M253 N*onsetHighC5_0_1M253 N-onsetHighC4_1_3M253 N*onsetHighC6_0_1M253 N))))=onsetHighGC4_1_4M253 N := by
 unfold onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighGC4_1_4M253
 ring

theorem onsetHighGC4_1_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_1_4M253 N := by
 unfold onsetHighGC4_1_4M253
 positivity

def onsetHighGC4_1_5M253 (N : ℤ) : ℤ := ((((((((((((8606598561792*N + 840698022592512)*N + 37603825661509632)*N + 1018459692529090560)*N + 18602327358031527936)*N + 241402855498507616256)*N + 2282269882801762861056)*N + 15839117898793117286400)*N + 80087859321601559887872)*N + 287738531760370562629632)*N + 697277601038846472486912)*N + 1023333804124035510435840)*N + 687882334721367814963200)

theorem onsetHighGC4_1_5M253_eq (N : ℤ) : (((onsetHighC5_0_2M253 N*onsetHighC5_1_3M253 N-onsetHighC4_0_2M253 N*onsetHighC6_1_3M253 N) + ((onsetHighC5_0_3M253 N*onsetHighC5_1_2M253 N-onsetHighC4_0_3M253 N*onsetHighC6_1_2M253 N) + (onsetHighC5_0_4M253 N*onsetHighC5_1_1M253 N-onsetHighC4_0_4M253 N*onsetHighC6_1_1M253 N))) + ((onsetHighC5_1_1M253 N*onsetHighC5_0_4M253 N-onsetHighC4_1_1M253 N*onsetHighC6_0_4M253 N) + ((onsetHighC5_1_2M253 N*onsetHighC5_0_3M253 N-onsetHighC4_1_2M253 N*onsetHighC6_0_3M253 N) + (onsetHighC5_1_3M253 N*onsetHighC5_0_2M253 N-onsetHighC4_1_3M253 N*onsetHighC6_0_2M253 N))))=onsetHighGC4_1_5M253 N := by
 unfold onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighGC4_1_5M253
 ring

theorem onsetHighGC4_1_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_1_5M253 N := by
 unfold onsetHighGC4_1_5M253
 positivity

def onsetHighGC4_1_6M253 (N : ℤ) : ℤ := ((((((((((((815712436224*N + 80815249686528)*N + 3665342660345856)*N + 100630733971783680)*N + 1862632619976425472)*N + 24487168459165138944)*N + 234453671533973864448)*N + 1647279442541150208000)*N + 8429397814850477359104)*N + 30638248904341431779328)*N + 75083668978075024490496)*N + 111394632012138959339520)*N + 75665391986130341068800)

theorem onsetHighGC4_1_6M253_eq (N : ℤ) : (((onsetHighC5_0_3M253 N*onsetHighC5_1_3M253 N-onsetHighC4_0_3M253 N*onsetHighC6_1_3M253 N) + (onsetHighC5_0_4M253 N*onsetHighC5_1_2M253 N-onsetHighC4_0_4M253 N*onsetHighC6_1_2M253 N)) + ((onsetHighC5_1_2M253 N*onsetHighC5_0_4M253 N-onsetHighC4_1_2M253 N*onsetHighC6_0_4M253 N) + (onsetHighC5_1_3M253 N*onsetHighC5_0_3M253 N-onsetHighC4_1_3M253 N*onsetHighC6_0_3M253 N)))=onsetHighGC4_1_6M253 N := by
 unfold onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighGC4_1_6M253
 ring

theorem onsetHighGC4_1_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_1_6M253 N := by
 unfold onsetHighGC4_1_6M253
 positivity

def onsetHighGC4_1_7M253 (N : ℤ) : ℤ := ((((((((((((32765902848*N + 3295879888896)*N + 151735725195264)*N + 4227572390952960)*N + 79388359224459264)*N + 1058546474510450688)*N + 10276222306203205632)*N + 73181845253109841920)*N + 379435831499987877888)*N + 1396849066433318486016)*N + 3465813484314484015104)*N + 5203808917787686993920)*N + 3575758973164742246400)

theorem onsetHighGC4_1_7M253_eq (N : ℤ) : ((onsetHighC5_0_4M253 N*onsetHighC5_1_3M253 N-onsetHighC4_0_4M253 N*onsetHighC6_1_3M253 N) + (onsetHighC5_1_3M253 N*onsetHighC5_0_4M253 N-onsetHighC4_1_3M253 N*onsetHighC6_0_4M253 N))=onsetHighGC4_1_7M253 N := by
 unfold onsetHighC4_0_4M253 onsetHighC4_1_3M253 onsetHighC5_0_4M253 onsetHighC5_1_3M253 onsetHighC6_0_4M253 onsetHighC6_1_3M253 onsetHighGC4_1_7M253
 ring

theorem onsetHighGC4_1_7M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_1_7M253 N := by
 unfold onsetHighGC4_1_7M253
 positivity

def onsetHighGC4_2_0M253 (N : ℤ) : ℤ := ((((((((((((396177551917056*N + 36452858056409088)*N + 1538110453966700544)*N + 39355413269021982720)*N + 680117257221159518208)*N + 8363230155883422941184)*N + 75037864571486141939712)*N + 494993230953938335825920)*N + 2382691400198997539291136)*N + 8162322384567162453884928)*N + 18889483302570370266169344)*N + 26516430741964616008335360)*N + 17075721506796806676480000)

theorem onsetHighGC4_2_0M253_eq (N : ℤ) : ((onsetHighC5_0_0M253 N*onsetHighC5_2_0M253 N-onsetHighC4_0_0M253 N*onsetHighC6_2_0M253 N) + ((onsetHighC5_1_0M253 N*onsetHighC5_1_0M253 N-onsetHighC4_1_0M253 N*onsetHighC6_1_0M253 N) + (onsetHighC5_2_0M253 N*onsetHighC5_0_0M253 N-onsetHighC4_2_0M253 N*onsetHighC6_0_0M253 N)))=onsetHighGC4_2_0M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_1_0M253 onsetHighC4_2_0M253 onsetHighC5_0_0M253 onsetHighC5_1_0M253 onsetHighC5_2_0M253 onsetHighC6_0_0M253 onsetHighC6_1_0M253 onsetHighC6_2_0M253 onsetHighGC4_2_0M253
 ring

theorem onsetHighGC4_2_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_2_0M253 N := by
 unfold onsetHighGC4_2_0M253
 positivity

def onsetHighGC4_2_1M253 (N : ℤ) : ℤ := ((((((((((((703001429803008*N + 65384714273292288)*N + 2787692790669115392)*N + 72045656651511889920)*N + 1257086773927730479104)*N + 15601458153390217887744)*N + 141225331192360857501696)*N + 939515521459324083240960)*N + 4559082206711010604351488)*N + 15738452432233720872173568)*N + 36689577240201131549786112)*N + 51862122844746823510917120)*N + 33617720211284625879859200)

theorem onsetHighGC4_2_1M253_eq (N : ℤ) : (((onsetHighC5_0_0M253 N*onsetHighC5_2_1M253 N-onsetHighC4_0_0M253 N*onsetHighC6_2_1M253 N) + ((onsetHighC5_0_1M253 N*onsetHighC5_2_0M253 N-onsetHighC4_0_1M253 N*onsetHighC6_2_0M253 N) + (onsetHighC5_1_0M253 N*onsetHighC5_1_1M253 N-onsetHighC4_1_0M253 N*onsetHighC6_1_1M253 N))) + ((onsetHighC5_1_1M253 N*onsetHighC5_1_0M253 N-onsetHighC4_1_1M253 N*onsetHighC6_1_0M253 N) + ((onsetHighC5_2_0M253 N*onsetHighC5_0_1M253 N-onsetHighC4_2_0M253 N*onsetHighC6_0_1M253 N) + (onsetHighC5_2_1M253 N*onsetHighC5_0_0M253 N-onsetHighC4_2_1M253 N*onsetHighC6_0_0M253 N))))=onsetHighGC4_2_1M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighGC4_2_1M253
 ring

theorem onsetHighGC4_2_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_2_1M253 N := by
 unfold onsetHighGC4_2_1M253
 positivity

def onsetHighGC4_2_2M253 (N : ℤ) : ℤ := ((((((((((((515411351175168*N + 48480054102982656)*N + 2089608962692349952)*N + 54576241937618042880)*N + 962005981561074745344)*N + 12056857507271536017408)*N + 110173391541394336382976)*N + 739607565949266835537920)*N + 3620310654835072172556288)*N + 12601994064616529164763136)*N + 29611950935611417909788672)*N + 42175551750176461897728000)*N + 27536282951386727463321600)

theorem onsetHighGC4_2_2M253_eq (N : ℤ) : ((((onsetHighC5_0_0M253 N*onsetHighC5_2_2M253 N-onsetHighC4_0_0M253 N*onsetHighC6_2_2M253 N) + (onsetHighC5_0_1M253 N*onsetHighC5_2_1M253 N-onsetHighC4_0_1M253 N*onsetHighC6_2_1M253 N)) + ((onsetHighC5_0_2M253 N*onsetHighC5_2_0M253 N-onsetHighC4_0_2M253 N*onsetHighC6_2_0M253 N) + (onsetHighC5_1_0M253 N*onsetHighC5_1_2M253 N-onsetHighC4_1_0M253 N*onsetHighC6_1_2M253 N))) + (((onsetHighC5_1_1M253 N*onsetHighC5_1_1M253 N-onsetHighC4_1_1M253 N*onsetHighC6_1_1M253 N) + (onsetHighC5_1_2M253 N*onsetHighC5_1_0M253 N-onsetHighC4_1_2M253 N*onsetHighC6_1_0M253 N)) + ((onsetHighC5_2_0M253 N*onsetHighC5_0_2M253 N-onsetHighC4_2_0M253 N*onsetHighC6_0_2M253 N) + ((onsetHighC5_2_1M253 N*onsetHighC5_0_1M253 N-onsetHighC4_2_1M253 N*onsetHighC6_0_1M253 N) + (onsetHighC5_2_2M253 N*onsetHighC5_0_0M253 N-onsetHighC4_2_2M253 N*onsetHighC6_0_0M253 N)))))=onsetHighGC4_2_2M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighGC4_2_2M253
 ring

theorem onsetHighGC4_2_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_2_2M253 N := by
 unfold onsetHighGC4_2_2M253
 positivity

def onsetHighGC4_2_3M253 (N : ℤ) : ℤ := ((((((((((((199607766220800*N + 19000410123534336)*N + 828501788310110208)*N + 21883177126173081600)*N + 389951397171230146560)*N + 4938994164905555263488)*N + 45592853562300394635264)*N + 309086149431270526156800)*N + 1527296431769358135459840)*N + 5364832090521168086040576)*N + 12716349946486988442697728)*N + 18263056762209531602534400)*N + 12019147611192148112179200)

theorem onsetHighGC4_2_3M253_eq (N : ℤ) : ((((onsetHighC5_0_1M253 N*onsetHighC5_2_2M253 N-onsetHighC4_0_1M253 N*onsetHighC6_2_2M253 N) + (onsetHighC5_0_2M253 N*onsetHighC5_2_1M253 N-onsetHighC4_0_2M253 N*onsetHighC6_2_1M253 N)) + ((onsetHighC5_0_3M253 N*onsetHighC5_2_0M253 N-onsetHighC4_0_3M253 N*onsetHighC6_2_0M253 N) + ((onsetHighC5_1_0M253 N*onsetHighC5_1_3M253 N-onsetHighC4_1_0M253 N*onsetHighC6_1_3M253 N) + (onsetHighC5_1_1M253 N*onsetHighC5_1_2M253 N-onsetHighC4_1_1M253 N*onsetHighC6_1_2M253 N)))) + (((onsetHighC5_1_2M253 N*onsetHighC5_1_1M253 N-onsetHighC4_1_2M253 N*onsetHighC6_1_1M253 N) + (onsetHighC5_1_3M253 N*onsetHighC5_1_0M253 N-onsetHighC4_1_3M253 N*onsetHighC6_1_0M253 N)) + ((onsetHighC5_2_0M253 N*onsetHighC5_0_3M253 N-onsetHighC4_2_0M253 N*onsetHighC6_0_3M253 N) + ((onsetHighC5_2_1M253 N*onsetHighC5_0_2M253 N-onsetHighC4_2_1M253 N*onsetHighC6_0_2M253 N) + (onsetHighC5_2_2M253 N*onsetHighC5_0_1M253 N-onsetHighC4_2_2M253 N*onsetHighC6_0_1M253 N)))))=onsetHighGC4_2_3M253 N := by
 unfold onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighGC4_2_3M253
 ring

theorem onsetHighGC4_2_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_2_3M253 N := by
 unfold onsetHighGC4_2_3M253
 positivity

def onsetHighGC4_2_4M253 (N : ℤ) : ℤ := ((((((((((((43032992808960*N + 4148731419033600)*N + 183161371553169408)*N + 4896608725499904000)*N + 88286342369394032640)*N + 1131019701055546982400)*N + 10556622703914187751424)*N + 72335221667836349644800)*N + 361142670390113009664000)*N + 1281261455994176726630400)*N + 3066261550230992121888768)*N + 4444494657809681586585600)*N + 2950939087125980125593600)

theorem onsetHighGC4_2_4M253_eq (N : ℤ) : ((((onsetHighC5_0_2M253 N*onsetHighC5_2_2M253 N-onsetHighC4_0_2M253 N*onsetHighC6_2_2M253 N) + (onsetHighC5_0_3M253 N*onsetHighC5_2_1M253 N-onsetHighC4_0_3M253 N*onsetHighC6_2_1M253 N)) + ((onsetHighC5_0_4M253 N*onsetHighC5_2_0M253 N-onsetHighC4_0_4M253 N*onsetHighC6_2_0M253 N) + (onsetHighC5_1_1M253 N*onsetHighC5_1_3M253 N-onsetHighC4_1_1M253 N*onsetHighC6_1_3M253 N))) + (((onsetHighC5_1_2M253 N*onsetHighC5_1_2M253 N-onsetHighC4_1_2M253 N*onsetHighC6_1_2M253 N) + (onsetHighC5_1_3M253 N*onsetHighC5_1_1M253 N-onsetHighC4_1_3M253 N*onsetHighC6_1_1M253 N)) + ((onsetHighC5_2_0M253 N*onsetHighC5_0_4M253 N-onsetHighC4_2_0M253 N*onsetHighC6_0_4M253 N) + ((onsetHighC5_2_1M253 N*onsetHighC5_0_3M253 N-onsetHighC4_2_1M253 N*onsetHighC6_0_3M253 N) + (onsetHighC5_2_2M253 N*onsetHighC5_0_2M253 N-onsetHighC4_2_2M253 N*onsetHighC6_0_2M253 N)))))=onsetHighGC4_2_4M253 N := by
 unfold onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighGC4_2_4M253
 ring

theorem onsetHighGC4_2_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_2_4M253 N := by
 unfold onsetHighGC4_2_4M253
 positivity

def onsetHighGC4_2_5M253 (N : ℤ) : ℤ := ((((((((((((4894274617344*N + 478335675138048)*N + 21401878898147328)*N + 579667343116861440)*N + 10585284791033659392)*N + 137296846496372097024)*N + 1297025093274801537024)*N + 8991948757503895142400)*N + 45405375935724711051264)*N + 162866169735708537520128)*N + 393916039446695186792448)*N + 576834964746889223208960)*N + 386771438239792968499200)

theorem onsetHighGC4_2_5M253_eq (N : ℤ) : (((onsetHighC5_0_3M253 N*onsetHighC5_2_2M253 N-onsetHighC4_0_3M253 N*onsetHighC6_2_2M253 N) + ((onsetHighC5_0_4M253 N*onsetHighC5_2_1M253 N-onsetHighC4_0_4M253 N*onsetHighC6_2_1M253 N) + (onsetHighC5_1_2M253 N*onsetHighC5_1_3M253 N-onsetHighC4_1_2M253 N*onsetHighC6_1_3M253 N))) + ((onsetHighC5_1_3M253 N*onsetHighC5_1_2M253 N-onsetHighC4_1_3M253 N*onsetHighC6_1_2M253 N) + ((onsetHighC5_2_1M253 N*onsetHighC5_0_4M253 N-onsetHighC4_2_1M253 N*onsetHighC6_0_4M253 N) + (onsetHighC5_2_2M253 N*onsetHighC5_0_3M253 N-onsetHighC4_2_2M253 N*onsetHighC6_0_3M253 N))))=onsetHighGC4_2_5M253 N := by
 unfold onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighGC4_2_5M253
 ring

theorem onsetHighGC4_2_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_2_5M253 N := by
 unfold onsetHighGC4_2_5M253
 positivity

def onsetHighGC4_2_6M253 (N : ℤ) : ℤ := ((((((((((((229361319936*N + 22747463811072)*N + 1032538948632576)*N + 28363881751511040)*N + 525160419379642368)*N + 6904235543666098176)*N + 66088360377997590528)*N + 464088940683452743680)*N + 2372839031482124599296)*N + 8614740361116479127552)*N + 21081243282117232951296)*N + 31221295315658570465280)*N + 21163186358002070323200)

theorem onsetHighGC4_2_6M253_eq (N : ℤ) : ((onsetHighC5_0_4M253 N*onsetHighC5_2_2M253 N-onsetHighC4_0_4M253 N*onsetHighC6_2_2M253 N) + ((onsetHighC5_1_3M253 N*onsetHighC5_1_3M253 N-onsetHighC4_1_3M253 N*onsetHighC6_1_3M253 N) + (onsetHighC5_2_2M253 N*onsetHighC5_0_4M253 N-onsetHighC4_2_2M253 N*onsetHighC6_0_4M253 N)))=onsetHighGC4_2_6M253 N := by
 unfold onsetHighC4_0_4M253 onsetHighC4_1_3M253 onsetHighC4_2_2M253 onsetHighC5_0_4M253 onsetHighC5_1_3M253 onsetHighC5_2_2M253 onsetHighC6_0_4M253 onsetHighC6_1_3M253 onsetHighC6_2_2M253 onsetHighGC4_2_6M253
 ring

theorem onsetHighGC4_2_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_2_6M253 N := by
 unfold onsetHighGC4_2_6M253
 positivity

def onsetHighGC4_3_0M253 (N : ℤ) : ℤ := ((((((((((((468667619868672*N + 43070993857511424)*N + 1814704139418992640)*N + 46352351645914890240)*N + 799432519106964750336)*N + 9808052777546161324032)*N + 87776605141592938905600)*N + 577384829104739041935360)*N + 2770638602415067265236992)*N + 9459114891121796415750144)*N + 21810281839903472521052160)*N + 30495943558413467792179200)*N + 19555788542937560137728000)

theorem onsetHighGC4_3_0M253_eq (N : ℤ) : (((onsetHighC5_0_0M253 N*onsetHighC5_3_0M253 N-onsetHighC4_0_0M253 N*onsetHighC6_3_0M253 N) + (onsetHighC5_1_0M253 N*onsetHighC5_2_0M253 N-onsetHighC4_1_0M253 N*onsetHighC6_2_0M253 N)) + ((onsetHighC5_2_0M253 N*onsetHighC5_1_0M253 N-onsetHighC4_2_0M253 N*onsetHighC6_1_0M253 N) + (onsetHighC5_3_0M253 N*onsetHighC5_0_0M253 N-onsetHighC4_3_0M253 N*onsetHighC6_0_0M253 N)))=onsetHighGC4_3_0M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_1_0M253 onsetHighC4_2_0M253 onsetHighC4_3_0M253 onsetHighC5_0_0M253 onsetHighC5_1_0M253 onsetHighC5_2_0M253 onsetHighC5_3_0M253 onsetHighC6_0_0M253 onsetHighC6_1_0M253 onsetHighC6_2_0M253 onsetHighC6_3_0M253 onsetHighGC4_3_0M253
 ring

theorem onsetHighGC4_3_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_3_0M253 N := by
 unfold onsetHighGC4_3_0M253
 positivity

def onsetHighGC4_3_1M253 (N : ℤ) : ℤ := ((((((((((((687215134900224*N + 63845908038549504)*N + 2718383471415263232)*N + 70140512892144844800)*N + 1221535825198461222912)*N + 15127564761748447690752)*N + 136603351795217044340736)*N + 906314797784715535319040)*N + 4384904235388807074545664)*N + 15088069850845550811807744)*N + 35049778452789576578629632)*N + 49356756653143863031234560)*N + 31864156424314584485068800)

theorem onsetHighGC4_3_1M253_eq (N : ℤ) : ((((onsetHighC5_0_0M253 N*onsetHighC5_3_1M253 N-onsetHighC4_0_0M253 N*onsetHighC6_3_1M253 N) + (onsetHighC5_0_1M253 N*onsetHighC5_3_0M253 N-onsetHighC4_0_1M253 N*onsetHighC6_3_0M253 N)) + ((onsetHighC5_1_0M253 N*onsetHighC5_2_1M253 N-onsetHighC4_1_0M253 N*onsetHighC6_2_1M253 N) + (onsetHighC5_1_1M253 N*onsetHighC5_2_0M253 N-onsetHighC4_1_1M253 N*onsetHighC6_2_0M253 N))) + (((onsetHighC5_2_0M253 N*onsetHighC5_1_1M253 N-onsetHighC4_2_0M253 N*onsetHighC6_1_1M253 N) + (onsetHighC5_2_1M253 N*onsetHighC5_1_0M253 N-onsetHighC4_2_1M253 N*onsetHighC6_1_0M253 N)) + ((onsetHighC5_3_0M253 N*onsetHighC5_0_1M253 N-onsetHighC4_3_0M253 N*onsetHighC6_0_1M253 N) + (onsetHighC5_3_1M253 N*onsetHighC5_0_0M253 N-onsetHighC4_3_1M253 N*onsetHighC6_0_0M253 N))))=onsetHighGC4_3_1M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighGC4_3_1M253
 ring

theorem onsetHighGC4_3_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_3_1M253 N := by
 unfold onsetHighGC4_3_1M253
 positivity

def onsetHighGC4_3_2M253 (N : ℤ) : ℤ := ((((((((((((399215532441600*N + 37517377318944768)*N + 1615249060720017408)*N + 42127955762589204480)*N + 741348441206323937280)*N + 9273440199119773630464)*N + 84552986244010343399424)*N + 566215493670404248043520)*N + 2763991589441105154539520)*N + 9592300911579422371872768)*N + 22465984896135248726458368)*N + 31884288738677202891571200)*N + 20737764465876244375142400)

theorem onsetHighGC4_3_2M253_eq (N : ℤ) : ((((onsetHighC5_0_1M253 N*onsetHighC5_3_1M253 N-onsetHighC4_0_1M253 N*onsetHighC6_3_1M253 N) + (onsetHighC5_0_2M253 N*onsetHighC5_3_0M253 N-onsetHighC4_0_2M253 N*onsetHighC6_3_0M253 N)) + ((onsetHighC5_1_0M253 N*onsetHighC5_2_2M253 N-onsetHighC4_1_0M253 N*onsetHighC6_2_2M253 N) + ((onsetHighC5_1_1M253 N*onsetHighC5_2_1M253 N-onsetHighC4_1_1M253 N*onsetHighC6_2_1M253 N) + (onsetHighC5_1_2M253 N*onsetHighC5_2_0M253 N-onsetHighC4_1_2M253 N*onsetHighC6_2_0M253 N)))) + (((onsetHighC5_2_0M253 N*onsetHighC5_1_2M253 N-onsetHighC4_2_0M253 N*onsetHighC6_1_2M253 N) + (onsetHighC5_2_1M253 N*onsetHighC5_1_1M253 N-onsetHighC4_2_1M253 N*onsetHighC6_1_1M253 N)) + ((onsetHighC5_2_2M253 N*onsetHighC5_1_0M253 N-onsetHighC4_2_2M253 N*onsetHighC6_1_0M253 N) + ((onsetHighC5_3_0M253 N*onsetHighC5_0_2M253 N-onsetHighC4_3_0M253 N*onsetHighC6_0_2M253 N) + (onsetHighC5_3_1M253 N*onsetHighC5_0_1M253 N-onsetHighC4_3_1M253 N*onsetHighC6_0_1M253 N)))))=onsetHighGC4_3_2M253 N := by
 unfold onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighGC4_3_2M253
 ring

theorem onsetHighGC4_3_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_3_2M253 N := by
 unfold onsetHighGC4_3_2M253
 positivity

def onsetHighGC4_3_3M253 (N : ℤ) : ℤ := ((((((((((((114754647490560*N + 10917260600279040)*N + 475653498495565824)*N + 12549919819777966080)*N + 223336457067980390400)*N + 2824165972851236536320)*N + 26021603949163720998912)*N + 176029193018309038571520)*N + 867716968298654245847040)*N + 3039777799581468854845440)*N + 7183899452172501871755264)*N + 10284053432255188992000000)*N + 6744327198136544998195200)

theorem onsetHighGC4_3_3M253_eq (N : ℤ) : ((((onsetHighC5_0_2M253 N*onsetHighC5_3_1M253 N-onsetHighC4_0_2M253 N*onsetHighC6_3_1M253 N) + (onsetHighC5_0_3M253 N*onsetHighC5_3_0M253 N-onsetHighC4_0_3M253 N*onsetHighC6_3_0M253 N)) + ((onsetHighC5_1_1M253 N*onsetHighC5_2_2M253 N-onsetHighC4_1_1M253 N*onsetHighC6_2_2M253 N) + ((onsetHighC5_1_2M253 N*onsetHighC5_2_1M253 N-onsetHighC4_1_2M253 N*onsetHighC6_2_1M253 N) + (onsetHighC5_1_3M253 N*onsetHighC5_2_0M253 N-onsetHighC4_1_3M253 N*onsetHighC6_2_0M253 N)))) + (((onsetHighC5_2_0M253 N*onsetHighC5_1_3M253 N-onsetHighC4_2_0M253 N*onsetHighC6_1_3M253 N) + (onsetHighC5_2_1M253 N*onsetHighC5_1_2M253 N-onsetHighC4_2_1M253 N*onsetHighC6_1_2M253 N)) + ((onsetHighC5_2_2M253 N*onsetHighC5_1_1M253 N-onsetHighC4_2_2M253 N*onsetHighC6_1_1M253 N) + ((onsetHighC5_3_0M253 N*onsetHighC5_0_3M253 N-onsetHighC4_3_0M253 N*onsetHighC6_0_3M253 N) + (onsetHighC5_3_1M253 N*onsetHighC5_0_2M253 N-onsetHighC4_3_1M253 N*onsetHighC6_0_2M253 N)))))=onsetHighGC4_3_3M253 N := by
 unfold onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighGC4_3_3M253
 ring

theorem onsetHighGC4_3_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_3_3M253 N := by
 unfold onsetHighGC4_3_3M253
 positivity

def onsetHighGC4_3_4M253 (N : ℤ) : ℤ := ((((((((((((16314248724480*N + 1572599507189760)*N + 69400436209090560)*N + 1854109047041556480)*N + 33398672703089541120)*N + 427350696549427445760)*N + 3982899175142798131200)*N + 27243610660508286320640)*N + 135741862205330050252800)*N + 480476125869367170170880)*N + 1146886973393127600291840)*N + 1657635413948332525486080)*N + 1097133605499950884454400)

theorem onsetHighGC4_3_4M253_eq (N : ℤ) : ((((onsetHighC5_0_3M253 N*onsetHighC5_3_1M253 N-onsetHighC4_0_3M253 N*onsetHighC6_3_1M253 N) + (onsetHighC5_0_4M253 N*onsetHighC5_3_0M253 N-onsetHighC4_0_4M253 N*onsetHighC6_3_0M253 N)) + ((onsetHighC5_1_2M253 N*onsetHighC5_2_2M253 N-onsetHighC4_1_2M253 N*onsetHighC6_2_2M253 N) + (onsetHighC5_1_3M253 N*onsetHighC5_2_1M253 N-onsetHighC4_1_3M253 N*onsetHighC6_2_1M253 N))) + (((onsetHighC5_2_1M253 N*onsetHighC5_1_3M253 N-onsetHighC4_2_1M253 N*onsetHighC6_1_3M253 N) + (onsetHighC5_2_2M253 N*onsetHighC5_1_2M253 N-onsetHighC4_2_2M253 N*onsetHighC6_1_2M253 N)) + ((onsetHighC5_3_0M253 N*onsetHighC5_0_4M253 N-onsetHighC4_3_0M253 N*onsetHighC6_0_4M253 N) + (onsetHighC5_3_1M253 N*onsetHighC5_0_3M253 N-onsetHighC4_3_1M253 N*onsetHighC6_0_3M253 N))))=onsetHighGC4_3_4M253 N := by
 unfold onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighGC4_3_4M253
 ring

theorem onsetHighGC4_3_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_3_4M253 N := by
 unfold onsetHighGC4_3_4M253
 positivity

def onsetHighGC4_3_5M253 (N : ℤ) : ℤ := ((((((((((((917445279744*N + 89695073599488)*N + 4013481699311616)*N + 108684682073210880)*N + 1983791485720461312)*N + 25712212843853512704)*N + 242656547288866357248)*N + 1680117549256354037760)*N + 8470541664727079583744)*N + 30326851699251840811008)*N + 73192397328485802049536)*N + 106918324986578007490560)*N + 71493230469497801932800)

theorem onsetHighGC4_3_5M253_eq (N : ℤ) : (((onsetHighC5_0_4M253 N*onsetHighC5_3_1M253 N-onsetHighC4_0_4M253 N*onsetHighC6_3_1M253 N) + (onsetHighC5_1_3M253 N*onsetHighC5_2_2M253 N-onsetHighC4_1_3M253 N*onsetHighC6_2_2M253 N)) + ((onsetHighC5_2_2M253 N*onsetHighC5_1_3M253 N-onsetHighC4_2_2M253 N*onsetHighC6_1_3M253 N) + (onsetHighC5_3_1M253 N*onsetHighC5_0_4M253 N-onsetHighC4_3_1M253 N*onsetHighC6_0_4M253 N)))=onsetHighGC4_3_5M253 N := by
 unfold onsetHighC4_0_4M253 onsetHighC4_1_3M253 onsetHighC4_2_2M253 onsetHighC4_3_1M253 onsetHighC5_0_4M253 onsetHighC5_1_3M253 onsetHighC5_2_2M253 onsetHighC5_3_1M253 onsetHighC6_0_4M253 onsetHighC6_1_3M253 onsetHighC6_2_2M253 onsetHighC6_3_1M253 onsetHighGC4_3_5M253
 ring

theorem onsetHighGC4_3_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_3_5M253 N := by
 unfold onsetHighGC4_3_5M253
 positivity

def onsetHighGC4_4_0M253 (N : ℤ) : ℤ := ((((((((((((343607567450112*N + 31525871969894400)*N + 1325746299215020032)*N + 33789725781094563840)*N + 581349662361970016256)*N + 7113192461424761241600)*N + 63470169052933260312576)*N + 416148508899810229616640)*N + 1989933061796713838149632)*N + 6768138105283905139507200)*N + 15542686081651121223892992)*N + 21639179368801934699397120)*N + 13813318359831953881497600)

theorem onsetHighGC4_4_0M253_eq (N : ℤ) : (((onsetHighC5_0_0M253 N*onsetHighC5_4_0M253 N-onsetHighC4_0_0M253 N*onsetHighC6_4_0M253 N) + (onsetHighC5_1_0M253 N*onsetHighC5_3_0M253 N-onsetHighC4_1_0M253 N*onsetHighC6_3_0M253 N)) + ((onsetHighC5_2_0M253 N*onsetHighC5_2_0M253 N-onsetHighC4_2_0M253 N*onsetHighC6_2_0M253 N) + ((onsetHighC5_3_0M253 N*onsetHighC5_1_0M253 N-onsetHighC4_3_0M253 N*onsetHighC6_1_0M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_0_0M253 N-onsetHighC4_4_0M253 N*onsetHighC6_0_0M253 N))))=onsetHighGC4_4_0M253 N := by
 unfold onsetHighC4_0_0M253 onsetHighC4_1_0M253 onsetHighC4_2_0M253 onsetHighC4_3_0M253 onsetHighC4_4_0M253 onsetHighC5_0_0M253 onsetHighC5_1_0M253 onsetHighC5_2_0M253 onsetHighC5_3_0M253 onsetHighC5_4_0M253 onsetHighC6_0_0M253 onsetHighC6_1_0M253 onsetHighC6_2_0M253 onsetHighC6_3_0M253 onsetHighC6_4_0M253 onsetHighGC4_4_0M253
 ring

theorem onsetHighGC4_4_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_4_0M253 N := by
 unfold onsetHighGC4_4_0M253
 positivity

def onsetHighGC4_4_1M253 (N : ℤ) : ℤ := ((((((((((((399215532441600*N + 37033934390820864)*N + 1574050700571181056)*N + 40532714215880785920)*N + 704300597960591278080)*N + 8700045301507358195712)*N + 78342895209366563586048)*N + 518188968727795948584960)*N + 2498764798077277773496320)*N + 8567242709992110947303424)*N + 19825385030941491916701696)*N + 27803532236673986521989120)*N + 17871552281995378606080000)

theorem onsetHighGC4_4_1M253_eq (N : ℤ) : ((((onsetHighC5_0_1M253 N*onsetHighC5_4_0M253 N-onsetHighC4_0_1M253 N*onsetHighC6_4_0M253 N) + (onsetHighC5_1_0M253 N*onsetHighC5_3_1M253 N-onsetHighC4_1_0M253 N*onsetHighC6_3_1M253 N)) + ((onsetHighC5_1_1M253 N*onsetHighC5_3_0M253 N-onsetHighC4_1_1M253 N*onsetHighC6_3_0M253 N) + (onsetHighC5_2_0M253 N*onsetHighC5_2_1M253 N-onsetHighC4_2_0M253 N*onsetHighC6_2_1M253 N))) + (((onsetHighC5_2_1M253 N*onsetHighC5_2_0M253 N-onsetHighC4_2_1M253 N*onsetHighC6_2_0M253 N) + (onsetHighC5_3_0M253 N*onsetHighC5_1_1M253 N-onsetHighC4_3_0M253 N*onsetHighC6_1_1M253 N)) + ((onsetHighC5_3_1M253 N*onsetHighC5_1_0M253 N-onsetHighC4_3_1M253 N*onsetHighC6_1_0M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_0_1M253 N-onsetHighC4_4_0M253 N*onsetHighC6_0_1M253 N))))=onsetHighGC4_4_1M253 N := by
 unfold onsetHighC4_0_1M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_0_1M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_0_1M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighGC4_4_1M253
 ring

theorem onsetHighGC4_4_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_4_1M253 N := by
 unfold onsetHighGC4_4_1M253
 positivity

def onsetHighGC4_4_2M253 (N : ℤ) : ℤ := ((((((((((((172131971235840*N + 16156856124702720)*N + 694580797822205952)*N + 18084221585278894080)*N + 317602745237498757120)*N + 3963882662086830981120)*N + 36050571464088290328576)*N + 240742842424432129474560)*N + 1171607302177999234007040)*N + 4052541865193031818280960)*N + 9457486824957559560732672)*N + 13370865633109164081807360)*N + 8660941111510368539443200)

theorem onsetHighGC4_4_2M253_eq (N : ℤ) : ((((onsetHighC5_0_2M253 N*onsetHighC5_4_0M253 N-onsetHighC4_0_2M253 N*onsetHighC6_4_0M253 N) + (onsetHighC5_1_1M253 N*onsetHighC5_3_1M253 N-onsetHighC4_1_1M253 N*onsetHighC6_3_1M253 N)) + ((onsetHighC5_1_2M253 N*onsetHighC5_3_0M253 N-onsetHighC4_1_2M253 N*onsetHighC6_3_0M253 N) + (onsetHighC5_2_0M253 N*onsetHighC5_2_2M253 N-onsetHighC4_2_0M253 N*onsetHighC6_2_2M253 N))) + (((onsetHighC5_2_1M253 N*onsetHighC5_2_1M253 N-onsetHighC4_2_1M253 N*onsetHighC6_2_1M253 N) + (onsetHighC5_2_2M253 N*onsetHighC5_2_0M253 N-onsetHighC4_2_2M253 N*onsetHighC6_2_0M253 N)) + ((onsetHighC5_3_0M253 N*onsetHighC5_1_2M253 N-onsetHighC4_3_0M253 N*onsetHighC6_1_2M253 N) + ((onsetHighC5_3_1M253 N*onsetHighC5_1_1M253 N-onsetHighC4_3_1M253 N*onsetHighC6_1_1M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_0_2M253 N-onsetHighC4_4_0M253 N*onsetHighC6_0_2M253 N)))))=onsetHighGC4_4_2M253 N := by
 unfold onsetHighC4_0_2M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_0_2M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_0_2M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighGC4_4_2M253
 ring

theorem onsetHighGC4_4_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_4_2M253 N := by
 unfold onsetHighGC4_4_2M253
 positivity

def onsetHighGC4_4_3M253 (N : ℤ) : ℤ := ((((((((((((32628497448960*N + 3101493527838720)*N + 134978745705431040)*N + 3556467965102653440)*N + 63186693303199334400)*N + 797495825051025408000)*N + 7332097174717629726720)*N + 49478712667673214320640)*N + 243239986476743762903040)*N + 849582911152183789486080)*N + 2001315028476437137981440)*N + 2854930602479638224568320)*N + 1865225083676708752588800)

theorem onsetHighGC4_4_3M253_eq (N : ℤ) : ((((onsetHighC5_0_3M253 N*onsetHighC5_4_0M253 N-onsetHighC4_0_3M253 N*onsetHighC6_4_0M253 N) + (onsetHighC5_1_2M253 N*onsetHighC5_3_1M253 N-onsetHighC4_1_2M253 N*onsetHighC6_3_1M253 N)) + ((onsetHighC5_1_3M253 N*onsetHighC5_3_0M253 N-onsetHighC4_1_3M253 N*onsetHighC6_3_0M253 N) + (onsetHighC5_2_1M253 N*onsetHighC5_2_2M253 N-onsetHighC4_2_1M253 N*onsetHighC6_2_2M253 N))) + (((onsetHighC5_2_2M253 N*onsetHighC5_2_1M253 N-onsetHighC4_2_2M253 N*onsetHighC6_2_1M253 N) + (onsetHighC5_3_0M253 N*onsetHighC5_1_3M253 N-onsetHighC4_3_0M253 N*onsetHighC6_1_3M253 N)) + ((onsetHighC5_3_1M253 N*onsetHighC5_1_2M253 N-onsetHighC4_3_1M253 N*onsetHighC6_1_2M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_0_3M253 N-onsetHighC4_4_0M253 N*onsetHighC6_0_3M253 N))))=onsetHighGC4_4_3M253 N := by
 unfold onsetHighC4_0_3M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_0_3M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_0_3M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighGC4_4_3M253
 ring

theorem onsetHighGC4_4_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_4_3M253 N := by
 unfold onsetHighGC4_4_3M253
 positivity

def onsetHighGC4_4_4M253 (N : ℤ) : ℤ := ((((((((((((2293613199360*N + 221000729886720)*N + 9746445049528320)*N + 260142956701286400)*N + 4680386522036305920)*N + 59799090054357319680)*N + 556350299814722273280)*N + 3797810386674529075200)*N + 18879154289844552990720)*N + 66653227416270510489600)*N + 158646810153473703936000)*N + 228582092739985263820800)*N + 150777610199869685760000)

theorem onsetHighGC4_4_4M253_eq (N : ℤ) : (((onsetHighC5_0_4M253 N*onsetHighC5_4_0M253 N-onsetHighC4_0_4M253 N*onsetHighC6_4_0M253 N) + (onsetHighC5_1_3M253 N*onsetHighC5_3_1M253 N-onsetHighC4_1_3M253 N*onsetHighC6_3_1M253 N)) + ((onsetHighC5_2_2M253 N*onsetHighC5_2_2M253 N-onsetHighC4_2_2M253 N*onsetHighC6_2_2M253 N) + ((onsetHighC5_3_1M253 N*onsetHighC5_1_3M253 N-onsetHighC4_3_1M253 N*onsetHighC6_1_3M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_0_4M253 N-onsetHighC4_4_0M253 N*onsetHighC6_0_4M253 N))))=onsetHighGC4_4_4M253 N := by
 unfold onsetHighC4_0_4M253 onsetHighC4_1_3M253 onsetHighC4_2_2M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_0_4M253 onsetHighC5_1_3M253 onsetHighC5_2_2M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_0_4M253 onsetHighC6_1_3M253 onsetHighC6_2_2M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighGC4_4_4M253
 ring

theorem onsetHighGC4_4_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_4_4M253 N := by
 unfold onsetHighGC4_4_4M253
 positivity

def onsetHighGC4_5_0M253 (N : ℤ) : ℤ := ((((((((((((159686212976640*N + 14620196585078784)*N + 613363398469484544)*N + 15592008498869698560)*N + 267486942441819340800)*N + 3262608226302686134272)*N + 29013008170143383027712)*N + 189531874332529435607040)*N + 902759839910964111605760)*N + 3057688494025383182598144)*N + 6990891172081517979500544)*N + 9687773557525818979123200)*N + 6153959785784843973427200)

theorem onsetHighGC4_5_0M253_eq (N : ℤ) : (((onsetHighC5_1_0M253 N*onsetHighC5_4_0M253 N-onsetHighC4_1_0M253 N*onsetHighC6_4_0M253 N) + (onsetHighC5_2_0M253 N*onsetHighC5_3_0M253 N-onsetHighC4_2_0M253 N*onsetHighC6_3_0M253 N)) + ((onsetHighC5_3_0M253 N*onsetHighC5_2_0M253 N-onsetHighC4_3_0M253 N*onsetHighC6_2_0M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_1_0M253 N-onsetHighC4_4_0M253 N*onsetHighC6_1_0M253 N)))=onsetHighGC4_5_0M253 N := by
 unfold onsetHighC4_1_0M253 onsetHighC4_2_0M253 onsetHighC4_3_0M253 onsetHighC4_4_0M253 onsetHighC5_1_0M253 onsetHighC5_2_0M253 onsetHighC5_3_0M253 onsetHighC5_4_0M253 onsetHighC6_1_0M253 onsetHighC6_2_0M253 onsetHighC6_3_0M253 onsetHighC6_4_0M253 onsetHighGC4_5_0M253
 ring

theorem onsetHighGC4_5_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_5_0M253 N := by
 unfold onsetHighGC4_5_0M253
 positivity

def onsetHighGC4_5_1M253 (N : ℤ) : ℤ := ((((((((((((137705576988672*N + 12750257079189504)*N + 540757709159399424)*N + 13891322976424427520)*N + 240734507644282208256)*N + 2965052720913875730432)*N + 26615186972972707479552)*N + 175438904544727306076160)*N + 842869930387566700265472)*N + 2878487375460118208446464)*N + 6633227746968320316801024)*N + 9261402588022475556126720)*N + 5925265894886462285414400)

theorem onsetHighGC4_5_1M253_eq (N : ℤ) : (((onsetHighC5_1_1M253 N*onsetHighC5_4_0M253 N-onsetHighC4_1_1M253 N*onsetHighC6_4_0M253 N) + ((onsetHighC5_2_0M253 N*onsetHighC5_3_1M253 N-onsetHighC4_2_0M253 N*onsetHighC6_3_1M253 N) + (onsetHighC5_2_1M253 N*onsetHighC5_3_0M253 N-onsetHighC4_2_1M253 N*onsetHighC6_3_0M253 N))) + ((onsetHighC5_3_0M253 N*onsetHighC5_2_1M253 N-onsetHighC4_3_0M253 N*onsetHighC6_2_1M253 N) + ((onsetHighC5_3_1M253 N*onsetHighC5_2_0M253 N-onsetHighC4_3_1M253 N*onsetHighC6_2_0M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_1_1M253 N-onsetHighC4_4_0M253 N*onsetHighC6_1_1M253 N))))=onsetHighGC4_5_1M253 N := by
 unfold onsetHighC4_1_1M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_1_1M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_1_1M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighGC4_5_1M253
 ring

theorem onsetHighGC4_5_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_5_1M253 N := by
 unfold onsetHighGC4_5_1M253
 positivity

def onsetHighGC4_5_2M253 (N : ℤ) : ℤ := ((((((((((((39154196938752*N + 3669345649557504)*N + 157455375019278336)*N + 4090955704188272640)*N + 71678084544133595136)*N + 892250988368659218432)*N + 8091511942415586951168)*N + 53865398505564112158720)*N + 261255815454782258675712)*N + 900384902052710568689664)*N + 2093070129870967782506496)*N + 2946909310164016708976640)*N + 1900487004090921359769600)

theorem onsetHighGC4_5_2M253_eq (N : ℤ) : (((onsetHighC5_1_2M253 N*onsetHighC5_4_0M253 N-onsetHighC4_1_2M253 N*onsetHighC6_4_0M253 N) + ((onsetHighC5_2_1M253 N*onsetHighC5_3_1M253 N-onsetHighC4_2_1M253 N*onsetHighC6_3_1M253 N) + (onsetHighC5_2_2M253 N*onsetHighC5_3_0M253 N-onsetHighC4_2_2M253 N*onsetHighC6_3_0M253 N))) + ((onsetHighC5_3_0M253 N*onsetHighC5_2_2M253 N-onsetHighC4_3_0M253 N*onsetHighC6_2_2M253 N) + ((onsetHighC5_3_1M253 N*onsetHighC5_2_1M253 N-onsetHighC4_3_1M253 N*onsetHighC6_2_1M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_1_2M253 N-onsetHighC4_4_0M253 N*onsetHighC6_1_2M253 N))))=onsetHighGC4_5_2M253 N := by
 unfold onsetHighC4_1_2M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_1_2M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_1_2M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighGC4_5_2M253
 ring

theorem onsetHighGC4_5_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_5_2M253 N := by
 unfold onsetHighGC4_5_2M253
 positivity

def onsetHighGC4_5_3M253 (N : ℤ) : ℤ := ((((((((((((3669781118976*N + 348422041239552)*N + 15141779024117760)*N + 398282877441146880)*N + 7062260156851027968)*N + 88935672167736016896)*N + 815623489360782950400)*N + 5488818414434600878080)*N + 26901731255981827424256)*N + 93653209314126307786752)*N + 219832578125521173872640)*N + 312407397004982212362240)*N + 203281177696346308608000)

theorem onsetHighGC4_5_3M253_eq (N : ℤ) : (((onsetHighC5_1_3M253 N*onsetHighC5_4_0M253 N-onsetHighC4_1_3M253 N*onsetHighC6_4_0M253 N) + (onsetHighC5_2_2M253 N*onsetHighC5_3_1M253 N-onsetHighC4_2_2M253 N*onsetHighC6_3_1M253 N)) + ((onsetHighC5_3_1M253 N*onsetHighC5_2_2M253 N-onsetHighC4_3_1M253 N*onsetHighC6_2_2M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_1_3M253 N-onsetHighC4_4_0M253 N*onsetHighC6_1_3M253 N)))=onsetHighGC4_5_3M253 N := by
 unfold onsetHighC4_1_3M253 onsetHighC4_2_2M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_1_3M253 onsetHighC5_2_2M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_1_3M253 onsetHighC6_2_2M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighGC4_5_3M253
 ring

theorem onsetHighGC4_5_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_5_3M253 N := by
 unfold onsetHighGC4_5_3M253
 positivity

def onsetHighGC4_6_0M253 (N : ℤ) : ℤ := ((((((((((((45901858996224*N + 4191676419538944)*N + 175354470299860992)*N + 4443831836564520960)*N + 75981273651795197952)*N + 923441390761103327232)*N + 8180316798292995342336)*N + 53221365173073110630400)*N + 252404501491582997889024)*N + 851011798483169206861824)*N + 1936380543092894226972672)*N + 2669922349542884235018240)*N + 1687131952346988203212800)

theorem onsetHighGC4_6_0M253_eq (N : ℤ) : ((onsetHighC5_2_0M253 N*onsetHighC5_4_0M253 N-onsetHighC4_2_0M253 N*onsetHighC6_4_0M253 N) + ((onsetHighC5_3_0M253 N*onsetHighC5_3_0M253 N-onsetHighC4_3_0M253 N*onsetHighC6_3_0M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_2_0M253 N-onsetHighC4_4_0M253 N*onsetHighC6_2_0M253 N)))=onsetHighGC4_6_0M253 N := by
 unfold onsetHighC4_2_0M253 onsetHighC4_3_0M253 onsetHighC4_4_0M253 onsetHighC5_2_0M253 onsetHighC5_3_0M253 onsetHighC5_4_0M253 onsetHighC6_2_0M253 onsetHighC6_3_0M253 onsetHighC6_4_0M253 onsetHighGC4_6_0M253
 ring

theorem onsetHighGC4_6_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_6_0M253 N := by
 unfold onsetHighGC4_6_0M253
 positivity

def onsetHighGC4_6_1M253 (N : ℤ) : ℤ := ((((((((((((26102797959168*N + 2411266043805696)*N + 102002458280067072)*N + 2612907716452024320)*N + 45142148049297997824)*N + 554154585817431932928)*N + 4956493717252369022976)*N + 32546950534133758033920)*N + 155732178892150992273408)*N + 529554963298713417547776)*N + 1214780352408845577879552)*N + 1688009604486925501071360)*N + 1074564817487680477593600)

theorem onsetHighGC4_6_1M253_eq (N : ℤ) : (((onsetHighC5_2_1M253 N*onsetHighC5_4_0M253 N-onsetHighC4_2_1M253 N*onsetHighC6_4_0M253 N) + (onsetHighC5_3_0M253 N*onsetHighC5_3_1M253 N-onsetHighC4_3_0M253 N*onsetHighC6_3_1M253 N)) + ((onsetHighC5_3_1M253 N*onsetHighC5_3_0M253 N-onsetHighC4_3_1M253 N*onsetHighC6_3_0M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_2_1M253 N-onsetHighC4_4_0M253 N*onsetHighC6_2_1M253 N)))=onsetHighGC4_6_1M253 N := by
 unfold onsetHighC4_2_1M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_2_1M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_2_1M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighGC4_6_1M253
 ring

theorem onsetHighGC4_6_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_6_1M253 N := by
 unfold onsetHighGC4_6_1M253
 positivity

def onsetHighGC4_6_2M253 (N : ℤ) : ℤ := ((((((((((((3669781118976*N + 343242914660352)*N + 14696327631863808)*N + 380891930579435520)*N + 6655438543260745728)*N + 82599781946250756096)*N + 746641868959392989184)*N + 4953061808232962457600)*N + 23933316534841031786496)*N + 82154554950080425623552)*N + 190173088921789066641408)*N + 266557691207065172705280)*N + 171099221471302621593600)

theorem onsetHighGC4_6_2M253_eq (N : ℤ) : ((onsetHighC5_2_2M253 N*onsetHighC5_4_0M253 N-onsetHighC4_2_2M253 N*onsetHighC6_4_0M253 N) + ((onsetHighC5_3_1M253 N*onsetHighC5_3_1M253 N-onsetHighC4_3_1M253 N*onsetHighC6_3_1M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_2_2M253 N-onsetHighC4_4_0M253 N*onsetHighC6_2_2M253 N)))=onsetHighGC4_6_2M253 N := by
 unfold onsetHighC4_2_2M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_2_2M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_2_2M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighGC4_6_2M253
 ring

theorem onsetHighGC4_6_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_6_2M253 N := by
 unfold onsetHighGC4_6_2M253
 positivity

def onsetHighGC4_7_0M253 (N : ℤ) : ℤ := ((((((((((((7457942274048*N + 678943329878016)*N + 28308463247425536)*N + 714837446319144960)*N + 12175960087235395584)*N + 147383946296791400448)*N + 1300029440284654829568)*N + 8419967550994734120960)*N + 39743249539941078663168)*N + 133335551887574550183936)*N + 301820986808153036292096)*N + 413916018981447747502080)*N + 260091794332504660377600)

theorem onsetHighGC4_7_0M253_eq (N : ℤ) : ((onsetHighC5_3_0M253 N*onsetHighC5_4_0M253 N-onsetHighC4_3_0M253 N*onsetHighC6_4_0M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_3_0M253 N-onsetHighC4_4_0M253 N*onsetHighC6_3_0M253 N))=onsetHighGC4_7_0M253 N := by
 unfold onsetHighC4_3_0M253 onsetHighC4_4_0M253 onsetHighC5_3_0M253 onsetHighC5_4_0M253 onsetHighC6_3_0M253 onsetHighC6_4_0M253 onsetHighGC4_7_0M253
 ring

theorem onsetHighGC4_7_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_7_0M253 N := by
 unfold onsetHighGC4_7_0M253
 positivity

def onsetHighGC4_7_1M253 (N : ℤ) : ℤ := ((((((((((((2097017782272*N + 193179307474944)*N + 8147404515704832)*N + 208026658437857280)*N + 3581435712022511616)*N + 43800644180835827712)*N + 390206481663573098496)*N + 2551512215209629450240)*N + 12154351390201177178112)*N + 41136846235307757010944)*N + 93904558547039548342272)*N + 129818755823284235796480)*N + 82200755431325093068800)

theorem onsetHighGC4_7_1M253_eq (N : ℤ) : ((onsetHighC5_3_1M253 N*onsetHighC5_4_0M253 N-onsetHighC4_3_1M253 N*onsetHighC6_4_0M253 N) + (onsetHighC5_4_0M253 N*onsetHighC5_3_1M253 N-onsetHighC4_4_0M253 N*onsetHighC6_3_1M253 N))=onsetHighGC4_7_1M253 N := by
 unfold onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253 onsetHighGC4_7_1M253
 ring

theorem onsetHighGC4_7_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_7_1M253 N := by
 unfold onsetHighGC4_7_1M253
 positivity

def onsetHighGC4_8_0M253 (N : ℤ) : ℤ := ((((((((((((524254445568*N + 47554951643136)*N + 1975238547996672)*N + 49676829232988160)*N + 842550340384456704)*N + 10152950901283749888)*N + 89135142636896649216)*N + 574466992665872302080)*N + 2697635982562849456128)*N + 9002001711601733861376)*N + 20264001733935614656512)*N + 27630073832396512296960)*N + 17258538249019352678400)

theorem onsetHighGC4_8_0M253_eq (N : ℤ) : (onsetHighC5_4_0M253 N*onsetHighC5_4_0M253 N-onsetHighC4_4_0M253 N*onsetHighC6_4_0M253 N)=onsetHighGC4_8_0M253 N := by
 unfold onsetHighC4_4_0M253 onsetHighC5_4_0M253 onsetHighC6_4_0M253 onsetHighGC4_8_0M253
 ring

theorem onsetHighGC4_8_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC4_8_0M253 N := by
 unfold onsetHighGC4_8_0M253
 positivity

attribute [local irreducible] onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighC6_0_0M253 onsetHighC6_0_1M253 onsetHighC6_0_2M253 onsetHighC6_0_3M253 onsetHighC6_0_4M253 onsetHighC6_1_0M253 onsetHighC6_1_1M253 onsetHighC6_1_2M253 onsetHighC6_1_3M253 onsetHighC6_2_0M253 onsetHighC6_2_1M253 onsetHighC6_2_2M253 onsetHighC6_3_0M253 onsetHighC6_3_1M253 onsetHighC6_4_0M253

def onsetHighCol4_4_0M253 (N R : ℤ) : ℤ := ((onsetHighC4_0_0M253 N*R^0 + onsetHighC4_0_1M253 N*R^1) + (onsetHighC4_0_2M253 N*R^2 + (onsetHighC4_0_3M253 N*R^3 + onsetHighC4_0_4M253 N*R^4)))

def onsetHighCol4_4_1M253 (N R : ℤ) : ℤ := ((onsetHighC4_1_0M253 N*R^0 + onsetHighC4_1_1M253 N*R^1) + (onsetHighC4_1_2M253 N*R^2 + onsetHighC4_1_3M253 N*R^3))

def onsetHighCol4_4_2M253 (N R : ℤ) : ℤ := (onsetHighC4_2_0M253 N*R^0 + (onsetHighC4_2_1M253 N*R^1 + onsetHighC4_2_2M253 N*R^2))

def onsetHighCol4_4_3M253 (N R : ℤ) : ℤ := (onsetHighC4_3_0M253 N*R^0 + onsetHighC4_3_1M253 N*R^1)

def onsetHighCol4_4_4M253 (N R : ℤ) : ℤ := onsetHighC4_4_0M253 N*R^0

theorem onsetHigh_cols4_4M253 (N C R : ℤ) : onsetHighV4M253 N C R=((onsetHighCol4_4_0M253 N R*C^0 + onsetHighCol4_4_1M253 N R*C^1) + (onsetHighCol4_4_2M253 N R*C^2 + (onsetHighCol4_4_3M253 N R*C^3 + onsetHighCol4_4_4M253 N R*C^4))) := by
 rw [onsetHigh_decomp4M253]
 unfold onsetHighCol4_4_0M253 onsetHighCol4_4_1M253 onsetHighCol4_4_2M253 onsetHighCol4_4_3M253 onsetHighCol4_4_4M253
 ring

def onsetHighCol4_5_0M253 (N R : ℤ) : ℤ := ((onsetHighC5_0_0M253 N*R^0 + onsetHighC5_0_1M253 N*R^1) + (onsetHighC5_0_2M253 N*R^2 + (onsetHighC5_0_3M253 N*R^3 + onsetHighC5_0_4M253 N*R^4)))

def onsetHighCol4_5_1M253 (N R : ℤ) : ℤ := ((onsetHighC5_1_0M253 N*R^0 + onsetHighC5_1_1M253 N*R^1) + (onsetHighC5_1_2M253 N*R^2 + onsetHighC5_1_3M253 N*R^3))

def onsetHighCol4_5_2M253 (N R : ℤ) : ℤ := (onsetHighC5_2_0M253 N*R^0 + (onsetHighC5_2_1M253 N*R^1 + onsetHighC5_2_2M253 N*R^2))

def onsetHighCol4_5_3M253 (N R : ℤ) : ℤ := (onsetHighC5_3_0M253 N*R^0 + onsetHighC5_3_1M253 N*R^1)

def onsetHighCol4_5_4M253 (N R : ℤ) : ℤ := onsetHighC5_4_0M253 N*R^0

theorem onsetHigh_cols4_5M253 (N C R : ℤ) : onsetHighV5M253 N C R=((onsetHighCol4_5_0M253 N R*C^0 + onsetHighCol4_5_1M253 N R*C^1) + (onsetHighCol4_5_2M253 N R*C^2 + (onsetHighCol4_5_3M253 N R*C^3 + onsetHighCol4_5_4M253 N R*C^4))) := by
 rw [onsetHigh_decomp5M253]
 unfold onsetHighCol4_5_0M253 onsetHighCol4_5_1M253 onsetHighCol4_5_2M253 onsetHighCol4_5_3M253 onsetHighCol4_5_4M253
 ring

def onsetHighCol4_6_0M253 (N R : ℤ) : ℤ := ((onsetHighC6_0_0M253 N*R^0 + onsetHighC6_0_1M253 N*R^1) + (onsetHighC6_0_2M253 N*R^2 + (onsetHighC6_0_3M253 N*R^3 + onsetHighC6_0_4M253 N*R^4)))

def onsetHighCol4_6_1M253 (N R : ℤ) : ℤ := ((onsetHighC6_1_0M253 N*R^0 + onsetHighC6_1_1M253 N*R^1) + (onsetHighC6_1_2M253 N*R^2 + onsetHighC6_1_3M253 N*R^3))

def onsetHighCol4_6_2M253 (N R : ℤ) : ℤ := (onsetHighC6_2_0M253 N*R^0 + (onsetHighC6_2_1M253 N*R^1 + onsetHighC6_2_2M253 N*R^2))

def onsetHighCol4_6_3M253 (N R : ℤ) : ℤ := (onsetHighC6_3_0M253 N*R^0 + onsetHighC6_3_1M253 N*R^1)

def onsetHighCol4_6_4M253 (N R : ℤ) : ℤ := onsetHighC6_4_0M253 N*R^0

theorem onsetHigh_cols4_6M253 (N C R : ℤ) : onsetHighV6M253 N C R=((onsetHighCol4_6_0M253 N R*C^0 + onsetHighCol4_6_1M253 N R*C^1) + (onsetHighCol4_6_2M253 N R*C^2 + (onsetHighCol4_6_3M253 N R*C^3 + onsetHighCol4_6_4M253 N R*C^4))) := by
 rw [onsetHigh_decomp6M253]
 unfold onsetHighCol4_6_0M253 onsetHighCol4_6_1M253 onsetHighCol4_6_2M253 onsetHighCol4_6_3M253 onsetHighCol4_6_4M253
 ring

def onsetHighGCol4_0M253 (N R : ℤ) : ℤ := (((onsetHighGC4_0_0M253 N*R^0 + onsetHighGC4_0_1M253 N*R^1) + (onsetHighGC4_0_2M253 N*R^2 + onsetHighGC4_0_3M253 N*R^3)) + ((onsetHighGC4_0_4M253 N*R^4 + onsetHighGC4_0_5M253 N*R^5) + (onsetHighGC4_0_6M253 N*R^6 + (onsetHighGC4_0_7M253 N*R^7 + onsetHighGC4_0_8M253 N*R^8))))

theorem onsetHighGCol4_0M253_eq (N R : ℤ) : (onsetHighCol4_5_0M253 N R*onsetHighCol4_5_0M253 N R-onsetHighCol4_4_0M253 N R*onsetHighCol4_6_0M253 N R)=onsetHighGCol4_0M253 N R := by
 unfold onsetHighGCol4_0M253 onsetHighCol4_4_0M253 onsetHighCol4_5_0M253 onsetHighCol4_6_0M253
 rw [←onsetHighGC4_0_0M253_eq,←onsetHighGC4_0_1M253_eq,←onsetHighGC4_0_2M253_eq,←onsetHighGC4_0_3M253_eq,←onsetHighGC4_0_4M253_eq,←onsetHighGC4_0_5M253_eq,←onsetHighGC4_0_6M253_eq,←onsetHighGC4_0_7M253_eq,←onsetHighGC4_0_8M253_eq]
 ring

theorem onsetHighGCol4_0M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol4_0M253 N R := by
 unfold onsetHighGCol4_0M253
 have h0 := onsetHighGC4_0_0M253_nonneg N hN
 have h1 := onsetHighGC4_0_1M253_nonneg N hN
 have h2 := onsetHighGC4_0_2M253_nonneg N hN
 have h3 := onsetHighGC4_0_3M253_nonneg N hN
 have h4 := onsetHighGC4_0_4M253_nonneg N hN
 have h5 := onsetHighGC4_0_5M253_nonneg N hN
 have h6 := onsetHighGC4_0_6M253_nonneg N hN
 have h7 := onsetHighGC4_0_7M253_nonneg N hN
 have h8 := onsetHighGC4_0_8M253_nonneg N hN
 positivity

def onsetHighGCol4_1M253 (N R : ℤ) : ℤ := (((onsetHighGC4_1_0M253 N*R^0 + onsetHighGC4_1_1M253 N*R^1) + (onsetHighGC4_1_2M253 N*R^2 + onsetHighGC4_1_3M253 N*R^3)) + ((onsetHighGC4_1_4M253 N*R^4 + onsetHighGC4_1_5M253 N*R^5) + (onsetHighGC4_1_6M253 N*R^6 + onsetHighGC4_1_7M253 N*R^7)))

theorem onsetHighGCol4_1M253_eq (N R : ℤ) : ((onsetHighCol4_5_0M253 N R*onsetHighCol4_5_1M253 N R-onsetHighCol4_4_0M253 N R*onsetHighCol4_6_1M253 N R) + (onsetHighCol4_5_1M253 N R*onsetHighCol4_5_0M253 N R-onsetHighCol4_4_1M253 N R*onsetHighCol4_6_0M253 N R))=onsetHighGCol4_1M253 N R := by
 unfold onsetHighGCol4_1M253 onsetHighCol4_4_0M253 onsetHighCol4_4_1M253 onsetHighCol4_5_0M253 onsetHighCol4_5_1M253 onsetHighCol4_6_0M253 onsetHighCol4_6_1M253
 rw [←onsetHighGC4_1_0M253_eq,←onsetHighGC4_1_1M253_eq,←onsetHighGC4_1_2M253_eq,←onsetHighGC4_1_3M253_eq,←onsetHighGC4_1_4M253_eq,←onsetHighGC4_1_5M253_eq,←onsetHighGC4_1_6M253_eq,←onsetHighGC4_1_7M253_eq]
 ring

theorem onsetHighGCol4_1M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol4_1M253 N R := by
 unfold onsetHighGCol4_1M253
 have h0 := onsetHighGC4_1_0M253_nonneg N hN
 have h1 := onsetHighGC4_1_1M253_nonneg N hN
 have h2 := onsetHighGC4_1_2M253_nonneg N hN
 have h3 := onsetHighGC4_1_3M253_nonneg N hN
 have h4 := onsetHighGC4_1_4M253_nonneg N hN
 have h5 := onsetHighGC4_1_5M253_nonneg N hN
 have h6 := onsetHighGC4_1_6M253_nonneg N hN
 have h7 := onsetHighGC4_1_7M253_nonneg N hN
 positivity

def onsetHighGCol4_2M253 (N R : ℤ) : ℤ := ((onsetHighGC4_2_0M253 N*R^0 + (onsetHighGC4_2_1M253 N*R^1 + onsetHighGC4_2_2M253 N*R^2)) + ((onsetHighGC4_2_3M253 N*R^3 + onsetHighGC4_2_4M253 N*R^4) + (onsetHighGC4_2_5M253 N*R^5 + onsetHighGC4_2_6M253 N*R^6)))

theorem onsetHighGCol4_2M253_eq (N R : ℤ) : ((onsetHighCol4_5_0M253 N R*onsetHighCol4_5_2M253 N R-onsetHighCol4_4_0M253 N R*onsetHighCol4_6_2M253 N R) + ((onsetHighCol4_5_1M253 N R*onsetHighCol4_5_1M253 N R-onsetHighCol4_4_1M253 N R*onsetHighCol4_6_1M253 N R) + (onsetHighCol4_5_2M253 N R*onsetHighCol4_5_0M253 N R-onsetHighCol4_4_2M253 N R*onsetHighCol4_6_0M253 N R)))=onsetHighGCol4_2M253 N R := by
 unfold onsetHighGCol4_2M253 onsetHighCol4_4_0M253 onsetHighCol4_4_1M253 onsetHighCol4_4_2M253 onsetHighCol4_5_0M253 onsetHighCol4_5_1M253 onsetHighCol4_5_2M253 onsetHighCol4_6_0M253 onsetHighCol4_6_1M253 onsetHighCol4_6_2M253
 rw [←onsetHighGC4_2_0M253_eq,←onsetHighGC4_2_1M253_eq,←onsetHighGC4_2_2M253_eq,←onsetHighGC4_2_3M253_eq,←onsetHighGC4_2_4M253_eq,←onsetHighGC4_2_5M253_eq,←onsetHighGC4_2_6M253_eq]
 ring

theorem onsetHighGCol4_2M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol4_2M253 N R := by
 unfold onsetHighGCol4_2M253
 have h0 := onsetHighGC4_2_0M253_nonneg N hN
 have h1 := onsetHighGC4_2_1M253_nonneg N hN
 have h2 := onsetHighGC4_2_2M253_nonneg N hN
 have h3 := onsetHighGC4_2_3M253_nonneg N hN
 have h4 := onsetHighGC4_2_4M253_nonneg N hN
 have h5 := onsetHighGC4_2_5M253_nonneg N hN
 have h6 := onsetHighGC4_2_6M253_nonneg N hN
 positivity

def onsetHighGCol4_3M253 (N R : ℤ) : ℤ := ((onsetHighGC4_3_0M253 N*R^0 + (onsetHighGC4_3_1M253 N*R^1 + onsetHighGC4_3_2M253 N*R^2)) + (onsetHighGC4_3_3M253 N*R^3 + (onsetHighGC4_3_4M253 N*R^4 + onsetHighGC4_3_5M253 N*R^5)))

theorem onsetHighGCol4_3M253_eq (N R : ℤ) : (((onsetHighCol4_5_0M253 N R*onsetHighCol4_5_3M253 N R-onsetHighCol4_4_0M253 N R*onsetHighCol4_6_3M253 N R) + (onsetHighCol4_5_1M253 N R*onsetHighCol4_5_2M253 N R-onsetHighCol4_4_1M253 N R*onsetHighCol4_6_2M253 N R)) + ((onsetHighCol4_5_2M253 N R*onsetHighCol4_5_1M253 N R-onsetHighCol4_4_2M253 N R*onsetHighCol4_6_1M253 N R) + (onsetHighCol4_5_3M253 N R*onsetHighCol4_5_0M253 N R-onsetHighCol4_4_3M253 N R*onsetHighCol4_6_0M253 N R)))=onsetHighGCol4_3M253 N R := by
 unfold onsetHighGCol4_3M253 onsetHighCol4_4_0M253 onsetHighCol4_4_1M253 onsetHighCol4_4_2M253 onsetHighCol4_4_3M253 onsetHighCol4_5_0M253 onsetHighCol4_5_1M253 onsetHighCol4_5_2M253 onsetHighCol4_5_3M253 onsetHighCol4_6_0M253 onsetHighCol4_6_1M253 onsetHighCol4_6_2M253 onsetHighCol4_6_3M253
 rw [←onsetHighGC4_3_0M253_eq,←onsetHighGC4_3_1M253_eq,←onsetHighGC4_3_2M253_eq,←onsetHighGC4_3_3M253_eq,←onsetHighGC4_3_4M253_eq,←onsetHighGC4_3_5M253_eq]
 ring

theorem onsetHighGCol4_3M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol4_3M253 N R := by
 unfold onsetHighGCol4_3M253
 have h0 := onsetHighGC4_3_0M253_nonneg N hN
 have h1 := onsetHighGC4_3_1M253_nonneg N hN
 have h2 := onsetHighGC4_3_2M253_nonneg N hN
 have h3 := onsetHighGC4_3_3M253_nonneg N hN
 have h4 := onsetHighGC4_3_4M253_nonneg N hN
 have h5 := onsetHighGC4_3_5M253_nonneg N hN
 positivity

def onsetHighGCol4_4M253 (N R : ℤ) : ℤ := ((onsetHighGC4_4_0M253 N*R^0 + onsetHighGC4_4_1M253 N*R^1) + (onsetHighGC4_4_2M253 N*R^2 + (onsetHighGC4_4_3M253 N*R^3 + onsetHighGC4_4_4M253 N*R^4)))

theorem onsetHighGCol4_4M253_eq (N R : ℤ) : (((onsetHighCol4_5_0M253 N R*onsetHighCol4_5_4M253 N R-onsetHighCol4_4_0M253 N R*onsetHighCol4_6_4M253 N R) + (onsetHighCol4_5_1M253 N R*onsetHighCol4_5_3M253 N R-onsetHighCol4_4_1M253 N R*onsetHighCol4_6_3M253 N R)) + ((onsetHighCol4_5_2M253 N R*onsetHighCol4_5_2M253 N R-onsetHighCol4_4_2M253 N R*onsetHighCol4_6_2M253 N R) + ((onsetHighCol4_5_3M253 N R*onsetHighCol4_5_1M253 N R-onsetHighCol4_4_3M253 N R*onsetHighCol4_6_1M253 N R) + (onsetHighCol4_5_4M253 N R*onsetHighCol4_5_0M253 N R-onsetHighCol4_4_4M253 N R*onsetHighCol4_6_0M253 N R))))=onsetHighGCol4_4M253 N R := by
 unfold onsetHighGCol4_4M253 onsetHighCol4_4_0M253 onsetHighCol4_4_1M253 onsetHighCol4_4_2M253 onsetHighCol4_4_3M253 onsetHighCol4_4_4M253 onsetHighCol4_5_0M253 onsetHighCol4_5_1M253 onsetHighCol4_5_2M253 onsetHighCol4_5_3M253 onsetHighCol4_5_4M253 onsetHighCol4_6_0M253 onsetHighCol4_6_1M253 onsetHighCol4_6_2M253 onsetHighCol4_6_3M253 onsetHighCol4_6_4M253
 rw [←onsetHighGC4_4_0M253_eq,←onsetHighGC4_4_1M253_eq,←onsetHighGC4_4_2M253_eq,←onsetHighGC4_4_3M253_eq,←onsetHighGC4_4_4M253_eq]
 ring

theorem onsetHighGCol4_4M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol4_4M253 N R := by
 unfold onsetHighGCol4_4M253
 have h0 := onsetHighGC4_4_0M253_nonneg N hN
 have h1 := onsetHighGC4_4_1M253_nonneg N hN
 have h2 := onsetHighGC4_4_2M253_nonneg N hN
 have h3 := onsetHighGC4_4_3M253_nonneg N hN
 have h4 := onsetHighGC4_4_4M253_nonneg N hN
 positivity

def onsetHighGCol4_5M253 (N R : ℤ) : ℤ := ((onsetHighGC4_5_0M253 N*R^0 + onsetHighGC4_5_1M253 N*R^1) + (onsetHighGC4_5_2M253 N*R^2 + onsetHighGC4_5_3M253 N*R^3))

theorem onsetHighGCol4_5M253_eq (N R : ℤ) : (((onsetHighCol4_5_1M253 N R*onsetHighCol4_5_4M253 N R-onsetHighCol4_4_1M253 N R*onsetHighCol4_6_4M253 N R) + (onsetHighCol4_5_2M253 N R*onsetHighCol4_5_3M253 N R-onsetHighCol4_4_2M253 N R*onsetHighCol4_6_3M253 N R)) + ((onsetHighCol4_5_3M253 N R*onsetHighCol4_5_2M253 N R-onsetHighCol4_4_3M253 N R*onsetHighCol4_6_2M253 N R) + (onsetHighCol4_5_4M253 N R*onsetHighCol4_5_1M253 N R-onsetHighCol4_4_4M253 N R*onsetHighCol4_6_1M253 N R)))=onsetHighGCol4_5M253 N R := by
 unfold onsetHighGCol4_5M253 onsetHighCol4_4_1M253 onsetHighCol4_4_2M253 onsetHighCol4_4_3M253 onsetHighCol4_4_4M253 onsetHighCol4_5_1M253 onsetHighCol4_5_2M253 onsetHighCol4_5_3M253 onsetHighCol4_5_4M253 onsetHighCol4_6_1M253 onsetHighCol4_6_2M253 onsetHighCol4_6_3M253 onsetHighCol4_6_4M253
 rw [←onsetHighGC4_5_0M253_eq,←onsetHighGC4_5_1M253_eq,←onsetHighGC4_5_2M253_eq,←onsetHighGC4_5_3M253_eq]
 ring

theorem onsetHighGCol4_5M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol4_5M253 N R := by
 unfold onsetHighGCol4_5M253
 have h0 := onsetHighGC4_5_0M253_nonneg N hN
 have h1 := onsetHighGC4_5_1M253_nonneg N hN
 have h2 := onsetHighGC4_5_2M253_nonneg N hN
 have h3 := onsetHighGC4_5_3M253_nonneg N hN
 positivity

def onsetHighGCol4_6M253 (N R : ℤ) : ℤ := (onsetHighGC4_6_0M253 N*R^0 + (onsetHighGC4_6_1M253 N*R^1 + onsetHighGC4_6_2M253 N*R^2))

theorem onsetHighGCol4_6M253_eq (N R : ℤ) : ((onsetHighCol4_5_2M253 N R*onsetHighCol4_5_4M253 N R-onsetHighCol4_4_2M253 N R*onsetHighCol4_6_4M253 N R) + ((onsetHighCol4_5_3M253 N R*onsetHighCol4_5_3M253 N R-onsetHighCol4_4_3M253 N R*onsetHighCol4_6_3M253 N R) + (onsetHighCol4_5_4M253 N R*onsetHighCol4_5_2M253 N R-onsetHighCol4_4_4M253 N R*onsetHighCol4_6_2M253 N R)))=onsetHighGCol4_6M253 N R := by
 unfold onsetHighGCol4_6M253 onsetHighCol4_4_2M253 onsetHighCol4_4_3M253 onsetHighCol4_4_4M253 onsetHighCol4_5_2M253 onsetHighCol4_5_3M253 onsetHighCol4_5_4M253 onsetHighCol4_6_2M253 onsetHighCol4_6_3M253 onsetHighCol4_6_4M253
 rw [←onsetHighGC4_6_0M253_eq,←onsetHighGC4_6_1M253_eq,←onsetHighGC4_6_2M253_eq]
 ring

theorem onsetHighGCol4_6M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol4_6M253 N R := by
 unfold onsetHighGCol4_6M253
 have h0 := onsetHighGC4_6_0M253_nonneg N hN
 have h1 := onsetHighGC4_6_1M253_nonneg N hN
 have h2 := onsetHighGC4_6_2M253_nonneg N hN
 positivity

def onsetHighGCol4_7M253 (N R : ℤ) : ℤ := (onsetHighGC4_7_0M253 N*R^0 + onsetHighGC4_7_1M253 N*R^1)

theorem onsetHighGCol4_7M253_eq (N R : ℤ) : ((onsetHighCol4_5_3M253 N R*onsetHighCol4_5_4M253 N R-onsetHighCol4_4_3M253 N R*onsetHighCol4_6_4M253 N R) + (onsetHighCol4_5_4M253 N R*onsetHighCol4_5_3M253 N R-onsetHighCol4_4_4M253 N R*onsetHighCol4_6_3M253 N R))=onsetHighGCol4_7M253 N R := by
 unfold onsetHighGCol4_7M253 onsetHighCol4_4_3M253 onsetHighCol4_4_4M253 onsetHighCol4_5_3M253 onsetHighCol4_5_4M253 onsetHighCol4_6_3M253 onsetHighCol4_6_4M253
 rw [←onsetHighGC4_7_0M253_eq,←onsetHighGC4_7_1M253_eq]
 ring

theorem onsetHighGCol4_7M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol4_7M253 N R := by
 unfold onsetHighGCol4_7M253
 have h0 := onsetHighGC4_7_0M253_nonneg N hN
 have h1 := onsetHighGC4_7_1M253_nonneg N hN
 positivity

def onsetHighGCol4_8M253 (N R : ℤ) : ℤ := onsetHighGC4_8_0M253 N*R^0

theorem onsetHighGCol4_8M253_eq (N R : ℤ) : (onsetHighCol4_5_4M253 N R*onsetHighCol4_5_4M253 N R-onsetHighCol4_4_4M253 N R*onsetHighCol4_6_4M253 N R)=onsetHighGCol4_8M253 N R := by
 unfold onsetHighGCol4_8M253 onsetHighCol4_4_4M253 onsetHighCol4_5_4M253 onsetHighCol4_6_4M253
 rw [←onsetHighGC4_8_0M253_eq]
 ring

theorem onsetHighGCol4_8M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol4_8M253 N R := by
 unfold onsetHighGCol4_8M253
 have h0 := onsetHighGC4_8_0M253_nonneg N hN
 positivity

attribute [local irreducible] onsetHighCol4_4_0M253 onsetHighCol4_4_1M253 onsetHighCol4_4_2M253 onsetHighCol4_4_3M253 onsetHighCol4_4_4M253 onsetHighCol4_5_0M253 onsetHighCol4_5_1M253 onsetHighCol4_5_2M253 onsetHighCol4_5_3M253 onsetHighCol4_5_4M253 onsetHighCol4_6_0M253 onsetHighCol4_6_1M253 onsetHighCol4_6_2M253 onsetHighCol4_6_3M253 onsetHighCol4_6_4M253

theorem onsetHigh_lc4M253 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 onsetHighV4M253 N C R*onsetHighV6M253 N C R ≤ (onsetHighV5M253 N C R)^2 := by
 apply sub_nonneg.mp
 rw [onsetHigh_cols4_4M253,onsetHigh_cols4_5M253,onsetHigh_cols4_6M253]
 have he : ((onsetHighCol4_5_0M253 N R*C^0 + onsetHighCol4_5_1M253 N R*C^1) + (onsetHighCol4_5_2M253 N R*C^2 + (onsetHighCol4_5_3M253 N R*C^3 + onsetHighCol4_5_4M253 N R*C^4)))^2-((onsetHighCol4_4_0M253 N R*C^0 + onsetHighCol4_4_1M253 N R*C^1) + (onsetHighCol4_4_2M253 N R*C^2 + (onsetHighCol4_4_3M253 N R*C^3 + onsetHighCol4_4_4M253 N R*C^4)))*((onsetHighCol4_6_0M253 N R*C^0 + onsetHighCol4_6_1M253 N R*C^1) + (onsetHighCol4_6_2M253 N R*C^2 + (onsetHighCol4_6_3M253 N R*C^3 + onsetHighCol4_6_4M253 N R*C^4)))=(((onsetHighGCol4_0M253 N R*C^0 + onsetHighGCol4_1M253 N R*C^1) + (onsetHighGCol4_2M253 N R*C^2 + onsetHighGCol4_3M253 N R*C^3)) + ((onsetHighGCol4_4M253 N R*C^4 + onsetHighGCol4_5M253 N R*C^5) + (onsetHighGCol4_6M253 N R*C^6 + (onsetHighGCol4_7M253 N R*C^7 + onsetHighGCol4_8M253 N R*C^8)))) := by
  rw [←onsetHighGCol4_0M253_eq,←onsetHighGCol4_1M253_eq,←onsetHighGCol4_2M253_eq,←onsetHighGCol4_3M253_eq,←onsetHighGCol4_4M253_eq,←onsetHighGCol4_5M253_eq,←onsetHighGCol4_6M253_eq,←onsetHighGCol4_7M253_eq,←onsetHighGCol4_8M253_eq]
  ring
 rw [he]
 have h0 := onsetHighGCol4_0M253_nonneg N R hN hR
 have h1 := onsetHighGCol4_1M253_nonneg N R hN hR
 have h2 := onsetHighGCol4_2M253_nonneg N R hN hR
 have h3 := onsetHighGCol4_3M253_nonneg N R hN hR
 have h4 := onsetHighGCol4_4M253_nonneg N R hN hR
 have h5 := onsetHighGCol4_5M253_nonneg N R hN hR
 have h6 := onsetHighGCol4_6M253_nonneg N R hN hR
 have h7 := onsetHighGCol4_7M253_nonneg N R hN hR
 have h8 := onsetHighGCol4_8M253_nonneg N R hN hR
 positivity
end
end MathGKM.Markov
