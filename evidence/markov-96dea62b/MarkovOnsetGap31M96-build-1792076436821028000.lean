import MarkovOnsetPartsM96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetG3_3_0M96 (N : ℤ) : ℤ := (((onsetP4_0_0M96 N*onsetP4_3_0M96 N-onsetP3_0_0M96 N*onsetP5_3_0M96 N) + (onsetP4_1_0M96 N*onsetP4_2_0M96 N-onsetP3_1_0M96 N*onsetP5_2_0M96 N)) + ((onsetP4_2_0M96 N*onsetP4_1_0M96 N-onsetP3_2_0M96 N*onsetP5_1_0M96 N) + (onsetP4_3_0M96 N*onsetP4_0_0M96 N-onsetP3_3_0M96 N*onsetP5_0_0M96 N)))

theorem onsetG3_3_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_3_0M96 N := by
 have he : onsetG3_3_0M96 N=(((1864238287686292224000 + (4357762387793260911360*N + 4659470527927689266688*N^2)) + (3012234778684977619200*N^3 + (1310774900768288268544*N^4 + 404288895840512578560*N^5))) + ((90584338964747984384*N^6 + (14847443876727060480*N^7 + 1765790123111331072*N^8)) + ((148498371482119680*N^9 + 8375628271152128*N^10) + (284206416721920*N^11 + 4382873334784*N^12)))) := by
  unfold onsetG3_3_0M96 onsetP3_0_0M96 onsetP3_1_0M96 onsetP3_2_0M96 onsetP3_3_0M96 onsetP4_0_0M96 onsetP4_1_0M96 onsetP4_2_0M96 onsetP4_3_0M96 onsetP5_0_0M96 onsetP5_1_0M96 onsetP5_2_0M96 onsetP5_3_0M96
  ring
 rw [he]
 positivity

def onsetG3_3_1M96 (N : ℤ) : ℤ := ((((onsetP4_0_0M96 N*onsetP4_3_1M96 N-onsetP3_0_0M96 N*onsetP5_3_1M96 N) + (onsetP4_0_1M96 N*onsetP4_3_0M96 N-onsetP3_0_1M96 N*onsetP5_3_0M96 N)) + ((onsetP4_1_0M96 N*onsetP4_2_1M96 N-onsetP3_1_0M96 N*onsetP5_2_1M96 N) + (onsetP4_1_1M96 N*onsetP4_2_0M96 N-onsetP3_1_1M96 N*onsetP5_2_0M96 N))) + (((onsetP4_2_0M96 N*onsetP4_1_1M96 N-onsetP3_2_0M96 N*onsetP5_1_1M96 N) + (onsetP4_2_1M96 N*onsetP4_1_0M96 N-onsetP3_2_1M96 N*onsetP5_1_0M96 N)) + ((onsetP4_3_0M96 N*onsetP4_0_1M96 N-onsetP3_3_0M96 N*onsetP5_0_1M96 N) + (onsetP4_3_1M96 N*onsetP4_0_0M96 N-onsetP3_3_1M96 N*onsetP5_0_0M96 N))))

theorem onsetG3_3_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_3_1M96 N := by
 have he : onsetG3_3_1M96 N=(((1811249557092406368000 + (4327305106016699654400*N + 4725695258397119317248*N^2)) + (3118166677587838512384*N^3 + (1383979165065952539392*N^4 + 435102504148040198400*N^5))) + ((99300201796254586624*N^6 + (16566436012048780032*N^7 + 2003806685038158336*N^8)) + ((171238970864908800*N^9 + 9804854150576128*N^10) + (337378763280384*N^11 + 5269131779072*N^12)))) := by
  unfold onsetG3_3_1M96 onsetP3_0_0M96 onsetP3_0_1M96 onsetP3_1_0M96 onsetP3_1_1M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP4_0_0M96 onsetP4_0_1M96 onsetP4_1_0M96 onsetP4_1_1M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP5_0_0M96 onsetP5_0_1M96 onsetP5_1_0M96 onsetP5_1_1M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_3_0M96 onsetP5_3_1M96
  ring
 rw [he]
 positivity

def onsetG3_3_2M96 (N : ℤ) : ℤ := ((((onsetP4_0_1M96 N*onsetP4_3_1M96 N-onsetP3_0_1M96 N*onsetP5_3_1M96 N) + (onsetP4_0_2M96 N*onsetP4_3_0M96 N-onsetP3_0_2M96 N*onsetP5_3_0M96 N)) + ((onsetP4_1_0M96 N*onsetP4_2_2M96 N-onsetP3_1_0M96 N*onsetP5_2_2M96 N) + ((onsetP4_1_1M96 N*onsetP4_2_1M96 N-onsetP3_1_1M96 N*onsetP5_2_1M96 N) + (onsetP4_1_2M96 N*onsetP4_2_0M96 N-onsetP3_1_2M96 N*onsetP5_2_0M96 N)))) + (((onsetP4_2_0M96 N*onsetP4_1_2M96 N-onsetP3_2_0M96 N*onsetP5_1_2M96 N) + (onsetP4_2_1M96 N*onsetP4_1_1M96 N-onsetP3_2_1M96 N*onsetP5_1_1M96 N)) + ((onsetP4_2_2M96 N*onsetP4_1_0M96 N-onsetP3_2_2M96 N*onsetP5_1_0M96 N) + ((onsetP4_3_0M96 N*onsetP4_0_2M96 N-onsetP3_3_0M96 N*onsetP5_0_2M96 N) + (onsetP4_3_1M96 N*onsetP4_0_1M96 N-onsetP3_3_1M96 N*onsetP5_0_1M96 N)))))

theorem onsetG3_3_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_3_2M96 N := by
 have he : onsetG3_3_2M96 N=(((696978322164655776000 + (1704533818346652222720*N + 1903894182658206418176*N^2)) + (1283858440962357447936*N^3 + (581897062310607258880*N^4 + 186666308707618656000*N^5))) + ((43434503003575539968*N^6 + (7381789495724222208*N^7 + 908757383707622400*N^8)) + ((78963695665505280*N^9 + 4592165532179456*N^10) + (160283927494656*N^11 + 2535420805120*N^12)))) := by
  unfold onsetG3_3_2M96 onsetP3_0_1M96 onsetP3_0_2M96 onsetP3_1_0M96 onsetP3_1_1M96 onsetP3_1_2M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP4_0_1M96 onsetP4_0_2M96 onsetP4_1_0M96 onsetP4_1_1M96 onsetP4_1_2M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP5_0_1M96 onsetP5_0_2M96 onsetP5_1_0M96 onsetP5_1_1M96 onsetP5_1_2M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96
  ring
 rw [he]
 positivity

def onsetG3_3_3M96 (N : ℤ) : ℤ := ((((onsetP4_0_2M96 N*onsetP4_3_1M96 N-onsetP3_0_2M96 N*onsetP5_3_1M96 N) + (onsetP4_0_3M96 N*onsetP4_3_0M96 N-onsetP3_0_3M96 N*onsetP5_3_0M96 N)) + ((onsetP4_1_1M96 N*onsetP4_2_2M96 N-onsetP3_1_1M96 N*onsetP5_2_2M96 N) + ((onsetP4_1_2M96 N*onsetP4_2_1M96 N-onsetP3_1_2M96 N*onsetP5_2_1M96 N) + (onsetP4_1_3M96 N*onsetP4_2_0M96 N-onsetP3_1_3M96 N*onsetP5_2_0M96 N)))) + (((onsetP4_2_0M96 N*onsetP4_1_3M96 N-onsetP3_2_0M96 N*onsetP5_1_3M96 N) + (onsetP4_2_1M96 N*onsetP4_1_2M96 N-onsetP3_2_1M96 N*onsetP5_1_2M96 N)) + ((onsetP4_2_2M96 N*onsetP4_1_1M96 N-onsetP3_2_2M96 N*onsetP5_1_1M96 N) + ((onsetP4_3_0M96 N*onsetP4_0_3M96 N-onsetP3_3_0M96 N*onsetP5_0_3M96 N) + (onsetP4_3_1M96 N*onsetP4_0_2M96 N-onsetP3_3_1M96 N*onsetP5_0_2M96 N)))))

theorem onsetG3_3_3M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_3_3M96 N := by
 have he : onsetG3_3_3M96 N=(((132532660099843315200 + (332365479836097093120*N + 380312183668734213120*N^2)) + (262478332460840455680*N^3 + (121647368074704908800*N^4 + 39866534035172328960*N^5))) + ((9468156651421959680*N^6 + (1640846401227855360*N^7 + 205773704584949760*N^8)) + ((18193694246353920*N^9 + 1075260261555200*N^10) + (38084496629760*N^11 + 610241443840*N^12)))) := by
  unfold onsetG3_3_3M96 onsetP3_0_2M96 onsetP3_0_3M96 onsetP3_1_1M96 onsetP3_1_2M96 onsetP3_1_3M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP4_0_2M96 onsetP4_0_3M96 onsetP4_1_1M96 onsetP4_1_2M96 onsetP4_1_3M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP5_0_2M96 onsetP5_0_3M96 onsetP5_1_1M96 onsetP5_1_2M96 onsetP5_1_3M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96
  ring
 rw [he]
 positivity

def onsetG3_3_4M96 (N : ℤ) : ℤ := ((((onsetP4_0_3M96 N*onsetP4_3_1M96 N-onsetP3_0_3M96 N*onsetP5_3_1M96 N) + (onsetP4_0_4M96 N*onsetP4_3_0M96 N-onsetP3_0_4M96 N*onsetP5_3_0M96 N)) + ((onsetP4_1_2M96 N*onsetP4_2_2M96 N-onsetP3_1_2M96 N*onsetP5_2_2M96 N) + (onsetP4_1_3M96 N*onsetP4_2_1M96 N-onsetP3_1_3M96 N*onsetP5_2_1M96 N))) + (((onsetP4_2_1M96 N*onsetP4_1_3M96 N-onsetP3_2_1M96 N*onsetP5_1_3M96 N) + (onsetP4_2_2M96 N*onsetP4_1_2M96 N-onsetP3_2_2M96 N*onsetP5_1_2M96 N)) + ((onsetP4_3_0M96 N*onsetP4_0_4M96 N-onsetP3_3_0M96 N*onsetP5_0_4M96 N) + (onsetP4_3_1M96 N*onsetP4_0_3M96 N-onsetP3_3_1M96 N*onsetP5_0_3M96 N))))

theorem onsetG3_3_4M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_3_4M96 N := by
 have he : onsetG3_3_4M96 N=(((12433026500400038400 + (32032667986186210560*N + 37614811920552276480*N^2)) + (26612466111868250880*N^3 + (12630261377192641280*N^4 + 4234373797940052480*N^5))) + ((1027706692326630400*N^6 + (181816164249269760*N^7 + 23249964549745920*N^8)) + ((2093517857410560*N^9 + 125825893150720*N^10) + (4524480092160*N^11 + 73448883200*N^12)))) := by
  unfold onsetG3_3_4M96 onsetP3_0_3M96 onsetP3_0_4M96 onsetP3_1_2M96 onsetP3_1_3M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP4_0_3M96 onsetP4_0_4M96 onsetP4_1_2M96 onsetP4_1_3M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP5_0_3M96 onsetP5_0_4M96 onsetP5_1_2M96 onsetP5_1_3M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96
  ring
 rw [he]
 positivity

def onsetG3_3_5M96 (N : ℤ) : ℤ := (((onsetP4_0_4M96 N*onsetP4_3_1M96 N-onsetP3_0_4M96 N*onsetP5_3_1M96 N) + (onsetP4_1_3M96 N*onsetP4_2_2M96 N-onsetP3_1_3M96 N*onsetP5_2_2M96 N)) + ((onsetP4_2_2M96 N*onsetP4_1_3M96 N-onsetP3_2_2M96 N*onsetP5_1_3M96 N) + (onsetP4_3_1M96 N*onsetP4_0_4M96 N-onsetP3_3_1M96 N*onsetP5_0_4M96 N)))

theorem onsetG3_3_5M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_3_5M96 N := by
 have he : onsetG3_3_5M96 N=(((459905228407296000 + (1219534351186636800*N + 1472108560294514688*N^2)) + (1069381695576337920*N^3 + (520510686801975296*N^4 + 178767886354444800*N^5))) + ((44398160671266304*N^6 + (8028229913303040*N^7 + 1047998154943488*N^8)) + ((96197274432000*N^9 + 5884432734208*N^10) + (214935920640*N^11 + 3535702016*N^12)))) := by
  unfold onsetG3_3_5M96 onsetP3_0_4M96 onsetP3_1_3M96 onsetP3_2_2M96 onsetP3_3_1M96 onsetP4_0_4M96 onsetP4_1_3M96 onsetP4_2_2M96 onsetP4_3_1M96 onsetP5_0_4M96 onsetP5_1_3M96 onsetP5_2_2M96 onsetP5_3_1M96
  ring
 rw [he]
 positivity

def onsetG3_4_0M96 (N : ℤ) : ℤ := (((onsetP4_0_0M96 N*onsetP4_4_0M96 N-onsetP3_0_0M96 N*onsetP5_4_0M96 N) + (onsetP4_1_0M96 N*onsetP4_3_0M96 N-onsetP3_1_0M96 N*onsetP5_3_0M96 N)) + ((onsetP4_2_0M96 N*onsetP4_2_0M96 N-onsetP3_2_0M96 N*onsetP5_2_0M96 N) + ((onsetP4_3_0M96 N*onsetP4_1_0M96 N-onsetP3_3_0M96 N*onsetP5_1_0M96 N) + (onsetP4_4_0M96 N*onsetP4_0_0M96 N-onsetP3_4_0M96 N*onsetP5_0_0M96 N))))

theorem onsetG3_4_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_4_0M96 N := by
 have he : onsetG3_4_0M96 N=(((610890445741295059200 + (1417829302964460395520*N + 1505065511965612681728*N^2)) + (965909878618374192384*N^3 + (417239405755000387328*N^4 + 127746315253606533120*N^5))) + ((28412431453185009664*N^6 + (4622903106194967552*N^7 + 545795431723202304*N^8)) + ((45569355558370560*N^9 + 2551982979524608*N^10) + (85995123185664*N^11 + 1317282944768*N^12)))) := by
  unfold onsetG3_4_0M96 onsetP3_0_0M96 onsetP3_1_0M96 onsetP3_2_0M96 onsetP3_3_0M96 onsetP3_4_0M96 onsetP4_0_0M96 onsetP4_1_0M96 onsetP4_2_0M96 onsetP4_3_0M96 onsetP4_4_0M96 onsetP5_0_0M96 onsetP5_1_0M96 onsetP5_2_0M96 onsetP5_3_0M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_4_1M96 (N : ℤ) : ℤ := ((((onsetP4_0_1M96 N*onsetP4_4_0M96 N-onsetP3_0_1M96 N*onsetP5_4_0M96 N) + (onsetP4_1_0M96 N*onsetP4_3_1M96 N-onsetP3_1_0M96 N*onsetP5_3_1M96 N)) + ((onsetP4_1_1M96 N*onsetP4_3_0M96 N-onsetP3_1_1M96 N*onsetP5_3_0M96 N) + (onsetP4_2_0M96 N*onsetP4_2_1M96 N-onsetP3_2_0M96 N*onsetP5_2_1M96 N))) + (((onsetP4_2_1M96 N*onsetP4_2_0M96 N-onsetP3_2_1M96 N*onsetP5_2_0M96 N) + (onsetP4_3_0M96 N*onsetP4_1_1M96 N-onsetP3_3_0M96 N*onsetP5_1_1M96 N)) + ((onsetP4_3_1M96 N*onsetP4_1_0M96 N-onsetP3_3_1M96 N*onsetP5_1_0M96 N) + (onsetP4_4_0M96 N*onsetP4_0_1M96 N-onsetP3_4_0M96 N*onsetP5_0_1M96 N))))

theorem onsetG3_4_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_4_1M96 N := by
 have he : onsetG3_4_1M96 N=(((473214824194438368000 + (1123479003597158638080*N + 1218970036831136486400*N^2)) + (798973229187950820864*N^3 + (352213632078834659840*N^4 + 109966808961482215680*N^5))) + ((24921511634170412800*N^6 + (4128377098650884352*N^7 + 495810530087577600*N^8)) + ((42069715952355840*N^9 + 2391827988928000*N^10) + (81727216349184*N^11 + 1267710402560*N^12)))) := by
  unfold onsetG3_4_1M96 onsetP3_0_1M96 onsetP3_1_0M96 onsetP3_1_1M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_0_1M96 onsetP4_1_0M96 onsetP4_1_1M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_0_1M96 onsetP5_1_0M96 onsetP5_1_1M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_4_2M96 (N : ℤ) : ℤ := ((((onsetP4_0_2M96 N*onsetP4_4_0M96 N-onsetP3_0_2M96 N*onsetP5_4_0M96 N) + (onsetP4_1_1M96 N*onsetP4_3_1M96 N-onsetP3_1_1M96 N*onsetP5_3_1M96 N)) + ((onsetP4_1_2M96 N*onsetP4_3_0M96 N-onsetP3_1_2M96 N*onsetP5_3_0M96 N) + (onsetP4_2_0M96 N*onsetP4_2_2M96 N-onsetP3_2_0M96 N*onsetP5_2_2M96 N))) + (((onsetP4_2_1M96 N*onsetP4_2_1M96 N-onsetP3_2_1M96 N*onsetP5_2_1M96 N) + (onsetP4_2_2M96 N*onsetP4_2_0M96 N-onsetP3_2_2M96 N*onsetP5_2_0M96 N)) + ((onsetP4_3_0M96 N*onsetP4_1_2M96 N-onsetP3_3_0M96 N*onsetP5_1_2M96 N) + ((onsetP4_3_1M96 N*onsetP4_1_1M96 N-onsetP3_3_1M96 N*onsetP5_1_1M96 N) + (onsetP4_4_0M96 N*onsetP4_0_2M96 N-onsetP3_4_0M96 N*onsetP5_0_2M96 N)))))

theorem onsetG3_4_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_4_2M96 N := by
 have he : onsetG3_4_2M96 N=(((135932777438729644800 + (330680168796651609600*N + 367286892076057605120*N^2)) + (246216622001715160320*N^3 + (110911344384700634880*N^4 + 35353364761741985280*N^5))) + ((8172456664118046720*N^6 + (1379629161262679040*N^7 + 168684058478960640*N^8)) + ((14555784382782720*N^9 + 840586551624960*N^10) + (29134736547840*N^11 + 457681082880*N^12)))) := by
  unfold onsetG3_4_2M96 onsetP3_0_2M96 onsetP3_1_1M96 onsetP3_1_2M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_0_2M96 onsetP4_1_1M96 onsetP4_1_2M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_0_2M96 onsetP5_1_1M96 onsetP5_1_2M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_4_3M96 (N : ℤ) : ℤ := ((((onsetP4_0_3M96 N*onsetP4_4_0M96 N-onsetP3_0_3M96 N*onsetP5_4_0M96 N) + (onsetP4_1_2M96 N*onsetP4_3_1M96 N-onsetP3_1_2M96 N*onsetP5_3_1M96 N)) + ((onsetP4_1_3M96 N*onsetP4_3_0M96 N-onsetP3_1_3M96 N*onsetP5_3_0M96 N) + (onsetP4_2_1M96 N*onsetP4_2_2M96 N-onsetP3_2_1M96 N*onsetP5_2_2M96 N))) + (((onsetP4_2_2M96 N*onsetP4_2_1M96 N-onsetP3_2_2M96 N*onsetP5_2_1M96 N) + (onsetP4_3_0M96 N*onsetP4_1_3M96 N-onsetP3_3_0M96 N*onsetP5_1_3M96 N)) + ((onsetP4_3_1M96 N*onsetP4_1_2M96 N-onsetP3_3_1M96 N*onsetP5_1_2M96 N) + (onsetP4_4_0M96 N*onsetP4_0_3M96 N-onsetP3_4_0M96 N*onsetP5_0_3M96 N))))

theorem onsetG3_4_3M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_4_3M96 N := by
 have he : onsetG3_4_3M96 N=(((17128885128047884800 + (42776530572618017280*N + 48721942911128739840*N^2)) + (33457989363312433920*N^3 + (15423198470450704640*N^4 + 5025784179657991680*N^5))) + ((1186468684515412480*N^6 + (204333097349767680*N^7 + 25458779460495360*N^8)) + ((2235921001789440*N^9 + 131239843194880*N^10) + (4616049715200*N^11 + 73448883200*N^12)))) := by
  unfold onsetG3_4_3M96 onsetP3_0_3M96 onsetP3_1_2M96 onsetP3_1_3M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_0_3M96 onsetP4_1_2M96 onsetP4_1_3M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_0_3M96 onsetP5_1_2M96 onsetP5_1_3M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_4_4M96 (N : ℤ) : ℤ := (((onsetP4_0_4M96 N*onsetP4_4_0M96 N-onsetP3_0_4M96 N*onsetP5_4_0M96 N) + (onsetP4_1_3M96 N*onsetP4_3_1M96 N-onsetP3_1_3M96 N*onsetP5_3_1M96 N)) + ((onsetP4_2_2M96 N*onsetP4_2_2M96 N-onsetP3_2_2M96 N*onsetP5_2_2M96 N) + ((onsetP4_3_1M96 N*onsetP4_1_3M96 N-onsetP3_3_1M96 N*onsetP5_1_3M96 N) + (onsetP4_4_0M96 N*onsetP4_0_4M96 N-onsetP3_4_0M96 N*onsetP5_0_4M96 N))))

theorem onsetG3_4_4M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_4_4M96 N := by
 have he : onsetG3_4_4M96 N=(((797697633595161600 + (2049077550349831680*N + 2397675826736709120*N^2)) + (1689514670787229440*N^3 + (798234131275678720*N^4 + 266292954095051520*N^5))) + ((64286140665474560*N^6 + (11308256713555200*N^7 + 1437306165576960*N^8)) + ((128596419302400*N^9 + 7677590789120*N^10) + (274174709760*N^11 + 4419627520*N^12)))) := by
  unfold onsetG3_4_4M96 onsetP3_0_4M96 onsetP3_1_3M96 onsetP3_2_2M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_0_4M96 onsetP4_1_3M96 onsetP4_2_2M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_0_4M96 onsetP5_1_3M96 onsetP5_2_2M96 onsetP5_3_1M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_5_0M96 (N : ℤ) : ℤ := (((onsetP4_1_0M96 N*onsetP4_4_0M96 N-onsetP3_1_0M96 N*onsetP5_4_0M96 N) + (onsetP4_2_0M96 N*onsetP4_3_0M96 N-onsetP3_2_0M96 N*onsetP5_3_0M96 N)) + ((onsetP4_3_0M96 N*onsetP4_2_0M96 N-onsetP3_3_0M96 N*onsetP5_2_0M96 N) + (onsetP4_4_0M96 N*onsetP4_1_0M96 N-onsetP3_4_0M96 N*onsetP5_1_0M96 N)))

theorem onsetG3_5_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_5_0M96 N := by
 have he : onsetG3_5_0M96 N=(((128335560966320601600 + (295678978860974365440*N + 311552171908127910144*N^2)) + (198457939605787830528*N^3 + (85086735518194262272*N^4 + 25856377946590141440*N^5))) + ((5707925245833746432*N^6 + (921835025296625664*N^7 + 108035438570658816*N^8)) + ((8954685567045120*N^9 + 497917308890624*N^10) + (16662493790208*N^11 + 253542080512*N^12)))) := by
  unfold onsetG3_5_0M96 onsetP3_1_0M96 onsetP3_2_0M96 onsetP3_3_0M96 onsetP3_4_0M96 onsetP4_1_0M96 onsetP4_2_0M96 onsetP4_3_0M96 onsetP4_4_0M96 onsetP5_1_0M96 onsetP5_2_0M96 onsetP5_3_0M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_5_1M96 (N : ℤ) : ℤ := (((onsetP4_1_1M96 N*onsetP4_4_0M96 N-onsetP3_1_1M96 N*onsetP5_4_0M96 N) + ((onsetP4_2_0M96 N*onsetP4_3_1M96 N-onsetP3_2_0M96 N*onsetP5_3_1M96 N) + (onsetP4_2_1M96 N*onsetP4_3_0M96 N-onsetP3_2_1M96 N*onsetP5_3_0M96 N))) + ((onsetP4_3_0M96 N*onsetP4_2_1M96 N-onsetP3_3_0M96 N*onsetP5_2_1M96 N) + ((onsetP4_3_1M96 N*onsetP4_2_0M96 N-onsetP3_3_1M96 N*onsetP5_2_0M96 N) + (onsetP4_4_0M96 N*onsetP4_1_1M96 N-onsetP3_4_0M96 N*onsetP5_1_1M96 N))))

theorem onsetG3_5_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_5_1M96 N := by
 have he : onsetG3_5_1M96 N=(((74257400103463987200 + (175169320506840925440*N + 188804607945708045312*N^2)) + (122915800744299757824*N^3 + (53812170406706433792*N^4 + 16683615637907339520*N^5))) + ((3754258957628664576*N^6 + (617489136558104832*N^7 + 73630431501613056*N^8)) + ((6203107697687040*N^9 + 350181715763712*N^10) + (11882440249344*N^11 + 183072433152*N^12)))) := by
  unfold onsetG3_5_1M96 onsetP3_1_1M96 onsetP3_2_0M96 onsetP3_2_1M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_1_1M96 onsetP4_2_0M96 onsetP4_2_1M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_1_1M96 onsetP5_2_0M96 onsetP5_2_1M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_5_2M96 (N : ℤ) : ℤ := (((onsetP4_1_2M96 N*onsetP4_4_0M96 N-onsetP3_1_2M96 N*onsetP5_4_0M96 N) + ((onsetP4_2_1M96 N*onsetP4_3_1M96 N-onsetP3_2_1M96 N*onsetP5_3_1M96 N) + (onsetP4_2_2M96 N*onsetP4_3_0M96 N-onsetP3_2_2M96 N*onsetP5_3_0M96 N))) + ((onsetP4_3_0M96 N*onsetP4_2_2M96 N-onsetP3_3_0M96 N*onsetP5_2_2M96 N) + ((onsetP4_3_1M96 N*onsetP4_2_1M96 N-onsetP3_3_1M96 N*onsetP5_2_1M96 N) + (onsetP4_4_0M96 N*onsetP4_1_2M96 N-onsetP3_4_0M96 N*onsetP5_1_2M96 N))))

theorem onsetG3_5_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_5_2M96 N := by
 have he : onsetG3_5_2M96 N=(((14143617801072345600 + (34222938918606144000*N + 37796273201224161792*N^2)) + (25186829821131170304*N^3 + (11275573503796815360*N^4 + 3571152844057585920*N^5))) + ((820100899014302976*N^6 + (137514657619729152*N^7 + 16698644050072320*N^8)) + ((1430960232199680*N^9 + 82062238175232*N^10) + (2824571602944*N^11 + 44069329920*N^12)))) := by
  unfold onsetG3_5_2M96 onsetP3_1_2M96 onsetP3_2_1M96 onsetP3_2_2M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_1_2M96 onsetP4_2_1M96 onsetP4_2_2M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_1_2M96 onsetP5_2_1M96 onsetP5_2_2M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_5_3M96 (N : ℤ) : ℤ := (((onsetP4_1_3M96 N*onsetP4_4_0M96 N-onsetP3_1_3M96 N*onsetP5_4_0M96 N) + (onsetP4_2_2M96 N*onsetP4_3_1M96 N-onsetP3_2_2M96 N*onsetP5_3_1M96 N)) + ((onsetP4_3_1M96 N*onsetP4_2_2M96 N-onsetP3_3_1M96 N*onsetP5_2_2M96 N) + (onsetP4_4_0M96 N*onsetP4_1_3M96 N-onsetP3_4_0M96 N*onsetP5_1_3M96 N)))

theorem onsetG3_5_3M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_5_3M96 N := by
 have he : onsetG3_5_3M96 N=(((885124955680358400 + (2201248153674823680*N + 2495650776103102464*N^2)) + (1705219480680016896*N^3 + (781841928809371136*N^4 + 253321103221562880*N^5))) + ((59445712018212352*N^6 + (10173893107004928*N^7 + 1259422940149248*N^8)) + ((109873524579840*N^9 + 6405333673984*N^10) + (223743614976*N^11 + 3535702016*N^12)))) := by
  unfold onsetG3_5_3M96 onsetP3_1_3M96 onsetP3_2_2M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_1_3M96 onsetP4_2_2M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_1_3M96 onsetP5_2_2M96 onsetP5_3_1M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity
end
end MathGKM.Markov
