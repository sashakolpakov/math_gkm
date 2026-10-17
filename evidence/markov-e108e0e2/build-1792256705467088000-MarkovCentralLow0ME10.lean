import MarkovCentralRationalME10
/-! Machine-authored e108e0e2. Total raw gap certificate; all correction terms retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 50000000
set_option maxRecDepth 100000
set_option linter.unusedSimpArgs false

theorem central_cert_0_0_falseME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 0 (z+3) 0 false*centralQValueME10 0 (z+3) 2 false ≤
 centralQValueME10 0 (z+3) 1 false^2 := by
 have he : 6350400*(centralQValueME10 0 (z+3) 1 false^2-
   centralQValueME10 0 (z+3) 0 false*centralQValueME10 0 (z+3) 2 false)=((((((((((((((((((((((((((((237817476)*z+13077293208))*z+333570869912))*z+5231207919168))*z+56347022408719))*z+440965337522094))*z+2585535328447041))*z+11538035724597564))*z+39377380462455889))*z+102273228055617318))*z+198984526269928847))*z+281213179258846968))*z+272876806690624116))*z+162729267445493280))*z+44993574922766400) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((237817476)*z+13077293208))*z+333570869912))*z+5231207919168))*z+56347022408719))*z+440965337522094))*z+2585535328447041))*z+11538035724597564))*z+39377380462455889))*z+102273228055617318))*z+198984526269928847))*z+281213179258846968))*z+272876806690624116))*z+162729267445493280))*z+44993574922766400) := by positivity
 linarith only [he,hp]

theorem central_cert_0_0_trueME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 0 (z+3) 0 true*centralQValueME10 0 (z+3) 2 true ≤
 centralQValueME10 0 (z+3) 1 true^2 := by
 have he : 2116800*(centralQValueME10 0 (z+3) 1 true^2-
   centralQValueME10 0 (z+3) 0 true*centralQValueME10 0 (z+3) 2 true)=((((((((((((((((((((((((((((79272492)*z+4729036032))*z+130881246468))*z+2227344685888))*z+26038587917041))*z+221197526170656))*z+1408081245307734))*z+6823176455477004))*z+25290614413428777))*z+71353834934225732))*z+150836826016668848))*z+231660369865697808))*z+244349645920003440))*z+158433482894359680))*z+47641105506758400) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((79272492)*z+4729036032))*z+130881246468))*z+2227344685888))*z+26038587917041))*z+221197526170656))*z+1408081245307734))*z+6823176455477004))*z+25290614413428777))*z+71353834934225732))*z+150836826016668848))*z+231660369865697808))*z+244349645920003440))*z+158433482894359680))*z+47641105506758400) := by positivity
 linarith only [he,hp]

theorem central_cert_0_1_falseME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 1 (z+2) 0 false*centralQValueME10 1 (z+2) 2 false ≤
 centralQValueME10 1 (z+2) 1 false^2 := by
 have he : 2116800*(centralQValueME10 1 (z+2) 1 false^2-
   centralQValueME10 1 (z+2) 0 false*centralQValueME10 1 (z+2) 2 false)=((((((((((((((((((((((((((((79272492)*z+3908997624))*z+89278718760))*z+1251604830112))*z+12030407653285))*z+83856784362022))*z+437045366298825))*z+1729824922621236))*z+5223890370076539))*z+11975594321419274))*z+20510659490163815))*z+25443935858167652))*z+21606938380902684))*z+11240592787579680))*z+2702241515332800) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((79272492)*z+3908997624))*z+89278718760))*z+1251604830112))*z+12030407653285))*z+83856784362022))*z+437045366298825))*z+1729824922621236))*z+5223890370076539))*z+11975594321419274))*z+20510659490163815))*z+25443935858167652))*z+21606938380902684))*z+11240592787579680))*z+2702241515332800) := by positivity
 linarith only [he,hp]

theorem central_cert_0_1_trueME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 1 (z+2) 0 true*centralQValueME10 1 (z+2) 2 true ≤
 centralQValueME10 1 (z+2) 1 true^2 := by
 have he : 6350400*(centralQValueME10 1 (z+2) 1 true^2-
   centralQValueME10 1 (z+2) 0 true*centralQValueME10 1 (z+2) 2 true)=((((((((((((((((((((((((((((237817476)*z+12836807760))*z+321057724316))*z+4930999171392))*z+51950162576179))*z+397108293243060))*z+2270949101430168))*z+9868732474892676))*z+32743394797266979))*z+82530510661391100))*z+155535226709843666))*z+212488928528916732))*z+198905542338400416))*z+114174830832108480))*z+30316872240345600) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((237817476)*z+12836807760))*z+321057724316))*z+4930999171392))*z+51950162576179))*z+397108293243060))*z+2270949101430168))*z+9868732474892676))*z+32743394797266979))*z+82530510661391100))*z+155535226709843666))*z+212488928528916732))*z+198905542338400416))*z+114174830832108480))*z+30316872240345600) := by positivity
 linarith only [he,hp]

theorem central_cert_0_2_falseME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 2 (z+1) 0 false*centralQValueME10 2 (z+1) 2 false ≤
 centralQValueME10 2 (z+1) 1 false^2 := by
 have he : 6350400*(centralQValueME10 2 (z+1) 1 false^2-
   centralQValueME10 2 (z+1) 0 false*centralQValueME10 2 (z+1) 2 false)=((((((((((((((((((((((((((((237817476)*z+10376692536))*z+209125023352))*z+2578887911040))*z+21728252587727))*z+132233384754198))*z+599034582760101))*z+2050583976760200))*z+5325897472624673))*z+10435832127036246))*z+15173427277817347))*z+15861995817583860))*z+11262297498302124))*z+4858980879604320))*z+960848611934400) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((237817476)*z+10376692536))*z+209125023352))*z+2578887911040))*z+21728252587727))*z+132233384754198))*z+599034582760101))*z+2050583976760200))*z+5325897472624673))*z+10435832127036246))*z+15173427277817347))*z+15861995817583860))*z+11262297498302124))*z+4858980879604320))*z+960848611934400) := by positivity
 linarith only [he,hp]

theorem central_cert_0_2_trueME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 2 (z+1) 0 true*centralQValueME10 2 (z+1) 2 true ≤
 centralQValueME10 2 (z+1) 1 true^2 := by
 have he : 6350400*(centralQValueME10 2 (z+1) 1 true^2-
   centralQValueME10 2 (z+1) 0 true*centralQValueME10 2 (z+1) 2 true)=((((((((((((((((((((((((((((237817476)*z+11486507424))*z+256495289932))*z+3508525457472))*z+32830608518099))*z+222218219719272))*z+1121469880414686))*z+4284739582532976))*z+12447317367196439))*z+27345681741250824))*z+44697730768247032))*z+52683153873548352))*z+42307149487409136))*z+20711578044689280))*z+4662228740601600) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((237817476)*z+11486507424))*z+256495289932))*z+3508525457472))*z+32830608518099))*z+222218219719272))*z+1121469880414686))*z+4284739582532976))*z+12447317367196439))*z+27345681741250824))*z+44697730768247032))*z+52683153873548352))*z+42307149487409136))*z+20711578044689280))*z+4662228740601600) := by positivity
 linarith only [he,hp]

theorem central_cert_0_3_falseME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 3 (z+0) 0 false*centralQValueME10 3 (z+0) 2 false ≤
 centralQValueME10 3 (z+0) 1 false^2 := by
 have he : 6350400*(centralQValueME10 3 (z+0) 1 false^2-
   centralQValueME10 3 (z+0) 0 false*centralQValueME10 3 (z+0) 2 false)=((((((((((((((((((((((((((((237817476)*z+9026392200))*z+157437471128))*z+1670123393568))*z+12016985922991))*z+61909806377370))*z+234922300675599))*z+665083525605744))*z+1407090621126085))*z+2206253534606730))*z+2515621260754973))*z+2018397443374788))*z+1077708900959748))*z+344502839620800))*z+50391109843200) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((237817476)*z+9026392200))*z+157437471128))*z+1670123393568))*z+12016985922991))*z+61909806377370))*z+234922300675599))*z+665083525605744))*z+1407090621126085))*z+2206253534606730))*z+2515621260754973))*z+2018397443374788))*z+1077708900959748))*z+344502839620800))*z+50391109843200) := by positivity
 linarith only [he,hp]

theorem central_cert_0_3_trueME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 3 (z+0) 0 true*centralQValueME10 3 (z+0) 2 true ≤
 centralQValueME10 3 (z+0) 1 true^2 := by
 have he : 2116800*(centralQValueME10 3 (z+0) 1 true^2-
   centralQValueME10 3 (z+0) 0 true*centralQValueME10 3 (z+0) 2 true)=((((((((((((((((((((((((((((79272492)*z+3378735696))*z+66318812084))*z+793769376064))*z+6464619550865))*z+37845705989588))*z+163984815525612))*z+533316248329032))*z+1305713843502649))*z+2390107434871436))*z+3213902843319154))*z+3073792192500904))*z+1975242257689944))*z+763943199022080))*z+134563210588800) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((79272492)*z+3378735696))*z+66318812084))*z+793769376064))*z+6464619550865))*z+37845705989588))*z+163984815525612))*z+533316248329032))*z+1305713843502649))*z+2390107434871436))*z+3213902843319154))*z+3073792192500904))*z+1975242257689944))*z+763943199022080))*z+134563210588800) := by positivity
 linarith only [he,hp]

theorem central_low_0ME10 (h k : ℕ) (r : Bool) (hh : h ≤ 3) (hk : 3 ≤ k+h) :
 centralRawME10 h k 0 r*centralRawME10 h k 2 r ≤ centralRawME10 h k 1 r^2 := by
 by_cases ht : centralTME10 h k r < 2
 · rw [central_raw_zeroME10 h k 2 r ht,mul_zero]
   exact sq_nonneg _
 have ht' : 2 ≤ 3*k+h+(if r then 1 else 0) := by simpa [centralTME10] using (Nat.le_of_not_gt ht)
 interval_cases h <;> cases r
 · have hk0 : 3 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_0_0_falseME10 ((k:ℚ)-3) (by
     have hkQ : (3:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-3+3=k := by ring
   rw [hval] at he
   have hs (j : ℕ) := central_raw_castME10 0 k j false
   norm_num only [Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] at hs
   rw [←hs 0,←hs (0+2),←hs (0+1)] at he
   exact_mod_cast he
 · have hk0 : 3 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_0_0_trueME10 ((k:ℚ)-3) (by
     have hkQ : (3:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-3+3=k := by ring
   rw [hval] at he
   have hs (j : ℕ) := central_raw_castME10 0 k j true
   norm_num only [Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] at hs
   rw [←hs 0,←hs (0+2),←hs (0+1)] at he
   exact_mod_cast he
 · have hk0 : 2 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_0_1_falseME10 ((k:ℚ)-2) (by
     have hkQ : (2:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-2+2=k := by ring
   rw [hval] at he
   have hs (j : ℕ) := central_raw_castME10 1 k j false
   norm_num only [Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] at hs
   rw [←hs 0,←hs (0+2),←hs (0+1)] at he
   exact_mod_cast he
 · have hk0 : 2 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_0_1_trueME10 ((k:ℚ)-2) (by
     have hkQ : (2:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-2+2=k := by ring
   rw [hval] at he
   have hs (j : ℕ) := central_raw_castME10 1 k j true
   norm_num only [Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] at hs
   rw [←hs 0,←hs (0+2),←hs (0+1)] at he
   exact_mod_cast he
 · have hk0 : 1 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_0_2_falseME10 ((k:ℚ)-1) (by
     have hkQ : (1:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-1+1=k := by ring
   rw [hval] at he
   have hs (j : ℕ) := central_raw_castME10 2 k j false
   norm_num only [Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] at hs
   rw [←hs 0,←hs (0+2),←hs (0+1)] at he
   exact_mod_cast he
 · have hk0 : 1 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_0_2_trueME10 ((k:ℚ)-1) (by
     have hkQ : (1:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-1+1=k := by ring
   rw [hval] at he
   have hs (j : ℕ) := central_raw_castME10 2 k j true
   norm_num only [Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] at hs
   rw [←hs 0,←hs (0+2),←hs (0+1)] at he
   exact_mod_cast he
 · have hk0 : 0 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_0_3_falseME10 ((k:ℚ)-0) (by
     have hkQ : (0:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-0+0=k := by ring
   rw [hval] at he
   have hs (j : ℕ) := central_raw_castME10 3 k j false
   norm_num only [Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] at hs
   rw [←hs 0,←hs (0+2),←hs (0+1)] at he
   exact_mod_cast he
 · have hk0 : 0 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_0_3_trueME10 ((k:ℚ)-0) (by
     have hkQ : (0:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-0+0=k := by ring
   rw [hval] at he
   have hs (j : ℕ) := central_raw_castME10 3 k j true
   norm_num only [Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] at hs
   rw [←hs 0,←hs (0+2),←hs (0+1)] at he
   exact_mod_cast he

end
end MathGKM.Markov
