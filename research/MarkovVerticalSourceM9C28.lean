import MarkovVerticalCertificateM9C28
import MarkovThreeResidualMBEB
/-! Machine-authored request 9c28b628. Exhaustive vertical chamber transport.
The unconditional theorem at the end closes column four for every source. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem vertical_center_onlyM9C28 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i)
 (h0 : correctionValueM13E q r i j=0) (h2 : correctionValueM13E q r i (j+2)=0) :
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2 := by
 have hd : 0 ≤ baseValueM13E q r i (j+1) := by
   unfold baseValueM13E
   split_ifs
   · exact (lower_diag_positiveM9F23 _ _ _).le
   · norm_num
 have he := correction_value_nonnegM13E q i (j+1) r
 have hb := base_verticalMED6 q i j r
 have hh : (threeRawM9E2 q r i j:ℝ)*(threeRawM9E2 q r i (j+2):ℝ) ≤
   (threeRawM9E2 q r i (j+1):ℝ)^2 := by
   rw [source_two_kernelMED6 q i j r hq hi,source_two_kernelMED6 q i (j+1) r hq hi,
     source_two_kernelMED6 q i (j+2) r hq hi,h0,h2]
   nlinarith only [hb,mul_nonneg hd he,sq_nonneg (correctionValueM13E q r i (j+1))]
 exact_mod_cast hh

theorem vlow_verticalM9C28 (c x h : ℕ) (r : Bool) (hc : VerticalMassLCM9C28 c) :
 threeRawM9E2 (lowQM9C28 c x h r) r (c+4) (lowJM9C28 c x h r)*
 threeRawM9E2 (lowQM9C28 c x h r) r (c+4) (lowJM9C28 c x h r+2) ≤
 threeRawM9E2 (lowQM9C28 c x h r) r (c+4) (lowJM9C28 c x h r+1)^2 := by
 have he := hc.1 x h r
 rw [←source_vlow_massM9C28 c x h 0 r (by omega),
   ←source_vlow_massM9C28 c x h 1 r (by omega),
   ←source_vlow_massM9C28 c x h 2 r (by omega)] at he
 simpa only [Nat.add_zero] using he

theorem vupper_verticalM9C28 (c x h : ℕ) (r : Bool) (hc : VerticalMassLCM9C28 c) :
 threeRawM9E2 (vUpperQM9C28 c x h r) r (c+4) (vUpperJM9C28 c x h r)*
 threeRawM9E2 (vUpperQM9C28 c x h r) r (c+4) (vUpperJM9C28 c x h r+2) ≤
 threeRawM9E2 (vUpperQM9C28 c x h r) r (c+4) (vUpperJM9C28 c x h r+1)^2 := by
 have he := hc.2.1 x h r
 rw [←source_vupper_massM9C28 c x h 0 r (by omega),
   ←source_vupper_massM9C28 c x h 1 r (by omega),
   ←source_vupper_massM9C28 c x h 2 r (by omega)] at he
 simpa only [Nat.add_zero] using he

theorem ventry_verticalM9C28 (c n : ℕ) (s r : Bool) (hc : VerticalMassLCM9C28 c) :
 threeRawM9E2 (vEntryQM9C28 c n s r) r (c+4) (vEntryJM9C28 c n s r)*
 threeRawM9E2 (vEntryQM9C28 c n s r) r (c+4) (vEntryJM9C28 c n s r+2) ≤
 threeRawM9E2 (vEntryQM9C28 c n s r) r (c+4) (vEntryJM9C28 c n s r+1)^2 := by
 have he := hc.2.2.1 n s r
 rw [←source_ventry_massM9C28 c n 0 s r (by omega),
   ←source_ventry_massM9C28 c n 1 s r (by omega),
   ←source_ventry_massM9C28 c n 2 s r (by omega)] at he
 simpa only [Nat.add_zero] using he

theorem vexit_verticalM9C28 (c n : ℕ) (s r : Bool) (hc : VerticalMassLCM9C28 c) :
 threeRawM9E2 (vExitQM9C28 c n s r) r (c+4) (vExitJM9C28 c n s r)*
 threeRawM9E2 (vExitQM9C28 c n s r) r (c+4) (vExitJM9C28 c n s r+2) ≤
 threeRawM9E2 (vExitQM9C28 c n s r) r (c+4) (vExitJM9C28 c n s r+1)^2 := by
 have he := hc.2.2.2 n s r
 rw [←source_vexit_massM9C28 c n 0 s r (by omega),
   ←source_vexit_massM9C28 c n 1 s r (by omega),
   ←source_vexit_massM9C28 c n 2 s r (by omega)] at he
 simpa only [Nat.add_zero] using he

theorem source_vertical_of_massM9C28 (c q j : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hc : VerticalMassLCM9C28 c) :
 threeRawM9E2 q r (c+4) j*threeRawM9E2 q r (c+4) (j+2) ≤
 threeRawM9E2 q r (c+4) (j+1)^2 := by
 by_cases hl : j+2 ≤ q
 · exact source_lower_verticalMF88 q (c+4) j r hl
 by_cases hu : sourceNME9C q r < c+4+j+q
 · exact source_above_verticalMED6 q (c+4) j r hq hu
 let K := sourceNME9C q r-q-(c+4)-j
 have hK : K+q+(c+4)+j=sourceNME9C q r := by dsimp [K]; omega
 by_cases hj : j<q+1
 · by_cases hend : c+4+(j+2)+q ≤ sourceNME9C q r
   · let n := K-2
     have hn : n+2=K := by dsimp [n]; omega
     by_cases he : j=q
     · have hqe : vEntryQM9C28 c n true r=q := by
         cases r <;> simp [vEntryQM9C28,sourceNME9C] at * <;> omega
       have hje : vEntryJM9C28 c n true r=j := by
         cases r <;> simp [vEntryJM9C28,sourceNME9C] at * <;> omega
       have h := ventry_verticalM9C28 c n true r hc
       rwa [hqe,hje] at h
     · have hqe : vEntryQM9C28 c n false r=q := by
         cases r <;> simp [vEntryQM9C28,sourceNME9C] at * <;> omega
       have hje : vEntryJM9C28 c n false r=j := by
         cases r <;> simp [vEntryJM9C28,sourceNME9C] at * <;> omega
       have h := ventry_verticalM9C28 c n false r hc
       rwa [hqe,hje] at h
   · apply vertical_center_onlyM9C28 q (c+4) j r hq (by omega)
     · simp only [correctionValueM13E,if_neg (show ¬(q+1 ≤ j ∧ c+4+j+q ≤ sourceNME9C q r) by omega)]
     · exact correction_zero_aboveMED6 q (c+4) (j+2) r (by omega)
 · let J := j-q-1
   have hJ : J+q+1=j := by dsimp [J]; omega
   by_cases hk : K<2
   · by_cases he : K=0
     · have hqe : vExitQM9C28 c J false r=q := by
         cases r <;> simp [vExitQM9C28,sourceNME9C] at * <;> omega
       have hje : vExitJM9C28 c J false r=j := by
         cases r <;> simp [vExitJM9C28,sourceNME9C] at * <;> omega
       have h := vexit_verticalM9C28 c J false r hc
       rwa [hqe,hje] at h
     · have hqe : vExitQM9C28 c J true r=q := by
         cases r <;> simp [vExitQM9C28,sourceNME9C] at * <;> omega
       have hje : vExitJM9C28 c J true r=j := by
         cases r <;> simp [vExitJM9C28,sourceNME9C] at * <;> omega
       have h := vexit_verticalM9C28 c J true r hc
       rwa [hqe,hje] at h
   · by_cases hjk : J+2 ≤ K
     · let h := K-J-2
       have hh : J+2+h=K := by dsimp [h]; omega
       have hqe : lowQM9C28 c J h r=q := by
         cases r <;> simp [lowQM9C28,sourceNME9C] at * <;> omega
       have hje : lowJM9C28 c J h r=j := by
         cases r <;> simp [lowJM9C28,sourceNME9C] at * <;> omega
       have h := vlow_verticalM9C28 c J h r hc
       rwa [hqe,hje] at h
     · let x := K-2
       let h := J+1-K
       have hx : x+2=K := by dsimp [x]; omega
       have hh : x+1+h=J := by dsimp [h]; omega
       have hqe : vUpperQM9C28 c x h r=q := by
         cases r <;> simp [vUpperQM9C28,sourceNME9C] at * <;> omega
       have hje : vUpperJM9C28 c x h r=j := by
         cases r <;> simp [vUpperJM9C28,sourceNME9C] at * <;> omega
       have h := vupper_verticalM9C28 c x h r hc
       rwa [hqe,hje] at h

theorem source_four_verticalM9C28 (q j : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r 4 j*threeRawM9E2 q r 4 (j+2) ≤ threeRawM9E2 q r 4 (j+1)^2 :=
 source_vertical_of_massM9C28 0 q j r hq vertical_mass_zeroM9C28

theorem path_four_verticalM9C28 (path : List Bool) (ha : (frame path).mid.a=3) (j : ℕ) :
 coeff (frame path).mid.p 4 j*coeff (frame path).mid.p 4 (j+2) ≤
 coeff (frame path).mid.p 4 (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 simp only [hp]
 exact source_four_verticalM9C28 q j r hq

end
end MathGKM.Markov

