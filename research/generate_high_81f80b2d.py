"""Machine-authored 81f80b2d. Exact candidates; only checked Lean is proof."""
from pathlib import Path
from fractions import Fraction
import sys,json,re
sys.path.insert(0,'research')
import probe_strip_b9d0d341 as p
P=p.sp;a,k,l,q,t,u=p.a,p.k,p.l,p.q,p.t,p.u
N=k+l;b=N+2
J=8*q*p.fall(l,3)+p.D*k*p.fall(l,2)+p.E*p.fall(k,2)*l+p.F*p.fall(k,3)
H=sum((p.cs[r]*p.fall(k+1,r)*p.fall(l-1,5-r) for r in range(6)),P.poly(0))
bodies=[re.search(r'def h4c'+str(r)+r'M511.*?:=\n(.*?)(?=\n\n)',Path('research/MarkovHorizontalFourthSeedM511.lean').read_text(),re.S).group(1).strip().replace('^','**') for r in range(8)]
def horner(z,vs=(1,2)):
 if not z:return '0'
 if not vs:
  assert len(z)==1
  c=next(iter(z.values()));assert c.denominator==1
  return str(c.numerator) if c>=0 else f'({c.numerator})'
 v=vs[0];groups={}
 for e,c in z.items():
  ee=list(e);ee[v]=0;groups.setdefault(e[v],{})[tuple(ee)]=c
 exps=sorted(groups,reverse=True);ans=horner(groups[exps[0]],vs[1:]);last=exps[0]
 var=['a','k','l','q','t','u'][v]
 for e in exps[1:]:
  power=var if last-e==1 else f'{var}^{last-e}'
  ans=f'({ans})*{power}+({horner(groups[e],vs[1:])})';last=e
 if last:ans=f'({ans})*'+(var if last==1 else f'{var}^{last}')
 return ans
def coefficient(z,r):return P.P({tuple(0 if j==3 else e[j] for j in range(6)):c for e,c in z.items() if e[3]==r})
def fall(x,n):return '*'.join(f'({x}-{j})' if j else f'({x})' for j in range(n)) or '1'
head='''/-! Machine-authored 81f80b2d. Raw row-two gap, with all statistics. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 20000
'''
defs='''def highJM81F (a k l q : ℝ) : ℝ :=
 8*q*l*(l-1)*(l-2)+(9*a^2-5*a+2)*k*l*(l-1)+
 (6*a^2+6*a*(k+l+2)-16*a+4)*k*(k-1)*l+
 (a+k+l+1)*(a+k+l)*k*(k-1)*(k-2)
'''
hcs=['h3c0M13D u','h3c1M13D a q t','h3c2M13D a (k+l+2) q']+[f'h3c{r}M13D a (k+l+2)' for r in range(3,6)]
defs+='def highHM81F (a k l q t u : ℝ) : ℝ :=\n '+'+\n '.join(f'({c})*{fall("k+1",r)}*{fall("l-1",5-r)}' for r,c in enumerate(hcs))+'\n'
defs+='def highIM81F (a k l q t u v w z : ℝ) : ℝ :=\n '+'+\n '.join(f'(h4c{r}M511 a (k+l+2) q t u v w z)*{fall("k+2",r)}*{fall("l-2",7-r)}' for r in range(8))+'\n'
defs+='''def highGapM81F (a k l q t u v w z : ℝ) : ℝ :=
 4*(k+l-5)*(k+l-6)*(k+2)*l*(highHM81F a k l q t u)^2-
 3*(k+l-3)*(k+l-4)*(k+1)*(l-1)*highJM81F a k l q*highIM81F a k l q t u v w z
'''
Path('research/MarkovHighDefsM81F.lean').write_text('import MarkovHorizontalFourthSeedM511\n'+head+defs+'end\nend MathGKM.Markov\n')
metadata=[]
cones=[(2,(b+q)*Fraction(1,2),q,b-(b+q)*Fraction(1,2),0,0,q,0,
 ['(k+l+2+q)/2','q','k+l+2-(k+l+2+q)/2','0','0','q','0']),
 (3,(2*b+q)*Fraction(1,3),2*(2*b+q)*Fraction(1,3)-b,b-(2*b+q)*Fraction(1,3),q,0,b-(2*b+q)*Fraction(1,3),0,
 ['(2*(k+l+2)+q)/3','2*((2*(k+l+2)+q)/3)-(k+l+2)','k+l+2-(2*(k+l+2)+q)/3','q','0','k+l+2-(2*(k+l+2)+q)/3','0']),
 (4,(3*b+q)*Fraction(1,4),2*(3*b+q)*Fraction(1,4)-b,b-(3*b+q)*Fraction(1,4),3*(3*b+q)*Fraction(1,4)-2*b,0,b-(3*b+q)*Fraction(1,4),q,
 ['(3*(k+l+2)+q)/4','2*((3*(k+l+2)+q)/4)-(k+l+2)','k+l+2-(3*(k+l+2)+q)/4','3*((3*(k+l+2)+q)/4)-2*(k+l+2)','0','k+l+2-(3*(k+l+2)+q)/4','q'])]
for c,(den,aa,qq,tt,uu,vv,ww,zz,args) in enumerate(cones):
 cs4=[eval(body,{'__builtins__':{}},dict(a=aa,b=b,q=qq,t=tt,u=uu,v=vv,w=ww,z=zz)) for body in bodies]
 ii=sum((v*p.fall(k+2,r)*p.fall(l-2,7-r) for r,v in enumerate(cs4)),P.poly(0))
 jj=J.subst([aa,k,l,qq,tt,uu]);hh=H.subst([aa,k,l,qq,tt,uu])
 cs={key:[coefficient(z,r) for r in range(n+1)] for key,z,n in [('j',den**2*jj,2),('h',den**3*hh,3),('i',den**4*ii,4)]}
 prefix=f'c{c}'
 def name(key,r):return f'{prefix}{key}{r}M81F'
 def expr(key,n):return '+'.join(f'{name(key,r)} k l'+(f'*q^{r}' if r else '') for r in range(n+1))
 text='import MarkovHighDefsM81F\n'+head
 text+=f'def highCone{c}M81F (k l q : ℝ) : ℝ := highGapM81F ({args[0]}) k l '+ ' '.join(f'({z})' for z in args[1:])+'\n'
 for key,polys in cs.items():
  for r,z in enumerate(polys):text+=f'def {name(key,r)} (k l : ℝ) : ℝ := {horner(z)}\n'
 F=4*(N-5)*(N-6)*(k+2)*l;E=3*(N-3)*(N-4)*(k+1)*(l-1)
 gaps=[]
 for r in range(7):
  hs=[(i,j) for i in range(4) for j in range(4) if i+j==r];js=[(i,j) for i in range(3) for j in range(5) if i+j==r]
  zz=F*sum((cs['h'][i]*cs['h'][j] for i,j in hs),P.poly(0))-E*sum((cs['j'][i]*cs['i'][j] for i,j in js),P.poly(0))
  gaps.append(zz)
  text+=f'def {name("g",r)} (k l : ℝ) : ℝ := 4*(k+l-5)*(k+l-6)*(k+2)*l*('+ '+'.join(f'{name("h",i)} k l*{name("h",j)} k l' for i,j in hs)+')-3*(k+l-3)*(k+l-4)*(k+1)*(l-1)*('+ '+'.join(f'{name("j",i)} k l*{name("i",j)} k l' for i,j in js)+')\n'
 text+='end\nend MathGKM.Markov\n'
 Path(f'research/MarkovHighCone{c}DefsM81F.lean').write_text(text)
 unfolded='highJM81F highHM81F highIM81F '+' '.join(f'h3c{r}M13D' for r in range(6))+' '+' '.join(f'h4c{r}M511' for r in range(8))
 src=f'import MarkovHighCone{c}DefsM81F\n'+head
 terms={'j':f'highJM81F ({args[0]}) k l ({args[1]})',
 'h':f'highHM81F ({args[0]}) k l '+ ' '.join(f'({z})' for z in args[1:4]),
 'i':f'highIM81F ({args[0]}) k l '+ ' '.join(f'({z})' for z in args[1:])}
 for key,n in [('j',2),('h',3),('i',4)]:
  src+=f'theorem {prefix}{key}_expandM81F (k l q : ℝ) : {den**n}*({terms[key]})={expr(key,n)} := by\n unfold {unfolded} '+ ' '.join(name(key,r) for r in range(n+1))+'\n ring\n'
 src+=f'''theorem high_expand{c}M81F (k l q : ℝ) :
 {den**6}*highCone{c}M81F k l q={expr('g',6)} := by
 have hj := {prefix}j_expandM81F k l q
 have hh := {prefix}h_expandM81F k l q
 have hi := {prefix}i_expandM81F k l q
 have he : {den**6}*highCone{c}M81F k l q=
  4*(k+l-5)*(k+l-6)*(k+2)*l*({expr('h',3)})^2-
  3*(k+l-3)*(k+l-4)*(k+1)*(l-1)*({expr('j',2)})*({expr('i',4)}) := by
  unfold highCone{c}M81F highGapM81F
  linear_combination
   4*(k+l-5)*(k+l-6)*(k+2)*l*({den**3}*({terms['h']})+({expr('h',3)}))*hh-
   3*(k+l-3)*(k+l-4)*(k+1)*(l-1)*({den**4}*({terms['i']})*hj+({expr('j',2)})*hi)
 rw [he]
 unfold {' '.join(name('g',r) for r in range(7))}
 ring
end
end MathGKM.Markov
'''
 Path(f'research/MarkovHighCone{c}ExpandM81F.lean').write_text(src)
 charts=[('large',k+1,l+9,'k+1','l+9'),('zero',0,l+9,'0','l+9')]+[(f's{r}',k+max(7-r,1),r,f'k+{max(7-r,1)}',str(r)) for r in range(2,9)]+[('z7',0,7,'0','7'),('z8',0,8,'0','8')]
 for r,g in enumerate(gaps):
  src=f'import MarkovHighCone{c}DefsM81F\n'+head
  used=sorted(set([name('h',i) for i in range(4) if 0<=r-i<4]+[name('j',i) for i in range(3) if 0<=r-i<5]+[name('i',i) for i in range(5) if 0<=r-i<3]))
  sizes=[]
  for cname,kk,ll,ks,ls in charts:
   z=g.subst([0,kk,ll,0,0,0]); assert all(v>0 for v in z.values()),(c,r,cname)
   sizes.append(len(z))
   src+=f'''theorem high{c}_{r}_{cname}M81F (k l : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) :
 0 ≤ {name('g',r)} ({ks}) ({ls}) := by
 have he : {name('g',r)} ({ks}) ({ls})={horner(z)} := by
  unfold {name('g',r)} {' '.join(used)}
  ring
 rw [he]
 positivity
'''
  src+='end\nend MathGKM.Markov\n'
  Path(f'research/MarkovHighCone{c}Cert{r}M81F.lean').write_text(src)
  metadata.append(dict(cone=c,coefficient=r,chart_terms=sizes))
Path('evidence/markov-81f80b2d/high-certificate-design.json').write_text(json.dumps(metadata,indent=2)+'\n')
print(json.dumps({'generated':len(metadata),'charts_each':11,'status':'Candidates require Lean validation'}))
