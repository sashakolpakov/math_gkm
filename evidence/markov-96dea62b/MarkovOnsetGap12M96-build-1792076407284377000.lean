import MarkovOnsetPartsM96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def onsetG1_6_0M96 (N : ℤ) : ℤ := ((onsetP2_2_0M96 N*onsetP2_4_0M96 N-onsetP1_2_0M96 N*onsetP3_4_0M96 N) + ((onsetP2_3_0M96 N*onsetP2_3_0M96 N-onsetP1_3_0M96 N*onsetP3_3_0M96 N) + (onsetP2_4_0M96 N*onsetP2_2_0M96 N-onsetP1_4_0M96 N*onsetP3_2_0M96 N)))

theorem onsetG1_6_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_6_0M96 N := by
 have he : onsetG1_6_0M96 N=(((10333507213994227200 + (24516220257564456960*N + 26698060205390488320*N^2)) + (17600354434079719680*N^3 + (7809000247764541952*N^4 + 2453843164209185280*N^5))) + ((559607923439353600*N^6 + (93294182813207040*N^7 + 11283762255661056*N^8)) + ((965701038946560*N^9 + 55525345818880*N^10) + (1926438420480*N^11 + 30512072192*N^12)))) := by
  unfold onsetG1_6_0M96 onsetP1_2_0M96 onsetP1_3_0M96 onsetP1_4_0M96 onsetP2_2_0M96 onsetP2_3_0M96 onsetP2_4_0M96 onsetP3_2_0M96 onsetP3_3_0M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_6_1M96 (N : ℤ) : ℤ := (((onsetP2_2_1M96 N*onsetP2_4_0M96 N-onsetP1_2_1M96 N*onsetP3_4_0M96 N) + (onsetP2_3_0M96 N*onsetP2_3_1M96 N-onsetP1_3_0M96 N*onsetP3_3_1M96 N)) + ((onsetP2_3_1M96 N*onsetP2_3_0M96 N-onsetP1_3_1M96 N*onsetP3_3_0M96 N) + (onsetP2_4_0M96 N*onsetP2_2_1M96 N-onsetP1_4_0M96 N*onsetP3_2_1M96 N)))

theorem onsetG1_6_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_6_1M96 N := by
 have he : onsetG1_6_1M96 N=(((3927376652929228800 + (9475921367499525120*N + 10497677348384319744*N^2)) + (7044910946215849728*N^3 + (3184444970352190720*N^4 + 1020224063178942720*N^5))) + ((237366479054173952*N^6 + (40391715846230784*N^7 + 4988276058474240*N^8)) + ((436019156213760*N^9 + 25609024200704*N^10) + (907716569088*N^11 + 14689776640*N^12)))) := by
  unfold onsetG1_6_1M96 onsetP1_2_1M96 onsetP1_3_0M96 onsetP1_3_1M96 onsetP1_4_0M96 onsetP2_2_1M96 onsetP2_3_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_2_1M96 onsetP3_3_0M96 onsetP3_3_1M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_6_2M96 (N : ℤ) : ℤ := ((onsetP2_2_2M96 N*onsetP2_4_0M96 N-onsetP1_2_2M96 N*onsetP3_4_0M96 N) + ((onsetP2_3_1M96 N*onsetP2_3_1M96 N-onsetP1_3_1M96 N*onsetP3_3_1M96 N) + (onsetP2_4_0M96 N*onsetP2_2_2M96 N-onsetP1_4_0M96 N*onsetP3_2_2M96 N)))

theorem onsetG1_6_2M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_6_2M96 N := by
 have he : onsetG1_6_2M96 N=(((371695234966272000 + (912604765418680320*N + 1029012706468373760*N^2)) + (703248019690024704*N^3 + (323945189787751168*N^4 + 105837194329117440*N^5))) + ((25126622136304640*N^6 + (4365129034812672*N^7 + 550568794401024*N^8)) + ((49163545213440*N^9 + 2950482483200*N^10) + (106876084224*N^11 + 1767851008*N^12)))) := by
  unfold onsetG1_6_2M96 onsetP1_2_2M96 onsetP1_3_1M96 onsetP1_4_0M96 onsetP2_2_2M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_2_2M96 onsetP3_3_1M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_7_0M96 (N : ℤ) : ℤ := ((onsetP2_3_0M96 N*onsetP2_4_0M96 N-onsetP1_3_0M96 N*onsetP3_4_0M96 N) + (onsetP2_4_0M96 N*onsetP2_3_0M96 N-onsetP1_4_0M96 N*onsetP3_3_0M96 N))

theorem onsetG1_7_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_7_0M96 N := by
 have he : onsetG1_7_0M96 N=(((725707940552985600 + (1712869049205457920*N + 1856573683100236800*N^2)) + (1218992966080124928*N^3 + (539058743840780800*N^4 + 168950831812385280*N^5))) + ((38456199306667520*N^6 + (6402972781868544*N^7 + 773895221998080*N^8)) + ((66223901452800*N^9 + 3809286010880*N^10) + (132290070528*N^11 + 2098539520*N^12)))) := by
  unfold onsetG1_7_0M96 onsetP1_3_0M96 onsetP1_4_0M96 onsetP2_3_0M96 onsetP2_4_0M96 onsetP3_3_0M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_7_1M96 (N : ℤ) : ℤ := ((onsetP2_3_1M96 N*onsetP2_4_0M96 N-onsetP1_3_1M96 N*onsetP3_4_0M96 N) + (onsetP2_4_0M96 N*onsetP2_3_1M96 N-onsetP1_4_0M96 N*onsetP3_3_1M96 N))

theorem onsetG1_7_1M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_7_1M96 N := by
 have he : onsetG1_7_1M96 N=(((137694956681318400 + (330664110578242560*N + 364739154436694016*N^2)) + (243857115464997888*N^3 + (109886218927912448*N^4 + 35118687672768000*N^5))) + ((8155850196003328*N^6 + (1386140940301824*N^7 + 171069671345664*N^8)) + ((14950853245440*N^9 + 878450169856*N^10) + (31165145088*N^11 + 505100288*N^12)))) := by
  unfold onsetG1_7_1M96 onsetP1_3_1M96 onsetP1_4_0M96 onsetP2_3_1M96 onsetP2_4_0M96 onsetP3_3_1M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity

def onsetG1_8_0M96 (N : ℤ) : ℤ := (onsetP2_4_0M96 N*onsetP2_4_0M96 N-onsetP1_4_0M96 N*onsetP3_4_0M96 N)

theorem onsetG1_8_0M96_nonneg (N : ℤ) (hN : 0≤N) :
 0≤onsetG1_8_0M96 N := by
 have he : onsetG1_8_0M96 N=(((22318226809401600 + (52399771216611840*N + 56524732911085824*N^2)) + (36960428251805184*N^3 + (16289053871942656*N^4 + 5091624723091200*N^5))) + ((1156631099789312*N^6 + (192317178154752*N^7 + 23226441681408*N^8)) + ((1987108220160*N^9 + 114338545664*N^10) + (3974283264*N^11 + 63137536*N^12)))) := by
  unfold onsetG1_8_0M96 onsetP1_4_0M96 onsetP2_4_0M96 onsetP3_4_0M96
  ring
 rw [he]
 positivity
end
end MathGKM.Markov
