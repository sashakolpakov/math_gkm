"""Machine-authored ad504da6. Generate ordinary Lean ring certificates in pieces.
Python polynomial arithmetic proposes identities only; no trusted evaluator.
"""
from pathlib import Path
import ast,json
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-ad504da6'
fs=ast.literal_eval((R/'evidence/markov-fee405c8/pair-factors-extrep.txt').read_text().replace('\\\n',''))
def decode(a):
 d={}
 for k in range(0,len(a),2):
  m=[0]*4
  for i in range(0,len(a[k]),2): m[a[k][i]-1]=a[k][i+1]
  d[tuple(m)]=a[k+1]
 return d
def add(a,b,c=1):
 d=dict(a)
 for m,v in b.items():d[m]=d.get(m,0)+c*v
 return {m:v for m,v in d.items() if v}
def mul(a,b):
 d={}
 for m,v in a.items():
  for n,w in b.items():
   q=tuple(x+y for x,y in zip(m,n)); d[q]=d.get(q,0)+v*w
 return {m:v for m,v in d.items() if v}
def product(a):
 d={(0,0,0,0):1}
 for b in a:d=mul(d,b)
 return d
def render(d):
 # Horner form keeps positivity proofs shallow.
 def go(d,vs):
  if not d:return '0'
  if not vs:return str(next(iter(d.values())))
  v=vs[0]; groups={}
  for m,c in d.items():groups.setdefault(m[v],{})[m]=c
  out='0'
  for k in range(max(groups),-1,-1):
   c=go(groups.get(k,{}),vs[1:])
   out=c if out=='0' else '('+c+'+'+['x','g','z','T'][v]+'*'+out+')'
  return out
 return go(d,[0,1,2,3])
def xcoeff(d,k):return {tuple([0]+list(m[1:])):v for m,v in d.items() if m[0]==k}
head='import MathGKM.Markov\n/-! Machine-authored ad504da6. Generated algebra; all identities checked by Lean ring. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 16000000\nset_option maxRecDepth 65536\nset_option linter.unusedVariables false\n'
groups=[]; stats=[]
for a,f in enumerate(fs):
 decoded=[decode(p) for p in f]
 row=[]
 for b,chunk in enumerate([decoded[:11],decoded[11:]]):
  d=product(chunk); deg=max(m[0] for m in d); row.append((d,deg))
  name=f'MarkovPairHalf{a}{b}MAD5'; src=head
  for k in range(deg+1):src+=f'def ph{a}{b}c{k}MAD5 (g z T : ℚ) : ℚ := '+render(xcoeff(d,k))+'\n'
  orig='*'.join('('+render(p)+')' for p in chunk)
  result='+'.join(f'ph{a}{b}c{k}MAD5 g z T*x^{k}' for k in range(deg+1))
  src+=f'theorem ph{a}{b}_expandMAD5 (x g z T : ℚ) :\n ({orig})=({result}) := by\n unfold '+ ' '.join(f'ph{a}{b}c{k}MAD5' for k in range(deg+1))+'\n ring\nend\nend MathGKM.Markov\n'
  (R/'research'/f'{name}.lean').write_text(src)
  stats.append(dict(module=name,terms=len(d),degree=deg,bytes=len(src)))
 groups.append(row)
expanded={}
for a,row in enumerate(groups):expanded=add(expanded,mul(row[0][0],row[1][0]),1 if a<2 else -1)
assert all(v>0 for v in expanded.values())
assert len(expanded)==20813
N=max(m[0] for m in expanded)
for k in range(N+1):
 name=f'MarkovPairCoeff{k}MAD5'
 src='\n'.join(f'import MarkovPairHalf{a}{b}MAD5' for a in range(4) for b in range(2))+head.split('\n',1)[1]
 terms=[]; defs=[]
 for a,row in enumerate(groups):
  summands=[]
  for i in range(row[0][1]+1):
   l=k-i
   if 0<=l<=row[1][1]:
    summands.append(f'ph{a}0c{i}MAD5 g z T*ph{a}1c{l}MAD5 g z T')
    defs.extend([f'ph{a}0c{i}MAD5',f'ph{a}1c{l}MAD5'])
  terms.append('('+'+'.join(summands or ['0'])+')')
 expr=terms[0]+'+'+terms[1]+'-'+terms[2]+'-'+terms[3]
 cert=render(xcoeff(expanded,k))
 src+=f'def pc{k}MAD5 (g z T : ℚ) : ℚ := '+expr+'\n'
 src+=f'theorem pc{k}_nonnegMAD5 (g z T : ℚ) (hg : 0 ≤ g) (hz : 0 ≤ z) (hT : 0 ≤ T) :\n 0 ≤ pc{k}MAD5 g z T := by\n have he : pc{k}MAD5 g z T = {cert} := by\n  unfold pc{k}MAD5 '+' '.join(dict.fromkeys(defs))+'\n  ring\n rw [he]\n positivity\nend\nend MathGKM.Markov\n'
 (R/'research'/f'{name}.lean').write_text(src)
 stats.append(dict(module=name,terms=len(xcoeff(expanded,k)),bytes=len(src)))
(O/'pair-generation.json').write_text(json.dumps(stats,indent=2)+'\n')
print(json.dumps(stats))

# Assemble using half-polynomial coefficients as opaque atoms in the ring proof.
src='\n'.join(f'import MarkovPairCoeff{k}MAD5' for k in range(N+1))+head.split('\n',1)[1]
terms=[]
for f in fs:
 decoded=[decode(p) for p in f]
 terms.append('('+'*'.join('('+render(p)+')' for p in decoded[:11])+')*('+'*'.join('('+render(p)+')' for p in decoded[11:])+')')
src+='def pairClearedMAD5 (T x g z : ℚ) : ℚ :=\n ('+terms[0]+')+('+terms[1]+')-('+terms[2]+')-('+terms[3]+')\n'
src+='theorem pair_cleared_expansionMAD5 (T x g z : ℚ) : pairClearedMAD5 T x g z =\n '+ '+'.join(f'pc{k}MAD5 g z T*x^{k}' for k in range(N+1))+' := by\n unfold pairClearedMAD5\n rw ['+','.join(f'ph{a}{b}_expandMAD5' for a in range(4) for b in range(2))+']\n unfold '+' '.join(f'pc{k}MAD5' for k in range(N+1))+'\n ring\n'
src+='theorem pair_cleared_nonnegMAD5 (T x g z : ℚ) (hT : 0 ≤ T) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :\n 0 ≤ pairClearedMAD5 T x g z := by\n rw [pair_cleared_expansionMAD5]\n'
for k in range(N+1):src+=f' have h{k} := pc{k}_nonnegMAD5 g z T hg hz hT\n'
src+=' positivity\nend\nend MathGKM.Markov\n'
(R/'research/MarkovPairClearedMAD5.lean').write_text(src)
