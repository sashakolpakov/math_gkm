import MarkovStripGeneralGapMCE8
/-! Machine-authored ce882be3. High-cone polynomial certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 20000000
set_option maxRecDepth 25000

theorem stripHigh_largeMCE8 (k l u : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (hv : 0 ≤ u) :
 0 ≤ stripGeneralGapMCE8 ((2*(k+(l+5)+2)+u)/3) k (l+5) (((k+(l+5)+2)+2*u)/3) (((k+(l+5)+2)-u)/3) u := by
 unfold stripGeneralGapMCE8 stripGeneralJMCE8 stripGeneralHMCE8 stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

theorem stripHigh_twoMCE8 (k l u : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (hv : 0 ≤ u) :
 0 ≤ stripGeneralGapMCE8 ((2*((k+3)+2+2)+u)/3) (k+3) 2 ((((k+3)+2+2)+2*u)/3) ((((k+3)+2+2)-u)/3) u := by
 unfold stripGeneralGapMCE8 stripGeneralJMCE8 stripGeneralHMCE8 stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

theorem stripHigh_threeMCE8 (k l u : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (hv : 0 ≤ u) :
 0 ≤ stripGeneralGapMCE8 ((2*((k+2)+3+2)+u)/3) (k+2) 3 ((((k+2)+3+2)+2*u)/3) ((((k+2)+3+2)-u)/3) u := by
 unfold stripGeneralGapMCE8 stripGeneralJMCE8 stripGeneralHMCE8 stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

theorem stripHigh_fourMCE8 (k l u : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (hv : 0 ≤ u) :
 0 ≤ stripGeneralGapMCE8 ((2*((k+1)+4+2)+u)/3) (k+1) 4 ((((k+1)+4+2)+2*u)/3) ((((k+1)+4+2)-u)/3) u := by
 unfold stripGeneralGapMCE8 stripGeneralJMCE8 stripGeneralHMCE8 stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity
end
end MathGKM.Markov
