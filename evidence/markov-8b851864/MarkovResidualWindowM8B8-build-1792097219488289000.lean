import MarkovFourthSixCompleteM8B8
import MarkovOnsetWindowLCM8B8
import MarkovResidualM253
/-! Machine-authored request 8b851864; adapted from 8ae35b59. Exact pinned-root residual, still unproved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def SolvedFourthRegionWindowM8B8 (path : List Bool) (i j : ℕ) : Prop :=
 (∃ n rest, path=List.replicate n true++false::rest ∧ 6≤n ∧
  5≤(frame rest).mid.b ∧ i+j+2=(frame path).mid.a+4) ∨
 (∃ n rest, path=List.replicate n true++false::rest ∧ 3≤n ∧
  5≤(frame rest).mid.b ∧ i+j+2=(frame path).mid.a+4 ∧
  2*n<j ∧ j≤2*n+5 ∧ n+5≤j ∧ j≤3*n+1)

def InteriorCore63WindowM8B8 : Prop := ∀ path : List Bool,
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
   ¬InitialFourthRegionM806 path i j → ¬FinalFourthRegionM94 path i j → ¬FinalFourthRegionM722 path i j → ¬MiddleFourthOneRegionM5DC path i j → ¬SolvedFourthRegionWindowM8B8 path i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)


theorem root_iff_coreWindowM8B8 : Conjecture63 ↔ InteriorCore63WindowM8B8 := by
 rw [root_iff_core_oneM5DC]
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
   by_cases he : SolvedFourthRegionWindowM8B8 path i j
   · rcases he with he | he
     · obtain ⟨n,rest,hpath,hn,hc,hdiag⟩ := he
       subst path
       exact run_fourth_ge_sixM8B8 n rest hn hc i j h0 h1 h2 hdiag
     · obtain ⟨n,rest,hpath,hn,hc,hdiag,hj,hju,hlo,hhi⟩ := he
       subst path
       exact source_fourth_onset_windowM8B8 n rest hn hc i j hj hju hlo hhi hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm he
end
end MathGKM.Markov
