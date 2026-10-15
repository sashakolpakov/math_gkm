import MarkovShiftGapPart0F2
import MarkovShiftGapPart1F2
import MarkovShiftGapPart2F2
import MarkovShiftGapPart3F2
import MarkovShiftGapPart4F2
import MarkovShiftGapPart5F2
import MarkovShiftGapPart6F2
import MarkovShiftGapPart7F2
import MarkovShiftGapPart8F2
/-! Machine-authored f2da221d. Uniform first-shift coefficient gap. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384

theorem firstShift_factoredF2 (N C R : ℤ) :
 fourthShapeK0B (R+C+5) ((N+5)*(R+C+5)+(R+4)) (N+6)^2-
 fourthShapeK0B (R+C+5) ((N+5)*(R+C+5)+(R+4)) (N+5)*
 (fourthShapeK0B (R+C+5) ((N+5)*(R+C+5)+(R+4)) (N+7)+315*shiftCorrectionF2 (N+5) (R+C+5) (R+4))=
 shiftGapPart0F2 N C*R^0 + shiftGapPart1F2 N C*R^1 + shiftGapPart2F2 N C*R^2 + shiftGapPart3F2 N C*R^3 + shiftGapPart4F2 N C*R^4 + shiftGapPart5F2 N C*R^5 + shiftGapPart6F2 N C*R^6 + shiftGapPart7F2 N C*R^7 + shiftGapPart8F2 N C*R^8 := by
 rw [shiftParts0F2,shiftParts1F2,shiftParts2F2]
 rw [←shiftGapPart_identity0F2,←shiftGapPart_identity1F2,←shiftGapPart_identity2F2,←shiftGapPart_identity3F2,←shiftGapPart_identity4F2,←shiftGapPart_identity5F2,←shiftGapPart_identity6F2,←shiftGapPart_identity7F2,←shiftGapPart_identity8F2]
 ring

theorem firstShift_large_rF2 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 0≤fourthShapeK0B (R+C+5) ((N+5)*(R+C+5)+(R+4)) (N+6)^2-
 fourthShapeK0B (R+C+5) ((N+5)*(R+C+5)+(R+4)) (N+5)*
 (fourthShapeK0B (R+C+5) ((N+5)*(R+C+5)+(R+4)) (N+7)+315*shiftCorrectionF2 (N+5) (R+C+5) (R+4)) := by
 rw [firstShift_factoredF2]
 exact (add_nonneg (add_nonneg (add_nonneg (add_nonneg (add_nonneg (add_nonneg (add_nonneg (add_nonneg (mul_nonneg (shiftGapPart_nonneg0F2 N C hN hC) (pow_nonneg hR 0)) (mul_nonneg (shiftGapPart_nonneg1F2 N C hN hC) (pow_nonneg hR 1))) (mul_nonneg (shiftGapPart_nonneg2F2 N C hN hC) (pow_nonneg hR 2))) (mul_nonneg (shiftGapPart_nonneg3F2 N C hN hC) (pow_nonneg hR 3))) (mul_nonneg (shiftGapPart_nonneg4F2 N C hN hC) (pow_nonneg hR 4))) (mul_nonneg (shiftGapPart_nonneg5F2 N C hN hC) (pow_nonneg hR 5))) (mul_nonneg (shiftGapPart_nonneg6F2 N C hN hC) (pow_nonneg hR 6))) (mul_nonneg (shiftGapPart_nonneg7F2 N C hN hC) (pow_nonneg hR 7))) (mul_nonneg (shiftGapPart_nonneg8F2 N C hN hC) (pow_nonneg hR 8)))
end
end MathGKM.Markov
