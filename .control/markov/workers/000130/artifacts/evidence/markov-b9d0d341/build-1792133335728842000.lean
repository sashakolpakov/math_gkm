import MathGKM.Markov
/-! Machine-authored b9d0d341. Exact low-slope vertical j=1 gap certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 10000
def stripTMB9D (a k l : ℝ) := (3*a-1)*l+(a+k+l+1)*k
def stripJMB9D (a k l : ℝ) :=
 (9*a^2-5*a+2)*(l-1)*(l-2)+(6*a^2+6*a*(k+l+2)-16*a+4)*k*(l-1)+
 (a+k+l+1)*(a+k+l)*k*(k-1)
def stripHMB9D (a k l : ℝ) :=
 (27*a^3-18*a^2+21*a-6)*(l-2)*(l-3)*(l-4)+
 (27*a^3+27*a^2*(k+l+2)-114*a^2+3*a*(k+l+2)+33*a+6*(k+l+2)-18)*k*(l-2)*(l-3)+
 (9*a^3+18*a^2*(k+l+2)-54*a^2+9*a*(k+l+2)^2-51*a*(k+l+2)+87*a+3*(k+l+2)^2-3*(k+l+2)-18)*k*(k-1)*(l-2)+
 (a+k+l+1)*(a+k+l)*(a+k+l-1)*k*(k-1)*(k-2)
def stripGapMB9D (a k l : ℝ) :=
 3*(k+l-3)*(k+l-4)*l*(stripJMB9D a k l)^2-
 2*(k+l-1)*(k+l-2)*(l-1)*stripTMB9D a k l*stripHMB9D a k l

theorem strip_largeMB9D (a k l : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (hl : 0 ≤ l) :
 0 ≤ stripGapMB9D (a+1) k (l+5) := by
 unfold stripGapMB9D stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

theorem strip_twoMB9D (a k l : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (hl : 0 ≤ l) :
 0 ≤ stripGapMB9D (a+1) (k+3) 2 := by
 unfold stripGapMB9D stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

theorem strip_threeMB9D (a k l : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (hl : 0 ≤ l) :
 0 ≤ stripGapMB9D (a+1) (k+2) 3 := by
 unfold stripGapMB9D stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

theorem strip_fourMB9D (a k l : ℝ) (ha : 0 ≤ a) (hk : 0 ≤ k) (hl : 0 ≤ l) :
 0 ≤ stripGapMB9D (a+1) (k+1) 4 := by
 unfold stripGapMB9D stripTMB9D stripJMB9D stripHMB9D
 ring_nf
 positivity

end
end MathGKM.Markov
