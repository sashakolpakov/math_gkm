import MarkovResidualM806
import MarkovFourthUpperM5DC
import MarkovResidualM94
/-! Machine-authored 722898f8. Exact residual after the proved fourth tail. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
set_option maxHeartbeats 4000000
def FinalFourthRegionFullM5DC (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧
  7≤n ∧ 5≤(frame rest).mid.b ∧ 2*n+6≤j ∧ j≤4*n+5 ∧ i+j+2=(frame path).mid.a+4

def InteriorCore63FullM5DC : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+4 ≤ i+j+2 →
   m.a+2 ≤ m.b → (m.a+5 ≤ i+j+2 ∨ 4*m.b < 5*m.a) →
   ¬InitialFourthRegionM806 path i j → ¬FinalFourthRegionM94 path i j → ¬FinalFourthRegionFullM5DC path i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_coreFullM5DC : Conjecture63 ↔ InteriorCore63FullM5DC := by
 rw [root_iff_coreM94]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf _
   exact hd i j h0 h1 h2 ht hs hb hx hi hf
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf
   by_cases he : FinalFourthRegionFullM5DC path i j
   · obtain ⟨n,rest,hpath,hn,hc,hj,hju,hdiag⟩ := he
     subst path
     exact source_fourth_upperM5DC n rest hn hc i j hj hju hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx hi hf he
end
end MathGKM.Markov
