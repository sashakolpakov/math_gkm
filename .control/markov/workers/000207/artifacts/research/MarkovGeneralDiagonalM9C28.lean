import MarkovGeneralCrossM9C28
import MarkovSourceDiagonalMBEB
/-! Machine-authored request 9c28b628. Exact universal reduction of all high-column
diagonals to three families of explicit masses. Mass inequalities remain OPEN. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem source_low_diagonalM9C28 (c x h : ℕ) (r : Bool)
 (hm : lowMassM9C28 c x h 0 r*lowMassM9C28 c x h 2 r ≤ lowMassM9C28 c x h 1 r^2) :
 threeRawM9E2 (lowQM9C28 c x h r) r (c+3) (lowJM9C28 c x h r+2)*
 threeRawM9E2 (lowQM9C28 c x h r) r (c+5) (lowJM9C28 c x h r) ≤
 threeRawM9E2 (lowQM9C28 c x h r) r (c+4) (lowJM9C28 c x h r+1)^2 := by
 have he := hm
 rw [←source_low_massM9C28 c x h 0 r (by omega),←source_low_massM9C28 c x h 1 r (by omega),
   ←source_low_massM9C28 c x h 2 r (by omega)] at he
 simpa only [Nat.reduceAdd,Nat.reduceSub,Nat.add_zero,show c+1+3=c+4 by omega,show c+2+3=c+5 by omega] using he

theorem source_upper_diagonalM9C28 (c x h : ℕ) (r : Bool)
 (hm : upperMassM9C28 c x h 0 r*upperMassM9C28 c x h 2 r ≤ upperMassM9C28 c x h 1 r^2) :
 threeRawM9E2 (upperQM9C28 c x h r) r (c+3) (upperJM9C28 c x h r+2)*
 threeRawM9E2 (upperQM9C28 c x h r) r (c+5) (upperJM9C28 c x h r) ≤
 threeRawM9E2 (upperQM9C28 c x h r) r (c+4) (upperJM9C28 c x h r+1)^2 := by
 have he := hm
 rw [←source_upper_massM9C28 c x h 0 r (by omega),←source_upper_massM9C28 c x h 1 r (by omega),
   ←source_upper_massM9C28 c x h 2 r (by omega)] at he
 simpa only [Nat.reduceAdd,Nat.reduceSub,Nat.add_zero,show c+1+3=c+4 by omega,show c+2+3=c+5 by omega] using he

theorem source_cross_diagonalM9C28 (c n : ℕ) (s r : Bool)
 (hm : crossMassM9C28 c n 0 s r*crossMassM9C28 c n 2 s r ≤ crossMassM9C28 c n 1 s r^2) :
 threeRawM9E2 (crossQM9C28 c n s r) r (c+3) (crossJM9C28 c n s r+2)*
 threeRawM9E2 (crossQM9C28 c n s r) r (c+5) (crossJM9C28 c n s r) ≤
 threeRawM9E2 (crossQM9C28 c n s r) r (c+4) (crossJM9C28 c n s r+1)^2 := by
 have he := hm
 rw [←source_cross_massM9C28 c n 0 s r (by omega),←source_cross_massM9C28 c n 1 s r (by omega),
   ←source_cross_massM9C28 c n 2 s r (by omega)] at he
 simpa only [Nat.reduceAdd,Nat.reduceSub,Nat.add_zero,show c+1+3=c+4 by omega,show c+2+3=c+5 by omega] using he

def DiagonalMassLCM9C28 : Prop := ∀ c,
 (∀ x h r, lowMassM9C28 c x h 0 r*lowMassM9C28 c x h 2 r ≤ lowMassM9C28 c x h 1 r^2) ∧
 (∀ x h r, upperMassM9C28 c x h 0 r*upperMassM9C28 c x h 2 r ≤ upperMassM9C28 c x h 1 r^2) ∧
 (∀ n s r, crossMassM9C28 c n 0 s r*crossMassM9C28 c n 2 s r ≤ crossMassM9C28 c n 1 s r^2)

theorem source_three_diagonalM9C28 (hm : DiagonalMassLCM9C28)
 (c q j : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r (c+3) (j+2)*threeRawM9E2 q r (c+5) j ≤ threeRawM9E2 q r (c+4) (j+1)^2 := by
 by_cases hl : j+2 ≤ q
 · exact source_lower_diagonalM9F23 q (c+3) j r hl
 by_cases hu : sourceNME9C q r < c+j+q+5
 · exact source_above_diagonalMBEB q (c+3) j r hq (by omega) (by omega)
 let K := sourceNME9C q r-q-c-j-5
 have hK : K+c+j+q+5=sourceNME9C q r := by dsimp [K]; omega
 by_cases hj : j < q+1
 · by_cases he : j=q
   · have hqe : crossQM9C28 c K true r=q := by
       cases r <;> simp [crossQM9C28,sourceNME9C] at * <;> omega
     have hje : crossJM9C28 c K true r=j := by
       cases r <;> simp [crossJM9C28,sourceNME9C] at * <;> omega
     have h := source_cross_diagonalM9C28 c K true r ((hm c).2.2 K true r)
     rwa [hqe,hje] at h
   · have hqe : crossQM9C28 c K false r=q := by
       cases r <;> simp [crossQM9C28,sourceNME9C] at * <;> omega
     have hje : crossJM9C28 c K false r=j := by
       cases r <;> simp [crossJM9C28,sourceNME9C] at * <;> omega
     have h := source_cross_diagonalM9C28 c K false r ((hm c).2.2 K false r)
     rwa [hqe,hje] at h
 · let J := j-q-1
   have hJ : J+q+1=j := by dsimp [J]; omega
   by_cases hc : J<K
   · let h := K-J-1
     have hh : h+J+1=K := by dsimp [h]; omega
     have hqe : lowQM9C28 c J h r=q := by
       cases r <;> simp [lowQM9C28,sourceNME9C] at * <;> omega
     have hje : lowJM9C28 c J h r=j := by
       cases r <;> simp [lowJM9C28,sourceNME9C] at * <;> omega
     have h := source_low_diagonalM9C28 c J h r ((hm c).1 J h r)
     rwa [hqe,hje] at h
   · let h := J-K
     have hh : h+K=J := by dsimp [h]; omega
     have hqe : upperQM9C28 c K h r=q := by
       cases r <;> simp [upperQM9C28,sourceNME9C] at * <;> omega
     have hje : upperJM9C28 c K h r=j := by
       cases r <;> simp [upperJM9C28,sourceNME9C] at * <;> omega
     have h := source_upper_diagonalM9C28 c K h r ((hm c).2.1 K h r)
     rwa [hqe,hje] at h


theorem mass_of_high_diagonalM9C28
 (h : ∀ q : ℕ, 1 ≤ q → ∀ r c j,
   threeRawM9E2 q r (c+3) (j+2)*threeRawM9E2 q r (c+5) j ≤
     threeRawM9E2 q r (c+4) (j+1)^2) : DiagonalMassLCM9C28 := by
 intro c
 refine ⟨?_,?_,?_⟩
 · intro x k r
   have hh := h (lowQM9C28 c x k r) (by cases r <;> simp [lowQM9C28] <;> omega) r c (lowJM9C28 c x k r)
   have he (t : ℕ) (ht : t ≤ 2) := source_low_massM9C28 c x k t r ht
   have h0 := he 0 (by omega)
   have h1 := he 1 (by omega)
   have h2 := he 2 (by omega)
   simp only [Nat.reduceSub,Nat.add_zero,show c+1+3=c+4 by omega,show c+2+3=c+5 by omega] at h0 h1 h2
   rwa [h0,h1,h2] at hh
 · intro x k r
   have hh := h (upperQM9C28 c x k r) (by cases r <;> simp [upperQM9C28] <;> omega) r c (upperJM9C28 c x k r)
   have h0 := source_upper_massM9C28 c x k 0 r (by omega)
   have h1 := source_upper_massM9C28 c x k 1 r (by omega)
   have h2 := source_upper_massM9C28 c x k 2 r (by omega)
   simp only [Nat.reduceSub,Nat.add_zero,show c+1+3=c+4 by omega,show c+2+3=c+5 by omega] at h0 h1 h2
   rwa [h0,h1,h2] at hh
 · intro n s r
   have hh := h (crossQM9C28 c n s r) (by cases s <;> cases r <;> simp [crossQM9C28] <;> omega) r c (crossJM9C28 c n s r)
   have h0 := source_cross_massM9C28 c n 0 s r (by omega)
   have h1 := source_cross_massM9C28 c n 1 s r (by omega)
   have h2 := source_cross_massM9C28 c n 2 s r (by omega)
   simp only [Nat.reduceSub,Nat.add_zero,show c+1+3=c+4 by omega,show c+2+3=c+5 by omega] at h0 h1 h2
   rwa [h0,h1,h2] at hh

theorem mass_iff_high_diagonalM9C28 : DiagonalMassLCM9C28 ↔
 (∀ q : ℕ, 1 ≤ q → ∀ r c j,
   threeRawM9E2 q r (c+3) (j+2)*threeRawM9E2 q r (c+5) j ≤
     threeRawM9E2 q r (c+4) (j+1)^2) :=
 ⟨fun h q hq r c j => source_three_diagonalM9C28 h c q j r hq,
  mass_of_high_diagonalM9C28⟩

end
end MathGKM.Markov
