import MarkovOnsetPartsM96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetG2_3_0M96 (N : ℤ) : ℤ := (((onsetP3_0_0M96 N*onsetP3_3_0M96 N-onsetP2_0_0M96 N*onsetP4_3_0M96 N) + (onsetP3_1_0M96 N*onsetP3_2_0M96 N-onsetP2_1_0M96 N*onsetP4_2_0M96 N)) + ((onsetP3_2_0M96 N*onsetP3_1_0M96 N-onsetP2_2_0M96 N*onsetP4_1_0M96 N) + (onsetP3_3_0M96 N*onsetP3_0_0M96 N-onsetP2_3_0M96 N*onsetP4_0_0M96 N)))

theorem onsetG2_3_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_3_0M96 N := by
 have he : onsetG2_3_0M96 N=(((1826058851247001996800 + (4259006316342626204160*N + 4547233949032693094400*N^2)) + (2936740827282799401984*N^3 + (1277014458617182641664*N^4 + 393691493788485231360*N^5))) + ((88197079129512846080*N^6 + (14461653594784660992*N^7 + 1722032200261105152*N^8)) + ((145188089451041280*N^9 + 8225646369221120*N^10) + (281129404545024*N^11 + 4382873334784*N^12)))) := by
  unfold onsetG2_3_0M96 onsetP2_0_0M96 onsetP2_1_0M96 onsetP2_2_0M96 onsetP2_3_0M96 onsetP3_0_0M96 onsetP3_1_0M96 onsetP3_2_0M96 onsetP3_3_0M96 onsetP4_0_0M96 onsetP4_1_0M96 onsetP4_2_0M96 onsetP4_3_0M96
  ring
 rw [he]
 positivity

def onsetG2_3_1M96 (N : ℤ) : ℤ := ((((onsetP3_0_0M96 N*onsetP3_3_1M96 N-onsetP2_0_0M96 N*onsetP4_3_1M96 N) + (onsetP3_0_1M96 N*onsetP3_3_0M96 N-onsetP2_0_1M96 N*onsetP4_3_0M96 N)) + ((onsetP3_1_0M96 N*onsetP3_2_1M96 N-onsetP2_1_0M96 N*onsetP4_2_1M96 N) + (onsetP3_1_1M96 N*onsetP3_2_0M96 N-onsetP2_1_1M96 N*onsetP4_2_0M96 N))) + (((onsetP3_2_0M96 N*onsetP3_1_1M96 N-onsetP2_2_0M96 N*onsetP4_1_1M96 N) + (onsetP3_2_1M96 N*onsetP3_1_0M96 N-onsetP2_2_1M96 N*onsetP4_1_0M96 N)) + ((onsetP3_3_0M96 N*onsetP3_0_1M96 N-onsetP2_3_0M96 N*onsetP4_0_1M96 N) + (onsetP3_3_1M96 N*onsetP3_0_0M96 N-onsetP2_3_1M96 N*onsetP4_0_0M96 N))))

theorem onsetG2_3_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_3_1M96 N := by
 have he : onsetG2_3_1M96 N=(((1759692845204144524800 + (4182620444608598818560*N + 4550791935131014035456*N^2)) + (2995088648032020062208*N^3 + (1327245379026176164352*N^4 + 416981630652661052160*N^5))) + ((95190181338655368448*N^6 + (15902900761275569664*N^7 + 1929002754971986176*N^8)) + ((165629574060679680*N^9 + 9553132038800896*N^10) + (332261151817728*N^11 + 5269131779072*N^12)))) := by
  unfold onsetG2_3_1M96 onsetP2_0_0M96 onsetP2_0_1M96 onsetP2_1_0M96 onsetP2_1_1M96 onsetP2_2_0M96 onsetP2_2_1M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP3_0_0M96 onsetP3_0_1M96 onsetP3_1_0M96 onsetP3_1_1M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP4_0_0M96 onsetP4_0_1M96 onsetP4_1_0M96 onsetP4_1_1M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_3_0M96 onsetP4_3_1M96
  ring
 rw [he]
 positivity

def onsetG2_3_2M96 (N : ℤ) : ℤ := ((((onsetP3_0_1M96 N*onsetP3_3_1M96 N-onsetP2_0_1M96 N*onsetP4_3_1M96 N) + (onsetP3_0_2M96 N*onsetP3_3_0M96 N-onsetP2_0_2M96 N*onsetP4_3_0M96 N)) + ((onsetP3_1_0M96 N*onsetP3_2_2M96 N-onsetP2_1_0M96 N*onsetP4_2_2M96 N) + ((onsetP3_1_1M96 N*onsetP3_2_1M96 N-onsetP2_1_1M96 N*onsetP4_2_1M96 N) + (onsetP3_1_2M96 N*onsetP3_2_0M96 N-onsetP2_1_2M96 N*onsetP4_2_0M96 N)))) + (((onsetP3_2_0M96 N*onsetP3_1_2M96 N-onsetP2_2_0M96 N*onsetP4_1_2M96 N) + (onsetP3_2_1M96 N*onsetP3_1_1M96 N-onsetP2_2_1M96 N*onsetP4_1_1M96 N)) + ((onsetP3_2_2M96 N*onsetP3_1_0M96 N-onsetP2_2_2M96 N*onsetP4_1_0M96 N) + ((onsetP3_3_0M96 N*onsetP3_0_2M96 N-onsetP2_3_0M96 N*onsetP4_0_2M96 N) + (onsetP3_3_1M96 N*onsetP3_0_1M96 N-onsetP2_3_1M96 N*onsetP4_0_1M96 N)))))

theorem onsetG2_3_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_3_2M96 N := by
 have he : onsetG2_3_2M96 N=(((674528800389379891200 + (1635419238875208138240*N + 1814754473895001830912*N^2)) + (1218011060725659949056*N^3 + (550393280381063365120*N^4 + 176312735323398912000*N^5))) + ((41034777302532263936*N^6 + (6988014924966125568*N^7 + 863820695248949760*N^8)) + ((75562619586908160*N^9 + 4438418114020352*N^10) + (157138685362176*N^11 + 2535420805120*N^12)))) := by
  unfold onsetG2_3_2M96 onsetP2_0_1M96 onsetP2_0_2M96 onsetP2_1_0M96 onsetP2_1_1M96 onsetP2_1_2M96 onsetP2_2_0M96 onsetP2_2_1M96 onsetP2_2_2M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP3_0_1M96 onsetP3_0_2M96 onsetP3_1_0M96 onsetP3_1_1M96 onsetP3_1_2M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP4_0_1M96 onsetP4_0_2M96 onsetP4_1_0M96 onsetP4_1_1M96 onsetP4_1_2M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96
  ring
 rw [he]
 positivity

def onsetG2_3_3M96 (N : ℤ) : ℤ := ((((onsetP3_0_2M96 N*onsetP3_3_1M96 N-onsetP2_0_2M96 N*onsetP4_3_1M96 N) + (onsetP3_0_3M96 N*onsetP3_3_0M96 N-onsetP2_0_3M96 N*onsetP4_3_0M96 N)) + ((onsetP3_1_1M96 N*onsetP3_2_2M96 N-onsetP2_1_1M96 N*onsetP4_2_2M96 N) + ((onsetP3_1_2M96 N*onsetP3_2_1M96 N-onsetP2_1_2M96 N*onsetP4_2_1M96 N) + (onsetP3_1_3M96 N*onsetP3_2_0M96 N-onsetP2_1_3M96 N*onsetP4_2_0M96 N)))) + (((onsetP3_2_0M96 N*onsetP3_1_3M96 N-onsetP2_2_0M96 N*onsetP4_1_3M96 N) + (onsetP3_2_1M96 N*onsetP3_1_2M96 N-onsetP2_2_1M96 N*onsetP4_1_2M96 N)) + ((onsetP3_2_2M96 N*onsetP3_1_1M96 N-onsetP2_2_2M96 N*onsetP4_1_1M96 N) + ((onsetP3_3_0M96 N*onsetP3_0_3M96 N-onsetP2_3_0M96 N*onsetP4_0_3M96 N) + (onsetP3_3_1M96 N*onsetP3_0_2M96 N-onsetP2_3_1M96 N*onsetP4_0_2M96 N)))))

theorem onsetG2_3_3M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_3_3M96 N := by
 have he : onsetG2_3_3M96 N=(((128437409734010496000 + (317963878535552659200*N + 360170016982889541120*N^2)) + (246715137456794764800*N^3 + (113763328211395502080*N^4 + 37181707686081477120*N^5))) + ((8827472067373944320*N^6 + (1533131627194460160*N^7 + 193226522552609280*N^8)) + ((17227125761018880*N^9 + 1030882930703360*N^10) + (37163904368640*N^11 + 610241443840*N^12)))) := by
  unfold onsetG2_3_3M96 onsetP2_0_2M96 onsetP2_0_3M96 onsetP2_1_1M96 onsetP2_1_2M96 onsetP2_1_3M96 onsetP2_2_0M96 onsetP2_2_1M96 onsetP2_2_2M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP3_0_2M96 onsetP3_0_3M96 onsetP3_1_1M96 onsetP3_1_2M96 onsetP3_1_3M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP4_0_2M96 onsetP4_0_3M96 onsetP4_1_1M96 onsetP4_1_2M96 onsetP4_1_3M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96
  ring
 rw [he]
 positivity

def onsetG2_3_4M96 (N : ℤ) : ℤ := ((((onsetP3_0_3M96 N*onsetP3_3_1M96 N-onsetP2_0_3M96 N*onsetP4_3_1M96 N) + (onsetP3_0_4M96 N*onsetP3_3_0M96 N-onsetP2_0_4M96 N*onsetP4_3_0M96 N)) + ((onsetP3_1_2M96 N*onsetP3_2_2M96 N-onsetP2_1_2M96 N*onsetP4_2_2M96 N) + (onsetP3_1_3M96 N*onsetP3_2_1M96 N-onsetP2_1_3M96 N*onsetP4_2_1M96 N))) + (((onsetP3_2_1M96 N*onsetP3_1_3M96 N-onsetP2_2_1M96 N*onsetP4_1_3M96 N) + (onsetP3_2_2M96 N*onsetP3_1_2M96 N-onsetP2_2_2M96 N*onsetP4_1_2M96 N)) + ((onsetP3_3_0M96 N*onsetP3_0_4M96 N-onsetP2_3_0M96 N*onsetP4_0_4M96 N) + (onsetP3_3_1M96 N*onsetP3_0_3M96 N-onsetP2_3_1M96 N*onsetP4_0_3M96 N))))

theorem onsetG2_3_4M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_3_4M96 N := by
 have he : onsetG2_3_4M96 N=(((12137672444134809600 + (30714354917720087040*N + 35548960445764335360*N^2)) + (24873681891255375360*N^3 + (11712833301283304960*N^4 + 3908440741914643200*N^5))) + ((947153791123321600*N^6 + (167862588626073600*N^7 + 21581779170685440*N^8)) + ((1962018765288960*N^9 + 119662240176640*N^10) + (4394177034240*N^11 + 73448883200*N^12)))) := by
  unfold onsetG2_3_4M96 onsetP2_0_3M96 onsetP2_0_4M96 onsetP2_1_2M96 onsetP2_1_3M96 onsetP2_2_1M96 onsetP2_2_2M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP3_0_3M96 onsetP3_0_4M96 onsetP3_1_2M96 onsetP3_1_3M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP4_0_3M96 onsetP4_0_4M96 onsetP4_1_2M96 onsetP4_1_3M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96
  ring
 rw [he]
 positivity

def onsetG2_3_5M96 (N : ℤ) : ℤ := (((onsetP3_0_4M96 N*onsetP3_3_1M96 N-onsetP2_0_4M96 N*onsetP4_3_1M96 N) + (onsetP3_1_3M96 N*onsetP3_2_2M96 N-onsetP2_1_3M96 N*onsetP4_2_2M96 N)) + ((onsetP3_2_2M96 N*onsetP3_1_3M96 N-onsetP2_2_2M96 N*onsetP4_1_3M96 N) + (onsetP3_3_1M96 N*onsetP3_0_4M96 N-onsetP2_3_1M96 N*onsetP4_0_4M96 N)))

theorem onsetG2_3_5M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_3_5M96 N := by
 have he : onsetG2_3_5M96 N=(((455190431639731200 + (1178574710727697920*N + 1395088498111682304*N^2)) + (997950416038367232*N^3 + (480268385257020416*N^4 + 163738487443534080*N^5))) + ((40528980753194752*N^6 + (7334288057650176*N^7 + 962470540109568*N^8)) + ((89269454400000*N^9 + 5551600198144*N^10) + (207738273792*N^11 + 3535702016*N^12)))) := by
  unfold onsetG2_3_5M96 onsetP2_0_4M96 onsetP2_1_3M96 onsetP2_2_2M96 onsetP2_3_1M96 onsetP3_0_4M96 onsetP3_1_3M96 onsetP3_2_2M96 onsetP3_3_1M96 onsetP4_0_4M96 onsetP4_1_3M96 onsetP4_2_2M96 onsetP4_3_1M96
  ring
 rw [he]
 positivity

def onsetG2_4_0M96 (N : ℤ) : ℤ := (((onsetP3_0_0M96 N*onsetP3_4_0M96 N-onsetP2_0_0M96 N*onsetP4_4_0M96 N) + (onsetP3_1_0M96 N*onsetP3_3_0M96 N-onsetP2_1_0M96 N*onsetP4_3_0M96 N)) + ((onsetP3_2_0M96 N*onsetP3_2_0M96 N-onsetP2_2_0M96 N*onsetP4_2_0M96 N) + ((onsetP3_3_0M96 N*onsetP3_1_0M96 N-onsetP2_3_0M96 N*onsetP4_1_0M96 N) + (onsetP3_4_0M96 N*onsetP3_0_0M96 N-onsetP2_4_0M96 N*onsetP4_0_0M96 N))))

theorem onsetG2_4_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_4_0M96 N := by
 have he : onsetG2_4_0M96 N=(((577870989843219206400 + (1339922474236642222080*N + 1422587628628679358720*N^2)) + (913853569176879287040*N^3 + (395377407887447353088*N^4 + 121312463064964039680*N^5))) + ((27056117344963060480*N^6 + (4417932239444021760*N^7 + 524034487473740544*N^8)) + ((44024632061840640*N^9 + 2486065354393600*N^10) + (84715720320000*N^11 + 1317282944768*N^12)))) := by
  unfold onsetG2_4_0M96 onsetP2_0_0M96 onsetP2_1_0M96 onsetP2_2_0M96 onsetP2_3_0M96 onsetP2_4_0M96 onsetP3_0_0M96 onsetP3_1_0M96 onsetP3_2_0M96 onsetP3_3_0M96 onsetP3_4_0M96 onsetP4_0_0M96 onsetP4_1_0M96 onsetP4_2_0M96 onsetP4_3_0M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_4_1M96 (N : ℤ) : ℤ := ((((onsetP3_0_1M96 N*onsetP3_4_0M96 N-onsetP2_0_1M96 N*onsetP4_4_0M96 N) + (onsetP3_1_0M96 N*onsetP3_3_1M96 N-onsetP2_1_0M96 N*onsetP4_3_1M96 N)) + ((onsetP3_1_1M96 N*onsetP3_3_0M96 N-onsetP2_1_1M96 N*onsetP4_3_0M96 N) + (onsetP3_2_0M96 N*onsetP3_2_1M96 N-onsetP2_2_0M96 N*onsetP4_2_1M96 N))) + (((onsetP3_2_1M96 N*onsetP3_2_0M96 N-onsetP2_2_1M96 N*onsetP4_2_0M96 N) + (onsetP3_3_0M96 N*onsetP3_1_1M96 N-onsetP2_3_0M96 N*onsetP4_1_1M96 N)) + ((onsetP3_3_1M96 N*onsetP3_1_0M96 N-onsetP2_3_1M96 N*onsetP4_1_0M96 N) + (onsetP3_4_0M96 N*onsetP3_0_1M96 N-onsetP2_4_0M96 N*onsetP4_0_1M96 N))))

theorem onsetG2_4_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_4_1M96 N := by
 have he : onsetG2_4_1M96 N=(((444695101492680460800 + (1051432337221996262400*N + 1138136018716818100224*N^2)) + (745373638658613452544*N^3 + (328749683069273849600*N^4 + 102820297165773089280*N^5))) + ((23372366557284731392*N^6 + (3888999086829760512*N^7 + 469947474340861440*N^8)) + ((40208356698693120*N^9 + 2311525107049984*N^10) + (80154595282944*N^11 + 1267710402560*N^12)))) := by
  unfold onsetG2_4_1M96 onsetP2_0_1M96 onsetP2_1_0M96 onsetP2_1_1M96 onsetP2_2_0M96 onsetP2_2_1M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_0_1M96 onsetP3_1_0M96 onsetP3_1_1M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_0_1M96 onsetP4_1_0M96 onsetP4_1_1M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_4_2M96 (N : ℤ) : ℤ := ((((onsetP3_0_2M96 N*onsetP3_4_0M96 N-onsetP2_0_2M96 N*onsetP4_4_0M96 N) + (onsetP3_1_1M96 N*onsetP3_3_1M96 N-onsetP2_1_1M96 N*onsetP4_3_1M96 N)) + ((onsetP3_1_2M96 N*onsetP3_3_0M96 N-onsetP2_1_2M96 N*onsetP4_3_0M96 N) + (onsetP3_2_0M96 N*onsetP3_2_2M96 N-onsetP2_2_0M96 N*onsetP4_2_2M96 N))) + (((onsetP3_2_1M96 N*onsetP3_2_1M96 N-onsetP2_2_1M96 N*onsetP4_2_1M96 N) + (onsetP3_2_2M96 N*onsetP3_2_0M96 N-onsetP2_2_2M96 N*onsetP4_2_0M96 N)) + ((onsetP3_3_0M96 N*onsetP3_1_2M96 N-onsetP2_3_0M96 N*onsetP4_1_2M96 N) + ((onsetP3_3_1M96 N*onsetP3_1_1M96 N-onsetP2_3_1M96 N*onsetP4_1_1M96 N) + (onsetP3_4_0M96 N*onsetP3_0_2M96 N-onsetP2_4_0M96 N*onsetP4_0_2M96 N)))))

theorem onsetG2_4_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_4_2M96 N := by
 have he : onsetG2_4_2M96 N=(((127520246333377497600 + (307752726574726110720*N + 339947012344277479680*N^2)) + (227148235973685116160*N^3 + (102200457284231604480*N^4 + 32602436963550558720*N^5))) + ((7557453214494812160*N^6 + (1282059356154071040*N^7 + 157901431745917440*N^8)) + ((13764467331068160*N^9 + 805860290914560*N^10) + (28444292352000*N^11 + 457681082880*N^12)))) := by
  unfold onsetG2_4_2M96 onsetP2_0_2M96 onsetP2_1_1M96 onsetP2_1_2M96 onsetP2_2_0M96 onsetP2_2_1M96 onsetP2_2_2M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_0_2M96 onsetP3_1_1M96 onsetP3_1_2M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_0_2M96 onsetP4_1_1M96 onsetP4_1_2M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_4_3M96 (N : ℤ) : ℤ := ((((onsetP3_0_3M96 N*onsetP3_4_0M96 N-onsetP2_0_3M96 N*onsetP4_4_0M96 N) + (onsetP3_1_2M96 N*onsetP3_3_1M96 N-onsetP2_1_2M96 N*onsetP4_3_1M96 N)) + ((onsetP3_1_3M96 N*onsetP3_3_0M96 N-onsetP2_1_3M96 N*onsetP4_3_0M96 N) + (onsetP3_2_1M96 N*onsetP3_2_2M96 N-onsetP2_2_1M96 N*onsetP4_2_2M96 N))) + (((onsetP3_2_2M96 N*onsetP3_2_1M96 N-onsetP2_2_2M96 N*onsetP4_2_1M96 N) + (onsetP3_3_0M96 N*onsetP3_1_3M96 N-onsetP2_3_0M96 N*onsetP4_1_3M96 N)) + ((onsetP3_3_1M96 N*onsetP3_1_2M96 N-onsetP2_3_1M96 N*onsetP4_1_2M96 N) + (onsetP3_4_0M96 N*onsetP3_0_3M96 N-onsetP2_4_0M96 N*onsetP4_0_3M96 N))))

theorem onsetG2_4_3M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_4_3M96 N := by
 have he : onsetG2_4_3M96 N=(((16133545035397440000 + (39785846625638426880*N + 44890613003029489920*N^2)) + (30629858265741692160*N^3 + (14069276603762965760*N^4 + 4580882171327777280*N^5))) + ((1083537835462512640*N^6 + (187507280138895360*N^7 + 23549627336874240*N^8)) + ((2092483317335040*N^9 + 124810872739840*N^10) + (4485746657280*N^11 + 73448883200*N^12)))) := by
  unfold onsetG2_4_3M96 onsetP2_0_3M96 onsetP2_1_2M96 onsetP2_1_3M96 onsetP2_2_1M96 onsetP2_2_2M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_0_3M96 onsetP3_1_2M96 onsetP3_1_3M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_0_3M96 onsetP4_1_2M96 onsetP4_1_3M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_4_4M96 (N : ℤ) : ℤ := (((onsetP3_0_4M96 N*onsetP3_4_0M96 N-onsetP2_0_4M96 N*onsetP4_4_0M96 N) + (onsetP3_1_3M96 N*onsetP3_3_1M96 N-onsetP2_1_3M96 N*onsetP4_3_1M96 N)) + ((onsetP3_2_2M96 N*onsetP3_2_2M96 N-onsetP2_2_2M96 N*onsetP4_2_2M96 N) + ((onsetP3_3_1M96 N*onsetP3_1_3M96 N-onsetP2_3_1M96 N*onsetP4_1_3M96 N) + (onsetP3_4_0M96 N*onsetP3_0_4M96 N-onsetP2_4_0M96 N*onsetP4_0_4M96 N))))

theorem onsetG2_4_4M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_4_4M96 N := by
 have he : onsetG2_4_4M96 N=(((759235170030220800 + (1915285555455874560*N + 2209605271644153600*N^2)) + (1540948864543334400*N^3 + (723189132183320320*N^4 + 240508047374999040*N^5))) + ((58088021147448320*N^6 + (10260549553766400*N^7 + 1314833109596160*N^8)) + ((119144856768000*N^9 + 7243514324480*N^10) + (265177651200*N^11 + 4419627520*N^12)))) := by
  unfold onsetG2_4_4M96 onsetP2_0_4M96 onsetP2_1_3M96 onsetP2_2_2M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_0_4M96 onsetP3_1_3M96 onsetP3_2_2M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_0_4M96 onsetP4_1_3M96 onsetP4_2_2M96 onsetP4_3_1M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_5_0M96 (N : ℤ) : ℤ := (((onsetP3_1_0M96 N*onsetP3_4_0M96 N-onsetP2_1_0M96 N*onsetP4_4_0M96 N) + (onsetP3_2_0M96 N*onsetP3_3_0M96 N-onsetP2_2_0M96 N*onsetP4_3_0M96 N)) + ((onsetP3_3_0M96 N*onsetP3_2_0M96 N-onsetP2_3_0M96 N*onsetP4_2_0M96 N) + (onsetP3_4_0M96 N*onsetP3_1_0M96 N-onsetP2_4_0M96 N*onsetP4_1_0M96 N)))

theorem onsetG2_5_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_5_0M96 N := by
 have he : onsetG2_5_0M96 N=(((117208874547566323200 + (270149261101418603520*N + 285172669706303167488*N^2)) + (182194107038220264960*N^3 + (78420463716336620032*N^4 + 23945084202592116480*N^5))) + ((5316227501448867584*N^6 + (864405368677025280*N^7 + 102129624834349056*N^8)) + ((8549008064217600*N^9 + 481170897955328*N^10) + (16347969576960*N^11 + 253542080512*N^12)))) := by
  unfold onsetG2_5_0M96 onsetP2_1_0M96 onsetP2_2_0M96 onsetP2_3_0M96 onsetP2_4_0M96 onsetP3_1_0M96 onsetP3_2_0M96 onsetP3_3_0M96 onsetP3_4_0M96 onsetP4_1_0M96 onsetP4_2_0M96 onsetP4_3_0M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_5_1M96 (N : ℤ) : ℤ := (((onsetP3_1_1M96 N*onsetP3_4_0M96 N-onsetP2_1_1M96 N*onsetP4_4_0M96 N) + ((onsetP3_2_0M96 N*onsetP3_3_1M96 N-onsetP2_2_0M96 N*onsetP4_3_1M96 N) + (onsetP3_2_1M96 N*onsetP3_3_0M96 N-onsetP2_2_1M96 N*onsetP4_3_0M96 N))) + ((onsetP3_3_0M96 N*onsetP3_2_1M96 N-onsetP2_3_0M96 N*onsetP4_2_1M96 N) + ((onsetP3_3_1M96 N*onsetP3_2_0M96 N-onsetP2_3_1M96 N*onsetP4_2_0M96 N) + (onsetP3_4_0M96 N*onsetP3_1_1M96 N-onsetP2_4_0M96 N*onsetP4_1_1M96 N))))

theorem onsetG2_5_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_5_1M96 N := by
 have he : onsetG2_5_1M96 N=(((67499027839869696000 + (158737961778422261760*N + 170933351828064827904*N^2)) + (111384578833203932928*N^3 + (48891154597390973952*N^4 + 15221557942114648320*N^5))) + ((3445106891151351552*N^6 + (570905058796337664*N^7 + 68724196181738496*N^8)) + ((5858989977899520*N^9 + 335713906450944*N^10) + (11606262571008*N^11 + 183072433152*N^12)))) := by
  unfold onsetG2_5_1M96 onsetP2_1_1M96 onsetP2_2_0M96 onsetP2_2_1M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_1_1M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_1_1M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_5_2M96 (N : ℤ) : ℤ := (((onsetP3_1_2M96 N*onsetP3_4_0M96 N-onsetP2_1_2M96 N*onsetP4_4_0M96 N) + ((onsetP3_2_1M96 N*onsetP3_3_1M96 N-onsetP2_2_1M96 N*onsetP4_3_1M96 N) + (onsetP3_2_2M96 N*onsetP3_3_0M96 N-onsetP2_2_2M96 N*onsetP4_3_0M96 N))) + ((onsetP3_3_0M96 N*onsetP3_2_2M96 N-onsetP2_3_0M96 N*onsetP4_2_2M96 N) + ((onsetP3_3_1M96 N*onsetP3_2_1M96 N-onsetP2_3_1M96 N*onsetP4_2_1M96 N) + (onsetP3_4_0M96 N*onsetP3_1_2M96 N-onsetP2_4_0M96 N*onsetP4_1_2M96 N))))

theorem onsetG2_5_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_5_2M96 N := by
 have he : onsetG2_5_2M96 N=(((12865107581415936000 + (30903439243603691520*N + 33979113259132672512*N^2)) + (22602159736750202112*N^3 + (10124893025325281280*N^4 + 3216259420719932160*N^5))) + ((742526833457907456*N^6 + (125474894693277696*N^7 + 15396673364352000*N^8)) + ((1337450054008320*N^9 + 78045665413632*N^10) + (2746389768192*N^11 + 44069329920*N^12)))) := by
  unfold onsetG2_5_2M96 onsetP2_1_2M96 onsetP2_2_1M96 onsetP2_2_2M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_1_2M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_1_2M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_5_3M96 (N : ℤ) : ℤ := (((onsetP3_1_3M96 N*onsetP3_4_0M96 N-onsetP2_1_3M96 N*onsetP4_4_0M96 N) + (onsetP3_2_2M96 N*onsetP3_3_1M96 N-onsetP2_2_2M96 N*onsetP4_3_1M96 N)) + ((onsetP3_3_1M96 N*onsetP3_2_2M96 N-onsetP2_3_1M96 N*onsetP4_2_2M96 N) + (onsetP3_4_0M96 N*onsetP3_1_3M96 N-onsetP2_4_0M96 N*onsetP4_1_3M96 N)))

theorem onsetG2_5_3M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_5_3M96 N := by
 have he : onsetG2_5_3M96 N=(((810715204552780800 + (1991479423085994240*N + 2238166299662544384*N^2)) + (1521151874319963648*N^3 + (695997018618223616*N^4 + 225747005829999360*N^5))) + ((53197595124174592*N^6 + (9172442321409024*N^7 + 1147939308864768*N^8)) + ((101653006963200*N^9 + 6043643866624*N^10) + (216545968128*N^11 + 3535702016*N^12)))) := by
  unfold onsetG2_5_3M96 onsetP2_1_3M96 onsetP2_2_2M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_1_3M96 onsetP3_2_2M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_1_3M96 onsetP4_2_2M96 onsetP4_3_1M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity
end
end MathGKM.Markov
