import MarkovNormalCombineFDDA
import MarkovNormalSourcePartsFDDA
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem normal_source_thirdFDDA (n c r : ℕ) :
 (1-runXBDEE)^6*closedThirdBDEE n c r=
 normalBand0FDDA (n:RunFieldBDEE) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) runXBDEE+
 runXBDEE^n*normalBand1FDDA (n:RunFieldBDEE) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) runXBDEE+
 (runXBDEE^n)^2*normalBand2FDDA (n:RunFieldBDEE) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) runXBDEE+
 (runXBDEE^n)^3*normalBand3FDDA (n:RunFieldBDEE) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) runXBDEE+
 (1-runXBDEE)^6*3*closedFirstBDEE n c r*(if c=2 then 2*runXBDEE^(2*n+3) else 0) := by
 rw [←normal_combineFDDA]
 have hf := normal_firstFDDA (n:RunFieldBDEE) (runXBDEE^n) c r runXBDEE one_sub_runX_neBDEE
 have hs := normal_secondFDDA (n:RunFieldBDEE) (runXBDEE^n) c r (2*r-c:ℕ) runXBDEE one_sub_runX_neBDEE
 rw [←hf,←hs]
 unfold closedThirdBDEE
 rw [normal_source_firstFDDA,normal_source_secondFDDA]
 have hm := normal_source_momentFDDA n (c:RunFieldBDEE) r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)
 linear_combination hm
end
end MathGKM.Markov
