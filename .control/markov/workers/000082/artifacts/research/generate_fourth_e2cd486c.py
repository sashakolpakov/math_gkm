"""Machine-authored coefficient regrouping; checked by Lean ring proofs."""
from pathlib import Path
import re
p=Path('research/MarkovNormalBandsFDDA.lean').read_text().split('def normalTail3FDDA')[1].split(':=\n')[1].split('\ndef ')[0].strip()
groups=[[] for _ in range(8)]
for term in p.split(' + '):
 m=re.search(r'\*x(?:\^(\d+))?',term)
 if m:k=int(m.group(1) or 1);term=term[:m.start()]+term[m.end():]
 else:k=0
 groups[k].append(term)
defs='\n'.join(f'def fourthPolyCoeff{k}E2 (c r q t u : ℤ) : ℤ :=\n '+ ' + '.join(g) for k,g in enumerate(groups))
names=' '.join(f'fourthPolyCoeff{k}E2' for k in range(8))
out='''import MarkovTerminalAlgebraE2
import MarkovCrossTail53D
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedVariables false
'''+defs+'\ndef fourthPolyE2 (c r q t u : ℤ) : ℤ[X] :=\n '+ '+'.join(f'C (fourthPolyCoeff{k}E2 c r q t u)*X^{k}' for k in range(8))+'''
theorem fourth_polyE2 (n c r q t u : ℤ) :
 normalTail3FDDA (n:ℤ[X]) c r q t u X=fourthPolyE2 c r q t u := by
 simp only [normalTail3FDDA,fourthPolyE2,'''+','.join(names.split())+''',
   map_add,map_mul,map_pow,map_neg,map_ofNat,Polynomial.C_eq_intCast]
 ring
theorem fourth_series0E2 (n c r : ℕ) :
 PowerSeries.coeff 0 (inverseSixFDDA*(thirdR53D n c r:PowerSeries ℤ))=
 fourthCoeff0E2 c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) := by
 have hp := fourth_polyE2 n c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)
 simp only [Int.cast_natCast] at hp
 unfold thirdR53D
 rw [hp]
 simp only [fourthPolyE2,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
 norm_num [Nat.choose,fourthPolyCoeff0E2,fourthCoeff0E2]
theorem fourth_series1E2 (n c r : ℕ) :
 PowerSeries.coeff 1 (inverseSixFDDA*(thirdR53D n c r:PowerSeries ℤ))=
 6*fourthCoeff0E2 c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ)+
 fourthCoeff1E2 c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) := by
 have hp := fourth_polyE2 n c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)
 simp only [Int.cast_natCast] at hp
 unfold thirdR53D
 rw [hp]
 simp only [fourthPolyE2,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
 norm_num [Nat.choose,fourthPolyCoeff0E2,fourthPolyCoeff1E2,fourthCoeff0E2,fourthCoeff1E2]
 <;> ring
end
end MathGKM.Markov
'''
Path('research/MarkovFourthPolyE2.lean').write_text(out)
p=Path('research/MarkovTerminalExtractE2.lean');s=p.read_text();s=s.replace('import MarkovCrossTail53D','import MarkovFourthPolyE2');s=s[:s.index('def fourthCoeff0E2')]+s[s.index('theorem extract_four_bandsE2'):];p.write_text(s)
