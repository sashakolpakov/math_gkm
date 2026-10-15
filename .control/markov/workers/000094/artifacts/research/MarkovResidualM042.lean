import MarkovFirstShiftCC
import MarkovBlockSourceM042
import MarkovResidualN6604
/-! Machine-authored 04290504. Exact residual, with the proved initial fourth-slice region removed. -/
namespace MathGKM.Markov
noncomputable section
def InitialFourthRegionM042 (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧ 5≤(frame rest).mid.b ∧
   i+j+2=(frame path).mid.a+4 ∧ (j<n ∨ j=n ∧ 4≤n ∨ ∃ k, j=n+k ∧ 5≤k ∧ k≤n)

def InteriorCore63M042 : Prop := ∀ path : List Bool,
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
   ¬InitialFourthRegionM042 path i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)


theorem root_iff_coreM042 : Conjecture63 ↔ InteriorCore63M042 := by
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
   by_cases he : InitialFourthRegionM042 path i j
   · obtain ⟨n,rest,hpath,hc,hdiag,hj⟩ := he
     subst path
     rcases hj with hj|⟨he,hn⟩|⟨k,he,hk,hkn⟩
     · exact source_fourth_initial_allF2 n rest hc i j hdiag hj
     · subst j
       exact source_fourth_first_shiftCC n rest hc hn i hdiag
     · subst j
       exact source_fourth_blockM042 n rest hc i k hk hkn hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx he
end
end MathGKM.Markov
