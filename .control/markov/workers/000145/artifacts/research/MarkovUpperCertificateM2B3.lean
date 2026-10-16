import MarkovUpperReductionM2B3
/-! Machine-authored 2b34268b. Exact finite summand criterion, with its
unproved global sign hypothesis explicitly retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

def upperTermM2B3 (N d i h : ℕ) : ℤ :=
 if i=0 ∨ i < h then 0 else
 ((2*d+h-1).choose h:ℤ)*((2*i-2-h).choose (i-h):ℤ)*
 (((N+i-h+1).choose (2*i-1-h):ℤ)+((N+i-h).choose (2*i-1-h):ℤ))

theorem upper_term_nonnegM2B3 (N d i h : ℕ) : 0 ≤ upperTermM2B3 N d i h := by
 unfold upperTermM2B3
 split_ifs <;> positivity

theorem upper_term_highM2B3 (N d i h : ℕ) (hh : i < h) : upperTermM2B3 N d i h=0 := by
 simp [upperTermM2B3,hh]

theorem upper_term_sumM2B3 (N d i n : ℕ) (hi : i ≤ n) :
 (∑ h∈range (n+1),upperTermM2B3 N d i h)=upperValM2B3 N d i := by
 have hs : (∑ h∈range (i+1),upperTermM2B3 N d i h)=
     ∑ h∈range (n+1),upperTermM2B3 N d i h := by
   apply sum_subset (range_mono (by omega : i+1 ≤ n+1))
   intro h hh hn
   exact upper_term_highM2B3 N d i h (by simp only [mem_range,not_lt] at hn; omega)
 rw [←hs]
 by_cases hi0 : i=0
 · simp [upperValM2B3,upperTermM2B3,hi0]
 · unfold upperValM2B3
   rw [if_neg hi0]
   apply sum_congr rfl
   intro h hh
   simp [upperTermM2B3,hi0,show ¬i < h by have := mem_range.mp hh; omega]

theorem upper_lc_of_shiftedM2B3 (N d i : ℕ)
 (h : ∀ x y, upperTermM2B3 N d i x*upperTermM2B3 N d (i+2) y ≤
   upperTermM2B3 N d (i+1) (min (x+1) y)*
   upperTermM2B3 N d (i+1) (max (x+1) y-1)) :
 upperValM2B3 N d i*upperValM2B3 N d (i+2) ≤ upperValM2B3 N d (i+1)^2 := by
 have hs := shifted_sumMAF6 (upperTermM2B3 N d i) (upperTermM2B3 N d (i+1))
   (upperTermM2B3 N d (i+2)) (i+2)
   (upper_term_nonnegM2B3 N d i) (upper_term_nonnegM2B3 N d (i+1))
   (upper_term_nonnegM2B3 N d (i+2))
   (upper_term_highM2B3 _ _ _ _ (by omega)) (upper_term_highM2B3 _ _ _ _ (by omega)) h
 simpa only [upper_term_sumM2B3 _ _ _ _ (by omega : i ≤ i+2),
   upper_term_sumM2B3 _ _ _ _ (by omega : i+1 ≤ i+2),
   upper_term_sumM2B3 _ _ _ _ (by omega : i+2 ≤ i+2)] using hs

def UpperShiftedM2B3 : Prop := ∀ N d i x y : ℕ, 1 ≤ N → 1 ≤ d →
 upperTermM2B3 N d i x*upperTermM2B3 N d (i+2) y ≤
 upperTermM2B3 N d (i+1) (min (x+1) y)*
 upperTermM2B3 N d (i+1) (max (x+1) y-1)

theorem upper_shifted_implies_horizontalM2B3 (h : UpperShiftedM2B3) :
 NumeratorTwoHorizontalM2B3 := by
 apply numerator_two_horizontal_iffM2B3.mpr
 intro N d i hN hd
 exact upper_lc_of_shiftedM2B3 N d i (fun x y => h N d i x y hN hd)

end
end MathGKM.Markov
