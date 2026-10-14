import MarkovDiagonalSupport3eda
import MarkovReduction18
/-! Machine-authored request 3edac4bf. All-direction CrossLC root equivalence.
Neither side is asserted. Raw coefficients and every zero are retained. -/
namespace MathGKM.Markov
noncomputable section

theorem all_diagonal_cross_iff3eda (path : List Bool) :
 (∀ n, CrossLC (zeroSeq725 (rawDiagonal3eda path n))) ↔
 (∀ i j, coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
   coeff (frame path).mid.p (i+1) (j+1)^2) := by
 constructor
 · intro h i j
   have hh := (rawDiagonal_cross_iff3eda path (i+j+2)).mp (h (i+j+2)) i
   have e0 : i+j+2-i=j+2 := by omega
   have e1 : i+j+2-(i+1)=j+1 := by omega
   have e2 : i+j+2-(i+2)=j := by omega
   simpa [rawDiagonal3eda,e0,e1,e2,show i≤ i+j+2 by omega,
     show i+1≤ i+j+2 by omega,show i+2≤ i+j+2 by omega] using hh
 · intro h n
   apply (rawDiagonal_cross_iff3eda path n).mpr
   intro k
   by_cases hk : k+2≤n
   · have hh := h k (n-(k+2))
     have e0 : n-(k+2)+2=n-k := by omega
     have e1 : n-(k+2)+1=n-(k+1) := by omega
     simpa [rawDiagonal3eda,hk,show k≤n by omega,show k+1≤n by omega,e0,e1] using hh
   · have hz : rawDiagonal3eda path n (k+2)=0 := by simp [rawDiagonal3eda,hk]
     rw [hz,mul_zero]
     exact sq_nonneg _

def CrossGoal3eda : Prop := ∀ path : List Bool,
 (∀ j, CrossLC (zeroSeq725 (fun i => coeff (frame path).mid.p i j))) ∧
 (∀ i, CrossLC (zeroSeq725 (fun j => coeff (frame path).mid.p i j))) ∧
 (∀ n, CrossLC (zeroSeq725 (rawDiagonal3eda path n)))

theorem source_cross_iff_global3eda (path : List Bool) :
 ((∀ j, CrossLC (zeroSeq725 (fun i => coeff (frame path).mid.p i j))) ∧
 (∀ i, CrossLC (zeroSeq725 (fun j => coeff (frame path).mid.p i j))) ∧
 (∀ n, CrossLC (zeroSeq725 (rawDiagonal3eda path n)))) ↔
 GlobalLC18 (frame path).mid.p := by
 have hh (j : ℕ) := horizontal_cross_iff725 path j
 have hv (i : ℕ) := vertical_cross_iff725 path i
 simp only [horizontal_sequence725] at hh
 simp only [vertical_sequence725] at hv
 constructor
 · rintro ⟨h1,h2,h3⟩
   exact ⟨fun i j => (hh j).mp (h1 j) i,
     fun i j => (hv i).mp (h2 i) j,(all_diagonal_cross_iff3eda path).mp h3⟩
 · rintro ⟨h1,h2,h3⟩
   exact ⟨fun j => (hh j).mpr (fun i => h1 i j),
     fun i => (hv i).mpr (h2 i),(all_diagonal_cross_iff3eda path).mpr h3⟩

theorem root_iff_cross3eda : Conjecture63 ↔ CrossGoal3eda := by
 constructor
 · intro h path
   apply (source_cross_iff_global3eda path).mpr
   exact (global_iff_weak18 (raw_outside_polygon18 path)).mpr (h.2.2 path)
 · intro h
   apply root_iff_raw_matrix18.mpr
   intro path
   rw [← raw_matrix18]
   exact (source_cross_iff_global3eda path).mp (h path)

#print axioms all_diagonal_cross_iff3eda
#print axioms root_iff_cross3eda
end
end MathGKM.Markov
