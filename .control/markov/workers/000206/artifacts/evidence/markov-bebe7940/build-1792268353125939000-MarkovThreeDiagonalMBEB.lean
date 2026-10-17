import MarkovCrossCertificateMBEB
import MarkovSourceDiagonalMBEB
/-! Machine-authored bebe7940. Complete raw diagonal starting at column three
for every numerator-three source, with correction-entry crossings and zeros. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem source_low_diagonalMBEB (x h : ℕ) (r : Bool) :
 threeRawM9E2 (lowQMBEB x h r) r 3 (lowJMBEB x h r+2)*
 threeRawM9E2 (lowQMBEB x h r) r 5 (lowJMBEB x h r) ≤
 threeRawM9E2 (lowQMBEB x h r) r 4 (lowJMBEB x h r+1)^2 := by
 have he := low_mass_lcMBEB x h r
 rw [←source_low_massMBEB x h 0 r (by omega),←source_low_massMBEB x h 1 r (by omega),
   ←source_low_massMBEB x h 2 r (by omega)] at he
 simpa only [Nat.reduceAdd,Nat.reduceSub,Nat.add_zero] using he

theorem source_upper_diagonalMBEB (x h : ℕ) (r : Bool) :
 threeRawM9E2 (upperQMBEB x h r) r 3 (upperJMBEB x h r+2)*
 threeRawM9E2 (upperQMBEB x h r) r 5 (upperJMBEB x h r) ≤
 threeRawM9E2 (upperQMBEB x h r) r 4 (upperJMBEB x h r+1)^2 := by
 have he := upper_mass_lcMBEB x h r
 rw [←source_upper_massMBEB x h 0 r (by omega),←source_upper_massMBEB x h 1 r (by omega),
   ←source_upper_massMBEB x h 2 r (by omega)] at he
 simpa only [Nat.reduceAdd,Nat.reduceSub,Nat.add_zero] using he

theorem source_cross_diagonalMBEB (n : ℕ) (s r : Bool) :
 threeRawM9E2 (crossQMBEB n s r) r 3 (crossJMBEB n s r+2)*
 threeRawM9E2 (crossQMBEB n s r) r 5 (crossJMBEB n s r) ≤
 threeRawM9E2 (crossQMBEB n s r) r 4 (crossJMBEB n s r+1)^2 := by
 have he := cross_mass_lcMBEB n s r
 rw [←source_cross_massMBEB n 0 s r (by omega),←source_cross_massMBEB n 1 s r (by omega),
   ←source_cross_massMBEB n 2 s r (by omega)] at he
 simpa only [Nat.reduceAdd,Nat.reduceSub,Nat.add_zero] using he

theorem source_three_diagonalMBEB (q j : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r 3 (j+2)*threeRawM9E2 q r 5 j ≤ threeRawM9E2 q r 4 (j+1)^2 := by
 by_cases hl : j+2 ≤ q
 · exact source_lower_diagonalM9F23 q 3 j r hl
 by_cases hu : sourceNME9C q r < j+q+5
 · exact source_above_diagonalMBEB q 3 j r hq (by omega) (by omega)
 let K := sourceNME9C q r-q-j-5
 have hK : K+j+q+5=sourceNME9C q r := by dsimp [K]; omega
 by_cases hj : j < q+1
 · by_cases he : j=q
   · have hqe : crossQMBEB K true r=q := by
       cases r <;> simp [crossQMBEB,sourceNME9C] at * <;> omega
     have hje : crossJMBEB K true r=j := by
       cases r <;> simp [crossJMBEB,sourceNME9C] at * <;> omega
     have h := source_cross_diagonalMBEB K true r
     rwa [hqe,hje] at h
   · have hqe : crossQMBEB K false r=q := by
       cases r <;> simp [crossQMBEB,sourceNME9C] at * <;> omega
     have hje : crossJMBEB K false r=j := by
       cases r <;> simp [crossJMBEB,sourceNME9C] at * <;> omega
     have h := source_cross_diagonalMBEB K false r
     rwa [hqe,hje] at h
 · let J := j-q-1
   have hJ : J+q+1=j := by dsimp [J]; omega
   by_cases hc : J<K
   · let h := K-J-1
     have hh : h+J+1=K := by dsimp [h]; omega
     have hqe : lowQMBEB J h r=q := by
       cases r <;> simp [lowQMBEB,sourceNME9C] at * <;> omega
     have hje : lowJMBEB J h r=j := by
       cases r <;> simp [lowJMBEB,sourceNME9C] at * <;> omega
     have h := source_low_diagonalMBEB J h r
     rwa [hqe,hje] at h
   · let h := J-K
     have hh : h+K=J := by dsimp [h]; omega
     have hqe : upperQMBEB K h r=q := by
       cases r <;> simp [upperQMBEB,sourceNME9C] at * <;> omega
     have hje : upperJMBEB K h r=j := by
       cases r <;> simp [upperJMBEB,sourceNME9C] at * <;> omega
     have h := source_upper_diagonalMBEB K h r
     rwa [hqe,hje] at h

theorem path_three_diagonalMBEB (path : List Bool) (ha : (frame path).mid.a=3) (j : ℕ) :
 coeff (frame path).mid.p 3 (j+2)*coeff (frame path).mid.p 5 j ≤
 coeff (frame path).mid.p 4 (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 simp only [hp]
 exact source_three_diagonalMBEB q j r hq

end
end MathGKM.Markov
