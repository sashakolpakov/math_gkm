import MarkovOnsetPartsM96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetG3_6_0M96 (N : ℤ) : ℤ := ((onsetP4_2_0M96 N*onsetP4_4_0M96 N-onsetP3_2_0M96 N*onsetP5_4_0M96 N) + ((onsetP4_3_0M96 N*onsetP4_3_0M96 N-onsetP3_3_0M96 N*onsetP5_3_0M96 N) + (onsetP4_4_0M96 N*onsetP4_2_0M96 N-onsetP3_4_0M96 N*onsetP5_2_0M96 N)))

theorem onsetG3_6_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_6_0M96 N := by
 have he : onsetG3_6_0M96 N=(((16877850221162649600 + (38592933297436062720*N + 40355970149206301184*N^2)) + (25510568004642615552*N^3 + (10853864760280838912*N^4 + 3273164850866803200*N^5))) + ((717089208769652992*N^6 + (114939894509830656*N^7 + 13370476278544896*N^8)) + ((1100144094094080*N^9 + 60736560634624*N^10) + (2018497646592*N^11 + 30512072192*N^12)))) := by
  unfold onsetG3_6_0M96 onsetP3_2_0M96 onsetP3_3_0M96 onsetP3_4_0M96 onsetP4_2_0M96 onsetP4_3_0M96 onsetP4_4_0M96 onsetP5_2_0M96 onsetP5_3_0M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_6_1M96 (N : ℤ) : ℤ := (((onsetP4_2_1M96 N*onsetP4_4_0M96 N-onsetP3_2_1M96 N*onsetP5_4_0M96 N) + (onsetP4_3_0M96 N*onsetP4_3_1M96 N-onsetP3_3_0M96 N*onsetP5_3_1M96 N)) + ((onsetP4_3_1M96 N*onsetP4_3_0M96 N-onsetP3_3_1M96 N*onsetP5_3_0M96 N) + (onsetP4_4_0M96 N*onsetP4_2_1M96 N-onsetP3_4_0M96 N*onsetP5_2_1M96 N)))

theorem onsetG3_6_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_6_1M96 N := by
 have he : onsetG3_6_1M96 N=(((6479612838406310400 + (15184986295020837120*N + 16256731480453836288*N^2)) + (10510563613054826496*N^3 + (4569244991612224000*N^4 + 1406569387707590400*N^5))) + ((314250780115000064*N^6 + (51315609686600448*N^7 + 6075001140956160*N^8)) + ((508141378913280*N^9 + 28483510888448*N^10) + (959837792256*N^11 + 14689776640*N^12)))) := by
  unfold onsetG3_6_1M96 onsetP3_2_1M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_2_1M96 onsetP4_3_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_2_1M96 onsetP5_3_0M96 onsetP5_3_1M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_6_2M96 (N : ℤ) : ℤ := ((onsetP4_2_2M96 N*onsetP4_4_0M96 N-onsetP3_2_2M96 N*onsetP5_4_0M96 N) + ((onsetP4_3_1M96 N*onsetP4_3_1M96 N-onsetP3_3_1M96 N*onsetP5_3_1M96 N) + (onsetP4_4_0M96 N*onsetP4_2_2M96 N-onsetP3_4_0M96 N*onsetP5_2_2M96 N)))

theorem onsetG3_6_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_6_2M96 N := by
 have he : onsetG3_6_2M96 N=(((613282712278118400 + (1475902192304655360*N + 1620652602380749056*N^2)) + (1073480067022847232*N^3 + (477567351940096768*N^4 + 150276729096910080*N^5))) + ((34281863907780608*N^6 + (5709536784919296*N^7 + 688563260577024*N^8)) + ((58596875957760*N^9 + 3337107931136*N^10) + (114073731072*N^11 + 1767851008*N^12)))) := by
  unfold onsetG3_6_2M96 onsetP3_2_2M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_2_2M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_2_2M96 onsetP5_3_1M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_7_0M96 (N : ℤ) : ℤ := ((onsetP4_3_0M96 N*onsetP4_4_0M96 N-onsetP3_3_0M96 N*onsetP5_4_0M96 N) + (onsetP4_4_0M96 N*onsetP4_3_0M96 N-onsetP3_4_0M96 N*onsetP5_3_0M96 N))

theorem onsetG3_7_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_7_0M96 N := by
 have he : onsetG3_7_0M96 N=(((1270341064842393600 + (2882185890567863040*N + 2990280647173607424*N^2)) + (1875455448425325312*N^3 + (791695449525379840*N^4 + 236888910092943360*N^5))) + ((51496813459169792*N^6 + (8191198531547136*N^7 + 945683800938240*N^8)) + ((77239754457600*N^9 + 4233751875584*N^10) + (139735959552*N^11 + 2098539520*N^12)))) := by
  unfold onsetG3_7_0M96 onsetP3_3_0M96 onsetP3_4_0M96 onsetP4_3_0M96 onsetP4_4_0M96 onsetP5_3_0M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_7_1M96 (N : ℤ) : ℤ := ((onsetP4_3_1M96 N*onsetP4_4_0M96 N-onsetP3_3_1M96 N*onsetP5_4_0M96 N) + (onsetP4_4_0M96 N*onsetP4_3_1M96 N-onsetP3_4_0M96 N*onsetP5_3_1M96 N))

theorem onsetG3_7_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_7_1M96 N := by
 have he : onsetG3_7_1M96 N=(((242513883011635200 + (564513909754314240*N + 600186019386078720*N^2)) + (385308322176938496*N^3 + (166306740338536448*N^4 + 50825014462656000*N^5))) + ((11272637470528000*N^6 + (1827374401778688*N^7 + 214765664139264*N^8)) + ((17835018216960*N^9 + 992674170880*N^10) + (33221615616*N^11 + 505100288*N^12)))) := by
  unfold onsetG3_7_1M96 onsetP3_3_1M96 onsetP3_4_0M96 onsetP4_3_1M96 onsetP4_4_0M96 onsetP5_3_1M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity

def onsetG3_8_0M96 (N : ℤ) : ℤ := (onsetP4_4_0M96 N*onsetP4_4_0M96 N-onsetP3_4_0M96 N*onsetP5_4_0M96 N)

theorem onsetG3_8_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG3_8_0M96 N := by
 have he : onsetG3_8_0M96 N=(((41892793247289600 + (94283243784898560*N + 97029436431126528*N^2)) + (60363925592597760*N^3 + (25276759978575616*N^4 + 7502851460643840*N^5))) + ((1618149424177664*N^6 + (255384201461760*N^7 + 29259570133248*N^8)) + ((2372052883200*N^9 + 129086494208*N^10) + (4231342080*N^11 + 63137536*N^12)))) := by
  unfold onsetG3_8_0M96 onsetP3_4_0M96 onsetP4_4_0M96 onsetP5_4_0M96
  ring
 rw [he]
 positivity
end
end MathGKM.Markov
