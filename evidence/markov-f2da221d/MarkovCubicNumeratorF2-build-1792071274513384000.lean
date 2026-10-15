import MarkovCubicMomentsF2
/-! Machine-authored f2da221d. First shifted numerator coefficient. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

theorem fourthNumerator_cubicF2 {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) (hx : x^3=0) :
 fourthNumeratorBC N Z x c r-fourthNumeratorBC N 0 x c r=
 Z*x^2*shiftCorrectionF2 N c r := by
 have hx4 : x^4=0 := by rw [show 4=3+1 by omega,pow_add,hx,zero_mul]
 have hx5 : x^5=0 := by rw [show 5=3+2 by omega,pow_add,hx,zero_mul]
 have hx6 : x^6=0 := by rw [show 6=3+3 by omega,pow_add,hx,zero_mul]
 have hx7 : x^7=0 := by rw [show 7=3+4 by omega,pow_add,hx,zero_mul]
 have hx8 : x^8=0 := by rw [show 8=3+5 by omega,pow_add,hx,zero_mul]
 have hx9 : x^9=0 := by rw [show 9=3+6 by omega,pow_add,hx,zero_mul]
 have hx10 : x^10=0 := by rw [show 10=3+7 by omega,pow_add,hx,zero_mul]
 have hx11 : x^11=0 := by rw [show 11=3+8 by omega,pow_add,hx,zero_mul]
 have hx12 : x^12=0 := by rw [show 12=3+9 by omega,pow_add,hx,zero_mul]
 have hx13 : x^13=0 := by rw [show 13=3+10 by omega,pow_add,hx,zero_mul]
 have hx14 : x^14=0 := by rw [show 14=3+11 by omega,pow_add,hx,zero_mul]
 have hx15 : x^15=0 := by rw [show 15=3+12 by omega,pow_add,hx,zero_mul]
 have hx16 : x^16=0 := by rw [show 16=3+13 by omega,pow_add,hx,zero_mul]
 unfold fourthNumeratorBC
 dsimp only
 rw [thirdMoment_cubicF2 N Z x _ _ _ _ _ hx,thirdMoment_cubicF2 N 0 x _ _ _ _ _ hx,
   fourMoment_cubicF2 N Z x c r hx,fourMoment_cubicF2 N 0 x c r hx]
 simp only [firstNumBC,secondNumBC,cubicThirdF2,cubicFourF2,shiftCorrectionF2,hx,hx4,hx5,hx6,hx7,hx8,hx9,hx10,hx11,hx12,hx13,hx14,hx15,hx16,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
 ring_nf
 simp only [hx,hx4,hx5,hx6,hx7,hx8,hx9,hx10,hx11,hx12,hx13,hx14,hx15,hx16,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
end
end MathGKM.Markov
