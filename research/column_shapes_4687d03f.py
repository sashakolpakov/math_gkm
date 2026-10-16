"""Machine-authored symbolic gap candidates; all identities checked separately in Lean."""
from column_five_4687d03f import *
def factor(p):
 fs=[]
 for c in range(1,12):
  while True:
   try:
    q={}
    for i in range(max(a for a,b in p)+1):
     a=[p.get((i,j),F(0)) for j in range(max(b for a,b in p)+1)]
     for j,v in enumerate(divide(a,c)):
      if v:q[i,j]=v
    p=q;fs.append(c)
   except AssertionError:break
 return fs,p
def main():
 cols=[interp(vals(n,9)) for n in [30,31,32]]
 p={(i,j):v for j in range(10) for i,v in enumerate(interp([a[j] for a in cols],30)) if v}
 p3={(0,j):v for j,v in enumerate(interp([lc3(j) for j in range(6)])) if v}
 c4=[interp([lc4(n,j) for j in range(8)]) for n in [30,31]]
 p4={(i,j):v for j in range(8) for i,v in enumerate(interp([a[j] for a in c4],30)) if v}
 n={(1,0):F(1)};x={(0,1):F(1)}
 xp=lambda s:Padd(x,{(0,0):F(s)})
 gV=Padd(Pmul(subst(p,n,xp(1)),subst(p,n,xp(1))),Pscale(Pmul(p,subst(p,n,xp(2))),-1))
 gD=Padd(Pmul(subst(p4,n,xp(1)),subst(p4,n,xp(1))),Pscale(Pmul(subst(p3,n,xp(2)),p),-1))
 out={};source='''import MarkovFivePolynomialM468
/-! Machine-authored 4687d03f. Polynomial certificates for two further raw gaps. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
'''
 for name,g,expression in [('verticalFive',gV,'lowFiveM468 (3*x+7+d) (x+1)^2-lowFiveM468 (3*x+7+d) x*lowFiveM468 (3*x+7+d) (x+2)'),('diagonalFirst',gD,'lowFourME9C (3*x+7+d) (x+1)^2-lowThreeME9C (x+2)*lowFiveM468 (3*x+7+d) x')]:
  shifted=subst(g,{(1,0):F(1),(0,1):F(3),(0,0):F(7)},x)
  fs,core=factor(shifted);assert all(v>0 for v in core.values())
  formula='*'.join('(x+'+str(c)+')' for c in fs)+'*'+lean(core,'d')
  out[name]={'factors':fs,'core':lean(core,'d'),'terms':len(core),'all_coefficients_positive':True}
  source+=f'''def {name}GapM468 (d x : ℚ) : ℚ := {formula}
theorem {name}_identityM468 (d x : ℚ) :
 {expression}={name}GapM468 d x := by
 simp only [lowFiveM468,lowFourME9C,lowThreeME9C,{name}GapM468]
 ring
theorem {name}_positiveM468 (d x : ℚ) (hd : 0 ≤ d) (hx : 0 ≤ x) :
 0 < {name}GapM468 d x := by
 unfold {name}GapM468
 positivity
'''
 source+='end\nend MathGKM.Markov\n'
 Path('research/MarkovFiveShapeM468.lean').write_text(source)
 (O/'column-shapes-candidate.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
