import MarkovMomentSums6905
/-! Machine-authored request 6905e489. Local cubic moments on an arbitrary
finite Boolean permutation orbit. Cyclic word/source scanner identification
is deliberately not assumed here. -/
namespace MathGKM.Markov
noncomputable section
open scoped BigOperators
variable {R α : Type*} [CommRing R] [Fintype α]

def orbitOnes6905 (w : α → Bool) : R := ∑ i,bit6905 (w i)
def orbitPairs6905 (e : α ≃ α) (w : α → Bool) : R :=
 ∑ i,bit6905 (w i)*bit6905 (w (e i))
def orbit1016905 (e : α ≃ α) (w : α → Bool) : R :=
 ∑ i,bit6905 (w i)*(1-bit6905 (w (e i)))*bit6905 (w (e (e i)))
def orbit1116905 (e : α ≃ α) (w : α → Bool) : R :=
 ∑ i,bit6905 (w i)*bit6905 (w (e i))*bit6905 (w (e (e i)))

theorem permutation_K6905 (e : α ≃ α) (w : α → Bool) (y : R) :
 (∑ i,localK6905 y (w i) (w (e i)))=
 momentK6905 y (Fintype.card α) (orbitOnes6905 w) (orbitPairs6905 e w) := by
 apply localK_sum6905 Finset.univ w (fun i => w (e i)) y _ _ _
 · simp
 · rfl
 · exact e.sum_comp (fun i => bit6905 (w i))
 · rfl

theorem permutation_L6905 (e : α ≃ α) (w : α → Bool) (y : R) :
 (∑ i,localL6905 y (w i) (w (e i)) (w (e (e i))))=
 momentL6905 y (Fintype.card α) (orbitOnes6905 w) (orbitPairs6905 e w)
   (orbit1016905 e w) (orbit1116905 e w) := by
 apply localL_sum6905 Finset.univ w (fun i => w (e i)) (fun i => w (e (e i)))
   y _ _ _ _ _
 · simp
 · rfl
 · exact e.sum_comp (fun i => bit6905 (w i))
 · exact (e.sum_comp (fun i => bit6905 (w (e i)))).trans
     (e.sum_comp (fun i => bit6905 (w i)))
 · rfl
 · exact e.sum_comp (fun i => bit6905 (w i)*bit6905 (w (e i)))
 · unfold orbit1016905 orbit1116905
   rw [←Finset.sum_add_distrib]
   apply Finset.sum_congr rfl
   intro i _
   ring
 · rfl

theorem permutation_D6905 (e : α ≃ α) (w : α → Bool) (y : R) :
 (∑ i,localD6905 y (w i) (w (e i)))=
 momentD6905 y (Fintype.card α) (orbitOnes6905 w) := by
 have h (i : α) : localD6905 y (w i) (w (e i))=
   1+bit6905 (w i)*(2*y)+bit6905 (w (e i))*(1+y) := by
   unfold localD6905; ring
 simp_rw [h,Finset.sum_add_distrib,←Finset.sum_mul]
 rw [e.sum_comp (fun i => bit6905 (w i))]
 simp only [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,mul_one]
 unfold momentD6905 orbitOnes6905
 ring

#print axioms permutation_K6905
#print axioms permutation_L6905
#print axioms permutation_D6905
end
end MathGKM.Markov
