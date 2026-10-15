"""Machine-authored 897eabb3. Generate explicit Lean transport obligations.
Arithmetic and polynomial identities are checked by Lean, not this generator.
"""
from pathlib import Path
chambers=[
 ('0*r<1*c','4*r<1*c','0','0','0','0'),
 ('1*c<4*r','3*r<1*c','0','0','0','4*r-c'),
 ('1*c<3*r','2*r<1*c','0','3*r-c','0','c-2*r'),
 ('1*c<2*r','3*r<2*c','2*r-c','c-r','0','2*r-c'),
 ('2*c<3*r','4*r<3*c','2*r-c','c-r','3*r-2*c','c-r'),
 ('3*c<4*r','1*r<1*c','2*r-c','c-r','3*r-2*c','c-r')]
s='''import MarkovFourthMoment897
import MarkovFourthConditional01F
/-! Machine-authored 897eabb3. The six previously conditional fourth-slice
inequalities are now transported using a proved source moment. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false
'''
for z,(lo,hi,q,t,u,m) in enumerate(chambers):
 s+=f'''\ntheorem fourth_chamber_moment_{z}897 (c r : ℕ)
 (hc : 0<r) (hr : r<c) (hl : {lo}) (hu : {hi}) :
 fullFourthMoment897 (X:ℤ[X]) c r=fourthLowMoment{z}01F c r := by
'''
 ns=['2*r-c','min (c-r) (3*r-c)','3*r-2*c',('min (c-2*r) (4*r-c)' if z<3 else ('2*r-c' if z==3 else 'c-r'))]
 for name,nat,expr in zip(['q','t','u','m'],ns,[q,t,u,m]):
  expr=expr.replace('r','(r:ℤ)').replace('c','(c:ℤ)')
  s+=f''' have h{name}i : (({nat}:ℕ):ℤ)={expr} := by omega
 have h{name} : (({nat}:ℕ):ℤ[X])=C ({expr}) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) h{name}i
'''
 if z==5:
  s+=''' have hvi : ((4*r-3*c:ℕ):ℤ)=4*(r:ℤ)-3*(c:ℤ) := by omega
 have hv : ((4*r-3*c:ℕ):ℤ[X])=C (4*(r:ℤ)-3*(c:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hvi
'''
 s+=' unfold fullFourthMoment897 fourSourceMoment897\n'
 if z<3:s+=' rw [if_pos (by omega : 2*r≤c)]\n'
 elif z==3:s+=' rw [if_neg (by omega : ¬2*r≤c),if_pos (by omega : 3*r≤2*c)]\n'
 elif z==4:s+=' rw [if_neg (by omega : ¬2*r≤c),if_neg (by omega : ¬3*r≤2*c),if_pos (by omega : 4*r≤3*c)]\n'
 else:s+=' rw [if_neg (by omega : ¬2*r≤c),if_neg (by omega : ¬3*r≤2*c),if_neg (by omega : ¬4*r≤3*c)]\n'
 s+=' simp only [hq,ht,hu,hm'+(',hv' if z==5 else '')+']\n'
 s+=f' simp [boolMomentADB2,boolJetADB2,fourthTriple897,fourthQuad897,fourthConstant897,bit6905,fourthLowMoment{z}01F] <;> ring\n'
 # Source hypotheses must match original conditional declarations exactly.
 source_lo=['0*c<1*r','1*c<4*r','1*c<3*r','1*c<2*r','2*c<3*r','3*c<4*r'][z]
 slo=source_lo.replace('c','(frame rest).mid.b').replace('r','(frame rest).mid.a')
 shi=hi.replace('c','(frame rest).mid.b').replace('r','(frame rest).mid.a')
 # replacement above is safe because replacements only affect original tokens.
 def src(x):
  import re
  return re.sub(r'\b[cr]\b',lambda m:'(frame rest).mid.'+('b' if m[0]=='c' else 'a'),x)
 slo=src(source_lo);shi=src(hi)
 s+=f'''\ntheorem source_fourth_chamber_{z}897 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : {slo}) (hu : {shi}) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hM := source_fourth_moment897 rest hc
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 rw [fourth_chamber_moment_{z}897 _ _ hr hrc (by omega) (by omega)] at hM
 exact source_fourth_chamber_{z}01F rest hc hl hu hM i j hs
'''
s+='\nend\nend MathGKM.Markov\n'
Path('research/MarkovFourthChambers897.lean').write_text(s)
