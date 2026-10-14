import MarkovShapeBridgeE273
import MarkovQuinticE273
/-! Machine-authored 0d052acb. Exact final coefficients and infinite zero tail. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

def tailFirstD052 (c r : ℤ) : ℤ := 32*r*(c+r)-48*r+8*c

theorem tail1D052 (n c r : ℕ) (hn : 2≤n) :
 6*secondExplicitE273 n c r (2*n+1)=6*tailFirstD052 c r := by
 have h00 := chooseShift_polynomialE273 (2*n+1) (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 (2*n+1) (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 (2*n+1) (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 (2*n+1) (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 (2*n+1) (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 (2*n+1) (0*(n+1)+5) (by omega)
 have h06 := chooseShift_polynomialE273 (2*n+1) (0*(n+1)+6) (by omega)
 have h11 := chooseShift_polynomialE273 (2*n+1) (1*(n+1)+1) (by omega)
 have h12 := chooseShift_polynomialE273 (2*n+1) (1*(n+1)+2) (by omega)
 have h13 := chooseShift_polynomialE273 (2*n+1) (1*(n+1)+3) (by omega)
 have h14 := chooseShift_polynomialE273 (2*n+1) (1*(n+1)+4) (by omega)
 have h15 := chooseShift_polynomialE273 (2*n+1) (1*(n+1)+5) (by omega)
 have h21 := chooseShift_polynomialE273 (2*n+1) (2*(n+1)+1) (by omega)
 have h22 := chooseShift_polynomialE273 (2*n+1) (2*(n+1)+2) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ (2*n+1)=2*n+3) by omega) ,chooseShift_zeroE273 (2*n+1) (2*(n+1)+3) (by omega),chooseShift_zeroE273 (2*n+1) (2*(n+1)+4) (by omega),chooseShift_zeroE273 (2*n+1) (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [tailFirstD052,cubicD446,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05 + (2 + 3*(r:ℤ) + 1*(r:ℤ)^2 + 3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 1*(n:ℤ)^2*(c:ℤ)^2)*h06 + (40*(r:ℤ) + -8*(r:ℤ)^2 + -40*(c:ℤ) + 8*(c:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h11 + (-48*(r:ℤ) + -8*(c:ℤ) + 32*(c:ℤ)*(r:ℤ) + -16*(c:ℤ)^2 + -16*(n:ℤ)*(c:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h12 + (-32*(r:ℤ) + 16*(r:ℤ)^2 + 8*(c:ℤ) + -24*(c:ℤ)^2 + -32*(n:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + 16*(n:ℤ)*(c:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h13 + (48*(r:ℤ) + -24*(c:ℤ) + -32*(c:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h14 + (-8*(r:ℤ) + -8*(r:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ))*h15 + (8*((2*r-c:ℕ):ℤ) + -16*(r:ℤ) + 8*(c:ℤ))*h21 + (-32*((2*r-c:ℕ):ℤ) + 64*(r:ℤ) + 16*(r:ℤ)^2 + -32*(c:ℤ) + -32*(c:ℤ)*(r:ℤ) + 16*(c:ℤ)^2)*h22

theorem tail2D052 (n c r : ℕ) (hn : 2≤n) :
 6*secondExplicitE273 n c r (2*n+2)=6*(16*(r:ℤ)^2) := by
 have h00 := chooseShift_polynomialE273 (2*n+2) (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 (2*n+2) (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 (2*n+2) (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 (2*n+2) (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 (2*n+2) (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 (2*n+2) (0*(n+1)+5) (by omega)
 have h06 := chooseShift_polynomialE273 (2*n+2) (0*(n+1)+6) (by omega)
 have h11 := chooseShift_polynomialE273 (2*n+2) (1*(n+1)+1) (by omega)
 have h12 := chooseShift_polynomialE273 (2*n+2) (1*(n+1)+2) (by omega)
 have h13 := chooseShift_polynomialE273 (2*n+2) (1*(n+1)+3) (by omega)
 have h14 := chooseShift_polynomialE273 (2*n+2) (1*(n+1)+4) (by omega)
 have h15 := chooseShift_polynomialE273 (2*n+2) (1*(n+1)+5) (by omega)
 have h21 := chooseShift_polynomialE273 (2*n+2) (2*(n+1)+1) (by omega)
 have h22 := chooseShift_polynomialE273 (2*n+2) (2*(n+1)+2) (by omega)
 have h23 := chooseShift_polynomialE273 (2*n+2) (2*(n+1)+3) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ (2*n+2)=2*n+3) by omega) ,chooseShift_zeroE273 (2*n+2) (2*(n+1)+4) (by omega),chooseShift_zeroE273 (2*n+2) (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [tailFirstD052,cubicD446,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05 + (2 + 3*(r:ℤ) + 1*(r:ℤ)^2 + 3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 1*(n:ℤ)^2*(c:ℤ)^2)*h06 + (40*(r:ℤ) + -8*(r:ℤ)^2 + -40*(c:ℤ) + 8*(c:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h11 + (-48*(r:ℤ) + -8*(c:ℤ) + 32*(c:ℤ)*(r:ℤ) + -16*(c:ℤ)^2 + -16*(n:ℤ)*(c:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h12 + (-32*(r:ℤ) + 16*(r:ℤ)^2 + 8*(c:ℤ) + -24*(c:ℤ)^2 + -32*(n:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + 16*(n:ℤ)*(c:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h13 + (48*(r:ℤ) + -24*(c:ℤ) + -32*(c:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h14 + (-8*(r:ℤ) + -8*(r:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ))*h15 + (8*((2*r-c:ℕ):ℤ) + -16*(r:ℤ) + 8*(c:ℤ))*h21 + (-32*((2*r-c:ℕ):ℤ) + 64*(r:ℤ) + 16*(r:ℤ)^2 + -32*(c:ℤ) + -32*(c:ℤ)*(r:ℤ) + 16*(c:ℤ)^2)*h22 + (48*((2*r-c:ℕ):ℤ) + -48*(r:ℤ) + -32*(r:ℤ)^2 + 8*(c:ℤ) + 32*(c:ℤ)*(r:ℤ))*h23

theorem tail3D052 (n c r : ℕ) (hn : 2≤n) :
 6*secondExplicitE273 n c r (2*n+3)=6*cubicD446 c r := by
 have h00 := chooseShift_polynomialE273 (2*n+3) (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 (2*n+3) (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 (2*n+3) (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 (2*n+3) (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 (2*n+3) (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 (2*n+3) (0*(n+1)+5) (by omega)
 have h06 := chooseShift_polynomialE273 (2*n+3) (0*(n+1)+6) (by omega)
 have h11 := chooseShift_polynomialE273 (2*n+3) (1*(n+1)+1) (by omega)
 have h12 := chooseShift_polynomialE273 (2*n+3) (1*(n+1)+2) (by omega)
 have h13 := chooseShift_polynomialE273 (2*n+3) (1*(n+1)+3) (by omega)
 have h14 := chooseShift_polynomialE273 (2*n+3) (1*(n+1)+4) (by omega)
 have h15 := chooseShift_polynomialE273 (2*n+3) (1*(n+1)+5) (by omega)
 have h21 := chooseShift_polynomialE273 (2*n+3) (2*(n+1)+1) (by omega)
 have h22 := chooseShift_polynomialE273 (2*n+3) (2*(n+1)+2) (by omega)
 have h23 := chooseShift_polynomialE273 (2*n+3) (2*(n+1)+3) (by omega)
 have h24 := chooseShift_polynomialE273 (2*n+3) (2*(n+1)+4) (by omega)
 unfold secondExplicitE273
 simp only [and_true]
 rw [chooseShift_zeroE273 (2*n+3) (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [tailFirstD052,cubicD446,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05 + (2 + 3*(r:ℤ) + 1*(r:ℤ)^2 + 3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 1*(n:ℤ)^2*(c:ℤ)^2)*h06 + (40*(r:ℤ) + -8*(r:ℤ)^2 + -40*(c:ℤ) + 8*(c:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h11 + (-48*(r:ℤ) + -8*(c:ℤ) + 32*(c:ℤ)*(r:ℤ) + -16*(c:ℤ)^2 + -16*(n:ℤ)*(c:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h12 + (-32*(r:ℤ) + 16*(r:ℤ)^2 + 8*(c:ℤ) + -24*(c:ℤ)^2 + -32*(n:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + 16*(n:ℤ)*(c:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h13 + (48*(r:ℤ) + -24*(c:ℤ) + -32*(c:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h14 + (-8*(r:ℤ) + -8*(r:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ))*h15 + (8*((2*r-c:ℕ):ℤ) + -16*(r:ℤ) + 8*(c:ℤ))*h21 + (-32*((2*r-c:ℕ):ℤ) + 64*(r:ℤ) + 16*(r:ℤ)^2 + -32*(c:ℤ) + -32*(c:ℤ)*(r:ℤ) + 16*(c:ℤ)^2)*h22 + (48*((2*r-c:ℕ):ℤ) + -48*(r:ℤ) + -32*(r:ℤ)^2 + 8*(c:ℤ) + 32*(c:ℤ)*(r:ℤ))*h23 + (-32*((2*r-c:ℕ):ℤ) + 16*(r:ℤ)^2)*h24

theorem tail4D052 (n c r j : ℕ) (hn : 2≤n) (hj : 2*n+4≤j) :
 6*secondExplicitE273 n c r j=0 := by
 have h00 := chooseShift_polynomialE273 j (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 j (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 j (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 j (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 j (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 j (0*(n+1)+5) (by omega)
 have h06 := chooseShift_polynomialE273 j (0*(n+1)+6) (by omega)
 have h11 := chooseShift_polynomialE273 j (1*(n+1)+1) (by omega)
 have h12 := chooseShift_polynomialE273 j (1*(n+1)+2) (by omega)
 have h13 := chooseShift_polynomialE273 j (1*(n+1)+3) (by omega)
 have h14 := chooseShift_polynomialE273 j (1*(n+1)+4) (by omega)
 have h15 := chooseShift_polynomialE273 j (1*(n+1)+5) (by omega)
 have h21 := chooseShift_polynomialE273 j (2*(n+1)+1) (by omega)
 have h22 := chooseShift_polynomialE273 j (2*(n+1)+2) (by omega)
 have h23 := chooseShift_polynomialE273 j (2*(n+1)+3) (by omega)
 have h24 := chooseShift_polynomialE273 j (2*(n+1)+4) (by omega)
 have h25 := chooseShift_polynomialE273 j (2*(n+1)+5) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ j=2*n+3) by omega)]
 simp only [mul_zero,add_zero]
 dsimp [tailFirstD052,cubicD446,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05 + (2 + 3*(r:ℤ) + 1*(r:ℤ)^2 + 3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 1*(n:ℤ)^2*(c:ℤ)^2)*h06 + (40*(r:ℤ) + -8*(r:ℤ)^2 + -40*(c:ℤ) + 8*(c:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h11 + (-48*(r:ℤ) + -8*(c:ℤ) + 32*(c:ℤ)*(r:ℤ) + -16*(c:ℤ)^2 + -16*(n:ℤ)*(c:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h12 + (-32*(r:ℤ) + 16*(r:ℤ)^2 + 8*(c:ℤ) + -24*(c:ℤ)^2 + -32*(n:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + 16*(n:ℤ)*(c:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h13 + (48*(r:ℤ) + -24*(c:ℤ) + -32*(c:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h14 + (-8*(r:ℤ) + -8*(r:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ))*h15 + (8*((2*r-c:ℕ):ℤ) + -16*(r:ℤ) + 8*(c:ℤ))*h21 + (-32*((2*r-c:ℕ):ℤ) + 64*(r:ℤ) + 16*(r:ℤ)^2 + -32*(c:ℤ) + -32*(c:ℤ)*(r:ℤ) + 16*(c:ℤ)^2)*h22 + (48*((2*r-c:ℕ):ℤ) + -48*(r:ℤ) + -32*(r:ℤ)^2 + 8*(c:ℤ) + 32*(c:ℤ)*(r:ℤ))*h23 + (-32*((2*r-c:ℕ):ℤ) + 16*(r:ℤ)^2)*h24 + (8*((2*r-c:ℕ):ℤ))*h25

theorem tail_gapD052 (c r : ℕ) (hr : 0<r) (hc : r<c) :
 tailFirstD052 c r*cubicD446 c r≤(16*(r:ℤ)^2)^2 := by
 by_cases h2 : c=2
 · have hr1 : r=1 := by omega
   subst c; subst r
   norm_num [tailFirstD052,cubicD446]
 · by_cases hq : 2*r≤c
   · have hz : 2*r-c=0 := by omega
     simp [cubicD446,h2,hz,sq_nonneg]
   · have hq' : c≤2*r := by omega
     have hcast : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-c := by
       rw [Nat.cast_sub hq']; push_cast; ring
     let u : ℤ := (c:ℤ)-r-1
     let v : ℤ := 2*(r:ℤ)-c-1
     have hcz : (r:ℤ)+1≤c := by exact_mod_cast hc
     have hqz : (c:ℤ)+1≤2*(r:ℤ) := by exact_mod_cast (show c+1≤2*r by omega)
     have hu : 0≤u := by dsimp [u]; omega
     have hv : 0≤v := by dsimp [v]; omega
     have he : (16*(r:ℤ)^2)^2-tailFirstD052 c r*cubicD446 c r=2112 + 4224*v + 3648*v^2 + 1536*v^3 + 256*v^4 + 5632*u + 8448*u*v + 4864*u*v^2 + 1024*u*v^3 + 5376*u^2 + 5376*u^2*v + 1536*u^2*v^2 + 2048*u^3 + 1024*u^3*v + 256*u^4 := by
       simp only [cubicD446,if_neg h2,hcast,add_zero]
       dsimp [tailFirstD052,u,v]
       ring
     have hp : 0≤2112 + 4224*v + 3648*v^2 + 1536*v^3 + 256*v^4 + 5632*u + 8448*u*v + 4864*u*v^2 + 1024*u*v^3 + 5376*u^2 + 5376*u^2*v + 1536*u^2*v^2 + 2048*u^3 + 1024*u^3*v + 256*u^4 := by positivity
     omega

#print axioms tail4D052
#print axioms tail_gapD052
end
end MathGKM.Markov
