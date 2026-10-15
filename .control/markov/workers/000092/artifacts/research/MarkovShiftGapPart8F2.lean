import MarkovShiftPartsF2
/-! Machine-authored f2da221d. Split exact first-shift gap. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false

def shiftGapPart8F2 (N C : ℤ) : ℤ :=
 111523224291897600 + 233321989789324800*N + 223649269532801280*N^2 + 129410612288552448*N^3 + 50243976014423296*N^4 + 13776293375900160*N^5 + 2734528586451200*N^6 + 395981495691264*N^7 + 41534484327168*N^8 + 3079304202240*N^9 + 153280305920*N^10 + 4603404288*N^11 + 63137536*N^12

theorem shiftGapPart_identity8F2 (N C : ℤ) :
 (shiftPart14F2 N C*shiftPart14F2 N C-shiftPart04F2 N C*shiftPart24F2 N C)=shiftGapPart8F2 N C := by
 simp only [shiftPart04F2,shiftPart14F2,shiftPart24F2,shiftGapPart8F2]
 ring

theorem shiftGapPart_nonneg8F2 (N C : ℤ) (hN : 0≤N) (hC : 0≤C) :
 0 ≤ shiftGapPart8F2 N C := by unfold shiftGapPart8F2; positivity
end
end MathGKM.Markov
