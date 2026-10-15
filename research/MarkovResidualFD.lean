import MarkovThirdLargeFD
import MarkovSmallAllFD
import MarkovInterior8BBB
/-! Machine-authored fd72158c. Exact residual of the pinned full root.
This residual is not asserted; it preserves every remaining obligation. -/
namespace MathGKM.Markov
noncomputable section
def ShortMixedFD (path : List Bool) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧ (n=2 ∨ n=3)

def Interior63FD : Prop := ∀ path : List Bool,
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
   (m.a+4 ≤ i+j+2 ∨ m.b ≤ m.a+3) →
   (m.a+4 ≤ i+j+2 ∨ ¬ShortMixedFD path) →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorFD : Conjecture63 ↔ Interior63FD := by
 rw [root_iff_interior8BBB]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   exact ⟨hh,hv,fun i j h0 h1 h2 ht hs hold _ _ => hd i j h0 h1 h2 ht hs hold⟩
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hold
   by_cases he : i+j+2=(frame path).mid.a+3
   · by_cases hl : (frame path).mid.a+4 ≤ (frame path).mid.b
     · exact source_third_largeFD path i j hl he h0
     · by_cases hshort : ShortMixedFD path
       · obtain ⟨n,rest,hpath,hn⟩ := hshort
         subst path
         exact source_third_small_allFD n rest i j hn he h0
       · exact hd i j h0 h1 h2 ht hs hold (Or.inr (by omega)) (Or.inr hshort)
   · exact hd i j h0 h1 h2 ht hs hold (Or.inl (by omega)) (Or.inl (by omega))

#print axioms root_iff_interiorFD
end
end MathGKM.Markov
