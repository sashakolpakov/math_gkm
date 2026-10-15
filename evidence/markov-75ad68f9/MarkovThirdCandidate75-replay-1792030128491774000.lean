import MarkovCutRootA27
/-! Machine-authored 75ad68f9. A candidate third lower slice, scaled uniformly
by six. Its universal source identification remains an explicit hypothesis. -/
namespace MathGKM.Markov
noncomputable section
def thirdSeq75 (c r q t u : ℤ) : ℕ → ℤ
 | 0 => -6+11*(c+r)-6*(c+r)^2+(c+r)^3
 | 1 => -18-3*c+87*r+3*c*c-51*c*r-54*r*r+9*c*c*r+18*c*r*r+9*r^3
 | 2 => -18+6*c+33*r+3*c*r-114*r*r+27*c*r*r+27*r^3
 | 3 => -6+21*r-18*r*r+27*r^3+24*q*(c+r-7)
 | 4 => 24*((3*r-5)*q+t)
 | 5 => 24*u
 | _ => 0
end
end MathGKM.Markov
