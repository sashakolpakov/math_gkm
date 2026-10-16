"""Machine-authored generator. Generated identities are checked by Lean ring."""
from pathlib import Path
import json
data=json.loads(Path('evidence/markov-af6200bf/scalar-certificates.json').read_text())
s='''import MarkovOffsetStepMAF6
/-! Machine-authored af6200bf. Nonnegative exact scalar certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000
set_option linter.unusedSimpArgs false
def horizontalGapMAF6 (j i h k : ℤ) : ℤ :=
 horizontalNumMAF6 j i h*horizontalDenMAF6 (i+1) k-
 horizontalNumMAF6 j (i+1) k*horizontalDenMAF6 i h
def diagonalGapMAF6 (j i h k : ℤ) : ℤ :=
 diagonalNumMAF6 j i h*diagonalDenMAF6 j (i+1) k-
 diagonalNumMAF6 j (i+1) k*diagonalDenMAF6 j i h
'''
for key,name,expr in [('horizontal','horizontal_gapMAF6','horizontalGapMAF6 (r+p+2+t) (r+k+p+2) (k+p) k'),('diagonal_far','diagonal_gapMAF6','diagonalGapMAF6 (p+r+t) (k+p+r+2) k (k+p+1)')]:
 assert data[key]['positive']
 s+=f'''\ntheorem {name} (k p r t : ℤ) (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ {expr} := by
 have he : {expr}=\n  {data[key]['lean']} := by
   unfold horizontalGapMAF6 diagonalGapMAF6 horizontalNumMAF6 horizontalDenMAF6 diagonalNumMAF6 diagonalDenMAF6
   ring
 rw [he]
 positivity
'''
s+='\nend\nend MathGKM.Markov\n'
# unfold only definitions actually present
s=s.replace('unfold horizontalGapMAF6 diagonalGapMAF6 horizontalNumMAF6 horizontalDenMAF6 diagonalNumMAF6 diagonalDenMAF6','simp only [horizontalGapMAF6,diagonalGapMAF6,horizontalNumMAF6,horizontalDenMAF6,diagonalNumMAF6,diagonalDenMAF6]')
Path('research/MarkovOffsetScalarMAF6.lean').write_text(s)
