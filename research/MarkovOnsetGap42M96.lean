import MarkovOnsetPartsM96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetG4_6_0M96 (N : ℤ) : ℤ := ((onsetP5_2_0M96 N*onsetP5_4_0M96 N-onsetP4_2_0M96 N*onsetP6_4_0M96 N) + ((onsetP5_3_0M96 N*onsetP5_3_0M96 N-onsetP4_3_0M96 N*onsetP6_3_0M96 N) + (onsetP5_4_0M96 N*onsetP5_2_0M96 N-onsetP4_4_0M96 N*onsetP6_2_0M96 N)))

theorem onsetG4_6_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_6_0M96 N := by
 have he : onsetG4_6_0M96 N=(((15297617085161644800 + (35936732741693736960*N + 38508603749017291008*N^2)) + (24879921210121033728*N^3 + (10789704458060579072*N^4 + 3307077303400012800*N^5))) + ((734105819266215424*N^6 + (118815228718631424*N^7 + 13900887328935936*N^8)) + ((1144930796835840*N^9 + 62900768455168*N^10) + (2064527259648*N^11 + 30512072192*N^12)))) := by
  unfold onsetG4_6_0M96 onsetP4_2_0M96 onsetP4_3_0M96 onsetP4_4_0M96 onsetP5_2_0M96 onsetP5_3_0M96 onsetP5_4_0M96 onsetP6_2_0M96 onsetP6_3_0M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_6_1M96 (N : ℤ) : ℤ := (((onsetP5_2_1M96 N*onsetP5_4_0M96 N-onsetP4_2_1M96 N*onsetP6_4_0M96 N) + (onsetP5_3_0M96 N*onsetP5_3_1M96 N-onsetP4_3_0M96 N*onsetP6_3_1M96 N)) + ((onsetP5_3_1M96 N*onsetP5_3_0M96 N-onsetP4_3_1M96 N*onsetP6_3_0M96 N) + (onsetP5_4_0M96 N*onsetP5_2_1M96 N-onsetP4_4_0M96 N*onsetP6_2_1M96 N)))

theorem onsetG4_6_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_6_1M96 N := by
 have he : onsetG4_6_1M96 N=(((5860376672206694400 + (14164067282973431040*N + 15588289548999336960*N^2)) + (10326208061337772800*N^3 + (4583908861238103040*N^4 + 1435854323815941120*N^5))) + ((325223739913640960*N^6 + (53625252595944960*N^7 + 6381271412920320*N^8)) + ((533648025738240*N^9 + 29709591457280*N^10) + (985898403840*N^11 + 14689776640*N^12)))) := by
  unfold onsetG4_6_1M96 onsetP4_2_1M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_2_1M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96 onsetP6_2_1M96 onsetP6_3_0M96 onsetP6_3_1M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_6_2M96 (N : ℤ) : ℤ := ((onsetP5_2_2M96 N*onsetP5_4_0M96 N-onsetP4_2_2M96 N*onsetP6_4_0M96 N) + ((onsetP5_3_1M96 N*onsetP5_3_1M96 N-onsetP4_3_1M96 N*onsetP6_3_1M96 N) + (onsetP5_4_0M96 N*onsetP5_2_2M96 N-onsetP4_4_0M96 N*onsetP6_2_2M96 N)))

theorem onsetG4_6_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_6_2M96 N := by
 have he : onsetG4_6_2M96 N=(((549229391399808000 + (1370053290199749120*N + 1553193525141683712*N^2)) + (1057778674656135936*N^3 + (481820682875623168*N^4 + 154578867993392640*N^5))) + ((35795299207141376*N^6 + (6023280360480768*N^7 + 730103068391424*N^8)) + ((62069973853440*N^9 + 3505134547712*N^10) + (117672554496*N^11 + 1767851008*N^12)))) := by
  unfold onsetG4_6_2M96 onsetP4_2_2M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_2_2M96 onsetP5_3_1M96 onsetP5_4_0M96 onsetP6_2_2M96 onsetP6_3_1M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_7_0M96 (N : ℤ) : ℤ := ((onsetP5_3_0M96 N*onsetP5_4_0M96 N-onsetP4_3_0M96 N*onsetP6_4_0M96 N) + (onsetP5_4_0M96 N*onsetP5_3_0M96 N-onsetP4_4_0M96 N*onsetP6_3_0M96 N))

theorem onsetG4_7_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_7_0M96 N := by
 have he : onsetG4_7_0M96 N=(((1192630051263974400 + (2775370501091784960*N + 2944953181704231936*N^2)) + (1883538398254512384*N^3 + (808409649550289920*N^4 + 245175050207270400*N^5))) + ((53843596162754048*N^6 + (8620729668375552*N^7 + 997666436578560*N^8)) + ((81281787632640*N^9 + 4417488809216*N^10) + (143458904064*N^11 + 2098539520*N^12)))) := by
  unfold onsetG4_7_0M96 onsetP4_3_0M96 onsetP4_4_0M96 onsetP5_3_0M96 onsetP5_4_0M96 onsetP6_3_0M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_7_1M96 (N : ℤ) : ℤ := ((onsetP5_3_1M96 N*onsetP5_4_0M96 N-onsetP4_3_1M96 N*onsetP6_4_0M96 N) + (onsetP5_4_0M96 N*onsetP5_3_1M96 N-onsetP4_4_0M96 N*onsetP6_3_1M96 N))

theorem onsetG4_7_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_7_1M96 N := by
 have he : onsetG4_7_1M96 N=(((226509641916364800 + (543153325859020800*N + 592734261004704000*N^2)) + (389151201559626240*N^3 + (171139271340278528*N^4 + 53089433665927680*N^5))) + ((11905186332229120*N^6 + (1943008751738880*N^7 + 228814303920384*N^8)) + ((18934263505920*N^9 + 1043015169280*N^10) + (34249850880*N^11 + 505100288*N^12)))) := by
  unfold onsetG4_7_1M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_3_1M96 onsetP5_4_0M96 onsetP6_3_1M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity

def onsetG4_8_0M96 (N : ℤ) : ℤ := (onsetP5_4_0M96 N*onsetP5_4_0M96 N-onsetP4_4_0M96 N*onsetP6_4_0M96 N)

theorem onsetG4_8_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG4_8_0M96 N := by
 have he : onsetG4_8_0M96 N=(((40725054134553600 + (93851464112743680*N + 98585311067099136*N^2)) + (62402582621584128*N^3 + (26500870685126656*N^4 + 7951224998653440*N^5))) + ((1727308880315648*N^6 + (273544491273984*N^7 + 31311974174208*N^8)) + ((2523372391680*N^9 + 135670793216*N^10) + (4359871488*N^11 + 63137536*N^12)))) := by
  unfold onsetG4_8_0M96 onsetP4_4_0M96 onsetP5_4_0M96 onsetP6_4_0M96
  ring
 rw [he]
 positivity
end
end MathGKM.Markov
