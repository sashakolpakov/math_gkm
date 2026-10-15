"""Machine-authored factored certificate proof generation, preserving rejected full attempt."""
from pathlib import Path
from fractions import Fraction as F
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-0b212317'
def subst(p,vals):
 out=coerce(0);powers={(i,k):vals[i]**k for i in range(8) for k in {a[i] for a in p}}
 for ks,v in p.items():
  z=coerce(v)
  for i,k in enumerate(ks):
   if k:z=z*powers[i,k]
  out=out+z
 return out
def expr(p):
 out=[]
 for ks,v in sorted(p.items()):
  assert v.denominator==1
  out.append('*'.join([str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(['N','Z','C','R','J','T','U','x'],ks) if k]))
 return ' + '.join(out) or '0'
def part(p,k):return P({ks[:3]+(0,)+ks[4:]:v for ks,v in p.items() if ks[3]==k})
s=P({tuple(k):F(v) for k,v in json.loads((O/'compact-low-candidates.json').read_text())['shape']})
sh=[subst(s,[N,Z,C+2,(C+2)*(Q+6)+Rr+1,Q+5+i,T,U,X]) for i in range(3)]
gp=sh[1]*sh[1]-sh[0]*sh[2]
assert all(v>=0 for v in gp.values())
header='''import MarkovFourthShapeK0B
/-! Machine-authored request 0b212317. Quartic decomposition for exact gap certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
'''
txt=header
for i in range(3):
 for k in range(5):txt+=f'\ndef shapePart{i}{k}K0B (C J : ℤ) : ℤ :=\n {expr(part(sh[i],k))}\n'
for i in range(3):
 txt+=f'''\ntheorem shapeParts{i}K0B (C R J : ℤ) :
 fourthShapeK0B (C+2) ((C+2)*(J+6)+R+1) (J+{5+i}) =
 '''+' + '.join(f'shapePart{i}{k}K0B C J*R^{k}' for k in range(5))+''' := by
 unfold fourthShapeK0B '''+' '.join(f'shapePart{i}{k}K0B' for k in range(5))+'''
 ring
'''
txt+='end\nend MathGKM.Markov\n'
(R/'research/MarkovFourthPartsK0B.lean').write_text(txt)
for k in range(9):
 txt=header.replace('import MarkovFourthShapeK0B','import MarkovFourthPartsK0B')
 txt+=f'\ndef fourthGapPart{k}K0B (C J : ℤ) : ℤ :=\n {expr(part(gp,k))}\n'
 terms=' + '.join(f'(shapePart1{i}K0B C J*shapePart1{j}K0B C J-shapePart0{i}K0B C J*shapePart2{j}K0B C J)' for i in range(5) for j in range(5) if i+j==k)
 txt+=f'\ntheorem fourthGapPart{k}_eqK0B (C J : ℤ) :\n fourthGapPart{k}K0B C J={terms} := by\n unfold fourthGapPart{k}K0B '+' '.join(f'shapePart{a}{b}K0B' for a in range(3) for b in range(5))+'\n ring\n'
 txt+=f'\ntheorem fourthGapPart{k}_nonnegK0B (C J : ℤ) (hC : 0≤C) (hJ : 0≤J) :\n 0≤fourthGapPart{k}K0B C J := by\n unfold fourthGapPart{k}K0B\n positivity\nend\nend MathGKM.Markov\n'
 (R/f'research/MarkovFourthGapPart{k}K0B.lean').write_text(txt)
txt='\n'.join(f'import MarkovFourthGapPart{k}K0B' for k in range(9))+'\n'+header.split('\n',1)[1]
rhs=' + '.join(f'fourthGapPart{k}K0B C J*R^{k}' for k in range(9))
txt+=f'''\ntheorem fourthGap_factoredK0B (C R J : ℤ) :
 fourthShapeK0B (C+2) ((C+2)*(J+6)+R+1) (J+6)^2-
 fourthShapeK0B (C+2) ((C+2)*(J+6)+R+1) (J+5)*
 fourthShapeK0B (C+2) ((C+2)*(J+6)+R+1) (J+7)={rhs} := by
 rw [shapeParts0K0B,shapeParts1K0B,shapeParts2K0B]
 rw ['''+','.join(f'fourthGapPart{k}_eqK0B' for k in range(9))+''']
 ring

theorem fourthShape_logConcaveStrongK0B (c h j : ℤ) (hc : 2≤c) (hj : 6≤j)
 (hh : c*j+1≤h) :
 fourthShapeK0B c h (j-1)*fourthShapeK0B c h (j+1)≤fourthShapeK0B c h j^2 := by
 let C:=c-2
 let R:=h-c*j-1
 let J:=j-6
 have hC : 0≤C := by dsimp [C]; omega
 have hR : 0≤R := by dsimp [R]; omega
 have hJ : 0≤J := by dsimp [J]; omega
 have he := fourthGap_factoredK0B C R J
'''
for k in range(9):txt+=f' have h{k} := fourthGapPart{k}_nonnegK0B C J hC hJ\n'
txt+=f' have hpos : 0≤{rhs} := by positivity\n'
txt+=''' have ec : C+2=c := by dsimp [C]; ring
 have eh : (C+2)*(J+6)+R+1=h := by dsimp [C,J,R]; ring
 have ej0 : J+5=j-1 := by dsimp [J]; ring
 have ej1 : J+6=j := by dsimp [J]; ring
 have ej2 : J+7=j+1 := by dsimp [J]; ring
 rw [ec,eh,ej0,ej1,ej2] at he
 linarith only [he,hpos]

theorem fourthShape_logConcaveK0B (c h j : ℤ) (hc : 2≤c) (hj : 6≤j)
 (hh : c*(j+1)≤h) :
 fourthShapeK0B c h (j-1)*fourthShapeK0B c h (j+1)≤fourthShapeK0B c h j^2 :=
 fourthShape_logConcaveStrongK0B c h j hc hj (by nlinarith only [hc,hh])
end
end MathGKM.Markov
'''
(R/'research/MarkovFourthGapK0B.lean').write_text(txt)
print({'parts':9,'certificate_terms':len(gp)})
