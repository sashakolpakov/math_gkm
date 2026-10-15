"""Machine-authored candidate generation; every identity requires Lean induction."""
from pathlib import Path
from fractions import Fraction as F
from math import comb
import json
import uniform_probe_8bbb as u
from probe_adb2 import mul,power,scale,trim
from third_cert_75ad import P
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-bdee9a64'
def substn(p,n):
 d={}
 for (a,b),v in p.items():d[b]=d.get(b,0)+v*n**a
 return trim([d.get(j,0) for j in range(max(d,default=-1)+1)])
def interpolate(vals,start):
 out=P();nn=P({(1,0):1})
 for i,val in enumerate(vals):
  q=P({(0,0):F(1)})
  for j in range(len(vals)):
   if i!=j:q=q*(nn-(start+j))*F(1,i-j)
  out=out+q*P({(0,j):v for j,v in enumerate(val) if v})
 return out
def expr(p):
 terms=[]
 for (a,b),v in sorted(p.items()):
  assert F(v).denominator==1
  t=str(int(v))
  if a:t+='*N'+(f'^{a}' if a>1 else '')
  if b:t+='*X'+(f'^{b}' if b>1 else '')
  terms.append(t)
 return ' + '.join(terms) or '0'
M=u.base.A; mats=[]
for n in range(32):
 mats.append(M);M=u.mm(M,u.base.B)
data={};checks=0
for e in range(4):
 for k in range(4):
  def scaled(n):
   z={j:v for (h,j),v in mats[n][e//2][e%2].items() if h==k}
   return scale(mul(power([1,-1],2*k+1),[z.get(j,0) for j in range(max(z,default=-1)+1)]),6)
  lows=[];highs=[]
  for n in range(20,20+k+1):
   C=scaled(n);lows.append(C[:n]);highs.append(C[n:])
  p=interpolate(lows,20);q=interpolate(highs,20)
  for n in range(32):
   a=substn(p,n);b=[0]*n+substn(q,n)
   from probe_adb2 import add
   assert add(a,b)==scaled(n),(e,k,n)
   checks+=1
  data[e,k]=(p,q)
header='''import MarkovRunScalarBDEE
/-! Machine-authored bdee9a64. Denominator-cleared run jet formulas.
Candidate generation is followed by universal Lean recurrence induction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192
set_option linter.unusedSimpArgs false
'''
for e in range(4):
 text=header
 for bn in range(2):
  terms=[]
  for k in range(3):
   z=P({(0,j):v for (h,j),v in mats[bn][e//2][e%2].items() if h==k})
   if z:terms.append(f'U^{k}*C ({expr(z)})')
  rhs=' + '.join(terms) or '0'
  text+=f'''\ntheorem run_base_{e}_{bn}BDEE : runEntryBDEE {e} {bn}={rhs} := by
 change (lowerMatrix487 {bn}).{'abcd'[e]}=_
 norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,map_add,map_mul,map_pow,map_ofNat]
 <;> ring
'''
 for k in range(4):
  p,q=data[e,k];name=f'jetClosed{e}{k}BDEE';prev=f'jetClosed{e}{k-1}BDEE'
  text+=f'\ndef {name} (n : ℕ) : ℤ[X] :=\n let N : ℤ[X] := n\n ({expr(p)})+X^n*({expr(q)})\n'
  text+=f'''\ntheorem jet_closed_{e}{k}BDEE (n : ℕ) :
 6*(1-X)^{2*k+1}*(runEntryBDEE {e} n).coeff {k}={name} n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_{e}_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [{name}]
   <;> ring
 | one =>
   rw [run_base_{e}_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [{name}]
   <;> ring
 | more n ih ih1 =>
'''
  if k:
   text+=f'''   have h := run_jet_recurrenceBDEE {e} n {k-1}
   have hp := jet_closed_{e}{k-1}BDEE (n+1)
   have he : {name} (n+2)=(1+X)*{name} (n+1)-X*{name} n+
       (1-X)^2*(1+X)^2*{prev} (n+1) := by
     simp only [{name},{prev},Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)^{2*k+1}*h+(1+X)*ih1-X*ih+(1-X)^2*(1+X)^2*hp
'''
  else:
   text+=f'''   have h := run_jet_zero_recurrenceBDEE {e} n
   have he : {name} (n+2)=(1+X)*{name} (n+1)-X*{name} n := by
     simp only [{name},Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 6*(1-X)*h+(1+X)*ih1-X*ih
'''
  text+=f'#print axioms jet_closed_{e}{k}BDEE\n'
 text+='end\nend MathGKM.Markov\n'
 (R/f'research/MarkovRunJets{e}BDEE.lean').write_text(text)
(O/'jet-candidates.json').write_text(json.dumps(dict(status='Finite checks, universal proofs separately required',checks=checks,formulas={f'{e}{k}':dict(P=expr(p),Q=expr(q)) for (e,k),(p,q) in data.items()}),indent=2)+'\n')
print(json.dumps(dict(checks=checks,terms={f'{e}{k}':[len(p),len(q)] for (e,k),(p,q) in data.items()})))
