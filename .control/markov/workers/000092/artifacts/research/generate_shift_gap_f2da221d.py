"""Machine-authored certificate candidates. Every identity needs Lean checking."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f2da221d'
d=json.loads((O/'first-shift-probe.json').read_text())
for case,row in enumerate(x for x in d['certificates'] if x['nbase']==5):
 terms=[]
 for ks,v in row['polynomial']:
  assert all(ks[k]==0 for k in [1,4,5,6,7]) and int(v)>=0
  fs=[v]+[name if k==1 else f'{name}^{k}' for name,k in [('N',ks[0]),('C',ks[2]),('R',ks[3])] if k]
  terms.append('*'.join(fs))
 rv='R+4' if case==0 else str(4-case)
 cv='R+C+5' if case==0 else 'C+5'
 head='''import MarkovCubicMomentsF2
import MarkovFourthBoundaryF2
/-! Machine-authored f2da221d. First shifted gap certificate candidate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
'''
 text=head+f'\ndef firstShiftGap{case}F2 (N C R : ℤ) : ℤ :=\n '+' + '.join(terms)+'\n'
 text+=f'''\ntheorem firstShiftGap_identity{case}F2 (N C R : ℤ) :
 fourthShapeK0B ({cv}) ((N+5)*({cv})+({rv})) (N+6)^2-
 fourthShapeK0B ({cv}) ((N+5)*({cv})+({rv})) (N+5)*
   (fourthShapeK0B ({cv}) ((N+5)*({cv})+({rv})) (N+7)+
     315*shiftCorrectionF2 (N+5) ({cv}) ({rv}))=firstShiftGap{case}F2 N C R := by
 unfold fourthShapeK0B shiftCorrectionF2 firstShiftGap{case}F2
 ring

theorem firstShiftGap_nonneg{case}F2 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :
 0≤firstShiftGap{case}F2 N C R := by
 unfold firstShiftGap{case}F2
 positivity
end
end MathGKM.Markov
'''
 (R/f'research/MarkovFirstShiftGap{case}F2.lean').write_text(text)
print('Four first-shift certificate candidates written.')
