"""Machine-authored 8ae35b59. Numerator-two subfamily certificate candidates."""
from pathlib import Path
D=Path('/Users/sasha/math_gkm/research')
def save(m,s):
 p=D/(m+'.lean');assert not p.exists();p.write_text(s)
newbs=[1,2,3,4]
for b in newbs:
 s=(D/f'MarkovMiddleGap0_{b}_0M8AE.lean').read_text()
 for old,new in [(f'midG0_0_{b}M8AE',f'midTwoG{b}M8AE'),(f'middle_gap_eq0_0_{b}M8AE',f'middle_two_gap_eq{b}M8AE'),(f'middle_gap_nonneg0_0_{b}M8AE',f'middle_two_gap_nonneg{b}M8AE')]:s=s.replace(old,new)
 save(f'MarkovMiddleTwoGap{b}M8AE',s)
gn=lambda b:f'midTwoG{b}M8AE' if b in newbs else f'midG0_0_{b}M8AE'
eq=lambda b:f'middle_two_gap_eq{b}M8AE' if b in newbs else f'middle_gap_eq0_0_{b}M8AE'
nn=lambda b:f'middle_two_gap_nonneg{b}M8AE' if b in newbs else f'middle_gap_nonneg0_0_{b}M8AE'
pn=lambda i,b:f'midP0_{i}_0_{b}M722'
value=lambda i:'('+' + '.join(f'{pn(i,b)} J E*C^{b}' for b in range(5))+')'
gap='('+' + '.join(f'{gn(b)} J E*C^{b}' for b in range(9))+')'
shape=lambda i:f'middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+{6+i})'
s=''.join(f'import MarkovMiddleValue0_{i}M722\n' for i in range(3))
for b in range(9):s+=f'import MarkovMiddleTwoGap{b}M8AE\n' if b in newbs else f'import MarkovMiddleGap0_{b}_0M8AE\n'
s+='''/-! Machine-authored 8ae35b59. Direct numerator-two middle inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536
'''
s+='attribute [local irreducible] '+' '.join(pn(i,b) for i in range(3) for b in range(5))+' '+' '.join(gn(b) for b in range(9))+'\n'
s+=f'theorem middle_two_directM8AE (C J E : ℤ) (hC : 0≤C) (hJ : 0≤J) (hE : 0≤E) : {shape(0)}*{shape(2)} ≤ {shape(1)}^2 := by\n'
for i in range(3):
 s+=f' have hv{i} : {shape(i)}={value(i)} := by\n  have h := middle_value0_{i}M722 C 0 J E\n  simpa only ['+','.join(f'midCol0_{i}_{b}M722' for b in range(5))+',pow_zero,pow_succ,zero_mul,mul_zero,add_zero,mul_one] using h\n'
s+=' apply sub_nonneg.mp\n rw [hv0,hv1,hv2]\n'
s+=f' have he : {value(1)}^2-{value(0)}*{value(2)}={gap} := by\n  rw ['+','.join('←'+eq(b) for b in range(9))+']\n  ring\n rw [he]\n'
for b in range(9):s+=f' have hp{b} := {nn(b)} J E hJ hE\n'
s+=' positivity\nend\nend MathGKM.Markov\n';save('MarkovMiddleTwoDirectM8AE',s)
s=(D/'MarkovMiddleOneM5DC.lean').read_text()
s=s.replace('import MarkovMiddleLowDirectM722','import MarkovMiddleTwoDirectM8AE')
s=s.replace('middleRawValue_one_lcM5DC','middleRawValue_two_lcM8AE').replace('source_fourth_middle_oneM5DC','source_fourth_middle_twoM8AE')
s=s.replace('middleRawValueM722 n c 1','middleRawValueM722 n c 2').replace('middle_low_directM722','middle_two_directM8AE')
s=s.replace('2*(1:ℤ)<c','2*(2:ℤ)<c').replace('(hr : (frame rest).mid.a=1)','(hr : (frame rest).mid.a=2)')
save('MarkovMiddleTwoSourceM8AE',s)
s=(D/'MarkovFourthTopM8AE.lean').read_text().replace('MarkovMiddleTopM8AE','MarkovMiddleTwoSourceM8AE').replace('run_fourth_topM8AE','run_fourth_twoM8AE').replace('source_fourth_middle_topM8AE','source_fourth_middle_twoM8AE').replace('(frame rest).mid.a+1=(frame rest).mid.b','(frame rest).mid.a=2')
save('MarkovFourthTwoM8AE',s)
print('Created numerator-two direct, source and full-slice candidates.')
