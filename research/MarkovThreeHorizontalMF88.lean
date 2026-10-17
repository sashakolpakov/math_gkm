import MarkovCentralNineME10
import MarkovCentralLow1MF88
import MarkovCentralLow2MF88
import MarkovCentralLow3MF88
import MarkovCentralLow4MF88
import MarkovCentralLow5MF88
import MarkovCentralLow6MF88
import MarkovCentralLow7MF88
import MarkovCentralLow8MF88
import MarkovCentralLow9MF88
/-! Machine-authored f88f6a75. Complete horizontal raw log-concavity for
numerator three. Other directions and numerator families remain open. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

theorem central_raw_allMF88 (h k c : ℕ) (r : Bool) (hh : h ≤ 3) (hk : 3 ≤ k+h) :
 centralRawME10 h k c r*centralRawME10 h k (c+2) r ≤ centralRawME10 h k (c+1) r^2 := by
 by_cases hc : 10 ≤ c
 · exact central_raw_largeME10 h k c r hc
 have hc' : c ≤ 9 := by omega
 interval_cases c
 · exact central_low_0ME10 h k r hh hk
 · exact central_low_1MF88 h k r hh hk
 · exact central_low_2MF88 h k r hh hk
 · exact central_low_3MF88 h k r hh hk
 · exact central_low_4MF88 h k r hh hk
 · exact central_low_5MF88 h k r hh hk
 · exact central_low_6MF88 h k r hh hk
 · exact central_low_7MF88 h k r hh hk
 · exact central_low_8MF88 h k r hh hk
 · exact central_low_9MF88 h k r hh hk

theorem source_central_allMF88 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : q+3 < j) (hc : sourceNME9C q r < 2*j+1 ∧ 2*j ≤ sourceNME9C q r+3) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 by_cases hi0 : i ≤ 1
 · exact source_central_lowME10 q i j r hq hi0 hj hc.2
 by_cases hi2 : i=2
 · subst i
   exact source_central_secondME10 q j r hq hj hc
 obtain ⟨h,k,hh,hq',hj'⟩ := central_parametersME10 q j r hq hj hc
 subst q
 have hk3 : 3 ≤ k+h := by
   rw [hj'] at hj
   cases r <;> simp only [sourceNME9C,centralQME10,Bool.false_eq_true,if_false,if_true] at hj <;> omega
 have he : i=i-3+3 := by omega
 rw [hj',he,central_source_formulaME10 _ _ _ r hq,
   show i-3+3+2=(i-3+2)+3 by omega,central_source_formulaME10 _ _ _ r hq,
   show i-3+3+1=(i-3+1)+3 by omega,central_source_formulaME10 _ _ _ r hq]
 exact central_raw_allMF88 h k (i-3) r hh hk3

theorem source_three_horizontalMF88 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 by_cases hl : 2*j+1 ≤ sourceNME9C q r
 · exact source_lower_halfM5BF q i j r hq hl
 by_cases hj : j ≤ q+3
 · exact lower_and_three_correctionsM964 q i j r hq hj
 by_cases hc : 2*j ≤ sourceNME9C q r+3
 · exact source_central_allMF88 q i j r hq (by omega) ⟨by omega,hc⟩
 · exact source_horizontal_outside_centralME87 q i j r hq (by omega)

theorem path_three_horizontalMF88 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) : coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 simp only [hp]
 exact source_three_horizontalMF88 q i j r hq

theorem path_three_horizontal_polygonMF88 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (_h0 : InPolygon 3 (frame path).mid.b i j)
 (_h1 : InPolygon 3 (frame path).mid.b (i+1) j)
 (_h2 : InPolygon 3 (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := path_three_horizontalMF88 path ha i j

end
end MathGKM.Markov
