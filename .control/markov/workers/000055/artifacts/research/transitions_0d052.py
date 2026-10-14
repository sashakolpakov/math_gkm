"""Machine-authored exact polynomial generation; Lean checks every identity."""
from pathlib import Path
import json
src=Path('research/sparse_kernel_e273.py').read_text()
exec(src[src.index('class P(dict):'):src.index('N,c,r,q,x,z=')].replace('(0,)*6','(0,)*3'))
N=P({(1,0,0):1});C=P({(0,1,0):1});R=P({(0,0,1):1})
raw=json.loads(Path('evidence/markov-e27336bc/sparse-kernel.json').read_text())['groups']
groups=[(tuple(map(int,k.strip('()').split(','))),compile(v.replace('^','**'),'<own sparse polynomial>','eval')) for k,v in raw.items()]
def val(s,t):
 out=P()
 for (a,b),f in groups:
  d=(s-a)*N+t-a-b
  if s-a>=0 and 5*(s-a)+t-a-b>=-3:
   out+=eval(f,{'__builtins__':{}},dict(N=N,c=C,r=R,q=P()))*(d+1)*(d+2)*(d+3)
 return out
def sub(p,n,c,r):
 out=P()
 for (i,j,k),v in p.items():out+=v*n**i*c**j*r**k
 return out
def nat(s,t):return (str(t) if s==0 else f'(n+{t})' if t>=0 else f'(n-{abs(t)})')
def name(s,t):return f'trans{s}{"m" if t<0 else "p"}{abs(t)}D052'
positions=[(0,t) for t in range(5)]+[(1,t) for t in range(-1,5)]
head='import MarkovSecondInteriorE273\n/-! Machine-authored 0d052acb. Exact second-slice transition formulas. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 8000000\nset_option linter.unusedSimpArgs false\n'
text=head
for s,t in positions:
 nm=name(s,t); j=nat(s,t); poly=fmt(val(s,t),['n','c','r'])
 text+=f'\ndef {nm} (n c r : ℤ) : ℤ := {poly}\n'
 text+=f'\ntheorem {nm}_eq (n c r : ℕ) (hn : 5≤n) :\n 6*secondExplicitE273 n c r {j}={nm} n c r := by\n'
 active=[];inactive=[]
 for (a,b),_ in groups:
  k=f'({a}*(n+1)+{b})';bn=f'h{a}{b}'
  if s-a>=0 and 5*(s-a)+t-a-b>=-3:
   active.append((a,b,k,bn))
   text+=f' have {bn} := chooseShift_polynomialE273 {j} {k} (by omega)\n'
  else:inactive.append(f'chooseShift_zeroE273 {j} {k} (by omega)')
 text+=' unfold secondExplicitE273\n'
 text+=f' rw [if_neg (show ¬(c=2 ∧ {j}=2*n+3) by omega)'
 if inactive:text+=','+','.join(inactive)
 text+=']\n simp only [mul_zero,add_zero]\n'
 # Linear-combination reduces to an exact polynomial identity after rewriting casts.
 text+=' dsimp ['+nm+','+','.join(f'sparse{a}{b}E273' for (a,b),_ in groups)+'] at *\n'
 if s==1 and t<0:text+=' push_cast [Nat.cast_sub (show 1≤n by omega)] at *\n'
 else:text+=' push_cast at *\n'
 text+=' linear_combination '+ ' + '.join(f'({fmt(eval(f,{"__builtins__":{}},dict(N=N,c=C,r=R,q=P())),["(n:ℤ)","(c:ℤ)","(r:ℤ)"])})*{bn}' for a,b,k,bn in active for aa,f in groups if aa==(a,b))+'\n'
text+='\n#print axioms '+name(1,4)+'_eq\nend\nend MathGKM.Markov\n'
Path('research/MarkovTransitionFormulasD052.lean').write_text(text)
text='import MarkovTransitionFormulasD052\n/-! Machine-authored 0d052acb. Exact nonnegative gap certificates. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 8000000\n'
records=[]
for s,t in [(0,0),(0,1),(0,2),(1,-1),(1,0),(1,1),(1,2)]:
 ns=[name(s,t+k) for k in range(3)]; ps=[val(s,t+k) for k in range(3)]
 gap=sub(ps[1]*ps[1]-ps[0]*ps[2],N+5,C+R+2,C+1)
 assert all(v>=0 for v in gap.values())
 g=fmt(gap,['(n-5)','(r-1)','(c-r-1)'])
 text+=f'\ntheorem {ns[0]}_lc (n c r : ℤ) (hn : 5≤n) (hr : 1≤r) (hc : r+1≤c) :\n {ns[0]} n c r*{ns[2]} n c r≤{ns[1]} n c r^2 := by\n'
 text+=f' have he : {ns[1]} n c r^2-{ns[0]} n c r*{ns[2]} n c r={g} := by\n  dsimp [{",".join(ns)}]\n  ring\n'
 text+=f' have h0 : 0≤n-5 := by omega\n have h1 : 0≤r-1 := by omega\n have h2 : 0≤c-r-1 := by omega\n have hg : (0:ℤ)≤{g} := by positivity\n omega\n'
 records.append(dict(start=nat(s,t),coefficients=[fmt(p,['n','c','r']) for p in ps],positive_gap_terms=len(gap)))
text+='\n#print axioms trans1p2D052_lc\nend\nend MathGKM.Markov\n'
Path('research/MarkovTransitionGapsD052.lean').write_text(text)
Path('evidence/markov-0d052acb/transitions.json').write_text(json.dumps(records,indent=2)+'\n')
print(dict(formulas=len(positions),gaps=len(records)))
