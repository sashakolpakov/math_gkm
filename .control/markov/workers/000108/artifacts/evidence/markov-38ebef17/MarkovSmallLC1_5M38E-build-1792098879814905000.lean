import MarkovSmallQuot1_5M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def smallGap1_5_0M38E (c r : ℤ) : ℤ := ((((((((6877199802*c + (15151033876*r + 57790252432))*c + ((14603255502*r + 111369079778)*r + 212028795132))*c + (((8042988096*r + 91980152550)*r + 350128651378)*r + 443639879848))*c + ((((2768619150*r + 42203367360)*r + 240903775332)*r + 610310937566)*r + 579022138530))*c + (((((609939396*r + 11618420220)*r + 88400049804)*r + 335834090790)*r + 637052465170)*r + 482730122248))*c + ((((((83982258*r + 1919083266)*r + 18246433788)*r + 92397742686)*r + 262832246562)*r + 398213891984)*r + 251058125736))*c + (((((((6607656*r + 176101614)*r + 2008612242)*r + 12710446074)*r + 48193854102)*r + 109496118720)*r + 138028129560)*r + 74473641792))*c + ((((((((227448*r + 6925500)*r + 92129076)*r + 699379596)*r + 3313812708)*r + 10035784440)*r + 18971085456)*r + 20466370656)*r + 9647637120))

theorem small_gap1_5_0M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 0*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 2≤(smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 1)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 1)^2-smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 0*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 2=smallGap1_5_0M38E c r := by
  unfold smallValue1_5M38E smallGap1_5_0M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_5_0M38E
 positivity

def smallGap1_5_1M38E (c r : ℤ) : ℤ := ((((((((61029602964*c + (136608579888*r + 513222206640))*c + ((133767845464*r + 1003762013672)*r + 1882973224264))*c + (((74841888528*r + 841269973896)*r + 3152411430696)*r + 3937349051328))*c + ((((26168220180*r + 391672638504)*r + 2198803978204)*r + 5486337131144)*r + 5132915211796))*c + (((((5855166432*r + 109400098824)*r + 817871240880)*r + 3057584856720)*r + 5715227406504)*r + 4272496288656))*c + ((((((818727264*r + 18332367120)*r + 171104704020)*r + 851926577400)*r + 2386128292756)*r + 3564109101584)*r + 2217728174992))*c + (((((((65411712*r + 1706482080)*r + 19089465264)*r + 118673458992)*r + 442722280608)*r + 990971405472)*r + 1232139908736)*r + 656403839616))*c + ((((((((2286144*r + 68071104)*r + 887299920)*r + 6611849856)*r + 30800681136)*r + 91835877888)*r + 171126192384)*r + 182179090944)*r + 84825172224))

theorem small_gap1_5_1M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 1*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 3≤(smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 2)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 2)^2-smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 1*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 3=smallGap1_5_1M38E c r := by
  unfold smallValue1_5M38E smallGap1_5_1M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_5_1M38E
 positivity

def smallGap1_5_2M38E (c r : ℤ) : ℤ := ((((((((215008633818*c + (491185194588*r + 1808136836352))*c + ((490767974226*r + 3604010179086)*r + 6627532320396))*c + (((280112811864*r + 3077755236402)*r + 11292702094206)*r + 13832660414664))*c + ((((99892783080*r + 1459758118116)*r + 8015145323358)*r + 19592540663142)*r + 17985214670610))*c + (((((22791884544*r + 415289919600)*r + 3033219385536)*r + 11097468395718)*r + 20332560682614)*r + 14920499289144))*c + ((((((3249167904*r + 70867441728)*r + 645506091936)*r + 3142075889004)*r + 8617819393032)*r + 12624117943452)*r + 7714457227464))*c + (((((((264601728*r + 6716522592)*r + 73245099744)*r + 444703407912)*r + 1623002427672)*r + 3559625194128)*r + 4342967724192)*r + 2273277651648))*c + ((((((((9424512*r + 272735424)*r + 3462022944)*r + 25169621616)*r + 114596822880)*r + 334498616496)*r + 611115655392)*r + 638746906176)*r + 292361569920))

theorem small_gap1_5_2M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 2*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 4≤(smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 3)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 3)^2-smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 2*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 4=smallGap1_5_2M38E c r := by
  unfold smallValue1_5M38E smallGap1_5_2M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_5_2M38E
 positivity

def smallGap1_5_3M38E (c r : ℤ) : ℤ := ((((((((342639547713*c + (801909381744*r + 2888540170884))*c + ((820630638288*r + 5889436516584)*r + 10599641368146))*c + (((479613085632*r + 5143571790192)*r + 18448031930760)*r + 22118928765480))*c + ((((175095773856*r + 2494355400288)*r + 13371643194264)*r + 31956735867984)*r + 28716250173273))*c + (((((40888772352*r + 725404991616)*r + 5166634647744)*r + 18459548749152)*r + 33070918440024)*r + 23757637764852))*c + ((((((5964565248*r + 126512630784)*r + 1122393559968)*r + 5329083859776)*r + 14276086974360)*r + 20451374445384)*r + 12235464102420))*c + (((((((496917504*r + 12251720448)*r + 129979732608)*r + 768881292480)*r + 2737822589280)*r + 5866063959600)*r + 6999977235888)*r + 3587532089184))*c + ((((((((18102528*r + 508239360)*r + 6268904064)*r + 44354097792)*r + 196811719056)*r + 560633199840)*r + 1000813920336)*r + 1023287102784)*r + 458647377984))

theorem small_gap1_5_3M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 3*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 5≤(smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 4)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 4)^2-smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 3*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 5=smallGap1_5_3M38E c r := by
  unfold smallValue1_5M38E smallGap1_5_3M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_5_3M38E
 positivity

def smallGap1_5_4M38E (c r : ℤ) : ℤ := ((((((((255878043552*c + (615566495808*r + 2178317108448))*c + ((647390198304*r + 4559496534432)*r + 8059134272832))*c + (((388769272704*r + 4087272536640)*r + 14381242183872)*r + 16922610123264))*c + ((((145804913280*r + 2034115167744)*r + 10685734601760)*r + 25034857740000)*r + 22057165732896))*c + (((((34971039744*r + 606969340416)*r + 4231767813888)*r + 14804673125184)*r + 25974947806848)*r + 18275369284512))*c + ((((((5238452736*r + 108594488832)*r + 942046829568)*r + 4374605457024)*r + 11463303379392)*r + 16064495931264)*r + 9402171386112))*c + (((((((448063488*r + 10786378752)*r + 111771970560)*r + 645901270272)*r + 2246999871744)*r + 4704045599232)*r + 5485156516224)*r + 2747306021760))*c + ((((((((16754688*r + 458846208)*r + 5521966848)*r + 38121649152)*r + 165063193344)*r + 458862163200)*r + 799513777152)*r + 798040563456)*r + 349274792448))

theorem small_gap1_5_4M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 4*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 6≤(smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 5)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 5)^2-smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 4*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 6=smallGap1_5_4M38E c r := by
  unfold smallValue1_5M38E smallGap1_5_4M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_5_4M38E
 positivity

def smallGap1_5_5M38E (c r : ℤ) : ℤ := ((((((((86436025344*c + (214432468992*r + 755090781696))*c + ((232548931584*r + 1628969170176)*r + 2863715662080))*c + (((143995318272*r + 1504991902464)*r + 5263787522304)*r + 6147429318144))*c + ((((55681274880*r + 771900848640)*r + 4028454544896)*r + 9359195869440)*r + 8156892287232))*c + (((((13768777728*r + 237363194880)*r + 1643055272448)*r + 5695045261056)*r + 9872596754688)*r + 6843800646144))*c + ((((((2126209024*r + 43760769024)*r + 376665869056)*r + 1731306558720)*r + 4477044082432)*r + 6173129955072)*r + 3545366192640))*c + (((((((187465728*r + 4478660608)*r + 46017272832)*r + 262944522496)*r + 901547152128)*r + 1854353673472)*r + 2118745739520)*r + 1037552232960))*c + ((((((((7225344*r + 196288512)*r + 2340619264)*r + 15960758784)*r + 68019636736)*r + 185505778176)*r + 316247847424)*r + 308214217728)*r + 131510255616))

theorem small_gap1_5_5M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 5*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 7≤(smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 6)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 6)^2-smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 5*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 7=smallGap1_5_5M38E c r := by
  unfold smallValue1_5M38E smallGap1_5_5M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_5_5M38E
 positivity

def smallGap1_5_6M38E (c r : ℤ) : ℤ := ((((((((11591589888*c + (29752344576*r + 107543199744))*c + ((33389273088*r + 240332894208)*r + 434985956352))*c + (((21398224896*r + 230057127936)*r + 829392694272)*r + 992174994432))*c + ((((8565350400*r + 122276597760)*r + 658546027776)*r + 1567250661888)*r + 1385464921344))*c + (((((2192818176*r + 38971625472)*r + 278702057472)*r + 989456878080)*r + 1737675107328)*r + 1207713249792))*c + ((((((350625792*r + 7448002560)*r + 66301787136)*r + 312071592960)*r + 816416774400)*r + 1126402536960)*r + 641374454016))*c + (((((((32014336*r + 790282240)*r + 8406175744)*r + 49169188864)*r + 170293027840)*r + 349734974464)*r + 395329781760)*r + 190135148544))*c + ((((((((1277952*r + 35913728)*r + 443744256)*r + 3095908352)*r + 13305326592)*r + 36148318208)*r + 60823624704)*r + 58117146624)*r + 24191262720))

theorem small_gap1_5_6M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 6*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 8≤(smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 7)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 7)^2-smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 6*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 8=smallGap1_5_6M38E c r := by
  unfold smallValue1_5M38E smallGap1_5_6M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_5_6M38E
 positivity

def smallGap1_5_7M38E (c r : ℤ) : ℤ := ((((((((429981696*c + (1146617856*r + 4586471424))*c + ((1337720832*r + 10701766656)*r + 22317244416))*c + (((891813888*r + 10701766656)*r + 44787105792)*r + 60427607040))*c + ((((371589120*r + 5945425920)*r + 37454524416)*r + 100716397056)*r + 96701806080))*c + (((((99090432*r + 1981808640)*r + 16704036864)*r + 67113312768)*r + 127704923136)*r + 93035755008))*c + ((((((16515072*r + 396361728)*r + 4189458432)*r + 22345356288)*r + 63176110080)*r + 91002545664)*r + 52780377600))*c + (((((((1572864*r + 44040192)*r + 560185344)*r + 3716806656)*r + 13873336320)*r + 29615980032)*r + 33957199872)*r + 16275571200))*c + ((((((((65536*r + 2097152)*r + 31195136)*r + 247058432)*r + 1140945920)*r + 3206657024)*r + 5445379072)*r + 5167395840)*r + 2111385600))

theorem small_gap1_5_7M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 7*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 9≤(smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 8)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 8)^2-smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 7*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 9=smallGap1_5_7M38E c r := by
  unfold smallValue1_5M38E smallGap1_5_7M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_5_7M38E
 positivity

def smallGap1_5_8M38E (c r : ℤ) : ℤ := ((((((151289856*c + (345047040*r + 897122304))*c + ((327794688*r + 1659764736)*r + 2147705856))*c + (((165740544*r + 1227571200)*r + 3107690496)*r + 2668695552))*c + ((((46989312*r + 453304320)*r + 1685701632)*r + 2838853632)*r + 1813579776))*c + (((((7077888*r + 83533824)*r + 405946368)*r + 1002276864)*r + 1249708032)*r + 626946048))*c + ((((((442368*r + 6144000)*r + 36612096)*r + 117590016)*r + 213814272)*r + 208723968)*r + 85386240))

theorem small_gap1_5_8M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 8*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 10≤(smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 9)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 9)^2-smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 8*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 10=smallGap1_5_8M38E c r := by
  unfold smallValue1_5M38E smallGap1_5_8M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_5_8M38E
 positivity

def smallGap1_5_9M38E (c r : ℤ) : ℤ := ((((3686400*c + (7520256*r + 16367616))*c + ((5971968*r + 22551552)*r + 23362560))*c + (((2064384*r + 10109952)*r + 17390592)*r + 11114496))*c + ((((258048*r + 1492992)*r + 3345408)*r + 3520512)*r + 1557504))

theorem small_gap1_5_9M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :
 smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 9*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 11≤(smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 10)^2 := by
 apply sub_nonneg.mp
 have he : (smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 10)^2-smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 9*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) 11=smallGap1_5_9M38E c r := by
  unfold smallValue1_5M38E smallGap1_5_9M38E
  simp only [pow_two]
  ring_nf
 rw [he]
 unfold smallGap1_5_9M38E
 positivity

theorem small_lc1_5M38E (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :
 smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) j*smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) (j+2)≤(smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) (j+1))^2 := by
 by_cases hj : j≤9
 · interval_cases j
   · exact small_gap1_5_0M38E c r hc hr
   · exact small_gap1_5_1M38E c r hc hr
   · exact small_gap1_5_2M38E c r hc hr
   · exact small_gap1_5_3M38E c r hc hr
   · exact small_gap1_5_4M38E c r hc hr
   · exact small_gap1_5_5M38E c r hc hr
   · exact small_gap1_5_6M38E c r hc hr
   · exact small_gap1_5_7M38E c r hc hr
   · exact small_gap1_5_8M38E c r hc hr
   · exact small_gap1_5_9M38E c r hc hr
 · have hv : smallValue1_5M38E (5+4*c+1*r) (4+3*c+1*r) (j+2)=0 := by
    unfold smallValue1_5M38E
    split <;> omega
   rw [hv,mul_zero]
   exact sq_nonneg _

theorem source_small_lc1_5M38E (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 1 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 1 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+2) j≤coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+4*x+1*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 4+3*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := small_lc1_5M38E x y hx hy j
 rw [ec,er] at h
 have h0 := source_small_coeff1_5M38E rest hc hl hu (i+2) j (by omega)
 have h1 := source_small_coeff1_5M38E rest hc hl hu (i+1) (j+1) (by omega)
 have h2 := source_small_coeff1_5M38E rest hc hl hu i (j+2) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
