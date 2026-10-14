import MarkovPellSum9a72
import MarkovPellSummand9a72
/-! Machine-authored 9a720f77. Exact raw horizontal decomposition.
The summands are individually LC; closure under their sum is NOT asserted. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem coeff_mul_bounded9a72 (P Q : Polynomial ℤ) (r i : ℕ)
 (hQ : ∀ k, r<k → Q.coeff k=0) :
 (P*Q).coeff i=∑ k ∈ Finset.range (r+1),
   if k ≤ i then Q.coeff k*P.coeff (i-k) else 0 := by
 classical
 have hd : Q.natDegree<r+1 := by
   have := Polynomial.natDegree_le_iff_coeff_eq_zero.mpr hQ
   omega
 conv_lhs => rw [Q.as_sum_range' (r+1) hd]
 rw [Finset.mul_sum,Polynomial.finsetSum_coeff]
 apply Finset.sum_congr rfl
 intro k hk
 rw [← Polynomial.C_mul_X_pow_eq_monomial,
   ← mul_assoc,Polynomial.coeff_mul_X_pow']
 split_ifs <;> simp [mul_comm]

theorem right_horizontal_sum9a72 (n i j s : ℕ)
 (hs : s ≤ n) (hij : i+j=n+s+2) :
 coeff (frame (List.replicate n true)).mid.p i j =
 ∑ q ∈ Finset.range (n-s+1), horizontalTerm9a72 (n+1) j q s := by
 classical
 have hdeg : (frame (List.replicate n true)).mid.a+
     (frame (List.replicate n true)).mid.b-1=2*n+2 := by
   rw [(right_labels650 n).1,(right_labels650 n).2]; omega
 have hr : 2*(n-s) ≤ (frame (List.replicate n true)).mid.a+
     (frame (List.replicate n true)).mid.b-1 := by rw [hdeg]; omega
 rw [← diagonal_raw_coeff_on16 (List.replicate n true) (n-s) i j (by rw [hdeg]; omega),
   upper_slice_factor774 _ _ hr,hdeg,
   coeff_mul_bounded9a72 _ _ (n-s) i (quotient_slice_degree725 _ (n-s))]
 rw [← Finset.sum_range_reflect _ (n-s+1)]
 apply Finset.sum_congr rfl
 intro q hq
 have hqr : q ≤ n-s := by have := Finset.mem_range.mp hq; omega
 have he : n-s+1-1-q=n-s-q := by omega
 have he' : n-s-q+q=n-s := by omega
 simp only [he]
 have hc := right_quotient_coeff0618 n (n-s-q) q
 rw [he'] at hc
 have h1 : n-(n-s-q)=s+q := by omega
 have h2 : 2*n+2-2*(n-s)=2*s+2 := by omega
 have h3 : (n+1-q).choose (n-s-q)=(n+1-q).choose (s+1) := by
   rw [← Nat.choose_symm (show n-s-q ≤ n+1-q by omega)]
   congr 1; omega
 simp only [hc,h1,h2,h3,Polynomial.coeff_one_add_X_pow,horizontalTerm9a72]
 by_cases hqi : n-s-q ≤ i
 · rw [if_pos hqi]
   by_cases hqj : q ≤ j
   · rw [if_pos hqj]
     have heq : (2*s+2).choose (i-(n-s-q))=(2*s+2).choose (j-q) := by
       rw [← Nat.choose_symm (show i-(n-s-q) ≤ 2*s+2 by omega)]
       congr 1; omega
     rw [heq]
   · rw [if_neg hqj,Nat.choose_eq_zero_of_lt (show 2*s+2 < i-(n-s-q) by omega),
       Int.natCast_zero,mul_zero]
 · rw [if_neg hqi]
   have hqj : q ≤ j := by omega
   rw [if_pos hqj,Nat.choose_eq_zero_of_lt (show 2*s+2 < j-q by omega),
     Int.natCast_zero,mul_zero]

theorem right_horizontal_sum_fixed9a72 (n i j s : ℕ)
 (hs : s ≤ n) (hij : i+j=n+s+2) :
 coeff (frame (List.replicate n true)).mid.p i j =
 ∑ q ∈ Finset.range (n+2), horizontalTerm9a72 (n+1) j q s := by
 rw [right_horizontal_sum9a72 n i j s hs hij]
 apply Finset.sum_subset (Finset.range_mono (by omega))
 intro q hq hnq
 have hq' : q<n+2 := Finset.mem_range.mp hq
 have hnq' : n-s+1 ≤ q := by simpa using hnq
 have hz : (n+1-q).choose (s+1)=0 := Nat.choose_eq_zero_of_lt (by omega)
 simp only [horizontalTerm9a72,hz,Int.natCast_zero,zero_mul,ite_self]

theorem source_near_one_coeff_sum9a72 (path : List Bool)
 (hb : (frame path).mid.b=(frame path).mid.a+1) (i j : ℕ) :
 coeff (frame path).mid.p i j=pellSum9a72 ((frame path).mid.a-1) i j := by
 obtain ⟨n,rfl⟩ := source_near_one_path650 path hb
 rw [(right_labels650 n).1]
 simpa using right_coeff_sum9a72 n i j

#print axioms coeff_mul_bounded9a72
#print axioms right_horizontal_sum9a72
#print axioms right_horizontal_sum_fixed9a72
#print axioms source_near_one_coeff_sum9a72
end
end MathGKM.Markov
