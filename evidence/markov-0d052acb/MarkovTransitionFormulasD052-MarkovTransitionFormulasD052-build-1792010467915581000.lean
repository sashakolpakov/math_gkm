import MarkovSecondInteriorE273
/-! Machine-authored 0d052acb. Exact second-slice transition formulas. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

def trans0p0D052 (n c r : ℤ) : ℤ := 12 + -18*r + 6*r^2 + -18*c + 12*c*r + 6*c^2 + -18*n*c + 12*n*c*r + 12*n*c^2 + 6*n^2*c^2

theorem trans0p0D052_eq (n c r : ℕ) (hn : 5≤n) :
 6*secondExplicitE273 n c r 0=trans0p0D052 n c r := by
 have h00 := chooseShift_polynomialE273 0 (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 0 (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 0 (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 0 (0*(n+1)+3) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ 0=2*n+3) by omega),chooseShift_zeroE273 0 (0*(n+1)+4) (by omega),chooseShift_zeroE273 0 (0*(n+1)+5) (by omega),chooseShift_zeroE273 0 (0*(n+1)+6) (by omega),chooseShift_zeroE273 0 (1*(n+1)+1) (by omega),chooseShift_zeroE273 0 (1*(n+1)+2) (by omega),chooseShift_zeroE273 0 (1*(n+1)+3) (by omega),chooseShift_zeroE273 0 (1*(n+1)+4) (by omega),chooseShift_zeroE273 0 (1*(n+1)+5) (by omega),chooseShift_zeroE273 0 (2*(n+1)+1) (by omega),chooseShift_zeroE273 0 (2*(n+1)+2) (by omega),chooseShift_zeroE273 0 (2*(n+1)+3) (by omega),chooseShift_zeroE273 0 (2*(n+1)+4) (by omega),chooseShift_zeroE273 0 (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [trans0p0D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03

def trans0p1D052 (n c r : ℤ) : ℤ := 24 + -96*r + 36*r^2 + 36*c*r + -96*n*c + 72*n*c*r + 36*n*c^2 + 36*n^2*c^2

theorem trans0p1D052_eq (n c r : ℕ) (hn : 5≤n) :
 6*secondExplicitE273 n c r 1=trans0p1D052 n c r := by
 have h00 := chooseShift_polynomialE273 1 (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 1 (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 1 (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 1 (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 1 (0*(n+1)+4) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ 1=2*n+3) by omega),chooseShift_zeroE273 1 (0*(n+1)+5) (by omega),chooseShift_zeroE273 1 (0*(n+1)+6) (by omega),chooseShift_zeroE273 1 (1*(n+1)+1) (by omega),chooseShift_zeroE273 1 (1*(n+1)+2) (by omega),chooseShift_zeroE273 1 (1*(n+1)+3) (by omega),chooseShift_zeroE273 1 (1*(n+1)+4) (by omega),chooseShift_zeroE273 1 (1*(n+1)+5) (by omega),chooseShift_zeroE273 1 (2*(n+1)+1) (by omega),chooseShift_zeroE273 1 (2*(n+1)+2) (by omega),chooseShift_zeroE273 1 (2*(n+1)+3) (by omega),chooseShift_zeroE273 1 (2*(n+1)+4) (by omega),chooseShift_zeroE273 1 (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [trans0p1D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04

def trans0p2D052 (n c r : ℤ) : ℤ := 12 + -270*r + 102*r^2 + 240*c + -48*c^2 + -270*n*c + 204*n*c*r + 102*n^2*c^2

theorem trans0p2D052_eq (n c r : ℕ) (hn : 5≤n) :
 6*secondExplicitE273 n c r 2=trans0p2D052 n c r := by
 have h00 := chooseShift_polynomialE273 2 (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 2 (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 2 (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 2 (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 2 (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 2 (0*(n+1)+5) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ 2=2*n+3) by omega),chooseShift_zeroE273 2 (0*(n+1)+6) (by omega),chooseShift_zeroE273 2 (1*(n+1)+1) (by omega),chooseShift_zeroE273 2 (1*(n+1)+2) (by omega),chooseShift_zeroE273 2 (1*(n+1)+3) (by omega),chooseShift_zeroE273 2 (1*(n+1)+4) (by omega),chooseShift_zeroE273 2 (1*(n+1)+5) (by omega),chooseShift_zeroE273 2 (2*(n+1)+1) (by omega),chooseShift_zeroE273 2 (2*(n+1)+2) (by omega),chooseShift_zeroE273 2 (2*(n+1)+3) (by omega),chooseShift_zeroE273 2 (2*(n+1)+4) (by omega),chooseShift_zeroE273 2 (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [trans0p2D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05

def trans0p3D052 (n c r : ℤ) : ℤ := -576*r + 192*r^2 + 960*c + -192*c*r + -96*c^2 + -576*n*c + 384*n*c*r + -192*n*c^2 + 192*n^2*c^2

theorem trans0p3D052_eq (n c r : ℕ) (hn : 5≤n) :
 6*secondExplicitE273 n c r 3=trans0p3D052 n c r := by
 have h00 := chooseShift_polynomialE273 3 (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 3 (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 3 (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 3 (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 3 (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 3 (0*(n+1)+5) (by omega)
 have h06 := chooseShift_polynomialE273 3 (0*(n+1)+6) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ 3=2*n+3) by omega),chooseShift_zeroE273 3 (1*(n+1)+1) (by omega),chooseShift_zeroE273 3 (1*(n+1)+2) (by omega),chooseShift_zeroE273 3 (1*(n+1)+3) (by omega),chooseShift_zeroE273 3 (1*(n+1)+4) (by omega),chooseShift_zeroE273 3 (1*(n+1)+5) (by omega),chooseShift_zeroE273 3 (2*(n+1)+1) (by omega),chooseShift_zeroE273 3 (2*(n+1)+2) (by omega),chooseShift_zeroE273 3 (2*(n+1)+3) (by omega),chooseShift_zeroE273 3 (2*(n+1)+4) (by omega),chooseShift_zeroE273 3 (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [trans0p3D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05 + (2 + 3*(r:ℤ) + 1*(r:ℤ)^2 + 3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 1*(n:ℤ)^2*(c:ℤ)^2)*h06

def trans0p4D052 (n c r : ℤ) : ℤ := -1056*r + 288*r^2 + 2544*c + -576*c*r + -48*c^2 + -1056*n*c + 576*n*c*r + -576*n*c^2 + 288*n^2*c^2

theorem trans0p4D052_eq (n c r : ℕ) (hn : 5≤n) :
 6*secondExplicitE273 n c r 4=trans0p4D052 n c r := by
 have h00 := chooseShift_polynomialE273 4 (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 4 (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 4 (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 4 (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 4 (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 4 (0*(n+1)+5) (by omega)
 have h06 := chooseShift_polynomialE273 4 (0*(n+1)+6) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ 4=2*n+3) by omega),chooseShift_zeroE273 4 (1*(n+1)+1) (by omega),chooseShift_zeroE273 4 (1*(n+1)+2) (by omega),chooseShift_zeroE273 4 (1*(n+1)+3) (by omega),chooseShift_zeroE273 4 (1*(n+1)+4) (by omega),chooseShift_zeroE273 4 (1*(n+1)+5) (by omega),chooseShift_zeroE273 4 (2*(n+1)+1) (by omega),chooseShift_zeroE273 4 (2*(n+1)+2) (by omega),chooseShift_zeroE273 4 (2*(n+1)+3) (by omega),chooseShift_zeroE273 4 (2*(n+1)+4) (by omega),chooseShift_zeroE273 4 (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [trans0p4D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05 + (2 + 3*(r:ℤ) + 1*(r:ℤ)^2 + 3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 1*(n:ℤ)^2*(c:ℤ)^2)*h06

def trans1m1D052 (n c r : ℤ) : ℤ := -576*r + -192*r^2 + -1536*c + -576*c*r + -288*c^2 + 384*n*r + 96*n*r^2 + 880*n*c + 96*n*c*r + -208*n*c^2 + -96*n^2*r + -144*n^2*c + 96*n^2*c*r + 144*n^2*c^2 + -16*n^3*c + 16*n^3*c^2

theorem trans1m1D052_eq (n c r : ℕ) (hn : 5≤n) :
 6*secondExplicitE273 n c r (n-1)=trans1m1D052 n c r := by
 have h00 := chooseShift_polynomialE273 (n-1) (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 (n-1) (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 (n-1) (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 (n-1) (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 (n-1) (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 (n-1) (0*(n+1)+5) (by omega)
 have h06 := chooseShift_polynomialE273 (n-1) (0*(n+1)+6) (by omega)
 have h11 := chooseShift_polynomialE273 (n-1) (1*(n+1)+1) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ (n-1)=2*n+3) by omega),chooseShift_zeroE273 (n-1) (1*(n+1)+2) (by omega),chooseShift_zeroE273 (n-1) (1*(n+1)+3) (by omega),chooseShift_zeroE273 (n-1) (1*(n+1)+4) (by omega),chooseShift_zeroE273 (n-1) (1*(n+1)+5) (by omega),chooseShift_zeroE273 (n-1) (2*(n+1)+1) (by omega),chooseShift_zeroE273 (n-1) (2*(n+1)+2) (by omega),chooseShift_zeroE273 (n-1) (2*(n+1)+3) (by omega),chooseShift_zeroE273 (n-1) (2*(n+1)+4) (by omega),chooseShift_zeroE273 (n-1) (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [trans1m1D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast [Nat.cast_sub (show 1≤n by omega)] at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05 + (2 + 3*(r:ℤ) + 1*(r:ℤ)^2 + 3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 1*(n:ℤ)^2*(c:ℤ)^2)*h06 + (40*(r:ℤ) + -8*(r:ℤ)^2 + -40*(c:ℤ) + 8*(c:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h11

def trans1p0D052 (n c r : ℤ) : ℤ := -288*r + -96*r^2 + -528*c + -192*c*r + -48*c^2 + 192*n*r + 96*n*r^2 + 352*n*c + 96*n*c*r + -64*n*c^2 + -96*n^2*r + -96*n^2*c + 96*n^2*c*r + 96*n^2*c^2 + -16*n^3*c + 16*n^3*c^2

theorem trans1p0D052_eq (n c r : ℕ) (hn : 5≤n) :
 6*secondExplicitE273 n c r (n+0)=trans1p0D052 n c r := by
 have h00 := chooseShift_polynomialE273 (n+0) (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 (n+0) (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 (n+0) (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 (n+0) (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 (n+0) (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 (n+0) (0*(n+1)+5) (by omega)
 have h06 := chooseShift_polynomialE273 (n+0) (0*(n+1)+6) (by omega)
 have h11 := chooseShift_polynomialE273 (n+0) (1*(n+1)+1) (by omega)
 have h12 := chooseShift_polynomialE273 (n+0) (1*(n+1)+2) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ (n+0)=2*n+3) by omega),chooseShift_zeroE273 (n+0) (1*(n+1)+3) (by omega),chooseShift_zeroE273 (n+0) (1*(n+1)+4) (by omega),chooseShift_zeroE273 (n+0) (1*(n+1)+5) (by omega),chooseShift_zeroE273 (n+0) (2*(n+1)+1) (by omega),chooseShift_zeroE273 (n+0) (2*(n+1)+2) (by omega),chooseShift_zeroE273 (n+0) (2*(n+1)+3) (by omega),chooseShift_zeroE273 (n+0) (2*(n+1)+4) (by omega),chooseShift_zeroE273 (n+0) (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [trans1p0D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05 + (2 + 3*(r:ℤ) + 1*(r:ℤ)^2 + 3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 1*(n:ℤ)^2*(c:ℤ)^2)*h06 + (40*(r:ℤ) + -8*(r:ℤ)^2 + -40*(c:ℤ) + 8*(c:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h11 + (-48*(r:ℤ) + -8*(c:ℤ) + 32*(c:ℤ)*(r:ℤ) + -16*(c:ℤ)^2 + -16*(n:ℤ)*(c:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h12

def trans1p1D052 (n c r : ℤ) : ℤ := -192*r + -96*c + 96*n*r^2 + 112*n*c + 96*n*c*r + -16*n*c^2 + -96*n^2*r + -48*n^2*c + 96*n^2*c*r + 48*n^2*c^2 + -16*n^3*c + 16*n^3*c^2

theorem trans1p1D052_eq (n c r : ℕ) (hn : 5≤n) :
 6*secondExplicitE273 n c r (n+1)=trans1p1D052 n c r := by
 have h00 := chooseShift_polynomialE273 (n+1) (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 (n+1) (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 (n+1) (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 (n+1) (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 (n+1) (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 (n+1) (0*(n+1)+5) (by omega)
 have h06 := chooseShift_polynomialE273 (n+1) (0*(n+1)+6) (by omega)
 have h11 := chooseShift_polynomialE273 (n+1) (1*(n+1)+1) (by omega)
 have h12 := chooseShift_polynomialE273 (n+1) (1*(n+1)+2) (by omega)
 have h13 := chooseShift_polynomialE273 (n+1) (1*(n+1)+3) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ (n+1)=2*n+3) by omega),chooseShift_zeroE273 (n+1) (1*(n+1)+4) (by omega),chooseShift_zeroE273 (n+1) (1*(n+1)+5) (by omega),chooseShift_zeroE273 (n+1) (2*(n+1)+1) (by omega),chooseShift_zeroE273 (n+1) (2*(n+1)+2) (by omega),chooseShift_zeroE273 (n+1) (2*(n+1)+3) (by omega),chooseShift_zeroE273 (n+1) (2*(n+1)+4) (by omega),chooseShift_zeroE273 (n+1) (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [trans1p1D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05 + (2 + 3*(r:ℤ) + 1*(r:ℤ)^2 + 3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 1*(n:ℤ)^2*(c:ℤ)^2)*h06 + (40*(r:ℤ) + -8*(r:ℤ)^2 + -40*(c:ℤ) + 8*(c:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h11 + (-48*(r:ℤ) + -8*(c:ℤ) + 32*(c:ℤ)*(r:ℤ) + -16*(c:ℤ)^2 + -16*(n:ℤ)*(c:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h12 + (-32*(r:ℤ) + 16*(r:ℤ)^2 + 8*(c:ℤ) + -24*(c:ℤ)^2 + -32*(n:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + 16*(n:ℤ)*(c:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h13

def trans1p2D052 (n c r : ℤ) : ℤ := -48*r + 48*r^2 + -96*n*r + 96*n*r^2 + 64*n*c + 48*n*c*r + -16*n*c^2 + -96*n^2*r + 96*n^2*c*r + -16*n^3*c + 16*n^3*c^2

theorem trans1p2D052_eq (n c r : ℕ) (hn : 5≤n) :
 6*secondExplicitE273 n c r (n+2)=trans1p2D052 n c r := by
 have h00 := chooseShift_polynomialE273 (n+2) (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 (n+2) (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 (n+2) (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 (n+2) (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 (n+2) (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 (n+2) (0*(n+1)+5) (by omega)
 have h06 := chooseShift_polynomialE273 (n+2) (0*(n+1)+6) (by omega)
 have h11 := chooseShift_polynomialE273 (n+2) (1*(n+1)+1) (by omega)
 have h12 := chooseShift_polynomialE273 (n+2) (1*(n+1)+2) (by omega)
 have h13 := chooseShift_polynomialE273 (n+2) (1*(n+1)+3) (by omega)
 have h14 := chooseShift_polynomialE273 (n+2) (1*(n+1)+4) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ (n+2)=2*n+3) by omega),chooseShift_zeroE273 (n+2) (1*(n+1)+5) (by omega),chooseShift_zeroE273 (n+2) (2*(n+1)+1) (by omega),chooseShift_zeroE273 (n+2) (2*(n+1)+2) (by omega),chooseShift_zeroE273 (n+2) (2*(n+1)+3) (by omega),chooseShift_zeroE273 (n+2) (2*(n+1)+4) (by omega),chooseShift_zeroE273 (n+2) (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [trans1p2D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05 + (2 + 3*(r:ℤ) + 1*(r:ℤ)^2 + 3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 1*(n:ℤ)^2*(c:ℤ)^2)*h06 + (40*(r:ℤ) + -8*(r:ℤ)^2 + -40*(c:ℤ) + 8*(c:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h11 + (-48*(r:ℤ) + -8*(c:ℤ) + 32*(c:ℤ)*(r:ℤ) + -16*(c:ℤ)^2 + -16*(n:ℤ)*(c:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h12 + (-32*(r:ℤ) + 16*(r:ℤ)^2 + 8*(c:ℤ) + -24*(c:ℤ)^2 + -32*(n:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + 16*(n:ℤ)*(c:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h13 + (48*(r:ℤ) + -24*(c:ℤ) + -32*(c:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h14

def trans1p3D052 (n c r : ℤ) : ℤ := 96*r + -48*c + 96*n*r^2 + 16*n*c + -96*n*c*r + 32*n*c^2 + -96*n^2*r + 48*n^2*c + 96*n^2*c*r + -48*n^2*c^2 + -16*n^3*c + 16*n^3*c^2

theorem trans1p3D052_eq (n c r : ℕ) (hn : 5≤n) :
 6*secondExplicitE273 n c r (n+3)=trans1p3D052 n c r := by
 have h00 := chooseShift_polynomialE273 (n+3) (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 (n+3) (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 (n+3) (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 (n+3) (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 (n+3) (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 (n+3) (0*(n+1)+5) (by omega)
 have h06 := chooseShift_polynomialE273 (n+3) (0*(n+1)+6) (by omega)
 have h11 := chooseShift_polynomialE273 (n+3) (1*(n+1)+1) (by omega)
 have h12 := chooseShift_polynomialE273 (n+3) (1*(n+1)+2) (by omega)
 have h13 := chooseShift_polynomialE273 (n+3) (1*(n+1)+3) (by omega)
 have h14 := chooseShift_polynomialE273 (n+3) (1*(n+1)+4) (by omega)
 have h15 := chooseShift_polynomialE273 (n+3) (1*(n+1)+5) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ (n+3)=2*n+3) by omega),chooseShift_zeroE273 (n+3) (2*(n+1)+1) (by omega),chooseShift_zeroE273 (n+3) (2*(n+1)+2) (by omega),chooseShift_zeroE273 (n+3) (2*(n+1)+3) (by omega),chooseShift_zeroE273 (n+3) (2*(n+1)+4) (by omega),chooseShift_zeroE273 (n+3) (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [trans1p3D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05 + (2 + 3*(r:ℤ) + 1*(r:ℤ)^2 + 3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 1*(n:ℤ)^2*(c:ℤ)^2)*h06 + (40*(r:ℤ) + -8*(r:ℤ)^2 + -40*(c:ℤ) + 8*(c:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h11 + (-48*(r:ℤ) + -8*(c:ℤ) + 32*(c:ℤ)*(r:ℤ) + -16*(c:ℤ)^2 + -16*(n:ℤ)*(c:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h12 + (-32*(r:ℤ) + 16*(r:ℤ)^2 + 8*(c:ℤ) + -24*(c:ℤ)^2 + -32*(n:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + 16*(n:ℤ)*(c:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h13 + (48*(r:ℤ) + -24*(c:ℤ) + -32*(c:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h14 + (-8*(r:ℤ) + -8*(r:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ))*h15

def trans1p4D052 (n c r : ℤ) : ℤ := -96*r^2 + 192*c*r + -96*c^2 + 192*n*r + 96*n*r^2 + -128*n*c + -288*n*c*r + 176*n*c^2 + -96*n^2*r + 96*n^2*c + 96*n^2*c*r + -96*n^2*c^2 + -16*n^3*c + 16*n^3*c^2

theorem trans1p4D052_eq (n c r : ℕ) (hn : 5≤n) :
 6*secondExplicitE273 n c r (n+4)=trans1p4D052 n c r := by
 have h00 := chooseShift_polynomialE273 (n+4) (0*(n+1)+0) (by omega)
 have h01 := chooseShift_polynomialE273 (n+4) (0*(n+1)+1) (by omega)
 have h02 := chooseShift_polynomialE273 (n+4) (0*(n+1)+2) (by omega)
 have h03 := chooseShift_polynomialE273 (n+4) (0*(n+1)+3) (by omega)
 have h04 := chooseShift_polynomialE273 (n+4) (0*(n+1)+4) (by omega)
 have h05 := chooseShift_polynomialE273 (n+4) (0*(n+1)+5) (by omega)
 have h06 := chooseShift_polynomialE273 (n+4) (0*(n+1)+6) (by omega)
 have h11 := chooseShift_polynomialE273 (n+4) (1*(n+1)+1) (by omega)
 have h12 := chooseShift_polynomialE273 (n+4) (1*(n+1)+2) (by omega)
 have h13 := chooseShift_polynomialE273 (n+4) (1*(n+1)+3) (by omega)
 have h14 := chooseShift_polynomialE273 (n+4) (1*(n+1)+4) (by omega)
 have h15 := chooseShift_polynomialE273 (n+4) (1*(n+1)+5) (by omega)
 unfold secondExplicitE273
 rw [if_neg (show ¬(c=2 ∧ (n+4)=2*n+3) by omega),chooseShift_zeroE273 (n+4) (2*(n+1)+1) (by omega),chooseShift_zeroE273 (n+4) (2*(n+1)+2) (by omega),chooseShift_zeroE273 (n+4) (2*(n+1)+3) (by omega),chooseShift_zeroE273 (n+4) (2*(n+1)+4) (by omega),chooseShift_zeroE273 (n+4) (2*(n+1)+5) (by omega)]
 simp only [mul_zero,add_zero]
 dsimp [trans1p4D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273] at *
 push_cast at *
 linear_combination (2 + -3*(r:ℤ) + 1*(r:ℤ)^2 + -3*(c:ℤ) + 2*(c:ℤ)*(r:ℤ) + 1*(c:ℤ)^2 + -3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 2*(n:ℤ)*(c:ℤ)^2 + 1*(n:ℤ)^2*(c:ℤ)^2)*h00 + (-4 + -4*(r:ℤ) + 2*(r:ℤ)^2 + 12*(c:ℤ) + -2*(c:ℤ)*(r:ℤ) + -4*(c:ℤ)^2 + -4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + -2*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h01 + (-2 + 1*(r:ℤ) + -1*(r:ℤ)^2 + 22*(c:ℤ) + -12*(c:ℤ)*(r:ℤ) + -2*(c:ℤ)^2 + 1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + -12*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h02 + (8 + -4*(r:ℤ)^2 + 12*(c:ℤ) + -4*(c:ℤ)*(r:ℤ) + 12*(c:ℤ)^2 + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + -4*(n:ℤ)*(c:ℤ)^2 + -4*(n:ℤ)^2*(c:ℤ)^2)*h03 + (-2 + -1*(r:ℤ) + -1*(r:ℤ)^2 + 21*(c:ℤ) + 10*(c:ℤ)*(r:ℤ) + 9*(c:ℤ)^2 + -1*(n:ℤ)*(c:ℤ) + -2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 10*(n:ℤ)*(c:ℤ)^2 + -1*(n:ℤ)^2*(c:ℤ)^2)*h04 + (-4 + 4*(r:ℤ) + 2*(r:ℤ)^2 + 16*(c:ℤ) + 6*(c:ℤ)*(r:ℤ) + 4*(n:ℤ)*(c:ℤ) + 4*(n:ℤ)*(c:ℤ)*(r:ℤ) + 6*(n:ℤ)*(c:ℤ)^2 + 2*(n:ℤ)^2*(c:ℤ)^2)*h05 + (2 + 3*(r:ℤ) + 1*(r:ℤ)^2 + 3*(n:ℤ)*(c:ℤ) + 2*(n:ℤ)*(c:ℤ)*(r:ℤ) + 1*(n:ℤ)^2*(c:ℤ)^2)*h06 + (40*(r:ℤ) + -8*(r:ℤ)^2 + -40*(c:ℤ) + 8*(c:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h11 + (-48*(r:ℤ) + -8*(c:ℤ) + 32*(c:ℤ)*(r:ℤ) + -16*(c:ℤ)^2 + -16*(n:ℤ)*(c:ℤ) + 8*(n:ℤ)*(c:ℤ)^2)*h12 + (-32*(r:ℤ) + 16*(r:ℤ)^2 + 8*(c:ℤ) + -24*(c:ℤ)^2 + -32*(n:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + 16*(n:ℤ)*(c:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h13 + (48*(r:ℤ) + -24*(c:ℤ) + -32*(c:ℤ)*(r:ℤ) + 16*(n:ℤ)*(c:ℤ) + -8*(n:ℤ)*(c:ℤ)^2)*h14 + (-8*(r:ℤ) + -8*(r:ℤ)^2 + 16*(n:ℤ)*(r:ℤ) + -8*(n:ℤ)*(c:ℤ)*(r:ℤ))*h15

#print axioms trans1p4D052_eq
end
end MathGKM.Markov
