"""Machine-authored c9f23b44. Propose dense arithmetic certificates; Lean checks them."""
from pathlib import Path
import ast,json,re,sys
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-c9f23b44'
src=(R/'research/MarkovFactorBridgeMAD5.lean').read_text()
fdefs=re.findall(r'def pf(\d+)MAD5 .*? := (.*)',src)
def add(a,b):
 d=dict(a)
 for m,c in b.items():d[m]=d.get(m,0)+c
 return {m:c for m,c in d.items() if c}
def mul(a,b):
 d={}
 for m,c in a.items():
  for n,e in b.items():
   q=tuple(x+y for x,y in zip(m,n));d[q]=d.get(q,0)+c*e
 return {m:c for m,c in d.items() if c}
def poly(node):
 if isinstance(node,ast.Constant):return {(0,0,0,0):node.value}
 if isinstance(node,ast.Name):return {tuple(int(k=='xgzT'.index(node.id)) for k in range(4)):1}
 if isinstance(node,ast.BinOp):
  a=poly(node.left)
  if isinstance(node.op,ast.Pow):
   b={(0,0,0,0):1}
   for _ in range(node.right.value):b=mul(b,a)
   return b
  return (add if isinstance(node.op,ast.Add) else mul)(a,poly(node.right))
 raise ValueError(node)
factors=[poly(ast.parse(s.replace('^','**'),mode='eval').body) for _,s in fdefs]
body=src.split('def pairReducedMAD5')[1].split('def pairPrefactorMAD5')[0]
groups=[[int(x) for x in re.findall(r'pf(\d+)MAD5',s)] for s in re.findall(r'\((pf[^()]*)\)',body)]
assert len(groups)==4 and all(len(g)==22 for g in groups),groups
def dense(d,n=4):
 if n==0:return next(iter(d.values()),0)
 if not d:return []
 return [dense({m[1:]:c for m,c in d.items() if m[0]==i},n-1) for i in range(max(m[0] for m in d)+1)]
def dz(n):return 0 if n==0 else []
def da(n,a,b):
 if n==0:return a+b
 return [da(n-1,a[i],b[i]) if i<min(len(a),len(b)) else (a[i] if i<len(a) else b[i]) for i in range(max(len(a),len(b)))]
def dm(n,a,b):
 if n==0:return a*b
 if not a:return []
 p=[dm(n-1,a[0],v) for v in b]
 if len(a)==1:return p
 return da(n,p,[dz(n-1)]+dm(n,a[1:],b))
def neg(n,a):return -a if n==0 else [neg(n-1,b) for b in a]
def render(a):return str(a).replace(' ','')
def size(a):return 1 if isinstance(a,int) else sum(size(b) for b in a)
head='/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/\nnamespace MathGKM.Markov\nset_option maxRecDepth 100000\nset_option maxHeartbeats 16000000\n'
end='end MathGKM.Markov\n'
vs='(fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T)'
s='import MarkovDenseCertificateMC9F\nimport MarkovFactorBridgeMAD5\n'+head
for i,p in enumerate(factors):
 s+=f'def df{i}MC9F : DenseMC9F 4 := {render(dense(p))}\n'
 s+=f'theorem df{i}_evalMC9F (x g z T : ℚ) : devalMC9F 4 {vs} df{i}MC9F = pf{i}MAD5 T x g z := by\n norm_num [devalMC9F,denseEvalMC9F,df{i}MC9F,pf{i}MAD5]\n <;> ring\n'
(R/'research/MarkovDenseFactorsMC9F.lean').write_text(s+end)
stats=[];outs=[];mods=['MarkovDenseCertificateMC9F','MarkovDenseFactorsMC9F']
for a,group in enumerate(groups):
 out=dense(factors[group[0]]);prev=f'df{group[0]}MC9F';prevmod='MarkovDenseFactorsMC9F'
 for b,fi in enumerate(group[1:],1):
  out=dm(4,out,dense(factors[fi]));name=f'dp{a}s{b}MC9F';mod=f'MarkovDenseProduct{a}S{b}MC9F'
  s=f'import {prevmod}\n'+head+f'def {name} : DenseMC9F 4 := {render(out)}\n'
  s+=f'theorem {name}_eqMC9F : dmulMC9F 4 {prev} df{fi}MC9F = {name} := by decide +kernel\n'
  s+=f'theorem {name}_evalMC9F (v : ℕ → ℚ) : devalMC9F 4 v {name} = devalMC9F 4 v {prev} * devalMC9F 4 v df{fi}MC9F := by\n rw [← {name}_eqMC9F,deval_mulMC9F]\n'
  (R/'research'/f'{mod}.lean').write_text(s+end)
  stats.append({'module':mod,'leaves':size(out),'bytes':len(s)});mods.append(mod);prev=name;prevmod=mod
 outs.append(out)
out=da(4,da(4,outs[0],outs[1]),neg(4,da(4,outs[2],outs[3])))
s='\n'.join(f'import MarkovDenseProduct{a}S21MC9F' for a in range(4))+'\n'+head
s+=f'def denseGapMC9F : DenseMC9F 4 := {render(out)}\n'
s+='theorem dense_gap_eqMC9F : daddMC9F 4 (daddMC9F 4 dp0s21MC9F dp1s21MC9F) (dnegMC9F 4 (daddMC9F 4 dp2s21MC9F dp3s21MC9F)) = denseGapMC9F := by decide +kernel\n'
s+='theorem dense_gap_positiveMC9F : dpositiveMC9F 4 denseGapMC9F = true := by decide +kernel\n'
s+=f'theorem dense_gap_evalMC9F (x g z T : ℚ) : devalMC9F 4 {vs} denseGapMC9F = pairReducedMAD5 T x g z := by\n rw [← dense_gap_eqMC9F,deval_addMC9F,deval_addMC9F,deval_negMC9F,deval_addMC9F]\n'
for a,group in enumerate(groups):
 for b in range(21,0,-1):s+=f' rw [dp{a}s{b}MC9F_evalMC9F]\n'
s+=' simp only ['+','.join(f'df{i}_evalMC9F' for i in range(38))+']\n unfold pairReducedMAD5\n ring\n'
s+=f'theorem pair_reduced_nonnegMC9F (T x g z : ℚ) (hT : 0 ≤ T) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) : 0 ≤ pairReducedMAD5 T x g z := by\n rw [← dense_gap_evalMC9F]\n apply deval_nonnegMC9F 4 {vs} _ denseGapMC9F dense_gap_positiveMC9F\n intro k\n rcases k with _|k\n · exact hx\n rcases k with _|k\n · exact hg\n rcases k with _|k <;> assumption\n'
s+='theorem reduced_pair_positiveMC9F : ReducedPairPositiveMAD5 := by\n intro T x g z\n exact pair_reduced_nonnegMC9F T x g z (by positivity) (by positivity) (by positivity) (by positivity)\n'
(R/'research/MarkovDenseGapMC9F.lean').write_text(s+end);mods.append('MarkovDenseGapMC9F')
(O/'dense-generation.json').write_text(json.dumps({'steps':stats,'gap_leaves':size(out),'groups':groups,'modules':mods},indent=2)+'\n')
print(json.dumps({'steps':len(stats),'max_leaves':max(s['leaves'] for s in stats),'gap_leaves':size(out),'max_bytes':max(s['bytes'] for s in stats)}))
