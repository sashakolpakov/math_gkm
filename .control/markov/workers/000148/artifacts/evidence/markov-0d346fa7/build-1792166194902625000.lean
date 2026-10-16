import MarkovFourCertificateM0D3
/-! Machine-authored 0d346fa7. The complete raw fourth vertical column of
every numerator-two source, including zeros and all denominators. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem lower_four_lcM0D3 (j d : ℕ) :
 lowerValM58E j (d+2) 4*lowerValM58E (j+2) d 4 ≤
 lowerValM58E (j+1) (d+1) 4^2 := by
 have h := lower_gap_four_nonnegM0D3 (j:ℚ) (d:ℚ) (by positivity) (by positivity)
 have h0 := lower_polynomial_eqM0D3 4 j (d+2)
 have h1 := lower_polynomial_eqM0D3 4 (j+1) (d+1)
 have h2 := lower_polynomial_eqM0D3 4 (j+2) d
 push_cast at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 exact_mod_cast (sub_nonneg.mp h)

theorem upper_four_lcM0D3 (N d : ℕ) (hN : 4 ≤ N+2) :
 upperValM2B3 (N+2) (d+1) 4*upperValM2B3 N (d+3) 4 ≤
 upperValM2B3 (N+1) (d+2) 4^2 := by
 obtain ⟨n,rfl⟩ : ∃ n, N=n+2 := ⟨N-2,by omega⟩
 have h := upper_gap_four_nonnegM0D3 (n:ℚ) (d:ℚ) (by positivity) (by positivity)
 have h0 := upper_polynomial_eqM0D3 4 (n+4) (d+1) (by omega) (by omega)
 have h1 := upper_polynomial_eqM0D3 4 (n+3) (d+2) (by omega) (by omega)
 have h2 := upper_polynomial_eqM0D3 4 (n+2) (d+3) (by omega) (by omega)
 push_cast at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 have hh : upperValM2B3 (n+4) (d+1) 4*upperValM2B3 (n+2) (d+3) 4 ≤
   upperValM2B3 (n+3) (d+2) 4^2 := by exact_mod_cast (sub_nonneg.mp h)
 simpa only [Nat.add_assoc] using hh

theorem cross_one_four_lcM0D3 (q : ℕ) (hq : 4 ≤ q+1) :
 lowerValM58E (q-1) 1 4*upperValM2B3 (q-1) 1 4 ≤ lowerValM58E q 0 4^2 := by
 obtain ⟨n,rfl⟩ : ∃ n, q=n+3 := ⟨q-3,by omega⟩
 have h := cross_one_gap_four_nonnegM0D3 (n:ℚ) (by positivity)
 have h0 := lower_polynomial_eqM0D3 4 (n+2) 1
 have h1 := lower_polynomial_eqM0D3 4 (n+3) 0
 have h2 := upper_polynomial_eqM0D3 4 (n+2) 1 (by omega) (by omega)
 push_cast at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 have hh : lowerValM58E (n+2) 1 4*upperValM2B3 (n+2) 1 4 ≤ lowerValM58E (n+3) 0 4^2 := by
   exact_mod_cast (sub_nonneg.mp h)
 simpa only [show n+3-1=n+2 by omega] using hh

theorem cross_two_four_lcM0D3 (q : ℕ) (hq : 4 ≤ q) :
 lowerValM58E q 0 4*upperValM2B3 (q-2) 2 4 ≤ upperValM2B3 (q-1) 1 4^2 := by
 obtain ⟨n,rfl⟩ : ∃ n, q=n+4 := ⟨q-4,by omega⟩
 have h := cross_two_gap_four_nonnegM0D3 (n:ℚ) (by positivity)
 have h0 := lower_polynomial_eqM0D3 4 (n+4) 0
 have h1 := upper_polynomial_eqM0D3 4 (n+3) 1 (by omega) (by omega)
 have h2 := upper_polynomial_eqM0D3 4 (n+2) 2 (by omega) (by omega)
 push_cast at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 have hh : lowerValM58E (n+4) 0 4*upperValM2B3 (n+2) 2 4 ≤ upperValM2B3 (n+3) 1 4^2 := by
   exact_mod_cast (sub_nonneg.mp h)
 simpa only [show n+4-1=n+3 by omega,show n+4-2=n+2 by omega] using hh

theorem vertical_regions_fourM0D3 : VerticalRegionsM0D3 4 :=
 ⟨lower_four_lcM0D3,upper_four_lcM0D3,cross_one_four_lcM0D3,cross_two_four_lcM0D3⟩

theorem source_two_vertical_fourM0D3 (path : List Bool)
 (ha : (frame path).mid.a=2) (j : ℕ) :
 coeff (frame path).mid.p 4 j*coeff (frame path).mid.p 4 (j+2) ≤
 coeff (frame path).mid.p 4 (j+1)^2 :=
 source_two_vertical_regionsM0D3 4 (by omega) vertical_regions_fourM0D3 path ha j

end
end MathGKM.Markov
