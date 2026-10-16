import MarkovLowLCME9C
/-! Machine-authored e9cdd527. Uniform obstruction to one natural
coordinatewise TP2 strengthening. The four entries come from different sources. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def lowerNaiveKernelME9C (r : Bool) (i j d : ℕ) : ℤ := threeRawM9E2 (j+d) r i j

theorem lower_naive_minorME9C (d : ℕ) (r : Bool) (hd : 1 ≤ d) :
 lowerNaiveKernelME9C r 4 0 d*lowerNaiveKernelME9C r 4 1 (d+1)-
 lowerNaiveKernelME9C r 4 1 d*lowerNaiveKernelME9C r 4 0 (d+1)= -42 := by
 have h0 := source_low_four_candidateME9C d 0 r hd (by omega)
 have h1 := source_low_four_candidateME9C (d+1) 1 r (by omega) (by omega)
 have h2 := source_low_four_candidateME9C (d+1) 0 r (by omega) (by omega)
 have h3 := source_low_four_candidateME9C (d+2) 1 r (by omega) (by omega)
 have h : (threeRawM9E2 d r 4 0:ℚ)*(threeRawM9E2 (d+2) r 4 1:ℚ)-
     (threeRawM9E2 (d+1) r 4 1:ℚ)*(threeRawM9E2 (d+1) r 4 0:ℚ)= -42 := by
   rw [h0,h1,h2,h3]
   unfold lowerCandidateM96A lowerCoreM96A
   push_cast
   ring
 unfold lowerNaiveKernelME9C
 simp only [Nat.zero_add,show 1+d=d+1 by omega,show 1+(d+1)=d+2 by omega]
 exact_mod_cast h

theorem lower_naive_tp2_falseME9C (r : Bool) :
 ¬(∀ j d, 1 ≤ j+d →
 lowerNaiveKernelME9C r 4 (j+1) d*lowerNaiveKernelME9C r 4 j (d+1) ≤
 lowerNaiveKernelME9C r 4 j d*lowerNaiveKernelME9C r 4 (j+1) (d+1)) := by
 intro h
 have hh := h 0 1 (by omega)
 have he := lower_naive_minorME9C 1 r (by omega)
 norm_num only at hh
 linarith

end
end MathGKM.Markov
