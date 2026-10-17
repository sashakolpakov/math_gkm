"""Machine-authored small-factor correspondence certificate generator.
Each proposed scalar factor identity and the assembled identity is checked by Lean.
"""
from pathlib import Path
import ast,json,collections
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-ad504da6'
fs=ast.literal_eval((R/'evidence/markov-fee405c8/pair-factors-extrep.txt').read_text().replace('\\\n',''))
class P(dict):
 def __add__(a,b):
  if isinstance(b,int):b=P({(0,0,0,0):b})
  d=P(a)
  for m,c in b.items():d[m]=d.get(m,0)+c
  return P({m:c for m,c in d.items() if c})
 __radd__=__add__
 def __neg__(a):return P({m:-c for m,c in a.items()})
 def __sub__(a,b):return a+(-b if isinstance(b,P) else -b)
 def __mul__(a,b):
  if isinstance(b,int):b=P({(0,0,0,0):b})
  d=P()
  for m,c in a.items():
   for n,e in b.items():
    q=tuple(x+y for x,y in zip(m,n));d[q]=d.get(q,0)+c*e
  return P({m:c for m,c in d.items() if c})
 __rmul__=__mul__
def decode(a):
 d=P()
 for k in range(0,len(a),2):
  m=[0]*4
  for i in range(0,len(a[k]),2):m[a[k][i]-1]=a[k][i+1]
  d[tuple(m)]=a[k+1]
 return d
def render(p):
 out=[]
 for m,c in sorted(p.items()):
  terms=[str(c)]
  for n,e in zip(['x','g','z','T'],m):
   if e:terms.append(n if e==1 else n+'^'+str(e))
  out.append('*'.join(terms))
 return '('+'+'.join(out or ['0'])+')'
x,g,z,T=[P({tuple(int(i==k) for i in range(4)):1}) for k in range(4)]
t=T+1;m=x+g+2;n=x;j=m+z;pts=[m,n,m-1,n+1]
def W(v):return (t+v+4)*(t+v+5)+4*(j-v)*(t+j+4)
fun={
 'An':lambda v:[v,t+v+4,t+v+5,W(v)-2],
 'Bn':lambda v:[j-v,t+v+4,t+v+5,W(v)+2],
 'Ad':lambda v:[j-v+1,t+v+2,t+v+3,W(v)],
 'Bd':lambda v:[v+1,t+v+6,t+v+7,W(v)]}
factors=[]
def key(p):return tuple(sorted(p.items()))
def atom(p):
 k=key(p)
 if k not in factors:factors.append(k)
 return f'pf{factors.index(k)}MAD5 T x g z'
norms={(s,i):'*'.join(atom(p) for p in f(v)) for s,f in fun.items() for i,v in enumerate(pts)}
reduced=[[decode(p) for p in row] for row in fs]
terms=['*'.join(atom(p) for p in row) for row in reduced]
common=[x+g+T+7,x+T+6,x+g+T+9,x+T+4,x+g+T+5,x+T+8]
prefactor=common+[W(v) for v in pts]
prefexpr='*'.join(atom(p) for p in prefactor)
# Exact finite symbolic factor-multiset check, independently of Lean tactics.
pairpoints=[(0,1),(1,0),(2,3),(3,2)]
checks=[]
for idx,(i,k) in enumerate(pairpoints):
 raw=fun['An'](pts[i])+fun['Bn'](pts[k])
 for o,(a,b) in enumerate(pairpoints):
  if o!=idx:raw+=fun['Ad'](pts[a])+fun['Bd'](pts[b])
 checks.append(collections.Counter(map(key,raw))==collections.Counter(map(key,reduced[idx]+prefactor)))
assert all(checks)
src='import MarkovClearingBridgeMAD5\n/-! Machine-authored ad504da6. Exact compact factor bridge; no positivity claim for the difference. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 8000000\n'
for i,p in enumerate(factors):src+=f'def pf{i}MAD5 (T x g z : ℚ) : ℚ := '+render(dict(p))+'\n'
src+='def pairReducedMAD5 (T x g z : ℚ) : ℚ :=\n ('+terms[0]+')+('+terms[1]+')-('+terms[2]+')-('+terms[3]+')\n'
src+='def pairPrefactorMAD5 (T x g z : ℚ) : ℚ := '+prefexpr+'\n'
pointstr=['(x+g+2)','x','(x+g+2-1)','(x+1)']
for (s,i),expr in norms.items():
 src+=f'theorem norm{s}{i}MAD5 (T x g z : ℚ) : pair{s}MAD5 (x+g+2+z) (T+1) {pointstr[i]}={expr} := by\n unfold pair{s}MAD5 liftWeightMAE9 liftDenMAE9 '+' '.join(dict.fromkeys(p.split(' ')[0] for p in expr.split('*')))+'\n ring\n'
src+='theorem pair_reduced_identityMAD5 (T x g z : ℚ) :\n pairNumeratorMAD5 (x+g+2+z) (T+1) (x+g+2) x=pairPrefactorMAD5 T x g z*pairReducedMAD5 T x g z := by\n unfold pairNumeratorMAD5 pairProductNMAD5 pairProductDMAD5\n rw ['+','.join(f'norm{s}{i}MAD5' for s,i in norms)+']\n unfold pairPrefactorMAD5 pairReducedMAD5\n ring\n'
src+='theorem pair_prefactor_positiveMAD5 (T x g z : ℚ) (hT : 0 ≤ T) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :\n 0 < pairPrefactorMAD5 T x g z := by\n unfold pairPrefactorMAD5 '+' '.join(dict.fromkeys(p.split(' ')[0] for p in prefexpr.split('*')))+'\n positivity\n'
src+='def ReducedPairPositiveMAD5 : Prop := ∀ T x g z : ℕ, 0 ≤ pairReducedMAD5 T x g z\n'
src+='theorem reduced_pair_iff_polynomialMAD5 : ReducedPairPositiveMAD5 ↔ ParametricPairPositiveMAD5 := by\n constructor\n · intro H T x g z\n   rw [pair_reduced_identityMAD5]\n   exact mul_nonneg (pair_prefactor_positiveMAD5 T x g z (by positivity) (by positivity) (by positivity) (by positivity)).le (H T x g z)\n · intro H T x g z\n   have hh := H T x g z\n   rw [pair_reduced_identityMAD5] at hh\n   exact (mul_nonneg_iff_of_pos_left (pair_prefactor_positiveMAD5 T x g z (by positivity) (by positivity) (by positivity) (by positivity))).mp hh\n'
src+='theorem lower_horizontal_of_reducedMAD5 (H : ReducedPairPositiveMAD5) : LowerHorizontalMFEE :=\n lower_horizontal_of_polynomialMAD5 (reduced_pair_iff_polynomialMAD5.mp H)\nend\nend MathGKM.Markov\n'
(R/'research/MarkovFactorBridgeMAD5.lean').write_text(src)
(O/'factor-bridge-generation.json').write_text(json.dumps(dict(factor_multiset_checks=checks,distinct_factors=len(factors),source_bytes=len(src),status='Candidate identities; Lean compilation required'),indent=2)+'\n')
print(dict(factor_multiset_checks=checks,distinct_factors=len(factors),source_bytes=len(src)))
