import MarkovPellRawLC0618
/-! Machine-authored request 9a720f77. An exact positive binomial-sum formula
for every raw Pell coefficient, including all zero and out-of-polygon cases. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def pellSum9a72 (n i j : ℕ) : ℤ :=
 if n+1 ≤ i+j ∧ i+j ≤ 2*n+2 then
   let r := 2*n+2-(i+j)
   ∑ k ∈ Finset.range (i+1), if k ≤ r then
     ((2*n+2-2*r).choose (i-k) : ℤ)*
       ((n+1-(r-k)).choose k : ℤ)*((n-k).choose (r-k) : ℤ)
     else 0
 else 0

theorem right_coeff_sum9a72 (n i j : ℕ) :
 coeff (frame (List.replicate n true)).mid.p i j=pellSum9a72 n i j := by
 classical
 by_cases hd : n+1 ≤ i+j ∧ i+j ≤ 2*n+2
 · let r := 2*n+2-(i+j)
   have hdeg : (frame (List.replicate n true)).mid.a+
       (frame (List.replicate n true)).mid.b-1=2*n+2 := by
     rw [(right_labels650 n).1,(right_labels650 n).2]; omega
   have hr : 2*r ≤ (frame (List.replicate n true)).mid.a+
       (frame (List.replicate n true)).mid.b-1 := by rw [hdeg]; dsimp [r]; omega
   rw [← diagonal_raw_coeff_on16 (List.replicate n true) r i j (by rw [hdeg]; dsimp [r]; omega),
     upper_slice_factor774 _ r hr,hdeg,mul_comm,Polynomial.coeff_mul]
   rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
   unfold pellSum9a72
   rw [if_pos hd]
   apply Finset.sum_congr rfl
   intro k hk
   by_cases hkr : k≤r
   · have he := right_quotient_coeff0618 n k (r-k)
     rw [Nat.add_sub_of_le hkr] at he
     simp only [Polynomial.coeff_one_add_X_pow,he,if_pos hkr]
     ring
   · rw [quotient_slice_degree725 _ r k (by omega),zero_mul]
     simp only [if_neg hkr]
 · rw [pellSum9a72,if_neg hd]
   apply raw_outside_polygon18
   rw [(right_labels650 n).1,(right_labels650 n).2]
   intro hp
   have hu := hp.2
   have hl := hp.1
   have hs : n+1≤i+j := by
     by_contra hh
     have hm := Nat.mul_le_mul_left (n+2) (show i+j≤n by omega)
     nlinarith
   exact hd ⟨hs,by omega⟩

def PellHorizontal9a72 : Prop := ∀ n i j,
 pellSum9a72 n i j*pellSum9a72 n (i+2) j ≤ pellSum9a72 n (i+1) j^2
def PellVertical9a72 : Prop := ∀ n i j,
 pellSum9a72 n i j*pellSum9a72 n i (j+2) ≤ pellSum9a72 n i (j+1)^2

theorem pell_weak_iff_two_sums9a72 :
 (∀ n, WeakLC (n+1) (n+2) (frame (List.replicate n true)).mid.p) ↔
 PellHorizontal9a72 ∧ PellVertical9a72 := by
 constructor
 · intro h
   have hg (n : ℕ) : GlobalLC18 (frame (List.replicate n true)).mid.p := by
     apply (global_iff_weak18 (raw_outside_polygon18 (List.replicate n true))).mpr
     simpa only [(right_labels650 n).1,(right_labels650 n).2] using h n
   constructor
   · intro n i j
     simpa only [right_coeff_sum9a72] using (hg n).1 i j
   · intro n i j
     simpa only [right_coeff_sum9a72] using (hg n).2.1 i j
 · rintro ⟨hh,hv⟩ n
   refine ⟨?_,?_,right_raw_diagonal0618 n⟩
   · intro i j _ _ _
     simpa only [right_coeff_sum9a72] using hh n i j
   · intro i j _ _ _
     simpa only [right_coeff_sum9a72] using hv n i j

#print axioms right_coeff_sum9a72
#print axioms pell_weak_iff_two_sums9a72
end
end MathGKM.Markov
