import MarkovDiagonalRowsMDAB
/-! Machine-authored daba8bcf. Exact positive coefficients, strict support,
and the minimal-denominator coefficient formula. All zero tails retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem diagonalJ_coeffMDAB (d j k : ℕ) :
 (diagonalJMDAB d j).coeff k=
 ((j+3).choose (k+3):ℤ)*((d+j+k+3).choose k:ℤ) := by
 unfold diagonalJMDAB
 rw [rowJ_coeff_allM468]
 rw [show 2*j+1+d-j-1+k+3=d+j+k+3 by omega]

theorem diagonalH_coeffMDAB (d j k : ℕ) :
 (diagonalHMDAB d j).coeff k=
 ((j+3).choose (k+3):ℤ)*((d+j+k+3).choose k:ℤ)+
 4*∑ s ∈ range j, ((j:ℤ)-s)*((s+3).choose (k+3):ℤ)*((d+s+k+3).choose k:ℤ) := by
 rw [diagonalH_positive_sumMDAB]
 simp only [Polynomial.coeff_add,show (4:Polynomial ℤ)=C 4 by norm_num,
   Polynomial.coeff_C_mul,doublePrefixMDAB,Polynomial.finsetSum_coeff,
   diagonalJ_coeffMDAB]
 congr 2
 apply sum_congr rfl
 intro s hs
 ring

theorem diagonalH_coeff_nonnegMDAB (d j k : ℕ) : 0 ≤ (diagonalHMDAB d j).coeff k := by
 rw [diagonalH_coeffMDAB]
 apply add_nonneg (by positivity)
 apply mul_nonneg (by norm_num)
 apply sum_nonneg
 intro s hs
 have hsj : (s:ℤ) ≤ j := by have := mem_range.mp hs; omega
 exact mul_nonneg (mul_nonneg (sub_nonneg.mpr hsj) (by positivity)) (by positivity)

theorem diagonalH_coeff_posMDAB (d j k : ℕ) (hk : k ≤ j) :
 0 < (diagonalHMDAB d j).coeff k := by
 rw [diagonalH_coeffMDAB]
 have h1 : 0 < ((j+3).choose (k+3):ℤ) := by exact_mod_cast Nat.choose_pos (by omega : k+3 ≤ j+3)
 have h2 : 0 < ((d+j+k+3).choose k:ℤ) := by exact_mod_cast Nat.choose_pos (by omega : k ≤ d+j+k+3)
 apply add_pos_of_pos_of_nonneg (mul_pos h1 h2)
 apply mul_nonneg (by norm_num)
 apply sum_nonneg
 intro s hs
 have hsj : (s:ℤ) ≤ j := by have := mem_range.mp hs; omega
 exact mul_nonneg (mul_nonneg (sub_nonneg.mpr hsj) (by positivity)) (by positivity)

theorem rowH_coeff_nonnegMDAB (n j k : ℕ) (hn : 2*j+1 ≤ n) :
 0 ≤ (rowHMFFD n j).coeff k := by
 have h := diagonalH_coeff_nonnegMDAB (n-2*j-1) j k
 simpa only [diagonalHMDAB,show 2*j+1+(n-2*j-1)=n by omega] using h

theorem rowH_coeff_posMDAB (n j k : ℕ) (hn : 2*j+1 ≤ n) (hk : k ≤ j) :
 0 < (rowHMFFD n j).coeff k := by
 have h := diagonalH_coeff_posMDAB (n-2*j-1) j k hk
 simpa only [diagonalHMDAB,show 2*j+1+(n-2*j-1)=n by omega] using h

theorem prefix_chooseMDAB (a b j : ℕ) (hab : a ≤ b) :
 (∑ s ∈ range j, ((s+a).choose b:ℤ))=((j+a).choose (b+1):ℤ) := by
 induction j with
 | zero => simp [Nat.choose_eq_zero_of_lt (by omega : a<b+1)]
 | succ j ih =>
   rw [sum_range_succ,ih]
   have h := Nat.choose_succ_succ (j+a) b
   rw [show j+1+a=(j+a)+1 by omega]
   exact_mod_cast (Nat.add_comm _ _).trans h.symm

theorem weighted_chooseMDAB (a b j : ℕ) (hab : a ≤ b) :
 (∑ s ∈ range j, ((j:ℤ)-s)*((s+a).choose b:ℤ))=
 ((j+a+1).choose (b+2):ℤ) := by
 induction j with
 | zero => simp [Nat.choose_eq_zero_of_lt (by omega : a+1<b+2)]
 | succ j ih =>
   rw [sum_range_succ]
   simp only [Nat.cast_add,Nat.cast_one,add_sub_cancel_left,one_mul]
   have he : (∑ s ∈ range j, ((j:ℤ)+1-s)*((s+a).choose b:ℤ))=
     (∑ s ∈ range j, ((j:ℤ)-s)*((s+a).choose b:ℤ))+
       ∑ s ∈ range j, ((s+a).choose b:ℤ) := by
     rw [←sum_add_distrib]
     apply sum_congr rfl
     intro s hs
     ring
   rw [he,ih,prefix_chooseMDAB a b j hab]
   have h0 : ((j+a).choose (b+1):ℤ)+((j+a).choose b:ℤ)=
     ((j+a+1).choose (b+1):ℤ) := by exact_mod_cast (Nat.add_comm _ _).trans (Nat.choose_succ_succ (j+a) b).symm
   have h1 : ((j+a+1).choose (b+2):ℤ)+((j+a+1).choose (b+1):ℤ)=
     ((j+a+2).choose (b+2):ℤ) := by exact_mod_cast (Nat.add_comm _ _).trans (Nat.choose_succ_succ (j+a+1) (b+1)).symm
   rw [show j+1+a+1=j+a+2 by omega]
   linear_combination h0+h1

theorem diagonalJ_min_coeffMDAB (j k : ℕ) :
 (diagonalJMDAB 0 j).coeff k=
 ((2*k+3).choose k:ℤ)*((j+k+3).choose (2*k+3):ℤ) := by
 rw [diagonalJ_coeffMDAB]
 simp only [Nat.zero_add]
 have h := Nat.choose_mul (n:=j+k+3) (k:=2*k+3) (s:=k) (by omega)
 rw [show j+k+3-k=j+3 by omega,show 2*k+3-k=k+3 by omega] at h
 have hh : (j+3).choose (k+3)*(j+k+3).choose k=
   (2*k+3).choose k*(j+k+3).choose (2*k+3) := by nlinarith [h]
 exact_mod_cast hh

theorem rowH_min_coeffMDAB (j k : ℕ) :
 (rowHMFFD (2*j+1) j).coeff k=
 ((2*k+3).choose k:ℤ)*
   (((j+k+3).choose (2*k+3):ℤ)+4*((j+k+4).choose (2*k+5):ℤ)) := by
 have h := congrArg (fun p : Polynomial ℤ => p.coeff k) (diagonalH_positive_sumMDAB 0 j)
 simp only [diagonalHMDAB,Nat.add_zero,Polynomial.coeff_add,
   show (4:Polynomial ℤ)=C 4 by norm_num,Polynomial.coeff_C_mul,
   doublePrefixMDAB,Polynomial.finsetSum_coeff,diagonalJ_min_coeffMDAB] at h
 have hs : (∑ s ∈ range j, ((j:ℤ)-s)*
     (((2*k+3).choose k:ℤ)*((s+k+3).choose (2*k+3):ℤ)))=
   ((2*k+3).choose k:ℤ)*((j+k+4).choose (2*k+5):ℤ) := by
   have hw := weighted_chooseMDAB (k+3) (2*k+3) j (by omega)
   simp only [show j+(k+3)+1=j+k+4 by omega] at hw
   calc
    _ = ((2*k+3).choose k:ℤ)*∑ s ∈ range j, ((j:ℤ)-s)*((s+(k+3)).choose (2*k+3):ℤ) := by
      rw [mul_sum]
      apply sum_congr rfl
      intro s hss
      rw [show s+(k+3)=s+k+3 by omega]
      ring
    _ = _ := by rw [hw]
 rw [hs] at h
 linear_combination h

end
end MathGKM.Markov
