import MarkovSmallCertificateM8F7
/-! Machine-authored 8f77f493. Integer transport of the three small-column gaps. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem small_upper_arithmeticM8F7 (N d : ℕ) (hN : 3≤N) (hd : 1≤d) :
 upperValM2B3 (N-2) (d+2) 1*upperValM2B3 N d 3≤
 upperValM2B3 (N-1) (d+1) 2^2 := by
 obtain ⟨x,rfl⟩ : ∃ x,N=x+3 := ⟨N-3,by omega⟩
 obtain ⟨y,rfl⟩ : ∃ y,d=y+1 := ⟨d-1,by omega⟩
 have h := small_gap_upper_nonnegM8F7 (x:ℚ) (y:ℚ) (by positivity) (by positivity)
 have h0 := upper_polynomial_eqM0D3 1 (x+1) (y+3) (by omega) (by omega)
 have h1 := upper_polynomial_eqM0D3 2 (x+2) (y+2) (by omega) (by omega)
 have h2 := upper_polynomial_eqM0D3 3 (x+3) (y+1) (by omega) (by omega)
 push_cast at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 have hh : upperValM2B3 (x+1) (y+3) 1*upperValM2B3 (x+3) (y+1) 3≤
     upperValM2B3 (x+2) (y+2) 2^2 := by exact_mod_cast sub_nonneg.mp h
 simpa only [show x+3-2=x+1 by omega,show x+3-1=x+2 by omega,Nat.add_assoc] using hh

theorem small_cross0_arithmeticM8F7 (q : ℕ) (hq : 3≤q) :
 upperValM2B3 (q-2) 2 1*lowerValM58E q 0 3≤upperValM2B3 (q-1) 1 2^2 := by
 obtain ⟨x,rfl⟩ : ∃ x,q=x+3 := ⟨q-3,by omega⟩
 have h := small_gap_cross0_nonnegM8F7 (x:ℚ) (by positivity)
 have h0 := upper_polynomial_eqM0D3 1 (x+1) 2 (by omega) (by omega)
 have h1 := upper_polynomial_eqM0D3 2 (x+2) 1 (by omega) (by omega)
 have h2 := lower_polynomial_eqM0D3 3 (x+3) 0
 push_cast at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 have hh : upperValM2B3 (x+1) 2 1*lowerValM58E (x+3) 0 3≤
     upperValM2B3 (x+2) 1 2^2 := by exact_mod_cast sub_nonneg.mp h
 simpa only [show x+3-2=x+1 by omega,show x+3-1=x+2 by omega] using hh

theorem small_cross1_arithmeticM8F7 (q : ℕ) (hq : 2≤q) :
 upperValM2B3 (q-1) 1 1*lowerValM58E (q-1) 1 3≤lowerValM58E q 0 2^2 := by
 obtain ⟨x,rfl⟩ : ∃ x,q=x+2 := ⟨q-2,by omega⟩
 have h := small_gap_cross1_nonnegM8F7 (x:ℚ) (by positivity)
 have h0 := upper_polynomial_eqM0D3 1 (x+1) 1 (by omega) (by omega)
 have h1 := lower_polynomial_eqM0D3 2 (x+2) 0
 have h2 := lower_polynomial_eqM0D3 3 (x+1) 1
 push_cast at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 have hh : upperValM2B3 (x+1) 1 1*lowerValM58E (x+1) 1 3≤
     lowerValM58E (x+2) 0 2^2 := by exact_mod_cast sub_nonneg.mp h
 simpa only [show x+2-1=x+1 by omega] using hh

end
end MathGKM.Markov
