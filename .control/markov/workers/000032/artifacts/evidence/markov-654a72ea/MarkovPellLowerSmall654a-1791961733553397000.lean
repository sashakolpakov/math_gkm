import MarkovPellLowerLC654a
import MarkovSecondHorizontal8934
/-! Machine-authored 654a72ea. Boundary completion for the first lower band. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem right_sum_j654a (n i j s : ℕ) (hs : s ≤ n)
 (hij : i+j=n+s+2) (hj : j ≤ n+1) :
 coeff (frame (List.replicate n true)).mid.p i j =
 ∑ q ∈ Finset.range (j+1),
   (((n+1-q).choose (s+1) : ℤ)*((s+q).choose q : ℤ)*
     ((2*s+2).choose (j-q) : ℤ)) := by
 rw [right_horizontal_sum_fixed9a72 n i j s hs hij]
 have he : (∑ q ∈ Finset.range (n+2), horizontalTerm9a72 (n+1) j q s) =
     ∑ q ∈ Finset.range (j+1), horizontalTerm9a72 (n+1) j q s := by
   symm
   apply Finset.sum_subset (Finset.range_mono (by omega))
   intro q hq hnq
   have hqj : ¬ q ≤ j := by simpa using hnq
   simp [horizontalTerm9a72,hqj]
 rw [he]
 apply Finset.sum_congr rfl
 intro q hq
 simp [horizontalTerm9a72,show q ≤ j by have := Finset.mem_range.mp hq; omega]


theorem lower_h_3_654a (k : ℕ) :
 coeff (frame (List.replicate (k+2) true)).mid.p ((k+1)+0) 3*coeff (frame (List.replicate (k+2) true)).mid.p ((k+1)+2) 3 ≤ coeff (frame (List.replicate (k+2) true)).mid.p ((k+1)+1) 3^2 := by
 have e0 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+2) ((k+1)+0) 3 0 (by omega) (by omega) (by omega))
 have e1 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+2) ((k+1)+1) 3 1 (by omega) (by omega) (by omega))
 have e2 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+2) ((k+1)+2) 3 2 (by omega) (by omega) (by omega))
 norm_num [Finset.sum_range_succ,Nat.choose_one_right] at e0 e1 e2
 push_cast at e0 e1 e2
 simp only [choose_two_rat26ca,choose_three_rat26ca] at e0 e1 e2
 have en1 : k+3- 1=k+2 := by omega
 have en2 : k+3- 2=k+1 := by omega
 have en3 : k+3- 3=k+0 := by omega
 norm_num [en1,en2,en3] at e0 e1 e2
 norm_num [Nat.choose] at e0 e1 e2
 have hh : (0:ℚ) ≤ (coeff (frame (List.replicate (k+2) true)).mid.p ((k+1)+1) 3 : ℚ)^2-(coeff (frame (List.replicate (k+2) true)).mid.p ((k+1)+0) 3 : ℚ)*(coeff (frame (List.replicate (k+2) true)).mid.p ((k+1)+2) 3 : ℚ) := by
  rw [e0,e1,e2]
  ring_nf
  positivity
 exact_mod_cast (sub_nonneg.mp hh)
#print axioms lower_h_3_654a

theorem lower_h_4_654a (k : ℕ) :
 coeff (frame (List.replicate (k+3) true)).mid.p ((k+1)+0) 4*coeff (frame (List.replicate (k+3) true)).mid.p ((k+1)+2) 4 ≤ coeff (frame (List.replicate (k+3) true)).mid.p ((k+1)+1) 4^2 := by
 have e0 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+3) ((k+1)+0) 4 0 (by omega) (by omega) (by omega))
 have e1 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+3) ((k+1)+1) 4 1 (by omega) (by omega) (by omega))
 have e2 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+3) ((k+1)+2) 4 2 (by omega) (by omega) (by omega))
 norm_num [Finset.sum_range_succ,Nat.choose_one_right] at e0 e1 e2
 push_cast at e0 e1 e2
 simp only [choose_two_rat26ca,choose_three_rat26ca] at e0 e1 e2
 have en1 : k+4- 1=k+3 := by omega
 have en2 : k+4- 2=k+2 := by omega
 have en3 : k+4- 3=k+1 := by omega
 have en4 : k+4- 4=k+0 := by omega
 norm_num [en1,en2,en3,en4] at e0 e1 e2
 norm_num [Nat.choose] at e0 e1 e2
 have hh : (0:ℚ) ≤ (coeff (frame (List.replicate (k+3) true)).mid.p ((k+1)+1) 4 : ℚ)^2-(coeff (frame (List.replicate (k+3) true)).mid.p ((k+1)+0) 4 : ℚ)*(coeff (frame (List.replicate (k+3) true)).mid.p ((k+1)+2) 4 : ℚ) := by
  rw [e0,e1,e2]
  ring_nf
  positivity
 exact_mod_cast (sub_nonneg.mp hh)
#print axioms lower_h_4_654a

theorem lower_h_5_654a (k : ℕ) :
 coeff (frame (List.replicate (k+4) true)).mid.p ((k+1)+0) 5*coeff (frame (List.replicate (k+4) true)).mid.p ((k+1)+2) 5 ≤ coeff (frame (List.replicate (k+4) true)).mid.p ((k+1)+1) 5^2 := by
 have e0 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+4) ((k+1)+0) 5 0 (by omega) (by omega) (by omega))
 have e1 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+4) ((k+1)+1) 5 1 (by omega) (by omega) (by omega))
 have e2 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+4) ((k+1)+2) 5 2 (by omega) (by omega) (by omega))
 norm_num [Finset.sum_range_succ,Nat.choose_one_right] at e0 e1 e2
 push_cast at e0 e1 e2
 simp only [choose_two_rat26ca,choose_three_rat26ca] at e0 e1 e2
 have en1 : k+5- 1=k+4 := by omega
 have en2 : k+5- 2=k+3 := by omega
 have en3 : k+5- 3=k+2 := by omega
 have en4 : k+5- 4=k+1 := by omega
 have en5 : k+5- 5=k+0 := by omega
 norm_num [en1,en2,en3,en4,en5] at e0 e1 e2
 norm_num [Nat.choose] at e0 e1 e2
 have hh : (0:ℚ) ≤ (coeff (frame (List.replicate (k+4) true)).mid.p ((k+1)+1) 5 : ℚ)^2-(coeff (frame (List.replicate (k+4) true)).mid.p ((k+1)+0) 5 : ℚ)*(coeff (frame (List.replicate (k+4) true)).mid.p ((k+1)+2) 5 : ℚ) := by
  rw [e0,e1,e2]
  ring_nf
  positivity
 exact_mod_cast (sub_nonneg.mp hh)
#print axioms lower_h_5_654a

theorem lower_v_0_654a (k : ℕ) :
 coeff (frame (List.replicate (k+2) true)).mid.p (k+4) 0*coeff (frame (List.replicate (k+2) true)).mid.p (k+4) 2 ≤ coeff (frame (List.replicate (k+2) true)).mid.p (k+4) 1^2 := by
 have e0 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+2) (k+4) 0 0 (by omega) (by omega) (by omega))
 have e1 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+2) (k+4) 1 1 (by omega) (by omega) (by omega))
 have e2 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+2) (k+4) 2 2 (by omega) (by omega) (by omega))
 norm_num [Finset.sum_range_succ,Nat.choose_one_right] at e0 e1 e2
 push_cast at e0 e1 e2
 simp only [choose_two_rat26ca,choose_three_rat26ca] at e0 e1 e2
 have en1 : k+3- 1=k+2 := by omega
 have en2 : k+3- 2=k+1 := by omega
 norm_num [en1,en2] at e0 e1 e2
 norm_num [Nat.choose] at e0 e1 e2
 have hh : (0:ℚ) ≤ (coeff (frame (List.replicate (k+2) true)).mid.p (k+4) 1 : ℚ)^2-(coeff (frame (List.replicate (k+2) true)).mid.p (k+4) 0 : ℚ)*(coeff (frame (List.replicate (k+2) true)).mid.p (k+4) 2 : ℚ) := by
  rw [e0,e1,e2]
  ring_nf
  positivity
 exact_mod_cast (sub_nonneg.mp hh)
#print axioms lower_v_0_654a

theorem lower_v_1_654a (k : ℕ) :
 coeff (frame (List.replicate (k+2) true)).mid.p (k+3) 1*coeff (frame (List.replicate (k+2) true)).mid.p (k+3) 3 ≤ coeff (frame (List.replicate (k+2) true)).mid.p (k+3) 2^2 := by
 have e0 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+2) (k+3) 1 0 (by omega) (by omega) (by omega))
 have e1 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+2) (k+3) 2 1 (by omega) (by omega) (by omega))
 have e2 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+2) (k+3) 3 2 (by omega) (by omega) (by omega))
 norm_num [Finset.sum_range_succ,Nat.choose_one_right] at e0 e1 e2
 push_cast at e0 e1 e2
 simp only [choose_two_rat26ca,choose_three_rat26ca] at e0 e1 e2
 have en1 : k+3- 1=k+2 := by omega
 have en2 : k+3- 2=k+1 := by omega
 have en3 : k+3- 3=k+0 := by omega
 norm_num [en1,en2,en3] at e0 e1 e2
 norm_num [Nat.choose] at e0 e1 e2
 have hh : (0:ℚ) ≤ (coeff (frame (List.replicate (k+2) true)).mid.p (k+3) 2 : ℚ)^2-(coeff (frame (List.replicate (k+2) true)).mid.p (k+3) 1 : ℚ)*(coeff (frame (List.replicate (k+2) true)).mid.p (k+3) 3 : ℚ) := by
  rw [e0,e1,e2]
  ring_nf
  positivity
 exact_mod_cast (sub_nonneg.mp hh)
#print axioms lower_v_1_654a

theorem lower_v_2_654a (k : ℕ) :
 coeff (frame (List.replicate (k+3) true)).mid.p (k+3) 2*coeff (frame (List.replicate (k+3) true)).mid.p (k+3) 4 ≤ coeff (frame (List.replicate (k+3) true)).mid.p (k+3) 3^2 := by
 have e0 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+3) (k+3) 2 0 (by omega) (by omega) (by omega))
 have e1 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+3) (k+3) 3 1 (by omega) (by omega) (by omega))
 have e2 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+3) (k+3) 4 2 (by omega) (by omega) (by omega))
 norm_num [Finset.sum_range_succ,Nat.choose_one_right] at e0 e1 e2
 push_cast at e0 e1 e2
 simp only [choose_two_rat26ca,choose_three_rat26ca] at e0 e1 e2
 have en1 : k+4- 1=k+3 := by omega
 have en2 : k+4- 2=k+2 := by omega
 have en3 : k+4- 3=k+1 := by omega
 have en4 : k+4- 4=k+0 := by omega
 norm_num [en1,en2,en3,en4] at e0 e1 e2
 norm_num [Nat.choose] at e0 e1 e2
 have hh : (0:ℚ) ≤ (coeff (frame (List.replicate (k+3) true)).mid.p (k+3) 3 : ℚ)^2-(coeff (frame (List.replicate (k+3) true)).mid.p (k+3) 2 : ℚ)*(coeff (frame (List.replicate (k+3) true)).mid.p (k+3) 4 : ℚ) := by
  rw [e0,e1,e2]
  ring_nf
  positivity
 exact_mod_cast (sub_nonneg.mp hh)
#print axioms lower_v_2_654a

theorem lower_v_3_654a (k : ℕ) :
 coeff (frame (List.replicate (k+4) true)).mid.p (k+3) 3*coeff (frame (List.replicate (k+4) true)).mid.p (k+3) 5 ≤ coeff (frame (List.replicate (k+4) true)).mid.p (k+3) 4^2 := by
 have e0 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+4) (k+3) 3 0 (by omega) (by omega) (by omega))
 have e1 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+4) (k+3) 4 1 (by omega) (by omega) (by omega))
 have e2 := congrArg (fun z : ℤ => (z:ℚ)) (right_sum_j654a (k+4) (k+3) 5 2 (by omega) (by omega) (by omega))
 norm_num [Finset.sum_range_succ,Nat.choose_one_right] at e0 e1 e2
 push_cast at e0 e1 e2
 simp only [choose_two_rat26ca,choose_three_rat26ca] at e0 e1 e2
 have en1 : k+5- 1=k+4 := by omega
 have en2 : k+5- 2=k+3 := by omega
 have en3 : k+5- 3=k+2 := by omega
 have en4 : k+5- 4=k+1 := by omega
 have en5 : k+5- 5=k+0 := by omega
 norm_num [en1,en2,en3,en4,en5] at e0 e1 e2
 norm_num [Nat.choose] at e0 e1 e2
 have hh : (0:ℚ) ≤ (coeff (frame (List.replicate (k+4) true)).mid.p (k+3) 4 : ℚ)^2-(coeff (frame (List.replicate (k+4) true)).mid.p (k+3) 3 : ℚ)*(coeff (frame (List.replicate (k+4) true)).mid.p (k+3) 5 : ℚ) := by
  rw [e0,e1,e2]
  ring_nf
  positivity
 exact_mod_cast (sub_nonneg.mp hh)
#print axioms lower_v_3_654a

end
end MathGKM.Markov
