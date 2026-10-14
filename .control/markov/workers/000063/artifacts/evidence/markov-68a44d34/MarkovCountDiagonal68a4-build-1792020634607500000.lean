import MarkovCountCoeff68a4
/-! Machine-authored 68a44d34. Exact triangular multiplicities in the
single-A source count formula. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

theorem countAtom_sum68 (r h N s d : ℕ) (hrs : r ≤ s) (hd : h+(s-r) ≤ d) :
 (∑ k ∈ range N,countAtom68 r h k s d)=
 if d-h-(s-r)<N then ((d-h-(s-r)).choose (s-r):ℤ) else 0 := by
 have he (k : ℕ) : countAtom68 r h k s d=
     if k=d-h-(s-r) then ((d-h-(s-r)).choose (s-r):ℤ) else 0 := by
   by_cases hk : k=d-h-(s-r)
   · subst k
     simp [countAtom68,hrs,show h+(d-h-(s-r))+(s-r)=d by omega]
   · simp [countAtom68,hrs,hk,show ¬h+k+(s-r)=d by omega]
 simp only [he]
 simp [Finset.sum_ite_eq',Finset.mem_range]

theorem square_diagonal_sum68 (n N : ℕ) (c : ℤ) :
 (∑ k ∈ range (n+1),∑ l ∈ range (n+1),if k+l=N then c else 0)=
   (((min n N+1)-(N-n):ℕ):ℤ)*c := by
 classical
 have hi (k : ℕ) :
     (∑ l ∈ range (n+1),if k+l=N then c else 0)=
     if k ≤ N ∧ N-k ≤ n then c else 0 := by
   by_cases hk : k ≤ N
   · have he (l : ℕ) : k+l=N ↔ l=N-k := by omega
     simp [he,Finset.sum_ite_eq',Finset.mem_range,hk,Nat.lt_succ_iff]
   · have he (l : ℕ) : ¬k+l=N := by omega
     simp [hk,he]
 simp only [hi]
 rw [←Finset.sum_filter]
 have hf : (range (n+1)).filter (fun k => k ≤ N ∧ N-k ≤ n)=Icc (N-n) (min n N) := by
   ext k
   simp only [Finset.mem_filter,Finset.mem_range,Finset.mem_Icc,le_min_iff]
   omega
 rw [hf,Finset.sum_const,Finset.card_Icc]
 simp

theorem countAtom_square_sum68 (n s d : ℕ) (hs : 2 ≤ s) (hd : s+1 ≤ d) :
 (∑ k ∈ range (n+1),∑ l ∈ range (n+1),countAtom68 2 3 (k+l) s d)=
   (((min n (d-s-1)+1)-((d-s-1)-n):ℕ):ℤ)*((d-s-1).choose (s-2):ℤ) := by
 have he (k l : ℕ) : countAtom68 2 3 (k+l) s d=
     if k+l=d-s-1 then ((d-s-1).choose (s-2):ℤ) else 0 := by
   by_cases h : k+l=d-s-1
   · simp [countAtom68,hs,h,show 3+(d-s-1)+(s-2)=d by omega]
   · simp [countAtom68,hs,h,show ¬3+(k+l)+(s-2)=d by omega]
 simp only [he]
 exact square_diagonal_sum68 n (d-s-1) _

theorem source_count_456_formula68 (n : ℕ) (hn : 2 ≤ n) :
 singleACount68 n (n+1) 4 (n+6)=(n:ℤ)*((n+1).choose 2:ℤ) ∧
 singleACount68 n (n+1) 5 (n+6)=(n+1:ℤ)*(n.choose 3:ℤ) ∧
 singleACount68 n (n+1) 6 (n+6)=
   (n:ℤ)*((n-1).choose 4:ℤ)+2*(n.choose 5:ℤ)+((n-1).choose 5:ℤ) := by
 unfold singleACount68
 rw [countAtom_sum68 1 1 (n+1) 4 (n+6) (by omega) (by omega),
   countAtom_sum68 1 2 n 4 (n+6) (by omega) (by omega),
   countAtom_sum68 1 1 (n+1) 5 (n+6) (by omega) (by omega),
   countAtom_sum68 1 2 n 5 (n+6) (by omega) (by omega),
   countAtom_sum68 1 1 (n+1) 6 (n+6) (by omega) (by omega),
   countAtom_sum68 1 2 n 6 (n+6) (by omega) (by omega),
   countAtom_square_sum68 n 4 (n+6) (by omega) (by omega),
   countAtom_square_sum68 n 5 (n+6) (by omega) (by omega),
   countAtom_square_sum68 n 6 (n+6) (by omega) (by omega)]
 have h1 : n+6-4-1=n+1 := by omega
 have h2 : n+6-5-1=n := by omega
 have h3 : n+6-6-1=n-1 := by omega
 simp only [h1,h2,h3]
 have hm : min n (n-1)=n-1 := min_eq_right (by omega)
 simp only [min_eq_left (show n ≤ n+1 by omega),min_self,hm]
 norm_num [countAtom68]
 split_ifs <;> (first | omega | (push_cast [Nat.cast_sub (show 1 ≤ n by omega)]; ring))

#print axioms source_count_456_formula68
end
end MathGKM.Markov
