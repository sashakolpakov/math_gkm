import MarkovPellLowerSum26ca
/-! Machine-authored 26ca8e85. Exact near-lower-edge coefficient polynomials. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem choose_two_rat26ca (n : ℕ) :
 (n.choose 2 : ℚ) = (n:ℚ)*(n-1)/2 := by
 induction n with
 | zero => norm_num
 | succ n ih =>
   rw [Nat.choose_succ_succ]
   push_cast
   rw [ih,Nat.choose_one_right]
   push_cast
   ring

theorem choose_three_rat26ca (n : ℕ) :
 (n.choose 3 : ℚ) = (n:ℚ)*(n-1)*(n-2)/6 := by
 induction n with
 | zero => norm_num
 | succ n ih =>
   rw [Nat.choose_succ_succ]
   push_cast
   rw [ih,choose_two_rat26ca]
   push_cast
   ring

def lowerOne26ca (x y : ℚ) : ℚ := 4*x
def lowerTwo26ca (x y : ℚ) : ℚ :=
 8*x^2*y-8*x^2-8*x*y-8*x+8*y
def lowerThree26ca (x y : ℚ) : ℚ :=
 16/3*x^3*y^2-16*x^3*y+56/3*x^3-16*x^2*y^2+16*x^2+
 104/3*x*y^2-8*x*y+112/3*x-24*y^2-24*y

theorem right_lower_one26ca (n i j : ℕ)
 (hij : i+j=n+2) (hi : 1 ≤ i) (hj : 2 ≤ j) :
 (coeff (frame (List.replicate n true)).mid.p i j : ℚ)=lowerOne26ca i j := by
 have h := congrArg (fun z : ℤ => (z:ℚ))
   (right_lower_sum26ca n i j 0 (by omega) (by omega) hi (by omega))
 norm_num [Finset.sum_range_succ,Nat.choose_one_right] at h
 push_cast [Nat.cast_sub hi] at h
 dsimp [lowerOne26ca]
 linarith

theorem right_lower_two26ca (n i j : ℕ)
 (hij : i+j=n+3) (hi : 2 ≤ i) (hj : 4 ≤ j) :
 (coeff (frame (List.replicate n true)).mid.p i j : ℚ)=lowerTwo26ca i j := by
 have h := congrArg (fun z : ℤ => (z:ℚ))
   (right_lower_sum26ca n i j 1 (by omega) (by omega) hi (by omega))
 norm_num [Finset.sum_range_succ,Nat.choose_one_right] at h
 push_cast at h
 simp only [choose_two_rat26ca] at h
 push_cast [Nat.cast_sub hi,Nat.cast_sub (show 2 ≤ 1+j by omega),
   Nat.cast_sub (show 3 ≤ 1+j by omega),Nat.cast_sub (show 4 ≤ 1+j by omega)] at h
 dsimp [lowerTwo26ca]
 rw [h]
 ring

theorem right_lower_three26ca (n i j : ℕ)
 (hij : i+j=n+4) (hi : 3 ≤ i) (hj : 6 ≤ j) :
 (coeff (frame (List.replicate n true)).mid.p i j : ℚ)=lowerThree26ca i j := by
 have h := congrArg (fun z : ℤ => (z:ℚ))
   (right_lower_sum26ca n i j 2 (by omega) (by omega) hi (by omega))
 norm_num [Finset.sum_range_succ] at h
 push_cast at h
 simp only [choose_two_rat26ca,choose_three_rat26ca] at h
 push_cast [Nat.cast_sub hi,Nat.cast_sub (show 3 ≤ 2+j by omega),
   Nat.cast_sub (show 4 ≤ 2+j by omega),Nat.cast_sub (show 5 ≤ 2+j by omega),
   Nat.cast_sub (show 6 ≤ 2+j by omega)] at h
 norm_num [Nat.choose] at h
 dsimp [lowerThree26ca]
 rw [h]
 ring

#print axioms right_lower_one26ca
#print axioms right_lower_two26ca
#print axioms right_lower_three26ca
end
end MathGKM.Markov
