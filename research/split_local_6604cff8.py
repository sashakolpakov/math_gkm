"""Machine-authored modular coefficient and local-moment validation."""
from pathlib import Path
import re
D=Path('research');s=(D/'MarkovFourthThreeLocalN6604.lean').read_text()
head=s[:s.index('theorem jet3_')]
jets=re.findall(r'theorem jet3_[\s\S]*?(?=theorem |def threeLocal)',s)
assert len(jets)==44
for i in range(4):
 (D/f'MarkovThreeJets{i}N6604.lean').write_text(head+''.join(jets[i*11:(i+1)*11])+'end\nend MathGKM.Markov\n')
defs=s[s.index('def threeLocalFour'):s.index('theorem runLocalFour_three')]
(D/'MarkovThreeLocalDefN6604.lean').write_text('import MarkovFourthRunMomentBE\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\n'+defs+'end\nend MathGKM.Markov\n')
names=re.findall(r'theorem (jet3_\w+)',s)
imports=''.join(f'import MarkovThreeJets{i}N6604\n' for i in range(4))+'import MarkovThreeLocalDefN6604\n'
for i,(p,q) in enumerate([('false','false'),('false','true'),('true','false'),('true','true')]):
 text=imports+'''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
 text+=f'''theorem runLocalFour_three_{i}N6604 (r s : Bool) :
 runLocalFourBE 3 {p} {q} r s=threeLocalFourN6604 {p} {q} r s := by
 cases r <;> cases s <;>
   simp only [runLocalFourBE,localFour01F,threeLocalFourN6604,{','.join(names)}] <;> ring
end
end MathGKM.Markov
'''
 (D/f'MarkovThreeMoment{i}N6604.lean').write_text(text)
final=''.join(f'import MarkovThreeMoment{i}N6604\n' for i in range(4))+'''namespace MathGKM.Markov
noncomputable section
theorem runLocalFour_threeN6604 (p q r s : Bool) :
 runLocalFourBE 3 p q r s=threeLocalFourN6604 p q r s := by
 cases p <;> cases q
 · exact runLocalFour_three_0N6604 r s
 · exact runLocalFour_three_1N6604 r s
 · exact runLocalFour_three_2N6604 r s
 · exact runLocalFour_three_3N6604 r s
end
end MathGKM.Markov
'''
# Preserve the original failed attempt and defer replacement until it exits.
(D/'MarkovThreeLocalCombinedN6604.lean').write_text(final)
print('Generated four jet modules and four local-moment modules')
