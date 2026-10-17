import MarkovCentralRationalME10
/-! Machine-authored e108e0e2. Total raw gap certificate; all correction terms retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 50000000
set_option maxRecDepth 100000
set_option linter.unusedSimpArgs false

theorem central_cert_1_0_falseME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 0 (z+3) 1 false*centralQValueME10 0 (z+3) 3 false ≤
 centralQValueME10 0 (z+3) 2 false^2 := by
 have he : 12573792000*(centralQValueME10 0 (z+3) 2 false^2-
   centralQValueME10 0 (z+3) 1 false*centralQValueME10 0 (z+3) 3 false)=((((((((((((((((((((((((((((((((((((97990024930)*z+6883154967192))*z+227986931922165))*z+4731194748966970))*z+68930388878087220))*z+748705826612815204))*z+6282990810913304530))*z+41650457521240394680))*z+221098402659030379890))*z+946857801930222566516))*z+3278933941589128424145))*z+9159757462726292370830))*z+20487454403658152130640))*z+36191015427611936791088))*z+49379821714934542310160))*z+50212418909241461591520))*z+35832378479466909064320))*z+16013068992341434944000))*z+3372555366507140352000) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((((((((((97990024930)*z+6883154967192))*z+227986931922165))*z+4731194748966970))*z+68930388878087220))*z+748705826612815204))*z+6282990810913304530))*z+41650457521240394680))*z+221098402659030379890))*z+946857801930222566516))*z+3278933941589128424145))*z+9159757462726292370830))*z+20487454403658152130640))*z+36191015427611936791088))*z+49379821714934542310160))*z+50212418909241461591520))*z+35832378479466909064320))*z+16013068992341434944000))*z+3372555366507140352000) := by positivity
 linarith only [he,hp]

theorem central_cert_1_0_trueME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 0 (z+3) 1 true*centralQValueME10 0 (z+3) 3 true ≤
 centralQValueME10 0 (z+3) 2 true^2 := by
 have he : 12573792000*(centralQValueME10 0 (z+3) 2 true^2-
   centralQValueME10 0 (z+3) 1 true*centralQValueME10 0 (z+3) 3 true)=((((((((((((((((((((((((((((((((((((97990024930)*z+7471095116772))*z+268657307160063))*z+6054099413731858))*z+95803292283013110))*z+1130514004275954634))*z+10309401855203644816))*z+74284772060633384446))*z+428738795849793025080))*z+1996810889692026353066))*z+7522313659298482990929))*z+22866242652191113492184))*z+55669882635475303498240))*z+107074968038907361454528))*z+159121553293837612674192))*z+176288660487313208704512))*z+137109643235266834592640))*z+66802897728923174784000))*z+15344795030974472448000) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((((((((((97990024930)*z+7471095116772))*z+268657307160063))*z+6054099413731858))*z+95803292283013110))*z+1130514004275954634))*z+10309401855203644816))*z+74284772060633384446))*z+428738795849793025080))*z+1996810889692026353066))*z+7522313659298482990929))*z+22866242652191113492184))*z+55669882635475303498240))*z+107074968038907361454528))*z+159121553293837612674192))*z+176288660487313208704512))*z+137109643235266834592640))*z+66802897728923174784000))*z+15344795030974472448000) := by positivity
 linarith only [he,hp]

theorem central_cert_1_1_falseME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 1 (z+2) 1 false*centralQValueME10 1 (z+2) 3 false ≤
 centralQValueME10 1 (z+2) 2 false^2 := by
 have he : 12573792000*(centralQValueME10 1 (z+2) 2 false^2-
   centralQValueME10 1 (z+2) 1 false*centralQValueME10 1 (z+2) 3 false)=((((((((((((((((((((((((((((((((((((97990024930)*z+6123087989844))*z+180095034939153))*z+3312522171064328))*z+42691566503356410))*z+409346980251306818))*z+3025928233236688591))*z+17629615743073643456))*z+82056742011155336205))*z+307361379980110503982))*z+928579990482911356584))*z+2257023166679812159804))*z+4380336740308119167815))*z+6695009021412380144056))*z+7880596524121709523672))*z+6892509733848891366912))*z+4217650439608544246640))*z+1611205870334899708800))*z+289173005628734304000) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((((((((((97990024930)*z+6123087989844))*z+180095034939153))*z+3312522171064328))*z+42691566503356410))*z+409346980251306818))*z+3025928233236688591))*z+17629615743073643456))*z+82056742011155336205))*z+307361379980110503982))*z+928579990482911356584))*z+2257023166679812159804))*z+4380336740308119167815))*z+6695009021412380144056))*z+7880596524121709523672))*z+6892509733848891366912))*z+4217650439608544246640))*z+1611205870334899708800))*z+289173005628734304000) := by positivity
 linarith only [he,hp]

theorem central_cert_1_1_trueME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 1 (z+2) 1 true*centralQValueME10 1 (z+2) 3 true ≤
 centralQValueME10 1 (z+2) 2 true^2 := by
 have he : 12573792000*(centralQValueME10 1 (z+2) 2 true^2-
   centralQValueME10 1 (z+2) 1 true*centralQValueME10 1 (z+2) 3 true)=((((((((((((((((((((((((((((((((((((97990024930)*z+6711028139424))*z+216458363972079))*z+4368517928706560))*z+61813400912312370))*z+651140210245812098))*z+5291470511059763023))*z+33915931103100921980))*z+173797242536930563485))*z+717276630221573344582))*z+2389587855702403559142))*z+6410319579106125574360))*z+13742961699618611938975))*z+23225058474377757967396))*z+30256182579337058871756))*z+29316311844138712749600))*z+19893690637572068418240))*z+8436259524485850624000))*z+1682495216082261504000) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((((((((((97990024930)*z+6711028139424))*z+216458363972079))*z+4368517928706560))*z+61813400912312370))*z+651140210245812098))*z+5291470511059763023))*z+33915931103100921980))*z+173797242536930563485))*z+717276630221573344582))*z+2389587855702403559142))*z+6410319579106125574360))*z+13742961699618611938975))*z+23225058474377757967396))*z+30256182579337058871756))*z+29316311844138712749600))*z+19893690637572068418240))*z+8436259524485850624000))*z+1682495216082261504000) := by positivity
 linarith only [he,hp]

theorem central_cert_1_2_falseME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 2 (z+1) 1 false*centralQValueME10 2 (z+1) 3 false ≤
 centralQValueME10 2 (z+1) 2 false^2 := by
 have he : 12573792000*(centralQValueME10 2 (z+1) 2 false^2-
   centralQValueME10 2 (z+1) 1 false*centralQValueME10 2 (z+1) 3 false)=((((((((((((((((((((((((((((((((((((97990024930)*z+5363021012496))*z+137716667977629))*z+2203842091871478))*z+24618800929632360))*z+203775447344434392))*z+1294627228710460708))*z+6452035966250213346))*z+25557923585287909860))*z+81031638393859611678))*z+206018758296321146247))*z+418847085603984146424))*z+675597994873775065330))*z+852565405579181434434))*z+823007997258852535416))*z+586329772929787867752))*z+290287222215144671520))*z+89132935098538800000))*z+12776376636467136000) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((((((((((97990024930)*z+5363021012496))*z+137716667977629))*z+2203842091871478))*z+24618800929632360))*z+203775447344434392))*z+1294627228710460708))*z+6452035966250213346))*z+25557923585287909860))*z+81031638393859611678))*z+206018758296321146247))*z+418847085603984146424))*z+675597994873775065330))*z+852565405579181434434))*z+823007997258852535416))*z+586329772929787867752))*z+290287222215144671520))*z+89132935098538800000))*z+12776376636467136000) := by positivity
 linarith only [he,hp]

theorem central_cert_1_2_trueME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 2 (z+1) 1 true*centralQValueME10 2 (z+1) 3 true ≤
 centralQValueME10 2 (z+1) 2 true^2 := by
 have he : 12573792000*(centralQValueME10 2 (z+1) 2 true^2-
   centralQValueME10 2 (z+1) 1 true*centralQValueME10 2 (z+1) 3 true)=((((((((((((((((((((((((((((((((((((97990024930)*z+5950961162076))*z+169772950805583))*z+3022334435838990))*z+37613042569787190))*z+347392959516428322))*z+2466963032197868806))*z+13768337006677754340))*z+61201862323661510880))*z+218225693201606308878))*z+625455594165483621039))*z+1437054014096234945250))*z+2626497036815813746900))*z+3765908287614259612224))*z+4141926813703066713072))*z+3371295583521176749920))*z+1912105087935493377600))*z+674329400746702848000))*z+111287123143701120000) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((((((((((97990024930)*z+5950961162076))*z+169772950805583))*z+3022334435838990))*z+37613042569787190))*z+347392959516428322))*z+2466963032197868806))*z+13768337006677754340))*z+61201862323661510880))*z+218225693201606308878))*z+625455594165483621039))*z+1437054014096234945250))*z+2626497036815813746900))*z+3765908287614259612224))*z+4141926813703066713072))*z+3371295583521176749920))*z+1912105087935493377600))*z+674329400746702848000))*z+111287123143701120000) := by positivity
 linarith only [he,hp]

theorem central_cert_1_3_falseME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 3 (z+0) 1 false*centralQValueME10 3 (z+0) 3 false ≤
 centralQValueME10 3 (z+0) 2 false^2 := by
 have he : 12573792000*(centralQValueME10 3 (z+0) 2 false^2-
   centralQValueME10 3 (z+0) 1 false*centralQValueME10 3 (z+0) 3 false)=((((((((((((((((((((((((((((((((((((97990024930)*z+4602954035148))*z+100851831037593))*z+1367871402462244))*z+12852786887142270))*z+88713174822554086))*z+465380746310287801))*z+1893794727332540158))*z+6048632140844126955))*z+15246305016292293284))*z+30343742957755160994))*z+47494552424088517202))*z+57967681933801120285))*z+54405084857622353582))*z+38423993253077100612))*z+19727310759634309896))*z+6937800901248814560))*z+1487952715194086400))*z+144984975480576000) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((((((((((97990024930)*z+4602954035148))*z+100851831037593))*z+1367871402462244))*z+12852786887142270))*z+88713174822554086))*z+465380746310287801))*z+1893794727332540158))*z+6048632140844126955))*z+15246305016292293284))*z+30343742957755160994))*z+47494552424088517202))*z+57967681933801120285))*z+54405084857622353582))*z+38423993253077100612))*z+19727310759634309896))*z+6937800901248814560))*z+1487952715194086400))*z+144984975480576000) := by positivity
 linarith only [he,hp]

theorem central_cert_1_3_trueME10 (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 3 (z+0) 1 true*centralQValueME10 3 (z+0) 3 true ≤
 centralQValueME10 3 (z+0) 2 true^2 := by
 have he : 12573792000*(centralQValueME10 3 (z+0) 2 true^2-
   centralQValueME10 3 (z+0) 1 true*centralQValueME10 3 (z+0) 3 true)=((((((((((((((((((((((((((((((((((((97990024930)*z+5190894184728))*z+128601067660575))*z+1978265826202972))*z+21156496441033890))*z+166882471488414346))*z+1005206031851350525))*z+4722459632161040854))*z+17522421251741530245))*z+51674878055974882874))*z+121278614915681245500))*z+225764863711193445926))*z+330615781148137195795))*z+375527699993732795852))*z+323507482505694597900))*z+203990773265876245248))*z+88688307749551136640))*z+23727667587174835200))*z+2937775617431424000) := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ ((((((((((((((((((((((((((((((((((((97990024930)*z+5190894184728))*z+128601067660575))*z+1978265826202972))*z+21156496441033890))*z+166882471488414346))*z+1005206031851350525))*z+4722459632161040854))*z+17522421251741530245))*z+51674878055974882874))*z+121278614915681245500))*z+225764863711193445926))*z+330615781148137195795))*z+375527699993732795852))*z+323507482505694597900))*z+203990773265876245248))*z+88688307749551136640))*z+23727667587174835200))*z+2937775617431424000) := by positivity
 linarith only [he,hp]

theorem central_low_1ME10 (h k : ℕ) (r : Bool) (hh : h ≤ 3) (hk : 3 ≤ k+h) :
 centralRawME10 h k 1 r*centralRawME10 h k 3 r ≤ centralRawME10 h k 2 r^2 := by
 by_cases ht : centralTME10 h k r < 3
 · rw [central_raw_zeroME10 h k 3 r ht,mul_zero]
   exact sq_nonneg _
 have ht' : 3 ≤ 3*k+h+(if r then 1 else 0) := by simpa [centralTME10] using (Nat.le_of_not_gt ht)
 interval_cases h <;> cases r
 · have hk0 : 3 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_1_0_falseME10 ((k:ℚ)-3) (by
     have hkQ : (3:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-3+3=k := by ring
   rw [hval,←central_raw_castME10 0 k 1 false,←central_raw_castME10 0 k 3 false,←central_raw_castME10 0 k 2 false] at he
   exact_mod_cast he
 · have hk0 : 3 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_1_0_trueME10 ((k:ℚ)-3) (by
     have hkQ : (3:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-3+3=k := by ring
   rw [hval,←central_raw_castME10 0 k 1 true,←central_raw_castME10 0 k 3 true,←central_raw_castME10 0 k 2 true] at he
   exact_mod_cast he
 · have hk0 : 2 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_1_1_falseME10 ((k:ℚ)-2) (by
     have hkQ : (2:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-2+2=k := by ring
   rw [hval,←central_raw_castME10 1 k 1 false,←central_raw_castME10 1 k 3 false,←central_raw_castME10 1 k 2 false] at he
   exact_mod_cast he
 · have hk0 : 2 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_1_1_trueME10 ((k:ℚ)-2) (by
     have hkQ : (2:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-2+2=k := by ring
   rw [hval,←central_raw_castME10 1 k 1 true,←central_raw_castME10 1 k 3 true,←central_raw_castME10 1 k 2 true] at he
   exact_mod_cast he
 · have hk0 : 1 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_1_2_falseME10 ((k:ℚ)-1) (by
     have hkQ : (1:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-1+1=k := by ring
   rw [hval,←central_raw_castME10 2 k 1 false,←central_raw_castME10 2 k 3 false,←central_raw_castME10 2 k 2 false] at he
   exact_mod_cast he
 · have hk0 : 1 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_1_2_trueME10 ((k:ℚ)-1) (by
     have hkQ : (1:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-1+1=k := by ring
   rw [hval,←central_raw_castME10 2 k 1 true,←central_raw_castME10 2 k 3 true,←central_raw_castME10 2 k 2 true] at he
   exact_mod_cast he
 · have hk0 : 0 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_1_3_falseME10 ((k:ℚ)-0) (by
     have hkQ : (0:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-0+0=k := by ring
   rw [hval,←central_raw_castME10 3 k 1 false,←central_raw_castME10 3 k 3 false,←central_raw_castME10 3 k 2 false] at he
   exact_mod_cast he
 · have hk0 : 0 ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_1_3_trueME10 ((k:ℚ)-0) (by
     have hkQ : (0:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-0+0=k := by ring
   rw [hval,←central_raw_castME10 3 k 1 true,←central_raw_castME10 3 k 3 true,←central_raw_castME10 3 k 2 true] at he
   exact_mod_cast he

end
end MathGKM.Markov
