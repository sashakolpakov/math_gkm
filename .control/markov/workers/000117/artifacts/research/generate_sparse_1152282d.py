"""Machine-authored candidate expansion; Lean verifies against proved run jets."""
from generate_jets_1152282d import *
def main():
 data=json.loads((R/'evidence/markov-ead8a96f/third-sparse-candidate.json').read_text())
 blocks=[[] for _ in range(4)]
 for k,vs in data['table']:
  for j,v in enumerate(vs):
   v=Fraction(v)
   if not v:continue
   assert v.denominator==1
   powers=k[:5]+[j,k[6]]
   factors=([str(abs(v))] if abs(v)!=1 or not any(powers) else [])+[name+(f'^{p}' if p>1 else '') for name,p in zip(['a','b','c','d','e','q','x'],powers) if p]
   blocks[k[5]].append(('-' if v<0 else '+')+'*'.join(factors))
 s='''import MarkovThirdClearedM115
import MarkovBinomialExtractBC
/-! Machine-authored 1152282d. Explicit four-block identity, checked universally.
The proposed coefficients came from interpolation; the proof uses the checked
run-jet recurrence and ring identities and has no interpolation assumption. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 20000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
'''
 for i,ts in enumerate(blocks):
  body=''.join(ts).removeprefix('+')
  s+=f'\ndef vJ{i}M115 {{R : Type*}} [CommRing R] (a b c d e q x : R) : R :=\n {body}\n'
 s+='''
theorem vThirdSparse_expandM115 (a b c d e q T : ℤ[X]) :
 vThirdSparseM115 a b c d e q T=
 vJ0M115 a b c d e q X+T*vJ1M115 a b c d e q X+
 T^2*vJ2M115 a b c d e q X+T^3*vJ3M115 a b c d e q X := by
 simp only [vThirdSparseM115,vThirdClearedM115,boolMomentADB2,boolJetADB2,
   Bool.false_eq_true,if_false,if_true,vJ0M115,vJ1M115,vJ2M115,vJ3M115,
   vAPMDE6,vBLMDE6,vBPMDE6,vCLM115,vCPM115,vGLM115,vGPM115]
 ring

def vThirdNumeratorM115 (n : ℕ) (a b c d e : ℕ) : ℤ[X] :=
 vJ0M115 (a:ℤ[X]) b c d e (n+1) X+
 X^(n+1)*vJ1M115 (a:ℤ[X]) b c d e (n+1) X+
 X^(2*(n+1))*vJ2M115 (a:ℤ[X]) b c d e (n+1) X+
 X^(3*(n+1))*vJ3M115 (a:ℤ[X]) b c d e (n+1) X

theorem vThirdSeed_four_blocksM115 (n : ℕ) (rest : List Bool) :
 (1-X)^6*vThirdSeedMEA (X:ℤ[X]) n rest=
 vThirdNumeratorM115 n (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b))
   (3*(frame rest).mid.a-2*(frame rest).mid.b) := by
 rw [vThirdSeed_sparseM115,vThirdSparse_expandM115]
 simp only [vThirdNumeratorM115,pow_mul,mul_comm 2 (n+1),mul_comm 3 (n+1)]

def vThirdValueM115 (n a b c d e j : ℕ) : ℤ :=
 ∑ k ∈ Finset.range (j+1), (vThirdNumeratorM115 n a b c d e).coeff k*
   ((5+(j-k)).choose 5:ℤ)

theorem vThirdSeed_coeffM115 (n : ℕ) (rest : List Bool) (j : ℕ) :
 (vThirdSeedMEA (X:ℤ[X]) n rest).coeff j=
 vThirdValueM115 n (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b))
   (3*(frame rest).mid.a-2*(frame rest).mid.b) j := by
 exact coeff_of_one_sub_mul_rangeBC _ _ 5 j (vThirdSeed_four_blocksM115 n rest)
end
end MathGKM.Markov
'''
 (R/'research/MarkovThirdSparseM115.lean').write_text(s)
 print('Generated four blocks',list(map(len,blocks)))
if __name__=='__main__':main()
