import MarkovCorrectionColumnsM418
/-! Machine-authored request 418bcc64. Exact raw first-correction columns.
Python supplies proposed rational coefficients; every identity is checked by ring. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
attribute [local irreducible] threeRawM9E2

def correctionGap2M418 (x : ℚ) (r : Bool) : ℚ :=
 if r then (8696+x*((2001602/105)+x*((1347143/75)+x*((441512/45)+x*((31460/9)+x*((4258/5)+x*((10784/75)+x*((1742/105)+x*((5/4)+x*((1/18)+x*(1/900))))))))))) else (10016+x*((2157796/105)+x*((1407118/75)+x*((454706/45)+x*((32102/9)+x*((4314/5)+x*((10859/75)+x*((582/35)+x*((5/4)+x*((1/18)+x*(1/900)))))))))))
theorem correction_gap_identity2M418 (x : ℚ) (r : Bool) :
 correctionColumn3M418 x r^2-correctionColumn2M418 x r*correctionColumn4M418 x r=
 correctionGap2M418 x r := by
 cases r <;> simp only [correctionColumn2M418,correctionColumn3M418,
   correctionColumn4M418,correctionGap2M418,Bool.false_eq_true,if_false,if_true] <;> ring

theorem correction_gap_nonneg2M418 (x : ℚ) (r : Bool) (hx : 0 ≤ x) :
 0 ≤ correctionGap2M418 x r := by
 cases r <;> simp only [correctionGap2M418,Bool.false_eq_true,if_false,if_true] <;> positivity

theorem source_correction_horizontal2M418 (q : ℕ) (r : Bool) :
 threeRawM9E2 (q+2) r 2 (q+3)*threeRawM9E2 (q+2) r 4 (q+3) ≤
   threeRawM9E2 (q+2) r 3 (q+3)^2 := by
 have h : (threeRawM9E2 (q+2) r 2 (q+3):ℚ)*(threeRawM9E2 (q+2) r 4 (q+3):ℚ) ≤
   (threeRawM9E2 (q+2) r 3 (q+3):ℚ)^2 := by
   rw [source_correction_column2M418,source_correction_column3M418,
     source_correction_column4M418]
   have he := correction_gap_identity2M418 (q:ℚ) r
   have hp := correction_gap_nonneg2M418 (q:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h

def correctionGap3M418 (x : ℚ) (r : Bool) : ℚ :=
 if r then (44017+x*((11863781/70)+x*((51156308317/176400)+x*((22152908081/75600)+x*((5087630029/25920)+x*((5259079109/56700)+x*((2424251197/75600)+x*((1876979329/226800)+x*((1020825751/635040)+x*((17722121/75600)+x*((3280477/129600)+x*((111457/56700)+x*((6287/60480)+x*((761/226800)+x*(317/6350400))))))))))))))) else (101056+x*((35231866/105)+x*((446308055/882)+x*((8703171863/18900)+x*((16058164529/56700)+x*((4044412631/32400)+x*((684480589/16800)+x*((162329837/16200)+x*((11865360559/6350400)+x*((39785899/151200)+x*((25016563/907200)+x*((33809/16200)+x*((32633/302400)+x*((1549/453600)+x*(317/6350400)))))))))))))))
theorem correction_gap_identity3M418 (x : ℚ) (r : Bool) :
 correctionColumn4M418 x r^2-correctionColumn3M418 x r*correctionColumn5M418 x r=
 correctionGap3M418 x r := by
 cases r <;> simp only [correctionColumn3M418,correctionColumn4M418,
   correctionColumn5M418,correctionGap3M418,Bool.false_eq_true,if_false,if_true] <;> ring

theorem correction_gap_nonneg3M418 (x : ℚ) (r : Bool) (hx : 0 ≤ x) :
 0 ≤ correctionGap3M418 x r := by
 cases r <;> simp only [correctionGap3M418,Bool.false_eq_true,if_false,if_true] <;> positivity

theorem source_correction_horizontal3M418 (q : ℕ) (r : Bool) :
 threeRawM9E2 (q+2) r 3 (q+3)*threeRawM9E2 (q+2) r 5 (q+3) ≤
   threeRawM9E2 (q+2) r 4 (q+3)^2 := by
 have h : (threeRawM9E2 (q+2) r 3 (q+3):ℚ)*(threeRawM9E2 (q+2) r 5 (q+3):ℚ) ≤
   (threeRawM9E2 (q+2) r 4 (q+3):ℚ)^2 := by
   rw [source_correction_column3M418,source_correction_column4M418,
     source_correction_column5M418]
   have he := correction_gap_identity3M418 (q:ℚ) r
   have hp := correction_gap_nonneg3M418 (q:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h

def correctionGap4M418 (x : ℚ) (r : Bool) : ℚ :=
 if r then (41244+x*((80894623/330)+x*((15234562901/23100)+x*((4139349105641/3880800)+x*((81209078154913/69854400)+x*((1903202654521367/2095632000)+x*((43138030459211/81648000)+x*((1406026261889/5987520)+x*((116578128382697/1437004800)+x*((16783235452891/762048000)+x*((21600932684717/4572288000)+x*((671470851827/838252800)+x*((3654545599/34214400)+x*((3314625023/299376000)+x*((3140116627/3592512000)+x*((42574657/838252800)+x*((1873013/914457600)+x*((429287/8382528000)+x*(4297/7185024000))))))))))))))))))) else (219920+x*((3657363104/3465)+x*((308787949727/132300)+x*((15335984212349/4851000)+x*((3082939495135993/1047816000)+x*((224586364575841/112266000)+x*((12028764013493/11664000)+x*((92679651898931/224532000)+x*((6549911916985663/50295168000)+x*((74702514234643/2286144000)+x*((29922863591717/4572288000)+x*((1877048056997/1796256000)+x*((14389919311/108864000)+x*((5873128817/449064000)+x*((24916358449/25147584000)+x*((697828277/12573792000)+x*((9903181/4572288000)+x*((62971/1197504000)+x*(4297/7185024000)))))))))))))))))))
theorem correction_gap_identity4M418 (x : ℚ) (r : Bool) :
 correctionColumn5M418 x r^2-correctionColumn4M418 x r*correctionColumn6M418 x r=
 correctionGap4M418 x r := by
 cases r <;> simp only [correctionColumn4M418,correctionColumn5M418,
   correctionColumn6M418,correctionGap4M418,Bool.false_eq_true,if_false,if_true] <;> ring

theorem correction_gap_nonneg4M418 (x : ℚ) (r : Bool) (hx : 0 ≤ x) :
 0 ≤ correctionGap4M418 x r := by
 cases r <;> simp only [correctionGap4M418,Bool.false_eq_true,if_false,if_true] <;> positivity

theorem source_correction_horizontal4M418 (q : ℕ) (r : Bool) :
 threeRawM9E2 (q+2) r 4 (q+3)*threeRawM9E2 (q+2) r 6 (q+3) ≤
   threeRawM9E2 (q+2) r 5 (q+3)^2 := by
 have h : (threeRawM9E2 (q+2) r 4 (q+3):ℚ)*(threeRawM9E2 (q+2) r 6 (q+3):ℚ) ≤
   (threeRawM9E2 (q+2) r 5 (q+3):ℚ)^2 := by
   rw [source_correction_column4M418,source_correction_column5M418,
     source_correction_column6M418]
   have he := correction_gap_identity4M418 (q:ℚ) r
   have hp := correction_gap_nonneg4M418 (q:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h

def correctionGap5M418 (x : ℚ) (r : Bool) : ℚ :=
 if r then (7056+x*((46482968/715)+x*((76734749753/283140)+x*((1472483800819/2162160)+x*((50103761182847/43243200)+x*((46450189203187769/32691859200)+x*((2134328716138531331/1634592960000)+x*((2716758543017171749/2942267328000)+x*((3013908986741099173/5884534656000)+x*((37208443400061131/164602368000)+x*((2098313643058928041/26153487360000)+x*((13924408224552731/603542016000)+x*((1120251498086003/207467568000)+x*((1515631037561741/1471133664000)+x*((37665806913953809/235381386240000)+x*((236959705450553/11769069312000)+x*((1994293007669/980755776000)+x*((1274290221223/7846046208000)+x*((786562039873/78460462080000)+x*((986817163/2139830784000)+x*((87573877/5884534656000)+x*((272087/905313024000)+x*(2466643/863065082880000))))))))))))))))))))))) else (124384+x*((7547200624/9009)+x*((408010721287606/156080925)+x*((1903291503495017/378378000)+x*((62245701238245071/9287460000)+x*((489060715039339699/74299680000)+x*((72864675665838853249/14711336640000)+x*((2873779756067347427/980755776000)+x*((40826382680942276513/29422673280000)+x*((8955644647483171063/16812956160000)+x*((13118978866073452403/78460462080000)+x*((325574100404143/7544275200)+x*((228606618081555871/24896108160000)+x*((63185158526445427/39230231040000)+x*((4968750114534179/21398307840000)+x*((3657106815667/133739424000)+x*((3191732096837/1225944720000)+x*((7738587800417/39230231040000)+x*((2733605055499/235381386240000)+x*((18597643/36324288000)+x*((233911039/14711336640000)+x*((36501811/117690693120000)+x*(2466643/863065082880000)))))))))))))))))))))))
theorem correction_gap_identity5M418 (x : ℚ) (r : Bool) :
 correctionColumn6M418 x r^2-correctionColumn5M418 x r*correctionColumn7M418 x r=
 correctionGap5M418 x r := by
 cases r <;> simp only [correctionColumn5M418,correctionColumn6M418,
   correctionColumn7M418,correctionGap5M418,Bool.false_eq_true,if_false,if_true] <;> ring

theorem correction_gap_nonneg5M418 (x : ℚ) (r : Bool) (hx : 0 ≤ x) :
 0 ≤ correctionGap5M418 x r := by
 cases r <;> simp only [correctionGap5M418,Bool.false_eq_true,if_false,if_true] <;> positivity

theorem source_correction_horizontal5M418 (q : ℕ) (r : Bool) :
 threeRawM9E2 (q+2) r 5 (q+3)*threeRawM9E2 (q+2) r 7 (q+3) ≤
   threeRawM9E2 (q+2) r 6 (q+3)^2 := by
 have h : (threeRawM9E2 (q+2) r 5 (q+3):ℚ)*(threeRawM9E2 (q+2) r 7 (q+3):ℚ) ≤
   (threeRawM9E2 (q+2) r 6 (q+3):ℚ)^2 := by
   rw [source_correction_column5M418,source_correction_column6M418,
     source_correction_column7M418]
   have he := correction_gap_identity5M418 (q:ℚ) r
   have hp := correction_gap_nonneg5M418 (q:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h

def correctionGap6M418 (x : ℚ) (r : Bool) : ℚ :=
 if r then (0+x*(778+x*((51604635041/5855850)+x*((227350491924217/4994589600)+x*((449008664811876641/3146591448000)+x*((94713906609775703/310774464000)+x*((76372185791891839541/161824703040000)+x*((226866111589470752887/411917425920000)+x*((1843541164038550968571/3707256833280000)+x*((41676361852418893333/117690693120000)+x*((5986097888967290445227/29658054666240000)+x*((920959230733439289083/9886018222080000)+x*((85077403513003939133/2421065687040000)+x*((2372958253423356340669/217492400885760000)+x*((47541142997024900904409/16964407269089280000)+x*((515495271626746753/863065082880000)+x*((137975837455982789287/1304954405314560000)+x*((306969047330953849/19772036444160000)+x*((31923859513942889/16947459809280000)+x*((1854053265164803/9886018222080000)+x*((1798039787586527/118632218664960000)+x*((131574749587/134503649280000)+x*((5838371570813/118632218664960000)+x*((12636856663/6796637527680000)+x*((9248050531/186422057902080000)+x*((181237909/217492400885760000)+x*(4163581/628311380336640000))))))))))))))))))))))))))) else (14400+x*((195819664/1365)+x*((8047889235569/12297285)+x*((5703850009377833/3121618500)+x*((225823803906334631/64216152000)+x*((14240362576961131439/2860537680000)+x*((12231107720064084051439/2265545842560000)+x*((1582770584943928411/343264521600)+x*((4691070835360266624121/1482902733312000)+x*((8675565406562063939/4903778880000)+x*((3454971639834071166581/4236864952320000)+x*((38600136651900428219/123575227776000)+x*((2373621404159175247279/23726443732992000)+x*((5850848114696760419513/217492400885760000)+x*((103283813579386205213449/16964407269089280000)+x*((27315523131243167/23538138624000)+x*((6938411477534748971/37284411580416000)+x*((494883263014505483/19772036444160000)+x*((333172481524030223/118632218664960000)+x*((128886279573313/494300911104000)+x*((93923415538817/4745288746598400)+x*((1136913382093/941525544960000)+x*((978577311419/16947459809280000)+x*((1416113339/679663752768000)+x*((13917451367/260990881062912000)+x*((23851/27653197824000)+x*(4163581/628311380336640000)))))))))))))))))))))))))))
theorem correction_gap_identity6M418 (x : ℚ) (r : Bool) :
 correctionColumn7M418 x r^2-correctionColumn6M418 x r*correctionColumn8M418 x r=
 correctionGap6M418 x r := by
 cases r <;> simp only [correctionColumn6M418,correctionColumn7M418,
   correctionColumn8M418,correctionGap6M418,Bool.false_eq_true,if_false,if_true] <;> ring

theorem correction_gap_nonneg6M418 (x : ℚ) (r : Bool) (hx : 0 ≤ x) :
 0 ≤ correctionGap6M418 x r := by
 cases r <;> simp only [correctionGap6M418,Bool.false_eq_true,if_false,if_true] <;> positivity

theorem source_correction_horizontal6M418 (q : ℕ) (r : Bool) :
 threeRawM9E2 (q+2) r 6 (q+3)*threeRawM9E2 (q+2) r 8 (q+3) ≤
   threeRawM9E2 (q+2) r 7 (q+3)^2 := by
 have h : (threeRawM9E2 (q+2) r 6 (q+3):ℚ)*(threeRawM9E2 (q+2) r 8 (q+3):ℚ) ≤
   (threeRawM9E2 (q+2) r 7 (q+3):ℚ)^2 := by
   rw [source_correction_column6M418,source_correction_column7M418,
     source_correction_column8M418]
   have he := correction_gap_identity6M418 (q:ℚ) r
   have hp := correction_gap_nonneg6M418 (q:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h

end
end MathGKM.Markov
