"""Machine-authored second decomposition: assemble the bivariate gap column by column."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-96dea62b'
head='namespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 16000000\nset_option maxRecDepth 16384\n'
end='end\nend MathGKM.Markov\n'
def bal(xs):
 if not xs:return '0'
 if len(xs)==1:return xs[0]
 k=len(xs)//2
 return '('+bal(xs[:k])+' + '+bal(xs[k:])+')'
def save(m,s):
 p=R/'research'/f'{m}.lean';assert not p.exists();p.write_text(s)
nm=lambda k,a,b:f'onsetP{k}_{a}_{b}M96';gn=lambda k,a,b:f'onsetG{k}_{a}_{b}M96';cn=lambda k,b:f'onsetColumn{k}_{b}M96';cg=lambda k,b:f'onsetColumnGap{k}_{b}M96'
st=''.join(f'import MarkovOnsetExpand{k}M96\n' for k in range(1,7))+head
for k in range(1,7):
 for b in range(5):st+=f'\ndef {cn(k,b)} (N R : ℤ) : ℤ := '+bal([f'{nm(k,a,b)} N*R^{a}' for a in range(5-b)])+'\n'
 st+=f'\ntheorem onset_columns{k}M96 (N C R : ℤ) :\n onsetValue{k}M96 (N+4) (R+C+5) (R+4)='+bal([f'{cn(k,b)} N R*C^{b}' for b in range(5)])+f' := by\n rw [onset_expand{k}M96]\n unfold '+' '.join(cn(k,b) for b in range(5))+'\n ring\n'
save('MarkovOnsetColumnsM96',st+end)
mods=[];charts=[]
for k in range(1,5):
 for group in range(3):
  m=f'MarkovOnsetColumn{k}{group}M96';mods.append(m)
  st='import MarkovOnsetColumnsM96\n'+''.join(f'import MarkovOnsetGap{k}{g}M96\n' for g in range(3))+head
  for b in range(3*group,min(9,3*group+3)):
   pairs=[(i,j) for i in range(5) for j in range(5) if i+j==b]
   st+=f'\ndef {cg(k,b)} (N R : ℤ) : ℤ := '+bal([f'({cn(k+1,i)} N R*{cn(k+1,j)} N R-{cn(k,i)} N R*{cn(k+2,j)} N R)' for i,j in pairs])+'\n'
   st+=f'\ntheorem {cg(k,b)}_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) :\n 0≤{cg(k,b)} N R := by\n have he : {cg(k,b)} N R='+bal([f'{gn(k,a,b)} N*R^{a}' for a in range(9-b)])+' := by\n  unfold '+cg(k,b)+' '+' '.join(sorted({cn(t,i) for t in range(k,k+3) for i,j in pairs}|{cn(t,j) for t in range(k,k+3) for i,j in pairs}))+' '+' '.join(gn(k,a,b) for a in range(9-b))+'\n  ring\n rw [he]\n'
   for a in range(9-b):st+=f' have hp{a} := {gn(k,a,b)}_nonneg N hN\n'
   st+=' positivity\n'
  save(m,st+end)
 m=f'MarkovOnsetLFinal{k}M96';charts.append(m)
 st=''.join(f'import MarkovOnsetColumn{k}{g}M96\n' for g in range(3))+head
 lhs=f'onsetValue{k+1}M96 (N+4) (R+C+5) (R+4)^2-onsetValue{k}M96 (N+4) (R+C+5) (R+4)*onsetValue{k+2}M96 (N+4) (R+C+5) (R+4)'
 dec=lambda t:bal([f'{cn(t,b)} N R*C^{b}' for b in range(5)])
 st+=f'\ntheorem onsetL{k}M96 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :\n 0≤{lhs} := by\n rw [onset_columns{k}M96,onset_columns{k+1}M96,onset_columns{k+2}M96]\n have he : {dec(k+1)}^2-{dec(k)}*{dec(k+2)}='+bal([f'{cg(k,b)} N R*C^{b}' for b in range(9)])+' := by\n  unfold '+' '.join(cg(k,b) for b in range(9))+'\n  ring\n rw [he]\n'
 for b in range(9):st+=f' have hp{b} := {cg(k,b)}_nonneg N R hN hR\n'
 st+=' positivity\n';save(m,st+end)
(O/'column-inventory.json').write_text(json.dumps(dict(defs='MarkovOnsetColumnsM96',columns=mods,charts=charts),indent=2)+'\n')
p=R/'research/MarkovOnsetM96.lean';s=p.read_text()
for k in range(1,5):s=s.replace(f'import MarkovOnsetLChecked{k}M96',f'import MarkovOnsetLFinal{k}M96')
p.write_text(s)
print('column assembly generated')
