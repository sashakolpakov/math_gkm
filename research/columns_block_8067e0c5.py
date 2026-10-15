"""Machine-authored column assembly; no inherited sources overwritten."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8067e0c5'
head='/-! Machine-authored 8067e0c5. Exact column assembly. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 16000000\nset_option maxRecDepth 16384\n'
end='end\nend MathGKM.Markov\n'
def bal(xs):
 if not xs:return '0'
 if len(xs)==1:return xs[0]
 k=len(xs)//2
 return '('+bal(xs[:k])+' + '+bal(xs[k:])+')'
def save(m,s):
 p=R/'research'/f'{m}.lean';assert not p.exists();p.write_text(s)
pn=lambda i,a,b:f'blockLP{i}{a}{b}M042'
gn=lambda a,b:f'blockLG{a}{b}M042'
cn=lambda i,b:f'blockColumn{i}{b}M806'
cg=lambda b:f'blockColumnGap{b}M806'
full=lambda i:f'(fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+{10+i})+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+{5+i}))'
st=''.join(f'import MarkovBlockValue{i}M806\n' for i in range(3))+head
for i in range(3):
 for b in range(5):st+=f'\ndef {cn(i,b)} (J E R : ℤ) : ℤ := '+bal([f'{pn(i,a,b)} J E*R^{a}' for a in range(5-b)])+'\n'
 st+=f'\ntheorem block_columns{i}M806 (C R J E : ℤ) :\n {full(i)}='+bal([f'{cn(i,b)} J E R*C^{b}' for b in range(5)])+f' := by\n rw [block_value{i}M806]\n unfold '+' '.join(cn(i,b) for b in range(5))+'\n ring\n'
save('MarkovBlockColumnsM806',st+end)
mods=[]
for b in range(9):
 m=f'MarkovBlockColumn{b}M806';mods.append(m)
 imports=[f'MarkovSplitLG{a}{b}M042' if a<4 else f'MarkovBlockLGap{a}M042' for a in range(9-b)]
 st='import MarkovBlockColumnsM806\n'+''.join(f'import {x}\n' for x in imports)+head
 pairs=[(i,j) for i in range(5) for j in range(5) if i+j==b]
 st+=f'\ndef {cg(b)} (J E R : ℤ) : ℤ := '+bal([f'({cn(1,i)} J E R*{cn(1,j)} J E R-{cn(0,i)} J E R*{cn(2,j)} J E R)' for i,j in pairs])+'\n'
 st+=f'\ntheorem {cg(b)}_nonneg (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) :\n 0≤{cg(b)} J E R := by\n have he : {cg(b)} J E R='+bal([f'{gn(a,b)} J E*R^{a}' for a in range(9-b)])+' := by\n  unfold '+cg(b)+' '+' '.join(sorted({cn(t,i) for t in range(3) for i,j in pairs}|{cn(t,j) for t in range(3) for i,j in pairs}))+' '+' '.join(gn(a,b) for a in range(9-b))+'\n  ring\n rw [he]\n'
 for a in range(9-b):st+=f' have hp{a} := {gn(a,b)}_nonneg J E hJ hE\n'
 st+=' positivity\n';save(m,st+end)
st=''.join(f'import {m}\n' for m in mods)+head
dec=lambda i:bal([f'{cn(i,b)} J E R*C^{b}' for b in range(5)])
st+=f'\ntheorem blockLChartM806 (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) :\n 0≤{full(1)}^2-{full(0)}*{full(2)} := by\n rw [block_columns0M806,block_columns1M806,block_columns2M806]\n have he : {dec(1)}^2-{dec(0)}*{dec(2)}='+bal([f'{cg(b)} J E R*C^{b}' for b in range(9)])+' := by\n  unfold '+' '.join(cg(b) for b in range(9))+'\n  ring\n rw [he]\n'
for b in range(9):st+=f' have hp{b} := {cg(b)}_nonneg J E R hJ hE hR\n'
st+=' positivity\n';save('MarkovBlockChartM806',st+end)
# The unchanged, formerly blocked source adapters are copied under fresh names.
for old,new in [('MarkovBlockLCM042','MarkovBlockLCM806'),('MarkovBlockSourceM042','MarkovBlockSourceM806')]:
 s=(R/'research'/f'{old}.lean').read_text().replace('import MarkovBlockLChartM042','import MarkovBlockChartM806').replace('blockLChartM042','blockLChartM806').replace('MarkovBlockLCM042','MarkovBlockLCM806').replace('blockValueM042','blockValueM806').replace('blockValue_logConcaveM042','blockValue_logConcaveM806').replace('source_fourth_blockM042','source_fourth_blockM806').replace('Machine-authored 04290504','Machine-authored 8067e0c5; adapted from 04290504')
 save(new,s)
(O/'column-inventory.json').write_text(json.dumps(dict(columns=mods,chart='MarkovBlockChartM806',adapters=['MarkovBlockLCM806','MarkovBlockSourceM806']),indent=2)+'\n')
print('Generated column assembly and fresh source adapters')
