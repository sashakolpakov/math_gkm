import MarkovCentralSecondME10
/-! Machine-authored e108e0e2. Total column-two raw gap. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 20000000
set_option maxRecDepth 50000
set_option linter.unusedSimpArgs false

theorem central_second_cert_0_falseME10 (z : ℚ) (hz : 0 ≤ z) :
 centralSecondME10 0 (z+3) false*centralQValueME10 0 (z+3) 1 false ≤
 centralQValueME10 0 (z+3) 0 false^2 := by
 have he : 6300*(centralQValueME10 0 (z+3) 0 false^2-
   centralSecondME10 0 (z+3) false*centralQValueME10 0 (z+3) 1 false)=((((((((((((((((((((334878)*z+13336640))*z+238927325))*z+2535533190))*z+17650218859))*z+84209577060))*z+278853676075))*z+632817004510))*z+941823663263))*z+830067149400))*z+328957398000) := by
   unfold centralSecondME10 correctionJet2M80F centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((334878)*z+13336640))*z+238927325))*z+2535533190))*z+17650218859))*z+84209577060))*z+278853676075))*z+632817004510))*z+941823663263))*z+830067149400))*z+328957398000) := by positivity
 linarith only [he,hp]

theorem central_second_cert_0_trueME10 (z : ℚ) (hz : 0 ≤ z) :
 centralSecondME10 0 (z+3) true*centralQValueME10 0 (z+3) 1 true ≤
 centralQValueME10 0 (z+3) 0 true^2 := by
 have he : 6300*(centralQValueME10 0 (z+3) 0 true^2-
   centralSecondME10 0 (z+3) true*centralQValueME10 0 (z+3) 1 true)=((((((((((((((((((((334878)*z+14452900))*z+280611635))*z+3227478390))*z+24351259009))*z+125931237180))*z+452035857940))*z+1112048858060))*z+1794281120888))*z+1714498293120))*z+736710307200) := by
   unfold centralSecondME10 correctionJet2M80F centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((334878)*z+14452900))*z+280611635))*z+3227478390))*z+24351259009))*z+125931237180))*z+452035857940))*z+1112048858060))*z+1794281120888))*z+1714498293120))*z+736710307200) := by positivity
 linarith only [he,hp]

theorem central_second_cert_1_falseME10 (z : ℚ) (hz : 0 ≤ z) :
 centralSecondME10 1 (z+2) false*centralQValueME10 1 (z+2) 1 false ≤
 centralQValueME10 1 (z+2) 0 false^2 := by
 have he : 6300*(centralQValueME10 1 (z+2) 0 false^2-
   centralSecondME10 1 (z+2) false*centralQValueME10 1 (z+2) 1 false)=((((((((((((((((((((334878)*z+12161900))*z+198548105))*z+1918326600))*z+12144255949))*z+52620610560))*z+157988824870))*z+324432293050))*z+435903481748))*z+345863010240))*z+122995252800) := by
   unfold centralSecondME10 correctionJet2M80F centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((334878)*z+12161900))*z+198548105))*z+1918326600))*z+12144255949))*z+52620610560))*z+157988824870))*z+324432293050))*z+435903481748))*z+345863010240))*z+122995252800) := by positivity
 linarith only [he,hp]

theorem central_second_cert_1_trueME10 (z : ℚ) (hz : 0 ≤ z) :
 centralSecondME10 1 (z+2) true*centralQValueME10 1 (z+2) 1 true ≤
 centralQValueME10 1 (z+2) 0 true^2 := by
 have he : 6300*(centralQValueME10 1 (z+2) 0 true^2-
   centralSecondME10 1 (z+2) true*centralQValueME10 1 (z+2) 1 true)=((((((((((((((((((((334878)*z+13278160))*z+236708195))*z+2497894920))*z+17275930189))*z+81806213790))*z+268527608155))*z+603154620530))*z+886934922983))*z+770745245400))*z+300450150000) := by
   unfold centralSecondME10 correctionJet2M80F centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((334878)*z+13278160))*z+236708195))*z+2497894920))*z+17275930189))*z+81806213790))*z+268527608155))*z+603154620530))*z+886934922983))*z+770745245400))*z+300450150000) := by positivity
 linarith only [he,hp]

theorem central_second_cert_2_falseME10 (z : ℚ) (hz : 0 ≤ z) :
 centralSecondME10 2 (z+1) false*centralQValueME10 2 (z+1) 1 false ≤
 centralQValueME10 2 (z+1) 0 false^2 := by
 have he : 6300*(centralQValueME10 2 (z+1) 0 false^2-
   centralSecondME10 2 (z+1) false*centralQValueME10 2 (z+1) 1 false)=((((((((((((((((((((334878)*z+10987160))*z+161827925))*z+1408003290))*z+8006433939))*z+31054724400))*z+83088441375))*z+151153333210))*z+178544537983))*z+123331480740))*z+37714074300) := by
   unfold centralSecondME10 correctionJet2M80F centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((334878)*z+10987160))*z+161827925))*z+1408003290))*z+8006433939))*z+31054724400))*z+83088441375))*z+151153333210))*z+178544537983))*z+123331480740))*z+37714074300) := by positivity
 linarith only [he,hp]

theorem central_second_cert_2_trueME10 (z : ℚ) (hz : 0 ≤ z) :
 centralSecondME10 2 (z+1) true*centralQValueME10 2 (z+1) 1 true ≤
 centralQValueME10 2 (z+1) 0 true^2 := by
 have he : 6300*(centralQValueME10 2 (z+1) 0 true^2-
   centralSecondME10 2 (z+1) true*centralQValueME10 2 (z+1) 1 true)=((((((((((((((((((((334878)*z+12103420))*z+196463795))*z+1884952170))*z+11829520269))*z+50697438540))*z+150108807480))*z+302831361980))*z+397797637528))*z+306710547840))*z+105193468800) := by
   unfold centralSecondME10 correctionJet2M80F centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((334878)*z+12103420))*z+196463795))*z+1884952170))*z+11829520269))*z+50697438540))*z+150108807480))*z+302831361980))*z+397797637528))*z+306710547840))*z+105193468800) := by positivity
 linarith only [he,hp]

theorem central_second_cert_3_falseME10 (z : ℚ) (hz : 0 ≤ z) :
 centralSecondME10 3 (z+0) false*centralQValueME10 3 (z+0) 1 false ≤
 centralQValueME10 3 (z+0) 0 false^2 := by
 have he : 6300*(centralQValueME10 3 (z+0) 0 false^2-
   centralSecondME10 3 (z+0) false*centralQValueME10 3 (z+0) 1 false)=((((((((((((((((((((334878)*z+9812420))*z+128766785))*z+994493340))*z+4991400589))*z+16943302740))*z+39174237790))*z+60439152310))*z+58882290908))*z+32186413440))*z+7336324800) := by
   unfold centralSecondME10 correctionJet2M80F centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((334878)*z+9812420))*z+128766785))*z+994493340))*z+4991400589))*z+16943302740))*z+39174237790))*z+60439152310))*z+58882290908))*z+32186413440))*z+7336324800) := by positivity
 linarith only [he,hp]

theorem central_second_cert_3_trueME10 (z : ℚ) (hz : 0 ≤ z) :
 centralSecondME10 3 (z+0) true*centralQValueME10 3 (z+0) 1 true ≤
 centralQValueME10 3 (z+0) 0 true^2 := by
 have he : 6300*(centralQValueME10 3 (z+0) 0 true^2-
   centralSecondME10 3 (z+0) true*centralQValueME10 3 (z+0) 1 true)=((((((((((((((((((((334878)*z+10928680))*z+159878435))*z+1378580220))*z+7743180529))*z+29522094630))*z+77098268515))*z+135528796130))*z+152492782943))*z+98335823940))*z+27310506300) := by
   unfold centralSecondME10 correctionJet2M80F centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((334878)*z+10928680))*z+159878435))*z+1378580220))*z+7743180529))*z+29522094630))*z+77098268515))*z+135528796130))*z+152492782943))*z+98335823940))*z+27310506300) := by positivity
 linarith only [he,hp]

theorem central_second_gapME10 (h k : ℕ) (r : Bool) (hh : h ≤ 3) (hk : 3 ≤ k+h) :
 centralSecondME10 h k r*centralQValueME10 h k 1 r ≤ centralQValueME10 h k 0 r^2 := by
 interval_cases h <;> cases r
 · have hk0 : 3 ≤ k := by omega
   have he := central_second_cert_0_falseME10 ((k:ℚ)-3) (by
     have hkQ : (3:ℚ) ≤ k := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   simpa only [sub_add_cancel,Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] using he
 · have hk0 : 3 ≤ k := by omega
   have he := central_second_cert_0_trueME10 ((k:ℚ)-3) (by
     have hkQ : (3:ℚ) ≤ k := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   simpa only [sub_add_cancel,Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] using he
 · have hk0 : 2 ≤ k := by omega
   have he := central_second_cert_1_falseME10 ((k:ℚ)-2) (by
     have hkQ : (2:ℚ) ≤ k := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   simpa only [sub_add_cancel,Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] using he
 · have hk0 : 2 ≤ k := by omega
   have he := central_second_cert_1_trueME10 ((k:ℚ)-2) (by
     have hkQ : (2:ℚ) ≤ k := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   simpa only [sub_add_cancel,Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] using he
 · have hk0 : 1 ≤ k := by omega
   have he := central_second_cert_2_falseME10 ((k:ℚ)-1) (by
     have hkQ : (1:ℚ) ≤ k := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   simpa only [sub_add_cancel,Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] using he
 · have hk0 : 1 ≤ k := by omega
   have he := central_second_cert_2_trueME10 ((k:ℚ)-1) (by
     have hkQ : (1:ℚ) ≤ k := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   simpa only [sub_add_cancel,Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] using he
 · have hk0 : 0 ≤ k := by omega
   have he := central_second_cert_3_falseME10 ((k:ℚ)-0) (by
     have hkQ : (0:ℚ) ≤ k := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   simpa only [sub_add_cancel,Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] using he
 · have hk0 : 0 ≤ k := by omega
   have he := central_second_cert_3_trueME10 ((k:ℚ)-0) (by
     have hkQ : (0:ℚ) ≤ k := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   simpa only [sub_add_cancel,Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] using he

end
end MathGKM.Markov
