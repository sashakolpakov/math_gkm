import MarkovPairGap89ce
import MathGKM.MarkovIndices
/-! Machine-authored 89ce11ad. A concrete finite degree bound discharges
the truncation condition; universal source transport remains a conjecture. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset

theorem markedCoeff_degree_bound89 (word : List Bool) (s j : ℕ) :
 (markedCoeff7d word s j).natDegree≤1+2*word.length := by
 apply Polynomial.natDegree_le_iff_coeff_eq_zero.mpr
 intro k hk
 unfold markedCoeff7d
 rw [Polynomial.coeff_list_sum_map]
 apply List.sum_eq_zero
 intro c hc
 obtain ⟨m,hm,rfl⟩ := List.mem_map.mp hc
 obtain ⟨hw,hs⟩ := cutMasks_specFe01 word s m hm
 have hl : m.length=word.length := by simpa using congrArg List.length hw
 have hb := maskDegree_bound07a7 m 1
 rw [hl] at hb
 simp [Polynomial.coeff_C_mul_X_pow,show k≠maskDegree07a7 1 m by omega,
   show maskDegree07a7 1 m≠k by omega]

def SourcePairTransport89 : Prop :=
 ∀ (path : List Bool) (s j : ℕ),
 let word := central28 path++[true]
 HasDegreeTransport89 (range (2*word.length+2))
   (fun d => (degreeLayer07a7 (X:ℝ[X]) word s d).coeff j)
   (fun d => (degreeLayer07a7 (X:ℝ[X]) word s d).coeff (j+1))
   (fun d => (degreeLayer07a7 (X:ℝ[X]) word s d).coeff (j+2))

theorem source_diagonal_of_source_transport89 (h : SourcePairTransport89)
 (path : List Bool) (i j s : ℕ) (hs : i+j+2=(frame path).mid.a+s) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
   coeff (frame path).mid.p (i+1) (j+1)^2 := by
 apply source_diagonal_of_transport89 path i j s
   (2*(central28 path++[true]).length+2) hs
 · intro t ht
   have hb := markedCoeff_degree_bound89 (central28 path++[true]) s (j+t)
   omega
 · exact h path s j

theorem source_diagonal_clause_of_transport89 (h : SourcePairTransport89)
 (path : List Bool) (i j : ℕ)
 (hp : InPolygon (frame path).mid.a (frame path).mid.b i (j+2)) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
   coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨ha,hab,_⟩ := frame_reduced path
 have hge : (frame path).mid.a ≤ i+j+2 := by
  have h1 := hp.1
  have h2 : (frame path).mid.a*(j+2)≤(frame path).mid.b*(j+2) :=
    Nat.mul_le_mul_right _ (Nat.le_of_lt hab)
  nlinarith
 exact source_diagonal_of_source_transport89 h path i j
   (i+j+2-(frame path).mid.a) (by omega)

#print axioms markedCoeff_degree_bound89
#print axioms source_diagonal_of_source_transport89
#print axioms source_diagonal_clause_of_transport89
end
end MathGKM.Markov
