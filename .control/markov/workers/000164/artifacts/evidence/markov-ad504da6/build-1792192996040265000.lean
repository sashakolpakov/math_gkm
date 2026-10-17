import MarkovSymmetricCutMAD5
/-! Machine-authored ad504da6. Adjacent inward comparisons suffice for all
centered pair comparisons on interval support; zero factors remain explicit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem pair_den_sortMAD5 (B : ℝ[X]) (p : ℕ × ℕ) :
 pairDenMAD5 B p=pairDenMAD5 B (min p.1 p.2,max p.1 p.2) := by
 unfold pairDenMAD5
 by_cases h : p.1 ≤ p.2
 · simp [min_eq_left h,max_eq_right h]
 · simp [min_eq_right (le_of_not_ge h),max_eq_left (le_of_not_ge h),mul_comm]

theorem pair_gap_sortMAD5 (A B C : ℝ[X]) (p : ℕ × ℕ) :
 pairGapMAD5 A B C p=pairGapMAD5 A B C (min p.1 p.2,max p.1 p.2) := by
 unfold pairGapMAD5 pairDenMAD5
 by_cases h : p.1 ≤ p.2
 · simp [min_eq_left h,max_eq_right h]
 · simp only [min_eq_right (le_of_not_ge h),max_eq_left (le_of_not_ge h)]
   ring

theorem pair_order_of_stepsMAD5 (A B C : ℝ[X]) (l u : ℕ)
 (hA : ∀ k, 0 ≤ A.coeff k) (hB : ∀ k, 0 ≤ B.coeff k)
 (hC : ∀ k, 0 ≤ C.coeff k)
 (hs : ∀ k, 0 < B.coeff k ↔ l ≤ k ∧ k ≤ u)
 (hstep : ∀ i k, l ≤ i → k ≤ u → i+2 ≤ k →
   pairGapMAD5 A B C (i,k)*pairDenMAD5 B (i+1,k-1) ≤
   pairGapMAD5 A B C (i+1,k-1)*pairDenMAD5 B (i,k)) :
 PairOrderMAD5 A B C := by
 intro n p hp q hq hr
 have hpadd := mem_antidiagonal.mp hp
 have hqadd := mem_antidiagonal.mp hq
 have hpmin := min_le_left p.1 p.2
 have hpmin' := min_le_right p.1 p.2
 have hqmin := min_le_left q.1 q.2
 have hqmin' := min_le_right q.1 q.2
 have hpmax := max_add_min p.1 p.2
 have hqmax := max_add_min q.1 q.2
 rw [pair_gap_sortMAD5 A B C p,pair_gap_sortMAD5 A B C q,
   pair_den_sortMAD5 B p,pair_den_sortMAD5 B q]
 let a := min p.1 p.2
 let b := min q.1 q.2
 have hpa : max p.1 p.2=n-a := by dsimp [a]; omega
 have hqb : max q.1 q.2=n-b := by dsimp [b]; omega
 rw [hpa,hqb]
 have hab : a ≤ b := hr
 have hbhalf : b+b ≤ n := by dsimp [b]; omega
 have hden (i : ℕ) : 0 ≤ pairDenMAD5 B (i,n-i) := mul_nonneg (hB _) (hB _)
 by_cases hz : pairDenMAD5 B (a,n-a)=0
 · have ha : pairGapMAD5 A B C (a,n-a) ≤ 0 := by
     unfold pairGapMAD5
     rw [hz]
     have h1 := mul_nonneg (hA a) (hC (n-a))
     have h2 := mul_nonneg (hC a) (hA (n-a))
     linarith
   rw [hz,mul_zero]
   exact mul_nonpos_of_nonpos_of_nonneg ha (hden b)
 · have hposa : 0 < pairDenMAD5 B (a,n-a) := lt_of_le_of_ne (hden a) (Ne.symm hz)
   have hapos : 0 < B.coeff a := by
     by_contra hh
     have he : B.coeff a=0 := le_antisymm (le_of_not_gt hh) (hB a)
     simp [pairDenMAD5,he] at hposa
   have hnapos : 0 < B.coeff (n-a) := by
     by_contra hh
     have he : B.coeff (n-a)=0 := le_antisymm (le_of_not_gt hh) (hB (n-a))
     simp [pairDenMAD5,he] at hposa
   have hal := (hs a).mp hapos
   have hau := (hs (n-a)).mp hnapos
   have hpos (i : ℕ) (hi : a ≤ i) (hib : i ≤ b) : 0 < pairDenMAD5 B (i,n-i) := by
     apply mul_pos
     · exact (hs i).mpr ⟨by omega,by omega⟩
     · exact (hs (n-i)).mpr ⟨by omega,by omega⟩
   have hm : ∀ i, a ≤ i → i ≤ b →
     pairGapMAD5 A B C (a,n-a)/pairDenMAD5 B (a,n-a) ≤
     pairGapMAD5 A B C (i,n-i)/pairDenMAD5 B (i,n-i) := by
     intro i hi
     induction i,hi using Nat.le_induction with
     | base => intro _; exact le_rfl
     | succ i hi ih =>
       intro hib
       apply (ih (by omega)).trans
       apply (div_le_div_iff₀ (hpos i hi (by omega)) (hpos (i+1) (by omega) hib)).mpr
       have hh := hstep i (n-i) (by omega) (by omega) (by omega)
       simpa only [show n-i-1=n-(i+1) by omega] using hh
   exact (div_le_div_iff₀ hposa (hpos b hab le_rfl)).mp (hm b hab le_rfl)

end
end MathGKM.Markov
