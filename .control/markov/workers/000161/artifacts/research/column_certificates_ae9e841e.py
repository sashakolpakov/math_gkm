"""Machine-authored exact polynomial generation; each identity requires Lean validation.
No interpolation: all candidates are expanded from the proved finite lift formula.
"""
from pathlib import Path
from fractions import Fraction as F
from math import comb,factorial
import json,time
from column_five_4687d03f import Padd,Pmul,Pscale,Ppow,subst,lean,divide
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-ae9e841e'
one={(0,0):F(1)};N={(1,0):F(1)};X={(0,1):F(1)}
def const(c):return Pscale(one,F(c))
def choose(p,k):
 a=one
 for h in range(k):a=Pmul(a,Padd(p,const(-h)))
 return Pscale(a,F(1,factorial(k)))
def column(t):
 return Padd(*(Pscale(Pmul(choose(Padd(N,Pscale(X,-2),const(-1)),t-m),Padd(
  choose(Padd(X,const(t+3)),t+m+3),Pscale(choose(Padd(X,const(t+4)),t+m+5),4))),comb(t+m+3,m)) for m in range(t+1)))
def divide_x(p,c):
 q={}
 for i in range(max(k[0] for k in p)+1):
  a=[p.get((i,j),F(0)) for j in range(max(k[1] for k in p)+1)]
  for j,v in enumerate(divide(a,c)):
   if v:q[i,j]=v
 return q
def factor_x(p):
 factors=[]
 for c in range(1,30):
  while True:
   try:q=divide_x(p,c)
   except AssertionError:break
   if not q:break
   factors.append(c);p=q
 return factors,p
def expression(p,v='n'):
 fs,core=factor_x(p)
 return '*'.join([f'(x+{c})' for c in fs]+[lean(core,v)])
def header(imports):return '\n'.join('import '+m for m in imports)+'''\n/-! Machine-authored ae9e841e. Exact polynomial certificates, checked by ring.
These mathematical files use no external evaluator or added axiom. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
'''
def main():
 start=time.monotonic();ps=[column(t) for t in range(7)];out={'status':'candidate identities until Lean validation','columns':{},'gaps':{}}
 for t,p in enumerate(ps[:6]):
  name=f'MarkovColumn{t}MAE9';s=header(['MarkovColumnPolynomialMAE9'])
  s+=f'def column{t}MAE9 (n x : ℚ) : ℚ := {expression(p)}\n'
  s+=f'theorem column_explicit{t}MAE9 (n x : ℚ) : lowColumnMAE9 n x {t}=column{t}MAE9 n x := by\n'
  s+=' unfold lowColumnMAE9\n simp only [sum_range_succ,sum_range_zero]\n norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]\n'
  s+=' simp only ['+','.join(f'binomial_poly_{k}M295' for k in range(2*t+6))+f',column{t}MAE9]\n ring\n'
  s+=f'theorem source_column{t}MAE9 (q j : ℕ) (r : Bool) (hj : j ≤ q) :\n (threeRawM9E2 q r {t+3} j:ℚ)=column{t}MAE9 (sourceNME9C q r) j := by\n have h := source_column_polynomialMAE9 q j {t} r hj\n norm_num only [Nat.reduceAdd] at h\n rw [h,column_explicit{t}MAE9]\n'
  s+='end\nend MathGKM.Markov\n';(R/f'research/{name}.lean').write_text(s)
  out['columns'][str(t)]={'terms':len(p),'expression':expression(p)}
 for t in range(1,4):
  for direction in ['horizontal','vertical','diagonal']:
   if direction=='horizontal':
    a,b,c=ps[t:t+3];offset=1
    lhs=f'column{t+1}MAE9 (3*x+1+d) x^2-column{t}MAE9 (3*x+1+d) x*column{t+2}MAE9 (3*x+1+d) x'
    uses=[t,t+1,t+2]
   elif direction=='vertical':
    a=ps[t+2];b=subst(a,N,Padd(X,one));c=subst(a,N,Padd(X,const(2)));offset=7
    lhs=f'column{t+2}MAE9 (3*x+7+d) (x+1)^2-column{t+2}MAE9 (3*x+7+d) x*column{t+2}MAE9 (3*x+7+d) (x+2)'
    uses=[t+2]
   else:
    a=subst(ps[t],N,Padd(X,const(2)));b=subst(ps[t+1],N,Padd(X,one));c=ps[t+2];offset=7
    lhs=f'column{t+1}MAE9 (3*x+7+d) (x+1)^2-column{t}MAE9 (3*x+7+d) (x+2)*column{t+2}MAE9 (3*x+7+d) x'
    uses=[t,t+1,t+2]
   gap=subst(Padd(Pmul(b,b),Pscale(Pmul(a,c),-1)),Padd(N,Pscale(X,3),const(offset)),X)
   fs,core=factor_x(gap);key=f'{direction}{t}'
   out['gaps'][key]={'terms':len(gap),'core_terms':len(core),'factors':fs,'negative':[[*k,str(v)] for k,v in core.items() if v<0]}
   (O/f'gap-{key}.json').write_text(json.dumps([[*k,str(v)] for k,v in sorted(gap.items())],indent=2)+'\n')
   if any(v<0 for v in core.values()):continue
   gn=f'{direction}Gap{t}MAE9';mn=f'Markov{direction.title()}Gap{t}MAE9';s=header([f'MarkovColumn{k}MAE9' for k in uses])
   s+=f'def {gn} (d x : ℚ) : ℚ := {expression(gap,"d")}\n'
   s+=f'theorem {direction}_identity{t}MAE9 (d x : ℚ) :\n {lhs}={gn} d x := by\n unfold '+ ' '.join(f'column{k}MAE9' for k in uses)+f' {gn}\n ring\n'
   s+=f'theorem {direction}_nonneg{t}MAE9 (d x : ℚ) (hd : 0 ≤ d) (hx : 0 ≤ x) :\n 0 ≤ {gn} d x := by\n unfold {gn}\n positivity\n'
   s+='end\nend MathGKM.Markov\n';(R/f'research/{mn}.lean').write_text(s)
 out['seconds']=time.monotonic()-start
 (O/'column-candidates.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({'columns':len(out['columns']),'gaps':out['gaps'],'seconds':out['seconds']}))
if __name__=='__main__':main()
