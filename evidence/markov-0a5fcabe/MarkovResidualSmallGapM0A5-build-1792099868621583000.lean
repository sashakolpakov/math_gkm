import MarkovFourthGapM38E
import MarkovResidualM253
/-! Machine-authored request 38ebef17. Exact numeric residual; still unproved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
def InteriorCore63SmallGapM0A5 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4  ≤  m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j  ≤  coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4  ≤  m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2)  ≤  coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8  ≤  m.a+m.b-1 → m.a+4  ≤  i+j+2 →
   m.a+2  ≤  m.b → (m.a+5  ≤  i+j+2 ∨ (4*m.b  <  5*m.a ∧ m.b ≤ m.a+4)) →
   ¬InitialFourthRegionM806 path i j → ¬FinalFourthRegionM94 path i j → ¬FinalFourthRegionM722 path i j → ¬MiddleFourthOneRegionM5DC path i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j  ≤  coeff m.p (i+1) (j+1)^2)

theorem root_iff_coreSmallGapM0A5 : Conjecture63 ↔ InteriorCore63SmallGapM0A5 := by
 rw [root_iff_core_oneM5DC]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm
   apply hd i j h0 h1 h2 ht hs hb _ hi hf hfm hm
   rcases hx with hx | ⟨hx,_⟩
   · exact Or.inl hx
   · exact Or.inr hx
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm
   by_cases hs' : (frame path).mid.a+5 ≤ i+j+2
   · exact hd i j h0 h1 h2 ht hs hb (Or.inl hs') hi hf hfm hm
   by_cases hb' : (frame path).mid.b ≤ (frame path).mid.a+4
   · exact hd i j h0 h1 h2 ht hs hb (Or.inr ⟨by rcases hx with hx | hx  <;> omega,hb'⟩) hi hf hfm hm
   · exact source_fourth_gap_ge_fiveM38E path (by omega) i j h0 h1 h2 (by omega)
end
end MathGKM.Markov


