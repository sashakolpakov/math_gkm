"""Machine-authored two-cycle coefficient charts and polynomial certificates."""
from generate_small_cfcbaf30 import *
from functools import reduce
from math import gcd
p=numerator(2,1);terms=grouped(p)
tn=lambda b,k:f'smallTerm21_{b}_{k}MCFC'
q0=raw_formula(p,[0],X);qm=raw_formula(p,[0,1],X)
def val_at(j,active,fixed):
 q=raw_formula(p,active,j)
 for (a,b,k),v in p.items():
  if b in fixed:
   t=fixed[b]-k
   if t>=0:q+=v*N**a*5040*comb(7+t,7)
 return q
low=[val_at(coerce(t),[],{0:t}) for t in range(7)]
onset=[val_at(N+t,[0],{1:t}) for t in range(7)]
tail=[val_at(2*N+t,[0,1],{2:t}) for t in range(1,6)]
q0=P({k:v/16 for k,v in q0.items()});qm=P({k:v/16 for k,v in qm.items()})
low=[P({k:v/16 for k,v in q.items()}) for q in low]
onset=[P({k:v/16 for k,v in q.items()}) for q in onset]
tail=[P({k:v/16 for k,v in q.items()}) for q in tail]
def formula(name,q,jstr,hyps,mode,arg=0):
 s=f'\ndef {name} (N x : ℤ) : ℤ := {horner(q)}\n'
 s+=f'\ntheorem {name}_value (n j : ℕ) {hyps} :\n 5040*smallValue21MCFC n ({jstr})=16*{name} n j := by\n'
 hs=[]; zeros=[]
 for b,k in sorted(terms):
  h=f'h{b}_{k}';label=f'chooseShiftSevenK0B ({jstr}) ({b}*n+{k})'
  active=(b==0 if mode=='initial' else b<=1 if mode=='middle' else b==0 if mode=='onset' else b<=1 if mode=='tail' else False)
  fixed=(b==1 if mode=='onset' else b==2 if mode=='tail' else b==0 if mode=='low' else False)
  if active:
   s+=f' have {h} := chooseShiftSeven_fallingK0B ({jstr}) ({b}*n+{k}) (by omega)\n'
   s+=f' push_cast at {h}\n'
   hs.append((h,b,k))
  elif fixed:
   t=arg-k;v=comb(7+t,7) if t>=0 else 0
   if t>=0:
    s+=f' have {h} : {label}={v} := by\n  unfold chooseShiftSevenK0B\n  rw [if_pos (by omega),show ({jstr})-({b}*n+{k})={t} by omega]\n  norm_num [Nat.choose]\n'
   else:
    s+=f' have {h} : {label}=0 := by\n  exact if_neg (by omega)\n'
   zeros.append(h)
  else:
   s+=f' have {h} : {label}=0 := by\n  exact if_neg (by omega)\n';zeros.append(h)
 s+=' unfold smallValue21MCFC\n'
 if zeros:s+=' rw ['+','.join(zeros)+']\n'
 s+=' have he : '+(' + '.join(f'{tn(b,k)} (n:ℤ)*fallingSevenK0B ((({jstr}):ℕ):ℤ)+0' for h,b,k in []) or 'True')+' := by trivial\n' if False else ''
 # First eliminate every remaining binomial through linear combination; the residual is a ring identity.
 s+=' linear_combination (norm := skip) '+(' + '.join(f'({tn(b,k)} (n:ℤ))*{h}' for h,b,k in hs) if hs else '(0 : ℤ)')+'\n'
 s+=' all_goals simp only ['+','.join([name,'fallingSevenK0B']+[tn(b,k) for b,k in sorted(terms)])+']\n all_goals push_cast\n all_goals ring\n'
 return s
def generate_values():
 m='MarkovTwoValuesMCFC';s='import MarkovSmallNumerator21MCFC\n'+head
 s+=formula('twoInitialMCFC',q0,'j','(hj : 5≤j) (hju : j<n+2)','initial')
 s+=formula('twoMiddleMCFC',qm,'j','(hj : n+5≤j) (hju : j<2*n+3)','middle')
 for mode,qs,js,off in [('low',low,lambda t:str(t),0),('onset',onset,lambda t:f'n+{t}',0),('tail',tail,lambda t:f'2*n+{t}',1)]:
  for t,q in enumerate(qs,off):
   s+=formula(f'two{mode.title()}{t}MCFC',q,js(t),'(hn : 7≤n)',mode,t)
 (R/f'research/{m}.lean').write_text(s+end);return m
def generate_gaps():
 out=[];m='MarkovTwoGapsMCFC';s='import MarkovTwoValuesMCFC\n'+head
 def gap(name,qs,forms,vars,hyps):
  nonlocal s
  g=qs[1]**2-qs[0]*qs[2];assert all(v>=0 for v in g.values()),(name,serial(P({k:v for k,v in g.items() if v<0})))
  s+=f'\ndef {name}Cert (N Z x : ℤ) : ℤ := {horner(g)}\n'
  s+=f'\ntheorem {name} {vars} {hyps} :\n ({forms[0]})*({forms[2]})≤({forms[1]})^2 := by\n apply sub_nonneg.mp\n have he : ({forms[1]})^2-({forms[0]})*({forms[2]})={name}Cert N Z x := by\n  unfold {name}Cert '+ ' '.join(sorted(set(re.findall(r'two\w+MCFC',' '.join(forms)))))+'\n  ring\n rw [he]\n unfold '+name+'Cert\n positivity\n'
  out.append(dict(name=name,terms=serial(g)))
 # N and Z are nonnegative distances to the ends of the coefficient interval.
 gap('twoInitial_lcMCFC',[subst(q0,X+Z+6,0,X+5+k) for k in range(3)], [f'twoInitialMCFC (x+Z+6) (x+{5+k})' for k in range(3)],'(N Z x : ℤ)','(hZ : 0≤Z) (hx : 0≤x)')
 gap('twoMiddle_lcMCFC',[subst(qm,X+Z+5,0,2*X+Z+10+k) for k in range(3)], [f'twoMiddleMCFC (x+Z+5) (2*x+Z+{10+k})' for k in range(3)],'(N Z x : ℤ)','(hZ : 0≤Z) (hx : 0≤x)')
 for mode,qs,off in [('Low',low,0),('Onset',onset,0),('Tail',tail,1)]:
  for i in range(len(qs)-2):
   gap(f'two{mode}Gap{i+off}MCFC',[subst(q,N+7,0,0) for q in qs[i:i+3]], [f'two{mode}{i+off+k}MCFC (N+7) 0' for k in range(3)],'(N Z x : ℤ)','(hN : 0≤N)')
 (R/f'research/{m}.lean').write_text(s+end)
 (O/'two-gap-candidates.json').write_text(json.dumps(dict(status='Candidates only; nonnegative symbolic expansions are not Lean proof',gaps=out),indent=2)+'\n');return m
if __name__=='__main__':print(generate_values(),generate_gaps())
