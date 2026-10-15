import MarkovOnsetPartsM96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetG4_3_0M96 (N : ℤ) : ℤ := (((onsetP5_0_0M96 N*onsetP5_3_0M96 N-onsetP4_0_0M96 N*onsetP6_3_0M96 N) + (onsetP5_1_0M96 N*onsetP5_2_0M96 N-onsetP4_1_0M96 N*onsetP6_2_0M96 N)) + ((onsetP5_2_0M96 N*onsetP5_1_0M96 N-onsetP4_2_0M96 N*onsetP6_1_0M96 N) + (onsetP5_3_0M96 N*onsetP5_0_0M96 N-onsetP4_3_0M96 N*onsetP6_0_0M96 N)))

theorem onsetG4_3_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_3_0M96 N := by
 have he : onsetG4_3_0M96 N=(((1518504282800655091200 + (3663711239524923121920*N + 4037183024817309534720*N^2)) + (2685256863103278648576*N^3 + (1199973441896052189184*N^4 + 379293558669422154240*N^5))) + ((86884449942474867200*N^6 + (14518901107843550208*N^7 + 1754487888721112832*N^8)) + ((149291628573104640*N^9 + 8473807543066880*N^10) + (287283428898816*N^11 + 4382873334784*N^12)))) := by
  unfold onsetG4_3_0M96 onsetP4_0_0M96 onsetP4_1_0M96 onsetP4_2_0M96 onsetP4_3_0M96 onsetP5_0_0M96 onsetP5_1_0M96 onsetP5_2_0M96 onsetP5_3_0M96 onsetP6_0_0M96 onsetP6_1_0M96 onsetP6_2_0M96 onsetP6_3_0M96
  ring
 rw [he]
 positivity

def onsetG4_3_1M96 (N : ℤ) : ℤ := ((((onsetP5_0_0M96 N*onsetP5_3_1M96 N-onsetP4_0_0M96 N*onsetP6_3_1M96 N) + (onsetP5_0_1M96 N*onsetP5_3_0M96 N-onsetP4_0_1M96 N*onsetP6_3_0M96 N)) + ((onsetP5_1_0M96 N*onsetP5_2_1M96 N-onsetP4_1_0M96 N*onsetP6_2_1M96 N) + (onsetP5_1_1M96 N*onsetP5_2_0M96 N-onsetP4_1_1M96 N*onsetP6_2_0M96 N))) + (((onsetP5_2_0M96 N*onsetP5_1_1M96 N-onsetP4_2_0M96 N*onsetP6_1_1M96 N) + (onsetP5_2_1M96 N*onsetP5_1_0M96 N-onsetP4_2_1M96 N*onsetP6_1_0M96 N)) + ((onsetP5_3_0M96 N*onsetP5_0_1M96 N-onsetP4_3_0M96 N*onsetP6_0_1M96 N) + (onsetP5_3_1M96 N*onsetP5_0_0M96 N-onsetP4_3_1M96 N*onsetP6_0_0M96 N))))

theorem onsetG4_3_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_3_1M96 N := by
 have he : onsetG4_3_1M96 N=(((1483181504051416243200 + (3666973204631356945920*N + 4135521458716394294016*N^2)) + (2811680541537610176000*N^3 + (1282781676864146584832*N^4 + 413464958224645071360*N^5))) + ((96465228486993253888*N^6 + (16398418652641589760*N^7 + 2013282699315799296*N^8)) + ((173807773626654720*N^9 + 9992931778391296*N^10) + (342496374743040*N^11 + 5269131779072*N^12)))) := by
  unfold onsetG4_3_1M96 onsetP4_0_0M96 onsetP4_0_1M96 onsetP4_1_0M96 onsetP4_1_1M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP5_0_0M96 onsetP5_0_1M96 onsetP5_1_0M96 onsetP5_1_1M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP6_0_0M96 onsetP6_0_1M96 onsetP6_1_0M96 onsetP6_1_1M96 onsetP6_2_0M96 onsetP6_2_1M96 onsetP6_3_0M96 onsetP6_3_1M96
  ring
 rw [he]
 positivity

def onsetG4_3_2M96 (N : ℤ) : ℤ := ((((onsetP5_0_1M96 N*onsetP5_3_1M96 N-onsetP4_0_1M96 N*onsetP6_3_1M96 N) + (onsetP5_0_2M96 N*onsetP5_3_0M96 N-onsetP4_0_2M96 N*onsetP6_3_0M96 N)) + ((onsetP5_1_0M96 N*onsetP5_2_2M96 N-onsetP4_1_0M96 N*onsetP6_2_2M96 N) + ((onsetP5_1_1M96 N*onsetP5_2_1M96 N-onsetP4_1_1M96 N*onsetP6_2_1M96 N) + (onsetP5_1_2M96 N*onsetP5_2_0M96 N-onsetP4_1_2M96 N*onsetP6_2_0M96 N)))) + (((onsetP5_2_0M96 N*onsetP5_1_2M96 N-onsetP4_2_0M96 N*onsetP6_1_2M96 N) + (onsetP5_2_1M96 N*onsetP5_1_1M96 N-onsetP4_2_1M96 N*onsetP6_1_1M96 N)) + ((onsetP5_2_2M96 N*onsetP5_1_0M96 N-onsetP4_2_2M96 N*onsetP6_1_0M96 N) + ((onsetP5_3_0M96 N*onsetP5_0_2M96 N-onsetP4_3_0M96 N*onsetP6_0_2M96 N) + (onsetP5_3_1M96 N*onsetP5_0_1M96 N-onsetP4_3_1M96 N*onsetP6_0_1M96 N)))))

theorem onsetG4_3_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_3_2M96 N := by
 have he : onsetG4_3_2M96 N=(((570457914560929382400 + (1448839327849106054400*N + 1676104132561285109760*N^2)) + (1167255220718600326656*N^3 + (544706525920415004160*N^4 + 179329893674697991680*N^5))) + ((42676715006168714240*N^6 + (7389666829196241408*N^7 + 922782963619749120*N^8)) + ((80899510706219520*N^9 + 4714713958169600*N^10) + (163429169627136*N^11 + 2535420805120*N^12)))) := by
  unfold onsetG4_3_2M96 onsetP4_0_1M96 onsetP4_0_2M96 onsetP4_1_0M96 onsetP4_1_1M96 onsetP4_1_2M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP5_0_1M96 onsetP5_0_2M96 onsetP5_1_0M96 onsetP5_1_1M96 onsetP5_1_2M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP6_0_1M96 onsetP6_0_2M96 onsetP6_1_0M96 onsetP6_1_1M96 onsetP6_1_2M96 onsetP6_2_0M96 onsetP6_2_1M96 onsetP6_2_2M96 onsetP6_3_0M96 onsetP6_3_1M96
  ring
 rw [he]
 positivity

def onsetG4_3_3M96 (N : ℤ) : ℤ := ((((onsetP5_0_2M96 N*onsetP5_3_1M96 N-onsetP4_0_2M96 N*onsetP6_3_1M96 N) + (onsetP5_0_3M96 N*onsetP5_3_0M96 N-onsetP4_0_3M96 N*onsetP6_3_0M96 N)) + ((onsetP5_1_1M96 N*onsetP5_2_2M96 N-onsetP4_1_1M96 N*onsetP6_2_2M96 N) + ((onsetP5_1_2M96 N*onsetP5_2_1M96 N-onsetP4_1_2M96 N*onsetP6_2_1M96 N) + (onsetP5_1_3M96 N*onsetP5_2_0M96 N-onsetP4_1_3M96 N*onsetP6_2_0M96 N)))) + (((onsetP5_2_0M96 N*onsetP5_1_3M96 N-onsetP4_2_0M96 N*onsetP6_1_3M96 N) + (onsetP5_2_1M96 N*onsetP5_1_2M96 N-onsetP4_2_1M96 N*onsetP6_1_2M96 N)) + ((onsetP5_2_2M96 N*onsetP5_1_1M96 N-onsetP4_2_2M96 N*onsetP6_1_1M96 N) + ((onsetP5_3_0M96 N*onsetP5_0_3M96 N-onsetP4_3_0M96 N*onsetP6_0_3M96 N) + (onsetP5_3_1M96 N*onsetP5_0_2M96 N-onsetP4_3_1M96 N*onsetP6_0_2M96 N)))))

theorem onsetG4_3_3M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_3_3M96 N := by
 have he : onsetG4_3_3M96 N=(((107653465892046412800 + (281683168328566287360*N + 335168512265738027520*N^2)) + (239669201467473039360*N^3 + (114647641336521072640*N^4 + 38628135895292321280*N^5))) + ((9392891855213511680*N^6 + (1659203529062607360*N^7 + 211019958029771520*N^8)) + ((18807708989583360*N^9 + 1112001046016000*N^10) + (39005088890880*N^11 + 610241443840*N^12)))) := by
  unfold onsetG4_3_3M96 onsetP4_0_2M96 onsetP4_0_3M96 onsetP4_1_1M96 onsetP4_1_2M96 onsetP4_1_3M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP5_0_2M96 onsetP5_0_3M96 onsetP5_1_1M96 onsetP5_1_2M96 onsetP5_1_3M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP6_0_2M96 onsetP6_0_3M96 onsetP6_1_1M96 onsetP6_1_2M96 onsetP6_1_3M96 onsetP6_2_0M96 onsetP6_2_1M96 onsetP6_2_2M96 onsetP6_3_0M96 onsetP6_3_1M96
  ring
 rw [he]
 positivity

def onsetG4_3_4M96 (N : ℤ) : ℤ := ((((onsetP5_0_3M96 N*onsetP5_3_1M96 N-onsetP4_0_3M96 N*onsetP6_3_1M96 N) + (onsetP5_0_4M96 N*onsetP5_3_0M96 N-onsetP4_0_4M96 N*onsetP6_3_0M96 N)) + ((onsetP5_1_2M96 N*onsetP5_2_2M96 N-onsetP4_1_2M96 N*onsetP6_2_2M96 N) + (onsetP5_1_3M96 N*onsetP5_2_1M96 N-onsetP4_1_3M96 N*onsetP6_2_1M96 N))) + (((onsetP5_2_1M96 N*onsetP5_1_3M96 N-onsetP4_2_1M96 N*onsetP6_1_3M96 N) + (onsetP5_2_2M96 N*onsetP5_1_2M96 N-onsetP4_2_2M96 N*onsetP6_1_2M96 N)) + ((onsetP5_3_0M96 N*onsetP5_0_4M96 N-onsetP4_3_0M96 N*onsetP6_0_4M96 N) + (onsetP5_3_1M96 N*onsetP5_0_3M96 N-onsetP4_3_1M96 N*onsetP6_0_3M96 N))))

theorem onsetG4_3_4M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_3_4M96 N := by
 have he : onsetG4_3_4M96 N=(((9939170449468108800 + (26879137675752337920*N + 32994232801707340800*N^2)) + (24291243583832736000*N^3 + (11940361135774131200*N^4 + 4126232269192696320*N^5))) + ((1027205617491827200*N^6 + (185431820894046720*N^7 + 24056193418118400*N^8)) + ((2182606736808960*N^9 + 131055126496000*N^10) + (4654783150080*N^11 + 73448883200*N^12)))) := by
  unfold onsetG4_3_4M96 onsetP4_0_3M96 onsetP4_0_4M96 onsetP4_1_2M96 onsetP4_1_3M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP5_0_3M96 onsetP5_0_4M96 onsetP5_1_2M96 onsetP5_1_3M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP6_0_3M96 onsetP6_0_4M96 onsetP6_1_2M96 onsetP6_1_3M96 onsetP6_2_1M96 onsetP6_2_2M96 onsetP6_3_0M96 onsetP6_3_1M96
  ring
 rw [he]
 positivity

def onsetG4_3_5M96 (N : ℤ) : ℤ := (((onsetP5_0_4M96 N*onsetP5_3_1M96 N-onsetP4_0_4M96 N*onsetP6_3_1M96 N) + (onsetP5_1_3M96 N*onsetP5_2_2M96 N-onsetP4_1_3M96 N*onsetP6_2_2M96 N)) + ((onsetP5_2_2M96 N*onsetP5_1_3M96 N-onsetP4_2_2M96 N*onsetP6_1_3M96 N) + (onsetP5_3_1M96 N*onsetP5_0_4M96 N-onsetP4_3_1M96 N*onsetP6_0_4M96 N)))

theorem onsetG4_3_5M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_3_5M96 N := by
 have he : onsetG4_3_5M96 N=(((358539092590694400 + (1005405237932497920*N + 1277027483270144256*N^2)) + (970689927827010048*N^3 + (491542655881953536*N^4 + 174621138007411200*N^5))) + ((44599044567228928*N^6 + (8243591261681664*N^7 + 1092778593570048*N^8)) + ((101081831854080*N^9 + 6171484700416*N^10) + (222133567488*N^11 + 3535702016*N^12)))) := by
  unfold onsetG4_3_5M96 onsetP4_0_4M96 onsetP4_1_3M96 onsetP4_2_2M96 onsetP4_3_1M96 onsetP5_0_4M96 onsetP5_1_3M96 onsetP5_2_2M96 onsetP5_3_1M96 onsetP6_0_4M96 onsetP6_1_3M96 onsetP6_2_2M96 onsetP6_3_1M96
  ring
 rw [he]
 positivity

def onsetG4_4_0M96 (N : ℤ) : ℤ := (((onsetP5_0_0M96 N*onsetP5_4_0M96 N-onsetP4_0_0M96 N*onsetP6_4_0M96 N) + (onsetP5_1_0M96 N*onsetP5_3_0M96 N-onsetP4_1_0M96 N*onsetP6_3_0M96 N)) + ((onsetP5_2_0M96 N*onsetP5_2_0M96 N-onsetP4_2_0M96 N*onsetP6_2_0M96 N) + ((onsetP5_3_0M96 N*onsetP5_1_0M96 N-onsetP4_3_0M96 N*onsetP6_1_0M96 N) + (onsetP5_4_0M96 N*onsetP5_0_0M96 N-onsetP4_4_0M96 N*onsetP6_0_0M96 N))))

theorem onsetG4_4_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_4_0M96 N := by
 have he : onsetG4_4_0M96 N=(((515701142280503424000 + (1233524501990506978560*N + 1346970367691011445760*N^2)) + (887456444096727767808*N^3 + (392703468541028115968*N^4 + 122877507375262456320*N^5))) + ((27857060644991146240*N^6 + (4606118401830430464*N^7 + 550668958905483264*N^8)) + ((46351722981553920*N^9 + 2602412444800000*N^10) + (87274526051328*N^11 + 1317282944768*N^12)))) := by
  unfold onsetG4_4_0M96 onsetP4_0_0M96 onsetP4_1_0M96 onsetP4_2_0M96 onsetP4_3_0M96 onsetP4_4_0M96 onsetP5_0_0M96 onsetP5_1_0M96 onsetP5_2_0M96 onsetP5_3_0M96 onsetP5_4_0M96 onsetP6_0_0M96 onsetP6_1_0M96 onsetP6_2_0M96 onsetP6_3_0M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_4_1M96 (N : ℤ) : ℤ := ((((onsetP5_0_1M96 N*onsetP5_4_0M96 N-onsetP4_0_1M96 N*onsetP6_4_0M96 N) + (onsetP5_1_0M96 N*onsetP5_3_1M96 N-onsetP4_1_0M96 N*onsetP6_3_1M96 N)) + ((onsetP5_1_1M96 N*onsetP5_3_0M96 N-onsetP4_1_1M96 N*onsetP6_3_0M96 N) + (onsetP5_2_0M96 N*onsetP5_2_1M96 N-onsetP4_2_0M96 N*onsetP6_2_1M96 N))) + (((onsetP5_2_1M96 N*onsetP5_2_0M96 N-onsetP4_2_1M96 N*onsetP6_2_0M96 N) + (onsetP5_3_0M96 N*onsetP5_1_1M96 N-onsetP4_3_0M96 N*onsetP6_1_1M96 N)) + ((onsetP5_3_1M96 N*onsetP5_1_0M96 N-onsetP4_3_1M96 N*onsetP6_1_0M96 N) + (onsetP5_4_0M96 N*onsetP5_0_1M96 N-onsetP4_4_0M96 N*onsetP6_0_1M96 N))))

theorem onsetG4_4_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_4_1M96 N := by
 have he : onsetG4_4_1M96 N=(((400723160826779481600 + (983410389222076892160*N + 1100215875664343886336*N^2)) + (741651943114710480384*N^3 + (335324185400461537280*N^4 + 107064538329512064000*N^5))) + ((24735061740912022528*N^6 + (4162375803370401792*N^7 + 505735201852930560*N^8)) + ((43198620102167040*N^9 + 2456998713358336*N^10) + (83299837415424*N^11 + 1267710402560*N^12)))) := by
  unfold onsetG4_4_1M96 onsetP4_0_1M96 onsetP4_1_0M96 onsetP4_1_1M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_0_1M96 onsetP5_1_0M96 onsetP5_1_1M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96 onsetP6_0_1M96 onsetP6_1_0M96 onsetP6_1_1M96 onsetP6_2_0M96 onsetP6_2_1M96 onsetP6_3_0M96 onsetP6_3_1M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_4_2M96 (N : ℤ) : ℤ := ((((onsetP5_0_2M96 N*onsetP5_4_0M96 N-onsetP4_0_2M96 N*onsetP6_4_0M96 N) + (onsetP5_1_1M96 N*onsetP5_3_1M96 N-onsetP4_1_1M96 N*onsetP6_3_1M96 N)) + ((onsetP5_1_2M96 N*onsetP5_3_0M96 N-onsetP4_1_2M96 N*onsetP6_3_0M96 N) + (onsetP5_2_0M96 N*onsetP5_2_2M96 N-onsetP4_2_0M96 N*onsetP6_2_2M96 N))) + (((onsetP5_2_1M96 N*onsetP5_2_1M96 N-onsetP4_2_1M96 N*onsetP6_2_1M96 N) + (onsetP5_2_2M96 N*onsetP5_2_0M96 N-onsetP4_2_2M96 N*onsetP6_2_0M96 N)) + ((onsetP5_3_0M96 N*onsetP5_1_2M96 N-onsetP4_3_0M96 N*onsetP6_1_2M96 N) + ((onsetP5_3_1M96 N*onsetP5_1_1M96 N-onsetP4_3_1M96 N*onsetP6_1_1M96 N) + (onsetP5_4_0M96 N*onsetP5_0_2M96 N-onsetP4_4_0M96 N*onsetP6_0_2M96 N)))))

theorem onsetG4_4_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_4_2M96 N := by
 have he : onsetG4_4_2M96 N=(((114724321843125254400 + (289643249474311783680*N + 332836409094831774720*N^2)) + (230079855960716213760*N^3 + (106508134540713615360*N^4 + 34764346820854909440*N^5))) + ((8198120705476531200*N^6 + (1406029915340386560*N^7 + 173836642151612160*N^8)) + ((15083663519124480*N^9 + 869777982958080*N^10) + (29825180743680*N^11 + 457681082880*N^12)))) := by
  unfold onsetG4_4_2M96 onsetP4_0_2M96 onsetP4_1_1M96 onsetP4_1_2M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_0_2M96 onsetP5_1_1M96 onsetP5_1_2M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96 onsetP6_0_2M96 onsetP6_1_1M96 onsetP6_1_2M96 onsetP6_2_0M96 onsetP6_2_1M96 onsetP6_2_2M96 onsetP6_3_0M96 onsetP6_3_1M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_4_3M96 (N : ℤ) : ℤ := ((((onsetP5_0_3M96 N*onsetP5_4_0M96 N-onsetP4_0_3M96 N*onsetP6_4_0M96 N) + (onsetP5_1_2M96 N*onsetP5_3_1M96 N-onsetP4_1_2M96 N*onsetP6_3_1M96 N)) + ((onsetP5_1_3M96 N*onsetP5_3_0M96 N-onsetP4_1_3M96 N*onsetP6_3_0M96 N) + (onsetP5_2_1M96 N*onsetP5_2_2M96 N-onsetP4_2_1M96 N*onsetP6_2_2M96 N))) + (((onsetP5_2_2M96 N*onsetP5_2_1M96 N-onsetP4_2_2M96 N*onsetP6_2_1M96 N) + (onsetP5_3_0M96 N*onsetP5_1_3M96 N-onsetP4_3_0M96 N*onsetP6_1_3M96 N)) + ((onsetP5_3_1M96 N*onsetP5_1_2M96 N-onsetP4_3_1M96 N*onsetP6_1_2M96 N) + (onsetP5_4_0M96 N*onsetP5_0_3M96 N-onsetP4_4_0M96 N*onsetP6_0_3M96 N))))

theorem onsetG4_4_3M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_4_3M96 N := by
 have he : onsetG4_4_3M96 N=(((14296708988132659200 + (37248400992623788800*N + 44091433212864307200*N^2)) + (31337821550248711680*N^3 + (14888073394287672320*N^4 + 4978269330595599360*N^5))) + ((1200577715265940480*N^6 + (210207305360908800*N^7 + 26484488164807680*N^8)) + ((2337263095050240*N^9 + 136769466373120*N^10) + (4746352773120*N^11 + 73448883200*N^12)))) := by
  unfold onsetG4_4_3M96 onsetP4_0_3M96 onsetP4_1_2M96 onsetP4_1_3M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_0_3M96 onsetP5_1_2M96 onsetP5_1_3M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96 onsetP6_0_3M96 onsetP6_1_2M96 onsetP6_1_3M96 onsetP6_2_1M96 onsetP6_2_2M96 onsetP6_3_0M96 onsetP6_3_1M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_4_4M96 (N : ℤ) : ℤ := (((onsetP5_0_4M96 N*onsetP5_4_0M96 N-onsetP4_0_4M96 N*onsetP6_4_0M96 N) + (onsetP5_1_3M96 N*onsetP5_3_1M96 N-onsetP4_1_3M96 N*onsetP6_3_1M96 N)) + ((onsetP5_2_2M96 N*onsetP5_2_2M96 N-onsetP4_2_2M96 N*onsetP6_2_2M96 N) + ((onsetP5_3_1M96 N*onsetP5_1_3M96 N-onsetP4_3_1M96 N*onsetP6_1_3M96 N) + (onsetP5_4_0M96 N*onsetP5_0_4M96 N-onsetP4_4_0M96 N*onsetP6_0_4M96 N))))

theorem onsetG4_4_4M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_4_4M96 N := by
 have he : onsetG4_4_4M96 N=(((652620080560896000 + (1760570199792311040*N + 2153479782598260480*N^2)) + (1578204671899726080*N^3 + (771470153257189120*N^4 + 264885231848616960*N^5))) + ((65465412177428480*N^6 + (11723684965574400*N^7 + 1507745197512960*N^8)) + ((135522814291200*N^9 + 8056822941440*N^10) + (283171768320*N^11 + 4419627520*N^12)))) := by
  unfold onsetG4_4_4M96 onsetP4_0_4M96 onsetP4_1_3M96 onsetP4_2_2M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_0_4M96 onsetP5_1_3M96 onsetP5_2_2M96 onsetP5_3_1M96 onsetP5_4_0M96 onsetP6_0_4M96 onsetP6_1_3M96 onsetP6_2_2M96 onsetP6_3_1M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_5_0M96 (N : ℤ) : ℤ := (((onsetP5_1_0M96 N*onsetP5_4_0M96 N-onsetP4_1_0M96 N*onsetP6_4_0M96 N) + (onsetP5_2_0M96 N*onsetP5_3_0M96 N-onsetP4_2_0M96 N*onsetP6_3_0M96 N)) + ((onsetP5_3_0M96 N*onsetP5_2_0M96 N-onsetP4_3_0M96 N*onsetP6_2_0M96 N) + (onsetP5_4_0M96 N*onsetP5_1_0M96 N-onsetP4_4_0M96 N*onsetP6_1_0M96 N)))

theorem onsetG4_5_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_5_0M96 N := by
 have he : onsetG4_5_0M96 N=(((112268799476682508800 + (266163507462936061440*N + 287948940389959532544*N^2)) + (187889040956628619776*N^3 + (82315097402180188672*N^4 + 25493691106465290240*N^5))) + ((5719347955544179712*N^6 + (935667405057466368*N^7 + 110661252646511616*N^8)) + ((9214135321950720*N^9 + 511730756063744*N^10) + (16977018003456*N^11 + 253542080512*N^12)))) := by
  unfold onsetG4_5_0M96 onsetP4_1_0M96 onsetP4_2_0M96 onsetP4_3_0M96 onsetP4_4_0M96 onsetP5_1_0M96 onsetP5_2_0M96 onsetP5_3_0M96 onsetP5_4_0M96 onsetP6_1_0M96 onsetP6_2_0M96 onsetP6_3_0M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_5_1M96 (N : ℤ) : ℤ := (((onsetP5_1_1M96 N*onsetP5_4_0M96 N-onsetP4_1_1M96 N*onsetP6_4_0M96 N) + ((onsetP5_2_0M96 N*onsetP5_3_1M96 N-onsetP4_2_0M96 N*onsetP6_3_1M96 N) + (onsetP5_2_1M96 N*onsetP5_3_0M96 N-onsetP4_2_1M96 N*onsetP6_3_0M96 N))) + ((onsetP5_3_0M96 N*onsetP5_2_1M96 N-onsetP4_3_0M96 N*onsetP6_2_1M96 N) + ((onsetP5_3_1M96 N*onsetP5_2_0M96 N-onsetP4_3_1M96 N*onsetP6_2_0M96 N) + (onsetP5_4_0M96 N*onsetP5_1_1M96 N-onsetP4_4_0M96 N*onsetP6_1_1M96 N))))

theorem onsetG4_5_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_5_1M96 N := by
 have he : onsetG4_5_1M96 N=(((65001270166173734400 + (158318625663880496640*N + 175687484827464707328*N^2)) + (117408972245522657280*N^3 + (52602272169757830912*N^4 + 16636050010724336640*N^5))) + ((3805683478822063104*N^6 + (633939307654141440*N^7 + 76226981986907136*N^8)) + ((6442431283384320*N^9 + 362512625491968*N^10) + (12158617927680*N^11 + 183072433152*N^12)))) := by
  unfold onsetG4_5_1M96 onsetP4_1_1M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_1_1M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96 onsetP6_1_1M96 onsetP6_2_0M96 onsetP6_2_1M96 onsetP6_3_0M96 onsetP6_3_1M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_5_2M96 (N : ℤ) : ℤ := (((onsetP5_1_2M96 N*onsetP5_4_0M96 N-onsetP4_1_2M96 N*onsetP6_4_0M96 N) + ((onsetP5_2_1M96 N*onsetP5_3_1M96 N-onsetP4_2_1M96 N*onsetP6_3_1M96 N) + (onsetP5_2_2M96 N*onsetP5_3_0M96 N-onsetP4_2_2M96 N*onsetP6_3_0M96 N))) + ((onsetP5_3_0M96 N*onsetP5_2_2M96 N-onsetP4_3_0M96 N*onsetP6_2_2M96 N) + ((onsetP5_3_1M96 N*onsetP5_2_1M96 N-onsetP4_3_1M96 N*onsetP6_2_1M96 N) + (onsetP5_4_0M96 N*onsetP5_1_2M96 N-onsetP4_4_0M96 N*onsetP6_1_2M96 N))))

theorem onsetG4_5_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_5_2M96 N := by
 have he : onsetG4_5_2M96 N=(((12300587460762854400 + (30869749658134437120*N + 35234894326025382912*N^2)) + (24176413697596425216*N^3 + (11101885797443105280*N^4 + 3592599107250263040*N^5))) + ((839531705671067136*N^6 + (142618848385241088*N^7 + 17458905964147200*N^8)) + ((1499454359101440*N^9 + 85560245981952*N^10) + (2902753437696*N^11 + 44069329920*N^12)))) := by
  unfold onsetG4_5_2M96 onsetP4_1_2M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_1_2M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96 onsetP6_1_2M96 onsetP6_2_1M96 onsetP6_2_2M96 onsetP6_3_0M96 onsetP6_3_1M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_5_3M96 (N : ℤ) : ℤ := (((onsetP5_1_3M96 N*onsetP5_4_0M96 N-onsetP4_1_3M96 N*onsetP6_4_0M96 N) + (onsetP5_2_2M96 N*onsetP5_3_1M96 N-onsetP4_2_2M96 N*onsetP6_3_1M96 N)) + ((onsetP5_3_1M96 N*onsetP5_2_2M96 N-onsetP4_3_1M96 N*onsetP6_2_2M96 N) + (onsetP5_4_0M96 N*onsetP5_1_3M96 N-onsetP4_4_0M96 N*onsetP6_1_3M96 N)))

theorem onsetG4_5_3M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_5_3M96 N := by
 have he : onsetG4_5_3M96 N=(((758440581818572800 + (1967704968394368000*N + 2317252185403964928*N^2)) + (1637099400877000704*N^3 + (772476501967175936*N^4 + 256362028305116160*N^5))) + ((61321562645507584*N^6 + (10642992822185472*N^7 + 1328523348085248*N^8)) + ((116101853360640*N^9 + 6725053151488*N^10) + (230941261824*N^11 + 3535702016*N^12)))) := by
  unfold onsetG4_5_3M96 onsetP4_1_3M96 onsetP4_2_2M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_1_3M96 onsetP5_2_2M96 onsetP5_3_1M96 onsetP5_4_0M96 onsetP6_1_3M96 onsetP6_2_2M96 onsetP6_3_1M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity
end
end MathGKM.Markov
