import MarkovFourthAllCyclesMCFC
import MarkovResidualSmallGapM0A5
/-! Machine-authored cfcbaf30. Exact root reduction, with the residual still unproved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
set_option maxHeartbeats 4000000

def InteriorCore63FifthMCFC : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_coreFifthMCFC : Conjecture63 ↔ InteriorCore63FifthMCFC := by
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h.2.2 path
   exact ⟨fun i j h0 h1 h2 _ => hh i j h0 h1 h2,
     fun i j h0 h1 h2 _ => hv i j h0 h1 h2,
     fun i j h0 h1 h2 _ _ _ => hd i j h0 h1 h2⟩
 · intro h
   apply root_iff_coreSmallGapM0A5.mpr
   intro path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx _ _ _ _
   by_cases hs' : (frame path).mid.a+5 ≤ i+j+2
   · exact hd i j h0 h1 h2 ht hs' hb
   · have hslope : 4*(frame path).mid.b < 5*(frame path).mid.a := by
       rcases hx with hx | ⟨hx,_⟩ <;> omega
     exact source_fourth_all_gap_ge_twoMCFC path hb hslope i j h0 h1 h2 (by omega)
end
end MathGKM.Markov
