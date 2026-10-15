"""Machine-authored exhaustive natural parameter coverage for six Farey cones."""
from fourth_charts_5110b3fa import *
head='''/-! Machine-authored request 5110b3fa. Exhaustive natural parameter coverage. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false
'''
names=['(x:ℝ)','(y:ℝ)','q','t','u','v','w','z','xx','h']
s=''.join(f'import MarkovH4Chart{c[0].capitalize()}M511\n' for c in cones)+head
for name,al,be,ga,de in cones:
 ds=[d for d in charts if d['name']==name]
 d=ds[0]
 base=[p.subst([X-d['i'],Y-d['j'],poly(0),poly(0),poly(0),poly(0),poly(0),poly(0),poly(0),poly(0)]) for p in d['args']]
 args=' '.join('('+lean(p,names)+')' for p in base)
 s+=f'\ntheorem h4nat_{name}M511 (x y : ℕ) (ha : 3≤{al}*x+{be}*y)\n (hb : 9≤{ga}*x+{de}*y) (hab : {al}*x+{be}*y<{ga}*x+{de}*y) :\n H4GoodM511 {args} := by\n'
 s+=' have h : '+' ∨ '.join(f'({d["i"]}≤x ∧ {d["j"]}≤y)' for d in ds)+' := by omega\n'
 if len(ds)>1:s+=' rcases h with '+' | '.join('⟨hx,hy⟩' for d in ds)+'\n'
 else:s+=' obtain ⟨hx,hy⟩ := h\n'
 for d in ds:
  i,j=d['i'],d['j'];indent='   ' if len(ds)>1 else ' '
  s+=(' · ' if len(ds)>1 else ' ')+f'have ex : ((x-{i}:ℕ):ℝ)+{i}=x := by exact_mod_cast Nat.sub_add_cancel hx\n'
  s+=indent+f'have ey : ((y-{j}:ℕ):ℝ)+{j}=y := by exact_mod_cast Nat.sub_add_cancel hy\n'
  s+=indent+f'convert h4chart_{name}_{i}_{j}M511 ((x-{i}:ℕ):ℝ) ((y-{j}:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith\n'
s+='''
theorem h4boundsM511 (a b : ℕ) (ha : 3≤a) (hb : 9≤b) (hab : a<b) :
 H4GoodM511 a b (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ)
   (h4vM511 a b) (h4wM511 a b) (h4zM511 a b) := by
'''
regions=[('low','4*a≤b','a','b-4*a'),('quarter','3*a≤b','b-3*a','4*a-b'),('third','2*a≤b','b-2*a','3*a-b'),('half','3*a≤2*b','2*a-b','2*b-3*a'),('twothirds','4*a≤3*b','3*b-4*a','3*a-2*b'),('high',None,'b-a','4*a-3*b')]
for idx,(name,condition,xe,ye) in enumerate(regions):
 ind=' '* (1+2*idx)
 if condition:
  s+=ind+f'by_cases h{idx} : {condition}\n'+ind+'· '
 else:s+=ind[:-2]+'· ' if idx else ind
 # Instead of nested bullets use tactic first-case branches generated recursively below.
# Replace the draft suffix by a generated recursive block.
s=s[:s.index(' by_cases h0 : 4*a≤b',s.index('theorem h4boundsM511'))]
def branch(idx,indent):
 name,condition,xe,ye=regions[idx];cone=cones[idx];_,al,be,ga,de=cone
 d=next(d for d in charts if d['name']==name)
 base=[p.subst([X-d['i'],Y-d['j'],poly(0),poly(0),poly(0),poly(0),poly(0),poly(0),poly(0),poly(0)]) for p in d['args']]
 n_names=['x','y','q','t','u','v','w','z','xx','h']
 body=f'let x := {xe}\nlet y := {ye}\n'
 body+=f'have ea : a={al}*x+{be}*y := by dsimp [x,y]; omega\n'
 body+=f'have eb : b={ga}*x+{de}*y := by dsimp [x,y]; omega\n'
 orig=['2*a-b','min (b-a) (3*a-b)','3*a-2*b','h4vM511 a b','h4wM511 a b','h4zM511 a b']
 for j,(ori,pp) in enumerate(zip(orig,base[2:])):
  ex=lean(pp,n_names)
  body+=f'have e{j} : {ori}={ex} := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega\n' if j>=3 else f'have e{j} : {ori}={ex} := by dsimp [x,y]; omega\n'
 body+=f'have h := h4nat_{name}M511 x y (by omega) (by omega) (by omega)\n'
 body+='rw [e0,e1,e2,e3,e4,e5,ea,eb]\npush_cast\nconvert h using 1 <;> ring\n'
 if condition:
  out=indent+f'by_cases h{idx} : {condition}\n'+indent+'· '+body.replace('\n','\n'+indent+'  ').rstrip()+'\n'
  out+=indent+'· '+branch(idx+1,indent+'  ').lstrip()
  return out
 return indent+body.replace('\n','\n'+indent).rstrip()+'\n'
s+=branch(0,' ')
s+='end\nend MathGKM.Markov\n';(R/'research/MarkovHorizontalFourthBoundsM511.lean').write_text(s)
print('Generated exhaustive natural coverage')
