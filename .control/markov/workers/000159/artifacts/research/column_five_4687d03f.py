"""Machine-authored exact polynomial discovery. Generated identities require Lean checking."""
from pathlib import Path
from fractions import Fraction as F
from math import factorial,lcm
import json
from lower_rows_1bb0aa1e import add,mul,scale
O=Path('/Users/sasha/math_gkm/evidence/markov-4687d03f')
def interp(vals,start=0):
 ans=[];basis=[F(1)];d=list(vals)
 for k in range(len(vals)):
  ans=add(ans,scale(basis,d[0]));d=[d[i+1]-d[i] for i in range(len(d)-1)]
  basis=scale(mul(basis,[F(-start-k),F(1)]),F(1,k+1))
 return ans
def lc3(x):return F((x+1)*(x+2)*(x+3)*(x*x+4*x+5),30)
def lc4(n,x):return F((x+1)*(x+2)*(x+3)*(x+4)*(7*(n-1)*(2*x*x+10*x+15)-x*(18*x*x+100*x+155)),2520)
def delta(i,n,x):
 a=F(1)
 for z in range(i-3):a*=F(n-x-1-z,z+1)
 for z in range(1,i+1):a*=F(x+z,z)
 return a
def force(n,x):return delta(5,n,x)+2*delta(5,n,x-1)+delta(5,n,x-2)+2*delta(4,n,x)+2*delta(4,n,x-1)+delta(3,n,x)
def vals(n,J):
 a=[F((n-1)*(n-2),2)]
 a+=[force(n,1)-2*lc4(n,1)+2*a[0]-lc3(1)-2*lc4(n,0)]
 for j in range(2,J+1):a+=[force(n,j)-2*lc4(n,j)-2*lc4(n,j-1)-lc3(j)+2*a[-1]-a[-2]]
 return a[:J+1]
def divide(a,c):
 q=[F(0)]*(len(a)-1);a=list(a)
 for k in range(len(q)-1,-1,-1):q[k]=a[k+1];a[k]-=c*q[k]
 assert a[0]==0
 return q
def Padd(*ps):
 q={}
 for p in ps:
  for k,v in p.items():q[k]=q.get(k,F(0))+v
 return {k:v for k,v in q.items() if v}
def Pmul(a,b):
 q={}
 for (i,j),v in a.items():
  for (k,l),w in b.items():q[i+k,j+l]=q.get((i+k,j+l),F(0))+v*w
 return {k:v for k,v in q.items() if v}
def Pscale(a,c):return {k:v*c for k,v in a.items() if v*c}
def Ppow(a,n):
 q={(0,0):F(1)}
 for _ in range(n):q=Pmul(q,a)
 return q
def subst(p,n,x):
 return Padd(*(Pscale(Pmul(Ppow(n,i),Ppow(x,j)),v) for (i,j),v in p.items()))
def lean(p,n='n',x='x'):
 den=lcm(*(v.denominator for v in p.values()));terms=[]
 for (i,j),v in sorted(p.items(),reverse=True):
  c=int(v*den);terms.append(str(c)+(('*'+n+(('^'+str(i)) if i>1 else '')) if i else '')+(('*'+x+(('^'+str(j)) if j>1 else '')) if j else ''))
 return '('+'+'.join(terms).replace('+-','-')+')/'+str(den)
def main():
 cols=[interp(vals(n,9)) for n in [30,31,32]]
 p={}
 for j in range(10):
  for i,v in enumerate(interp([a[j] for a in cols],30)):
   if v:p[i,j]=v
 factors=[]
 for i in range(3):
  a=[p.get((i,j),F(0)) for j in range(10)]
  for c in range(1,6):a=divide(a,c)
  factors.append(a)
 core={(i,j):v for i,a in enumerate(factors) for j,v in enumerate(a) if v}
 p3={(0,j):v for j,v in enumerate(interp([lc3(j) for j in range(6)])) if v}
 c4=[interp([lc4(n,j) for j in range(8)]) for n in [30,31]]
 p4={(i,j):v for j in range(8) for i,v in enumerate(interp([a[j] for a in c4],30)) if v}
 gap=Padd(Pmul(p4,p4),Pscale(Pmul(p3,p),-1))
 shifted=subst(gap,{(1,0):F(1),(0,1):F(3),(0,0):F(1)},{(0,1):F(1)})
 out={'status':'candidate symbolic formulas, not proof','low_five_core':lean(core),
 'low_five_expanded':lean(p),'horizontal_gap_shift_n_3x_1_d':lean(shifted,'d'),
 'positive_gap_coefficients':all(v>=0 for v in shifted.values()),'gap_terms':len(shifted)}
 (O/'column-five-candidate.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
 Path('research/MarkovFivePolynomialM468.lean').write_text('''import MarkovLowSolutionsME9C
/-! Machine-authored 4687d03f. Exact polynomial candidate and checked identities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
def deltaFiveM468 (n x : ℚ) : ℚ := (n-x-1)*(n-x-2)*(x+1)*(x+2)*(x+3)*(x+4)*(x+5)/240
def lowForceFiveM468 (n x : ℚ) : ℚ :=
 deltaFiveM468 n x+2*deltaFiveM468 n (x-1)+deltaFiveM468 n (x-2)+
 2*deltaFourME9C n x+2*deltaFourME9C n (x-1)+deltaThreeME9C x
def lowFiveM468 (n x : ℚ) : ℚ := (x+1)*(x+2)*(x+3)*(x+4)*(x+5)*'''+lean(core)+'''
theorem low_five_equationM468 (n x : ℚ) :
 lowFiveM468 n (x+2)-2*lowFiveM468 n (x+1)+lowFiveM468 n x=
 lowForceFiveM468 n (x+2)-2*lowFourME9C n (x+2)-2*lowFourME9C n (x+1)-lowThreeME9C (x+2) := by
 unfold lowFiveM468 lowForceFiveM468 deltaFiveM468 lowFourME9C lowThreeME9C deltaFourME9C deltaThreeME9C
 ring
def firstHorizontalGapM468 (d x : ℚ) : ℚ := '''+lean(shifted,'d')+'''
theorem first_horizontal_identityM468 (d x : ℚ) :
 lowFourME9C (3*x+1+d) x^2-lowThreeME9C x*lowFiveM468 (3*x+1+d) x=firstHorizontalGapM468 d x := by
 unfold lowFourME9C lowThreeME9C lowFiveM468 firstHorizontalGapM468
 ring
theorem first_horizontal_nonnegM468 (d x : ℚ) (hd : 0 ≤ d) (hx : 0 ≤ x) :
 0 ≤ firstHorizontalGapM468 d x := by
 unfold firstHorizontalGapM468
 positivity
end
end MathGKM.Markov
''')
if __name__=='__main__':main()
