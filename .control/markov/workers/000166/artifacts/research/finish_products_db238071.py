"""Machine-authored db238071. Propose individual kernel arithmetic certificates.
No inherited files are changed. Each output is only a candidate until built.
"""
from pathlib import Path
import json,re,ast
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-db238071'
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
def extract(p,name):
 s=p.read_text();v=re.search(r'def '+name+r' : DenseMC9F 4 := (.*)',s)[1]
 return ast.literal_eval(v)
def size(a):return 1 if isinstance(a,int) else sum(size(b) for b in a)
if __name__=='__main__':
 src=R/'research/MarkovDenseFactorsMC9F.lean'
 factors=[extract(src,f'df{i}MC9F') for i in range(38)]
 groups=json.loads((R/'evidence/markov-c9f23b44/dense-generation.json').read_text())['groups']
 mods=[];outs=[]
 for a,k in enumerate([18,18,14,14]):
  prevmod=f'MarkovDenseBatch{a}S{k}MC9F';prev=f'dp{a}s{k}MC9F'
  out=extract(R/'research'/f'{prevmod}.lean',prev)
  for b in range(k+1,22):
   fi=groups[a][b];out=dm(4,out,factors[fi]);name=f'prod{a}s{b}MDB2';mod=f'MarkovProduct{a}S{b}MDB2'
   s=f'import MarkovDenseDataMC9F\nimport {prevmod}\n/-! Machine-authored db238071. Kernel arithmetic certificate only. -/\nnamespace MathGKM.Markov\nset_option maxRecDepth 100000\nset_option maxHeartbeats 16000000\n'
   s+=f'noncomputable def {name} : DenseMC9F 4 := dense_data% 4 '+json.dumps(json.dumps(out,separators=(',',':')))+'\n'
   s+=f'set_option trace.profiler true in\ntheorem prod{a}s{b}_eqMDB2 : dmulMC9F 4 {prev} df{fi}MC9F = {name} :=\n dbeq_soundMC9F 4 _ _ (by decide +kernel)\nend MathGKM.Markov\n'
   (R/'research'/f'{mod}.lean').write_text(s);mods.append(mod);prevmod=mod;prev=name
  outs.append(out)
 out=da(4,da(4,outs[0],outs[1]),neg(4,da(4,outs[2],outs[3])))
 (O/'proposed-gap.json').write_text(json.dumps(out,separators=(',',':')))
 (O/'product-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
 print(json.dumps({'modules':mods,'gap_leaves':size(out)}))
