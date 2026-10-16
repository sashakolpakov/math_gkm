import MarkovStripLCMB9D
/-! Machine-authored ce882be3. Corrected middle-slope vertical gap. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 20000
def stripHMCE8 (a k l t : ℝ) :=
 (k+1)*stripHMB9D a k l+24*t*(l-2)*(l-3)*(l-4)*(l-5)
def stripGapMCE8 (a k l t : ℝ) :=
 3*(k+l-3)*(k+l-4)*(k+1)*l*(stripJMB9D a k l)^2-
 2*(k+l-1)*(k+l-2)*(l-1)*stripTMB9D a k l*stripHMCE8 a k l t

theorem strip_largeMCE8 (k l t : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (ht : 0 ≤ t) :
 0 ≤ stripGapMCE8 ((k+(l+5)+2+t)/3) k (l+5) t := by
 unfold stripGapMCE8 stripHMCE8 stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

theorem strip_twoMCE8 (k t : ℝ) (hk : 0 ≤ k) (ht : 0 ≤ t) :
 0 ≤ stripGapMCE8 (((k+3)+2+2+t)/3) (k+3) 2 t := by
 unfold stripGapMCE8 stripHMCE8 stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

theorem strip_threeMCE8 (k t : ℝ) (hk : 0 ≤ k) (ht : 0 ≤ t) :
 0 ≤ stripGapMCE8 (((k+2)+3+2+t)/3) (k+2) 3 t := by
 unfold stripGapMCE8 stripHMCE8 stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

theorem strip_fourMCE8 (k t : ℝ) (hk : 0 ≤ k) (ht : 0 ≤ t) :
 0 ≤ stripGapMCE8 (((k+1)+4+2+t)/3) (k+1) 4 t := by
 unfold stripGapMCE8 stripHMCE8 stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity
end
end MathGKM.Markov
