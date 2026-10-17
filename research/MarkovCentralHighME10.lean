import MarkovShiftDominationME10
import MarkovShiftAttachmentME10
import MarkovShiftTailClosedME10
/-! Machine-authored e108e0e2. Complete high-column inequalities across
the central rows, retaining the full correction and exterior zeros. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

theorem correction_short_zeroME10 (e k c : ℕ) (r : Bool) (hk : k < c+2) :
 correctionShortME10 e k c r=0 := by
 have hz (D a b : ℕ) (ha : c ≤ a) := middle_kernel_zeroMD02 D k a b (by omega)
 cases r <;> simp [correctionShortME10,hz _ c _ (by omega),hz _ (c+1) _ (by omega)]

theorem top_shift_zeroME10 (h T c : ℕ) (hc : T < c) : topShortME10 h T c=0 := by
 unfold topShortME10
 apply sum_eq_zero
 intro l hl
 rw [Nat.choose_eq_zero_of_lt (by omega : T < c+l),
   Nat.choose_eq_zero_of_lt (by omega : T+1 < c+l+2)]
 simp

theorem central_raw_zeroME10 (h k c : ℕ) (r : Bool) (hc : centralTME10 h k r < c) :
 centralRawME10 h k c r=0 := by
 rw [centralRawME10,top_shift_zeroME10 _ _ _ hc,correction_short_zeroME10]
 · simp
 · unfold centralTME10 at hc; omega

theorem central_raw_lastME10 (h k c : ℕ) (r : Bool)
 (he : centralTME10 h k r=c+2) :
 centralRawME10 h k c r*centralRawME10 h k (c+2) r ≤ centralRawME10 h k (c+1) r^2 := by
 have hk : k < c+2 := by unfold centralTME10 at he; omega
 unfold centralRawME10
 rw [correction_short_zeroME10 _ k c r hk,
   correction_short_zeroME10 _ k (c+2) r (by omega),
   correction_short_zeroME10 _ k (c+1) r (by omega)]
 simp only [add_zero,he,←top_shift_shortME10]
 exact (top_mass_last_strictME10 h c).le

theorem central_raw_largeME10 (h k c : ℕ) (r : Bool) (hc : 10 ≤ c) :
 centralRawME10 h k c r*centralRawME10 h k (c+2) r ≤ centralRawME10 h k (c+1) r^2 := by
 by_cases hT : c+3 ≤ centralTME10 h k r
 · have ht := template_centered_largeME10 h (centralTME10 h k r) c hc hT
   simp only [top_shift_shortME10] at ht
   have hu := central_weak_boundME10 h k c r (by omega)
   have hw := central_weak_boundME10 h k (c+2) r (by omega)
   have hwn := correction_short_nonnegME10 (h+(if r then 1 else 0)) k (c+2) r
   have hw' : 4*(8*((c:ℤ)+4)+1)*correctionShortME10 (h+(if r then 1 else 0)) k (c+2) r ≤
     topShortME10 h (centralTME10 h k r) (c+2) := by
     push_cast at hw
     nlinarith
   have hn (l : ℕ) : 0 ≤ topShortME10 h (centralTME10 h k r) l := by
     rw [←top_shift_shortME10]; exact top_shift_nonnegME10 _ _ _
   exact positive_perturbationM41B _ _ _ _ _ _ (8*((c:ℤ)+4))
     (hn _) (hn _) (hn _) (correction_short_nonnegME10 _ _ _ _)
     (correction_short_nonnegME10 _ _ _ _) hwn (by omega) ht hu hw'
 by_cases he : centralTME10 h k r=c+2
 · exact central_raw_lastME10 h k c r he
 · rw [central_raw_zeroME10 h k (c+2) r (by omega),mul_zero]
   exact sq_nonneg _

theorem source_central_highME10 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : q+3 < j) (hcentral : sourceNME9C q r < 2*j+1 ∧ 2*j ≤ sourceNME9C q r+3)
 (hi : 13 ≤ i) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 obtain ⟨h,k,hh,hq',hj'⟩ := central_parametersME10 q j r hq hj hcentral
 have he : i=i-3+3 := by omega
 subst q
 rw [hj',he,central_source_formulaME10 _ _ _ r hq,
   show i-3+3+2=(i-3+2)+3 by omega,central_source_formulaME10 _ _ _ r hq,
   show i-3+3+1=(i-3+1)+3 by omega,central_source_formulaME10 _ _ _ r hq]
 exact central_raw_largeME10 h k (i-3) r (by omega)

end
end MathGKM.Markov
