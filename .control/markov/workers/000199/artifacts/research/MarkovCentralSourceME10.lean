import MarkovTopShiftME10
import MarkovCorrectionShiftME10
import MarkovHorizontalTwoExceptionsME87
/-! Machine-authored e108e0e2. Uniform source bridge across the central rows.
The shift h is nonnegative and represents the signed offset h-4 exactly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

def centralQME10 (h k : ℕ) (r : Bool) : ℕ := 2*k+h+(if r then 1 else 0)
def centralTME10 (h k : ℕ) (r : Bool) : ℕ := 3*k+h+(if r then 1 else 0)
def centralRawME10 (h k c : ℕ) (r : Bool) : ℤ :=
 topShortME10 h (centralTME10 h k r) c+
 correctionShortME10 (h+(if r then 1 else 0)) k c r

theorem central_source_formulaME10 (h k c : ℕ) (r : Bool)
 (hq : 1 ≤ centralQME10 h k r) :
 threeRawM9E2 (centralQME10 h k r) r (c+3)
   (sourceNME9C (centralQME10 h k r) r+2-(centralQME10 h k r+3+k))=
 centralRawME10 h k c r := by
 have hk : k ≤ centralQME10 h k r := by unfold centralQME10; omega
 have he := congrArg (fun p : Polynomial ℤ => p.coeff (c+3))
   (source_middle_formulaM99A (centralQME10 h k r) k r hq hk)
 simp only [raw_row_coeffMC3E,three_raw_formulaM9E2,Polynomial.coeff_add] at he
 have hq' : centralQME10 h k r=h+(if r then 1 else 0)+2*k := by unfold centralQME10; omega
 have ht : centralQME10 h k r+3+k=centralTME10 h k r+3 := by
   unfold centralQME10 centralTME10; omega
 have hn : sourceNME9C (centralQME10 h k r) r=2*centralTME10 h k r+h+2 := by
   cases r <;> simp [sourceNME9C,centralQME10,centralTME10] <;> omega
 rw [he,ht,hn,top_shift_massME10,top_shift_shortME10,hq',correction_short_shiftME10]
 rfl

theorem central_source_polygonME10 (h k c : ℕ) (r : Bool)
 (hq : 1 ≤ centralQME10 h k r) (hc : c ≤ centralTME10 h k r) :
 InPolygon 3 (sourceNME9C (centralQME10 h k r) r) (c+3)
   (sourceNME9C (centralQME10 h k r) r+2-(centralQME10 h k r+3+k)) := by
 apply middle_polygonM99A _ _ _ r hq
 · unfold centralQME10; omega
 · omega
 · unfold centralQME10 centralTME10 at *; omega

theorem central_source_pathME10 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ h k c, q=centralQME10 h k r →
 coeff (frame path).mid.p (c+3) ((frame path).mid.b+2-(q+3+k))=centralRawME10 h k c r := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro h k c he
 rw [hb,hp,he]
 exact central_source_formulaME10 h k c r (he ▸ hq)

theorem central_parametersME10 (q j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : q+3 < j) (hcentral : sourceNME9C q r < 2*j+1 ∧ 2*j ≤ sourceNME9C q r+3) :
 ∃ h k, h ≤ 3 ∧ q=centralQME10 h k r ∧
 j=sourceNME9C q r+2-(q+3+k) := by
 cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] at *
 · refine ⟨2*j-(3*q+2),2*q+1-j,?_,?_,?_⟩
   all_goals (try simp only [centralQME10,Bool.false_eq_true,if_false] at *) <;> omega
 · refine ⟨2*j-(3*q+1),2*q-j,?_,?_,?_⟩
   all_goals (try simp only [centralQME10,if_true] at *) <;> omega

end
end MathGKM.Markov
