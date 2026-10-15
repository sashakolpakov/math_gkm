"""Machine-authored exhaustive natural-parameter coverage of the seed charts."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
head='''import MarkovHorizontalChartsM13D
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
'''
s=head
groups={'midlow':[(0,4),(1,2),(2,1),(3,0)],'midhigh':[(0,4),(1,2),(2,1),(3,0)],'high':[(1,4),(2,1),(3,0)]}
expr={'midlow':'((x:ℝ)+y) (3*(x:ℝ)+2*y) 0 y 0','midhigh':'(2*(x:ℝ)+y) (3*(x:ℝ)+2*y) x ((x:ℝ)+y) 0','high':'(2*(x:ℝ)+y) (3*(x:ℝ)+y) ((x:ℝ)+y) x y'}
for name,corners in groups.items():
 for i,j in corners:
  s+=f'''\ntheorem h3nat_{name}_{i}_{j}M13D (x y : ℕ) (hx : {i}≤x) (hy : {j}≤y) :
 H3BoundsM13D {expr[name]} := by
 have ex : ((x-{i}:ℕ):ℝ)+{i}=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-{j}:ℕ):ℝ)+{j}=y := by exact_mod_cast Nat.sub_add_cancel hy
 simpa only [ex,ey] using h3chart_{name}_{i}_{j}M13D ((x-{i}:ℕ):ℝ) ((y-{j}:ℕ):ℝ) (by positivity) (by positivity)
'''
 forpart='7≤3*x+y' if name=='high' else '7≤3*x+2*y'
 hyps='(hx : 1≤x) ' if name=='high' else ''
 s+=f'\ntheorem h3nat_{name}M13D (x y : ℕ) {hyps}(hb : {forpart}) :\n H3BoundsM13D {expr[name]} := by\n'
 disj=' ∨ '.join(f'({i}≤x ∧ {j}≤y)' for i,j in corners)
 s+=f' have h : {disj} := by omega\n rcases h with '+' | '.join('⟨hx,hy⟩' for _ in corners)+'\n'
 for i,j in corners:s+=f' · exact h3nat_{name}_{i}_{j}M13D x y hx hy\n'
s+='''
theorem h3boundsM13D (a b : ℕ) (ha : 2≤a) (hb : 7≤b) (hab : a<b) :
 H3BoundsM13D a b (2*a-b:ℕ)
   (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 by_cases h0 : 3*a≤b
 · have hq : 2*a-b=0 := by omega
   have ht : min (b-a) (3*a-b)=0 := by omega
   have hu : 3*a-2*b=0 := by omega
   rw [hq,ht,hu]
   norm_num only [Nat.cast_zero]
   by_cases he : a=2
   · subst a
     have eb : 3*(2+((0:ℕ):ℝ)) + (((b-7:ℕ):ℝ)+1)=b := by
       have h : ((b-7:ℕ):ℝ)+7=b := by exact_mod_cast Nat.sub_add_cancel hb
       linarith
     simpa only [eb,Nat.cast_zero,zero_add,add_zero] using
       h3chart_low_0_1M13D 0 ((b-7:ℕ):ℝ) (by norm_num) (by positivity)
   · have ha3 : 3≤a := by omega
     have ea : 2+(((a-3:ℕ):ℝ)+1)=a := by
       have h : ((a-3:ℕ):ℝ)+3=a := by exact_mod_cast Nat.sub_add_cancel ha3
       linarith
     have eb : 3*(a:ℝ)+(((b-3*a:ℕ):ℝ)+0)=b := by
       have h : ((b-3*a:ℕ):ℝ)+3*a=b := by exact_mod_cast Nat.sub_add_cancel h0
       linarith
     simpa only [ea,eb] using
       h3chart_low_1_0M13D ((a-3:ℕ):ℝ) ((b-3*a:ℕ):ℝ) (by positivity) (by positivity)
 · by_cases h1 : 2*a≤b
   · let x := b-2*a
     let y := 3*a-b
     have ea : a=x+y := by dsimp [x,y]; omega
     have eb : b=3*x+2*y := by dsimp [x,y]; omega
     have eq : 2*a-b=0 := by omega
     have et : min (b-a) (3*a-b)=y := by dsimp [y]; omega
     have eu : 3*a-2*b=0 := by omega
     have h := h3nat_midlowM13D x y (by omega)
     rw [eq,et,eu,ea,eb]
     push_cast
     exact h
   · by_cases h2 : 3*a≤2*b
     · let x := 2*a-b
       let y := 2*b-3*a
       have ea : a=2*x+y := by dsimp [x,y]; omega
       have eb : b=3*x+2*y := by dsimp [x,y]; omega
       have eq : 2*a-b=x := rfl
       have et : min (b-a) (3*a-b)=x+y := by dsimp [x,y]; omega
       have eu : 3*a-2*b=0 := by omega
       have h := h3nat_midhighM13D x y (by omega)
       rw [eq,et,eu,ea,eb]
       push_cast
       exact h
     · let x := b-a
       let y := 3*a-2*b
       have ea : a=2*x+y := by dsimp [x,y]; omega
       have eb : b=3*x+y := by dsimp [x,y]; omega
       have eq : 2*a-b=x+y := by dsimp [x,y]; omega
       have et : min (b-a) (3*a-b)=x := by dsimp [x,y]; omega
       have eu : 3*a-2*b=y := rfl
       have h := h3nat_highM13D x y (by dsimp [x]; omega) (by omega)
       rw [eq,et,eu,ea,eb]
       push_cast
       exact h
end
end MathGKM.Markov
'''
(R/'research/MarkovHorizontalBoundsM13D.lean').write_text(s)
