"""Machine-authored fourth jet candidates; validated separately by Lean induction."""
from pathlib import Path
from fractions import Fraction as F
import json
from third_cert_75ad import P
from probe_adb2 import A,B,trim,mul,power,scale,add
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-6604cff8'
def pmul(a,b):
 d={}
 for (i,j),v in a.items():
  for (k,l),w in b.items():
   if i+k<=4:d[i+k,j+l]=d.get((i+k,j+l),0)+v*w
 return {k:v for k,v in d.items() if v}
def padd(a,b):
 d=dict(a)
 for k,v in b.items():d[k]=d.get(k,0)+v
 return {k:v for k,v in d.items() if v}
def mm(a,b):return [[padd(pmul(a[i][0],b[0][j]),pmul(a[i][1],b[1][j])) for j in range(2)] for i in range(2)]
def interpolate(vals,start):
 out=P();nn=P({(1,0):1})
 for i,val in enumerate(vals):
  q=P({(0,0):F(1)})
  for j in range(len(vals)):
   if i!=j:q=q*(nn-(start+j))*F(1,i-j)
  out=out+q*P({(0,j):v for j,v in enumerate(val) if v})
 return out
def substn(p,n):
 d={}
 for (a,b),v in p.items():d[b]=d.get(b,0)+v*n**a
 return trim([d.get(j,0) for j in range(max(d,default=-1)+1)])
def expr(p):
 ts=[]
 for (a,b),v in sorted(p.items()):
  assert F(v).denominator==1
  t=str(int(v))
  if a:t+='*N'+(f'^{a}' if a>1 else '')
  if b:t+='*X'+(f'^{b}' if b>1 else '')
  ts.append(t)
 return ' + '.join(ts) or '0'
M=A;mats=[]
for n in range(42):mats.append(M);M=mm(M,B)
data={};checks=0
for e in range(4):
 def scaled(n):
  z={j:v for (h,j),v in mats[n][e//2][e%2].items() if h==4}
  return scale(mul(power([1,-1],9),[z.get(j,0) for j in range(max(z,default=-1)+1)]),24)
 lows=[];highs=[]
 for n in range(20,25):
  z=scaled(n);lows.append(z[:n]);highs.append(z[n:])
 p=interpolate(lows,20);q=interpolate(highs,20)
 for n in range(42):
  assert add(substn(p,n),[0]*n+substn(q,n))==scaled(n),(e,n)
  checks+=1
 name=f'jetClosed{e}4N6604';prev=f'jetClosed{e}3BDEE'
 text=f'''import MarkovRunJets{e}BDEE
/-! Machine-authored 6604cff8. Universal fourth run jet by recurrence induction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def {name} (n : ℕ) : ℤ[X] :=
 let N : ℤ[X] := n
 ({expr(p)})+X^n*({expr(q)})
theorem jet_closed_{e}4N6604 (n : ℕ) :
 24*(1-X)^9*(runEntryBDEE {e} n).coeff 4={name} n := by
 induction n using Nat.twoStepInduction with
 | zero =>
   rw [run_base_{e}_0BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [{name}] <;> ring
 | one =>
   rw [run_base_{e}_1BDEE]
   simp only [U,Polynomial.coeff_add,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
   norm_num [{name}] <;> ring
 | more n ih ih1 =>
   have h := run_jet_recurrenceBDEE {e} n 3
   have hp := jet_closed_{e}3BDEE (n+1)
   have he : {name} (n+2)=(1+X)*{name} (n+1)-X*{name} n+
       4*(1-X)^2*(1+X)^2*{prev} (n+1) := by
     simp only [{name},{prev},Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_succ]
     ring
   rw [he]
   linear_combination 24*(1-X)^9*h+(1+X)*ih1-X*ih+4*(1-X)^2*(1+X)^2*hp
end
end MathGKM.Markov
'''
 (R/f'research/MarkovRunJetFourth{e}N6604.lean').write_text(text)
 data[str(e)]=dict(P=expr(p),Q=expr(q),terms=[len(p),len(q)])
(O/'fourth-jet-candidates.json').write_text(json.dumps(dict(status='Finite candidate checks; Lean induction required for universal result',checks=checks,formulas=data),indent=2)+'\n')
print(json.dumps(dict(checks=checks,terms={e:d['terms'] for e,d in data.items()})))
