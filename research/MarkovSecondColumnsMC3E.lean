import MarkovSecondColumnsBaseMC3E
/-! Machine-authored c3e5369f. Exact second-correction column certificates.
Python proposes coefficients; ordinary Lean ring checks every identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
attribute [local irreducible] threeRawM9E2

def secondColumn2MC3E (x : ℚ) (r : Bool) : ℚ :=
 if r then 36 else 24
theorem source_second_column2MC3E (d : ℕ) (r : Bool) :
 (threeRawM9E2 (secondQMC3E d r) r 2 (secondJMC3E d r):ℚ)=secondColumn2MC3E d r := by
 rw [source_second_lowMC3E d 2 r (by omega)]
 cases r <;> norm_num [secondColumn2MC3E,secondConstantMC3E]

def secondColumn3MC3E (x : ℚ) (r : Bool) : ℚ :=
 if r then (1116+x*((21799/30)+x*((512/3)+x*((64/3)+x*((4/3)+x*(1/30)))))) else (572+x*((6422/15)+x*((343/3)+x*((49/3)+x*((7/6)+x*(1/30))))))
theorem source_second_column3MC3E (d : ℕ) (r : Bool) :
 (threeRawM9E2 (secondQMC3E d r) r 3 (secondJMC3E d r):ℚ)=secondColumn3MC3E d r := by
 have h := source_second_polynomialMC3E d 0 r
 norm_num only [Nat.reduceAdd] at h
 rw [h,column_zero_explicitM418]
 cases r <;> simp only [sourceNME9C,secondQMC3E,secondJMC3E,Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   columnZeroM418,secondColumn3MC3E,binomial_poly_0M295,binomial_poly_1M295] <;> ring

def secondColumn4MC3E (x : ℚ) (r : Bool) : ℚ :=
 if r then (7860+x*((380465/42)+x*((746449/180)+x*((29759/30)+x*((1247/9)+x*((34/3)+x*((91/180)+x*(1/105)))))))) else (3030+x*((341483/84)+x*((154637/72)+x*((17639/30)+x*((6755/72)+x*((35/4)+x*((4/9)+x*(1/105))))))))
theorem source_second_column4MC3E (d : ℕ) (r : Bool) :
 (threeRawM9E2 (secondQMC3E d r) r 4 (secondJMC3E d r):ℚ)=secondColumn4MC3E d r := by
 have h := source_second_polynomialMC3E d 1 r
 norm_num only [Nat.reduceAdd] at h
 rw [h,column_explicit1MAE9]
 cases r <;> simp only [sourceNME9C,secondQMC3E,secondJMC3E,Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   column1MAE9,secondColumn4MC3E,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295] <;> ring

def secondColumn5MC3E (x : ℚ) (r : Bool) : ℚ :=
 if r then (25410+x*((513535/12)+x*((25302941/840)+x*((87850031/7560)+x*((245333/90)+x*((588473/1440)+x*((14201/360)+x*((571/240)+x*((103/1260)+x*(37/30240)))))))))) else (7140+x*((85313/6)+x*((9863423/840)+x*((4975309/945)+x*((2048869/1440)+x*((117331/480)+x*((19391/720)+x*((1331/720)+x*((727/10080)+x*(37/30240))))))))))
theorem source_second_column5MC3E (d : ℕ) (r : Bool) :
 (threeRawM9E2 (secondQMC3E d r) r 5 (secondJMC3E d r):ℚ)=secondColumn5MC3E d r := by
 have h := source_second_polynomialMC3E d 2 r
 norm_num only [Nat.reduceAdd] at h
 rw [h,column_explicit2MAE9]
 cases r <;> simp only [sourceNME9C,secondQMC3E,secondJMC3E,Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   column2MAE9,secondColumn5MC3E,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295] <;> ring

def secondColumn6MC3E (x : ℚ) (r : Bool) : ℚ :=
 if r then (44688+x*((16934491/165)+x*((638316193/6300)+x*((4277772211/75600)+x*((450326581/22680)+x*((55821581/12096)+x*((31556591/43200)+x*((142699/1800)+x*((175867/30240)+x*((16693/60480)+x*((6947/907200)+x*(157/1663200)))))))))))) else (8652+x*((7950023/330)+x*((179865617/6300)+x*((178967387/9450)+x*((354005059/45360)+x*((12747037/6048)+x*((1038289/2700)+x*((344251/7200)+x*((7559/1890)+x*((6521/30240)+x*((1537/226800)+x*(157/1663200))))))))))))
theorem source_second_column6MC3E (d : ℕ) (r : Bool) :
 (threeRawM9E2 (secondQMC3E d r) r 6 (secondJMC3E d r):ℚ)=secondColumn6MC3E d r := by
 have h := source_second_polynomialMC3E d 3 r
 norm_num only [Nat.reduceAdd] at h
 rw [h,column_explicit3MAE9]
 cases r <;> simp only [sourceNME9C,secondQMC3E,secondJMC3E,Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   column3MAE9,secondColumn6MC3E,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295] <;> ring

def secondColumn7MC3E (x : ℚ) (r : Bool) : ℚ :=
 if r then (44220+x*((369797741/2730)+x*((15037882553/83160)+x*((115581948487/831600)+x*((18647295827/272160)+x*((384422669/16800)+x*((36354175/6804)+x*((3223239203/3628800)+x*((19189661/181440)+x*((10837289/1209600)+x*((143557/272160)+x*((24827/1209600)+x*((2843/5987520)+x*(2567/518918400)))))))))))))) else (5280+x*((28077992/1365)+x*((2853352867/83160)+x*((53924476297/1663200)+x*((7521974833/388800)+x*((13977242917/1814400)+x*((921098075/435456)+x*((1483997369/3628800)+x*((203718269/3628800)+x*((6587219/1209600)+x*((113587/311040)+x*((58483/3628800)+x*((50459/119750400)+x*(2567/518918400))))))))))))))
theorem source_second_column7MC3E (d : ℕ) (r : Bool) :
 (threeRawM9E2 (secondQMC3E d r) r 7 (secondJMC3E d r):ℚ)=secondColumn7MC3E d r := by
 have h := source_second_polynomialMC3E d 4 r
 norm_num only [Nat.reduceAdd] at h
 rw [h,column_explicit4MAE9]
 cases r <;> simp only [sourceNME9C,secondQMC3E,secondJMC3E,Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   column4MAE9,secondColumn7MC3E,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295] <;> ring

def secondColumn8MC3E (x : ℚ) (r : Bool) : ℚ :=
 if r then (23166+x*((13474047/140)+x*((44377643207/254800)+x*((9192828409189/50450400)+x*((102509157809/831600)+x*((570169929757/9979200)+x*((204375784751/10886400)+x*((13898260007/3110400)+x*((119019882677/152409600)+x*((15364989523/152409600)+x*((13920637/1451520)+x*((1605587/2419200)+x*((707417/21772800)+x*((255413/239500800)+x*((458891/21794572800)+x*(103/544864320)))))))))))))))) else (1287+x*((2161007/280)+x*((138011435131/7207200)+x*((8002535095921/302702400)+x*((456936808943/19958400)+x*((1585667822111/119750400)+x*((11557922813/2177280)+x*((2743392023/1814400)+x*((1694773147/5443200)+x*((3565358021/76204800)+x*((6207431/1209600)+x*((553087/1360800)+x*((1355429/59875200)+x*((5597/6652800)+x*((2083/111196800)+x*(103/544864320))))))))))))))))
theorem source_second_column8MC3E (d : ℕ) (r : Bool) :
 (threeRawM9E2 (secondQMC3E d r) r 8 (secondJMC3E d r):ℚ)=secondColumn8MC3E d r := by
 have h := source_second_polynomialMC3E d 5 r
 norm_num only [Nat.reduceAdd] at h
 rw [h,column_explicit5MAE9]
 cases r <;> simp only [sourceNME9C,secondQMC3E,secondJMC3E,Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   column5MAE9,secondColumn8MC3E,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295] <;> ring

end
end MathGKM.Markov
