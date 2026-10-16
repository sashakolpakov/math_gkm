import MarkovPositiveRowsMDAB
/-! Machine-authored daba8bcf. Positive two-binomial sum for every raw
coefficient on every numerator-three lower source row. No normalization. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem lower_row_positive_coeffMDAB (n j t : ℕ) (hn : 2*j+1 ≤ n) :
 (lowerRowMFFD n j).coeff (t+3)=
 ((n-j-1).choose t:ℤ)*((t+j+3).choose j:ℤ)+
 4*∑ s ∈ range j, ((j:ℤ)-s)*((n-2*j+s-1).choose t:ℤ)*((t+s+3).choose s:ℤ) := by
 unfold lowerRowMFFD
 rw [Polynomial.coeff_X_pow_mul',if_pos (by omega),Nat.add_sub_cancel,
   rowH_positive_sumMDAB n j hn,mul_add,Polynomial.coeff_add,
   rowJ_factor_coeffMFFD n j t hn]
 have he : (X+1)^(n-2*j-1)*(4*∑ s ∈ range j, C ((j:ℤ)-s)*rowJMFFD (n-2*j+2*s) s)=
   C 4*∑ s ∈ range j, C ((j:ℤ)-s)*
     ((X+1)^(n-2*j-1)*rowJMFFD (n-2*j+2*s) s) := by
   simp only [mul_sum]
   apply sum_congr rfl
   intro s hs
   norm_num only [map_ofNat]
   ring
 rw [he,Polynomial.coeff_C_mul,Polynomial.finsetSum_coeff]
 congr 2
 apply sum_congr rfl
 intro s hs
 have hsj := mem_range.mp hs
 have hns : 2*s+1 ≤ n-2*j+2*s := by omega
 rw [Polynomial.coeff_C_mul,show n-2*j-1=(n-2*j+2*s)-2*s-1 by omega,
   rowJ_factor_coeffMFFD _ s t hns,
   show n-2*j+2*s-s-1=n-2*j+s-1 by omega]
 ring

theorem source_lower_positive_coeffMDAB (q j t : ℕ) (r : Bool) (hj : j ≤ q) :
 threeRawM9E2 q r (t+3) j=
 ((sourceNME9C q r-j-1).choose t:ℤ)*((t+j+3).choose j:ℤ)+
 4*∑ s ∈ range j, ((j:ℤ)-s)*((sourceNME9C q r-2*j+s-1).choose t:ℤ)*
   ((t+s+3).choose s:ℤ) := by
 rw [source_lower_rowMFFD q (t+3) j r hj]
 apply lower_row_positive_coeffMDAB
 unfold sourceNME9C
 split_ifs <;> omega

theorem source_lower_low_zeroMDAB (q i j : ℕ) (r : Bool) (hj : j ≤ q) (hi : i<3) :
 threeRawM9E2 q r i j=0 := by
 rw [source_lower_rowMFFD q i j r hj]
 unfold lowerRowMFFD
 rw [Polynomial.coeff_X_pow_mul',if_neg (by omega)]

theorem source_lower_positiveMDAB (q j t : ℕ) (r : Bool) (hj : j ≤ q)
 (ht : t+j+1 ≤ sourceNME9C q r) : 0 < threeRawM9E2 q r (t+3) j := by
 rw [source_lower_positive_coeffMDAB q j t r hj]
 have h1 : 0 < ((sourceNME9C q r-j-1).choose t:ℤ) := by
   exact_mod_cast Nat.choose_pos (by omega : t ≤ sourceNME9C q r-j-1)
 have h2 : 0 < ((t+j+3).choose j:ℤ) := by
   exact_mod_cast Nat.choose_pos (by omega : j ≤ t+j+3)
 apply add_pos_of_pos_of_nonneg (mul_pos h1 h2)
 apply mul_nonneg (by norm_num)
 apply sum_nonneg
 intro s hs
 have hsj : (s:ℤ) ≤ j := by have := mem_range.mp hs; omega
 exact mul_nonneg (mul_nonneg (sub_nonneg.mpr hsj) (by positivity)) (by positivity)

theorem source_lower_positive_pathMDAB (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ j t, j ≤ q → t+j+1 ≤ sourceNME9C q r → 0 < coeff (frame path).mid.p (t+3) j := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro j t hj ht
 rw [hp]
 exact source_lower_positiveMDAB q j t r hj ht

theorem source_lower_polygon_posMDAB (q i j : ℕ) (r : Bool) (hj : j ≤ q)
 (hp : InPolygon 3 (sourceNME9C q r) i j) : 0 < threeRawM9E2 q r i j := by
 have hi : 3 ≤ i := by
   by_contra h
   have hm := Nat.mul_le_mul_left (sourceNME9C q r) (show i ≤ 2 by omega)
   unfold InPolygon sourceNME9C at hp
   unfold sourceNME9C at hm
   split_ifs at hp hm <;> nlinarith [hp.1]
 obtain ⟨t,rfl⟩ := Nat.exists_eq_add_of_le hi
 rw [show 3+t=t+3 by omega] at hp ⊢
 exact source_lower_positiveMDAB q j t r hj (by
   have hu := hp.2
   unfold sourceNME9C at hu ⊢
   split_ifs at hu ⊢ <;> omega)

theorem source_lower_tail_zeroMDAB (q j t : ℕ) (r : Bool) (hj : j ≤ q)
 (ht : sourceNME9C q r < t+j+1) : threeRawM9E2 q r (t+3) j=0 := by
 have hn : 2*j+1 ≤ sourceNME9C q r := by unfold sourceNME9C; split_ifs <;> omega
 rw [source_lower_positive_coeffMDAB q j t r hj,
   Nat.choose_eq_zero_of_lt (by omega : sourceNME9C q r-j-1<t)]
 simp only [Nat.cast_zero,zero_mul,zero_add]
 have hs : (∑ s ∈ range j, ((j:ℤ)-s)*((sourceNME9C q r-2*j+s-1).choose t:ℤ)*
   ((t+s+3).choose s:ℤ))=0 := by
   apply sum_eq_zero
   intro s hs
   have hsj := mem_range.mp hs
   rw [Nat.choose_eq_zero_of_lt (by omega : sourceNME9C q r-2*j+s-1<t)]
   simp
 rw [hs,mul_zero]

end
end MathGKM.Markov
