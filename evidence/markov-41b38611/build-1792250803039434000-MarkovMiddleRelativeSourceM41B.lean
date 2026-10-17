import MarkovMiddlePerturbationM41B
/-! Machine-authored 41b38611. Unconditional relative-error bounds for the
actual raw middle coefficients, including zeros. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
attribute [local irreducible] topShortSumMEB6 threeRawM9E2

theorem middle_raw_relativeM41B (x k c : ℕ) (r : Bool) :
 middleTemplateMD02 x k r c ≤ middleRawMD02 x k r c ∧
 (3:ℤ)^(c+2)*middleRawMD02 x k r c ≤
 ((3:ℤ)^(c+2)+21)*middleTemplateMD02 x k r c := by
 have hn := correction_short_nonnegMD02 (x+middleBaseMD02 r-2) k c r
 have he := correction_exponential_boundM41B x k c r
 unfold middleRawMD02 middleTemplateMD02 middleCorrMD02 at *
 constructor <;> nlinarith

theorem source_middle_relativeM41B (x k c : ℕ) (r : Bool) :
 let q := x+2*k+middleBaseMD02 r
 let j := sourceNME9C q r+2-(q+3+k)
 middleTemplateMD02 x k r c ≤ threeRawM9E2 q r (c+3) j ∧
 (3:ℤ)^(c+2)*threeRawM9E2 q r (c+3) j ≤
 ((3:ℤ)^(c+2)+21)*middleTemplateMD02 x k r c := by
 dsimp only
 rw [source_middle_integerMD02]
 exact middle_raw_relativeM41B x k c r

theorem source_middle_relative_allM41B (q k c : ℕ) (r : Bool)
 (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 let x := q-(2*k+middleBaseMD02 r)
 let j := sourceNME9C q r+2-(q+3+k)
 middleTemplateMD02 x k r c ≤ threeRawM9E2 q r (c+3) j ∧
 (3:ℤ)^(c+2)*threeRawM9E2 q r (c+3) j ≤
 ((3:ℤ)^(c+2)+21)*middleTemplateMD02 x k r c := by
 obtain ⟨x,rfl⟩ := middle_parameter_existsMD02 q k r hn
 simpa only [Nat.add_sub_cancel_right] using source_middle_relativeM41B x k c r

theorem path_middle_relativeM41B (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ k c, 2*(q+3+k) ≤ sourceNME9C q r →
 let x := q-(2*k+middleBaseMD02 r)
 let j := sourceNME9C q r+2-(q+3+k)
 middleTemplateMD02 x k r c ≤ coeff (frame path).mid.p (c+3) j ∧
 (3:ℤ)^(c+2)*coeff (frame path).mid.p (c+3) j ≤
 ((3:ℤ)^(c+2)+21)*middleTemplateMD02 x k r c := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro k c hn
 dsimp only
 simp only [hp]
 exact source_middle_relative_allM41B q k c r hn

end
end MathGKM.Markov
