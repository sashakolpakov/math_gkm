import MarkovResidualM806
import MarkovTailAllM06
/-! Machine-authored 06b5b1f9. Exact residual after the proved fourth tail. -/
namespace MathGKM.Markov
noncomputable section
def TailFourthRegionM06 (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest k, path=List.replicate n true++false::rest ∧ 7≤n ∧
  5≤(frame rest).mid.b ∧ j=4*n+k ∧ k≤5 ∧ i+j+2=(frame path).mid.a+4

def InteriorCore63M06 : Prop := ∀ path : List Bool,
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
   ¬InitialFourthRegionM806 path i j → ¬TailFourthRegionM06 path i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_coreM06 : Conjecture63 ↔ InteriorCore63M06 := by
 rw [root_iff_coreM806]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi _
   exact hd i j h0 h1 h2 ht hs hb hx hi
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi
   by_cases he : TailFourthRegionM06 path i j
   · obtain ⟨n,rest,k,hpath,hn,hc,hj,hk,hdiag⟩ := he
     subst path
     subst j
     exact source_fourth_tailM06 n rest hn hc i k hk hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx hi he
end
end MathGKM.Markov
