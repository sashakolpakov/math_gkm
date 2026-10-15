import MarkovResidualM806
import MarkovFourthAfterMiddleM722
import MarkovResidualM94
import MarkovResidualM722
import MarkovMiddleOneM5DC
/-! Machine-authored 722898f8. Exact residual after the proved fourth tail. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
set_option maxHeartbeats 4000000
def MiddleFourthOneRegionM5DC (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧
  5≤(frame rest).mid.b ∧ (frame rest).mid.a=1 ∧ 2*n+6≤j ∧ j≤3*n ∧
  i+j+2=(frame path).mid.a+4

def InteriorCore63OneM5DC : Prop := ∀ path : List Bool,
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
   ¬InitialFourthRegionM806 path i j → ¬FinalFourthRegionM94 path i j → ¬FinalFourthRegionM722 path i j → ¬MiddleFourthOneRegionM5DC path i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_core_oneM5DC : Conjecture63 ↔ InteriorCore63OneM5DC := by
 rw [root_iff_coreM722]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm _
   exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm
   by_cases he : MiddleFourthOneRegionM5DC path i j
   · obtain ⟨n,rest,hpath,hc,hr,hj,hju,hdiag⟩ := he
     subst path
     exact source_fourth_middle_oneM5DC n rest hc hr i j hj hju hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm he
end
end MathGKM.Markov
