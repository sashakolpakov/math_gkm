"""Machine-authored db238071. Reverse convolution to reduce recursive depth."""
from finish_products_db238071 import *
groups=json.loads((R/'evidence/markov-c9f23b44/dense-generation.json').read_text())['groups']
fs=[extract(R/'research/MarkovDenseFactorsMC9F.lean',f'df{i}MC9F') for i in range(38)]
mods=[]
for a,k in enumerate([20,20,14,14]):
 prevmod=f'MarkovProduct{a}S{k}MDB2' if a<2 else f'MarkovDenseBatch{a}S{k}MC9F'
 prev=f'prod{a}s{k}MDB2' if a<2 else f'dp{a}s{k}MC9F'
 if a<2:
  v=re.search(r'dense_data% 4 (".*")',(R/'research'/f'{prevmod}.lean').read_text())[1]
  out=json.loads(json.loads(v))
 else:out=extract(R/'research'/f'{prevmod}.lean',prev)
 for b in range(k+1,22):
  fi=groups[a][b];out=dm(4,fs[fi],out)
  name=f'swap{a}s{b}MDB2';mod=f'MarkovSwap{a}S{b}MDB2'
  s=f'import KernelRflMDB2\nimport MarkovDenseDataMC9F\nimport {prevmod}\n/-! Machine-authored db238071. Reversed convolution; ordinary kernel check. -/\nnamespace MathGKM.Markov\nset_option maxRecDepth 100000\nset_option maxHeartbeats 16000000\n'
  s+=f'noncomputable def {name} : DenseMC9F 4 := dense_data% 4 '+json.dumps(json.dumps(out,separators=(',',':')))+'\n'
  s+=f'set_option trace.profiler true in\ntheorem swap{a}s{b}_eqMDB2 : dmulMC9F 4 df{fi}MC9F {prev} = {name} := by kernel_rfl_mdb2\nend MathGKM.Markov\n'
  (R/'research'/f'{mod}.lean').write_text(s);mods.append(mod);prevmod=mod;prev=name
(O/'swap-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
print(mods)
