"""Machine-authored exact terminal-A certificates; Lean checks every identity."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-263d8c71'
head='''import Mathlib
/-! Machine-authored 263d8c71. Terminal-A raw compensation certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
'''
defs='''
def terminalHM263 (k l m t r : ℝ) : ℝ :=
 4*t*l*(l-1)*(l-2)+(9*m^2+7*m+2-4*r)*k*l*(l-1)+
 (6*m^2+6*m*(k+l)+4*(k+l))*k*(k-1)*l+
 (m+k+l)*(m+k+l+1)*k*(k-1)*(k-2)
def terminalGapM263 (k l m t r : ℝ) : ℝ :=
 (k+1)*(l+1)*terminalHM263 k l m t r^2-
 k*l*terminalHM263 (k-1) (l+1) m t r*terminalHM263 (k+1) (l-1) m t r
def terminalMixedM263 (k l m r : ℝ) : ℝ :=
 (k+1)*(l+1)*2*terminalHM263 k l m 0 r*terminalHM263 k l m (2*m-r) r-
 k*l*(terminalHM263 (k-1) (l+1) m 0 r*terminalHM263 (k+1) (l-1) m (2*m-r) r+
 terminalHM263 (k-1) (l+1) m (2*m-r) r*terminalHM263 (k+1) (l-1) m 0 r)
theorem terminal_bernsteinM263 (k l m t r : ℝ) :
 (2*m-r)^2*terminalGapM263 k l m t r=
 (2*m-r-t)^2*terminalGapM263 k l m 0 r+
 t*(2*m-r-t)*terminalMixedM263 k l m r+t^2*terminalGapM263 k l m (2*m-r) r := by
 unfold terminalGapM263 terminalMixedM263 terminalHM263
 ring
'''
(R/'research/MarkovTerminalGapDefsM263.lean').write_text(head+defs+'\nend\nend MathGKM.Markov\n')
mods=[]
for r in [0,1]:
 for kn,ke in [('One','1'),('Two','2'),('Large','(x+3)')]:
  for ln,le in [('One','1'),('Two','2'),('Large','(y+3)')]:
   if kn==ln=='One':continue
   name=f'MarkovTerminalGap{r}{kn}{ln}M263';mods.append(name)
   src=head.replace('import Mathlib','import MarkovTerminalGapDefsM263')
   for gn,ge in [('zero',f'terminalGapM263 {ke} {le} (z+1) 0 {r}'),('end',f'terminalGapM263 {ke} {le} (z+1) (2*(z+1)-{r}) {r}'),('mixed',f'terminalMixedM263 {ke} {le} (z+1) {r}')]:
    src+=f'''\ntheorem terminal_{r}_{kn.lower()}_{ln.lower()}_{gn}M263 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) : 0 ≤ {ge} := by
 simp only [terminalGapM263,terminalMixedM263,terminalHM263]
 ring_nf
 positivity
'''
   src+='\nend\nend MathGKM.Markov\n';(R/f'research/{name}.lean').write_text(src)
src='\n'.join('import '+m for m in mods)+head[head.index('\n/-!'):]
for r in [0,1]:
 src+=f'''\ntheorem terminal_endpoints{r}M263 (i j : ℕ) (m : ℝ) (hm : 1 ≤ m) (hs : 1 ≤ i+j) :
 0 ≤ terminalGapM263 (i+1) (j+1) m 0 {r} ∧
 0 ≤ terminalGapM263 (i+1) (j+1) m (2*m-{r}) {r} ∧
 0 ≤ terminalMixedM263 (i+1) (j+1) m {r} := by
 have hz : 0 ≤ m-1 := by linarith
 rcases i with _ | (_ | i) <;> rcases j with _ | (_ | j)
 · omega
'''
 for kn in ['one','two','large']:
  for ln in ['one','two','large']:
   if kn==ln=='one':continue
   src+=' · refine ⟨?_,?_,?_⟩\n'
   for gn in ['zero','end','mixed']:
    src+=f'''   · have h := terminal_{r}_{kn}_{ln}_{gn}M263 {'i' if kn=='large' else '0'} {'j' if ln=='large' else '0'} (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
'''
src+='''
theorem terminal_gap_nonnegM263 (i j : ℕ) (m t r : ℝ)
 (hm : 1 ≤ m) (ht : 0 ≤ t) (htm : t+r ≤ 2*m) (hr : r=0 ∨ r=1)
 (hs : 1 ≤ i+j) : 0 ≤ terminalGapM263 (i+1) (j+1) m t r := by
 have hs' : 0 ≤ terminalGapM263 (i+1) (j+1) m 0 r ∧
   0 ≤ terminalGapM263 (i+1) (j+1) m (2*m-r) r ∧
   0 ≤ terminalMixedM263 (i+1) (j+1) m r := by
   rcases hr with rfl | rfl
   · simpa using terminal_endpoints0M263 i j m hm hs
   · exact terminal_endpoints1M263 i j m hm hs
 obtain ⟨h0,h2,hb⟩ := hs'
 have he := terminal_bernsteinM263 (i+1) (j+1) m t r
 have hr1 : r ≤ 1 := by rcases hr with rfl | rfl <;> norm_num
 have hpos : 0 < (2*m-r)^2 := sq_pos_of_pos (by linarith)
 have hd : 0 ≤ 2*m-r-t := by linarith
 have hnon : 0 ≤ (2*m-r-t)^2*terminalGapM263 (i+1) (j+1) m 0 r+
   t*(2*m-r-t)*terminalMixedM263 (i+1) (j+1) m r+
   t^2*terminalGapM263 (i+1) (j+1) m (2*m-r) r := by positivity
 rw [←he] at hnon
 exact (mul_nonneg_iff_of_pos_left hpos).mp hnon
end
end MathGKM.Markov
'''
(R/'research/MarkovTerminalGapM263.lean').write_text(src)
(O/'terminal-generated.json').write_text(json.dumps({'modules':mods},indent=2)+'\n')
for a,b in [('validate_f52ba141.py','validate_263d8c71.py'),('ReplayIsolatedMF52.lean','ReplayIsolatedM263.lean'),('audit_f52ba141.py','audit_263d8c71.py')]:
 (R/'research'/b).write_text((R/'research'/a).read_text().replace('f52ba141','263d8c71').replace('MF52','M263'))
print(json.dumps({'modules':mods}))
