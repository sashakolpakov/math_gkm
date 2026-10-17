"""Machine-authored 7a344181. Generates candidate proof data, never proof authority."""
from pathlib import Path
import json,re,ast,time
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-7a344181'
D=json.loads((R/'evidence/markov-db238071/sparse-original.json').read_text())
head='/-! Machine-authored live request 7a344181. Generated positive expression data; all certificate claims require kernel checking. -/\nnamespace MathGKM.Markov\nset_option maxRecDepth 100000\nset_option maxHeartbeats 16000000\n'
end='end MathGKM.Markov\n'
def horner(p,level=3):
 if not p:return '(.c 0)'
 if level<0:
  assert len(p)==1
  return f'(.c {next(iter(p.values()))})'
 d=max(m[level] for m in p)
 ss=[horner({m:c for m,c in p.items() if m[level]==k},level-1) for k in range(d+1)]
 out=ss[-1]
 for v in reversed(ss[:-1]):out=f'(.add {v} (.mul (.x {level}) {out}))'
 return out
src=(R/'research/MarkovFactorBridgeMAD5.lean').read_text()
exprs=re.findall(r'^def pf(\d+)MAD5 .*? := (.*)$',src,re.M)
assert len(exprs)==38
def conv(e):
 if isinstance(e,ast.Constant):return f'(.c {e.value})'
 if isinstance(e,ast.Name):return f'(.x {dict(x=0,g=1,z=2,T=3)[e.id]})'
 if isinstance(e,ast.BinOp):
  if isinstance(e.op,ast.Pow):return f'(.pow {conv(e.left)} {e.right.value})'
  return f'(.{ "add" if isinstance(e.op,ast.Add) else "mul"} {conv(e.left)} {conv(e.right)})'
 raise ValueError(e)
s='import MarkovExpressionM7A3\nimport MarkovFactorBridgeMAD5\n'+head
for i,e in exprs:s+=f'def ef{i}M7A3 : NExprM7A3 := {conv(ast.parse(e.replace("^","**"),mode="eval").body)}\n'
v='(fun i : Fin 4 => ![x,g,z,T] i)'
for i,e in exprs:
 s+=f'theorem ef{i}_evalM7A3 (T x g z : ℚ) : evalExprM7A3 {v} ef{i}M7A3 = pf{i}MAD5 T x g z := by\n simp [ef{i}M7A3,evalExprM7A3,pf{i}MAD5]\n'
for i,gr in enumerate(D['groups']):
 ex=f'ef{gr[0]}M7A3'
 for k in gr[1:]:ex=f'(.mul {ex} ef{k}M7A3)'
 s+=f'def ep{i}M7A3 : NExprM7A3 := {ex}\n'
 s+=f'theorem ep{i}_evalM7A3 (T x g z : ℚ) : evalExprM7A3 {v} ep{i}M7A3 = '+ '*'.join(f'pf{k}MAD5 T x g z' for k in gr)+' := by\n simp only [ep'+str(i)+'M7A3,evalExprM7A3,'+','.join(f'ef{k}_evalM7A3' for k in sorted(set(gr)))+']\n'
s+='def leftExprM7A3 : NExprM7A3 := .add ep0M7A3 ep1M7A3\n'
(R/'research/MarkovExpressionFactorsM7A3.lean').write_text(s+end)
gap={tuple(m):c for m,c in D['gap']}; assert all(c>=0 for c in gap.values())
s='import MarkovExpressionM7A3\n'+head
# Keep separately named outer blocks for modular arithmetic certificates.
for t in range(max(m[3] for m in gap)+1):
 p={m:c for m,c in gap.items() if m[3]==t}
 s+=f'def eg{t}M7A3 : NExprM7A3 := {horner(p,2)}\n'
out=f'eg{t}M7A3'
for k in reversed(range(t)):out=f'(.add eg{k}M7A3 (.mul (.x 3) {out}))'
s+=f'def gapExprM7A3 : NExprM7A3 := {out}\n'
(R/'research/MarkovExpressionGapM7A3.lean').write_text(s+end)
s='import MarkovExpressionFactorsM7A3\nimport MarkovExpressionGapM7A3\n'+head
s+='def rightExprM7A3 : NExprM7A3 := .add (.add ep2M7A3 ep3M7A3) gapExprM7A3\n'
for name in ['leftExpr','rightExpr']:
 for i,b in enumerate([23,20,13]):
  s+=f'theorem {name}_degree{i}M7A3 : degreeExprM7A3 {i} {name}M7A3 < {b} := by decide +kernel\n'
 s+=f'theorem {name}_massM7A3 : evalExprM7A3 (fun _ => (1:ℕ)) {name}M7A3 < 2^80 := by decide +kernel\n'
(R/'research/MarkovExpressionBoundsM7A3.lean').write_text(s+end)
s='import MarkovExpressionBoundsM7A3\n'+head
s+='theorem packed_identityM7A3 : evalExprM7A3 (fun i => (2^80:ℕ)^weightFourM7A3 i) leftExprM7A3 = evalExprM7A3 (fun i => (2^80:ℕ)^weightFourM7A3 i) rightExprM7A3 := by decide +kernel\n'
(R/'research/MarkovExpressionPackedM7A3.lean').write_text(s+end)
(O/'expression-generation.json').write_text(json.dumps({'factors':38,'groups':D['groups'],'gap_terms':len(gap),'source':'evidence/markov-db238071/sparse-original.json','status':'generated candidates only; compile receipts required'},indent=2)+'\n')
print('Generated expression factors, gap, bounds and packed equality candidates.')
