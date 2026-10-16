import MarkovThirdSep0I14M03Final
namespace MathGKM.Markov
noncomputable section
theorem vAll_low_0_4_mid2M03 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (7+y+3*x) (1+x) (0) (0) (0) (5+v+u) (16+2*v+3*u-1)*vEM115 (7+y+3*x) (1+x) (0) (0) (0) (5+v+u) (16+2*v+3*u+1) ≤ vEM115 (7+y+3*x) (1+x) (0) (0) (0) (5+v+u) (16+2*v+3*u)^2 ∧
 0 < vEM115 (7+y+3*x) (1+x) (0) (0) (0) (5+v+u) (16+2*v+3*u) := by
 exact sSep0I14FinalM03 x y u v hx hy hu hv
end
end MathGKM.Markov
