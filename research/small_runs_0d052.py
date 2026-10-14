"""Machine-authored n=2,3,4 symbolic families, unlimited source parameters."""
from pathlib import Path
import json,math
src=Path('research/sparse_kernel_e273.py').read_text()
exec(src[src.index('class P(dict):'):src.index('N,c,r,q,x,z=')].replace('(0,)*6','(0,)*3'))
N=P({(1,0,0):1});C=P({(0,1,0):1});R=P({(0,0,1):1})
raw=json.loads(Path('evidence/markov-e27336bc/sparse-kernel.json').read_text())['groups']
groups=[(tuple(map(int,k.strip('()').split(','))),compile(v.replace('^','**'),'<own polynomial>','eval')) for k,v in raw.items()]
def val(n,j):
 out=P()
 for (s,k),f in groups:
  d=j-s*(n+1)-k
  if d>=0:out+=eval(f,{'__builtins__':{}},dict(N=n,c=C,r=R,q=P()))*math.comb(d+3,3)
 return out
def sub(p,c,r):
 out=P()
 for (i,j,k),v in p.items():
  assert i==0
  out+=v*c**j*r**k
 return out
def nm(n,j):return f'small{n}_{j}D052'
text='import MarkovSecondTailD052\n/-! Machine-authored 0d052acb. Small run lengths, universal coefficient parameters. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 8000000\n'
records=[]
for n in [2,3,4]:
 for j in range(2*n+3):
  a=nm(n,j);poly=fmt(val(n,j),['unused','c','r'])
  text+=f'\ndef {a} (c r : ℤ) : ℤ := {poly}\n'
  text+=f'theorem {a}_eq (c r : ℕ) : secondExplicitE273 {n} c r {j}={a} c r := by\n norm_num [secondExplicitE273,chooseShiftE273,Nat.choose,{a},'+','.join(f'sparse{s}{k}E273' for (s,k),_ in groups)+']\n ring\n'
 for j in range(2*n+1):
  aa,bb,cc=[nm(n,j+k) for k in range(3)]
  ps=[val(n,j+k) for k in range(3)]
  gap=sub(ps[1]*ps[1]-ps[0]*ps[2],C+R+2,C+1)
  assert all(v>=0 for v in gap.values()),(n,j)
  g=fmt(gap,['unused','(r-1)','(c-r-1)'])
  text+=f'\ntheorem {aa}_lc (c r : ℤ) (hr : 1≤r) (hc : r+1≤c) :\n {aa} c r*{cc} c r≤{bb} c r^2 := by\n have he : {bb} c r^2-{aa} c r*{cc} c r={g} := by\n  dsimp [{aa},{bb},{cc}]\n  ring\n have hu : 0≤r-1 := by omega\n have hv : 0≤c-r-1 := by omega\n have hp : (0:ℤ)≤{g} := by positivity\n omega\n'
  records.append(dict(n=n,j=j,terms=len(gap)))
 text+=f'\ntheorem small{n}_lcD052 (c r j : ℕ) (hr : 0<r) (hc : r<c) (hj : j≤{2*n}) :\n secondExplicitE273 {n} c r j*secondExplicitE273 {n} c r (j+2)≤secondExplicitE273 {n} c r (j+1)^2 := by\n interval_cases j\n'
 for j in range(2*n+1):
  aa,bb,cc=[nm(n,j+k) for k in range(3)]
  text+=f' · norm_num only [show {j}+2={j+2} by omega,show {j}+1={j+1} by omega,{aa}_eq,{bb}_eq,{cc}_eq]\n   exact {aa}_lc c r (by exact_mod_cast hr) (by exact_mod_cast hc)\n'
text+='\n#print axioms small2_lcD052\n#print axioms small3_lcD052\n#print axioms small4_lcD052\nend\nend MathGKM.Markov\n'
Path('research/MarkovSmallRunsD052.lean').write_text(text.replace(chr(8804), chr(32)+chr(8804)+chr(32)))
Path('evidence/markov-0d052acb/small-run-certificates.json').write_text(json.dumps(records,indent=2)+'\n')
print(dict(certificates=len(records)))
