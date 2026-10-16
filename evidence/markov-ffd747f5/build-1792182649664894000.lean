import MarkovLowerUniformME9C
/-! Machine-authored ffd747f5. Row-polynomial transport, with guarded shifts. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

def rowCoeffsMFFD (f : ℕ → Polynomial ℤ) (i j : ℕ) : ℤ := (f j).coeff i
def rowShiftMFFD (a b : ℕ) (f : ℕ → Polynomial ℤ) (j : ℕ) : Polynomial ℤ :=
 if b ≤ j then X^a*f (j-b) else 0
def rowSMFFD (f : ℕ → Polynomial ℤ) (j : ℕ) : Polynomial ℤ :=
 rowShiftMFFD 1 0 f j+rowShiftMFFD 0 1 f j+f j
def rowDiscMFFD (f : ℕ → Polynomial ℤ) (j : ℕ) : Polynomial ℤ :=
 f j+2*rowShiftMFFD 1 0 f j-2*rowShiftMFFD 0 1 f j+
 rowShiftMFFD 2 0 f j+2*rowShiftMFFD 1 1 f j+rowShiftMFFD 0 2 f j

theorem row_shift_coeffMFFD (a b i j : ℕ) (f : ℕ → Polynomial ℤ) :
 (rowShiftMFFD a b f j).coeff i=shiftRawM9E2 a b (rowCoeffsMFFD f) i j := by
 unfold rowShiftMFFD shiftRawM9E2 rowCoeffsMFFD
 by_cases hb : b ≤ j
 · simp only [hb,if_true,and_true,Polynomial.coeff_X_pow_mul']
 · simp [hb]

theorem row_S_coeffMFFD (f : ℕ → Polynomial ℤ) (i j : ℕ) :
 (rowSMFFD f j).coeff i=addSRawM9E2 (rowCoeffsMFFD f) i j := by
 simp only [rowSMFFD,Polynomial.coeff_add,row_shift_coeffMFFD,addSRawM9E2,rowCoeffsMFFD]

theorem row_disc_coeffMFFD (f : ℕ → Polynomial ℤ) (i j : ℕ) :
 (rowDiscMFFD f j).coeff i=discriminantActionM96A (rowCoeffsMFFD f) i j := by
 simp only [rowDiscMFFD,Polynomial.coeff_add,Polynomial.coeff_sub,
   Polynomial.coeff_ofNat_mul,row_shift_coeffMFFD,discriminantActionM96A,rowCoeffsMFFD]

theorem row_S_twice_coeffMFFD (f : ℕ → Polynomial ℤ) (i j : ℕ) :
 (rowSMFFD (rowSMFFD f) j).coeff i=
 addSRawM9E2 (addSRawM9E2 (rowCoeffsMFFD f)) i j := by
 rw [row_S_coeffMFFD]
 have he : rowCoeffsMFFD (rowSMFFD f)=addSRawM9E2 (rowCoeffsMFFD f) :=
   funext fun i => funext fun j => row_S_coeffMFFD f i j
 rw [he]

theorem row_disc_zeroMFFD (f : ℕ → Polynomial ℤ) : rowDiscMFFD f 0=(X+1)^2*f 0 := by
 simp [rowDiscMFFD,rowShiftMFFD]
 ring
theorem row_disc_oneMFFD (f : ℕ → Polynomial ℤ) :
 rowDiscMFFD f 1=(X+1)^2*f 1+2*(X-1)*f 0 := by
 simp [rowDiscMFFD,rowShiftMFFD]
 ring
theorem row_disc_succMFFD (f : ℕ → Polynomial ℤ) (j : ℕ) :
 rowDiscMFFD f (j+2)=(X+1)^2*f (j+2)+2*(X-1)*f (j+1)+f j := by
 simp [rowDiscMFFD,rowShiftMFFD,show 1 ≤ j+2 by omega,show 2 ≤ j+2 by omega]
 ring
theorem row_S_twice_zeroMFFD (f : ℕ → Polynomial ℤ) :
 rowSMFFD (rowSMFFD f) 0=(X+1)^2*f 0 := by
 simp [rowSMFFD,rowShiftMFFD]
 ring
theorem row_S_twice_oneMFFD (f : ℕ → Polynomial ℤ) :
 rowSMFFD (rowSMFFD f) 1=(X+1)^2*f 1+2*(X+1)*f 0 := by
 simp [rowSMFFD,rowShiftMFFD]
 ring
theorem row_S_twice_succMFFD (f : ℕ → Polynomial ℤ) (j : ℕ) :
 rowSMFFD (rowSMFFD f) (j+2)=(X+1)^2*f (j+2)+2*(X+1)*f (j+1)+f j := by
 simp [rowSMFFD,rowShiftMFFD,show 1 ≤ j+2 by omega]
 ring

theorem raw_S_localMFFD (q : ℕ) (f g : ℕ → ℕ → ℤ)
 (h : ∀ i j, j ≤ q → f i j=g i j) :
 ∀ i j, j ≤ q → addSRawM9E2 f i j=addSRawM9E2 g i j := by
 intro i j hj
 have hs (a b : ℕ) : shiftRawM9E2 a b f i j=shiftRawM9E2 a b g i j := by
   unfold shiftRawM9E2
   split_ifs
   · exact h _ _ (by omega)
   · rfl
 unfold addSRawM9E2
 rw [hs,hs,h i j hj]

end
end MathGKM.Markov
