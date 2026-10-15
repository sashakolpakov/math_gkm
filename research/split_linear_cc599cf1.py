"""Machine-authored decomposition of timed-out local calculation."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
s=(R/'MarkovFourLinearCC.lean').read_text()
head=s.split('theorem localFour_linearCC')[0]
(R/'MarkovFourLinearDefsCC.lean').write_text(head+'end\nend MathGKM.Markov\n')
proof=s.split(' := by\n',1)[1].rsplit('end\nend MathGKM.Markov',1)[0]
for i,(p,q) in enumerate([('false','false'),('false','true'),('true','false'),('true','true')]):
 h='''import MarkovFourLinearDefsCC
/-! Machine-authored cc599cf1. Split square-zero calculation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
 h+=f'theorem localFour_linear{i}CC {{A : Type*}} [CommRing A] (N Z x : A) (r s : Bool) (hz : Z^2=0) :\n localFourNumBC N Z x {p} {q} r s=linearFourCC N Z x {p} {q} r := by\n'
 h+=proof.replace('cases p <;> cases q <;> cases r <;> cases s','cases r <;> cases s')
 (R/f'MarkovFourLinear{i}CC.lean').write_text(h+'end\nend MathGKM.Markov\n')
ass=''.join(f'import MarkovFourLinear{i}CC\n' for i in range(4))
ass+='''/-! Machine-authored cc599cf1. Assembly of split local identities. -/
namespace MathGKM.Markov
noncomputable section
theorem localFour_linearCC {A : Type*} [CommRing A] (N Z x : A) (p q r s : Bool) (hz : Z^2=0) :
 localFourNumBC N Z x p q r s=linearFourCC N Z x p q r := by
 cases p <;> cases q
'''
for i in range(4):ass+=f' · exact localFour_linear{i}CC N Z x r s hz\n'
(R/'MarkovFourLinearCC.lean').write_text(ass+'end\nend MathGKM.Markov\n')
