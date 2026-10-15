"""Machine-authored revision: assemble two-variable convolution one variable at a time."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm');D=R/'research'
def balance(ss):
 if not ss:return '0'
 if len(ss)==1:return ss[0]
 m=len(ss)//2;return '('+balance(ss[:m])+' + '+balance(ss[m:])+')'
for pfx in ['Low','High']:
 for k in range(1,6):
  p=D/f'MarkovOnset{pfx}Gap{k}M253.lean';s=p.read_text();s=s[:s.index(f'\ntheorem onset{pfx}_lc{k}M253')]
  cv=lambda i,a,b:f'onset{pfx}C{i}_{a}_{b}M253'
  cg=lambda a,b:f'onset{pfx}GC{k}_{a}_{b}M253'
  col=lambda i,a:f'onset{pfx}Col{k}_{i}_{a}M253'
  gc=lambda a:f'onset{pfx}GCol{k}_{a}M253'
  vd=lambda i:balance([f'{col(i,a)} N R*C^{a}' for a in range(5)])
  gd=balance([f'{gc(a)} N R*C^{a}' for a in range(9)])
  for i in [k,k+1,k+2]:
   for a in range(5):s+=f'\ndef {col(i,a)} (N R : ℤ) : ℤ := '+balance([f'{cv(i,a,b)} N*R^{b}' for b in range(5-a)])+'\n'
   s+=f'\ntheorem onset{pfx}_cols{k}_{i}M253 (N C R : ℤ) : onset{pfx}V{i}M253 N C R={vd(i)} := by\n rw [onset{pfx}_decomp{i}M253]\n unfold '+' '.join(col(i,a) for a in range(5))+'\n ring\n'
  for a in range(9):
   s+=f'\ndef {gc(a)} (N R : ℤ) : ℤ := '+balance([f'{cg(a,b)} N*R^{b}' for b in range(9-a)])+'\n'
   ts=[];cs=set()
   for x in range(5):
    y=a-x
    if not 0<=y<=4:continue
    ts.append(f'({col(k+1,x)} N R*{col(k+1,y)} N R-{col(k,x)} N R*{col(k+2,y)} N R)')
    cs.update([col(k+1,x),col(k+1,y),col(k,x),col(k+2,y)])
   s+=f'\ntheorem {gc(a)}_eq (N R : ℤ) : {balance(ts)}={gc(a)} N R := by\n unfold {gc(a)} '+' '.join(sorted(cs))+'\n rw ['+','.join(f'←{cg(a,b)}_eq' for b in range(9-a))+']\n ring\n'
   s+=f'\ntheorem {gc(a)}_nonneg (N R : ℤ) (hN : 0≤N) (hR : 0≤R) : 0≤{gc(a)} N R := by\n unfold {gc(a)}\n'
   for b in range(9-a):s+=f' have h{b} := {cg(a,b)}_nonneg N hN\n'
   s+=' positivity\n'
  s+='\nattribute [local irreducible] '+' '.join(col(i,a) for i in [k,k+1,k+2] for a in range(5))+'\n'
  s+=f'\ntheorem onset{pfx}_lc{k}M253 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :\n onset{pfx}V{k}M253 N C R*onset{pfx}V{k+2}M253 N C R ≤ (onset{pfx}V{k+1}M253 N C R)^2 := by\n apply sub_nonneg.mp\n rw ['+','.join(f'onset{pfx}_cols{k}_{i}M253' for i in [k,k+1,k+2])+']\n'
  s+=f' have he : {vd(k+1)}^2-{vd(k)}*{vd(k+2)}={gd} := by\n  rw ['+','.join(f'←{gc(a)}_eq' for a in range(9))+']\n  ring\n rw [he]\n'
  for a in range(9):s+=f' have h{a} := {gc(a)}_nonneg N R hN hR\n'
  s+=' positivity\nend\nend MathGKM.Markov\n';p.write_text(s)
print('Layered all ten unaccepted general gap candidates.')
