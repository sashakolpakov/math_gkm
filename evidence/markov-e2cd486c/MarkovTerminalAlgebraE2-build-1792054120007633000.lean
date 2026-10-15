import MarkovTailShape53D
/-! Machine-authored e2cd486c. Explicit fourth-band endpoint algebra. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
set_option maxRecDepth 16384
def fourthCoeff0E2 (c r q t : ℤ) : ℤ := 24*t+48*q-72*r+24*c
def fourthCoeff1E2 (c r q t u : ℤ) : ℤ :=
 24*u-144*t-480*q+744*r-96*r*q+192*r^2-288*c+96*c*q-288*c*r+96*c^2
def terminallo0E2 (c r : ℤ) : ℤ :=
 (((2880*r+1440)*r+360)*c+(((2880*r+-8640)*r+-1800)*r))
def terminallo1E2 (c r : ℤ) : ℤ :=
 (((960*r)*r+120)*r)
def terminallo2E2 (c r : ℤ) : ℤ :=
 (-360*c+(1080*r))
def terminallo3E2 (c r : ℤ) : ℤ :=
 0
theorem terminal_lo_0_formulaE2 (c r : ℤ) :
 tailLow53D c r (1)=terminallo0E2 c r := by
 simp only [tailLow53D,fourthCoeff0E2,fourthCoeff1E2,terminallo0E2]
 ring
theorem terminal_lo_1_formulaE2 (c r : ℤ) :
 tailLow53D c r (0)=terminallo1E2 c r := by
 simp only [tailLow53D,fourthCoeff0E2,fourthCoeff1E2,terminallo1E2]
 ring
theorem terminal_lo_2_formulaE2 (c r : ℤ) :
 tailLow53D c r (-1)+15*fourthCoeff0E2 c r 0 (3*r-c)=terminallo2E2 c r := by
 simp only [tailLow53D,fourthCoeff0E2,fourthCoeff1E2,terminallo2E2]
 ring
theorem terminal_lo_3_formulaE2 (c r : ℤ) :
 tailLow53D c r (-2)+15*(6*fourthCoeff0E2 c r 0 (3*r-c)+fourthCoeff1E2 c r 0 (3*r-c) 0)=terminallo3E2 c r := by
 simp only [tailLow53D,fourthCoeff0E2,fourthCoeff1E2,terminallo3E2]
 ring
def terminalmid0E2 (c r : ℤ) : ℤ :=
 ((-2880*c+((2880*r+5760)*r+14760))*c+(((2880*r+-5760)*r+-30600)*r))
def terminalmid1E2 (c r : ℤ) : ℤ :=
 ((-1440*c+(1440*r+8640))*c+(((960*r+2880)*r+-17160)*r))
def terminalmid2E2 (c r : ℤ) : ℤ :=
 ((-1440*r+1800)*c+((2880*r+-3240)*r))
def terminalmid3E2 (c r : ℤ) : ℤ :=
 0
theorem terminal_mid_0_formulaE2 (c r : ℤ) :
 tailHigh53D c r (1)=terminalmid0E2 c r := by
 simp only [tailHigh53D,fourthCoeff0E2,fourthCoeff1E2,terminalmid0E2]
 ring
theorem terminal_mid_1_formulaE2 (c r : ℤ) :
 tailHigh53D c r (0)=terminalmid1E2 c r := by
 simp only [tailHigh53D,fourthCoeff0E2,fourthCoeff1E2,terminalmid1E2]
 ring
theorem terminal_mid_2_formulaE2 (c r : ℤ) :
 tailHigh53D c r (-1)+15*fourthCoeff0E2 c r (2*r-c) (3*r-c)=terminalmid2E2 c r := by
 simp only [tailHigh53D,fourthCoeff0E2,fourthCoeff1E2,terminalmid2E2]
 ring
theorem terminal_mid_3_formulaE2 (c r : ℤ) :
 tailHigh53D c r (-2)+15*(6*fourthCoeff0E2 c r (2*r-c) (3*r-c)+fourthCoeff1E2 c r (2*r-c) (3*r-c) 0)=terminalmid3E2 c r := by
 simp only [tailHigh53D,fourthCoeff0E2,fourthCoeff1E2,terminalmid3E2]
 ring
def terminalhi0E2 (c r : ℤ) : ℤ :=
 ((-2880*c+((2880*r+5760)*r+14760))*c+(((2880*r+-5760)*r+-30600)*r))
def terminalhi1E2 (c r : ℤ) : ℤ :=
 ((-1440*c+(1440*r+8640))*c+(((960*r+2880)*r+-17160)*r))
def terminalhi2E2 (c r : ℤ) : ℤ :=
 ((-1440*r+2520)*c+((2880*r+-4680)*r))
def terminalhi3E2 (c r : ℤ) : ℤ :=
 (-720*c+(1080*r))
theorem terminal_hi_0_formulaE2 (c r : ℤ) :
 tailHigh53D c r (1)=terminalhi0E2 c r := by
 simp only [tailHigh53D,fourthCoeff0E2,fourthCoeff1E2,terminalhi0E2]
 ring
theorem terminal_hi_1_formulaE2 (c r : ℤ) :
 tailHigh53D c r (0)=terminalhi1E2 c r := by
 simp only [tailHigh53D,fourthCoeff0E2,fourthCoeff1E2,terminalhi1E2]
 ring
theorem terminal_hi_2_formulaE2 (c r : ℤ) :
 tailHigh53D c r (-1)+15*fourthCoeff0E2 c r (2*r-c) (c-r)=terminalhi2E2 c r := by
 simp only [tailHigh53D,fourthCoeff0E2,fourthCoeff1E2,terminalhi2E2]
 ring
theorem terminal_hi_3_formulaE2 (c r : ℤ) :
 tailHigh53D c r (-2)+15*(6*fourthCoeff0E2 c r (2*r-c) (c-r)+fourthCoeff1E2 c r (2*r-c) (c-r) (3*r-2*c))=terminalhi3E2 c r := by
 simp only [tailHigh53D,fourthCoeff0E2,fourthCoeff1E2,terminalhi3E2]
 ring
end
end MathGKM.Markov
