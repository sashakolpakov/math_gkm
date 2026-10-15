import MarkovFourthTwoM8AE
import MarkovFourthTopCompleteM8AE
import MarkovResidualM253
/-! Machine-authored request 8ae35b59. Exact pinned-root residual, still unproved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def TwoFourthRegionM8AE (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧ 7≤n ∧
  5≤(frame rest).mid.b ∧ i+j+2=(frame path).mid.a+4 ∧
  (frame rest).mid.a=2

def InteriorCore63TwoM8AE : Prop := ∀ path : List Bool,
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
   ¬InitialFourthRegionM806 path i j → ¬FinalFourthRegionM94 path i j → ¬FinalFourthRegionM722 path i j → ¬MiddleFourthOneRegionM5DC path i j → ¬SolvedFourthRegionM253 path i j → ¬TopFourthRegionM8AE path i j → ¬TwoFourthRegionM8AE path i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)


theorem root_iff_coreTwoM8AE : Conjecture63 ↔ InteriorCore63TwoM8AE := by
 rw [root_iff_coreTopM8AE]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon htop _
   exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon htop
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon htop
   by_cases he : TwoFourthRegionM8AE path i j
   · obtain ⟨n,rest,hpath,hn,hc,hdiag,hr⟩ := he
     subst path
     exact run_fourth_twoM8AE n rest hn hc hr i j h0 h1 h2 hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon htop he
end
end MathGKM.Markov
