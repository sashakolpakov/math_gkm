import MarkovThirdAllBoundsDefM115
/-! Machine-authored 03d5764d. Elementary cubic coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false
def cubicM03 (a00 a01 a02 a03 a10 a11 a12 a20 a21 a30 x y : ℤ) : ℤ :=
 a00*1+a01*y+a02*y^2+a03*y^3+a10*x+a11*x*y+a12*x*y^2+a20*x^2+a21*x^2*y+a30*x^3
theorem cubic_lcM03 (x y : ℤ) (a00 a01 a02 a03 a10 a11 a12 a20 a21 a30 b00 b01 b02 b03 b10 b11 b12 b20 b21 b30 c00 c01 c02 c03 c10 c11 c12 c20 c21 c30 : ℤ)
 (hx : 0 ≤ x) (hy : 0 ≤ y)
 (h00 : 0 ≤ b00*b00-(a00*c00))
 (h01 : 0 ≤ b00*b01+b01*b00-(a00*c01+a01*c00))
 (h02 : 0 ≤ b00*b02+b01*b01+b02*b00-(a00*c02+a01*c01+a02*c00))
 (h03 : 0 ≤ b00*b03+b01*b02+b02*b01+b03*b00-(a00*c03+a01*c02+a02*c01+a03*c00))
 (h04 : 0 ≤ b01*b03+b02*b02+b03*b01-(a01*c03+a02*c02+a03*c01))
 (h05 : 0 ≤ b02*b03+b03*b02-(a02*c03+a03*c02))
 (h06 : 0 ≤ b03*b03-(a03*c03))
 (h10 : 0 ≤ b00*b10+b10*b00-(a00*c10+a10*c00))
 (h11 : 0 ≤ b00*b11+b01*b10+b10*b01+b11*b00-(a00*c11+a01*c10+a10*c01+a11*c00))
 (h12 : 0 ≤ b00*b12+b01*b11+b02*b10+b10*b02+b11*b01+b12*b00-(a00*c12+a01*c11+a02*c10+a10*c02+a11*c01+a12*c00))
 (h13 : 0 ≤ b01*b12+b02*b11+b03*b10+b10*b03+b11*b02+b12*b01-(a01*c12+a02*c11+a03*c10+a10*c03+a11*c02+a12*c01))
 (h14 : 0 ≤ b02*b12+b03*b11+b11*b03+b12*b02-(a02*c12+a03*c11+a11*c03+a12*c02))
 (h15 : 0 ≤ b03*b12+b12*b03-(a03*c12+a12*c03))
 (h20 : 0 ≤ b00*b20+b10*b10+b20*b00-(a00*c20+a10*c10+a20*c00))
 (h21 : 0 ≤ b00*b21+b01*b20+b10*b11+b11*b10+b20*b01+b21*b00-(a00*c21+a01*c20+a10*c11+a11*c10+a20*c01+a21*c00))
 (h22 : 0 ≤ b01*b21+b02*b20+b10*b12+b11*b11+b12*b10+b20*b02+b21*b01-(a01*c21+a02*c20+a10*c12+a11*c11+a12*c10+a20*c02+a21*c01))
 (h23 : 0 ≤ b02*b21+b03*b20+b11*b12+b12*b11+b20*b03+b21*b02-(a02*c21+a03*c20+a11*c12+a12*c11+a20*c03+a21*c02))
 (h24 : 0 ≤ b03*b21+b12*b12+b21*b03-(a03*c21+a12*c12+a21*c03))
 (h30 : 0 ≤ b00*b30+b10*b20+b20*b10+b30*b00-(a00*c30+a10*c20+a20*c10+a30*c00))
 (h31 : 0 ≤ b01*b30+b10*b21+b11*b20+b20*b11+b21*b10+b30*b01-(a01*c30+a10*c21+a11*c20+a20*c11+a21*c10+a30*c01))
 (h32 : 0 ≤ b02*b30+b11*b21+b12*b20+b20*b12+b21*b11+b30*b02-(a02*c30+a11*c21+a12*c20+a20*c12+a21*c11+a30*c02))
 (h33 : 0 ≤ b03*b30+b12*b21+b21*b12+b30*b03-(a03*c30+a12*c21+a21*c12+a30*c03))
 (h40 : 0 ≤ b10*b30+b20*b20+b30*b10-(a10*c30+a20*c20+a30*c10))
 (h41 : 0 ≤ b11*b30+b20*b21+b21*b20+b30*b11-(a11*c30+a20*c21+a21*c20+a30*c11))
 (h42 : 0 ≤ b12*b30+b21*b21+b30*b12-(a12*c30+a21*c21+a30*c12))
 (h50 : 0 ≤ b20*b30+b30*b20-(a20*c30+a30*c20))
 (h51 : 0 ≤ b21*b30+b30*b21-(a21*c30+a30*c21))
 (h60 : 0 ≤ b30*b30-(a30*c30))
 : cubicM03 a00 a01 a02 a03 a10 a11 a12 a20 a21 a30 x y * cubicM03 c00 c01 c02 c03 c10 c11 c12 c20 c21 c30 x y ≤ (cubicM03 b00 b01 b02 b03 b10 b11 b12 b20 b21 b30 x y)^2 := by
 apply sub_nonneg.mp
 have he : (cubicM03 b00 b01 b02 b03 b10 b11 b12 b20 b21 b30 x y)^2-cubicM03 a00 a01 a02 a03 a10 a11 a12 a20 a21 a30 x y*cubicM03 c00 c01 c02 c03 c10 c11 c12 c20 c21 c30 x y=
 (b00*b00-(a00*c00))*1+(b00*b01+b01*b00-(a00*c01+a01*c00))*y+(b00*b02+b01*b01+b02*b00-(a00*c02+a01*c01+a02*c00))*y^2+(b00*b03+b01*b02+b02*b01+b03*b00-(a00*c03+a01*c02+a02*c01+a03*c00))*y^3+(b01*b03+b02*b02+b03*b01-(a01*c03+a02*c02+a03*c01))*y^4+(b02*b03+b03*b02-(a02*c03+a03*c02))*y^5+(b03*b03-(a03*c03))*y^6+(b00*b10+b10*b00-(a00*c10+a10*c00))*x+(b00*b11+b01*b10+b10*b01+b11*b00-(a00*c11+a01*c10+a10*c01+a11*c00))*x*y+(b00*b12+b01*b11+b02*b10+b10*b02+b11*b01+b12*b00-(a00*c12+a01*c11+a02*c10+a10*c02+a11*c01+a12*c00))*x*y^2+(b01*b12+b02*b11+b03*b10+b10*b03+b11*b02+b12*b01-(a01*c12+a02*c11+a03*c10+a10*c03+a11*c02+a12*c01))*x*y^3+(b02*b12+b03*b11+b11*b03+b12*b02-(a02*c12+a03*c11+a11*c03+a12*c02))*x*y^4+(b03*b12+b12*b03-(a03*c12+a12*c03))*x*y^5+(b00*b20+b10*b10+b20*b00-(a00*c20+a10*c10+a20*c00))*x^2+(b00*b21+b01*b20+b10*b11+b11*b10+b20*b01+b21*b00-(a00*c21+a01*c20+a10*c11+a11*c10+a20*c01+a21*c00))*x^2*y+(b01*b21+b02*b20+b10*b12+b11*b11+b12*b10+b20*b02+b21*b01-(a01*c21+a02*c20+a10*c12+a11*c11+a12*c10+a20*c02+a21*c01))*x^2*y^2+(b02*b21+b03*b20+b11*b12+b12*b11+b20*b03+b21*b02-(a02*c21+a03*c20+a11*c12+a12*c11+a20*c03+a21*c02))*x^2*y^3+(b03*b21+b12*b12+b21*b03-(a03*c21+a12*c12+a21*c03))*x^2*y^4+(b00*b30+b10*b20+b20*b10+b30*b00-(a00*c30+a10*c20+a20*c10+a30*c00))*x^3+(b01*b30+b10*b21+b11*b20+b20*b11+b21*b10+b30*b01-(a01*c30+a10*c21+a11*c20+a20*c11+a21*c10+a30*c01))*x^3*y+(b02*b30+b11*b21+b12*b20+b20*b12+b21*b11+b30*b02-(a02*c30+a11*c21+a12*c20+a20*c12+a21*c11+a30*c02))*x^3*y^2+(b03*b30+b12*b21+b21*b12+b30*b03-(a03*c30+a12*c21+a21*c12+a30*c03))*x^3*y^3+(b10*b30+b20*b20+b30*b10-(a10*c30+a20*c20+a30*c10))*x^4+(b11*b30+b20*b21+b21*b20+b30*b11-(a11*c30+a20*c21+a21*c20+a30*c11))*x^4*y+(b12*b30+b21*b21+b30*b12-(a12*c30+a21*c21+a30*c12))*x^4*y^2+(b20*b30+b30*b20-(a20*c30+a30*c20))*x^5+(b21*b30+b30*b21-(a21*c30+a30*c21))*x^5*y+(b30*b30-(a30*c30))*x^6 := by simp only [cubicM03]; ring
 rw [he]
 positivity
end
end MathGKM.Markov
