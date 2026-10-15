"""Machine-authored split exact ring certificates for an auxiliary polynomial.
No claim that the candidate is already identified with source coefficients.
"""
from pathlib import Path
import json
from uniform_shape_8bbb import Q,var,subst,horner
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-07f1d410'
old=json.loads((R/'evidence/markov-8bbb934e/uniform-shape.json').read_text())
p=Q({tuple(k):v for k,v in old['coefficient_terms']})
t,s,u,v=map(var,range(4));parts={}
for which,j in [('L',t+4),('C',t+5),('R',t+6)]:
 poly=subst(p,[t+s+5,u+v+2,u+1,j])
 for k in range(4):parts[which,k]=Q({(a,0,c,d):val for (a,b,c,d),val in poly.items() if b==k})
header='''namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 8192
set_option linter.unusedVariables false
'''
src='import MarkovShapePartsBDEE\n/-! Machine-authored bdee9a64. Auxiliary candidate only; source coefficient identity not assumed. -/\n'+header
# Existing shape definition is imported.
for (w,k),a in parts.items():src+=f'def shape{w}{k}07F1 (t u v : ℤ) : ℤ :=\n '+horner(a,['t','s','u','v'])+'\n'
def part(w,k):return f'shape{w}{k}07F1 t u v'
def sumexpr(w):return '+'.join(f'({part(w,k)})*s^{k}' for k in range(4))
gaps=[]
for k in range(7):
 pairs=[(i,k-i) for i in range(4) if 0<=k-i<4]
 g=Q()
 terms=[]
 for i,j in pairs:
  g=g+parts['C',i]*parts['C',j]-parts['L',i]*parts['R',j]
  terms.append(f'({part("C",i)})*({part("C",j)})-({part("L",i)})*({part("R",j)})')
 assert all(v>=0 for v in g.values())
 gaps.append(g)
 src+=f'def shapeGap{k}07F1 (t u v : ℤ) : ℤ :=\n '+'+ '.join('('+z+')' for z in terms)+'\n'
for w,j in [('L',4),('C',5),('R',6)]:
 src+=f'''theorem shape_expand_{w}07F1 (t s u v : ℤ) :
 thirdShapeBDEE (t+s+5) (u+v+2) (u+1) (t+{j})={sumexpr(w)} := by
 unfold thirdShapeBDEE {' '.join(f'shape{w}{k}07F1' for k in range(4))}
 ring
'''
src+='end\nend MathGKM.Markov\n'
(R/'research/MarkovShapeParts07F1.lean').write_text(src.replace("≤"," ≤ "))
for k,g in enumerate(gaps):
 used=[f'shape{w}{i}07F1' for w in 'LCR' for i in range(4) if 0<=k-i<4]
 expr=horner(g,['t','s','u','v'])
 src='import MarkovShapeParts07F1\n'+header+f'''theorem shape_gap_{k}_nonneg07F1 (t u v : ℤ) (ht : 0≤t) (hu : 0≤u) (hv : 0≤v) :
 0≤shapeGap{k}07F1 t u v := by
 have he : shapeGap{k}07F1 t u v={expr} := by
   unfold shapeGap{k}07F1 {' '.join(used)}
   ring
 rw [he]
 positivity
#print axioms shape_gap_{k}_nonneg07F1
end
end MathGKM.Markov
'''
 (R/f'research/MarkovShapeGap{k}07F1.lean').write_text(src.replace("≤"," ≤ "))
src=''.join(f'import MarkovShapeGap{k}07F1\n' for k in range(7))+header
src+='''theorem thirdShape_shift_lc07F1 (t s u v : ℤ)
 (ht : 0≤t) (hs : 0≤s) (hu : 0≤u) (hv : 0≤v) :
 thirdShapeBDEE (t+s+5) (u+v+2) (u+1) (t+4)*
 thirdShapeBDEE (t+s+5) (u+v+2) (u+1) (t+6)≤
 (thirdShapeBDEE (t+s+5) (u+v+2) (u+1) (t+5))^2 := by
 rw [shape_expand_L07F1,shape_expand_R07F1,shape_expand_C07F1]
'''
for k in range(7):src+=f' have h{k} := shape_gap_{k}_nonneg07F1 t u v ht hu hv\n'
summ='+'.join(f'(shapeGap{k}07F1 t u v)*s^{k}' for k in range(7))
src+=f''' have he : ({sumexpr('C')})^2-({sumexpr('L')})*({sumexpr('R')})={summ} := by
   unfold {' '.join(f'shapeGap{k}07F1' for k in range(7))}
   ring
 have hp : 0≤{summ} := by positivity
 omega
theorem thirdShape_lc07F1 (n c r j : ℤ) (hr : 1≤r) (hc : r+1≤c)
 (hj : 5≤j) (hn : j≤n) :
 thirdShapeBDEE n c r (j-1)*thirdShapeBDEE n c r (j+1)≤(thirdShapeBDEE n c r j)^2 := by
 have h := thirdShape_shift_lc07F1 (j-5) (n-j) (r-1) (c-r-1)
   (by omega) (by omega) (by omega) (by omega)
 have h0 : j-5+(n-j)+5=n := by ring
 have h1 : r-1+(c-r-1)+2=c := by ring
 have h2 : r-1+1=r := by ring
 have h3 : j-5+4=j-1 := by ring
 have h4 : j-5+5=j := by ring
 have h5 : j-5+6=j+1 := by ring
 simpa only [h0,h1,h2,h3,h4,h5] using h
#print axioms thirdShape_lc07F1
end
end MathGKM.Markov
'''
(R/'research/MarkovShapeLC07F1.lean').write_text(src.replace("≤"," ≤ "))
(O/'split-gap-certificates.json').write_text(json.dumps(dict(status='Ring certificates generated; acceptance requires separate Lean validation',terms_by_s=[len(g) for g in gaps],total=sum(map(len,gaps)),source_formula='Not proved; auxiliary polynomial only'),indent=2)+'\n')
print([len(g) for g in gaps])
