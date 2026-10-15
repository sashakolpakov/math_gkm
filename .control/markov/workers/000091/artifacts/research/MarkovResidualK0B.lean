import MarkovFourthInitialLCK0B
import MarkovResidualN6604
/-! Machine-authored 0b212317. Exact residual, with the proved initial fourth-slice region removed. -/
namespace MathGKM.Markov
noncomputable section
def InitialFourthRegionK0B (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧ 5≤(frame rest).mid.b ∧
   i+j+2=(frame path).mid.a+4 ∧ 5≤j ∧ j+2<n

def InteriorCore63K0B : Prop := ∀ path : List Bool,
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
   ¬InitialFourthRegionK0B path i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)


theorem root_iff_coreK0B : Conjecture63 ↔ InteriorCore63K0B := by
 rw [root_iff_coreN6604]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx _
   exact hd i j h0 h1 h2 ht hs hb hx
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx
   by_cases he : InitialFourthRegionK0B path i j
   · obtain ⟨n,rest,hpath,hc,hdiag,hj,hn⟩ := he
     subst path
     exact source_fourth_initial_lcK0B n rest hc i j hdiag hj hn
   · exact hd i j h0 h1 h2 ht hs hb hx he
end
end MathGKM.Markov
