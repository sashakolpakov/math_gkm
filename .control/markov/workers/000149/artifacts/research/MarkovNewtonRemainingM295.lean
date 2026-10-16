import MarkovNewtonReductionM295
import MarkovEightVerticalM295
/-! Machine-authored 29509309. The completed eighth column need not be
reproved by the proposed stronger Newton sign condition. -/
namespace MathGKM.Markov
noncomputable section

theorem root_of_remaining_newtonM295
 (hn : ∀ i : ℕ, 5 ≤ i → i ≠ 8 → NewtonVerticalM295 i)
 (ho : OtherVerticalCoreM0D3) : Conjecture63 := by
 apply root_iff_uniform_verticalM0D3.mpr
 refine ⟨?_,ho⟩
 intro i hi
 by_cases he : i=8
 · subst i
   exact vertical_regions_eightM295
 · exact regions_of_newtonM295 i (by omega) (hn i hi he)

end
end MathGKM.Markov
