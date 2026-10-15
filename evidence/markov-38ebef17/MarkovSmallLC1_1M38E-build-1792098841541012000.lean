import MarkovSmallQuot1_1M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallGap1_1_0M38E (c r : ℤ) : ℤ := ((((((((1119214746*c + (7000140852*r + 13481595288))*c + ((19154905110*r + 73774285326)*r + 70960049352))*c + (((29951384904*r + 173018569482)*r + 332804813562)*r + 213166548828))*c + ((((29270859030*r + 225428392980)*r + 650360209752)*r + 833046666426)*r + 399741460398))*c + (((((18307774548*r + 176228600940)*r + 677823959484)*r + 1302203418858)*r + 1249605509850)*r + 479180371212))*c + ((((((7156771146*r + 82660111254)*r + 397376524608)*r + 1017788475438)*r + 1464861717426)*r + 1123325526240)*r + 358577847216))*c + (((((((1598681840*r + 21539894418)*r + 124247021402)*r + 397745601330)*r + 763196682710)*r + 877787228796)*r + 560336592672)*r + 153150823872))*c + ((((((((156237872*r + 2405552296)*r + 16186696848)*r + 62174506912)*r + 149109812208)*r + 228638777752)*r + 218903389168)*r + 119647605120)*r + 28584301824))

theorem small_gap1_1_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 0*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 2≤(smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 1)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 1)^2-smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 0*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 2=smallGap1_1_0M38E c r := by
  unfold smallValue1_1M38E smallGap1_1_0M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_1_0M38E
 positivity

def smallGap1_1_1M38E (c r : ℤ) : ℤ := ((((((((6779061396*c + (42831782640*r + 82754575344))*c + ((118396079352*r + 457216616952)*r + 441016580664))*c + (((187010626608*r + 1082597490072)*r + 2087208070632)*r + 1340127235728))*c + ((((184616471700*r + 1424068590024)*r + 4115799215676)*r + 5282132080392)*r + 2539766614356))*c + (((((116640433728*r + 1123924237272)*r + 4328425613904)*r + 8327595764880)*r + 8003671444488)*r + 3074068635552))*c + ((((((46057648000*r + 532212439584)*r + 2560452107764)*r + 6564279611688)*r + 9458065974196)*r + 7261439988960)*r + 2320728873984))*c + (((((((10392252416*r + 140007318976)*r + 807774734816)*r + 2587089541168)*r + 4967286964592)*r + 5717377881088)*r + 3652633054464)*r + 999148561920))*c + ((((((((1025860864*r + 15784453888)*r + 106179484544)*r + 407833304704)*r + 978258749888)*r + 1500500024320)*r + 1437189851200)*r + 785881506816)*r + 187832318976))

theorem small_gap1_1_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 1*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 3≤(smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 2)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 2)^2-smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 1*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 3=smallGap1_1_1M38E c r := by
  unfold smallValue1_1M38E smallGap1_1_1M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_1_1M38E
 positivity

def smallGap1_1_2M38E (c r : ℤ) : ℤ := ((((((((13505332986*c + (86814285948*r + 169325815608))*c + ((244119210858*r + 950557856418)*r + 924781040928))*c + (((392210762256*r + 2286631512270)*r + 4441593073590)*r + 2873774628180))*c + ((((393785891280*r + 3055481952408)*r + 8887195904994)*r + 11481648349050)*r + 5558044118166))*c + (((((253001025408*r + 2449358776608)*r + 9482589129792)*r + 18346576434402)*r + 17735538793710)*r + 6851756694708))*c + ((((((101579143104*r + 1177914573696)*r + 5690484323664)*r + 14656002100536)*r + 21219791255652)*r + 16372570859652)*r + 5258457882576))*c + (((((((23301702144*r + 314658732480)*r + 1820991882240)*r + 5853102425472)*r + 11282332928640)*r + 13039420497984)*r + 8364956864448)*r + 2297449488960))*c + ((((((((2338226688*r + 36018517248)*r + 242769147648)*r + 934883032320)*r + 2249220981696)*r + 3461200270272)*r + 3326301841728)*r + 1824952216896)*r + 437579990784))

theorem small_gap1_1_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 2*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 4≤(smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 3)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 3)^2-smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 2*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 4=smallGap1_1_2M38E c r := by
  unfold smallValue1_1M38E smallGap1_1_2M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_1_2M38E
 positivity

def smallGap1_1_3M38E (c r : ℤ) : ℤ := ((((((((9840456801*c + (65004801696*r + 128940349932))*c + ((187771138848*r + 742070853360)*r + 732974305986))*c + (((309777073920*r + 1829384902368)*r + 3600970736400)*r + 2361539876472))*c + ((((319245875136*r + 2504235098304)*r + 7367740436160)*r + 9631364222016)*r + 4718045204073))*c + (((((210454318080*r + 2055805776000)*r + 8036123331456)*r + 15705603812448)*r + 15339661963056)*r + 5987515152636))*c + ((((((86665918464*r + 1012113114624)*r + 4928149279296)*r + 12799985645376)*r + 18695417543712)*r + 14553271423440)*r + 4715398453428))*c + (((((((20383580160*r + 276691184640)*r + 1611112527360)*r + 5213818735488)*r + 10123013130624)*r + 11787109737408)*r + 7618404028320)*r + 2107826470944))*c + ((((((((2096391168*r + 32402589696)*r + 219364420608)*r + 849155931648)*r + 2054739227904)*r + 3181190139648)*r + 3076251741504)*r + 1698209050752)*r + 409628183616))

theorem small_gap1_1_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 3*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 5≤(smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 4)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 4)^2-smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 3*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 5=smallGap1_1_3M38E c r := by
  unfold smallValue1_1M38E smallGap1_1_3M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_1_3M38E
 positivity

def smallGap1_1_4M38E (c r : ℤ) : ℤ := ((((((((2667720096*c + (18334154304*r + 37159552224))*c + ((55052199072*r + 221774340672)*r + 223351278048))*c + (((94336603392*r + 566547848160)*r + 1134436306560)*r + 757035852192))*c + ((((100904398080*r + 803092655232)*r + 2398116715584)*r + 3182858977440)*r + 1583514406080))*c + (((((68988758016*r + 682239014400)*r + 2700740044800)*r + 5347315518432)*r + 5292971720832)*r + 2094405043968))*c + ((((((29444127744*r + 347346539520)*r + 1709048967936)*r + 4487394753408)*r + 6628464750624)*r + 5220194945568)*r + 1711577668032))*c + (((((((7172431872*r + 98137340928)*r + 576201421824)*r + 1881069553152)*r + 3686037384960)*r + 4333536077376)*r + 2828942071488)*r + 790652138112))*c + ((((((((763502592*r + 11870220288)*r + 80861985792)*r + 315115020288)*r + 768005970432)*r + 1198223377152)*r + 1168119889920)*r + 650256254208)*r + 158170544640))

theorem small_gap1_1_4M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 4*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 6≤(smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 5)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 5)^2-smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 4*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 6=smallGap1_1_4M38E c r := by
  unfold smallValue1_1M38E smallGap1_1_4M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_1_4M38E
 positivity

def smallGap1_1_5M38E (c r : ℤ) : ℤ := ((((((((264508416*c + (1906348032*r + 3914643456))*c + ((6000670720*r + 24485044224)*r + 25001452032))*c + (((10774892544*r + 65515548672)*r + 132890373120)*r + 89938374144))*c + ((((12071408640*r + 97214201856)*r + 293762622976)*r + 394863175680)*r + 199208469504))*c + (((((8640413696*r + 86394329088)*r + 345696317440)*r + 692140841472)*r + 693449852928)*r + 278087623680))*c + ((((((3858726912*r + 45985112064)*r + 228414698496)*r + 605503408128)*r + 903581665792)*r + 719625216000)*r + 238877609472))*c + (((((((983040000*r + 13574062080)*r + 80347783168)*r + 264381646848)*r + 522363625472)*r + 619684621824)*r + 408578055168)*r + 115439150592))*c + ((((((((109379584*r + 1714225152)*r + 11755700224)*r + 46094278656)*r + 113048968192)*r + 177581125632)*r + 174434608128)*r + 97915963392)*r + 24031401984))

theorem small_gap1_1_5M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 5*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 7≤(smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 6)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 6)^2-smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 5*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 7=smallGap1_1_5M38E c r := by
  unfold smallValue1_1M38E smallGap1_1_5M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_1_5M38E
 positivity

def smallGap1_1_6M38E (c r : ℤ) : ℤ := ((((((((8626176*c + (65454080*r + 133963776))*c + ((217014272*r + 884555776)*r + 904351744))*c + (((410615808*r + 2499403776)*r + 5085790208)*r + 3458420736))*c + ((((484925440*r + 3917414400)*r + 11895734272)*r + 16087687168)*r + 8174224384))*c + (((((366002176*r + 3678003200)*r + 14812069888)*r + 29870399488)*r + 30157129728)*r + 12193148928))*c + ((((((172400640*r + 2068463616)*r + 10354429952)*r + 27669282816)*r + 41616282624)*r + 33398831104)*r + 11173390336))*c + (((((((46333952*r + 645144576)*r + 3852746752)*r + 12786012160)*r + 25458073600)*r + 30404974592)*r + 20166305792)*r + 5730471936))*c + ((((((((5439488*r + 86081536)*r + 596090880)*r + 2357862400)*r + 5824696320)*r + 9199292416)*r + 9069675520)*r + 5103396864)*r + 1255007232))

theorem small_gap1_1_6M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 6*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 8≤(smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 7)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 7)^2-smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 6*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 8=smallGap1_1_6M38E c r := by
  unfold smallValue1_1M38E smallGap1_1_6M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_1_6M38E
 positivity

def smallGap1_1_7M38E (c r : ℤ) : ℤ := ((((((((65536*c + (524288*r + 1048576))*c + ((1835008*r + 7340032)*r + 7405568))*c + (((3670016*r + 22020096)*r + 44433408)*r + 30146560))*c + ((((4587520*r + 36700160)*r + 111083520)*r + 150364160)*r + 76980224))*c + (((((3670016*r + 36700160)*r + 148111360)*r + 300064768)*r + 305143808)*r + 125206528))*c + ((((((1835008*r + 22020096)*r + 111083520)*r + 299474944)*r + 454066176)*r + 367942656)*r + 125369344))*c + (((((((524288*r + 7340032)*r + 44433408)*r + 149479424)*r + 300621824)*r + 361491456)*r + 241710080)*r + 69961728))*c + ((((((((65536*r + 1048576)*r + 7405568)*r + 29851648)*r + 74719232)*r + 118755328)*r + 117326848)*r + 66312192)*r + 16598016))

theorem small_gap1_1_7M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 7*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 9≤(smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 8)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 8)^2-smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 7*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) 9=smallGap1_1_7M38E c r := by
  unfold smallValue1_1M38E smallGap1_1_7M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_1_7M38E
 positivity

theorem small_lc1_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :
 smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) j*smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) (j+2)≤(smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) (j+1))^2 := by
 by_cases hj : j≤7
 · interval_cases j
   · exact small_gap1_1_0M38E c r hc hr
   · exact small_gap1_1_1M38E c r hc hr
   · exact small_gap1_1_2M38E c r hc hr
   · exact small_gap1_1_3M38E c r hc hr
   · exact small_gap1_1_4M38E c r hc hr
   · exact small_gap1_1_5M38E c r hc hr
   · exact small_gap1_1_6M38E c r hc hr
   · exact small_gap1_1_7M38E c r hc hr
 · have hv : smallValue1_1M38E (7+4*c+3*r) (2+1*c+1*r) (j+2)=0 := by
    unfold smallValue1_1M38E
    split <;> omega
   rw [hv,mul_zero]
   exact sq_nonneg _

theorem source_small_lc1_1M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 1 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 1 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+2) j≤coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 7+4*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 2+1*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := small_lc1_1M38E x y hx hy j
 rw [ec,er] at h
 have h0 := source_small_coeff1_1M38E rest hc hl hu (i+2) j (by omega)
 have h1 := source_small_coeff1_1M38E rest hc hl hu (i+1) (j+1) (by omega)
 have h2 := source_small_coeff1_1M38E rest hc hl hu i (j+2) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
