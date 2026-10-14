import MarkovCutPartitionA27
import MarkovPolygon18
/-! Machine-authored a27f6d42. Exact whole-grid cut reformulation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def cutRawA27 (path : List Bool) (i j : ℕ) : ℤ :=
 if (frame path).mid.a≤i+j then
   (cutCoeffA27 (X : ℤ[X]) X 1 (central28 path++[true])
     (i+j-(frame path).mid.a)).coeff j
 else 0

theorem cutRaw_eqA27 (path : List Bool) (i j : ℕ) :
 cutRawA27 path i j=coeff (frame path).mid.p i j := by
 unfold cutRawA27
 split_ifs with h
 · exact (source_cut_coeffA27 path i j _ (by omega)).symm
 · apply Eq.symm
   apply raw_outside_polygon18
   intro hp
   obtain ⟨ha,hab,_⟩ := frame_reduced path
   have hmul := Nat.mul_le_mul_right j (Nat.le_of_lt hab)
   have hlo := hp.1
   have hn : i+j<(frame path).mid.a := by omega
   have ht := Nat.mul_lt_mul_of_pos_left hn (show 0<(frame path).mid.b by omega)
   nlinarith

def CutGoalA27 : Prop := ∀ path : List Bool,
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 (∀ i j, InPolygon a b i j → InPolygon a b (i+1) j → InPolygon a b (i+2) j →
   cutRawA27 path i j*cutRawA27 path (i+2) j≤cutRawA27 path (i+1) j^2) ∧
 (∀ i j, InPolygon a b i j → InPolygon a b i (j+1) → InPolygon a b i (j+2) →
   cutRawA27 path i j*cutRawA27 path i (j+2)≤cutRawA27 path i (j+1)^2) ∧
 (∀ i j, InPolygon a b i (j+2) → InPolygon a b (i+1) (j+1) → InPolygon a b (i+2) j →
   cutRawA27 path i (j+2)*cutRawA27 path (i+2) j≤cutRawA27 path (i+1) (j+1)^2)

theorem root_iff_cutA27 : Conjecture63 ↔ CutGoalA27 := by
 have he0 : WeakLC 0 1 1 := by
   refine ⟨?_,?_,?_⟩ <;> intro i j h0 h1 h2 <;> unfold InPolygon at * <;> omega
 have he1 : WeakLC 1 1 (U+V) := by
   refine ⟨?_,?_,?_⟩ <;> intro i j h0 h1 h2 <;> unfold InPolygon at * <;> omega
 simp only [Conjecture63,CutGoalA27,cutRaw_eqA27,WeakLC]
 exact ⟨fun h => h.2.2,fun h => ⟨he0,he1,h⟩⟩

#print axioms cutRaw_eqA27
#print axioms root_iff_cutA27
end
end MathGKM.Markov
