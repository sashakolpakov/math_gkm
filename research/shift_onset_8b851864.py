"""Machine-authored shifted positive certificates; Lean checks every identity."""
from pathlib import Path
import ast,re,json
R=Path('/Users/sasha/math_gkm');D=R/'research';O=R/'evidence/markov-8b851864'
def add(p,q):
 r=p.copy()
 for k,v in q.items():r[k]=r.get(k,0)+v
 return {k:v for k,v in r.items() if v}
def mul(p,q):
 r={}
 for k,v in p.items():
  for l,w in q.items():
   z=tuple(a+b for a,b in zip(k,l));r[z]=r.get(z,0)+v*w
 return {k:v for k,v in r.items() if v}
def parse(s,names):
 z=(0,)*len(names)
 def go(a):
  if isinstance(a,ast.Constant):return {z:a.value}
  if isinstance(a,ast.Name):
   k=tuple(int(x==a.id) for x in names);return add({k:1},{z:-4}) if a.id=='N' else {k:1}
  if isinstance(a,ast.BinOp):
   if isinstance(a.op,ast.Add):return add(go(a.left),go(a.right))
   if isinstance(a.op,ast.Mult):return mul(go(a.left),go(a.right))
   if isinstance(a.op,ast.Pow):
    p={z:1}
    for _ in range(a.right.value):p=mul(p,go(a.left))
    return p
  raise ValueError(ast.dump(a))
 return go(ast.parse(s.replace('^','**').strip(),mode='eval').body)
def horner(p,names):
 if not p:return '0'
 if not names:return str(sum(p.values()))
 groups={}
 for k,v in p.items():groups.setdefault(k[0],{})[k[1:]]=v
 m=max(groups);s=horner(groups[m],names[1:])
 for k in reversed(range(m)):
  t=horner(groups.get(k,{}),names[1:]);s=f'({s}*{names[0]} + {t})' if t!='0' else f'({s}*{names[0]})'
 return s
head='/-! Machine-authored request 8b851864. Extend onset gaps to N >= -4 (n >= 3). -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 16000000\nset_option maxRecDepth 65536\n'
mods=[];stats=[]
for pfx in ['Low','High','One','Top']:
 for k in range(1,6):
  old=f'MarkovOnset{pfx}Gap{k}M253';m=f'MarkovOnset{pfx}Small{k}M8B8';s=(D/f'{old}.lean').read_text()
  out=f'import {old}\n'+head
  if pfx in ['Low','High']:
   blocks=s.split('\n\n')
   names=re.findall(r'^theorem (\w+(?:_nonneg|_lc\d+M253))',s,re.M)
   mapping={name:name.replace('M253','M8B8') for name in names}
   def replace(t):
    return re.sub(r'\b\w+\b',lambda a:mapping.get(a[0],a[0]),t).replace('(hN : 0≤N)','(hN : -4≤N)')
   for block in blocks:
    if re.match('theorem onset'+pfx+r'GC\d',block) and '_nonneg ' in block.splitlines()[0]:
     name=block.split()[1];g=name.removesuffix('_nonneg');expr=re.search(r'^def '+g+r' \(N : ℤ\) : ℤ :=\s*(.*?)\n\n',s,re.S|re.M)[1]
     p=parse(expr,['N']);assert all(v>=0 for v in p.values())
     rhs=horner(p,['(N+4)']);statement=replace(block.split(' := by')[0])
     out+=f'\n{statement} := by\n have h : 0≤N+4 := by omega\n have he : {g} N={rhs} := by\n  unfold {g}\n  ring\n rw [he]\n positivity\n'
    elif block.startswith('theorem onset'+pfx+'GCol') and '_nonneg ' in block.splitlines()[0]:out+='\n'+replace(block)+'\n'
    elif block.startswith('attribute'):out+='\n'+block+'\n'
    elif block.startswith('theorem onset'+pfx+'_lc'):
     block=block.split('\nend')[0];out+='\n'+replace(block)+'\n'
  else:
   var='C' if pfx=='One' else 'R';g=f'onset{pfx}G{k}M253'
   expr=re.search(r'^def '+g+r' .*?: ℤ :=\s*(.*?)\n\n',s,re.S|re.M)[1]
   p=parse(expr,['N',var]);assert all(v>=0 for v in p.values())
   rhs=horner(p,['(N+4)',var])
   out+=f'\ntheorem onset{pfx}_lc{k}M8B8 (N {var} : ℤ) (hN : -4≤N) (h{var} : 0≤{var}) :\n onset{pfx}V{k}M253 N {var}*onset{pfx}V{k+2}M253 N {var} ≤ (onset{pfx}V{k+1}M253 N {var})^2 := by\n apply sub_nonneg.mp\n rw [onset{pfx}_gap{k}M253]\n have h : 0≤N+4 := by omega\n have he : {g} N {var}={rhs} := by\n  unfold {g}\n  ring\n rw [he]\n positivity\n'
  out+='end\nend MathGKM.Markov\n';p=D/f'{m}.lean';assert not p.exists();p.write_text(out);mods.append(m);stats.append(dict(module=m,bytes=len(out),theorems=len(re.findall(r'^theorem',out,re.M))))
(O/'small-onset-modules.json').write_text(json.dumps(mods,indent=2)+'\n');(O/'small-onset-generation.json').write_text(json.dumps(stats,indent=2)+'\n')
print(stats)
