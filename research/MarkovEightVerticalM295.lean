import MarkovEightLowerM295
import MarkovEightUpperM295
import MarkovEightCrossOneM295
import MarkovEightCrossTwoM295
/-! Machine-authored 29509309. The complete raw eighth vertical column of
every numerator-two source, including zeros and all denominators. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem lower_eight_lcM295 (j d : ℕ) :
 lowerValM58E j (d+2) 8*lowerValM58E (j+2) d 8 ≤
 lowerValM58E (j+1) (d+1) 8^2 := by
 have h := lower_gap_eight_nonnegM295 j d
 have h0 := lower_polynomial_eqM0D3 8 j (d+2)
 have h1 := lower_polynomial_eqM0D3 8 (j+1) (d+1)
 have h2 := lower_polynomial_eqM0D3 8 (j+2) d
 push_cast at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 exact_mod_cast (sub_nonneg.mp h)

theorem upper_eight_lcM295 (N d : ℕ) (hN : 8 ≤ N+2) :
 upperValM2B3 (N+2) (d+1) 8*upperValM2B3 N (d+3) 8 ≤
 upperValM2B3 (N+1) (d+2) 8^2 := by
 obtain ⟨n,rfl⟩ : ∃ n, N=n+6 := ⟨N-6,by omega⟩
 have h := upper_gap_eight_nonnegM295 (n:ℚ) (d:ℚ) (by positivity) (by positivity)
 have h0 := upper_polynomial_eqM0D3 8 (n+8) (d+1) (by omega) (by omega)
 have h1 := upper_polynomial_eqM0D3 8 (n+7) (d+2) (by omega) (by omega)
 have h2 := upper_polynomial_eqM0D3 8 (n+6) (d+3) (by omega) (by omega)
 push_cast at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 have hh : upperValM2B3 (n+8) (d+1) 8*upperValM2B3 (n+6) (d+3) 8 ≤
   upperValM2B3 (n+7) (d+2) 8^2 := by exact_mod_cast (sub_nonneg.mp h)
 simpa only [Nat.add_assoc] using hh

theorem cross_one_eight_lcM295 (q : ℕ) (hq : 8 ≤ q+1) :
 lowerValM58E (q-1) 1 8*upperValM2B3 (q-1) 1 8 ≤ lowerValM58E q 0 8^2 := by
 obtain ⟨n,rfl⟩ : ∃ n, q=n+7 := ⟨q-7,by omega⟩
 have h := cross_one_gap_eight_nonnegM295 (n:ℚ) (by positivity)
 have h0 := lower_polynomial_eqM0D3 8 (n+6) 1
 have h1 := lower_polynomial_eqM0D3 8 (n+7) 0
 have h2 := upper_polynomial_eqM0D3 8 (n+6) 1 (by omega) (by omega)
 push_cast at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 have hh : lowerValM58E (n+6) 1 8*upperValM2B3 (n+6) 1 8 ≤ lowerValM58E (n+7) 0 8^2 := by
   exact_mod_cast (sub_nonneg.mp h)
 simpa only [show n+7-1=n+6 by omega] using hh

theorem cross_two_eight_lcM295 (q : ℕ) (hq : 8 ≤ q) :
 lowerValM58E q 0 8*upperValM2B3 (q-2) 2 8 ≤ upperValM2B3 (q-1) 1 8^2 := by
 obtain ⟨n,rfl⟩ : ∃ n, q=n+8 := ⟨q-8,by omega⟩
 have h := cross_two_gap_eight_nonnegM295 (n:ℚ) (by positivity)
 have h0 := lower_polynomial_eqM0D3 8 (n+8) 0
 have h1 := upper_polynomial_eqM0D3 8 (n+7) 1 (by omega) (by omega)
 have h2 := upper_polynomial_eqM0D3 8 (n+6) 2 (by omega) (by omega)
 push_cast at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 have hh : lowerValM58E (n+8) 0 8*upperValM2B3 (n+6) 2 8 ≤ upperValM2B3 (n+7) 1 8^2 := by
   exact_mod_cast (sub_nonneg.mp h)
 simpa only [show n+8-1=n+7 by omega,show n+8-2=n+6 by omega] using hh

theorem vertical_regions_eightM295 : VerticalRegionsM0D3 8 :=
 ⟨lower_eight_lcM295,upper_eight_lcM295,cross_one_eight_lcM295,cross_two_eight_lcM295⟩

theorem source_two_vertical_eightM295 (path : List Bool)
 (ha : (frame path).mid.a=2) (j : ℕ) :
 coeff (frame path).mid.p 8 j*coeff (frame path).mid.p 8 (j+2) ≤
 coeff (frame path).mid.p 8 (j+1)^2 :=
 source_two_vertical_regionsM0D3 8 (by omega) vertical_regions_eightM295 path ha j

end
end MathGKM.Markov
