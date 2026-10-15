"""Machine-authored general first block, staged parameter substitution.
Python supplies expressions; every claimed identity must pass ordinary Lean ring.
"""
from pathlib import Path
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-8067e0c5'
head='''/-! Machine-authored live request 8067e0c5. Ordinary exact algebra. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
'''
end='end\nend MathGKM.Markov\n'
def bal(xs):
 if not xs:return '0'
 if len(xs)==1:return xs[0]
 k=len(xs)//2
 return '('+bal(xs[:k])+' + '+bal(xs[k:])+')'
def expr(p):
 assert all(v.denominator==1 for v in p.values())
 return bal(['*'.join([str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(['N','Z','C','R','K','E','U','x'],ks) if k]) for ks,v in sorted(p.items())])
def save(m,s):
 p=R/'research'/f'{m}.lean';assert not p.exists(),p;p.write_text(s)
s=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
l=load(json.loads((R/'evidence/markov-cc599cf1/linear-factor.json').read_text())['shape'])
# Stage 1: predecessor chart only, leaving run N and offset K unsubstituted.
v=subst(s,[N,Z,Rr+C+5,N*(Rr+C+5)+(Rr+4),N+Q,T,U,X])+subst(l,[N,Z,Rr+C+5,Rr+4,Q,T,U,X])
degs=[(a,b) for a in range(5) for b in range(5-a)]
pn=lambda a,b:f'blockStageP{a}{b}M806'
parts={}
st='import MarkovShiftShapeCC\nimport MarkovBlockLDefsM042\n'+head
for a,b in degs:
 p=P({tuple(0 if j in [2,3] else e for j,e in enumerate(k)):z for k,z in v.items() if k[3]==a and k[2]==b})
 parts[a,b]=p;st+=f'\ndef {pn(a,b)} (N K : ℤ) : ℤ :=\n {expr(p)}\n'
save('MarkovBlockStageDefsM806',st+end)
dec=lambda:bal([f'{pn(a,b)} N K*R^{a}*C^{b}' for a,b in degs])
st='import MarkovBlockStageDefsM806\n'+head
st+='\ntheorem block_stageM806 (N K C R : ℤ) :\n (fourthShapeK0B (R+C+5) (N*(R+C+5)+(R+4)) (N+K)+shiftShapeCC N (R+C+5) (R+4) K)='+dec()+' := by\n unfold fourthShapeK0B shiftShapeCC '+' '.join(pn(a,b) for a,b in degs)+'\n ring\n'
save('MarkovBlockStageM806',st+end)
# Stage 2: each scalar coefficient receives the run/offset substitutions.
scalar=[]
for i in range(3):
 for a in range(5):
  m=f'MarkovBlockScalar{i}{a}M806';scalar.append(m)
  st='import MarkovBlockStageDefsM806\n'+head
  for aa,b in degs:
   if a!=aa:continue
   st+=f'\ntheorem block_scalar{i}{a}{b}M806 (J E : ℤ) :\n {pn(a,b)} (J+E+5) (J+{5+i})=blockLP{i}{a}{b}M042 J E := by\n unfold {pn(a,b)} blockLP{i}{a}{b}M042\n ring\n'
  save(m,st+end)
# Stage 3: recombine using opaque coefficients.
values=[]
for i in range(3):
 m=f'MarkovBlockValue{i}M806';values.append(m)
 st='import MarkovBlockStageM806\n'+''.join(f'import MarkovBlockScalar{i}{a}M806\n' for a in range(5))+head
 full=f'(fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+{10+i})+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+{5+i}))'
 rhs=bal([f'blockLP{i}{a}{b}M042 J E*R^{a}*C^{b}' for a,b in degs])
 st+=f'\ntheorem block_value{i}M806 (C R J E : ℤ) :\n {full}={rhs} := by\n have he : 2*J+E+{10+i}=(J+E+5)+(J+{5+i}) := by ring\n rw [he,block_stageM806]\n rw ['+','.join(f'block_scalar{i}{a}{b}M806' for a,b in degs)+']\n'
 save(m,st+end)
(O/'generation.json').write_text(json.dumps(dict(stage_terms=len(v),part_terms={f'{a},{b}':len(p) for (a,b),p in parts.items()},scalar=scalar,values=values),indent=2)+'\n')
print('Generated staged definitions, expansion, 15 scalar modules, 3 value modules',flush=True)
