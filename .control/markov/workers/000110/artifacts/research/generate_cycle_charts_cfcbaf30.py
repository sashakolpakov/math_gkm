"""Machine-authored uniform chart proof generator. Every emitted identity is checked by Lean."""
from generate_small_cfcbaf30 import *
data=json.loads((O/'all-small-chart-candidates.json').read_text())['families']
def de(rows):return P({tuple(k):F(v)/16 for k,v in rows})
def value_proof(c,r,terms,name,q,b,jstr,hyps,fixed=None):
 tn=lambda bb,k:f'smallTerm{c}{r}_{bb}_{k}MCFC'
 s=f'\ndef {name} (N x : ℤ) : ℤ := {horner(q)}\n'
 s+=f'\ntheorem {name}_value (n j : ℕ) (hn : 7≤n) {hyps} :\n 5040*smallValue{c}{r}MCFC n ({jstr})=16*{name} n j := by\n'
 hs=[];zs=[]
 for bb,k in sorted(terms):
  h=f'h{bb}_{k}';label=f'chooseShiftSevenK0B ({jstr}) ({bb}*n+{k})'
  if bb<b or (bb==b and fixed is None):
   s+=f' have {h} := chooseShiftSeven_fallingK0B ({jstr}) ({bb}*n+{k}) (by omega)\n push_cast at {h}\n';hs.append((h,bb,k))
  elif bb==b:
   t=fixed-k;v=comb(7+t,7) if t>=0 else 0
   s+=f' have {h} : {label}={v} := by\n'
   if t>=0:s+=f'  unfold chooseShiftSevenK0B\n  rw [if_pos (by omega),show ({jstr})-({bb}*n+{k})={t} by omega]\n  norm_num [Nat.choose]\n'
   else:s+='  exact if_neg (by omega)\n'
   zs.append(h)
  else:
   s+=f' have {h} : {label}=0 := by\n  exact if_neg (by omega)\n';zs.append(h)
 s+=f' unfold smallValue{c}{r}MCFC\n'
 if zs:s+=' rw ['+','.join(zs)+']\n'
 if hs:s+=' linear_combination (norm := skip) '+ ' + '.join(f'({tn(bb,k)} (n:ℤ))*{h}' for h,bb,k in hs)+'\n'
 s+=' simp only ['+','.join([name,'fallingSevenK0B']+[tn(bb,k) for bb,k in sorted(terms)])+']\n push_cast\n ring\n'
 return s
def generate(row):
 c,r=row['c'],row['r'];tag=f'{c}{r}MCFC';terms=grouped(numerator(c,r));mods=[]
 shape=lambda b:f'cycleShape{c}{r}_{b}MCFC'
 point=lambda b,t:f'cyclePoint{c}{r}_{b}_{t}MCFC'
 for z in row['intervals']:
  b,L,U=z['b'],z['L'],z['U'];m=f'MarkovCycleInterval{c}{r}_{b}MCFC'
  s=f'import MarkovSmallNumerator{tag}\n'+head
  s+=value_proof(c,r,terms,shape(b),de(z['formula']),b,'j',f'(hl : {b}*n+{L}≤j) (hu : j<({b+1})*n+{U+3})')
  q=de(z['formula']);shift=L-U;nv=f'(x+Z+{shift})';js=[f'({b}*{nv}+{L+k}+x)' for k in range(3)]
  fs=[f'{shape(b)} {nv} {j}' for j in js]
  g=P({tuple(k):F(v)/256 for k,v in z['gap']})
  gn=f'cycleIntervalGap{c}{r}_{b}MCFC'
  s+=gap(gn,g,fs,[shape(b)],'(N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x)')
  (R/f'research/{m}.lean').write_text(s+end);mods.append(m)
 for z in row['windows']:
  b,lo,hi=z['b'],z['start'],z['end'];m=f'MarkovCycleWindow{c}{r}_{b}MCFC'
  s=f'import MarkovSmallNumerator{tag}\n'+head
  for t,q in enumerate(z['values'],lo):
   s+=value_proof(c,r,terms,point(b,t),de(q),b,f'{b}*n+{t}','',fixed=t)
  for gg in z['gaps']:
   t=gg['t'];fs=[f'{point(b,t+k)} (N+7) 0' for k in range(3)]
   g=P({tuple(k):F(v)/256 for k,v in gg['gap']})
   s+=gap(f'cycleWindowGap{c}{r}_{b}_{t}MCFC',g,fs,[point(b,t+k) for k in range(3)],'(N Z x : ℤ) (hN : 0≤N)')
  (R/f'research/{m}.lean').write_text(s+end);mods.append(m)
 (O/f'cycle-modules-{c}{r}.json').write_text(json.dumps(mods)+'\n')
 return mods
def gap(name,g,fs,defs,args):
 assert all(v>=0 for v in g.values())
 s=f'\ndef {name}Cert (N Z x : ℤ) : ℤ := {horner(g)}\n'
 s+=f'\ntheorem {name} {args} :\n ({fs[0]})*({fs[2]})≤({fs[1]})^2 := by\n apply sub_nonneg.mp\n have he : ({fs[1]})^2-({fs[0]})*({fs[2]})={name}Cert N Z x := by\n  unfold {name}Cert '+ ' '.join(defs)+'\n  ring\n rw [he]\n unfold '+name+'Cert\n positivity\n'
 return s
if __name__=='__main__':
 import sys
 for row in data:
  if len(sys.argv)==1 or (row['c'],row['r'])==(int(sys.argv[1]),int(sys.argv[2])):print(generate(row))
