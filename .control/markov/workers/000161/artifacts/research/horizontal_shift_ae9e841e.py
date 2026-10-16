"""Machine-authored polynomial horizontal certificates with necessary domain splits."""
from column_certificates_ae9e841e import *
def main():
 out={}
 for t in range(1,4):
  a,b,c=[column(k) for k in [t,t+1,t+2]]
  gap=Padd(Pmul(b,b),Pscale(Pmul(a,c),-1))
  for shift in range(7):
   x=Padd(X,const(shift));n=Padd(N,Pscale(x,3),one)
   p=subst(gap,n,x);fs,core=factor_x(p)
   out[f'{t}-{shift}']={'negative':sum(v<0 for v in core.values()),'terms':len(core)}
   if any(v<0 for v in core.values()):continue
   gn=f'horizontalGap{t}MAE9';s=header([f'MarkovColumn{k}MAE9' for k in [t,t+1,t+2]])
   s+=f'def {gn} (d x : ℚ) : ℚ := {expression(p,"d")}\n'
   s+=f'theorem horizontal_identity{t}MAE9 (d x : ℚ) :\n column{t+1}MAE9 (3*(x+{shift})+1+d) (x+{shift})^2-column{t}MAE9 (3*(x+{shift})+1+d) (x+{shift})*column{t+2}MAE9 (3*(x+{shift})+1+d) (x+{shift})={gn} d x := by\n unfold column{t}MAE9 column{t+1}MAE9 column{t+2}MAE9 {gn}\n ring\n'
   s+=f'theorem horizontal_nonneg{t}MAE9 (d x : ℚ) (hd : 0 ≤ d) (hx : 0 ≤ x) :\n 0 ≤ {gn} d x := by\n unfold {gn}\n positivity\n'
   s+='end\nend MathGKM.Markov\n';(R/f'research/MarkovHorizontalGap{t}MAE9.lean').write_text(s)
   out[f'{t}-{shift}']['selected']=True
   break
 (O/'horizontal-shifts.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
