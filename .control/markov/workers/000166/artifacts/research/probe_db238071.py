"""Machine-authored db238071. Exact sparse experiments, not proofs."""
from pathlib import Path
import ast,re,json,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-db238071'
src=(R/'research/MarkovFactorBridgeMAD5.lean').read_text()
fdefs=re.findall(r'def pf(\d+)MAD5 .*? := (.*)',src)
zero=(0,0,0,0)
def add(a,b):
 d=dict(a)
 for m,c in b.items():d[m]=d.get(m,0)+c
 return {m:c for m,c in d.items() if c}
def neg(a):return {m:-c for m,c in a.items()}
def mul(a,b):
 d={}
 for m,c in a.items():
  for n,e in b.items():
   q=tuple(x+y for x,y in zip(m,n));d[q]=d.get(q,0)+c*e
 return {m:c for m,c in d.items() if c}
def var(k):return {tuple(int(j==k) for j in range(4)):1}
def poly(node,subst):
 if isinstance(node,ast.Constant):return {zero:node.value}
 if isinstance(node,ast.Name):return subst[node.id]
 if isinstance(node,ast.BinOp):
  a=poly(node.left,subst)
  if isinstance(node.op,ast.Pow):
   b={zero:1}
   for _ in range(node.right.value):b=mul(b,a)
   return b
  return (add if isinstance(node.op,ast.Add) else mul)(a,poly(node.right,subst))
 raise ValueError(node)
body=src.split('def pairReducedMAD5')[1].split('def pairPrefactorMAD5')[0]
groups=[[int(x) for x in re.findall(r'pf(\d+)MAD5',s)] for s in re.findall(r'\((pf[^()]*)\)',body)]
def compute(subst):
 fs=[poly(ast.parse(s.replace('^','**'),mode='eval').body,subst) for _,s in fdefs]
 outs=[]
 for gr in groups:
  p={zero:1}
  for i in gr:p=mul(p,fs[i])
  outs.append(p)
 gap=add(add(outs[0],outs[1]),neg(add(outs[2],outs[3])))
 return fs,outs,gap
if __name__=='__main__':
 t=time.monotonic();reports=[]
 for name,sub in [('original',dict(zip('xgzT',map(var,range(4))))),('s=T+x',{'x':var(0),'g':var(1),'z':var(2),'T':add(var(3),neg(var(0)))})]:
  fs,outs,gap=compute(sub)
  report={'representation':name,'factor_terms':[len(p) for p in fs],'product_terms':[len(p) for p in outs],'gap_terms':len(gap),'negative_terms':sum(c<0 for c in gap.values()),'degrees':[max(m[i] for m in gap) for i in range(4)],'negative_sample':[(m,c) for m,c in gap.items() if c<0][:5]}
  reports.append(report);print(json.dumps(report),flush=True)
  (O/('sparse-'+name.replace('=','').replace('+','')+'.json')).write_text(json.dumps({'factors':[list(p.items()) for p in fs],'products':[list(p.items()) for p in outs],'gap':list(gap.items()),'groups':groups}))
 (O/'representation-probe.json').write_text(json.dumps({'seconds':time.monotonic()-t,'reports':reports},indent=2)+'\n')
