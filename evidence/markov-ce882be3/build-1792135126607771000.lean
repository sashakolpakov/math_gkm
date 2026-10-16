import MarkovStripGeneralGapMCE8
/-! Machine-authored ce882be3. High-cone polynomial certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 20000000
set_option maxRecDepth 25000

theorem stripHalf_largeMCE8 (k l q : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (hv : 0 ≤ q) :
 0 ≤ stripGeneralGapMCE8 (((k+(l+5)+2)+q)/2) k (l+5) q (((k+(l+5)+2)-q)/2) 0 := by
 unfold stripGeneralGapMCE8 stripGeneralJMCE8 stripGeneralHMCE8 stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

theorem stripHalf_twoMCE8 (k l q : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (hv : 0 ≤ q) :
 0 ≤ stripGeneralGapMCE8 ((((k+3)+2+2)+q)/2) (k+3) 2 q ((((k+3)+2+2)-q)/2) 0 := by
 unfold stripGeneralGapMCE8 stripGeneralJMCE8 stripGeneralHMCE8 stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

theorem stripHalf_threeMCE8 (k l q : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (hv : 0 ≤ q) :
 0 ≤ stripGeneralGapMCE8 ((((k+2)+3+2)+q)/2) (k+2) 3 q ((((k+2)+3+2)-q)/2) 0 := by
 unfold stripGeneralGapMCE8 stripGeneralJMCE8 stripGeneralHMCE8 stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

theorem stripHalf_fourMCE8 (k l q : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (hv : 0 ≤ q) :
 0 ≤ stripGeneralGapMCE8 ((((k+1)+4+2)+q)/2) (k+1) 4 q ((((k+1)+4+2)-q)/2) 0 := by
 unfold stripGeneralGapMCE8 stripGeneralJMCE8 stripGeneralHMCE8 stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity
end
end MathGKM.Markov
