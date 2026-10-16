import MarkovStripGapMB9D
/-! Machine-authored ce882be3. Full-statistic gap, no source assumption. -/
namespace MathGKM.Markov
noncomputable section
def stripGeneralJMCE8 (a k l q : ℝ) :=
 (k+1)*stripJMB9D a k l+8*q*(l-1)*(l-2)*(l-3)
def stripGeneralHMCE8 (a k l q t u : ℝ) :=
 (k+1)*(k+2)*stripHMB9D a k l+
 24*(a+k+l-5)*q*(k+1)*(k+2)*(l-2)*(l-3)*(l-4)+
 (24*t+(72*a-120)*q)*(k+2)*(l-2)*(l-3)*(l-4)*(l-5)+
 24*u*(l-2)*(l-3)*(l-4)*(l-5)*(l-6)
def stripGeneralGapMCE8 (a k l q t u : ℝ) :=
 3*(k+l-3)*(k+l-4)*(k+2)*l*(stripGeneralJMCE8 a k l q)^2-
 2*(k+l-1)*(k+l-2)*(k+1)*(l-1)*stripTMB9D a k l*stripGeneralHMCE8 a k l q t u
end
end MathGKM.Markov
