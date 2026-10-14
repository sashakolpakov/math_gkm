import MarkovDeformedSourceA3c5
/-! Machine-authored a3c53fa7. Exact deformation threshold for one moving
Pell triple. No statement about the whole conjecture is inferred. -/
namespace MathGKM.Markov
noncomputable section

def typeGap3 (n t : ℝ) : ℝ :=
 2*(n+3)*(n+6)+16*(n+2)*t+(-(n+3)^2+11*(n+3)-16)*t^2

theorem typeGap_certificate3 (n t : ℝ) :
 typeGap3 n t=(2-t^2)*n^2+(18+16*t+5*t^2)*n+36+32*t+8*t^2 := by
 unfold typeGap3; ring

theorem typeGap_positive3 (n t : ℝ) (hn : 0≤n) (ht : 0≤t) (hs : t^2≤2) :
 0<typeGap3 n t := by
 rw [typeGap_certificate3]
 have h0 := mul_nonneg (sub_nonneg.mpr hs) (sq_nonneg n)
 have h1 := mul_nonneg (show 0≤18+16*t+5*t^2 by positivity) hn
 nlinarith [sq_nonneg t]

theorem typeGap_eventually_negative3 (t : ℝ) (ht : 0≤t) (hs : 2<t^2) :
 ∃ n : ℕ, typeGap3 n t<0 := by
 let B := 18+16*t+5*t^2
 let C := 36+32*t+8*t^2
 have he : 0<t^2-2 := by linarith
 have hc : 0≤C := by dsimp [C]; positivity
 obtain ⟨n,hn⟩ := exists_nat_gt (max 1 ((B+C)/(t^2-2)))
 have hn1 : (1:ℝ)<n := lt_of_le_of_lt (le_max_left _ _) hn
 have hdiv : (B+C)/(t^2-2)<n := lt_of_le_of_lt (le_max_right _ _) hn
 have hmul : B+C<(n:ℝ)*(t^2-2) := (div_lt_iff₀ he).mp hdiv
 have hp := mul_pos (sub_pos.mpr hmul) (show 0<(n:ℝ) by linarith)
 have hC := mul_nonneg hc (show 0≤(n:ℝ)-1 by linarith)
 refine ⟨n,?_⟩
 rw [typeGap_certificate3]
 change (2-t^2)*(n:ℝ)^2+B*n+C<0
 nlinarith

/-- Exact threshold for this algebraic triple, not for all source triples. -/
theorem typeGap_uniform_iff3 (t : ℝ) (ht : 0≤t) :
 (∀ n : ℕ, 0≤typeGap3 n t) ↔ t^2≤2 := by
 constructor
 · intro h
   by_contra hn
   obtain ⟨n,hneg⟩ := typeGap_eventually_negative3 t ht (lt_of_not_ge hn)
   linarith [h n]
 · intro hs n
   exact le_of_lt (typeGap_positive3 n t (Nat.cast_nonneg _) ht hs)

theorem typeGap_weight_two3 (n : ℝ) :
 typeGap3 (n+37) 2= -2*n^2-78*n-16 := by unfold typeGap3; ring

theorem typeP_weight_two_failure3 (n : ℕ) :
 coeff (typeP3 2 (n+40)) (n+40) 1^2 <
 coeff (typeP3 2 (n+40)) (n+40) 0*coeff (typeP3 2 (n+40)) (n+40) 2 := by
 have h := typeP_gap3 2 (n+37)
 have he : n+37+3=n+40 := by omega
 rw [he] at h
 push_cast at h
 have hn : (0:ℤ)≤n := Int.natCast_nonneg n
 nlinarith [sq_nonneg (n:ℤ)]

theorem source_corner_gap3 (n : ℕ) :
 2*(coeff (rightP650 (n+2)) (n+3) 1^2-
 coeff (rightP650 (n+2)) (n+3) 0*coeff (rightP650 (n+2)) (n+3) 2)=
 (n:ℤ)^2+39*n+76 := by
 have h := typeP_gap3 1 n
 rw [show n+3=(n+2)+1 by omega,typeP_source3] at h
 convert h using 1 <;> ring

theorem source_corner_strict3 (n : ℕ) :
 coeff (rightP650 (n+2)) (n+3) 0*coeff (rightP650 (n+2)) (n+3) 2 <
 coeff (rightP650 (n+2)) (n+3) 1^2 := by
 have h := source_corner_gap3 n
 have hn : (0:ℤ)≤n := Int.natCast_nonneg n
 nlinarith [sq_nonneg (n:ℤ)]

#print axioms typeGap_uniform_iff3
#print axioms typeP_weight_two_failure3
#print axioms source_corner_strict3
end
end MathGKM.Markov
