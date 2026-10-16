import MarkovThreeForceM96A
/-! Machine-authored 96ada19b. Finite triangular coefficient recovery.
No coefficient inequality is assumed or concluded by the recovery theorem. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def solveDiscM96A (f : ℕ → ℕ → ℤ) (i j : ℕ) : ℤ :=
 f i j-
 2*(if 1≤i ∧ 0≤j then solveDiscM96A f (i-1) (j-0) else 0)+
 2*(if 0≤i ∧ 1≤j then solveDiscM96A f (i-0) (j-1) else 0)-
 (if 2≤i ∧ 0≤j then solveDiscM96A f (i-2) (j-0) else 0)-
 2*(if 1≤i ∧ 1≤j then solveDiscM96A f (i-1) (j-1) else 0)-
 (if 0≤i ∧ 2≤j then solveDiscM96A f (i-0) (j-2) else 0)
termination_by i+j
decreasing_by all_goals omega

theorem solve_disc_stepM96A (f : ℕ → ℕ → ℤ) (i j : ℕ) :
 solveDiscM96A f i j=f i j-2*shiftRawM9E2 1 0 (solveDiscM96A f) i j+
 2*shiftRawM9E2 0 1 (solveDiscM96A f) i j-shiftRawM9E2 2 0 (solveDiscM96A f) i j-
 2*shiftRawM9E2 1 1 (solveDiscM96A f) i j-shiftRawM9E2 0 2 (solveDiscM96A f) i j := by
 rw [solveDiscM96A]
 rfl

theorem solve_disc_uniqueM96A (f g : ℕ → ℕ → ℤ)
 (hg : ∀ i j, discriminantActionM96A g i j=f i j) :
 ∀ i j, solveDiscM96A f i j=g i j := by
 have H : ∀ n i j, i+j=n → solveDiscM96A f i j=g i j := by
   intro n
   induction n using Nat.strong_induction_on with
   | h n ih =>
     intro i j hn
     have hs (a b : ℕ) (hab : 0<a+b) :
       shiftRawM9E2 a b (solveDiscM96A f) i j=shiftRawM9E2 a b g i j := by
       unfold shiftRawM9E2
       split_ifs with h
       · exact ih ((i-a)+(j-b)) (by omega) (i-a) (j-b) rfl
       · rfl
     have hr := solve_disc_stepM96A f i j
     rw [hs 1 0 (by omega),hs 0 1 (by omega),hs 2 0 (by omega),
       hs 1 1 (by omega),hs 0 2 (by omega)] at hr
     have hh := hg i j
     unfold discriminantActionM96A at hh
     linear_combination hr-hh
 exact fun i j => H (i+j) i j rfl

def sparseRawM96A (q : ℕ) (r : Bool) : ℕ → ℕ → ℤ :=
 solveDiscM96A (threeForceM96A q r)

theorem sparse_raw_eqM96A (q : ℕ) (r : Bool) (i j : ℕ) :
 sparseRawM96A q r i j=threeRawM9E2 q r i j :=
 solve_disc_uniqueM96A (threeForceM96A q r) (threeRawM9E2 q r)
   (three_raw_equationM96A q r) i j

theorem sparse_source_coeffM96A (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1≤q ∧ (frame path).mid.b=3*q+(if r then 1 else 2) ∧
   ∀ i j, coeff (frame path).mid.p i j=sparseRawM96A q r i j := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 exact ⟨q,r,hq,hb,fun i j => (hp i j).trans (sparse_raw_eqM96A q r i j).symm⟩

def SparseThreeLCM96A : Prop := ∀ q : ℕ, 1≤q → ∀ r,
 (∀ i j, sparseRawM96A q r i j*sparseRawM96A q r (i+2) j≤sparseRawM96A q r (i+1) j^2) ∧
 (∀ i j, sparseRawM96A q r i j*sparseRawM96A q r i (j+2)≤sparseRawM96A q r i (j+1)^2) ∧
 (∀ i j, sparseRawM96A q r i (j+2)*sparseRawM96A q r (i+2) j≤sparseRawM96A q r (i+1) (j+1)^2)

theorem root_iff_sparse_threeM96A : Conjecture63 ↔ SparseThreeLCM96A ∧ OtherFourM9E2 := by
 rw [root_iff_three_arithmeticM9E2]
 unfold SparseThreeLCM96A ThreeRawLCM9E2
 simp only [sparse_raw_eqM96A]

end
end MathGKM.Markov
