"""Machine-authored universal tail certificate generation, checked by Lean."""
from pathlib import Path
import json
src=Path('research/sparse_kernel_e273.py').read_text()
exec(src[src.index('class P(dict):'):src.index('N,c,r,q,x,z=')].replace('(0,)*6','(0,)*3'))
N=P({(1,0,0):1});C=P({(0,1,0):1});R=P({(0,0,1):1})
raw=json.loads(Path('evidence/markov-e27336bc/sparse-kernel.json').read_text())['groups']
groups=[(tuple(map(int,k.strip('()').split(','))),v) for k,v in raw.items()]
text='import MarkovShapeBridgeE273\nimport MarkovQuinticE273\n/-! Machine-authored 0d052acb. Exact final coefficients and infinite zero tail. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 8000000\n'
text+='\ndef tailFirstD052 (c r : ℤ) : ℤ := 32*r*(c+r)-48*r+8*c\n'
for t,rhs in [(1,'6*tailFirstD052 c r'),(2,'6*(16*(r:ℤ)^2)'),(3,'6*cubicD446 c r'),(4,'0')]:
 nm=f'tail{t}D052';j=f'(2*n+{t})' if t<4 else 'j'
 text+=f'\ntheorem {nm} (n c r'+(' j' if t==4 else '')+f' : ℕ) (hn : 2≤n)'+(' (hj : 2*n+4≤j)' if t==4 else '')+f' :\n 6*secondExplicitE273 n c r {j}={rhs} := by\n'
 active=[];inactive=[]
 for (a,b),v in groups:
  k=f'({a}*(n+1)+{b})';bn=f'h{a}{b}'
  if t==4 or 2*(2-a)+t-a-b>=-3:
   active.append((a,b,v,bn));text+=f' have {bn} := chooseShift_polynomialE273 {j} {k} (by omega)\n'
  else:inactive.append(f'chooseShift_zeroE273 {j} {k} (by omega)')
 text+=' unfold secondExplicitE273\n'
 if t!=3:
  text+=f' rw [if_neg (show ¬(c=2 ∧ {j}=2*n+3) by omega)'+(' ,'+','.join(inactive) if inactive else '')+']\n'
 else:
  text+=' simp only [and_true]\n'
  if inactive:text+=' rw ['+','.join(inactive)+']\n'
 text+=' simp only [mul_zero,add_zero]\n'
 text+=' dsimp [tailFirstD052,cubicD446,'+','.join(f'sparse{a}{b}E273' for (a,b),_ in groups)+'] at *\n push_cast at *\n'
 # q must be kept as actual natural subtraction, not removed.
 exprs=[]
 for a,b,v,bn in active:
  for var,repl in [('N','(n:ℤ)'),('c','(c:ℤ)'),('r','(r:ℤ)'),('q','((2*r-c:ℕ):ℤ)')]:
   import re
   v=re.sub(r'\b'+var+r'\b',repl,v)
  exprs.append(f'({v})*{bn}')
 text+=' linear_combination '+' + '.join(exprs)+'\n'
text+='\ntheorem tail_gapD052 (c r : ℕ) (hr : 0<r) (hc : r<c) :\n tailFirstD052 c r*cubicD446 c r≤(16*(r:ℤ)^2)^2 := by\n by_cases h2 : c=2\n · have hr1 : r=1 := by omega\n   subst c; subst r\n   norm_num [tailFirstD052,cubicD446]\n · by_cases hq : 2*r≤c\n   · have hz : 2*r-c=0 := by omega\n     simp [cubicD446,h2,hz,sq_nonneg]\n   · have hq\' : c≤2*r := by omega\n     have hcast : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-c := by\n       rw [Nat.cast_sub hq\']; push_cast; ring\n     let u : ℤ := (c:ℤ)-r-1\n     let v : ℤ := 2*(r:ℤ)-c-1\n     have hcz : (r:ℤ)+1≤c := by exact_mod_cast hc\n     have hqz : (c:ℤ)+1≤2*(r:ℤ) := by exact_mod_cast (show c+1≤2*r by omega)\n     have hu : 0≤u := by dsimp [u]; omega\n     have hv : 0≤v := by dsimp [v]; omega\n'
u=C;v=R;r=u+v+2;c=2*u+v+3
gap=(16*r*r)**2-(32*r*(c+r)-48*r+8*c)*8*(2*r-c)
assert all(v>=0 for v in gap.values())
g=fmt(gap,['unused','u','v'])
text+=f'     have he : (16*(r:ℤ)^2)^2-tailFirstD052 c r*cubicD446 c r={g} := by\n       simp only [cubicD446,if_neg h2,hcast,add_zero]\n       dsimp [tailFirstD052,u,v]\n       ring\n     have hp : 0≤{g} := by positivity\n     omega\n'
text+='\n#print axioms tail4D052\n#print axioms tail_gapD052\nend\nend MathGKM.Markov\n'
Path('research/MarkovSecondTailD052.lean').write_text(text)
print(dict(tail_gap_terms=len(gap)))
