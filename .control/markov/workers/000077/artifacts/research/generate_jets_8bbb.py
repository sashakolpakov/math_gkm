"""Machine-authored exact matrix expansions; checked by Lean ring normalization."""
from pathlib import Path
from itertools import product
from probe_adb2 import jets,matmul,A,B
def poly(a):
 return ' + '.join(str(v)+('' if j==0 else '*X'+('^'+str(j) if j>1 else '')) for j,v in enumerate(a) if v) or '0'
def bipoly(p):
 terms=[]
 for i in range(max((u for u,v in p),default=0)+1):
  a=[p.get((i,j),0) for j in range(max((v for u,v in p if u==i),default=0)+1)]
  if any(a):terms.append(('' if i==0 else f'U^{i}*')+'C ('+poly(a)+')')
 return '+'.join(terms) or '0'
s='''import MarkovThirdOneSeq8BBB
/-! Machine-authored request 8bbb934e. Exact matrix formulas followed by jets. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 4096
set_option linter.unusedSimpArgs false
'''
fields=[('a',1,'a'),('b',1,'b'),('c',1,'c'),('d',1,'d'),('b',2,'b2'),('c',2,'c2'),('d',2,'d2'),('d',3,'d3')]
for p,q in product((0,1),repeat=2):
 M=A
 for _ in range(1+q):M=matmul(M,B)
 prev={(0,k):2 for k in range(1,2+p)};curr={(0,k):-2 for k in range(1,2+q)}
 G=matmul(matmul([[{(0,0):1},{}],[prev,{(0,0):1}]],M),[[{(0,0):1},{}],[curr,{(0,0):1}]])
 ps=['false','true'][p];qs=['false','true'][q]
 s+=f'theorem oneGauge_formula_{p}{q}8BBB :\n runBooleanGaugeADB2 1 {ps} {qs}=\n ⟨'+',\n  '.join(bipoly(G[i][j]) for i,j in product((0,1),repeat=2))+'⟩ := by\n'
 s+=''' apply Mat16.ext <;>
   norm_num [runBooleanGaugeADB2,gauge75,shear75,unshear75,lowerMatrix487,lowerRun487,
     List.replicate_succ,List.replicate_zero,ambientWord5c,ambientT5c,mm16,U,V,
     runSumA27,Finset.sum_range_succ,map_ofNat] <;> ring
'''
 J=jets(1,p,q)
 s+=f'theorem oneGauge_{p}{q}8BBB :\n '+ ' ∧\n '.join(f'(runBooleanGaugeADB2 1 {ps} {qs}).{a}.coeff {i}=({poly(J[key])})' for a,i,key in fields)+f' := by\n rw [oneGauge_formula_{p}{q}8BBB]\n'
 s+=''' simp only [U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,
   Polynomial.coeff_X_pow]
 norm_num <;> (repeat' constructor) <;> ring
'''
s+='end\nend MathGKM.Markov\n'
Path('research/MarkovThirdOneJets8BBB.lean').write_text(s)
