import MarkovSecondTailD052
/-! Machine-authored 0d052acb. Small run lengths, universal coefficient parameters. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

def small2_0D052 (c r : ℤ) : ℤ := 2 + -3*r + 1*r^2 + -9*c + 6*c*r + 9*c^2
theorem small2_0D052_eq (c r : ℕ) : secondExplicitE273 2 c r 0=small2_0D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small2_0D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small2_1D052 (c r : ℤ) : ℤ := 4 + -16*r + 6*r^2 + -32*c + 30*c*r + 36*c^2
theorem small2_1D052_eq (c r : ℕ) : secondExplicitE273 2 c r 1=small2_1D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small2_1D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small2_2D052 (c r : ℤ) : ℤ := 2 + -45*r + 17*r^2 + -50*c + 68*c*r + 60*c^2
theorem small2_2D052_eq (c r : ℕ) : secondExplicitE273 2 c r 2=small2_2D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small2_2D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small2_3D052 (c r : ℤ) : ℤ := -96*r + 32*r^2 + -32*c + 96*c*r + 48*c^2
theorem small2_3D052_eq (c r : ℕ) : secondExplicitE273 2 c r 3=small2_3D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small2_3D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small2_4D052 (c r : ℤ) : ℤ := -104*r + 40*r^2 + 80*c*r + 16*c^2
theorem small2_4D052_eq (c r : ℕ) : secondExplicitE273 2 c r 4=small2_4D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small2_4D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small2_5D052 (c r : ℤ) : ℤ := -48*r + 32*r^2 + 8*c + 32*c*r
theorem small2_5D052_eq (c r : ℕ) : secondExplicitE273 2 c r 5=small2_5D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small2_5D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small2_6D052 (c r : ℤ) : ℤ := 16*r^2
theorem small2_6D052_eq (c r : ℕ) : secondExplicitE273 2 c r 6=small2_6D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small2_6D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

theorem small2_0D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small2_0D052 c r*small2_2D052 c r ≤ small2_1D052 c r^2 := by
 have he : small2_1D052 c r^2-small2_0D052 c r*small2_2D052 c r=10456 + 22066*(c-r-1) + 17248*(c-r-1)^2 + 5922*(c-r-1)^3 + 756*(c-r-1)^4 + 30574*(r-1) + 47937*(r-1)*(c-r-1) + 24741*(r-1)*(c-r-1)^2 + 4212*(r-1)*(c-r-1)^3 + 33298*(r-1)^2 + 34463*(r-1)^2*(c-r-1) + 8811*(r-1)^2*(c-r-1)^2 + 16004*(r-1)^3 + 8200*(r-1)^3*(c-r-1) + 2864*(r-1)^4 := by
  dsimp [small2_0D052,small2_1D052,small2_2D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 10456 + 22066*(c-r-1) + 17248*(c-r-1)^2 + 5922*(c-r-1)^3 + 756*(c-r-1)^4 + 30574*(r-1) + 47937*(r-1)*(c-r-1) + 24741*(r-1)*(c-r-1)^2 + 4212*(r-1)*(c-r-1)^3 + 33298*(r-1)^2 + 34463*(r-1)^2*(c-r-1) + 8811*(r-1)^2*(c-r-1)^2 + 16004*(r-1)^3 + 8200*(r-1)^3*(c-r-1) + 2864*(r-1)^4 := by positivity
 omega

theorem small2_1D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small2_1D052 c r*small2_3D052 c r ≤ small2_2D052 c r^2 := by
 have he : small2_2D052 c r^2-small2_1D052 c r*small2_3D052 c r=28196 + 58344*(c-r-1) + 44564*(c-r-1)^2 + 14928*(c-r-1)^3 + 1872*(c-r-1)^4 + 85068*(r-1) + 130028*(r-1)*(c-r-1) + 65112*(r-1)*(c-r-1)^2 + 10752*(r-1)*(c-r-1)^3 + 94805*(r-1)^2 + 94956*(r-1)^2*(c-r-1) + 23368*(r-1)^2*(c-r-1)^2 + 46270*(r-1)^3 + 22744*(r-1)^3*(c-r-1) + 8353*(r-1)^4 := by
  dsimp [small2_1D052,small2_2D052,small2_3D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 28196 + 58344*(c-r-1) + 44564*(c-r-1)^2 + 14928*(c-r-1)^3 + 1872*(c-r-1)^4 + 85068*(r-1) + 130028*(r-1)*(c-r-1) + 65112*(r-1)*(c-r-1)^2 + 10752*(r-1)*(c-r-1)^3 + 94805*(r-1)^2 + 94956*(r-1)^2*(c-r-1) + 23368*(r-1)^2*(c-r-1)^2 + 46270*(r-1)^3 + 22744*(r-1)^3*(c-r-1) + 8353*(r-1)^4 := by positivity
 omega

theorem small2_2D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small2_2D052 c r*small2_4D052 c r ≤ small2_3D052 c r^2 := by
 have he : small2_3D052 c r^2-small2_2D052 c r*small2_4D052 c r=25536 + 53792*(c-r-1) + 39360*(c-r-1)^2 + 11808*(c-r-1)^3 + 1344*(c-r-1)^4 + 81712*(r-1) + 125824*(r-1)*(c-r-1) + 59344*(r-1)*(c-r-1)^2 + 8704*(r-1)*(c-r-1)^3 + 98728*(r-1)^2 + 98352*(r-1)^2*(c-r-1) + 22224*(r-1)^2*(c-r-1)^2 + 53744*(r-1)^3 + 25776*(r-1)^3*(c-r-1) + 11256*(r-1)^4 := by
  dsimp [small2_2D052,small2_3D052,small2_4D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 25536 + 53792*(c-r-1) + 39360*(c-r-1)^2 + 11808*(c-r-1)^3 + 1344*(c-r-1)^4 + 81712*(r-1) + 125824*(r-1)*(c-r-1) + 59344*(r-1)*(c-r-1)^2 + 8704*(r-1)*(c-r-1)^3 + 98728*(r-1)^2 + 98352*(r-1)^2*(c-r-1) + 22224*(r-1)^2*(c-r-1)^2 + 53744*(r-1)^3 + 25776*(r-1)^3*(c-r-1) + 11256*(r-1)^4 := by positivity
 omega

theorem small2_3D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small2_3D052 c r*small2_5D052 c r ≤ small2_4D052 c r^2 := by
 have he : small2_4D052 c r^2-small2_3D052 c r*small2_5D052 c r=9216 + 19456*(c-r-1) + 12544*(c-r-1)^2 + 2688*(c-r-1)^3 + 256*(c-r-1)^4 + 32256*(r-1) + 48640*(r-1)*(c-r-1) + 19584*(r-1)*(c-r-1)^2 + 2048*(r-1)*(c-r-1)^3 + 44352*(r-1)^2 + 42112*(r-1)^2*(c-r-1) + 7680*(r-1)^2*(c-r-1)^2 + 28416*(r-1)^3 + 12544*(r-1)^3*(c-r-1) + 7232*(r-1)^4 := by
  dsimp [small2_3D052,small2_4D052,small2_5D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 9216 + 19456*(c-r-1) + 12544*(c-r-1)^2 + 2688*(c-r-1)^3 + 256*(c-r-1)^4 + 32256*(r-1) + 48640*(r-1)*(c-r-1) + 19584*(r-1)*(c-r-1)^2 + 2048*(r-1)*(c-r-1)^3 + 44352*(r-1)^2 + 42112*(r-1)^2*(c-r-1) + 7680*(r-1)^2*(c-r-1)^2 + 28416*(r-1)^3 + 12544*(r-1)^3*(c-r-1) + 7232*(r-1)^4 := by positivity
 omega

theorem small2_4D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small2_4D052 c r*small2_6D052 c r ≤ small2_5D052 c r^2 := by
 have he : small2_5D052 c r^2-small2_4D052 c r*small2_6D052 c r=1536 + 2816*(c-r-1) + 1344*(c-r-1)^2 + 5760*(r-1) + 7296*(r-1)*(c-r-1) + 2048*(r-1)*(c-r-1)^2 + 8896*(r-1)^2 + 6912*(r-1)^2*(c-r-1) + 768*(r-1)^2*(c-r-1)^2 + 6528*(r-1)^3 + 2304*(r-1)^3*(c-r-1) + 1920*(r-1)^4 := by
  dsimp [small2_4D052,small2_5D052,small2_6D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 1536 + 2816*(c-r-1) + 1344*(c-r-1)^2 + 5760*(r-1) + 7296*(r-1)*(c-r-1) + 2048*(r-1)*(c-r-1)^2 + 8896*(r-1)^2 + 6912*(r-1)^2*(c-r-1) + 768*(r-1)^2*(c-r-1)^2 + 6528*(r-1)^3 + 2304*(r-1)^3*(c-r-1) + 1920*(r-1)^4 := by positivity
 omega

theorem small2_lcD052 (c r j : ℕ) (hr : 0<r) (hc : r<c) (hj : j ≤ 4) :
 secondExplicitE273 2 c r j*secondExplicitE273 2 c r (j+2) ≤ secondExplicitE273 2 c r (j+1)^2 := by
 interval_cases j
 · norm_num only [show 0+2=2 by omega,show 0+1=1 by omega,small2_0D052_eq,small2_1D052_eq,small2_2D052_eq]
   exact small2_0D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 1+2=3 by omega,show 1+1=2 by omega,small2_1D052_eq,small2_2D052_eq,small2_3D052_eq]
   exact small2_1D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 2+2=4 by omega,show 2+1=3 by omega,small2_2D052_eq,small2_3D052_eq,small2_4D052_eq]
   exact small2_2D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 3+2=5 by omega,show 3+1=4 by omega,small2_3D052_eq,small2_4D052_eq,small2_5D052_eq]
   exact small2_3D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 4+2=6 by omega,show 4+1=5 by omega,small2_4D052_eq,small2_5D052_eq,small2_6D052_eq]
   exact small2_4D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)

def small3_0D052 (c r : ℤ) : ℤ := 2 + -3*r + 1*r^2 + -12*c + 8*c*r + 16*c^2
theorem small3_0D052_eq (c r : ℕ) : secondExplicitE273 3 c r 0=small3_0D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small3_0D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small3_1D052 (c r : ℤ) : ℤ := 4 + -16*r + 6*r^2 + -48*c + 42*c*r + 72*c^2
theorem small3_1D052_eq (c r : ℕ) : secondExplicitE273 3 c r 1=small3_1D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small3_1D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small3_2D052 (c r : ℤ) : ℤ := 2 + -45*r + 17*r^2 + -95*c + 102*c*r + 145*c^2
theorem small3_2D052_eq (c r : ℕ) : secondExplicitE273 3 c r 2=small3_2D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small3_2D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small3_3D052 (c r : ℤ) : ℤ := -96*r + 32*r^2 + -128*c + 160*c*r + 176*c^2
theorem small3_3D052_eq (c r : ℕ) : secondExplicitE273 3 c r 3=small3_3D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small3_3D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small3_4D052 (c r : ℤ) : ℤ := -176*r + 48*r^2 + -104*c + 192*c*r + 136*c^2
theorem small3_4D052_eq (c r : ℕ) : secondExplicitE273 3 c r 4=small3_4D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small3_4D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small3_5D052 (c r : ℤ) : ℤ := -200*r + 56*r^2 + -40*c + 168*c*r + 64*c^2
theorem small3_5D052_eq (c r : ℕ) : secondExplicitE273 3 c r 5=small3_5D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small3_5D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small3_6D052 (c r : ℤ) : ℤ := -128*r + 48*r^2 + 96*c*r + 16*c^2
theorem small3_6D052_eq (c r : ℕ) : secondExplicitE273 3 c r 6=small3_6D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small3_6D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small3_7D052 (c r : ℤ) : ℤ := -48*r + 32*r^2 + 8*c + 32*c*r
theorem small3_7D052_eq (c r : ℕ) : secondExplicitE273 3 c r 7=small3_7D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small3_7D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small3_8D052 (c r : ℤ) : ℤ := 16*r^2
theorem small3_8D052_eq (c r : ℕ) : secondExplicitE273 3 c r 8=small3_8D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small3_8D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

theorem small3_0D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small3_0D052 c r*small3_2D052 c r ≤ small3_1D052 c r^2 := by
 have he : small3_1D052 c r^2-small3_0D052 c r*small3_2D052 c r=41092 + 85328*(c-r-1) + 65976*(c-r-1)^2 + 22516*(c-r-1)^3 + 2864*(c-r-1)^4 + 109200*(r-1) + 169111*(r-1)*(c-r-1) + 86677*(r-1)*(c-r-1)^2 + 14712*(r-1)*(c-r-1)^3 + 108360*(r-1)^2 + 111229*(r-1)^2*(c-r-1) + 28347*(r-1)^2*(c-r-1)^2 + 47580*(r-1)^3 + 24280*(r-1)^3*(c-r-1) + 7800*(r-1)^4 := by
  dsimp [small3_0D052,small3_1D052,small3_2D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 41092 + 85328*(c-r-1) + 65976*(c-r-1)^2 + 22516*(c-r-1)^3 + 2864*(c-r-1)^4 + 109200*(r-1) + 169111*(r-1)*(c-r-1) + 86677*(r-1)*(c-r-1)^2 + 14712*(r-1)*(c-r-1)^3 + 108360*(r-1)^2 + 111229*(r-1)^2*(c-r-1) + 28347*(r-1)^2*(c-r-1)^2 + 47580*(r-1)^3 + 24280*(r-1)^3*(c-r-1) + 7800*(r-1)^4 := by positivity
 omega

theorem small3_1D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small3_1D052 c r*small3_3D052 c r ≤ small3_2D052 c r^2 := by
 have he : small3_2D052 c r^2-small3_1D052 c r*small3_3D052 c r=132544 + 269584*(c-r-1) + 203529*(c-r-1)^2 + 67606*(c-r-1)^3 + 8353*(c-r-1)^4 + 354752*(r-1) + 536648*(r-1)*(c-r-1) + 267688*(r-1)*(c-r-1)^2 + 44080*(r-1)*(c-r-1)^3 + 353776*(r-1)^2 + 353552*(r-1)^2*(c-r-1) + 87376*(r-1)^2*(c-r-1)^2 + 155744*(r-1)^3 + 77088*(r-1)^3*(c-r-1) + 25536*(r-1)^4 := by
  dsimp [small3_1D052,small3_2D052,small3_3D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 132544 + 269584*(c-r-1) + 203529*(c-r-1)^2 + 67606*(c-r-1)^3 + 8353*(c-r-1)^4 + 354752*(r-1) + 536648*(r-1)*(c-r-1) + 267688*(r-1)*(c-r-1)^2 + 44080*(r-1)*(c-r-1)^3 + 353776*(r-1)^2 + 353552*(r-1)^2*(c-r-1) + 87376*(r-1)^2*(c-r-1)^2 + 155744*(r-1)^3 + 77088*(r-1)^3*(c-r-1) + 25536*(r-1)^4 := by positivity
 omega

theorem small3_2D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small3_2D052 c r*small3_4D052 c r ≤ small3_3D052 c r^2 := by
 have he : small3_3D052 c r^2-small3_2D052 c r*small3_4D052 c r=159360 + 329808*(c-r-1) + 255432*(c-r-1)^2 + 87600*(c-r-1)^3 + 11256*(c-r-1)^4 + 448384*(r-1) + 690216*(r-1)*(c-r-1) + 352200*(r-1)*(c-r-1)^2 + 59632*(r-1)*(c-r-1)^3 + 466784*(r-1)^2 + 473880*(r-1)^2*(c-r-1) + 119368*(r-1)^2*(c-r-1)^2 + 213280*(r-1)^3 + 106944*(r-1)^3*(c-r-1) + 36160*(r-1)^4 := by
  dsimp [small3_2D052,small3_3D052,small3_4D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 159360 + 329808*(c-r-1) + 255432*(c-r-1)^2 + 87600*(c-r-1)^3 + 11256*(c-r-1)^4 + 448384*(r-1) + 690216*(r-1)*(c-r-1) + 352200*(r-1)*(c-r-1)^2 + 59632*(r-1)*(c-r-1)^3 + 466784*(r-1)^2 + 473880*(r-1)^2*(c-r-1) + 119368*(r-1)^2*(c-r-1)^2 + 213280*(r-1)^3 + 106944*(r-1)^3*(c-r-1) + 36160*(r-1)^4 := by positivity
 omega

theorem small3_3D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small3_3D052 c r*small3_5D052 c r ≤ small3_4D052 c r^2 := by
 have he : small3_4D052 c r^2-small3_3D052 c r*small3_5D052 c r=91392 + 207104*(c-r-1) + 168000*(c-r-1)^2 + 57216*(c-r-1)^3 + 7232*(c-r-1)^4 + 286464*(r-1) + 477312*(r-1)*(c-r-1) + 249856*(r-1)*(c-r-1)^2 + 41344*(r-1)*(c-r-1)^3 + 335936*(r-1)^2 + 363904*(r-1)^2*(c-r-1) + 91776*(r-1)^2*(c-r-1)^2 + 176384*(r-1)^3 + 92544*(r-1)^3*(c-r-1) + 35392*(r-1)^4 := by
  dsimp [small3_3D052,small3_4D052,small3_5D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 91392 + 207104*(c-r-1) + 168000*(c-r-1)^2 + 57216*(c-r-1)^3 + 7232*(c-r-1)^4 + 286464*(r-1) + 477312*(r-1)*(c-r-1) + 249856*(r-1)*(c-r-1)^2 + 41344*(r-1)*(c-r-1)^3 + 335936*(r-1)^2 + 363904*(r-1)^2*(c-r-1) + 91776*(r-1)^2*(c-r-1)^2 + 176384*(r-1)^3 + 92544*(r-1)^3*(c-r-1) + 35392*(r-1)^4 := by positivity
 omega

theorem small3_4D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small3_4D052 c r*small3_6D052 c r ≤ small3_5D052 c r^2 := by
 have he : small3_5D052 c r^2-small3_4D052 c r*small3_6D052 c r=31232 + 76672*(c-r-1) + 60032*(c-r-1)^2 + 17280*(c-r-1)^3 + 1920*(c-r-1)^4 + 110976*(r-1) + 193792*(r-1)*(c-r-1) + 94592*(r-1)*(c-r-1)^2 + 13056*(r-1)*(c-r-1)^3 + 150976*(r-1)^2 + 165760*(r-1)^2*(c-r-1) + 37312*(r-1)^2*(c-r-1)^2 + 93952*(r-1)^3 + 48128*(r-1)^3*(c-r-1) + 22784*(r-1)^4 := by
  dsimp [small3_4D052,small3_5D052,small3_6D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 31232 + 76672*(c-r-1) + 60032*(c-r-1)^2 + 17280*(c-r-1)^3 + 1920*(c-r-1)^4 + 110976*(r-1) + 193792*(r-1)*(c-r-1) + 94592*(r-1)*(c-r-1)^2 + 13056*(r-1)*(c-r-1)^3 + 150976*(r-1)^2 + 165760*(r-1)^2*(c-r-1) + 37312*(r-1)^2*(c-r-1)^2 + 93952*(r-1)^3 + 48128*(r-1)^3*(c-r-1) + 22784*(r-1)^4 := by positivity
 omega

theorem small3_5D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small3_5D052 c r*small3_7D052 c r ≤ small3_6D052 c r^2 := by
 have he : small3_6D052 c r^2-small3_5D052 c r*small3_7D052 c r=7424 + 17024*(c-r-1) + 11776*(c-r-1)^2 + 2560*(c-r-1)^3 + 256*(c-r-1)^4 + 28032*(r-1) + 45376*(r-1)*(c-r-1) + 19392*(r-1)*(c-r-1)^2 + 2048*(r-1)*(c-r-1)^3 + 40896*(r-1)^2 + 41280*(r-1)^2*(c-r-1) + 7936*(r-1)^2*(c-r-1)^2 + 27392*(r-1)^3 + 12800*(r-1)^3*(c-r-1) + 7168*(r-1)^4 := by
  dsimp [small3_5D052,small3_6D052,small3_7D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 7424 + 17024*(c-r-1) + 11776*(c-r-1)^2 + 2560*(c-r-1)^3 + 256*(c-r-1)^4 + 28032*(r-1) + 45376*(r-1)*(c-r-1) + 19392*(r-1)*(c-r-1)^2 + 2048*(r-1)*(c-r-1)^3 + 40896*(r-1)^2 + 41280*(r-1)^2*(c-r-1) + 7936*(r-1)^2*(c-r-1)^2 + 27392*(r-1)^3 + 12800*(r-1)^3*(c-r-1) + 7168*(r-1)^4 := by positivity
 omega

theorem small3_6D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small3_6D052 c r*small3_8D052 c r ≤ small3_7D052 c r^2 := by
 have he : small3_7D052 c r^2-small3_6D052 c r*small3_8D052 c r=1280 + 2560*(c-r-1) + 1344*(c-r-1)^2 + 4608*(r-1) + 6528*(r-1)*(c-r-1) + 2048*(r-1)*(c-r-1)^2 + 6976*(r-1)^2 + 6144*(r-1)^2*(c-r-1) + 768*(r-1)^2*(c-r-1)^2 + 5120*(r-1)^3 + 2048*(r-1)^3*(c-r-1) + 1536*(r-1)^4 := by
  dsimp [small3_6D052,small3_7D052,small3_8D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 1280 + 2560*(c-r-1) + 1344*(c-r-1)^2 + 4608*(r-1) + 6528*(r-1)*(c-r-1) + 2048*(r-1)*(c-r-1)^2 + 6976*(r-1)^2 + 6144*(r-1)^2*(c-r-1) + 768*(r-1)^2*(c-r-1)^2 + 5120*(r-1)^3 + 2048*(r-1)^3*(c-r-1) + 1536*(r-1)^4 := by positivity
 omega

theorem small3_lcD052 (c r j : ℕ) (hr : 0<r) (hc : r<c) (hj : j ≤ 6) :
 secondExplicitE273 3 c r j*secondExplicitE273 3 c r (j+2) ≤ secondExplicitE273 3 c r (j+1)^2 := by
 interval_cases j
 · norm_num only [show 0+2=2 by omega,show 0+1=1 by omega,small3_0D052_eq,small3_1D052_eq,small3_2D052_eq]
   exact small3_0D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 1+2=3 by omega,show 1+1=2 by omega,small3_1D052_eq,small3_2D052_eq,small3_3D052_eq]
   exact small3_1D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 2+2=4 by omega,show 2+1=3 by omega,small3_2D052_eq,small3_3D052_eq,small3_4D052_eq]
   exact small3_2D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 3+2=5 by omega,show 3+1=4 by omega,small3_3D052_eq,small3_4D052_eq,small3_5D052_eq]
   exact small3_3D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 4+2=6 by omega,show 4+1=5 by omega,small3_4D052_eq,small3_5D052_eq,small3_6D052_eq]
   exact small3_4D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 5+2=7 by omega,show 5+1=6 by omega,small3_5D052_eq,small3_6D052_eq,small3_7D052_eq]
   exact small3_5D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 6+2=8 by omega,show 6+1=7 by omega,small3_6D052_eq,small3_7D052_eq,small3_8D052_eq]
   exact small3_6D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)

def small4_0D052 (c r : ℤ) : ℤ := 2 + -3*r + 1*r^2 + -15*c + 10*c*r + 25*c^2
theorem small4_0D052_eq (c r : ℕ) : secondExplicitE273 4 c r 0=small4_0D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small4_0D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small4_1D052 (c r : ℤ) : ℤ := 4 + -16*r + 6*r^2 + -64*c + 54*c*r + 120*c^2
theorem small4_1D052_eq (c r : ℕ) : secondExplicitE273 4 c r 1=small4_1D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small4_1D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small4_2D052 (c r : ℤ) : ℤ := 2 + -45*r + 17*r^2 + -140*c + 136*c*r + 264*c^2
theorem small4_2D052_eq (c r : ℕ) : secondExplicitE273 4 c r 2=small4_2D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small4_2D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small4_3D052 (c r : ℤ) : ℤ := -96*r + 32*r^2 + -224*c + 224*c*r + 368*c^2
theorem small4_3D052_eq (c r : ℕ) : secondExplicitE273 4 c r 3=small4_3D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small4_3D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small4_4D052 (c r : ℤ) : ℤ := -176*r + 48*r^2 + -280*c + 288*c*r + 376*c^2
theorem small4_4D052_eq (c r : ℕ) : secondExplicitE273 4 c r 4=small4_4D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small4_4D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small4_5D052 (c r : ℤ) : ℤ := -288*r + 64*r^2 + -240*c + 320*c*r + 288*c^2
theorem small4_5D052_eq (c r : ℕ) : secondExplicitE273 4 c r 5=small4_5D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small4_5D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small4_6D052 (c r : ℤ) : ℤ := -328*r + 72*r^2 + -128*c + 288*c*r + 160*c^2
theorem small4_6D052_eq (c r : ℕ) : secondExplicitE273 4 c r 6=small4_6D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small4_6D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small4_7D052 (c r : ℤ) : ℤ := -240*r + 64*r^2 + -40*c + 192*c*r + 64*c^2
theorem small4_7D052_eq (c r : ℕ) : secondExplicitE273 4 c r 7=small4_7D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small4_7D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small4_8D052 (c r : ℤ) : ℤ := -128*r + 48*r^2 + 96*c*r + 16*c^2
theorem small4_8D052_eq (c r : ℕ) : secondExplicitE273 4 c r 8=small4_8D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small4_8D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small4_9D052 (c r : ℤ) : ℤ := -48*r + 32*r^2 + 8*c + 32*c*r
theorem small4_9D052_eq (c r : ℕ) : secondExplicitE273 4 c r 9=small4_9D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small4_9D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

def small4_10D052 (c r : ℤ) : ℤ := 16*r^2
theorem small4_10D052_eq (c r : ℕ) : secondExplicitE273 4 c r 10=small4_10D052 c r := by
 norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,small4_10D052,sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,sparse21E273,sparse22E273,sparse23E273,sparse24E273,sparse25E273]
 ring

theorem small4_0D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small4_0D052 c r*small4_2D052 c r ≤ small4_1D052 c r^2 := by
 have he : small4_1D052 c r^2-small4_0D052 c r*small4_2D052 c r=114136 + 234990*(c-r-1) + 180610*(c-r-1)^2 + 61420*(c-r-1)^3 + 7800*(c-r-1)^4 + 286514*(r-1) + 440769*(r-1)*(c-r-1) + 224999*(r-1)*(c-r-1)^2 + 38120*(r-1)*(c-r-1)^3 + 268912*(r-1)^2 + 274749*(r-1)^2*(c-r-1) + 69867*(r-1)^2*(c-r-1)^2 + 111834*(r-1)^3 + 56916*(r-1)^3*(c-r-1) + 17388*(r-1)^4 := by
  dsimp [small4_0D052,small4_1D052,small4_2D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 114136 + 234990*(c-r-1) + 180610*(c-r-1)^2 + 61420*(c-r-1)^3 + 7800*(c-r-1)^4 + 286514*(r-1) + 440769*(r-1)*(c-r-1) + 224999*(r-1)*(c-r-1)^2 + 38120*(r-1)*(c-r-1)^3 + 268912*(r-1)^2 + 274749*(r-1)^2*(c-r-1) + 69867*(r-1)^2*(c-r-1)^2 + 111834*(r-1)^3 + 56916*(r-1)^3*(c-r-1) + 17388*(r-1)^4 := by positivity
 omega

theorem small4_1D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small4_1D052 c r*small4_3D052 c r ≤ small4_2D052 c r^2 := by
 have he : small4_2D052 c r^2-small4_1D052 c r*small4_3D052 c r=405252 + 820240*(c-r-1) + 618448*(c-r-1)^2 + 205856*(c-r-1)^3 + 25536*(c-r-1)^4 + 1018428*(r-1) + 1537688*(r-1)*(c-r-1) + 768560*(r-1)*(c-r-1)^2 + 127200*(r-1)*(c-r-1)^3 + 955869*(r-1)^2 + 956680*(r-1)^2*(c-r-1) + 237712*(r-1)^2*(c-r-1)^2 + 397026*(r-1)^3 + 197520*(r-1)^3*(c-r-1) + 61569*(r-1)^4 := by
  dsimp [small4_1D052,small4_2D052,small4_3D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 405252 + 820240*(c-r-1) + 618448*(c-r-1)^2 + 205856*(c-r-1)^3 + 25536*(c-r-1)^4 + 1018428*(r-1) + 1537688*(r-1)*(c-r-1) + 768560*(r-1)*(c-r-1)^2 + 127200*(r-1)*(c-r-1)^3 + 955869*(r-1)^2 + 956680*(r-1)^2*(c-r-1) + 237712*(r-1)^2*(c-r-1)^2 + 397026*(r-1)^3 + 197520*(r-1)^3*(c-r-1) + 61569*(r-1)^4 := by positivity
 omega

theorem small4_2D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small4_2D052 c r*small4_4D052 c r ≤ small4_3D052 c r^2 := by
 have he : small4_3D052 c r^2-small4_2D052 c r*small4_4D052 c r=559840 + 1135504*(c-r-1) + 860688*(c-r-1)^2 + 288672*(c-r-1)^3 + 36160*(c-r-1)^4 + 1436736*(r-1) + 2176792*(r-1)*(c-r-1) + 1093960*(r-1)*(c-r-1)^2 + 182336*(r-1)*(c-r-1)^3 + 1377096*(r-1)^2 + 1383656*(r-1)^2*(c-r-1) + 345544*(r-1)^2*(c-r-1)^2 + 584032*(r-1)^3 + 291632*(r-1)^3*(c-r-1) + 92472*(r-1)^4 := by
  dsimp [small4_2D052,small4_3D052,small4_4D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 559840 + 1135504*(c-r-1) + 860688*(c-r-1)^2 + 288672*(c-r-1)^3 + 36160*(c-r-1)^4 + 1436736*(r-1) + 2176792*(r-1)*(c-r-1) + 1093960*(r-1)*(c-r-1)^2 + 182336*(r-1)*(c-r-1)^3 + 1377096*(r-1)^2 + 1383656*(r-1)^2*(c-r-1) + 345544*(r-1)^2*(c-r-1)^2 + 584032*(r-1)^3 + 291632*(r-1)^3*(c-r-1) + 92472*(r-1)^4 := by positivity
 omega

theorem small4_3D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small4_3D052 c r*small4_5D052 c r ≤ small4_4D052 c r^2 := by
 have he : small4_4D052 c r^2-small4_3D052 c r*small4_5D052 c r=405760 + 873216*(c-r-1) + 713536*(c-r-1)^2 + 259712*(c-r-1)^3 + 35392*(c-r-1)^4 + 1125632*(r-1) + 1815424*(r-1)*(c-r-1) + 979584*(r-1)*(c-r-1)^2 + 175872*(r-1)*(c-r-1)^3 + 1156928*(r-1)^2 + 1236608*(r-1)^2*(c-r-1) + 329856*(r-1)^2*(c-r-1)^2 + 522368*(r-1)^3 + 276736*(r-1)^3*(c-r-1) + 87616*(r-1)^4 := by
  dsimp [small4_3D052,small4_4D052,small4_5D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 405760 + 873216*(c-r-1) + 713536*(c-r-1)^2 + 259712*(c-r-1)^3 + 35392*(c-r-1)^4 + 1125632*(r-1) + 1815424*(r-1)*(c-r-1) + 979584*(r-1)*(c-r-1)^2 + 175872*(r-1)*(c-r-1)^3 + 1156928*(r-1)^2 + 1236608*(r-1)^2*(c-r-1) + 329856*(r-1)^2*(c-r-1)^2 + 522368*(r-1)^3 + 276736*(r-1)^3*(c-r-1) + 87616*(r-1)^4 := by positivity
 omega

theorem small4_4D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small4_4D052 c r*small4_6D052 c r ≤ small4_5D052 c r^2 := by
 have he : small4_5D052 c r^2-small4_4D052 c r*small4_6D052 c r=203776 + 502784*(c-r-1) + 447488*(c-r-1)^2 + 166912*(c-r-1)^3 + 22784*(c-r-1)^4 + 652416*(r-1) + 1180864*(r-1)*(c-r-1) + 673088*(r-1)*(c-r-1)^2 + 121088*(r-1)*(c-r-1)^3 + 774592*(r-1)^2 + 907328*(r-1)^2*(c-r-1) + 248128*(r-1)^2*(c-r-1)^2 + 408064*(r-1)^3 + 230528*(r-1)^3*(c-r-1) + 81344*(r-1)^4 := by
  dsimp [small4_4D052,small4_5D052,small4_6D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 203776 + 502784*(c-r-1) + 447488*(c-r-1)^2 + 166912*(c-r-1)^3 + 22784*(c-r-1)^4 + 652416*(r-1) + 1180864*(r-1)*(c-r-1) + 673088*(r-1)*(c-r-1)^2 + 121088*(r-1)*(c-r-1)^3 + 774592*(r-1)^2 + 907328*(r-1)^2*(c-r-1) + 248128*(r-1)^2*(c-r-1)^2 + 408064*(r-1)^3 + 230528*(r-1)^3*(c-r-1) + 81344*(r-1)^4 := by positivity
 omega

theorem small4_5D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small4_5D052 c r*small4_7D052 c r ≤ small4_6D052 c r^2 := by
 have he : small4_6D052 c r^2-small4_5D052 c r*small4_7D052 c r=77824 + 209408*(c-r-1) + 182400*(c-r-1)^2 + 59648*(c-r-1)^3 + 7168*(c-r-1)^4 + 281088*(r-1) + 534784*(r-1)*(c-r-1) + 289024*(r-1)*(c-r-1)^2 + 45056*(r-1)*(c-r-1)^3 + 382656*(r-1)^2 + 455936*(r-1)^2*(c-r-1) + 114176*(r-1)^2*(c-r-1)^2 + 234880*(r-1)^3 + 130560*(r-1)^3*(c-r-1) + 55360*(r-1)^4 := by
  dsimp [small4_5D052,small4_6D052,small4_7D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 77824 + 209408*(c-r-1) + 182400*(c-r-1)^2 + 59648*(c-r-1)^3 + 7168*(c-r-1)^4 + 281088*(r-1) + 534784*(r-1)*(c-r-1) + 289024*(r-1)*(c-r-1)^2 + 45056*(r-1)*(c-r-1)^3 + 382656*(r-1)^2 + 455936*(r-1)^2*(c-r-1) + 114176*(r-1)^2*(c-r-1)^2 + 234880*(r-1)^3 + 130560*(r-1)^3*(c-r-1) + 55360*(r-1)^4 := by positivity
 omega

theorem small4_6D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small4_6D052 c r*small4_8D052 c r ≤ small4_7D052 c r^2 := by
 have he : small4_7D052 c r^2-small4_6D052 c r*small4_8D052 c r=23552 + 59904*(c-r-1) + 48192*(c-r-1)^2 + 13824*(c-r-1)^3 + 1536*(c-r-1)^4 + 87168*(r-1) + 156800*(r-1)*(c-r-1) + 78208*(r-1)*(c-r-1)^2 + 10752*(r-1)*(c-r-1)^3 + 122560*(r-1)^2 + 137984*(r-1)^2*(c-r-1) + 31616*(r-1)^2*(c-r-1)^2 + 78080*(r-1)^3 + 40960*(r-1)^3*(c-r-1) + 19200*(r-1)^4 := by
  dsimp [small4_6D052,small4_7D052,small4_8D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 23552 + 59904*(c-r-1) + 48192*(c-r-1)^2 + 13824*(c-r-1)^3 + 1536*(c-r-1)^4 + 87168*(r-1) + 156800*(r-1)*(c-r-1) + 78208*(r-1)*(c-r-1)^2 + 10752*(r-1)*(c-r-1)^3 + 122560*(r-1)^2 + 137984*(r-1)^2*(c-r-1) + 31616*(r-1)^2*(c-r-1)^2 + 78080*(r-1)^3 + 40960*(r-1)^3*(c-r-1) + 19200*(r-1)^4 := by positivity
 omega

theorem small4_7D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small4_7D052 c r*small4_9D052 c r ≤ small4_8D052 c r^2 := by
 have he : small4_8D052 c r^2-small4_7D052 c r*small4_9D052 c r=6400 + 14848*(c-r-1) + 10816*(c-r-1)^2 + 2560*(c-r-1)^3 + 256*(c-r-1)^4 + 23040*(r-1) + 38528*(r-1)*(c-r-1) + 17664*(r-1)*(c-r-1)^2 + 2048*(r-1)*(c-r-1)^3 + 32064*(r-1)^2 + 34048*(r-1)^2*(c-r-1) + 7168*(r-1)^2*(c-r-1)^2 + 20480*(r-1)^3 + 10240*(r-1)^3*(c-r-1) + 5120*(r-1)^4 := by
  dsimp [small4_7D052,small4_8D052,small4_9D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 6400 + 14848*(c-r-1) + 10816*(c-r-1)^2 + 2560*(c-r-1)^3 + 256*(c-r-1)^4 + 23040*(r-1) + 38528*(r-1)*(c-r-1) + 17664*(r-1)*(c-r-1)^2 + 2048*(r-1)*(c-r-1)^3 + 32064*(r-1)^2 + 34048*(r-1)^2*(c-r-1) + 7168*(r-1)^2*(c-r-1)^2 + 20480*(r-1)^3 + 10240*(r-1)^3*(c-r-1) + 5120*(r-1)^4 := by positivity
 omega

theorem small4_8D052_lc (c r : ℤ) (hr : 1 ≤ r) (hc : r+1 ≤ c) :
 small4_8D052 c r*small4_10D052 c r ≤ small4_9D052 c r^2 := by
 have he : small4_9D052 c r^2-small4_8D052 c r*small4_10D052 c r=1280 + 2560*(c-r-1) + 1344*(c-r-1)^2 + 4608*(r-1) + 6528*(r-1)*(c-r-1) + 2048*(r-1)*(c-r-1)^2 + 6976*(r-1)^2 + 6144*(r-1)^2*(c-r-1) + 768*(r-1)^2*(c-r-1)^2 + 5120*(r-1)^3 + 2048*(r-1)^3*(c-r-1) + 1536*(r-1)^4 := by
  dsimp [small4_8D052,small4_9D052,small4_10D052]
  ring
 have hu : 0 ≤ r-1 := by omega
 have hv : 0 ≤ c-r-1 := by omega
 have hp : (0:ℤ) ≤ 1280 + 2560*(c-r-1) + 1344*(c-r-1)^2 + 4608*(r-1) + 6528*(r-1)*(c-r-1) + 2048*(r-1)*(c-r-1)^2 + 6976*(r-1)^2 + 6144*(r-1)^2*(c-r-1) + 768*(r-1)^2*(c-r-1)^2 + 5120*(r-1)^3 + 2048*(r-1)^3*(c-r-1) + 1536*(r-1)^4 := by positivity
 omega

theorem small4_lcD052 (c r j : ℕ) (hr : 0<r) (hc : r<c) (hj : j ≤ 8) :
 secondExplicitE273 4 c r j*secondExplicitE273 4 c r (j+2) ≤ secondExplicitE273 4 c r (j+1)^2 := by
 interval_cases j
 · norm_num only [show 0+2=2 by omega,show 0+1=1 by omega,small4_0D052_eq,small4_1D052_eq,small4_2D052_eq]
   exact small4_0D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 1+2=3 by omega,show 1+1=2 by omega,small4_1D052_eq,small4_2D052_eq,small4_3D052_eq]
   exact small4_1D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 2+2=4 by omega,show 2+1=3 by omega,small4_2D052_eq,small4_3D052_eq,small4_4D052_eq]
   exact small4_2D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 3+2=5 by omega,show 3+1=4 by omega,small4_3D052_eq,small4_4D052_eq,small4_5D052_eq]
   exact small4_3D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 4+2=6 by omega,show 4+1=5 by omega,small4_4D052_eq,small4_5D052_eq,small4_6D052_eq]
   exact small4_4D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 5+2=7 by omega,show 5+1=6 by omega,small4_5D052_eq,small4_6D052_eq,small4_7D052_eq]
   exact small4_5D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 6+2=8 by omega,show 6+1=7 by omega,small4_6D052_eq,small4_7D052_eq,small4_8D052_eq]
   exact small4_6D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 7+2=9 by omega,show 7+1=8 by omega,small4_7D052_eq,small4_8D052_eq,small4_9D052_eq]
   exact small4_7D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · norm_num only [show 8+2=10 by omega,show 8+1=9 by omega,small4_8D052_eq,small4_9D052_eq,small4_10D052_eq]
   exact small4_8D052_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)

#print axioms small2_lcD052
#print axioms small3_lcD052
#print axioms small4_lcD052
end
end MathGKM.Markov
