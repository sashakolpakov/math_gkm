import MarkovOnsetPartsM96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetG2_6_0M96 (N : ℤ) : ℤ := ((onsetP3_2_0M96 N*onsetP3_4_0M96 N-onsetP2_2_0M96 N*onsetP4_4_0M96 N) + ((onsetP3_3_0M96 N*onsetP3_3_0M96 N-onsetP2_3_0M96 N*onsetP4_3_0M96 N) + (onsetP3_4_0M96 N*onsetP3_2_0M96 N-onsetP2_4_0M96 N*onsetP4_2_0M96 N)))

theorem onsetG2_6_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_6_0M96 N := by
 have he : onsetG2_6_0M96 N=(((14879849984649216000 + (34085165485114275840*N + 35769152323471811328*N^2)) + (22724983882030784256*N^3 + (9729793691511310592*N^4 + 2956206045267041280*N^5))) + ((653289155637766144*N^6 + (105765000636331008*N^7 + 12446242674249216*N^8)) + ((1038020220276480*N^9 + 58229041577728*N^10) + (1972468033536*N^11 + 30512072192*N^12)))) := by
  unfold onsetG2_6_0M96 onsetP2_2_0M96 onsetP2_3_0M96 onsetP2_4_0M96 onsetP3_2_0M96 onsetP3_3_0M96 onsetP3_4_0M96 onsetP4_2_0M96 onsetP4_3_0M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_6_1M96 (N : ℤ) : ℤ := (((onsetP3_2_1M96 N*onsetP3_4_0M96 N-onsetP2_2_1M96 N*onsetP4_4_0M96 N) + (onsetP3_3_0M96 N*onsetP3_3_1M96 N-onsetP2_3_0M96 N*onsetP4_3_1M96 N)) + ((onsetP3_3_1M96 N*onsetP3_3_0M96 N-onsetP2_3_1M96 N*onsetP4_3_0M96 N) + (onsetP3_4_0M96 N*onsetP3_2_1M96 N-onsetP2_4_0M96 N*onsetP4_2_1M96 N)))

theorem onsetG2_6_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_6_1M96 N := by
 have he : onsetG2_6_1M96 N=(((5697660730254796800 + (13325772534642005760*N + 14273211314122338816*N^2)) + (9253176211722143232*N^3 + (4041712650815553280*N^4 + 1252473545043033600*N^5))) + ((282224661927638528*N^6 + (46574656970397696*N^7 + 5584729033524480*N^8)) + ((474393992970240*N^9 + 27091589805056*N^10) + (933777180672*N^11 + 14689776640*N^12)))) := by
  unfold onsetG2_6_1M96 onsetP2_2_1M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_2_1M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_2_1M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_6_2M96 (N : ℤ) : ℤ := ((onsetP3_2_2M96 N*onsetP3_4_0M96 N-onsetP2_2_2M96 N*onsetP4_4_0M96 N) + ((onsetP3_3_1M96 N*onsetP3_3_1M96 N-onsetP2_3_1M96 N*onsetP4_3_1M96 N) + (onsetP3_4_0M96 N*onsetP3_2_2M96 N-onsetP2_4_0M96 N*onsetP4_2_2M96 N)))

theorem onsetG2_6_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_6_2M96 N := by
 have he : onsetG2_6_2M96 N=(((541075295721139200 + (1293573290554782720*N + 1415663715633172992*N^2)) + (937357130966957568*N^3 + (418032761432516608*N^4 + 132221889694272000*N^5))) + ((30399837440408576*N^6 + (5116840891190784*N^7 + 625520330985984*N^8)) + ((54144064558080*N^9 + 3149048709632*N^10) + (110474907648*N^11 + 1767851008*N^12)))) := by
  unfold onsetG2_6_2M96 onsetP2_2_2M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_2_2M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_2_2M96 onsetP4_3_1M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_7_0M96 (N : ℤ) : ℤ := ((onsetP3_3_0M96 N*onsetP3_4_0M96 N-onsetP2_3_0M96 N*onsetP4_4_0M96 N) + (onsetP3_4_0M96 N*onsetP3_3_0M96 N-onsetP2_4_0M96 N*onsetP4_3_0M96 N))

theorem onsetG2_7_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_7_0M96 N := by
 have he : onsetG2_7_0M96 N=(((1080986994035020800 + (2460531262216849920*N + 2566461281857546752*N^2)) + (1621164730622545920*N^3 + (690346145221895680*N^4 + 208680965390956800*N^5))) + ((45896986165458176*N^6 + (7397703587312640*N^7 + 866993560742400*N^8)) + ((72036966382080*N^9 + 4027325507072*N^10) + (136013015040*N^11 + 2098539520*N^12)))) := by
  unfold onsetG2_7_0M96 onsetP2_3_0M96 onsetP2_4_0M96 onsetP3_3_0M96 onsetP3_4_0M96 onsetP4_3_0M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_7_1M96 (N : ℤ) : ℤ := ((onsetP3_3_1M96 N*onsetP3_4_0M96 N-onsetP2_3_1M96 N*onsetP4_4_0M96 N) + (onsetP3_4_0M96 N*onsetP3_3_1M96 N-onsetP2_4_0M96 N*onsetP4_3_1M96 N))

theorem onsetG2_7_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_7_1M96 N := by
 have he : onsetG2_7_1M96 N=(((206316294483801600 + (479822583413134080*N + 511133001022490112*N^2)) + (329622591688384512*N^3 + (143254109239205888*N^4 + 44180893486867200*N^5))) + ((9910557737871616*N^6 + (1628567252315136*N^7 + 194504547949824*N^8)) + ((16461223134720*N^9 + 936881731072*N^10) + (32193380352*N^11 + 505100288*N^12)))) := by
  unfold onsetG2_7_1M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_3_1M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity

def onsetG2_8_0M96 (N : ℤ) : ℤ := (onsetP3_4_0M96 N*onsetP3_4_0M96 N-onsetP2_4_0M96 N*onsetP4_4_0M96 N)

theorem onsetG2_8_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG2_8_0M96 N := by
 have he : onsetG2_8_0M96 N=(((34406085947385600 + (77802118872791040*N + 80643929625068544*N^2)) + (50638315054424832*N^3 + (21442849742868736*N^4 + 6447830461685760*N^5))) + ((1411181004165632*N^6 + (226420747370496*N^7 + 26424709801728*N^8)) + ((2187171705600*N^9 + 121854785024*N^10) + (4102812672*N^11 + 63137536*N^12)))) := by
  unfold onsetG2_8_0M96 onsetP2_4_0M96 onsetP3_4_0M96 onsetP4_4_0M96
  ring
 rw [he]
 positivity
end
end MathGKM.Markov
