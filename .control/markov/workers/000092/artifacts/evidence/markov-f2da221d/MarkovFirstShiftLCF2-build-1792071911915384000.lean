import MarkovFirstShiftFactF2
import MarkovFirstShiftGap1F2
import MarkovFirstShiftGap2F2
import MarkovFirstShiftGap3F2
/-! Machine-authored f2da221d. Uniform first-shift coefficient gap. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384

theorem firstShift_logConcaveF2 (n c r : ℤ) (hn : 5≤n) (hc : 5≤c)
    (hr : 1≤r) (hrc : r<c) :
    fourthShapeK0B c (n*c+r) n*
      (fourthShapeK0B c (n*c+r) (n+2)+315*shiftCorrectionF2 n c r)≤
    fourthShapeK0B c (n*c+r) (n+1)^2 := by
  have en : n-5+5=n := by ring
  have en1 : n-5+6=n+1 := by ring
  have en2 : n-5+7=n+2 := by ring
  by_cases hh : 4≤r
  · have h := firstShift_large_rF2 (n-5) (c-r-1) (r-4) (by omega) (by omega) (by omega)
    have ec : r-4+(c-r-1)+5=c := by ring
    have er : r-4+4=r := by ring
    rw [en,en1,en2,ec,er] at h
    exact sub_nonneg.mp h
  · have hh : r=3 ∨ r=2 ∨ r=1 := by omega
    rcases hh with rfl|rfl|rfl
    · have he := firstShiftGap_identity1F2 (n-5) (c-5) 0
      have hp := firstShiftGap_nonneg1F2 (n-5) (c-5) 0 (by omega) (by omega) (by omega)
      have ec : c-5+5=c := by ring
      rw [en,en1,en2,ec] at he
      exact sub_nonneg.mp (he.symm ▸ hp)
    · have he := firstShiftGap_identity2F2 (n-5) (c-5) 0
      have hp := firstShiftGap_nonneg2F2 (n-5) (c-5) 0 (by omega) (by omega) (by omega)
      have ec : c-5+5=c := by ring
      rw [en,en1,en2,ec] at he
      exact sub_nonneg.mp (he.symm ▸ hp)
    · have he := firstShiftGap_identity3F2 (n-5) (c-5) 0
      have hp := firstShiftGap_nonneg3F2 (n-5) (c-5) 0 (by omega) (by omega) (by omega)
      have ec : c-5+5=c := by ring
      rw [en,en1,en2,ec] at he
      exact sub_nonneg.mp (he.symm ▸ hp)
end
end MathGKM.Markov
