"""Machine-authored factor-by-r certificates for the whole first shifted block."""
from pathlib import Path
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-cc599cf1'
def expr(p):
 return ' + '.join('*'.join([str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(['N','Z','C','R','J','E','U','x'],ks) if k]) for ks,v in sorted(p.items())) or '0'
head='''/-! Machine-authored cc599cf1. Split exact first-block gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
'''
s=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
l=load(json.loads((O/'linear-factor.json').read_text())['shape'])
vals=[subst(s,[N,Z,C,N*C+Rr,N+Q+t,T,U,X])+subst(l,[N,Z,C,Rr,Q+t,T,U,X]) for t in range(3)]
vv=[subst(p,[Q+T+5,Z,Rr+C+5,Rr+4,Q+5,T,U,X]) for p in vals]
parts=[];text='import MarkovShiftShapeCC\n'+head
for i,p in enumerate(vv):
 ps=[P({tuple(0 if a==3 else e for a,e in enumerate(k)):v for k,v in p.items() if k[3]==j}) for j in range(5)]
 parts.append(ps)
 for k,v in enumerate(ps):text+=f'\ndef blockPart{i}{k}CC (C J E : ℤ) : ℤ :=\n {expr(v)}\n'
for i in range(3):
 lhs=f'fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+{10+i})+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+{5+i})'
 names=[f'blockPart{i}{k}CC' for k in range(5)]
 text+=f'\ntheorem blockParts{i}CC (C J E R : ℤ) :\n {lhs}=\n '+' + '.join(f'{nm} C J E*R^{k}' for k,nm in enumerate(names))+' := by\n unfold fourthShapeK0B shiftShapeCC '+' '.join(names)+'\n ring\n'
text+='end\nend MathGKM.Markov\n';(R/'research/MarkovBlockPartsCC.lean').write_text(text)
for a in range(9):
 pairs=[(k,a-k) for k in range(5) if 0<=a-k<5];poly=coerce(0)
 for k,l in pairs:poly+=parts[1][k]*parts[1][l]-parts[0][k]*parts[2][l]
 assert all(v>=0 for v in poly.values())
 tt='import MarkovBlockPartsCC\n'+head
 tt+=f'\ndef blockGap{a}CC (C J E : ℤ) : ℤ :=\n {expr(poly)}\n'
 lhs=' + '.join(f'(blockPart1{k}CC C J E*blockPart1{l}CC C J E-blockPart0{k}CC C J E*blockPart2{l}CC C J E)' for k,l in pairs)
 names=sorted({f'blockPart{i}{k}CC' for i in range(3) for k in range(5) if any(k in kl for kl in pairs)})
 tt+=f'\ntheorem blockGap_identity{a}CC (C J E : ℤ) :\n {lhs}=blockGap{a}CC C J E := by\n simp only ['+','.join(names+[f'blockGap{a}CC'])+']\n ring\n'
 tt+=f'\ntheorem blockGap_nonneg{a}CC (C J E : ℤ) (hC : 0≤C) (hJ : 0≤J) (hE : 0≤E) :\n 0≤blockGap{a}CC C J E := by unfold blockGap{a}CC; positivity\nend\nend MathGKM.Markov\n'
 (R/f'research/MarkovBlockGap{a}CC.lean').write_text(tt)
 print('part',a,len(poly),flush=True)
for a in range(1,4):
 row=json.loads((O/'block-gap-probe.json').read_text())['certificates'][a];poly=load(row['polynomial']);rv=4-a
 tt='import MarkovShiftShapeCC\n'+head
 tt+=f'\ndef blockSmall{a}CC (C J E : ℤ) : ℤ :=\n {expr(poly)}\n'
 lhs=lambda i:f'(fourthShapeK0B (C+5) ((J+E+5)*(C+5)+{rv}) (2*J+E+{10+i})+shiftShapeCC (J+E+5) (C+5) {rv} (J+{5+i}))'
 tt+=f'\ntheorem blockSmall_identity{a}CC (C J E : ℤ) :\n {lhs(1)}^2-{lhs(0)}*{lhs(2)}=blockSmall{a}CC C J E := by\n unfold fourthShapeK0B shiftShapeCC blockSmall{a}CC\n ring\n'
 tt+=f'\ntheorem blockSmall_nonneg{a}CC (C J E : ℤ) (hC : 0≤C) (hJ : 0≤J) (hE : 0≤E) :\n 0≤blockSmall{a}CC C J E := by unfold blockSmall{a}CC; positivity\nend\nend MathGKM.Markov\n'
 (R/f'research/MarkovBlockSmall{a}CC.lean').write_text(tt)
