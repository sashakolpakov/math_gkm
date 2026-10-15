import MarkovOnsetHighSplitDefsM253
/-! Machine-authored request 2532cf40. Coefficient-wise onset gap proof. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536

def onsetHighGC3_0_0M253 (N : ℤ) : ℤ := ((((((((((((39715445145600*N + 3910758479953920)*N + 176674757029134336)*N + 4841907056132751360)*N + 89650837106809896960)*N + 1181408467414226042880)*N + 11361090175503991308288)*N + 80328559087113987686400)*N + 414425084512437019607040)*N + 1521367053916031955763200)*N + 3772027370895461395070976)*N + 5670936193320057005015040)*N + 3909419284774223079014400)

theorem onsetHighGC3_0_0M253_eq (N : ℤ) : (onsetHighC4_0_0M253 N*onsetHighC4_0_0M253 N-onsetHighC3_0_0M253 N*onsetHighC5_0_0M253 N)=onsetHighGC3_0_0M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC4_0_0M253 onsetHighC5_0_0M253 onsetHighGC3_0_0M253
 ring

theorem onsetHighGC3_0_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_0_0M253 N := by
 unfold onsetHighGC3_0_0M253
 positivity

def onsetHighGC3_0_1M253 (N : ℤ) : ℤ := ((((((((((((95039615139840*N + 9432968372158464)*N + 429404305735286784)*N + 11854166977617592320)*N + 221017346492722053120)*N + 2931849848797507878912)*N + 28371485402317886717952)*N + 201791530095653893570560)*N + 1046890170769062775357440)*N + 3863352199933845135949824)*N + 9625787502970618072203264)*N + 14538081331462777015173120)*N + 10065143762212741300224000)

theorem onsetHighGC3_0_1M253_eq (N : ℤ) : ((onsetHighC4_0_0M253 N*onsetHighC4_0_1M253 N-onsetHighC3_0_0M253 N*onsetHighC5_0_1M253 N) + (onsetHighC4_0_1M253 N*onsetHighC4_0_0M253 N-onsetHighC3_0_1M253 N*onsetHighC5_0_0M253 N))=onsetHighGC3_0_1M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighGC3_0_1M253
 ring

theorem onsetHighGC3_0_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_0_1M253 N := by
 unfold onsetHighGC3_0_1M253
 positivity

def onsetHighGC3_0_2M253 (N : ℤ) : ℤ := ((((((((((((99044387979264*N + 9913906690523136)*N + 454986035600818176)*N + 12658871211015536640)*N + 237790507857048502272)*N + 3176893564375651319808)*N + 30951562429134613905408)*N + 221558993826184774287360)*N + 1156433762295020835569664)*N + 4292065489860372348665856)*N + 10751594460395117902626816)*N + 16320531379518532170547200)*N + 11352682278196076121292800)

theorem onsetHighGC3_0_2M253_eq (N : ℤ) : ((onsetHighC4_0_0M253 N*onsetHighC4_0_2M253 N-onsetHighC3_0_0M253 N*onsetHighC5_0_2M253 N) + ((onsetHighC4_0_1M253 N*onsetHighC4_0_1M253 N-onsetHighC3_0_1M253 N*onsetHighC5_0_1M253 N) + (onsetHighC4_0_2M253 N*onsetHighC4_0_0M253 N-onsetHighC3_0_2M253 N*onsetHighC5_0_0M253 N)))=onsetHighGC3_0_2M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighGC3_0_2M253
 ring

theorem onsetHighGC3_0_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_0_2M253 N := by
 unfold onsetHighGC3_0_2M253
 positivity

def onsetHighGC3_0_3M253 (N : ℤ) : ℤ := ((((((((((((58583452483584*N + 5917837822525440)*N + 274002116308107264)*N + 7688528223566561280)*N + 145607273517224558592)*N + 1960537358622405427200)*N + 19243329183744378273792)*N + 138724403150478335016960)*N + 728939657972166510772224)*N + 2722625847393640930344960)*N + 6861068352819121681465344)*N + 10473712872855824256860160)*N + 7324317154722685914316800)

theorem onsetHighGC3_0_3M253_eq (N : ℤ) : (((onsetHighC4_0_0M253 N*onsetHighC4_0_3M253 N-onsetHighC3_0_0M253 N*onsetHighC5_0_3M253 N) + (onsetHighC4_0_1M253 N*onsetHighC4_0_2M253 N-onsetHighC3_0_1M253 N*onsetHighC5_0_2M253 N)) + ((onsetHighC4_0_2M253 N*onsetHighC4_0_1M253 N-onsetHighC3_0_2M253 N*onsetHighC5_0_1M253 N) + (onsetHighC4_0_3M253 N*onsetHighC4_0_0M253 N-onsetHighC3_0_3M253 N*onsetHighC5_0_0M253 N)))=onsetHighGC3_0_3M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighGC3_0_3M253
 ring

theorem onsetHighGC3_0_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_0_3M253 N := by
 unfold onsetHighGC3_0_3M253
 positivity

def onsetHighGC3_0_4M253 (N : ℤ) : ℤ := ((((((((((((21475472965632*N + 2191131100053504)*N + 102438056780365824)*N + 2901381620878540800)*N + 55442454962199330816)*N + 752957207941613617152)*N + 7451544358702158446592)*N + 54140723738573033963520)*N + 286617534479311865905152)*N + 1078141925008719813279744)*N + 2735245154800563279888384)*N + 4202088643344580275732480)*N + 2956239640859851564646400)

theorem onsetHighGC3_0_4M253_eq (N : ℤ) : (((onsetHighC4_0_0M253 N*onsetHighC4_0_4M253 N-onsetHighC3_0_0M253 N*onsetHighC5_0_4M253 N) + (onsetHighC4_0_1M253 N*onsetHighC4_0_3M253 N-onsetHighC3_0_1M253 N*onsetHighC5_0_3M253 N)) + ((onsetHighC4_0_2M253 N*onsetHighC4_0_2M253 N-onsetHighC3_0_2M253 N*onsetHighC5_0_2M253 N) + ((onsetHighC4_0_3M253 N*onsetHighC4_0_1M253 N-onsetHighC3_0_3M253 N*onsetHighC5_0_1M253 N) + (onsetHighC4_0_4M253 N*onsetHighC4_0_0M253 N-onsetHighC3_0_4M253 N*onsetHighC5_0_0M253 N))))=onsetHighGC3_0_4M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighGC3_0_4M253
 ring

theorem onsetHighGC3_0_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_0_4M253 N := by
 unfold onsetHighGC3_0_4M253
 positivity

def onsetHighGC3_0_5M253 (N : ℤ) : ℤ := ((((((((((((4990194155520*N + 514749691330560)*N + 24322475972100096)*N + 696017933508280320)*N + 13432813042752552960)*N + 184177582975042191360)*N + 1839432705019144962048)*N + 13482191312513801256960)*N + 71972397442324009451520)*N + 272895000024028989358080)*N + 697597181590728112275456)*N + 1079439826489649885675520)*N + 764606184827512120934400)

theorem onsetHighGC3_0_5M253_eq (N : ℤ) : (((onsetHighC4_0_1M253 N*onsetHighC4_0_4M253 N-onsetHighC3_0_1M253 N*onsetHighC5_0_4M253 N) + (onsetHighC4_0_2M253 N*onsetHighC4_0_3M253 N-onsetHighC3_0_2M253 N*onsetHighC5_0_3M253 N)) + ((onsetHighC4_0_3M253 N*onsetHighC4_0_2M253 N-onsetHighC3_0_3M253 N*onsetHighC5_0_2M253 N) + (onsetHighC4_0_4M253 N*onsetHighC4_0_1M253 N-onsetHighC3_0_4M253 N*onsetHighC5_0_1M253 N)))=onsetHighGC3_0_5M253 N := by
 unfold onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighGC3_0_5M253
 ring

theorem onsetHighGC3_0_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_0_5M253 N := by
 unfold onsetHighGC3_0_5M253
 positivity

def onsetHighGC3_0_6M253 (N : ℤ) : ℤ := ((((((((((((717216546816*N + 74874976468992)*N + 3579530081992704)*N + 103601902442250240)*N + 2021537100657328128)*N + 28012288354735620096)*N + 282629229794626240512)*N + 2091879149250352250880)*N + 11272128829329630560256)*N + 43124222300916039155712)*N + 111183441509793147715584)*N + 173448498566822197985280)*N + 123816177981828838195200)

theorem onsetHighGC3_0_6M253_eq (N : ℤ) : ((onsetHighC4_0_2M253 N*onsetHighC4_0_4M253 N-onsetHighC3_0_2M253 N*onsetHighC5_0_4M253 N) + ((onsetHighC4_0_3M253 N*onsetHighC4_0_3M253 N-onsetHighC3_0_3M253 N*onsetHighC5_0_3M253 N) + (onsetHighC4_0_4M253 N*onsetHighC4_0_2M253 N-onsetHighC3_0_4M253 N*onsetHighC5_0_2M253 N)))=onsetHighGC3_0_6M253 N := by
 unfold onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighGC3_0_6M253
 ring

theorem onsetHighGC3_0_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_0_6M253 N := by
 unfold onsetHighGC3_0_6M253
 positivity

def onsetHighGC3_0_7M253 (N : ℤ) : ℤ := ((((((((((((58265174016*N + 6162896388096)*N + 298430786174976)*N + 8746059096391680)*N + 172740631638048768)*N + 2421913715739721728)*N + 24714144458070294528)*N + 184926713042286673920)*N + 1006971239044655087616)*N + 3891286733605812043776)*N + 10129462587613291216896)*N + 15948011978987706777600)*N + 11484743467058646220800)

theorem onsetHighGC3_0_7M253_eq (N : ℤ) : ((onsetHighC4_0_3M253 N*onsetHighC4_0_4M253 N-onsetHighC3_0_3M253 N*onsetHighC5_0_4M253 N) + (onsetHighC4_0_4M253 N*onsetHighC4_0_3M253 N-onsetHighC3_0_4M253 N*onsetHighC5_0_3M253 N))=onsetHighGC3_0_7M253 N := by
 unfold onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighGC3_0_7M253
 ring

theorem onsetHighGC3_0_7M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_0_7M253 N := by
 unfold onsetHighGC3_0_7M253
 positivity

def onsetHighGC3_0_8M253 (N : ℤ) : ℤ := ((((((((((((2047868928*N + 219716517888)*N + 10789626839040)*N + 320577035304960)*N + 6416849426448384)*N + 91143665262526464)*N + 941833837011271680)*N + 7133464344385290240)*N + 39300228851945177088)*N + 153585296984635342848)*N + 404129555999049646080)*N + 642862048495848652800)*N + 467530537026296217600)

theorem onsetHighGC3_0_8M253_eq (N : ℤ) : (onsetHighC4_0_4M253 N*onsetHighC4_0_4M253 N-onsetHighC3_0_4M253 N*onsetHighC5_0_4M253 N)=onsetHighGC3_0_8M253 N := by
 unfold onsetHighC3_0_4M253 onsetHighC4_0_4M253 onsetHighC5_0_4M253 onsetHighGC3_0_8M253
 ring

theorem onsetHighGC3_0_8M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_0_8M253 N := by
 unfold onsetHighGC3_0_8M253
 positivity

def onsetHighGC3_1_0M253 (N : ℤ) : ℤ := ((((((((((((190079230279680*N + 18669785252364288)*N + 841117716021510144)*N + 22982543985334026240)*N + 424156681742214758400)*N + 5569933517578726539264)*N + 53362182118890729111552)*N + 375778724085093193482240)*N + 1930378495428482755461120)*N + 7054269903142148949147648)*N + 17406238170999287186325504)*N + 26037026189851291541176320)*N + 17854805615004314733772800)

theorem onsetHighGC3_1_0M253_eq (N : ℤ) : ((onsetHighC4_0_0M253 N*onsetHighC4_1_0M253 N-onsetHighC3_0_0M253 N*onsetHighC5_1_0M253 N) + (onsetHighC4_1_0M253 N*onsetHighC4_0_0M253 N-onsetHighC3_1_0M253 N*onsetHighC5_0_0M253 N))=onsetHighGC3_1_0M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_1_0M253 onsetHighC4_0_0M253 onsetHighC4_1_0M253 onsetHighC5_0_0M253 onsetHighC5_1_0M253 onsetHighGC3_1_0M253
 ring

theorem onsetHighGC3_1_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_1_0M253 N := by
 unfold onsetHighGC3_1_0M253
 positivity

def onsetHighGC3_1_1M253 (N : ℤ) : ℤ := ((((((((((((396177551917056*N + 39233447616577536)*N + 1781543838947475456)*N + 49047295385696993280)*N + 911739710856563785728)*N + 12055073160039049986048)*N + 116245241320061501964288)*N + 823648962396643287367680)*N + 4255677451013818279919616)*N + 15636689795602853924438016)*N + 38780885982402600789344256)*N + 58288371113643625125642240)*N + 40150038954351823567257600)

theorem onsetHighGC3_1_1M253_eq (N : ℤ) : (((onsetHighC4_0_0M253 N*onsetHighC4_1_1M253 N-onsetHighC3_0_0M253 N*onsetHighC5_1_1M253 N) + (onsetHighC4_0_1M253 N*onsetHighC4_1_0M253 N-onsetHighC3_0_1M253 N*onsetHighC5_1_0M253 N)) + ((onsetHighC4_1_0M253 N*onsetHighC4_0_1M253 N-onsetHighC3_1_0M253 N*onsetHighC5_0_1M253 N) + (onsetHighC4_1_1M253 N*onsetHighC4_0_0M253 N-onsetHighC3_1_1M253 N*onsetHighC5_0_0M253 N)))=onsetHighGC3_1_1M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighGC3_1_1M253
 ring

theorem onsetHighGC3_1_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_1_1M253 N := by
 unfold onsetHighGC3_1_1M253
 positivity

def onsetHighGC3_1_2M253 (N : ℤ) : ℤ := ((((((((((((351500714901504*N + 35117915191640064)*N + 1608298685534306304)*N + 44641287804498739200)*N + 836356811035639283712)*N + 11141242566088958410752)*N + 108199249453722863665152)*N + 771824543579818202234880)*N + 4013430481258123060445184)*N + 14835698285338372521590784)*N + 37003751273636128578207744)*N + 55914895807395624112619520)*N + 38708518454147776182681600)

theorem onsetHighGC3_1_2M253_eq (N : ℤ) : (((onsetHighC4_0_0M253 N*onsetHighC4_1_2M253 N-onsetHighC3_0_0M253 N*onsetHighC5_1_2M253 N) + ((onsetHighC4_0_1M253 N*onsetHighC4_1_1M253 N-onsetHighC3_0_1M253 N*onsetHighC5_1_1M253 N) + (onsetHighC4_0_2M253 N*onsetHighC4_1_0M253 N-onsetHighC3_0_2M253 N*onsetHighC5_1_0M253 N))) + ((onsetHighC4_1_0M253 N*onsetHighC4_0_2M253 N-onsetHighC3_1_0M253 N*onsetHighC5_0_2M253 N) + ((onsetHighC4_1_1M253 N*onsetHighC4_0_1M253 N-onsetHighC3_1_1M253 N*onsetHighC5_0_1M253 N) + (onsetHighC4_1_2M253 N*onsetHighC4_0_0M253 N-onsetHighC3_1_2M253 N*onsetHighC5_0_0M253 N))))=onsetHighGC3_1_2M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighGC3_1_2M253
 ring

theorem onsetHighGC3_1_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_1_2M253 N := by
 unfold onsetHighGC3_1_2M253
 positivity

def onsetHighGC3_1_3M253 (N : ℤ) : ℤ := ((((((((((((171803783725056*N + 17330507775737856)*N + 801101561802522624)*N + 22436087312469196800)*N + 423970095806454693888)*N + 5694419928620495536128)*N + 55737695154062218493952)*N + 400579215558101115863040)*N + 2097817968274465314963456)*N + 7806953655751781794185216)*N + 19596717936505237296513024)*N + 29790334580526708448296960)*N + 20740320835009633286553600)

theorem onsetHighGC3_1_3M253_eq (N : ℤ) : ((((onsetHighC4_0_0M253 N*onsetHighC4_1_3M253 N-onsetHighC3_0_0M253 N*onsetHighC5_1_3M253 N) + (onsetHighC4_0_1M253 N*onsetHighC4_1_2M253 N-onsetHighC3_0_1M253 N*onsetHighC5_1_2M253 N)) + ((onsetHighC4_0_2M253 N*onsetHighC4_1_1M253 N-onsetHighC3_0_2M253 N*onsetHighC5_1_1M253 N) + (onsetHighC4_0_3M253 N*onsetHighC4_1_0M253 N-onsetHighC3_0_3M253 N*onsetHighC5_1_0M253 N))) + (((onsetHighC4_1_0M253 N*onsetHighC4_0_3M253 N-onsetHighC3_1_0M253 N*onsetHighC5_0_3M253 N) + (onsetHighC4_1_1M253 N*onsetHighC4_0_2M253 N-onsetHighC3_1_1M253 N*onsetHighC5_0_2M253 N)) + ((onsetHighC4_1_2M253 N*onsetHighC4_0_1M253 N-onsetHighC3_1_2M253 N*onsetHighC5_0_1M253 N) + (onsetHighC4_1_3M253 N*onsetHighC4_0_0M253 N-onsetHighC3_1_3M253 N*onsetHighC5_0_0M253 N))))=onsetHighGC3_1_3M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighGC3_1_3M253
 ring

theorem onsetHighGC3_1_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_1_3M253 N := by
 unfold onsetHighGC3_1_3M253
 positivity

def onsetHighGC3_1_4M253 (N : ℤ) : ℤ := ((((((((((((49901941555200*N + 5087066547290112)*N + 237562362498908160)*N + 6719238122294476800)*N + 128183056240072458240)*N + 1737405367462399574016)*N + 17154877259135570411520)*N + 124320758569043133726720)*N + 656251088245892593090560)*N + 2460725389551706135068672)*N + 6221275828705669278597120)*N + 9521930658712092044820480)*N + 6672089740747325910220800)

theorem onsetHighGC3_1_4M253_eq (N : ℤ) : ((((onsetHighC4_0_1M253 N*onsetHighC4_1_3M253 N-onsetHighC3_0_1M253 N*onsetHighC5_1_3M253 N) + (onsetHighC4_0_2M253 N*onsetHighC4_1_2M253 N-onsetHighC3_0_2M253 N*onsetHighC5_1_2M253 N)) + ((onsetHighC4_0_3M253 N*onsetHighC4_1_1M253 N-onsetHighC3_0_3M253 N*onsetHighC5_1_1M253 N) + (onsetHighC4_0_4M253 N*onsetHighC4_1_0M253 N-onsetHighC3_0_4M253 N*onsetHighC5_1_0M253 N))) + (((onsetHighC4_1_0M253 N*onsetHighC4_0_4M253 N-onsetHighC3_1_0M253 N*onsetHighC5_0_4M253 N) + (onsetHighC4_1_1M253 N*onsetHighC4_0_3M253 N-onsetHighC3_1_1M253 N*onsetHighC5_0_3M253 N)) + ((onsetHighC4_1_2M253 N*onsetHighC4_0_2M253 N-onsetHighC3_1_2M253 N*onsetHighC5_0_2M253 N) + (onsetHighC4_1_3M253 N*onsetHighC4_0_1M253 N-onsetHighC3_1_3M253 N*onsetHighC5_0_1M253 N))))=onsetHighGC3_1_4M253 N := by
 unfold onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighGC3_1_4M253
 ring

theorem onsetHighGC3_1_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_1_4M253 N := by
 unfold onsetHighGC3_1_4M253
 positivity

def onsetHighGC3_1_5M253 (N : ℤ) : ℤ := ((((((((((((8606598561792*N + 887547978842112)*N + 41915731805208576)*N + 1198513003765432320)*N + 23105402413140934656)*N + 316354287747833266176)*N + 3154096463830968434688)*N + 23071139679561874145280)*N + 122873068891857979441152)*N + 464660471521455531098112)*N + 1184309125117259305844736)*N + 1826644882911789072384000)*N + 1289344262764785854054400)

theorem onsetHighGC3_1_5M253_eq (N : ℤ) : (((onsetHighC4_0_2M253 N*onsetHighC4_1_3M253 N-onsetHighC3_0_2M253 N*onsetHighC5_1_3M253 N) + ((onsetHighC4_0_3M253 N*onsetHighC4_1_2M253 N-onsetHighC3_0_3M253 N*onsetHighC5_1_2M253 N) + (onsetHighC4_0_4M253 N*onsetHighC4_1_1M253 N-onsetHighC3_0_4M253 N*onsetHighC5_1_1M253 N))) + ((onsetHighC4_1_1M253 N*onsetHighC4_0_4M253 N-onsetHighC3_1_1M253 N*onsetHighC5_0_4M253 N) + ((onsetHighC4_1_2M253 N*onsetHighC4_0_3M253 N-onsetHighC3_1_2M253 N*onsetHighC5_0_3M253 N) + (onsetHighC4_1_3M253 N*onsetHighC4_0_2M253 N-onsetHighC3_1_3M253 N*onsetHighC5_0_2M253 N))))=onsetHighGC3_1_5M253 N := by
 unfold onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighGC3_1_5M253
 ring

theorem onsetHighGC3_1_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_1_5M253 N := by
 unfold onsetHighGC3_1_5M253
 positivity

def onsetHighGC3_1_6M253 (N : ℤ) : ℤ := ((((((((((((815712436224*N + 85187912269824)*N + 4073007303622656)*N + 117864902594396160)*N + 2298773481680535552)*N + 31829117270750134272)*N + 320785680834325905408)*N + 2370911937900458803200)*N + 12753376569483072897024)*N + 48690272836993290338304)*N + 125235345964462609268736)*N + 194845854495553817149440)*N + 138676936473730193817600)

theorem onsetHighGC3_1_6M253_eq (N : ℤ) : (((onsetHighC4_0_3M253 N*onsetHighC4_1_3M253 N-onsetHighC3_0_3M253 N*onsetHighC5_1_3M253 N) + (onsetHighC4_0_4M253 N*onsetHighC4_1_2M253 N-onsetHighC3_0_4M253 N*onsetHighC5_1_2M253 N)) + ((onsetHighC4_1_2M253 N*onsetHighC4_0_4M253 N-onsetHighC3_1_2M253 N*onsetHighC5_0_4M253 N) + (onsetHighC4_1_3M253 N*onsetHighC4_0_3M253 N-onsetHighC3_1_3M253 N*onsetHighC5_0_3M253 N)))=onsetHighGC3_1_6M253 N := by
 unfold onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighGC3_1_6M253
 ring

theorem onsetHighGC3_1_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_1_6M253 N := by
 unfold onsetHighGC3_1_6M253
 positivity

def onsetHighGC3_1_7M253 (N : ℤ) : ℤ := ((((((((((((32765902848*N + 3469222084608)*N + 168122111754240)*N + 4929599035146240)*N + 97383142039486464)*N + 1365216918591504384)*N + 13925162727568834560)*N + 104116791810793144320)*N + 566314977790512857088)*N + 2185283615941651857408)*N + 5678452104199431782400)*N + 8921487199267549347840)*N + 6409158372691122585600)

theorem onsetHighGC3_1_7M253_eq (N : ℤ) : ((onsetHighC4_0_4M253 N*onsetHighC4_1_3M253 N-onsetHighC3_0_4M253 N*onsetHighC5_1_3M253 N) + (onsetHighC4_1_3M253 N*onsetHighC4_0_4M253 N-onsetHighC3_1_3M253 N*onsetHighC5_0_4M253 N))=onsetHighGC3_1_7M253 N := by
 unfold onsetHighC3_0_4M253 onsetHighC3_1_3M253 onsetHighC4_0_4M253 onsetHighC4_1_3M253 onsetHighC5_0_4M253 onsetHighC5_1_3M253 onsetHighGC3_1_7M253
 ring

theorem onsetHighGC3_1_7M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_1_7M253 N := by
 unfold onsetHighGC3_1_7M253
 positivity

def onsetHighGC3_2_0M253 (N : ℤ) : ℤ := ((((((((((((396177551917056*N + 38811268471062528)*N + 1743573099648909312)*N + 47494284203922554880)*N + 873614299144994684928)*N + 11430914385891897114624)*N + 109090795094471318962176)*N + 765061599954954470031360)*N + 3912946231807526781321216)*N + 14233139073686576481435648)*N + 34948964442332208417472512)*N + 52011522194661796856463360)*N + 35476882375824494257766400)

theorem onsetHighGC3_2_0M253_eq (N : ℤ) : ((onsetHighC4_0_0M253 N*onsetHighC4_2_0M253 N-onsetHighC3_0_0M253 N*onsetHighC5_2_0M253 N) + ((onsetHighC4_1_0M253 N*onsetHighC4_1_0M253 N-onsetHighC3_1_0M253 N*onsetHighC5_1_0M253 N) + (onsetHighC4_2_0M253 N*onsetHighC4_0_0M253 N-onsetHighC3_2_0M253 N*onsetHighC5_0_0M253 N)))=onsetHighGC3_2_0M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_1_0M253 onsetHighC3_2_0M253 onsetHighC4_0_0M253 onsetHighC4_1_0M253 onsetHighC4_2_0M253 onsetHighC5_0_0M253 onsetHighC5_1_0M253 onsetHighC5_2_0M253 onsetHighGC3_2_0M253
 ring

theorem onsetHighGC3_2_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_2_0M253 N := by
 unfold onsetHighGC3_2_0M253
 positivity

def onsetHighGC3_2_1M253 (N : ℤ) : ℤ := ((((((((((((703001429803008*N + 69457606896254976)*N + 3145988320933183488)*N + 86370484673084129280)*N + 1600656063480037638144)*N + 21093950370263613308928)*N + 202678176427397631442944)*N + 1430542800222363282309120)*N + 7361039172025807937077248)*N + 26928650235018769310416896)*N + 66478036976768904255111168)*N + 99432644913192670248960000)*N + 68142939824852215632691200)

theorem onsetHighGC3_2_1M253_eq (N : ℤ) : (((onsetHighC4_0_0M253 N*onsetHighC4_2_1M253 N-onsetHighC3_0_0M253 N*onsetHighC5_2_1M253 N) + ((onsetHighC4_0_1M253 N*onsetHighC4_2_0M253 N-onsetHighC3_0_1M253 N*onsetHighC5_2_0M253 N) + (onsetHighC4_1_0M253 N*onsetHighC4_1_1M253 N-onsetHighC3_1_0M253 N*onsetHighC5_1_1M253 N))) + ((onsetHighC4_1_1M253 N*onsetHighC4_1_0M253 N-onsetHighC3_1_1M253 N*onsetHighC5_1_0M253 N) + ((onsetHighC4_2_0M253 N*onsetHighC4_0_1M253 N-onsetHighC3_2_0M253 N*onsetHighC5_0_1M253 N) + (onsetHighC4_2_1M253 N*onsetHighC4_0_0M253 N-onsetHighC3_2_1M253 N*onsetHighC5_0_0M253 N))))=onsetHighGC3_2_1M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighGC3_2_1M253
 ring

theorem onsetHighGC3_2_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_2_1M253 N := by
 unfold onsetHighGC3_2_1M253
 positivity

def onsetHighGC3_2_2M253 (N : ℤ) : ℤ := ((((((((((((515411351175168*N + 51395900253143040)*N + 2348749212478341120)*N + 65037856749744291840)*N + 1215246093287559266304)*N + 16140971233513423503360)*N + 156250973671995943157760)*N + 1110705814207493760614400)*N + 5753863416074813328457728)*N + 21183584567953458541363200)*N + 52610571450638353601003520)*N + 79137682602899405511720960)*N + 54524142809271850298572800)

theorem onsetHighGC3_2_2M253_eq (N : ℤ) : ((((onsetHighC4_0_0M253 N*onsetHighC4_2_2M253 N-onsetHighC3_0_0M253 N*onsetHighC5_2_2M253 N) + (onsetHighC4_0_1M253 N*onsetHighC4_2_1M253 N-onsetHighC3_0_1M253 N*onsetHighC5_2_1M253 N)) + ((onsetHighC4_0_2M253 N*onsetHighC4_2_0M253 N-onsetHighC3_0_2M253 N*onsetHighC5_2_0M253 N) + (onsetHighC4_1_0M253 N*onsetHighC4_1_2M253 N-onsetHighC3_1_0M253 N*onsetHighC5_1_2M253 N))) + (((onsetHighC4_1_1M253 N*onsetHighC4_1_1M253 N-onsetHighC3_1_1M253 N*onsetHighC5_1_1M253 N) + (onsetHighC4_1_2M253 N*onsetHighC4_1_0M253 N-onsetHighC3_1_2M253 N*onsetHighC5_1_0M253 N)) + ((onsetHighC4_2_0M253 N*onsetHighC4_0_2M253 N-onsetHighC3_2_0M253 N*onsetHighC5_0_2M253 N) + ((onsetHighC4_2_1M253 N*onsetHighC4_0_1M253 N-onsetHighC3_2_1M253 N*onsetHighC5_0_1M253 N) + (onsetHighC4_2_2M253 N*onsetHighC4_0_0M253 N-onsetHighC3_2_2M253 N*onsetHighC5_0_0M253 N)))))=onsetHighGC3_2_2M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighGC3_2_2M253
 ring

theorem onsetHighGC3_2_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_2_2M253 N := by
 unfold onsetHighGC3_2_2M253
 positivity

def onsetHighGC3_2_3M253 (N : ℤ) : ℤ := ((((((((((((199607766220800*N + 20106544725098496)*N + 927877938982944768)*N + 25936628478545756160)*N + 489040125842706923520)*N + 6552060006830784380928)*N + 63954551407918945665024)*N + 458226729879963708948480)*N + 2391700318039046339297280)*N + 8868454132301740508184576)*N + 22174881735160577679556608)*N + 33570193325654310434242560)*N + 23269571080459650913075200)

theorem onsetHighGC3_2_3M253_eq (N : ℤ) : ((((onsetHighC4_0_1M253 N*onsetHighC4_2_2M253 N-onsetHighC3_0_1M253 N*onsetHighC5_2_2M253 N) + (onsetHighC4_0_2M253 N*onsetHighC4_2_1M253 N-onsetHighC3_0_2M253 N*onsetHighC5_2_1M253 N)) + ((onsetHighC4_0_3M253 N*onsetHighC4_2_0M253 N-onsetHighC3_0_3M253 N*onsetHighC5_2_0M253 N) + ((onsetHighC4_1_0M253 N*onsetHighC4_1_3M253 N-onsetHighC3_1_0M253 N*onsetHighC5_1_3M253 N) + (onsetHighC4_1_1M253 N*onsetHighC4_1_2M253 N-onsetHighC3_1_1M253 N*onsetHighC5_1_2M253 N)))) + (((onsetHighC4_1_2M253 N*onsetHighC4_1_1M253 N-onsetHighC3_1_2M253 N*onsetHighC5_1_1M253 N) + (onsetHighC4_1_3M253 N*onsetHighC4_1_0M253 N-onsetHighC3_1_3M253 N*onsetHighC5_1_0M253 N)) + ((onsetHighC4_2_0M253 N*onsetHighC4_0_3M253 N-onsetHighC3_2_0M253 N*onsetHighC5_0_3M253 N) + ((onsetHighC4_2_1M253 N*onsetHighC4_0_2M253 N-onsetHighC3_2_1M253 N*onsetHighC5_0_2M253 N) + (onsetHighC4_2_2M253 N*onsetHighC4_0_1M253 N-onsetHighC3_2_2M253 N*onsetHighC5_0_1M253 N)))))=onsetHighGC3_2_3M253 N := by
 unfold onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighGC3_2_3M253
 ring

theorem onsetHighGC3_2_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_2_3M253 N := by
 unfold onsetHighGC3_2_3M253
 positivity

def onsetHighGC3_2_4M253 (N : ℤ) : ℤ := ((((((((((((43032992808960*N + 4382981200281600)*N + 204451960269570048)*N + 5774682386721669120)*N + 109978884161855815680)*N + 1487725508380333178880)*N + 14656257453853627121664)*N + 105941022244215800463360)*N + 557633177792826894581760)*N + 2084374360594521674219520)*N + 5251770632403812309925888)*N + 8008463203116988305899520)*N + 5589500987312609904230400)

theorem onsetHighGC3_2_4M253_eq (N : ℤ) : ((((onsetHighC4_0_2M253 N*onsetHighC4_2_2M253 N-onsetHighC3_0_2M253 N*onsetHighC5_2_2M253 N) + (onsetHighC4_0_3M253 N*onsetHighC4_2_1M253 N-onsetHighC3_0_3M253 N*onsetHighC5_2_1M253 N)) + ((onsetHighC4_0_4M253 N*onsetHighC4_2_0M253 N-onsetHighC3_0_4M253 N*onsetHighC5_2_0M253 N) + (onsetHighC4_1_1M253 N*onsetHighC4_1_3M253 N-onsetHighC3_1_1M253 N*onsetHighC5_1_3M253 N))) + (((onsetHighC4_1_2M253 N*onsetHighC4_1_2M253 N-onsetHighC3_1_2M253 N*onsetHighC5_1_2M253 N) + (onsetHighC4_1_3M253 N*onsetHighC4_1_1M253 N-onsetHighC3_1_3M253 N*onsetHighC5_1_1M253 N)) + ((onsetHighC4_2_0M253 N*onsetHighC4_0_4M253 N-onsetHighC3_2_0M253 N*onsetHighC5_0_4M253 N) + ((onsetHighC4_2_1M253 N*onsetHighC4_0_3M253 N-onsetHighC3_2_1M253 N*onsetHighC5_0_3M253 N) + (onsetHighC4_2_2M253 N*onsetHighC4_0_2M253 N-onsetHighC3_2_2M253 N*onsetHighC5_0_2M253 N)))))=onsetHighGC3_2_4M253 N := by
 unfold onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighGC3_2_4M253
 ring

theorem onsetHighGC3_2_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_2_4M253 N := by
 unfold onsetHighGC3_2_4M253
 positivity

def onsetHighGC3_2_5M253 (N : ℤ) : ℤ := ((((((((((((4894274617344*N + 504571650637824)*N + 23816330633281536)*N + 680438086584238080)*N + 13103314398684905472)*N + 179156370891729272832)*N + 1783164638071549329408)*N + 13016982203358369546240)*N + 69165725929326624374784)*N + 260875695476536023711744)*N + 662980452994500021190656)*N + 1019308748567678614241280)*N + 717000393149038146355200)

theorem onsetHighGC3_2_5M253_eq (N : ℤ) : (((onsetHighC4_0_3M253 N*onsetHighC4_2_2M253 N-onsetHighC3_0_3M253 N*onsetHighC5_2_2M253 N) + ((onsetHighC4_0_4M253 N*onsetHighC4_2_1M253 N-onsetHighC3_0_4M253 N*onsetHighC5_2_1M253 N) + (onsetHighC4_1_2M253 N*onsetHighC4_1_3M253 N-onsetHighC3_1_2M253 N*onsetHighC5_1_3M253 N))) + ((onsetHighC4_1_3M253 N*onsetHighC4_1_2M253 N-onsetHighC3_1_3M253 N*onsetHighC5_1_2M253 N) + ((onsetHighC4_2_1M253 N*onsetHighC4_0_4M253 N-onsetHighC3_2_1M253 N*onsetHighC5_0_4M253 N) + (onsetHighC4_2_2M253 N*onsetHighC4_0_3M253 N-onsetHighC3_2_2M253 N*onsetHighC5_0_3M253 N))))=onsetHighGC3_2_5M253 N := by
 unfold onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighGC3_2_5M253
 ring

theorem onsetHighGC3_2_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_2_5M253 N := by
 unfold onsetHighGC3_2_5M253
 positivity

def onsetHighGC3_2_6M253 (N : ℤ) : ℤ := ((((((((((((229361319936*N + 23960859181056)*N + 1145713962516480)*N + 33148559708651520)*N + 646202945524727808)*N + 8940408467056754688)*N + 90006042260865024000)*N + 664291200856227840000)*N + 3567116682349870841856)*N + 13590881163673344147456)*N + 34874857987609429278720)*N + 54116184460893833134080)*N + 38403011117666480947200)

theorem onsetHighGC3_2_6M253_eq (N : ℤ) : ((onsetHighC4_0_4M253 N*onsetHighC4_2_2M253 N-onsetHighC3_0_4M253 N*onsetHighC5_2_2M253 N) + ((onsetHighC4_1_3M253 N*onsetHighC4_1_3M253 N-onsetHighC3_1_3M253 N*onsetHighC5_1_3M253 N) + (onsetHighC4_2_2M253 N*onsetHighC4_0_4M253 N-onsetHighC3_2_2M253 N*onsetHighC5_0_4M253 N)))=onsetHighGC3_2_6M253 N := by
 unfold onsetHighC3_0_4M253 onsetHighC3_1_3M253 onsetHighC3_2_2M253 onsetHighC4_0_4M253 onsetHighC4_1_3M253 onsetHighC4_2_2M253 onsetHighC5_0_4M253 onsetHighC5_1_3M253 onsetHighC5_2_2M253 onsetHighGC3_2_6M253
 ring

theorem onsetHighGC3_2_6M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_2_6M253 N := by
 unfold onsetHighGC3_2_6M253
 positivity

def onsetHighGC3_3_0M253 (N : ℤ) : ℤ := ((((((((((((468667619868672*N + 45786255606153216)*N + 2050798830193999872)*N + 55683494686186536960)*N + 1020702668076242436096)*N + 13305908471988992606208)*N + 126480802940490765828096)*N + 883274020751210722099200)*N + 4497353224857350151340032)*N + 16281797683539265677950976)*N + 39781653274833115428421632)*N + 58897632505607902471127040)*N + 39957805671138363359232000)

theorem onsetHighGC3_3_0M253_eq (N : ℤ) : (((onsetHighC4_0_0M253 N*onsetHighC4_3_0M253 N-onsetHighC3_0_0M253 N*onsetHighC5_3_0M253 N) + (onsetHighC4_1_0M253 N*onsetHighC4_2_0M253 N-onsetHighC3_1_0M253 N*onsetHighC5_2_0M253 N)) + ((onsetHighC4_2_0M253 N*onsetHighC4_1_0M253 N-onsetHighC3_2_0M253 N*onsetHighC5_1_0M253 N) + (onsetHighC4_3_0M253 N*onsetHighC4_0_0M253 N-onsetHighC3_3_0M253 N*onsetHighC5_0_0M253 N)))=onsetHighGC3_3_0M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_1_0M253 onsetHighC3_2_0M253 onsetHighC3_3_0M253 onsetHighC4_0_0M253 onsetHighC4_1_0M253 onsetHighC4_2_0M253 onsetHighC4_3_0M253 onsetHighC5_0_0M253 onsetHighC5_1_0M253 onsetHighC5_2_0M253 onsetHighC5_3_0M253 onsetHighGC3_3_0M253
 ring

theorem onsetHighGC3_3_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_3_0M253 N := by
 unfold onsetHighGC3_3_0M253
 positivity

def onsetHighGC3_3_1M253 (N : ℤ) : ℤ := ((((((((((((687215134900224*N + 67733702905430016)*N + 3059795925254799360)*N + 83761681517500170240)*N + 1547434246059507843072)*N + 20323249143979812323328)*N + 194558152969851237826560)*N + 1367847036028244129218560)*N + 7009049190902350555643904)*N + 25527601090258621529849856)*N + 62725635445529756518318080)*N + 93361520942927683426713600)*N + 63655734658409753945702400)

theorem onsetHighGC3_3_1M253_eq (N : ℤ) : ((((onsetHighC4_0_0M253 N*onsetHighC4_3_1M253 N-onsetHighC3_0_0M253 N*onsetHighC5_3_1M253 N) + (onsetHighC4_0_1M253 N*onsetHighC4_3_0M253 N-onsetHighC3_0_1M253 N*onsetHighC5_3_0M253 N)) + ((onsetHighC4_1_0M253 N*onsetHighC4_2_1M253 N-onsetHighC3_1_0M253 N*onsetHighC5_2_1M253 N) + (onsetHighC4_1_1M253 N*onsetHighC4_2_0M253 N-onsetHighC3_1_1M253 N*onsetHighC5_2_0M253 N))) + (((onsetHighC4_2_0M253 N*onsetHighC4_1_1M253 N-onsetHighC3_2_0M253 N*onsetHighC5_1_1M253 N) + (onsetHighC4_2_1M253 N*onsetHighC4_1_0M253 N-onsetHighC3_2_1M253 N*onsetHighC5_1_0M253 N)) + ((onsetHighC4_3_0M253 N*onsetHighC4_0_1M253 N-onsetHighC3_3_0M253 N*onsetHighC5_0_1M253 N) + (onsetHighC4_3_1M253 N*onsetHighC4_0_0M253 N-onsetHighC3_3_1M253 N*onsetHighC5_0_0M253 N))))=onsetHighGC3_3_1M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighGC3_3_1M253
 ring

theorem onsetHighGC3_3_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_3_1M253 N := by
 unfold onsetHighGC3_3_1M253
 positivity

def onsetHighGC3_3_2M253 (N : ℤ) : ℤ := ((((((((((((399215532441600*N + 39729646522073088)*N + 1811569011691880448)*N + 50038882251822858240)*N + 932426833342003937280)*N + 12347319502508569657344)*N + 119135424466140645556224)*N + 843870826874448461168640)*N + 4354927906129712900997120)*N + 15968137506093939876691968)*N + 39486990827547237583945728)*N + 59127278984159095778181120)*N + 40543319521504707644620800)

theorem onsetHighGC3_3_2M253_eq (N : ℤ) : ((((onsetHighC4_0_1M253 N*onsetHighC4_3_1M253 N-onsetHighC3_0_1M253 N*onsetHighC5_3_1M253 N) + (onsetHighC4_0_2M253 N*onsetHighC4_3_0M253 N-onsetHighC3_0_2M253 N*onsetHighC5_3_0M253 N)) + ((onsetHighC4_1_0M253 N*onsetHighC4_2_2M253 N-onsetHighC3_1_0M253 N*onsetHighC5_2_2M253 N) + ((onsetHighC4_1_1M253 N*onsetHighC4_2_1M253 N-onsetHighC3_1_1M253 N*onsetHighC5_2_1M253 N) + (onsetHighC4_1_2M253 N*onsetHighC4_2_0M253 N-onsetHighC3_1_2M253 N*onsetHighC5_2_0M253 N)))) + (((onsetHighC4_2_0M253 N*onsetHighC4_1_2M253 N-onsetHighC3_2_0M253 N*onsetHighC5_1_2M253 N) + (onsetHighC4_2_1M253 N*onsetHighC4_1_1M253 N-onsetHighC3_2_1M253 N*onsetHighC5_1_1M253 N)) + ((onsetHighC4_2_2M253 N*onsetHighC4_1_0M253 N-onsetHighC3_2_2M253 N*onsetHighC5_1_0M253 N) + ((onsetHighC4_3_0M253 N*onsetHighC4_0_2M253 N-onsetHighC3_3_0M253 N*onsetHighC5_0_2M253 N) + (onsetHighC4_3_1M253 N*onsetHighC4_0_1M253 N-onsetHighC3_3_1M253 N*onsetHighC5_0_1M253 N)))))=onsetHighGC3_3_2M253 N := by
 unfold onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighGC3_3_2M253
 ring

theorem onsetHighGC3_3_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_3_2M253 N := by
 unfold onsetHighGC3_3_2M253
 positivity

def onsetHighGC3_3_3M253 (N : ℤ) : ℤ := ((((((((((((114754647490560*N + 11541926683607040)*N + 531711223067049984)*N + 14833038835046154240)*N + 279045413925877186560)*N + 3729077537453946961920)*N + 36296673645685227651072)*N + 259255043336099620454400)*N + 1348611263207558373703680)*N + 4982486695884798822973440)*N + 12409852743732875972050944)*N + 18709389703063559232552960)*N + 12911981893756102538035200)

theorem onsetHighGC3_3_3M253_eq (N : ℤ) : ((((onsetHighC4_0_2M253 N*onsetHighC4_3_1M253 N-onsetHighC3_0_2M253 N*onsetHighC5_3_1M253 N) + (onsetHighC4_0_3M253 N*onsetHighC4_3_0M253 N-onsetHighC3_0_3M253 N*onsetHighC5_3_0M253 N)) + ((onsetHighC4_1_1M253 N*onsetHighC4_2_2M253 N-onsetHighC3_1_1M253 N*onsetHighC5_2_2M253 N) + ((onsetHighC4_1_2M253 N*onsetHighC4_2_1M253 N-onsetHighC3_1_2M253 N*onsetHighC5_2_1M253 N) + (onsetHighC4_1_3M253 N*onsetHighC4_2_0M253 N-onsetHighC3_1_3M253 N*onsetHighC5_2_0M253 N)))) + (((onsetHighC4_2_0M253 N*onsetHighC4_1_3M253 N-onsetHighC3_2_0M253 N*onsetHighC5_1_3M253 N) + (onsetHighC4_2_1M253 N*onsetHighC4_1_2M253 N-onsetHighC3_2_1M253 N*onsetHighC5_1_2M253 N)) + ((onsetHighC4_2_2M253 N*onsetHighC4_1_1M253 N-onsetHighC3_2_2M253 N*onsetHighC5_1_1M253 N) + ((onsetHighC4_3_0M253 N*onsetHighC4_0_3M253 N-onsetHighC3_3_0M253 N*onsetHighC5_0_3M253 N) + (onsetHighC4_3_1M253 N*onsetHighC4_0_2M253 N-onsetHighC3_3_1M253 N*onsetHighC5_0_2M253 N)))))=onsetHighGC3_3_3M253 N := by
 unfold onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighGC3_3_3M253
 ring

theorem onsetHighGC3_3_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_3_3M253 N := by
 unfold onsetHighGC3_3_3M253
 positivity

def onsetHighGC3_3_4M253 (N : ℤ) : ℤ := ((((((((((((16314248724480*N + 1660052758855680)*N + 77343488244449280)*N + 2181348850327879680)*N + 41471472671014256640)*N + 559862753475805839360)*N + 5502689584744625602560)*N + 39672039642080477184000)*N + 208216301941373428039680)*N + 775832452660193588674560)*N + 1948086311971779913973760)*N + 2959718056008430159134720)*N + 2057624824464390743654400)

theorem onsetHighGC3_3_4M253_eq (N : ℤ) : ((((onsetHighC4_0_3M253 N*onsetHighC4_3_1M253 N-onsetHighC3_0_3M253 N*onsetHighC5_3_1M253 N) + (onsetHighC4_0_4M253 N*onsetHighC4_3_0M253 N-onsetHighC3_0_4M253 N*onsetHighC5_3_0M253 N)) + ((onsetHighC4_1_2M253 N*onsetHighC4_2_2M253 N-onsetHighC3_1_2M253 N*onsetHighC5_2_2M253 N) + (onsetHighC4_1_3M253 N*onsetHighC4_2_1M253 N-onsetHighC3_1_3M253 N*onsetHighC5_2_1M253 N))) + (((onsetHighC4_2_1M253 N*onsetHighC4_1_3M253 N-onsetHighC3_2_1M253 N*onsetHighC5_1_3M253 N) + (onsetHighC4_2_2M253 N*onsetHighC4_1_2M253 N-onsetHighC3_2_2M253 N*onsetHighC5_1_2M253 N)) + ((onsetHighC4_3_0M253 N*onsetHighC4_0_4M253 N-onsetHighC3_3_0M253 N*onsetHighC5_0_4M253 N) + (onsetHighC4_3_1M253 N*onsetHighC4_0_3M253 N-onsetHighC3_3_1M253 N*onsetHighC5_0_3M253 N))))=onsetHighGC3_3_4M253 N := by
 unfold onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighGC3_3_4M253
 ring

theorem onsetHighGC3_3_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_3_4M253 N := by
 unfold onsetHighGC3_3_4M253
 positivity

def onsetHighGC3_3_5M253 (N : ℤ) : ℤ := ((((((((((((917445279744*N + 94548655079424)*N + 4460062986731520)*N + 127312599900487680)*N + 2448820360584364032)*N + 33432855272711258112)*N + 332176456147528581120)*N + 2419884895329457274880)*N + 12827870747328091521024)*N + 48255995047903770968064)*N + 122278631933241757532160)*N + 187400188673481312829440)*N + 131366586328760608358400)

theorem onsetHighGC3_3_5M253_eq (N : ℤ) : (((onsetHighC4_0_4M253 N*onsetHighC4_3_1M253 N-onsetHighC3_0_4M253 N*onsetHighC5_3_1M253 N) + (onsetHighC4_1_3M253 N*onsetHighC4_2_2M253 N-onsetHighC3_1_3M253 N*onsetHighC5_2_2M253 N)) + ((onsetHighC4_2_2M253 N*onsetHighC4_1_3M253 N-onsetHighC3_2_2M253 N*onsetHighC5_1_3M253 N) + (onsetHighC4_3_1M253 N*onsetHighC4_0_4M253 N-onsetHighC3_3_1M253 N*onsetHighC5_0_4M253 N)))=onsetHighGC3_3_5M253 N := by
 unfold onsetHighC3_0_4M253 onsetHighC3_1_3M253 onsetHighC3_2_2M253 onsetHighC3_3_1M253 onsetHighC4_0_4M253 onsetHighC4_1_3M253 onsetHighC4_2_2M253 onsetHighC4_3_1M253 onsetHighC5_0_4M253 onsetHighC5_1_3M253 onsetHighC5_2_2M253 onsetHighC5_3_1M253 onsetHighGC3_3_5M253
 ring

theorem onsetHighGC3_3_5M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_3_5M253 N := by
 unfold onsetHighGC3_3_5M253
 positivity

def onsetHighGC3_4_0M253 (N : ℤ) : ℤ := ((((((((((((343607567450112*N + 33469769403334656)*N + 1494398586530562048)*N + 40438528601720094720)*N + 738566060101186093056)*N + 9590687050743077142528)*N + 90790106087198334910464)*N + 631266682005217817395200)*N + 3199447339234832037445632)*N + 11527128188307078227951616)*N + 28022480601081377004453888)*N + 41270078382569876847329280)*N + 27846240828309970078924800)

theorem onsetHighGC3_4_0M253_eq (N : ℤ) : (((onsetHighC4_0_0M253 N*onsetHighC4_4_0M253 N-onsetHighC3_0_0M253 N*onsetHighC5_4_0M253 N) + (onsetHighC4_1_0M253 N*onsetHighC4_3_0M253 N-onsetHighC3_1_0M253 N*onsetHighC5_3_0M253 N)) + ((onsetHighC4_2_0M253 N*onsetHighC4_2_0M253 N-onsetHighC3_2_0M253 N*onsetHighC5_2_0M253 N) + ((onsetHighC4_3_0M253 N*onsetHighC4_1_0M253 N-onsetHighC3_3_0M253 N*onsetHighC5_1_0M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_0_0M253 N-onsetHighC3_4_0M253 N*onsetHighC5_0_0M253 N))))=onsetHighGC3_4_0M253 N := by
 unfold onsetHighC3_0_0M253 onsetHighC3_1_0M253 onsetHighC3_2_0M253 onsetHighC3_3_0M253 onsetHighC3_4_0M253 onsetHighC4_0_0M253 onsetHighC4_1_0M253 onsetHighC4_2_0M253 onsetHighC4_3_0M253 onsetHighC4_4_0M253 onsetHighC5_0_0M253 onsetHighC5_1_0M253 onsetHighC5_2_0M253 onsetHighC5_3_0M253 onsetHighC5_4_0M253 onsetHighGC3_4_0M253
 ring

theorem onsetHighGC3_4_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_4_0M253 N := by
 unfold onsetHighGC3_4_0M253
 positivity

def onsetHighGC3_4_1M253 (N : ℤ) : ℤ := ((((((((((((399215532441600*N + 39246203593949184)*N + 1767938301169238016)*N + 48250172497503191040)*N + 888459213323831869440)*N + 11627364743549584146432)*N + 110889735427641267191808)*N + 776471181326855110656000)*N + 3961752184548492021596160)*N + 14364030620772587087069184)*N + 35127816758582721394507776)*N + 52025935291111926678159360)*N + 35289574389640238137344000)

theorem onsetHighGC3_4_1M253_eq (N : ℤ) : ((((onsetHighC4_0_1M253 N*onsetHighC4_4_0M253 N-onsetHighC3_0_1M253 N*onsetHighC5_4_0M253 N) + (onsetHighC4_1_0M253 N*onsetHighC4_3_1M253 N-onsetHighC3_1_0M253 N*onsetHighC5_3_1M253 N)) + ((onsetHighC4_1_1M253 N*onsetHighC4_3_0M253 N-onsetHighC3_1_1M253 N*onsetHighC5_3_0M253 N) + (onsetHighC4_2_0M253 N*onsetHighC4_2_1M253 N-onsetHighC3_2_0M253 N*onsetHighC5_2_1M253 N))) + (((onsetHighC4_2_1M253 N*onsetHighC4_2_0M253 N-onsetHighC3_2_1M253 N*onsetHighC5_2_0M253 N) + (onsetHighC4_3_0M253 N*onsetHighC4_1_1M253 N-onsetHighC3_3_0M253 N*onsetHighC5_1_1M253 N)) + ((onsetHighC4_3_1M253 N*onsetHighC4_1_0M253 N-onsetHighC3_3_1M253 N*onsetHighC5_1_0M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_0_1M253 N-onsetHighC3_4_0M253 N*onsetHighC5_0_1M253 N))))=onsetHighGC3_4_1M253 N := by
 unfold onsetHighC3_0_1M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_0_1M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_0_1M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighGC3_4_1M253
 ring

theorem onsetHighGC3_4_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_4_1M253 N := by
 unfold onsetHighGC3_4_1M253
 positivity

def onsetHighGC3_4_2M253 (N : ℤ) : ℤ := ((((((((((((172131971235840*N + 17093855249694720)*N + 777591616671055872)*N + 21422439444051394560)*N + 398042889031746846720)*N + 5254469190179943874560)*N + 50527213410852500668416)*N + 356596635839677527490560)*N + 1833116689923781023498240)*N + 6693690516530926748958720)*N + 16480331268120926230413312)*N + 24564226023271464480276480)*N + 16762754070827563902566400)

theorem onsetHighGC3_4_2M253_eq (N : ℤ) : ((((onsetHighC4_0_2M253 N*onsetHighC4_4_0M253 N-onsetHighC3_0_2M253 N*onsetHighC5_4_0M253 N) + (onsetHighC4_1_1M253 N*onsetHighC4_3_1M253 N-onsetHighC3_1_1M253 N*onsetHighC5_3_1M253 N)) + ((onsetHighC4_1_2M253 N*onsetHighC4_3_0M253 N-onsetHighC3_1_2M253 N*onsetHighC5_3_0M253 N) + (onsetHighC4_2_0M253 N*onsetHighC4_2_2M253 N-onsetHighC3_2_0M253 N*onsetHighC5_2_2M253 N))) + (((onsetHighC4_2_1M253 N*onsetHighC4_2_1M253 N-onsetHighC3_2_1M253 N*onsetHighC5_2_1M253 N) + (onsetHighC4_2_2M253 N*onsetHighC4_2_0M253 N-onsetHighC3_2_2M253 N*onsetHighC5_2_0M253 N)) + ((onsetHighC4_3_0M253 N*onsetHighC4_1_2M253 N-onsetHighC3_3_0M253 N*onsetHighC5_1_2M253 N) + ((onsetHighC4_3_1M253 N*onsetHighC4_1_1M253 N-onsetHighC3_3_1M253 N*onsetHighC5_1_1M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_0_2M253 N-onsetHighC3_4_0M253 N*onsetHighC5_0_2M253 N)))))=onsetHighGC3_4_2M253 N := by
 unfold onsetHighC3_0_2M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_0_2M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_0_2M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighGC3_4_2M253
 ring

theorem onsetHighGC3_4_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_4_2M253 N := by
 unfold onsetHighGC3_4_2M253
 positivity

def onsetHighGC3_4_3M253 (N : ℤ) : ℤ := ((((((((((((32628497448960*N + 3276400031170560)*N + 150654608945971200)*N + 4193858660377559040)*N + 78708288821510799360)*N + 1049039649698501099520)*N + 10180876708895281643520)*N + 72486611084379299512320)*N + 375765141615074468167680)*N + 1383137127385460095057920)*N + 3431384280385543895777280)*N + 5151630457636183194992640)*N + 3539678853269956755456000)

theorem onsetHighGC3_4_3M253_eq (N : ℤ) : ((((onsetHighC4_0_3M253 N*onsetHighC4_4_0M253 N-onsetHighC3_0_3M253 N*onsetHighC5_4_0M253 N) + (onsetHighC4_1_2M253 N*onsetHighC4_3_1M253 N-onsetHighC3_1_2M253 N*onsetHighC5_3_1M253 N)) + ((onsetHighC4_1_3M253 N*onsetHighC4_3_0M253 N-onsetHighC3_1_3M253 N*onsetHighC5_3_0M253 N) + (onsetHighC4_2_1M253 N*onsetHighC4_2_2M253 N-onsetHighC3_2_1M253 N*onsetHighC5_2_2M253 N))) + (((onsetHighC4_2_2M253 N*onsetHighC4_2_1M253 N-onsetHighC3_2_2M253 N*onsetHighC5_2_1M253 N) + (onsetHighC4_3_0M253 N*onsetHighC4_1_3M253 N-onsetHighC3_3_0M253 N*onsetHighC5_1_3M253 N)) + ((onsetHighC4_3_1M253 N*onsetHighC4_1_2M253 N-onsetHighC3_3_1M253 N*onsetHighC5_1_2M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_0_3M253 N-onsetHighC3_4_0M253 N*onsetHighC5_0_3M253 N))))=onsetHighGC3_4_3M253 N := by
 unfold onsetHighC3_0_3M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_0_3M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_0_3M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighGC3_4_3M253
 ring

theorem onsetHighGC3_4_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_4_3M253 N := by
 unfold onsetHighGC3_4_3M253
 positivity

def onsetHighGC3_4_4M253 (N : ℤ) : ℤ := ((((((((((((2293613199360*N + 233134683586560)*N + 10847601347788800)*N + 305453866785177600)*N + 5796442454014033920)*N + 78084363834863124480)*N + 765608125559750000640)*N + 5504842190855303331840)*N + 28806206457520155525120)*N + 106988154438534939279360)*N + 267708212142651314012160)*N + 405212964825884613672960)*N + 280593245423671817011200)

theorem onsetHighGC3_4_4M253_eq (N : ℤ) : (((onsetHighC4_0_4M253 N*onsetHighC4_4_0M253 N-onsetHighC3_0_4M253 N*onsetHighC5_4_0M253 N) + (onsetHighC4_1_3M253 N*onsetHighC4_3_1M253 N-onsetHighC3_1_3M253 N*onsetHighC5_3_1M253 N)) + ((onsetHighC4_2_2M253 N*onsetHighC4_2_2M253 N-onsetHighC3_2_2M253 N*onsetHighC5_2_2M253 N) + ((onsetHighC4_3_1M253 N*onsetHighC4_1_3M253 N-onsetHighC3_3_1M253 N*onsetHighC5_1_3M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_0_4M253 N-onsetHighC3_4_0M253 N*onsetHighC5_0_4M253 N))))=onsetHighGC3_4_4M253 N := by
 unfold onsetHighC3_0_4M253 onsetHighC3_1_3M253 onsetHighC3_2_2M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_0_4M253 onsetHighC4_1_3M253 onsetHighC4_2_2M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_0_4M253 onsetHighC5_1_3M253 onsetHighC5_2_2M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighGC3_4_4M253
 ring

theorem onsetHighGC3_4_4M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_4_4M253 N := by
 unfold onsetHighGC3_4_4M253
 positivity

def onsetHighGC3_5_0M253 (N : ℤ) : ℤ := ((((((((((((159686212976640*N + 15505104266330112)*N + 689945498559184896)*N + 18602607731634339840)*N + 338453217548225740800)*N + 4377128055142682198016)*N + 41257980356451901636608)*N + 285570531709346544353280)*N + 1440489917588419887759360)*N + 5164140310651868201091072)*N + 12489238293294702037303296)*N + 18294996382680834511994880)*N + 12275840813929534704844800)

theorem onsetHighGC3_5_0M253_eq (N : ℤ) : (((onsetHighC4_1_0M253 N*onsetHighC4_4_0M253 N-onsetHighC3_1_0M253 N*onsetHighC5_4_0M253 N) + (onsetHighC4_2_0M253 N*onsetHighC4_3_0M253 N-onsetHighC3_2_0M253 N*onsetHighC5_3_0M253 N)) + ((onsetHighC4_3_0M253 N*onsetHighC4_2_0M253 N-onsetHighC3_3_0M253 N*onsetHighC5_2_0M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_1_0M253 N-onsetHighC3_4_0M253 N*onsetHighC5_1_0M253 N)))=onsetHighGC3_5_0M253 N := by
 unfold onsetHighC3_1_0M253 onsetHighC3_2_0M253 onsetHighC3_3_0M253 onsetHighC3_4_0M253 onsetHighC4_1_0M253 onsetHighC4_2_0M253 onsetHighC4_3_0M253 onsetHighC4_4_0M253 onsetHighC5_1_0M253 onsetHighC5_2_0M253 onsetHighC5_3_0M253 onsetHighC5_4_0M253 onsetHighGC3_5_0M253
 ring

theorem onsetHighGC3_5_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_5_0M253 N := by
 unfold onsetHighGC3_5_0M253
 positivity

def onsetHighGC3_5_1M253 (N : ℤ) : ℤ := ((((((((((((137705576988672*N + 13499856379183104)*N + 606305749831778304)*N + 16493653098422599680)*N + 302653812470779478016)*N + 3946178642832022044672)*N + 37486087358716965814272)*N + 261387963965215557550080)*N + 1327791173935880378253312)*N + 4791870807875051427201024)*N + 11662031884899971890151424)*N + 17185001165673925642813440)*N + 11595772326272340197376000)

theorem onsetHighGC3_5_1M253_eq (N : ℤ) : (((onsetHighC4_1_1M253 N*onsetHighC4_4_0M253 N-onsetHighC3_1_1M253 N*onsetHighC5_4_0M253 N) + ((onsetHighC4_2_0M253 N*onsetHighC4_3_1M253 N-onsetHighC3_2_0M253 N*onsetHighC5_3_1M253 N) + (onsetHighC4_2_1M253 N*onsetHighC4_3_0M253 N-onsetHighC3_2_1M253 N*onsetHighC5_3_0M253 N))) + ((onsetHighC4_3_0M253 N*onsetHighC4_2_1M253 N-onsetHighC3_3_0M253 N*onsetHighC5_2_1M253 N) + ((onsetHighC4_3_1M253 N*onsetHighC4_2_0M253 N-onsetHighC3_3_1M253 N*onsetHighC5_2_0M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_1_1M253 N-onsetHighC3_4_0M253 N*onsetHighC5_1_1M253 N))))=onsetHighGC3_5_1M253 N := by
 unfold onsetHighC3_1_1M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_1_1M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_1_1M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighGC3_5_1M253
 ring

theorem onsetHighGC3_5_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_5_1M253 N := by
 unfold onsetHighGC3_5_1M253
 positivity

def onsetHighGC3_5_2M253 (N : ℤ) : ℤ := ((((((((((((39154196938752*N + 3879233453555712)*N + 176014121911713792)*N + 4835601571255418880)*N + 89575609576955314176)*N + 1178579252230924271616)*N + 11293216824270400782336)*N + 79401026374884623646720)*N + 406529906054965569257472)*N + 1478161809598278870761472)*N + 3623103254708409214697472)*N + 5375082762343233670348800)*N + 3650129754891411456000000)

theorem onsetHighGC3_5_2M253_eq (N : ℤ) : (((onsetHighC4_1_2M253 N*onsetHighC4_4_0M253 N-onsetHighC3_1_2M253 N*onsetHighC5_4_0M253 N) + ((onsetHighC4_2_1M253 N*onsetHighC4_3_1M253 N-onsetHighC3_2_1M253 N*onsetHighC5_3_1M253 N) + (onsetHighC4_2_2M253 N*onsetHighC4_3_0M253 N-onsetHighC3_2_2M253 N*onsetHighC5_3_0M253 N))) + ((onsetHighC4_3_0M253 N*onsetHighC4_2_2M253 N-onsetHighC3_3_0M253 N*onsetHighC5_2_2M253 N) + ((onsetHighC4_3_1M253 N*onsetHighC4_2_1M253 N-onsetHighC3_3_1M253 N*onsetHighC5_2_1M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_1_2M253 N-onsetHighC3_4_0M253 N*onsetHighC5_1_2M253 N))))=onsetHighGC3_5_2M253 N := by
 unfold onsetHighC3_1_2M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_1_2M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_1_2M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighGC3_5_2M253
 ring

theorem onsetHighGC3_5_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_5_2M253 N := by
 unfold onsetHighGC3_5_2M253
 positivity

def onsetHighGC3_5_3M253 (N : ℤ) : ℤ := ((((((((((((3669781118976*N + 367836367159296)*N + 16879154028871680)*N + 468795079230750720)*N + 8775631122777243648)*N + 116634014810005045248)*N + 1128447844898486353920)*N + 8007678995190125690880)*N + 41362843601261193854976)*N + 151670218558844049555456)*N + 374753678462701771161600)*N + 560231545188934641254400)*N + 383215149871862199091200)

theorem onsetHighGC3_5_3M253_eq (N : ℤ) : (((onsetHighC4_1_3M253 N*onsetHighC4_4_0M253 N-onsetHighC3_1_3M253 N*onsetHighC5_4_0M253 N) + (onsetHighC4_2_2M253 N*onsetHighC4_3_1M253 N-onsetHighC3_2_2M253 N*onsetHighC5_3_1M253 N)) + ((onsetHighC4_3_1M253 N*onsetHighC4_2_2M253 N-onsetHighC3_3_1M253 N*onsetHighC5_2_2M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_1_3M253 N-onsetHighC3_4_0M253 N*onsetHighC5_1_3M253 N)))=onsetHighGC3_5_3M253 N := by
 unfold onsetHighC3_1_3M253 onsetHighC3_2_2M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_1_3M253 onsetHighC4_2_2M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_1_3M253 onsetHighC5_2_2M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighGC3_5_3M253
 ring

theorem onsetHighGC3_5_3M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_5_3M253 N := by
 unfold onsetHighGC3_5_3M253
 positivity

def onsetHighGC3_6_0M253 (N : ℤ) : ℤ := ((((((((((((45901858996224*N + 4441542852870144)*N + 196916945721753600)*N + 5288835277651968000)*N + 95831736410336919552)*N + 1234043443718098255872)*N + 11579407206880892682240)*N + 79769584039961139609600)*N + 400396898571129270042624)*N + 1428069167068838136643584)*N + 3435388007067282804572160)*N + 5004755194518887399424000)*N + 3339172864675862839296000)

theorem onsetHighGC3_6_0M253_eq (N : ℤ) : ((onsetHighC4_2_0M253 N*onsetHighC4_4_0M253 N-onsetHighC3_2_0M253 N*onsetHighC5_4_0M253 N) + ((onsetHighC4_3_0M253 N*onsetHighC4_3_0M253 N-onsetHighC3_3_0M253 N*onsetHighC5_3_0M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_2_0M253 N-onsetHighC3_4_0M253 N*onsetHighC5_2_0M253 N)))=onsetHighGC3_6_0M253 N := by
 unfold onsetHighC3_2_0M253 onsetHighC3_3_0M253 onsetHighC3_4_0M253 onsetHighC4_2_0M253 onsetHighC4_3_0M253 onsetHighC4_4_0M253 onsetHighC5_2_0M253 onsetHighC5_3_0M253 onsetHighC5_4_0M253 onsetHighGC3_6_0M253
 ring

theorem onsetHighGC3_6_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_6_0M253 N := by
 unfold onsetHighGC3_6_0M253
 positivity

def onsetHighGC3_6_1M253 (N : ℤ) : ℤ := ((((((((((((26102797959168*N + 2551191246471168)*N + 114206763544215552)*N + 3096045467184660480)*N + 56601651536172417024)*N + 735112823761759371264)*N + 6954156533293919502336)*N + 48279392987485443194880)*N + 244126771297305973751808)*N + 876821262330408015495168)*N + 2123319265281703607795712)*N + 3112753154047004851568640)*N + 2089162393201090245427200)

theorem onsetHighGC3_6_1M253_eq (N : ℤ) : (((onsetHighC4_2_1M253 N*onsetHighC4_4_0M253 N-onsetHighC3_2_1M253 N*onsetHighC5_4_0M253 N) + (onsetHighC4_3_0M253 N*onsetHighC4_3_1M253 N-onsetHighC3_3_0M253 N*onsetHighC5_3_1M253 N)) + ((onsetHighC4_3_1M253 N*onsetHighC4_3_0M253 N-onsetHighC3_3_1M253 N*onsetHighC5_3_0M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_2_1M253 N-onsetHighC3_4_0M253 N*onsetHighC5_2_1M253 N)))=onsetHighGC3_6_1M253 N := by
 unfold onsetHighC3_2_1M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_2_1M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_2_1M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighGC3_6_1M253
 ring

theorem onsetHighGC3_6_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_6_1M253 N := by
 unfold onsetHighGC3_6_1M253
 positivity

def onsetHighGC3_6_2M253 (N : ℤ) : ℤ := ((((((((((((3669781118976*N + 362657240580096)*N + 16409227564154880)*N + 449447838854676480)*N + 8298567039480496128)*N + 108806067689638330368)*N + 1038701536988155084800)*N + 7274081530464153108480)*N + 37087432423659427332096)*N + 134259627179368865857536)*N + 327570237079230095032320)*N + 483642672182958269399040)*N + 326801134645089966489600)

theorem onsetHighGC3_6_2M253_eq (N : ℤ) : ((onsetHighC4_2_2M253 N*onsetHighC4_4_0M253 N-onsetHighC3_2_2M253 N*onsetHighC5_4_0M253 N) + ((onsetHighC4_3_1M253 N*onsetHighC4_3_1M253 N-onsetHighC3_3_1M253 N*onsetHighC5_3_1M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_2_2M253 N-onsetHighC3_4_0M253 N*onsetHighC5_2_2M253 N)))=onsetHighGC3_6_2M253 N := by
 unfold onsetHighC3_2_2M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_2_2M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_2_2M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighGC3_6_2M253
 ring

theorem onsetHighGC3_6_2M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_6_2M253 N := by
 unfold onsetHighGC3_6_2M253
 positivity

def onsetHighGC3_7_0M253 (N : ℤ) : ℤ := ((((((((((((7457942274048*N + 718921959211008)*N + 31747352561713152)*N + 849132896114442240)*N + 15318971380414808064)*N + 196367099396949540864)*N + 1833821420280197677056)*N + 12570620607343865364480)*N + 62773667289013564735488)*N + 222702545234694166806528)*N + 532802225414636927188992)*N + 771820419657832889057280)*N + 511974581578266614169600)

theorem onsetHighGC3_7_0M253_eq (N : ℤ) : ((onsetHighC4_3_0M253 N*onsetHighC4_4_0M253 N-onsetHighC3_3_0M253 N*onsetHighC5_4_0M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_3_0M253 N-onsetHighC3_4_0M253 N*onsetHighC5_3_0M253 N))=onsetHighGC3_7_0M253 N := by
 unfold onsetHighC3_3_0M253 onsetHighC3_4_0M253 onsetHighC4_3_0M253 onsetHighC4_4_0M253 onsetHighC5_3_0M253 onsetHighC5_4_0M253 onsetHighGC3_7_0M253
 ring

theorem onsetHighGC3_7_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_7_0M253 N := by
 unfold onsetHighGC3_7_0M253
 positivity

def onsetHighGC3_7_1M253 (N : ℤ) : ℤ := ((((((((((((2097017782272*N + 204273208000512)*N + 9112218721320960)*N + 246100130204221440)*N + 4481396086035972096)*N + 57959673311942148096)*N + 545900596515286548480)*N + 3772591973520679895040)*N + 18985280285288045740032)*N + 67850686186649857032192)*N + 163463852519115781570560)*N + 238363640987592944517120)*N + 159105866548452655104000)

theorem onsetHighGC3_7_1M253_eq (N : ℤ) : ((onsetHighC4_3_1M253 N*onsetHighC4_4_0M253 N-onsetHighC3_3_1M253 N*onsetHighC5_4_0M253 N) + (onsetHighC4_4_0M253 N*onsetHighC4_3_1M253 N-onsetHighC3_4_0M253 N*onsetHighC5_3_1M253 N))=onsetHighGC3_7_1M253 N := by
 unfold onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253 onsetHighGC3_7_1M253
 ring

theorem onsetHighGC3_7_1M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_7_1M253 N := by
 unfold onsetHighGC3_7_1M253
 positivity

def onsetHighGC3_8_0M253 (N : ℤ) : ℤ := ((((((((((((524254445568*N + 50328426774528)*N + 2212945660477440)*N + 58924001195458560)*N + 1058085485143916544)*N + 13497587095195090944)*N + 125419054189321912320)*N + 855277008383838781440)*N + 4248131183119945433088)*N + 14988055048839996899328)*N + 35654804587529675735040)*N + 51349430697877831680000)*N + 33858979549429373337600)

theorem onsetHighGC3_8_0M253_eq (N : ℤ) : (onsetHighC4_4_0M253 N*onsetHighC4_4_0M253 N-onsetHighC3_4_0M253 N*onsetHighC5_4_0M253 N)=onsetHighGC3_8_0M253 N := by
 unfold onsetHighC3_4_0M253 onsetHighC4_4_0M253 onsetHighC5_4_0M253 onsetHighGC3_8_0M253
 ring

theorem onsetHighGC3_8_0M253_nonneg (N : ℤ) (hN : 0≤N) : 0≤onsetHighGC3_8_0M253 N := by
 unfold onsetHighGC3_8_0M253
 positivity

attribute [local irreducible] onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253

def onsetHighCol3_3_0M253 (N R : ℤ) : ℤ := ((onsetHighC3_0_0M253 N*R^0 + onsetHighC3_0_1M253 N*R^1) + (onsetHighC3_0_2M253 N*R^2 + (onsetHighC3_0_3M253 N*R^3 + onsetHighC3_0_4M253 N*R^4)))

def onsetHighCol3_3_1M253 (N R : ℤ) : ℤ := ((onsetHighC3_1_0M253 N*R^0 + onsetHighC3_1_1M253 N*R^1) + (onsetHighC3_1_2M253 N*R^2 + onsetHighC3_1_3M253 N*R^3))

def onsetHighCol3_3_2M253 (N R : ℤ) : ℤ := (onsetHighC3_2_0M253 N*R^0 + (onsetHighC3_2_1M253 N*R^1 + onsetHighC3_2_2M253 N*R^2))

def onsetHighCol3_3_3M253 (N R : ℤ) : ℤ := (onsetHighC3_3_0M253 N*R^0 + onsetHighC3_3_1M253 N*R^1)

def onsetHighCol3_3_4M253 (N R : ℤ) : ℤ := onsetHighC3_4_0M253 N*R^0

theorem onsetHigh_cols3_3M253 (N C R : ℤ) : onsetHighV3M253 N C R=((onsetHighCol3_3_0M253 N R*C^0 + onsetHighCol3_3_1M253 N R*C^1) + (onsetHighCol3_3_2M253 N R*C^2 + (onsetHighCol3_3_3M253 N R*C^3 + onsetHighCol3_3_4M253 N R*C^4))) := by
 rw [onsetHigh_decomp3M253]
 unfold onsetHighCol3_3_0M253 onsetHighCol3_3_1M253 onsetHighCol3_3_2M253 onsetHighCol3_3_3M253 onsetHighCol3_3_4M253
 ring

def onsetHighCol3_4_0M253 (N R : ℤ) : ℤ := ((onsetHighC4_0_0M253 N*R^0 + onsetHighC4_0_1M253 N*R^1) + (onsetHighC4_0_2M253 N*R^2 + (onsetHighC4_0_3M253 N*R^3 + onsetHighC4_0_4M253 N*R^4)))

def onsetHighCol3_4_1M253 (N R : ℤ) : ℤ := ((onsetHighC4_1_0M253 N*R^0 + onsetHighC4_1_1M253 N*R^1) + (onsetHighC4_1_2M253 N*R^2 + onsetHighC4_1_3M253 N*R^3))

def onsetHighCol3_4_2M253 (N R : ℤ) : ℤ := (onsetHighC4_2_0M253 N*R^0 + (onsetHighC4_2_1M253 N*R^1 + onsetHighC4_2_2M253 N*R^2))

def onsetHighCol3_4_3M253 (N R : ℤ) : ℤ := (onsetHighC4_3_0M253 N*R^0 + onsetHighC4_3_1M253 N*R^1)

def onsetHighCol3_4_4M253 (N R : ℤ) : ℤ := onsetHighC4_4_0M253 N*R^0

theorem onsetHigh_cols3_4M253 (N C R : ℤ) : onsetHighV4M253 N C R=((onsetHighCol3_4_0M253 N R*C^0 + onsetHighCol3_4_1M253 N R*C^1) + (onsetHighCol3_4_2M253 N R*C^2 + (onsetHighCol3_4_3M253 N R*C^3 + onsetHighCol3_4_4M253 N R*C^4))) := by
 rw [onsetHigh_decomp4M253]
 unfold onsetHighCol3_4_0M253 onsetHighCol3_4_1M253 onsetHighCol3_4_2M253 onsetHighCol3_4_3M253 onsetHighCol3_4_4M253
 ring

def onsetHighCol3_5_0M253 (N R : ℤ) : ℤ := ((onsetHighC5_0_0M253 N*R^0 + onsetHighC5_0_1M253 N*R^1) + (onsetHighC5_0_2M253 N*R^2 + (onsetHighC5_0_3M253 N*R^3 + onsetHighC5_0_4M253 N*R^4)))

def onsetHighCol3_5_1M253 (N R : ℤ) : ℤ := ((onsetHighC5_1_0M253 N*R^0 + onsetHighC5_1_1M253 N*R^1) + (onsetHighC5_1_2M253 N*R^2 + onsetHighC5_1_3M253 N*R^3))

def onsetHighCol3_5_2M253 (N R : ℤ) : ℤ := (onsetHighC5_2_0M253 N*R^0 + (onsetHighC5_2_1M253 N*R^1 + onsetHighC5_2_2M253 N*R^2))

def onsetHighCol3_5_3M253 (N R : ℤ) : ℤ := (onsetHighC5_3_0M253 N*R^0 + onsetHighC5_3_1M253 N*R^1)

def onsetHighCol3_5_4M253 (N R : ℤ) : ℤ := onsetHighC5_4_0M253 N*R^0

theorem onsetHigh_cols3_5M253 (N C R : ℤ) : onsetHighV5M253 N C R=((onsetHighCol3_5_0M253 N R*C^0 + onsetHighCol3_5_1M253 N R*C^1) + (onsetHighCol3_5_2M253 N R*C^2 + (onsetHighCol3_5_3M253 N R*C^3 + onsetHighCol3_5_4M253 N R*C^4))) := by
 rw [onsetHigh_decomp5M253]
 unfold onsetHighCol3_5_0M253 onsetHighCol3_5_1M253 onsetHighCol3_5_2M253 onsetHighCol3_5_3M253 onsetHighCol3_5_4M253
 ring

def onsetHighGCol3_0M253 (N R : ℤ) : ℤ := (((onsetHighGC3_0_0M253 N*R^0 + onsetHighGC3_0_1M253 N*R^1) + (onsetHighGC3_0_2M253 N*R^2 + onsetHighGC3_0_3M253 N*R^3)) + ((onsetHighGC3_0_4M253 N*R^4 + onsetHighGC3_0_5M253 N*R^5) + (onsetHighGC3_0_6M253 N*R^6 + (onsetHighGC3_0_7M253 N*R^7 + onsetHighGC3_0_8M253 N*R^8))))

theorem onsetHighGCol3_0M253_eq (N R : ℤ) : (onsetHighCol3_4_0M253 N R*onsetHighCol3_4_0M253 N R-onsetHighCol3_3_0M253 N R*onsetHighCol3_5_0M253 N R)=onsetHighGCol3_0M253 N R := by
 unfold onsetHighGCol3_0M253 onsetHighCol3_3_0M253 onsetHighCol3_4_0M253 onsetHighCol3_5_0M253
 rw [←onsetHighGC3_0_0M253_eq,←onsetHighGC3_0_1M253_eq,←onsetHighGC3_0_2M253_eq,←onsetHighGC3_0_3M253_eq,←onsetHighGC3_0_4M253_eq,←onsetHighGC3_0_5M253_eq,←onsetHighGC3_0_6M253_eq,←onsetHighGC3_0_7M253_eq,←onsetHighGC3_0_8M253_eq]
 ring

theorem onsetHighGCol3_0M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol3_0M253 N R := by
 unfold onsetHighGCol3_0M253
 have h0 := onsetHighGC3_0_0M253_nonneg N hN
 have h1 := onsetHighGC3_0_1M253_nonneg N hN
 have h2 := onsetHighGC3_0_2M253_nonneg N hN
 have h3 := onsetHighGC3_0_3M253_nonneg N hN
 have h4 := onsetHighGC3_0_4M253_nonneg N hN
 have h5 := onsetHighGC3_0_5M253_nonneg N hN
 have h6 := onsetHighGC3_0_6M253_nonneg N hN
 have h7 := onsetHighGC3_0_7M253_nonneg N hN
 have h8 := onsetHighGC3_0_8M253_nonneg N hN
 positivity

def onsetHighGCol3_1M253 (N R : ℤ) : ℤ := (((onsetHighGC3_1_0M253 N*R^0 + onsetHighGC3_1_1M253 N*R^1) + (onsetHighGC3_1_2M253 N*R^2 + onsetHighGC3_1_3M253 N*R^3)) + ((onsetHighGC3_1_4M253 N*R^4 + onsetHighGC3_1_5M253 N*R^5) + (onsetHighGC3_1_6M253 N*R^6 + onsetHighGC3_1_7M253 N*R^7)))

theorem onsetHighGCol3_1M253_eq (N R : ℤ) : ((onsetHighCol3_4_0M253 N R*onsetHighCol3_4_1M253 N R-onsetHighCol3_3_0M253 N R*onsetHighCol3_5_1M253 N R) + (onsetHighCol3_4_1M253 N R*onsetHighCol3_4_0M253 N R-onsetHighCol3_3_1M253 N R*onsetHighCol3_5_0M253 N R))=onsetHighGCol3_1M253 N R := by
 unfold onsetHighGCol3_1M253 onsetHighCol3_3_0M253 onsetHighCol3_3_1M253 onsetHighCol3_4_0M253 onsetHighCol3_4_1M253 onsetHighCol3_5_0M253 onsetHighCol3_5_1M253
 rw [←onsetHighGC3_1_0M253_eq,←onsetHighGC3_1_1M253_eq,←onsetHighGC3_1_2M253_eq,←onsetHighGC3_1_3M253_eq,←onsetHighGC3_1_4M253_eq,←onsetHighGC3_1_5M253_eq,←onsetHighGC3_1_6M253_eq,←onsetHighGC3_1_7M253_eq]
 ring

theorem onsetHighGCol3_1M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol3_1M253 N R := by
 unfold onsetHighGCol3_1M253
 have h0 := onsetHighGC3_1_0M253_nonneg N hN
 have h1 := onsetHighGC3_1_1M253_nonneg N hN
 have h2 := onsetHighGC3_1_2M253_nonneg N hN
 have h3 := onsetHighGC3_1_3M253_nonneg N hN
 have h4 := onsetHighGC3_1_4M253_nonneg N hN
 have h5 := onsetHighGC3_1_5M253_nonneg N hN
 have h6 := onsetHighGC3_1_6M253_nonneg N hN
 have h7 := onsetHighGC3_1_7M253_nonneg N hN
 positivity

def onsetHighGCol3_2M253 (N R : ℤ) : ℤ := ((onsetHighGC3_2_0M253 N*R^0 + (onsetHighGC3_2_1M253 N*R^1 + onsetHighGC3_2_2M253 N*R^2)) + ((onsetHighGC3_2_3M253 N*R^3 + onsetHighGC3_2_4M253 N*R^4) + (onsetHighGC3_2_5M253 N*R^5 + onsetHighGC3_2_6M253 N*R^6)))

theorem onsetHighGCol3_2M253_eq (N R : ℤ) : ((onsetHighCol3_4_0M253 N R*onsetHighCol3_4_2M253 N R-onsetHighCol3_3_0M253 N R*onsetHighCol3_5_2M253 N R) + ((onsetHighCol3_4_1M253 N R*onsetHighCol3_4_1M253 N R-onsetHighCol3_3_1M253 N R*onsetHighCol3_5_1M253 N R) + (onsetHighCol3_4_2M253 N R*onsetHighCol3_4_0M253 N R-onsetHighCol3_3_2M253 N R*onsetHighCol3_5_0M253 N R)))=onsetHighGCol3_2M253 N R := by
 unfold onsetHighGCol3_2M253 onsetHighCol3_3_0M253 onsetHighCol3_3_1M253 onsetHighCol3_3_2M253 onsetHighCol3_4_0M253 onsetHighCol3_4_1M253 onsetHighCol3_4_2M253 onsetHighCol3_5_0M253 onsetHighCol3_5_1M253 onsetHighCol3_5_2M253
 rw [←onsetHighGC3_2_0M253_eq,←onsetHighGC3_2_1M253_eq,←onsetHighGC3_2_2M253_eq,←onsetHighGC3_2_3M253_eq,←onsetHighGC3_2_4M253_eq,←onsetHighGC3_2_5M253_eq,←onsetHighGC3_2_6M253_eq]
 ring

theorem onsetHighGCol3_2M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol3_2M253 N R := by
 unfold onsetHighGCol3_2M253
 have h0 := onsetHighGC3_2_0M253_nonneg N hN
 have h1 := onsetHighGC3_2_1M253_nonneg N hN
 have h2 := onsetHighGC3_2_2M253_nonneg N hN
 have h3 := onsetHighGC3_2_3M253_nonneg N hN
 have h4 := onsetHighGC3_2_4M253_nonneg N hN
 have h5 := onsetHighGC3_2_5M253_nonneg N hN
 have h6 := onsetHighGC3_2_6M253_nonneg N hN
 positivity

def onsetHighGCol3_3M253 (N R : ℤ) : ℤ := ((onsetHighGC3_3_0M253 N*R^0 + (onsetHighGC3_3_1M253 N*R^1 + onsetHighGC3_3_2M253 N*R^2)) + (onsetHighGC3_3_3M253 N*R^3 + (onsetHighGC3_3_4M253 N*R^4 + onsetHighGC3_3_5M253 N*R^5)))

theorem onsetHighGCol3_3M253_eq (N R : ℤ) : (((onsetHighCol3_4_0M253 N R*onsetHighCol3_4_3M253 N R-onsetHighCol3_3_0M253 N R*onsetHighCol3_5_3M253 N R) + (onsetHighCol3_4_1M253 N R*onsetHighCol3_4_2M253 N R-onsetHighCol3_3_1M253 N R*onsetHighCol3_5_2M253 N R)) + ((onsetHighCol3_4_2M253 N R*onsetHighCol3_4_1M253 N R-onsetHighCol3_3_2M253 N R*onsetHighCol3_5_1M253 N R) + (onsetHighCol3_4_3M253 N R*onsetHighCol3_4_0M253 N R-onsetHighCol3_3_3M253 N R*onsetHighCol3_5_0M253 N R)))=onsetHighGCol3_3M253 N R := by
 unfold onsetHighGCol3_3M253 onsetHighCol3_3_0M253 onsetHighCol3_3_1M253 onsetHighCol3_3_2M253 onsetHighCol3_3_3M253 onsetHighCol3_4_0M253 onsetHighCol3_4_1M253 onsetHighCol3_4_2M253 onsetHighCol3_4_3M253 onsetHighCol3_5_0M253 onsetHighCol3_5_1M253 onsetHighCol3_5_2M253 onsetHighCol3_5_3M253
 rw [←onsetHighGC3_3_0M253_eq,←onsetHighGC3_3_1M253_eq,←onsetHighGC3_3_2M253_eq,←onsetHighGC3_3_3M253_eq,←onsetHighGC3_3_4M253_eq,←onsetHighGC3_3_5M253_eq]
 ring

theorem onsetHighGCol3_3M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol3_3M253 N R := by
 unfold onsetHighGCol3_3M253
 have h0 := onsetHighGC3_3_0M253_nonneg N hN
 have h1 := onsetHighGC3_3_1M253_nonneg N hN
 have h2 := onsetHighGC3_3_2M253_nonneg N hN
 have h3 := onsetHighGC3_3_3M253_nonneg N hN
 have h4 := onsetHighGC3_3_4M253_nonneg N hN
 have h5 := onsetHighGC3_3_5M253_nonneg N hN
 positivity

def onsetHighGCol3_4M253 (N R : ℤ) : ℤ := ((onsetHighGC3_4_0M253 N*R^0 + onsetHighGC3_4_1M253 N*R^1) + (onsetHighGC3_4_2M253 N*R^2 + (onsetHighGC3_4_3M253 N*R^3 + onsetHighGC3_4_4M253 N*R^4)))

theorem onsetHighGCol3_4M253_eq (N R : ℤ) : (((onsetHighCol3_4_0M253 N R*onsetHighCol3_4_4M253 N R-onsetHighCol3_3_0M253 N R*onsetHighCol3_5_4M253 N R) + (onsetHighCol3_4_1M253 N R*onsetHighCol3_4_3M253 N R-onsetHighCol3_3_1M253 N R*onsetHighCol3_5_3M253 N R)) + ((onsetHighCol3_4_2M253 N R*onsetHighCol3_4_2M253 N R-onsetHighCol3_3_2M253 N R*onsetHighCol3_5_2M253 N R) + ((onsetHighCol3_4_3M253 N R*onsetHighCol3_4_1M253 N R-onsetHighCol3_3_3M253 N R*onsetHighCol3_5_1M253 N R) + (onsetHighCol3_4_4M253 N R*onsetHighCol3_4_0M253 N R-onsetHighCol3_3_4M253 N R*onsetHighCol3_5_0M253 N R))))=onsetHighGCol3_4M253 N R := by
 unfold onsetHighGCol3_4M253 onsetHighCol3_3_0M253 onsetHighCol3_3_1M253 onsetHighCol3_3_2M253 onsetHighCol3_3_3M253 onsetHighCol3_3_4M253 onsetHighCol3_4_0M253 onsetHighCol3_4_1M253 onsetHighCol3_4_2M253 onsetHighCol3_4_3M253 onsetHighCol3_4_4M253 onsetHighCol3_5_0M253 onsetHighCol3_5_1M253 onsetHighCol3_5_2M253 onsetHighCol3_5_3M253 onsetHighCol3_5_4M253
 rw [←onsetHighGC3_4_0M253_eq,←onsetHighGC3_4_1M253_eq,←onsetHighGC3_4_2M253_eq,←onsetHighGC3_4_3M253_eq,←onsetHighGC3_4_4M253_eq]
 ring

theorem onsetHighGCol3_4M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol3_4M253 N R := by
 unfold onsetHighGCol3_4M253
 have h0 := onsetHighGC3_4_0M253_nonneg N hN
 have h1 := onsetHighGC3_4_1M253_nonneg N hN
 have h2 := onsetHighGC3_4_2M253_nonneg N hN
 have h3 := onsetHighGC3_4_3M253_nonneg N hN
 have h4 := onsetHighGC3_4_4M253_nonneg N hN
 positivity

def onsetHighGCol3_5M253 (N R : ℤ) : ℤ := ((onsetHighGC3_5_0M253 N*R^0 + onsetHighGC3_5_1M253 N*R^1) + (onsetHighGC3_5_2M253 N*R^2 + onsetHighGC3_5_3M253 N*R^3))

theorem onsetHighGCol3_5M253_eq (N R : ℤ) : (((onsetHighCol3_4_1M253 N R*onsetHighCol3_4_4M253 N R-onsetHighCol3_3_1M253 N R*onsetHighCol3_5_4M253 N R) + (onsetHighCol3_4_2M253 N R*onsetHighCol3_4_3M253 N R-onsetHighCol3_3_2M253 N R*onsetHighCol3_5_3M253 N R)) + ((onsetHighCol3_4_3M253 N R*onsetHighCol3_4_2M253 N R-onsetHighCol3_3_3M253 N R*onsetHighCol3_5_2M253 N R) + (onsetHighCol3_4_4M253 N R*onsetHighCol3_4_1M253 N R-onsetHighCol3_3_4M253 N R*onsetHighCol3_5_1M253 N R)))=onsetHighGCol3_5M253 N R := by
 unfold onsetHighGCol3_5M253 onsetHighCol3_3_1M253 onsetHighCol3_3_2M253 onsetHighCol3_3_3M253 onsetHighCol3_3_4M253 onsetHighCol3_4_1M253 onsetHighCol3_4_2M253 onsetHighCol3_4_3M253 onsetHighCol3_4_4M253 onsetHighCol3_5_1M253 onsetHighCol3_5_2M253 onsetHighCol3_5_3M253 onsetHighCol3_5_4M253
 rw [←onsetHighGC3_5_0M253_eq,←onsetHighGC3_5_1M253_eq,←onsetHighGC3_5_2M253_eq,←onsetHighGC3_5_3M253_eq]
 ring

theorem onsetHighGCol3_5M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol3_5M253 N R := by
 unfold onsetHighGCol3_5M253
 have h0 := onsetHighGC3_5_0M253_nonneg N hN
 have h1 := onsetHighGC3_5_1M253_nonneg N hN
 have h2 := onsetHighGC3_5_2M253_nonneg N hN
 have h3 := onsetHighGC3_5_3M253_nonneg N hN
 positivity

def onsetHighGCol3_6M253 (N R : ℤ) : ℤ := (onsetHighGC3_6_0M253 N*R^0 + (onsetHighGC3_6_1M253 N*R^1 + onsetHighGC3_6_2M253 N*R^2))

theorem onsetHighGCol3_6M253_eq (N R : ℤ) : ((onsetHighCol3_4_2M253 N R*onsetHighCol3_4_4M253 N R-onsetHighCol3_3_2M253 N R*onsetHighCol3_5_4M253 N R) + ((onsetHighCol3_4_3M253 N R*onsetHighCol3_4_3M253 N R-onsetHighCol3_3_3M253 N R*onsetHighCol3_5_3M253 N R) + (onsetHighCol3_4_4M253 N R*onsetHighCol3_4_2M253 N R-onsetHighCol3_3_4M253 N R*onsetHighCol3_5_2M253 N R)))=onsetHighGCol3_6M253 N R := by
 unfold onsetHighGCol3_6M253 onsetHighCol3_3_2M253 onsetHighCol3_3_3M253 onsetHighCol3_3_4M253 onsetHighCol3_4_2M253 onsetHighCol3_4_3M253 onsetHighCol3_4_4M253 onsetHighCol3_5_2M253 onsetHighCol3_5_3M253 onsetHighCol3_5_4M253
 rw [←onsetHighGC3_6_0M253_eq,←onsetHighGC3_6_1M253_eq,←onsetHighGC3_6_2M253_eq]
 ring

theorem onsetHighGCol3_6M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol3_6M253 N R := by
 unfold onsetHighGCol3_6M253
 have h0 := onsetHighGC3_6_0M253_nonneg N hN
 have h1 := onsetHighGC3_6_1M253_nonneg N hN
 have h2 := onsetHighGC3_6_2M253_nonneg N hN
 positivity

def onsetHighGCol3_7M253 (N R : ℤ) : ℤ := (onsetHighGC3_7_0M253 N*R^0 + onsetHighGC3_7_1M253 N*R^1)

theorem onsetHighGCol3_7M253_eq (N R : ℤ) : ((onsetHighCol3_4_3M253 N R*onsetHighCol3_4_4M253 N R-onsetHighCol3_3_3M253 N R*onsetHighCol3_5_4M253 N R) + (onsetHighCol3_4_4M253 N R*onsetHighCol3_4_3M253 N R-onsetHighCol3_3_4M253 N R*onsetHighCol3_5_3M253 N R))=onsetHighGCol3_7M253 N R := by
 unfold onsetHighGCol3_7M253 onsetHighCol3_3_3M253 onsetHighCol3_3_4M253 onsetHighCol3_4_3M253 onsetHighCol3_4_4M253 onsetHighCol3_5_3M253 onsetHighCol3_5_4M253
 rw [←onsetHighGC3_7_0M253_eq,←onsetHighGC3_7_1M253_eq]
 ring

theorem onsetHighGCol3_7M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol3_7M253 N R := by
 unfold onsetHighGCol3_7M253
 have h0 := onsetHighGC3_7_0M253_nonneg N hN
 have h1 := onsetHighGC3_7_1M253_nonneg N hN
 positivity

def onsetHighGCol3_8M253 (N R : ℤ) : ℤ := onsetHighGC3_8_0M253 N*R^0

theorem onsetHighGCol3_8M253_eq (N R : ℤ) : (onsetHighCol3_4_4M253 N R*onsetHighCol3_4_4M253 N R-onsetHighCol3_3_4M253 N R*onsetHighCol3_5_4M253 N R)=onsetHighGCol3_8M253 N R := by
 unfold onsetHighGCol3_8M253 onsetHighCol3_3_4M253 onsetHighCol3_4_4M253 onsetHighCol3_5_4M253
 rw [←onsetHighGC3_8_0M253_eq]
 ring

theorem onsetHighGCol3_8M253_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤onsetHighGCol3_8M253 N R := by
 unfold onsetHighGCol3_8M253
 have h0 := onsetHighGC3_8_0M253_nonneg N hN
 positivity

attribute [local irreducible] onsetHighCol3_3_0M253 onsetHighCol3_3_1M253 onsetHighCol3_3_2M253 onsetHighCol3_3_3M253 onsetHighCol3_3_4M253 onsetHighCol3_4_0M253 onsetHighCol3_4_1M253 onsetHighCol3_4_2M253 onsetHighCol3_4_3M253 onsetHighCol3_4_4M253 onsetHighCol3_5_0M253 onsetHighCol3_5_1M253 onsetHighCol3_5_2M253 onsetHighCol3_5_3M253 onsetHighCol3_5_4M253

theorem onsetHigh_lc3M253 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 onsetHighV3M253 N C R*onsetHighV5M253 N C R ≤ (onsetHighV4M253 N C R)^2 := by
 apply sub_nonneg.mp
 rw [onsetHigh_cols3_3M253,onsetHigh_cols3_4M253,onsetHigh_cols3_5M253]
 have he : ((onsetHighCol3_4_0M253 N R*C^0 + onsetHighCol3_4_1M253 N R*C^1) + (onsetHighCol3_4_2M253 N R*C^2 + (onsetHighCol3_4_3M253 N R*C^3 + onsetHighCol3_4_4M253 N R*C^4)))^2-((onsetHighCol3_3_0M253 N R*C^0 + onsetHighCol3_3_1M253 N R*C^1) + (onsetHighCol3_3_2M253 N R*C^2 + (onsetHighCol3_3_3M253 N R*C^3 + onsetHighCol3_3_4M253 N R*C^4)))*((onsetHighCol3_5_0M253 N R*C^0 + onsetHighCol3_5_1M253 N R*C^1) + (onsetHighCol3_5_2M253 N R*C^2 + (onsetHighCol3_5_3M253 N R*C^3 + onsetHighCol3_5_4M253 N R*C^4)))=(((onsetHighGCol3_0M253 N R*C^0 + onsetHighGCol3_1M253 N R*C^1) + (onsetHighGCol3_2M253 N R*C^2 + onsetHighGCol3_3M253 N R*C^3)) + ((onsetHighGCol3_4M253 N R*C^4 + onsetHighGCol3_5M253 N R*C^5) + (onsetHighGCol3_6M253 N R*C^6 + (onsetHighGCol3_7M253 N R*C^7 + onsetHighGCol3_8M253 N R*C^8)))) := by
  rw [←onsetHighGCol3_0M253_eq,←onsetHighGCol3_1M253_eq,←onsetHighGCol3_2M253_eq,←onsetHighGCol3_3M253_eq,←onsetHighGCol3_4M253_eq,←onsetHighGCol3_5M253_eq,←onsetHighGCol3_6M253_eq,←onsetHighGCol3_7M253_eq,←onsetHighGCol3_8M253_eq]
  ring
 rw [he]
 have h0 := onsetHighGCol3_0M253_nonneg N R hN hR
 have h1 := onsetHighGCol3_1M253_nonneg N R hN hR
 have h2 := onsetHighGCol3_2M253_nonneg N R hN hR
 have h3 := onsetHighGCol3_3M253_nonneg N R hN hR
 have h4 := onsetHighGCol3_4M253_nonneg N R hN hR
 have h5 := onsetHighGCol3_5M253_nonneg N R hN hR
 have h6 := onsetHighGCol3_6M253_nonneg N R hN hR
 have h7 := onsetHighGCol3_7M253_nonneg N R hN hR
 have h8 := onsetHighGCol3_8M253_nonneg N R hN hR
 positivity
end
end MathGKM.Markov
