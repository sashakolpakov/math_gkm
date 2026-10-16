import MarkovResidualM0D3
import MarkovVerticalEquivalenceM0D3
/-! Machine-authored 0d346fa7. Exact factorization of the pinned root into
the remaining uniform numerator-two vertical sign question and every other
unresolved clause. Neither factor is proved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def UniformVerticalRemainingM0D3 : Prop := ∀ i : ℕ, 5 ≤ i → VerticalRegionsM0D3 i
def OtherVerticalCoreM0D3 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 2 ≤ m.a →
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 → 5 ≤ j →
   ¬HorizontalMiddleMF1E m.a m.b i j →
   ¬(HorizontalRegionMAC3 m.a m.b i j ∨ HorizontalVarianceMAC3 m.a m.b i j) →
   ¬HorizontalSharpM37B m.a m.b i j → m.a≠2 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 → 4 ≤ i → 3 ≤ j →
   ¬VerticalMiddleMF1E m.a m.b i j →
   ¬(VerticalRegionMAC3 m.a m.b i j ∨ VerticalVarianceMAC3 m.a m.b i j) →
   ¬VerticalSharpM37B m.a m.b i j → m.a≠2 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b → ¬DiagonalMiddleMF1E m.a m.b i j →
   ¬(DiagonalRegionMAC3 m.a m.b i j ∨ DiagonalVarianceMAC3 m.a m.b i j) →
   ¬DiagonalSharpM37B m.a m.b i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_uniform_verticalM0D3 :
 Conjecture63 ↔ UniformVerticalRemainingM0D3 ∧ OtherVerticalCoreM0D3 := by
 constructor
 · intro h
   constructor
   · intro i hi
     apply vertical_regions_of_sourceM0D3 i (by omega)
     intro path ha j
     have hg := (global_iff_weak18 (raw_outside_polygon18 path)).mpr (h.2.2 path)
     exact hg.2.1 i j
   · intro path
     dsimp only
     intro ha
     obtain ⟨hh,hv,hd⟩ := root_iff_interiorM0D3.mp h path ha
     refine ⟨hh,?_,hd⟩
     intro i j h0 h1 h2 ht hi hj hm hn hs hc
     exact hv i j h0 h1 h2 ht hi hj hm hn hs (fun he => hc he.1)
 · rintro ⟨hu,ho⟩
   apply root_iff_interiorM0D3.mpr
   intro path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := ho path ha
   refine ⟨hh,?_,hd⟩
   intro i j h0 h1 h2 ht hi hj hm hn hs hc
   by_cases he : (frame path).mid.a=2
   · have hi5 : 5 ≤ i := by
       by_contra hn
       apply hc
       exact ⟨he,by omega⟩
     exact source_two_vertical_regionsM0D3 i (by omega) (hu i hi5) path he j
   · exact hv i j h0 h1 h2 ht hi hj hm hn hs he

end
end MathGKM.Markov
