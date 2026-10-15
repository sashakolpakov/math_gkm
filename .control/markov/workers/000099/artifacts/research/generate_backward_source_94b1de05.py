"""Machine-authored backwards coefficient adapter to the actual recurrence."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
s=(R/'MarkovFullTailSourceM06.lean').read_text()
body=s[s.index(' have hh :='):s.index(' have ht :=')]
head='''import MarkovFullTailSourceM94
import MarkovFullDegree4M94
import MarkovBackwardExtractM94
/-! Machine-authored 94b1de05. Actual-source backwards fourth coefficient formula. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
attribute [local irreducible] fullH0FA fullH1FA fullH2FA fullH3FA fullH4FA
 fullNumeratorFA coeff frame
theorem source_fourth_backwardM94 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hj : 3*n+7≤j) (hju : j≤4*n+7)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 ∑ k ∈ Finset.range (4*n+7-j+1),
  (reflect 15 (fullH4FA (n:ℤ[X]) (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a)
     (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) X+
   96*(1-X)^8*fourthCountCorrectionFA X (frame rest).mid.b (frame rest).mid.a)).coeff k *
  ((7+(4*n+7-j-k)).choose 7 : ℤ) := by
'''
tail=''' have h0d := fullH0_degreeM06 n (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b))
   (3*(frame rest).mid.a-2*(frame rest).mid.b)
 have h1d := fullH1_degreeM06 n (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b))
   (3*(frame rest).mid.a-2*(frame rest).mid.b)
 have h2d := fullH2_degreeM06 n (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b))
   (3*(frame rest).mid.a-2*(frame rest).mid.b)
 have h3d := fullH3_degreeM06 n (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b))
   (3*(frame rest).mid.a-2*(frame rest).mid.b)
 have ht := backward_coeffM94 _ _ _ (4*n) j hju (by compute_degree; omega)
   (correctedH4_degreeM94 _ _ _ _ _ _) hh'
 simpa only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs] using ht
end
end MathGKM.Markov
'''
(R/'MarkovBackwardSourceM94.lean').write_text(head+body+tail)
