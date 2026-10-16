import MarkovTwoVerticalMDB9
import MarkovTwoReductionM679
/-! Machine-authored db972d62. Exact remaining numerator-two direction and all other sources. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def TwoDiagonalMDB9 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ i j : ℕ,
 rawTwoM679 q i (j+2)*rawTwoM679 q (i+2) j ≤ rawTwoM679 q (i+1) (j+1)^2

theorem two_vertical_arithmeticMDB9 (q : ℕ) (hq : 1 ≤ q) (i j : ℕ) :
 rawTwoM679 q i j*rawTwoM679 q i (j+2) ≤ rawTwoM679 q i (j+1)^2 := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 have h := source_two_vertical_allMDB9 (twoPath3af n) (two_path_labels3af n).1 i j
 rw [two_path_polynomial3af,two_family_coeffM679,two_family_coeffM679,two_family_coeffM679] at h
 exact_mod_cast h

theorem two_remaining_iff_diagonalMDB9 : TwoRemainingM679 ↔ TwoDiagonalMDB9 := by
 constructor
 · intro h q hq; exact (h q hq).2
 · intro h q hq; exact ⟨two_vertical_arithmeticMDB9 q hq,h q hq⟩

theorem root_iff_two_diagonalMDB9 : Conjecture63 ↔ TwoDiagonalMDB9 ∧ OtherSourcesM679 := by
 rw [root_iff_two_arithmeticM679,two_remaining_iff_diagonalMDB9]

def SmallTwoDiagonalMDB9 : Prop := ∀ path : List Bool, (frame path).mid.a=2 →
 ∀ i j : ℕ, i ≤ 2 → coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2

def KernelDiagonalMDB9 : Prop := ∀ i j m : ℕ, 3 ≤ i →
 (∃ q : ℕ, j+m+2=2*q) →
 twoKernelM4F4 i (j+2) m*twoKernelM4F4 (i+2) j (m+2) ≤
 twoKernelM4F4 (i+1) (j+1) (m+1)^2

theorem source_two_diagonal_of_kernelMDB9 (h : KernelDiagonalMDB9)
 (path : List Bool) (ha : (frame path).mid.a=2) (i j : ℕ) (hi : 3 ≤ i) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨q,hq,hb,_⟩ := source_two_squares3556 path ha
 by_cases hj : j+2 ≤ 2*q
 · rw [source_two_kernelM4F4 path q i (j+2) ha hb hi hj,
     source_two_kernelM4F4 path q (i+2) j ha hb (by omega) (by omega),
     source_two_kernelM4F4 path q (i+1) (j+1) ha hb (by omega) (by omega)]
   convert h i j (2*q-j-2) hi ⟨q,by omega⟩ using 1 <;> congr 2 <;> omega
 · rw [source_two_kernel_outsideM4F4 path q i (j+2) ha hb hi (by omega),zero_mul]
   exact sq_nonneg _

theorem kernel_diagonal_of_rootMDB9 (h : Conjecture63) : KernelDiagonalMDB9 := by
 intro i j m hi hq
 obtain ⟨q,hq⟩ := hq
 have hq1 : 1 ≤ q := by omega
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 obtain ⟨ha,hb⟩ := two_path_labels3af n
 have hs := ((global_iff_weak18 (raw_outside_polygon18 (twoPath3af n))).mpr
   (h.2.2 (twoPath3af n))).2.2 i j
 rw [source_two_kernelM4F4 _ (n+1) i (j+2) ha hb hi (by omega),
   source_two_kernelM4F4 _ (n+1) (i+2) j ha hb (by omega) (by omega),
   source_two_kernelM4F4 _ (n+1) (i+1) (j+1) ha hb (by omega) (by omega)] at hs
 convert hs using 1 <;> congr 2 <;> omega

theorem root_iff_kernel_diagonalMDB9 :
 Conjecture63 ↔ KernelDiagonalMDB9 ∧ SmallTwoDiagonalMDB9 ∧ OtherSourcesM679 := by
 constructor
 · intro h
   refine ⟨kernel_diagonal_of_rootMDB9 h,?_,(root_iff_two_diagonalMDB9.mp h).2⟩
   intro path ha i j hi
   exact ((global_iff_weak18 (raw_outside_polygon18 path)).mpr (h.2.2 path)).2.2 i j
 · rintro ⟨hk,hs,ho⟩
   apply root_iff_two_diagonalMDB9.mpr
   refine ⟨?_,ho⟩
   intro q hq i j
   obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
   have h : coeff (frame (twoPath3af n)).mid.p i (j+2)*
       coeff (frame (twoPath3af n)).mid.p (i+2) j ≤
       coeff (frame (twoPath3af n)).mid.p (i+1) (j+1)^2 := by
     by_cases hi : i ≤ 2
     · exact hs _ (two_path_labels3af n).1 i j hi
     · exact source_two_diagonal_of_kernelMDB9 hk _ (two_path_labels3af n).1 i j (by omega)
   rw [two_path_polynomial3af,two_family_coeffM679,two_family_coeffM679,two_family_coeffM679] at h
   exact_mod_cast h
end
end MathGKM.Markov
