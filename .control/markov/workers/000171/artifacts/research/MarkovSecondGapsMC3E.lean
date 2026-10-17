import MarkovSecondColumnsMC3E
/-! Machine-authored c3e5369f. Exact second-correction column certificates.
Python proposes coefficients; ordinary Lean ring checks every identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
attribute [local irreducible] threeRawM9E2

def secondGap2MC3E (x : ℚ) (r : Bool) : ℚ :=
 if r then (962496+x*((45350646/35)+x*((683670781/900)+x*((11696822/45)+x*((871772/15)+x*((133288/15)+x*((423209/450)+x*((7132/105)+x*((16/5)+x*((4/45)+x*(1/900))))))))))) else (254464+x*((41182886/105)+x*((59073709/225)+x*((4611328/45)+x*((130704/5)+x*(4562+x*((124072/225)+x*((4778/105)+x*((49/20)+x*((7/90)+x*(1/900)))))))))))
theorem second_gap_identity2MC3E (x : ℚ) (r : Bool) :
 secondColumn3MC3E x r^2-secondColumn2MC3E x r*secondColumn4MC3E x r=secondGap2MC3E x r := by
 cases r <;> simp only [secondColumn2MC3E,secondColumn3MC3E,secondColumn4MC3E,
   secondGap2MC3E,Bool.false_eq_true,if_false,if_true] <;> ring
theorem second_gap_nonneg2MC3E (x : ℚ) (r : Bool) (hx : 0 ≤ x) : 0 ≤ secondGap2MC3E x r := by
 cases r <;> simp only [secondGap2MC3E,Bool.false_eq_true,if_false,if_true] <;> positivity
theorem source_second_horizontal2MC3E (d : ℕ) (r : Bool) :
 threeRawM9E2 (secondQMC3E d r) r 2 (secondJMC3E d r)*
 threeRawM9E2 (secondQMC3E d r) r 4 (secondJMC3E d r) ≤
 threeRawM9E2 (secondQMC3E d r) r 3 (secondJMC3E d r)^2 := by
 have h : (threeRawM9E2 (secondQMC3E d r) r 2 (secondJMC3E d r):ℚ)*
     (threeRawM9E2 (secondQMC3E d r) r 4 (secondJMC3E d r):ℚ) ≤
     (threeRawM9E2 (secondQMC3E d r) r 3 (secondJMC3E d r):ℚ)^2 := by
   rw [source_second_column2MC3E,source_second_column3MC3E,source_second_column4MC3E]
   have he := second_gap_identity2MC3E (d:ℚ) r
   have hp := second_gap_nonneg2MC3E (d:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h

def secondGap3MC3E (x : ℚ) (r : Bool) : ℚ :=
 if r then (33422040+x*((533260744/7)+x*((459818218343/5880)+x*((518651778109/10800)+x*((2242304323099/113400)+x*((93881108509/16200)+x*((378227618287/302400)+x*((820030367/4050)+x*((78603405221/3175200)+x*((4101253/1800)+x*((8823643/56700)+x*((248137/32400)+x*((38867/151200)+x*((299/56700)+x*(317/6350400))))))))))))))) else (5096820+x*((282355807/21)+x*((187234653727/11760)+x*((283356809633/25200)+x*((688278263009/129600)+x*((28866423779/16200)+x*((1582699963/3600)+x*((4608200369/56700)+x*((36000860789/3175200)+x*((44980303/37800)+x*((12004129/129600)+x*((42059/8100)+x*((8573/43200)+x*((1051/226800)+x*(317/6350400)))))))))))))))
theorem second_gap_identity3MC3E (x : ℚ) (r : Bool) :
 secondColumn4MC3E x r^2-secondColumn3MC3E x r*secondColumn5MC3E x r=secondGap3MC3E x r := by
 cases r <;> simp only [secondColumn3MC3E,secondColumn4MC3E,secondColumn5MC3E,
   secondGap3MC3E,Bool.false_eq_true,if_false,if_true] <;> ring
theorem second_gap_nonneg3MC3E (x : ℚ) (r : Bool) (hx : 0 ≤ x) : 0 ≤ secondGap3MC3E x r := by
 cases r <;> simp only [secondGap3MC3E,Bool.false_eq_true,if_false,if_true] <;> positivity
theorem source_second_horizontal3MC3E (d : ℕ) (r : Bool) :
 threeRawM9E2 (secondQMC3E d r) r 3 (secondJMC3E d r)*
 threeRawM9E2 (secondQMC3E d r) r 5 (secondJMC3E d r) ≤
 threeRawM9E2 (secondQMC3E d r) r 4 (secondJMC3E d r)^2 := by
 have h : (threeRawM9E2 (secondQMC3E d r) r 3 (secondJMC3E d r):ℚ)*
     (threeRawM9E2 (secondQMC3E d r) r 5 (secondJMC3E d r):ℚ) ≤
     (threeRawM9E2 (secondQMC3E d r) r 4 (secondJMC3E d r):ℚ)^2 := by
   rw [source_second_column3MC3E,source_second_column4MC3E,source_second_column5MC3E]
   have he := second_gap_identity3MC3E (d:ℚ) r
   have hp := second_gap_nonneg3MC3E (d:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h

def secondGap4MC3E (x : ℚ) (r : Bool) : ℚ :=
 if r then (294420420+x*((10596392331/11)+x*((5362110016847/3696)+x*((78567915280529/58800)+x*((294668152369389949/349272000)+x*((135560960768119133/349272000)+x*((121245282643652311/898128000)+x*((32248134437507/887040)+x*((13825845843739579/1796256000)+x*((246312491474461/190512000)+x*((790909388360477/4572288000)+x*((7718900406719/419126400)+x*((309517158829/199584000)+x*((115678393/1134000)+x*((18436222447/3592512000)+x*((159867223/838252800)+x*((31023403/6286896000)+x*((166367/2095632000)+x*(4297/7185024000))))))))))))))))))) else (24764040+x*((1043641778/11)+x*((4624471540957/27720)+x*((520494035780197/2910600)+x*((609997073193247/4656960)+x*((73016704081884823/1047816000)+x*((25098730230933091/898128000)+x*((115144804603231/13305600)+x*((3020501711245901/1437004800)+x*((308049316103143/762048000)+x*((282636566487617/4572288000)+x*((1049348550211/139708800)+x*((172655074583/239500800)+x*((10775157431/199584000)+x*((11098289017/3592512000)+x*((21874169/167650560)+x*((38564287/10059033600)+x*((586741/8382528000)+x*(4297/7185024000)))))))))))))))))))
theorem second_gap_identity4MC3E (x : ℚ) (r : Bool) :
 secondColumn5MC3E x r^2-secondColumn4MC3E x r*secondColumn6MC3E x r=secondGap4MC3E x r := by
 cases r <;> simp only [secondColumn4MC3E,secondColumn5MC3E,secondColumn6MC3E,
   secondGap4MC3E,Bool.false_eq_true,if_false,if_true] <;> ring
theorem second_gap_nonneg4MC3E (x : ℚ) (r : Bool) (hx : 0 ≤ x) : 0 ≤ secondGap4MC3E x r := by
 cases r <;> simp only [secondGap4MC3E,Bool.false_eq_true,if_false,if_true] <;> positivity
theorem source_second_horizontal4MC3E (d : ℕ) (r : Bool) :
 threeRawM9E2 (secondQMC3E d r) r 4 (secondJMC3E d r)*
 threeRawM9E2 (secondQMC3E d r) r 6 (secondJMC3E d r) ≤
 threeRawM9E2 (secondQMC3E d r) r 5 (secondJMC3E d r)^2 := by
 have h : (threeRawM9E2 (secondQMC3E d r) r 4 (secondJMC3E d r):ℚ)*
     (threeRawM9E2 (secondQMC3E d r) r 6 (secondJMC3E d r):ℚ) ≤
     (threeRawM9E2 (secondQMC3E d r) r 5 (secondJMC3E d r):ℚ)^2 := by
   rw [source_second_column4MC3E,source_second_column5MC3E,source_second_column6MC3E]
   have he := second_gap_identity4MC3E (d:ℚ) r
   have hp := second_gap_nonneg4MC3E (d:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h

def secondGap5MC3E (x : ℚ) (r : Bool) : ℚ :=
 if r then (873387144+x*((2744607480356/715)+x*((155890920078452171/19819800)+x*((22681069026310730449/2270268000)+x*((25042894743004204421/2837835000)+x*((107094913465188353759/18574920000)+x*((1182589635385806011269/408648240000)+x*((1683463692986494694573/1471133664000)+x*((10673065813737977059793/29422673280000)+x*((5491205397572593016467/58845346560000)+x*((5242503141683062397/266872320000)+x*((16041027170411227/4715172000)+x*((32258674859692109551/66389621760000)+x*((3367557493258346327/58845346560000)+x*((1304316329107612699/235381386240000)+x*((586307801111/1337394240)+x*((1100337483758129/39230231040000)+x*((28020279878299/19615115520000)+x*((69328957567/1225944720000)+x*((2467190051/1471133664000)+x*((8250209959/235381386240000)+x*((552853/1200925440000)+x*(2466643/863065082880000))))))))))))))))))))))) else (37157904+x*((139371632636/715)+x*((4706626290664093/9909900)+x*((811177383420590617/1135134000)+x*((4227226716596336567/5675670000)+x*((467397420861846229739/817296480000)+x*((78459940663508474783/233513280000)+x*((65113949777232012347/420323904000)+x*((1678369278766922629163/29422673280000)+x*((285586725578660897173/16812956160000)+x*((35969017445482809547/8717829120000)+x*((496151975618194663/603542016000)+x*((319463601444806527/2371057920000)+x*((76361858374368107/4203239040000)+x*((473083132629157009/235381386240000)+x*((2134204779340321/11769069312000)+x*((129557529203021/9807557760000)+x*((30008209070737/39230231040000)+x*((385400615839/11208637440000)+x*((3888764851/3362591232000)+x*((1611402631/58845346560000)+x*((23955083/58845346560000)+x*(2466643/863065082880000)))))))))))))))))))))))
theorem second_gap_identity5MC3E (x : ℚ) (r : Bool) :
 secondColumn6MC3E x r^2-secondColumn5MC3E x r*secondColumn7MC3E x r=secondGap5MC3E x r := by
 cases r <;> simp only [secondColumn5MC3E,secondColumn6MC3E,secondColumn7MC3E,
   secondGap5MC3E,Bool.false_eq_true,if_false,if_true] <;> ring
theorem second_gap_nonneg5MC3E (x : ℚ) (r : Bool) (hx : 0 ≤ x) : 0 ≤ secondGap5MC3E x r := by
 cases r <;> simp only [secondGap5MC3E,Bool.false_eq_true,if_false,if_true] <;> positivity
theorem source_second_horizontal5MC3E (d : ℕ) (r : Bool) :
 threeRawM9E2 (secondQMC3E d r) r 5 (secondJMC3E d r)*
 threeRawM9E2 (secondQMC3E d r) r 7 (secondJMC3E d r) ≤
 threeRawM9E2 (secondQMC3E d r) r 6 (secondJMC3E d r)^2 := by
 have h : (threeRawM9E2 (secondQMC3E d r) r 5 (secondJMC3E d r):ℚ)*
     (threeRawM9E2 (secondQMC3E d r) r 7 (secondJMC3E d r):ℚ) ≤
     (threeRawM9E2 (secondQMC3E d r) r 6 (secondJMC3E d r):ℚ)^2 := by
   rw [source_second_column5MC3E,source_second_column6MC3E,source_second_column7MC3E]
   have he := second_gap_identity5MC3E (d:ℚ) r
   have hp := second_gap_nonneg5MC3E (d:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h

def secondGap6MC3E (x : ℚ) (r : Bool) : ℚ :=
 if r then (920166192+x*((2412092858186/455)+x*((97921848754384423/6831825)+x*((6867936983009715061/283783500)+x*((450759401824109110142689/15732957240000)+x*((357565720310547625321/14126112000)+x*((1511513666061117217691909/87136378560000)+x*((389799483926860675710113/41191742592000)+x*((3103301267251903044760577/741451366656000)+x*((5424637057331278867177/3566384640000)+x*((6802102628349596634622471/14829027333120000)+x*((228628086379750516007401/1977203644416000)+x*((290578086700267573048397/11863221866496000)+x*((21625758851934172735727/4943009111040000)+x*((11198723608547774457032239/16964407269089280000)+x*((1980949633933262887/23538138624000)+x*((590628690288652186643/65247720265728000)+x*((8093341453338494099/9886018222080000)+x*((564929841551059091/9125555281920000)+x*((139531818070991/35949157171200)+x*((2364838542666701/11863221866496000)+x*((970080953371/117690693120000)+x*((31744708661423/118632218664960000)+x*((6490924553/988601822208000)+x*((18668076803/163119300664320000)+x*((12481999/9886018222080000)+x*(4163581/628311380336640000))))))))))))))))))))))))))) else (16743276+x*((10868907622/91)+x*((43406716171173907/109309200)+x*((40914714347102045981/49945896000)+x*((378084680093408020723/321080760000)+x*((40649535645354843709/32372340000)+x*((2339480354647707375475489/2265545842560000)+x*((5324750565027762622469/7921488960000)+x*((237811928669064032250817/674046696960000)+x*((26719180851565343763383/176536039680000)+x*((227135011156480794941711/4236864952320000)+x*((17353181164886273690023/1098446469120000)+x*((42005587465447285698847/10784747151360000)+x*((175402541142042663203771/217492400885760000)+x*((2384371655578471152936889/16964407269089280000)+x*((11445364017037213187/554827553280000)+x*((474783529943168035441/186422057902080000)+x*((1737838021556718877/6590678814720000)+x*((245586055438147813/10784747151360000)+x*((1237296779456159/760462940160000)+x*((11275212893740007/118632218664960000)+x*((12603595073513/2824576634880000)+x*((2782985376299/16947459809280000)+x*((82664616037/18124366740480000)+x*((117278932549/1304954405314560000)+x*((48696391/43498480177152000)+x*(4163581/628311380336640000)))))))))))))))))))))))))))
theorem second_gap_identity6MC3E (x : ℚ) (r : Bool) :
 secondColumn7MC3E x r^2-secondColumn6MC3E x r*secondColumn8MC3E x r=secondGap6MC3E x r := by
 cases r <;> simp only [secondColumn6MC3E,secondColumn7MC3E,secondColumn8MC3E,
   secondGap6MC3E,Bool.false_eq_true,if_false,if_true] <;> ring
theorem second_gap_nonneg6MC3E (x : ℚ) (r : Bool) (hx : 0 ≤ x) : 0 ≤ secondGap6MC3E x r := by
 cases r <;> simp only [secondGap6MC3E,Bool.false_eq_true,if_false,if_true] <;> positivity
theorem source_second_horizontal6MC3E (d : ℕ) (r : Bool) :
 threeRawM9E2 (secondQMC3E d r) r 6 (secondJMC3E d r)*
 threeRawM9E2 (secondQMC3E d r) r 8 (secondJMC3E d r) ≤
 threeRawM9E2 (secondQMC3E d r) r 7 (secondJMC3E d r)^2 := by
 have h : (threeRawM9E2 (secondQMC3E d r) r 6 (secondJMC3E d r):ℚ)*
     (threeRawM9E2 (secondQMC3E d r) r 8 (secondJMC3E d r):ℚ) ≤
     (threeRawM9E2 (secondQMC3E d r) r 7 (secondJMC3E d r):ℚ)^2 := by
   rw [source_second_column6MC3E,source_second_column7MC3E,source_second_column8MC3E]
   have he := second_gap_identity6MC3E (d:ℚ) r
   have hp := second_gap_nonneg6MC3E (d:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h

end
end MathGKM.Markov
