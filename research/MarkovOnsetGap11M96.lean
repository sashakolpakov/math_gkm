import MarkovOnsetPartsM96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetG1_3_0M96 (N : ℤ) : ℤ := (((onsetP2_0_0M96 N*onsetP2_3_0M96 N-onsetP1_0_0M96 N*onsetP3_3_0M96 N) + (onsetP2_1_0M96 N*onsetP2_2_0M96 N-onsetP1_1_0M96 N*onsetP3_2_0M96 N)) + ((onsetP2_2_0M96 N*onsetP2_1_0M96 N-onsetP1_2_0M96 N*onsetP3_1_0M96 N) + (onsetP2_3_0M96 N*onsetP2_0_0M96 N-onsetP1_3_0M96 N*onsetP3_0_0M96 N)))

theorem onsetG1_3_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_3_0M96 N := by
 have he : onsetG1_3_0M96 N=(((1399332823518136550400 + (3370144668296692608000*N + 3720736928763292064256*N^2)) + (2481912039486081043968*N^3 + (1111839593237928561664*N^4 + 351999637436267842560*N^5))) + ((80712573180626444288*N^6 + (13503535503229384704*N^7 + 1636111304810852352*N^8)) + ((140036428247600640*N^9 + 8039450519776256*N^10) + (278052392368128*N^11 + 4382873334784*N^12)))) := by
  unfold onsetG1_3_0M96 onsetP1_0_0M96 onsetP1_1_0M96 onsetP1_2_0M96 onsetP1_3_0M96 onsetP2_0_0M96 onsetP2_1_0M96 onsetP2_2_0M96 onsetP2_3_0M96 onsetP3_0_0M96 onsetP3_1_0M96 onsetP3_2_0M96 onsetP3_3_0M96
  ring
 rw [he]
 positivity

def onsetG1_3_1M96 (N : ℤ) : ℤ := ((((onsetP2_0_0M96 N*onsetP2_3_1M96 N-onsetP1_0_0M96 N*onsetP3_3_1M96 N) + (onsetP2_0_1M96 N*onsetP2_3_0M96 N-onsetP1_0_1M96 N*onsetP3_3_0M96 N)) + ((onsetP2_1_0M96 N*onsetP2_2_1M96 N-onsetP1_1_0M96 N*onsetP3_2_1M96 N) + (onsetP2_1_1M96 N*onsetP2_2_0M96 N-onsetP1_1_1M96 N*onsetP3_2_0M96 N))) + (((onsetP2_2_0M96 N*onsetP2_1_1M96 N-onsetP1_2_0M96 N*onsetP3_1_1M96 N) + (onsetP2_2_1M96 N*onsetP2_1_0M96 N-onsetP1_2_1M96 N*onsetP3_1_0M96 N)) + ((onsetP2_3_0M96 N*onsetP2_0_1M96 N-onsetP1_3_0M96 N*onsetP3_0_1M96 N) + (onsetP2_3_1M96 N*onsetP2_0_0M96 N-onsetP1_3_1M96 N*onsetP3_0_0M96 N))))

theorem onsetG1_3_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_3_1M96 N := by
 have he : onsetG1_3_1M96 N=(((1333966592899037260800 + (3263336779219895266560*N + 3661351521891253666560*N^2)) + (2484234257710627091712*N^3 + (1133124704399653828352*N^4 + 365602321260958252800*N^5))) + ((85501668954158275840*N^6 + (14598533035816886016*N^7 + 1805910302943538176*N^8)) + ((157863810492003840*N^9 + 9258063911219200*N^10) + (327143540355072*N^11 + 5269131779072*N^12)))) := by
  unfold onsetG1_3_1M96 onsetP1_0_0M96 onsetP1_0_1M96 onsetP1_1_0M96 onsetP1_1_1M96 onsetP1_2_0M96 onsetP1_2_1M96 onsetP1_3_0M96 onsetP1_3_1M96 onsetP2_0_0M96 onsetP2_0_1M96 onsetP2_1_0M96 onsetP2_1_1M96 onsetP2_2_0M96 onsetP2_2_1M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP3_0_0M96 onsetP3_0_1M96 onsetP3_1_0M96 onsetP3_1_1M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_3_0M96 onsetP3_3_1M96
  ring
 rw [he]
 positivity

def onsetG1_3_2M96 (N : ℤ) : ℤ := ((((onsetP2_0_1M96 N*onsetP2_3_1M96 N-onsetP1_0_1M96 N*onsetP3_3_1M96 N) + (onsetP2_0_2M96 N*onsetP2_3_0M96 N-onsetP1_0_2M96 N*onsetP3_3_0M96 N)) + ((onsetP2_1_0M96 N*onsetP2_2_2M96 N-onsetP1_1_0M96 N*onsetP3_2_2M96 N) + ((onsetP2_1_1M96 N*onsetP2_2_1M96 N-onsetP1_1_1M96 N*onsetP3_2_1M96 N) + (onsetP2_1_2M96 N*onsetP2_2_0M96 N-onsetP1_1_2M96 N*onsetP3_2_0M96 N)))) + (((onsetP2_2_0M96 N*onsetP2_1_2M96 N-onsetP1_2_0M96 N*onsetP3_1_2M96 N) + (onsetP2_2_1M96 N*onsetP2_1_1M96 N-onsetP1_2_1M96 N*onsetP3_1_1M96 N)) + ((onsetP2_2_2M96 N*onsetP2_1_0M96 N-onsetP1_2_2M96 N*onsetP3_1_0M96 N) + ((onsetP2_3_0M96 N*onsetP2_0_2M96 N-onsetP1_3_0M96 N*onsetP3_0_2M96 N) + (onsetP2_3_1M96 N*onsetP2_0_1M96 N-onsetP1_3_1M96 N*onsetP3_0_1M96 N)))))

theorem onsetG1_3_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_3_2M96 N := by
 have he : onsetG1_3_2M96 N=(((507223560473581593600 + (1261016306917336408320*N + 1438399382619757356288*N^2)) + (993012189988211586816*N^3 + (461276320271037187840*N^4 + 151703526110691045120*N^5))) + ((36190671578690849024*N^6 + (6307197295060101888*N^7 + 796777236721213440*N^8)) + ((71152821407861760*N^9 + 4263958471205888*N^10) + (153993443229696*N^11 + 2535420805120*N^12)))) := by
  unfold onsetG1_3_2M96 onsetP1_0_1M96 onsetP1_0_2M96 onsetP1_1_0M96 onsetP1_1_1M96 onsetP1_1_2M96 onsetP1_2_0M96 onsetP1_2_1M96 onsetP1_2_2M96 onsetP1_3_0M96 onsetP1_3_1M96 onsetP2_0_1M96 onsetP2_0_2M96 onsetP2_1_0M96 onsetP2_1_1M96 onsetP2_1_2M96 onsetP2_2_0M96 onsetP2_2_1M96 onsetP2_2_2M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP3_0_1M96 onsetP3_0_2M96 onsetP3_1_0M96 onsetP3_1_1M96 onsetP3_1_2M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96
  ring
 rw [he]
 positivity

def onsetG1_3_3M96 (N : ℤ) : ℤ := ((((onsetP2_0_2M96 N*onsetP2_3_1M96 N-onsetP1_0_2M96 N*onsetP3_3_1M96 N) + (onsetP2_0_3M96 N*onsetP2_3_0M96 N-onsetP1_0_3M96 N*onsetP3_3_0M96 N)) + ((onsetP2_1_1M96 N*onsetP2_2_2M96 N-onsetP1_1_1M96 N*onsetP3_2_2M96 N) + ((onsetP2_1_2M96 N*onsetP2_2_1M96 N-onsetP1_1_2M96 N*onsetP3_2_1M96 N) + (onsetP2_1_3M96 N*onsetP2_2_0M96 N-onsetP1_1_3M96 N*onsetP3_2_0M96 N)))) + (((onsetP2_2_0M96 N*onsetP2_1_3M96 N-onsetP1_2_0M96 N*onsetP3_1_3M96 N) + (onsetP2_2_1M96 N*onsetP2_1_2M96 N-onsetP1_2_1M96 N*onsetP3_1_2M96 N)) + ((onsetP2_2_2M96 N*onsetP2_1_1M96 N-onsetP1_2_2M96 N*onsetP3_1_1M96 N) + ((onsetP2_3_0M96 N*onsetP2_0_3M96 N-onsetP1_3_0M96 N*onsetP3_0_3M96 N) + (onsetP2_3_1M96 N*onsetP2_0_2M96 N-onsetP1_3_1M96 N*onsetP3_0_2M96 N)))))

theorem onsetG1_3_3M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_3_3M96 N := by
 have he : onsetG1_3_3M96 N=(((96124380590096409600 + (242990227385988848640*N + 281916119464986585600*N^2)) + (198089712203484433920*N^3 + (93732993984840071680*N^4 + 31427479455401541120*N^5))) + ((7649237790648849920*N^6 + (1360946174177640960*N^7 + 175608893947361280*N^8)) + ((16024342771799040*N^9 + 981554970260480*N^10) + (36243312107520*N^11 + 610241443840*N^12)))) := by
  unfold onsetG1_3_3M96 onsetP1_0_2M96 onsetP1_0_3M96 onsetP1_1_1M96 onsetP1_1_2M96 onsetP1_1_3M96 onsetP1_2_0M96 onsetP1_2_1M96 onsetP1_2_2M96 onsetP1_3_0M96 onsetP1_3_1M96 onsetP2_0_2M96 onsetP2_0_3M96 onsetP2_1_1M96 onsetP2_1_2M96 onsetP2_1_3M96 onsetP2_2_0M96 onsetP2_2_1M96 onsetP2_2_2M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP3_0_2M96 onsetP3_0_3M96 onsetP3_1_1M96 onsetP3_1_2M96 onsetP3_1_3M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96
  ring
 rw [he]
 positivity

def onsetG1_3_4M96 (N : ℤ) : ℤ := ((((onsetP2_0_3M96 N*onsetP2_3_1M96 N-onsetP1_0_3M96 N*onsetP3_3_1M96 N) + (onsetP2_0_4M96 N*onsetP2_3_0M96 N-onsetP1_0_4M96 N*onsetP3_3_0M96 N)) + ((onsetP2_1_2M96 N*onsetP2_2_2M96 N-onsetP1_1_2M96 N*onsetP3_2_2M96 N) + (onsetP2_1_3M96 N*onsetP2_2_1M96 N-onsetP1_1_3M96 N*onsetP3_2_1M96 N))) + (((onsetP2_2_1M96 N*onsetP2_1_3M96 N-onsetP1_2_1M96 N*onsetP3_1_3M96 N) + (onsetP2_2_2M96 N*onsetP2_1_2M96 N-onsetP1_2_2M96 N*onsetP3_1_2M96 N)) + ((onsetP2_3_0M96 N*onsetP2_0_4M96 N-onsetP1_3_0M96 N*onsetP3_0_4M96 N) + (onsetP2_3_1M96 N*onsetP2_0_3M96 N-onsetP1_3_1M96 N*onsetP3_0_3M96 N))))

theorem onsetG1_3_4M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_3_4M96 N := by
 have he : onsetG1_3_4M96 N=(((9076170172369305600 + (23341409907770304000*N + 27556860272092945920*N^2)) + (19714668055903511040*N^3 + (9505041432945981440*N^4 + 3249661580902410240*N^5))) + ((807103581409054720*N^6 + (146626781338275840*N^7 + 19329231619407360*N^8)) + ((1802750133327360*N^9 + 112905075189760*N^10) + (4263873976320*N^11 + 73448883200*N^12)))) := by
  unfold onsetG1_3_4M96 onsetP1_0_3M96 onsetP1_0_4M96 onsetP1_1_2M96 onsetP1_1_3M96 onsetP1_2_1M96 onsetP1_2_2M96 onsetP1_3_0M96 onsetP1_3_1M96 onsetP2_0_3M96 onsetP2_0_4M96 onsetP2_1_2M96 onsetP2_1_3M96 onsetP2_2_1M96 onsetP2_2_2M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP3_0_3M96 onsetP3_0_4M96 onsetP3_1_2M96 onsetP3_1_3M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96
  ring
 rw [he]
 positivity

def onsetG1_3_5M96 (N : ℤ) : ℤ := (((onsetP2_0_4M96 N*onsetP2_3_1M96 N-onsetP1_0_4M96 N*onsetP3_3_1M96 N) + (onsetP2_1_3M96 N*onsetP2_2_2M96 N-onsetP1_1_3M96 N*onsetP3_2_2M96 N)) + ((onsetP2_2_2M96 N*onsetP2_1_3M96 N-onsetP1_2_2M96 N*onsetP3_1_3M96 N) + (onsetP2_3_1M96 N*onsetP2_0_4M96 N-onsetP1_3_1M96 N*onsetP3_0_4M96 N)))

theorem onsetG1_3_5M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_3_5M96 N := by
 have he : onsetG1_3_5M96 N=(((341508541099622400 + (893960001558650880*N + 1074445355385529344*N^2)) + (782908028819610624*N^3 + (384698057376743936*N^4 + 134139447577551360*N^5))) + ((34002022117944832*N^6 + (6308508697247232*N^7 + 849791345346048*N^8)) + ((81026574773760*N^9 + 5190133172224*N^10) + (200540626944*N^11 + 3535702016*N^12)))) := by
  unfold onsetG1_3_5M96 onsetP1_0_4M96 onsetP1_1_3M96 onsetP1_2_2M96 onsetP1_3_1M96 onsetP2_0_4M96 onsetP2_1_3M96 onsetP2_2_2M96 onsetP2_3_1M96 onsetP3_0_4M96 onsetP3_1_3M96 onsetP3_2_2M96 onsetP3_3_1M96
  ring
 rw [he]
 positivity

def onsetG1_4_0M96 (N : ℤ) : ℤ := (((onsetP2_0_0M96 N*onsetP2_4_0M96 N-onsetP1_0_0M96 N*onsetP3_4_0M96 N) + (onsetP2_1_0M96 N*onsetP2_3_0M96 N-onsetP1_1_0M96 N*onsetP3_3_0M96 N)) + ((onsetP2_2_0M96 N*onsetP2_2_0M96 N-onsetP1_2_0M96 N*onsetP3_2_0M96 N) + ((onsetP2_3_0M96 N*onsetP2_1_0M96 N-onsetP1_3_0M96 N*onsetP3_1_0M96 N) + (onsetP2_4_0M96 N*onsetP2_0_0M96 N-onsetP1_4_0M96 N*onsetP3_0_0M96 N))))

theorem onsetG1_4_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_4_0M96 N := by
 have he : onsetG1_4_0M96 N=(((428768856149995065600 + (1027552381524132226560*N + 1129324663460757125376*N^2)) + (750389926140117935616*N^3 + (335091550485193902848*N^4 + 105826536492525730560*N^5))) + ((24222544301136955648*N^6 + (4047878331866734848*N^7 + 490174227239337984*N^8)) + ((41954428613287680*N^9 + 2409875173490176*N^10) + (83436317454336*N^11 + 1317282944768*N^12)))) := by
  unfold onsetG1_4_0M96 onsetP1_0_0M96 onsetP1_1_0M96 onsetP1_2_0M96 onsetP1_3_0M96 onsetP1_4_0M96 onsetP2_0_0M96 onsetP2_1_0M96 onsetP2_2_0M96 onsetP2_3_0M96 onsetP2_4_0M96 onsetP3_0_0M96 onsetP3_1_0M96 onsetP3_2_0M96 onsetP3_3_0M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_4_1M96 (N : ℤ) : ℤ := ((((onsetP2_0_1M96 N*onsetP2_4_0M96 N-onsetP1_0_1M96 N*onsetP3_4_0M96 N) + (onsetP2_1_0M96 N*onsetP2_3_1M96 N-onsetP1_1_0M96 N*onsetP3_3_1M96 N)) + ((onsetP2_1_1M96 N*onsetP2_3_0M96 N-onsetP1_1_1M96 N*onsetP3_3_0M96 N) + (onsetP2_2_0M96 N*onsetP2_2_1M96 N-onsetP1_2_0M96 N*onsetP3_2_1M96 N))) + (((onsetP2_2_1M96 N*onsetP2_2_0M96 N-onsetP1_2_1M96 N*onsetP3_2_0M96 N) + (onsetP2_3_0M96 N*onsetP2_1_1M96 N-onsetP1_3_0M96 N*onsetP3_1_1M96 N)) + ((onsetP2_3_1M96 N*onsetP2_1_0M96 N-onsetP1_3_1M96 N*onsetP3_1_0M96 N) + (onsetP2_4_0M96 N*onsetP2_0_1M96 N-onsetP1_4_0M96 N*onsetP3_0_1M96 N))))

theorem onsetG1_4_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_4_1M96 N := by
 have he : onsetG1_4_1M96 N=(((326696922123204326400 + (795575307948995669760*N + 888870334014275090688*N^2)) + (600914515412940443904*N^3 + (273276476246841939200*N^4 + 87967951458775368960*N^5))) + ((20537978263936532224*N^6 + (3502842507742862592*N^7 + 433092715962493440*N^8)) + ((37859386990548480*N^9 + 2221489231026688*N^10) + (78581974216704*N^11 + 1267710402560*N^12)))) := by
  unfold onsetG1_4_1M96 onsetP1_0_1M96 onsetP1_1_0M96 onsetP1_1_1M96 onsetP1_2_0M96 onsetP1_2_1M96 onsetP1_3_0M96 onsetP1_3_1M96 onsetP1_4_0M96 onsetP2_0_1M96 onsetP2_1_0M96 onsetP2_1_1M96 onsetP2_2_0M96 onsetP2_2_1M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_0_1M96 onsetP3_1_0M96 onsetP3_1_1M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_4_2M96 (N : ℤ) : ℤ := ((((onsetP2_0_2M96 N*onsetP2_4_0M96 N-onsetP1_0_2M96 N*onsetP3_4_0M96 N) + (onsetP2_1_1M96 N*onsetP2_3_1M96 N-onsetP1_1_1M96 N*onsetP3_3_1M96 N)) + ((onsetP2_1_2M96 N*onsetP2_3_0M96 N-onsetP1_1_2M96 N*onsetP3_3_0M96 N) + (onsetP2_2_0M96 N*onsetP2_2_2M96 N-onsetP1_2_0M96 N*onsetP3_2_2M96 N))) + (((onsetP2_2_1M96 N*onsetP2_2_1M96 N-onsetP1_2_1M96 N*onsetP3_2_1M96 N) + (onsetP2_2_2M96 N*onsetP2_2_0M96 N-onsetP1_2_2M96 N*onsetP3_2_0M96 N)) + ((onsetP2_3_0M96 N*onsetP2_1_2M96 N-onsetP1_3_0M96 N*onsetP3_1_2M96 N) + ((onsetP2_3_1M96 N*onsetP2_1_1M96 N-onsetP1_3_1M96 N*onsetP3_1_1M96 N) + (onsetP2_4_0M96 N*onsetP2_0_2M96 N-onsetP1_4_0M96 N*onsetP3_0_2M96 N)))))

theorem onsetG1_4_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_4_2M96 N := by
 have he : onsetG1_4_2M96 N=(((93052085642730547200 + (230381568328746078720*N + 261781832219795838720*N^2)) + (180119369667886414080*N^3 + (83437898885950479360*N^4 + 27381374686496839680*N^5))) + ((6521834609513664000*N^6 + (1135449213913244160*N^7 + 143370048513000960*N^8)) + ((12803432904595200*N^9 + 767677831898880*N^10) + (27753848156160*N^11 + 457681082880*N^12)))) := by
  unfold onsetG1_4_2M96 onsetP1_0_2M96 onsetP1_1_1M96 onsetP1_1_2M96 onsetP1_2_0M96 onsetP1_2_1M96 onsetP1_2_2M96 onsetP1_3_0M96 onsetP1_3_1M96 onsetP1_4_0M96 onsetP2_0_2M96 onsetP2_1_1M96 onsetP2_1_2M96 onsetP2_2_0M96 onsetP2_2_1M96 onsetP2_2_2M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_0_2M96 onsetP3_1_1M96 onsetP3_1_2M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_4_3M96 (N : ℤ) : ℤ := ((((onsetP2_0_3M96 N*onsetP2_4_0M96 N-onsetP1_0_3M96 N*onsetP3_4_0M96 N) + (onsetP2_1_2M96 N*onsetP2_3_1M96 N-onsetP1_1_2M96 N*onsetP3_3_1M96 N)) + ((onsetP2_1_3M96 N*onsetP2_3_0M96 N-onsetP1_1_3M96 N*onsetP3_3_0M96 N) + (onsetP2_2_1M96 N*onsetP2_2_2M96 N-onsetP1_2_1M96 N*onsetP3_2_2M96 N))) + (((onsetP2_2_2M96 N*onsetP2_2_1M96 N-onsetP1_2_2M96 N*onsetP3_2_1M96 N) + (onsetP2_3_0M96 N*onsetP2_1_3M96 N-onsetP1_3_0M96 N*onsetP3_1_3M96 N)) + ((onsetP2_3_1M96 N*onsetP2_1_2M96 N-onsetP1_3_1M96 N*onsetP3_1_2M96 N) + (onsetP2_4_0M96 N*onsetP2_0_3M96 N-onsetP1_4_0M96 N*onsetP3_0_3M96 N))))

theorem onsetG1_4_3M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_4_3M96 N := by
 have he : onsetG1_4_3M96 N=(((11737612288384819200 + (29561745224458379520*N + 34179144035450319360*N^2)) + (23943183253717056000*N^3 + (11300805391723258880*N^4 + 3781438917684234240*N^5))) + ((919031583024432640*N^6 + (163359639457943040*N^7 + 21069746091851520*N^8)) + ((1922703453834240*N^9 + 117835153408000*N^10) + (4355443599360*N^11 + 73448883200*N^12)))) := by
  unfold onsetG1_4_3M96 onsetP1_0_3M96 onsetP1_1_2M96 onsetP1_1_3M96 onsetP1_2_1M96 onsetP1_2_2M96 onsetP1_3_0M96 onsetP1_3_1M96 onsetP1_4_0M96 onsetP2_0_3M96 onsetP2_1_2M96 onsetP2_1_3M96 onsetP2_2_1M96 onsetP2_2_2M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_0_3M96 onsetP3_1_2M96 onsetP3_1_3M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_4_4M96 (N : ℤ) : ℤ := (((onsetP2_0_4M96 N*onsetP2_4_0M96 N-onsetP1_0_4M96 N*onsetP3_4_0M96 N) + (onsetP2_1_3M96 N*onsetP2_3_1M96 N-onsetP1_1_3M96 N*onsetP3_3_1M96 N)) + ((onsetP2_2_2M96 N*onsetP2_2_2M96 N-onsetP1_2_2M96 N*onsetP3_2_2M96 N) + ((onsetP2_3_1M96 N*onsetP2_1_3M96 N-onsetP1_3_1M96 N*onsetP3_1_3M96 N) + (onsetP2_4_0M96 N*onsetP2_0_4M96 N-onsetP1_4_0M96 N*onsetP3_0_4M96 N))))

theorem onsetG1_4_4M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_4_4M96 N := by
 have he : onsetG1_4_4M96 N=(((553065554647065600 + (1417751010410112000*N + 1668699663691979520*N^2)) + (1190577892209135360*N^3 + (572700401808478720*N^4 + 195443816211168000*N^5))) + ((48476811477301760*N^6 + (8799270131232000*N^7 + 1159518908808960*N^8)) + ((108149626905600*N^9 + 6776819947520*N^10) + (256180592640*N^11 + 4419627520*N^12)))) := by
  unfold onsetG1_4_4M96 onsetP1_0_4M96 onsetP1_1_3M96 onsetP1_2_2M96 onsetP1_3_1M96 onsetP1_4_0M96 onsetP2_0_4M96 onsetP2_1_3M96 onsetP2_2_2M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_0_4M96 onsetP3_1_3M96 onsetP3_2_2M96 onsetP3_3_1M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_5_0M96 (N : ℤ) : ℤ := (((onsetP2_1_0M96 N*onsetP2_4_0M96 N-onsetP1_1_0M96 N*onsetP3_4_0M96 N) + (onsetP2_2_0M96 N*onsetP2_3_0M96 N-onsetP1_2_0M96 N*onsetP3_3_0M96 N)) + ((onsetP2_3_0M96 N*onsetP2_2_0M96 N-onsetP1_3_0M96 N*onsetP3_2_0M96 N) + (onsetP2_4_0M96 N*onsetP2_1_0M96 N-onsetP1_4_0M96 N*onsetP3_1_0M96 N)))

theorem onsetG1_5_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_5_0M96 N := by
 have he : onsetG1_5_0M96 N=(((84158313569056742400 + (200680989547507499520*N + 219552659004777348096*N^2)) + (145312873595516723712*N^3 + (64682859165294587392*N^4 + 20376990319800791040*N^5))) + ((4655653003191400448*N^6 + (777104076938789376*N^7 + 94048032202768896*N^8)) + ((8049462842749440*N^9 + 462602511827456*N^10) + (16033445363712*N^11 + 253542080512*N^12)))) := by
  unfold onsetG1_5_0M96 onsetP1_1_0M96 onsetP1_2_0M96 onsetP1_3_0M96 onsetP1_4_0M96 onsetP2_1_0M96 onsetP2_2_0M96 onsetP2_3_0M96 onsetP2_4_0M96 onsetP3_1_0M96 onsetP3_2_0M96 onsetP3_3_0M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_5_1M96 (N : ℤ) : ℤ := (((onsetP2_1_1M96 N*onsetP2_4_0M96 N-onsetP1_1_1M96 N*onsetP3_4_0M96 N) + ((onsetP2_2_0M96 N*onsetP2_3_1M96 N-onsetP1_2_0M96 N*onsetP3_3_1M96 N) + (onsetP2_2_1M96 N*onsetP2_3_0M96 N-onsetP1_2_1M96 N*onsetP3_3_0M96 N))) + ((onsetP2_3_0M96 N*onsetP2_2_1M96 N-onsetP1_3_0M96 N*onsetP3_2_1M96 N) + ((onsetP2_3_1M96 N*onsetP2_2_0M96 N-onsetP1_3_1M96 N*onsetP3_2_0M96 N) + (onsetP2_4_0M96 N*onsetP2_1_1M96 N-onsetP1_4_0M96 N*onsetP3_1_1M96 N))))

theorem onsetG1_5_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_5_1M96 N := by
 have he : onsetG1_5_1M96 N=(((48040520987596838400 + (116451928054865975040*N + 129559723156504053504*N^2)) + (87268382395880324352*N^3 + (39567615227730008832*N^4 + 12706953814142542080*N^5))) + ((2961624384553535232*N^6 + (504554804029253376*N^7 + 62348855475465216*N^8)) + ((5450216143572480*N^9 + 319966327371264*N^10) + (11330084892672*N^11 + 183072433152*N^12)))) := by
  unfold onsetG1_5_1M96 onsetP1_1_1M96 onsetP1_2_0M96 onsetP1_2_1M96 onsetP1_3_0M96 onsetP1_3_1M96 onsetP1_4_0M96 onsetP2_1_1M96 onsetP2_2_0M96 onsetP2_2_1M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_1_1M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_5_2M96 (N : ℤ) : ℤ := (((onsetP2_1_2M96 N*onsetP2_4_0M96 N-onsetP1_1_2M96 N*onsetP3_4_0M96 N) + ((onsetP2_2_1M96 N*onsetP2_3_1M96 N-onsetP1_2_1M96 N*onsetP3_3_1M96 N) + (onsetP2_2_2M96 N*onsetP2_3_0M96 N-onsetP1_2_2M96 N*onsetP3_3_0M96 N))) + ((onsetP2_3_0M96 N*onsetP2_2_2M96 N-onsetP1_3_0M96 N*onsetP3_2_2M96 N) + ((onsetP2_3_1M96 N*onsetP2_2_1M96 N-onsetP1_3_1M96 N*onsetP3_2_1M96 N) + (onsetP2_4_0M96 N*onsetP2_1_2M96 N-onsetP1_4_0M96 N*onsetP3_1_2M96 N))))

theorem onsetG1_5_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_5_2M96 N := by
 have he : onsetG1_5_2M96 N=(((9108871646328921600 + (22458430707282097920*N + 25421398845866295552*N^2)) + (17432510105453909760*N^3 + (8052866567028030720*N^4 + 2636870425248326400*N^5))) + ((627052699069552896*N^6 + (109055008788768000*N^7 + 13762913856975360*N^8)) + ((1229061025543680*N^9 + 73729101207552*N^10) + (2668207933440*N^11 + 44069329920*N^12)))) := by
  unfold onsetG1_5_2M96 onsetP1_1_2M96 onsetP1_2_1M96 onsetP1_2_2M96 onsetP1_3_0M96 onsetP1_3_1M96 onsetP1_4_0M96 onsetP2_1_2M96 onsetP2_2_1M96 onsetP2_2_2M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_1_2M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_5_3M96 (N : ℤ) : ℤ := (((onsetP2_1_3M96 N*onsetP2_4_0M96 N-onsetP1_1_3M96 N*onsetP3_4_0M96 N) + (onsetP2_2_2M96 N*onsetP2_3_1M96 N-onsetP1_2_2M96 N*onsetP3_3_1M96 N)) + ((onsetP2_3_1M96 N*onsetP2_2_2M96 N-onsetP1_3_1M96 N*onsetP3_2_2M96 N) + (onsetP2_4_0M96 N*onsetP2_1_3M96 N-onsetP1_4_0M96 N*onsetP3_1_3M96 N)))

theorem onsetG1_5_3M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_5_3M96 N := by
 have he : onsetG1_5_3M96 N=(((573438564091008000 + (1438914903130575360*N + 1657940115033312768*N^2)) + (1157889498479132160*N^3 + (545112357489975296*N^4 + 182035003790922240*N^5))) + ((44175380479143424*N^6 + (7844596880117760*N^7 + 1011290241497088*N^8)) + ((92284103385600*N^9 + 5658399889408*N^10) + (209348321280*N^11 + 3535702016*N^12)))) := by
  unfold onsetG1_5_3M96 onsetP1_1_3M96 onsetP1_2_2M96 onsetP1_3_1M96 onsetP1_4_0M96 onsetP2_1_3M96 onsetP2_2_2M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_1_3M96 onsetP3_2_2M96 onsetP3_3_1M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity
end
end MathGKM.Markov
