import MarkovLongSourceE2
import MarkovInterior8BBB
/-! Machine-authored e2cd486c. Exact residual of the unchanged pinned root.
The residual remains unproved. -/
namespace MathGKM.Markov
noncomputable section

def LongLargeE2 (path : List Bool) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧ 4 ≤ n ∧ 4 ≤ (frame rest).mid.b

def Interior63E2 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+5 ≤ m.a+m.b-1 → m.a+3 ≤ i+j+2 →
   (m.a+4 ≤ i+j+2 ∨ 2*m.b < 3*m.a) →
   (i+j+2 ≠ m.a+3 ∨ ¬LongLargeE2 path) →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorE2 : Conjecture63 ↔ Interior63E2 := by
 rw [root_iff_interior8BBB]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   exact ⟨hh,hv,fun i j h0 h1 h2 ht hs hold _ => hd i j h0 h1 h2 ht hs hold⟩
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hold
   by_cases he : i+j+2=(frame path).mid.a+3
   · by_cases hc : LongLargeE2 path
     · obtain ⟨n,rest,hp,hn,hc⟩ := hc
       subst path
       exact source_third_ge_fourE2 n rest i j hn hc he h0
     · exact hd i j h0 h1 h2 ht hs hold (Or.inr hc)
   · exact hd i j h0 h1 h2 ht hs hold (Or.inl he)

#print axioms root_iff_interiorE2
end
end MathGKM.Markov
