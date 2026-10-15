import MarkovResidualSmallGapM0A5
import MarkovAllCycleInitialM0A5
/-! Machine-authored 0a5fcabe. Exact root equivalence; residual remains unproved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
set_option maxHeartbeats 4000000

def InitialAllCycleRegionM0A5 (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧
 5 ≤ j ∧ j+2 < n ∧
 i+j+2=(frame path).mid.a+4

def InteriorCore63AllCyclesM0A5 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+4 ≤ i+j+2 →
   m.a+2 ≤ m.b → (m.a+5 ≤ i+j+2 ∨ (4*m.b < 5*m.a ∧ m.b ≤ m.a+4)) →
   ¬InitialFourthRegionM806 path i j → ¬FinalFourthRegionM94 path i j →
   ¬FinalFourthRegionM722 path i j → ¬MiddleFourthOneRegionM5DC path i j →
   ¬InitialAllCycleRegionM0A5 path i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_coreAllCyclesM0A5 : Conjecture63 ↔ InteriorCore63AllCyclesM0A5 := by
 rw [root_iff_coreSmallGapM0A5]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm _
   exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm
   by_cases he : InitialAllCycleRegionM0A5 path i j
   · obtain ⟨n,rest,hpath,hj5,hjn,hdiag⟩ := he
     subst path
     exact source_fourth_initial_all_cyclesM0A5 n rest i j hdiag hjn hj5
   · exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm he
end
end MathGKM.Markov
