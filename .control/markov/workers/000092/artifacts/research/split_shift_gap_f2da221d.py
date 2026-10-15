"""Machine-authored quartic decomposition replacing timed-out full expansion."""
from pathlib import Path
from fractions import Fraction as F
import json
from probe_shift_f2da221d import P,N,Z,C,Rr,Q,T,U,X,coerce,subst,load
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f2da221d'
shape=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
delta=16*(C-Rr)*(N*C+Rr+C-2*N-5)*(N*C+Rr+C-2*N-6)*(N*C+Rr+C-2*N-7)
vals=[subst(shape,[N,Z,C,N*C+Rr,N+k,T,U,X]) for k in range(3)]
vals[2]=vals[2]+315*delta
vals=[subst(v,[N+5,Z,C+Rr+5,Rr+4,Q,T,U,X]) for v in vals]
def expr(p):
 return ' + '.join('*'.join([str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(['N','Z','C','R','Q','T','U','x'],ks) if k]) for ks,v in sorted(p.items())) or '0'
head='''/-! Machine-authored f2da221d. Split exact first-shift gap. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
'''
parts=[];text='import MarkovCubicMomentsF2\nimport MarkovFourthBoundaryF2\n'+head
for i,p in enumerate(vals):
 ps=[P({tuple(0 if idx==3 else a for idx,a in enumerate(ks)):v for ks,v in p.items() if ks[3]==k}) for k in range(5)]
 parts.append(ps)
 for k,v in enumerate(ps):text+=f'\ndef shiftPart{i}{k}F2 (N C : ℤ) : ℤ :=\n {expr(v)}\n'
for i in range(3):
 lhs=f'fourthShapeK0B (R+C+5) ((N+5)*(R+C+5)+(R+4)) (N+{5+i})'
 if i==2:lhs+=' + 315*shiftCorrectionF2 (N+5) (R+C+5) (R+4)'
 names=[f'shiftPart{i}{k}F2' for k in range(5)]
 text+=f'\ntheorem shiftParts{i}F2 (N C R : ℤ) :\n {lhs} =\n '+' + '.join(f'{nm} N C*R^{k}' for k,nm in enumerate(names))+' := by\n unfold fourthShapeK0B '+('shiftCorrectionF2 ' if i==2 else '')+' '.join(names)+'\n ring\n'
text+='end\nend MathGKM.Markov\n';(R/'research/MarkovShiftPartsF2.lean').write_text(text)
gaps=[]
for a in range(9):
 terms=[(k,a-k) for k in range(5) if 0<=a-k<5]
 poly=coerce(0)
 for k,l in terms:poly+=parts[1][k]*parts[1][l]-parts[0][k]*parts[2][l]
 assert all(v>=0 for v in poly.values());gaps.append(poly)
 tt='import MarkovShiftPartsF2\n'+head
 tt+=f'\ndef shiftGapPart{a}F2 (N C : ℤ) : ℤ :=\n {expr(poly)}\n'
 lhs=' + '.join(f'(shiftPart1{k}F2 N C*shiftPart1{l}F2 N C-shiftPart0{k}F2 N C*shiftPart2{l}F2 N C)' for k,l in terms)
 names=sorted({f'shiftPart{i}{k}F2' for i in range(3) for k in range(5) if any(k in kl for kl in terms)})
 tt+=f'\ntheorem shiftGapPart_identity{a}F2 (N C : ℤ) :\n {lhs}=shiftGapPart{a}F2 N C := by\n simp only ['+','.join(names+[f'shiftGapPart{a}F2'])+']\n ring\n'
 tt+=f'\ntheorem shiftGapPart_nonneg{a}F2 (N C : ℤ) (hN : 0≤N) (hC : 0≤C) :\n 0 ≤ shiftGapPart{a}F2 N C := by unfold shiftGapPart{a}F2; positivity\nend\nend MathGKM.Markov\n'
 (R/f'research/MarkovShiftGapPart{a}F2.lean').write_text(tt)
print(dict(shape_parts=[[len(p) for p in ps] for ps in parts],gap_parts=[len(p) for p in gaps]))
