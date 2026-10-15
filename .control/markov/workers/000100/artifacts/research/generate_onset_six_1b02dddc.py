"""Machine-authored smaller offset-six proof using the checked base gap and a signed correction."""
from pathlib import Path
import json
from rational_third_bdee import P
from probe_shift_f2da221d import load
R=Path('/Users/sasha/math_gkm/research');O=R.parent/'evidence/markov-1b02dddc'
row=next(x for x in json.loads((O/'onset-candidates.json').read_text()) if x['chamber']==5 and x['k']==6)
terms=[]
for ks,v in load(row['gap']).items():
 if ks[2] or ks[3]:continue
 assert not any(ks[i] for i in range(1,8))
 terms.append(str(int(v))+(f'*x^{ks[0]}' if ks[0] else ''))
gap=' + '.join(terms)
header='''/-! Machine-authored 1b02dddc. Sixth onset position via a nonpositive correction. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
attribute [local irreducible] frame coeff
'''
end='end\nend MathGKM.Markov\n'
s='import MarkovOnsetValues5M1B\n'+header+f'''
theorem onset_six_exceptionM1B (n : ℤ) (hn : 7≤n) :
 onsetValue5_6M1B n 5 4*onsetValue5_8M1B n 5 4≤onsetValue5_7M1B n 5 4^2 := by
 let x := n-7
 have hx : 0≤x := by dsimp [x]; omega
 have he : n=x+7 := by dsimp [x]; ring
 rw [he]
 have hgap : onsetValue5_7M1B (x+7) 5 4^2-
   onsetValue5_6M1B (x+7) 5 4*onsetValue5_8M1B (x+7) 5 4={gap} := by
  unfold onsetValue5_6M1B onsetValue5_7M1B onsetValue5_8M1B
  unfold backShape5M94 onsetCorrection5_6M1B onsetCorrection5_7M1B onsetCorrection5_8M1B
  norm_num
  ring
 apply sub_nonneg.mp
 rw [hgap]
 positivity
'''+end
(R/'MarkovOnsetSixExceptionM1B.lean').write_text(s)
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
for ch,((a,b),(s,t)) in enumerate(zip(bounds,bounds[1:])):
 st=f'import MarkovOnsetSource{ch}M1B\nimport MarkovBackwardColumnsGap{ch}M94\nimport MarkovRawMatrix18\nimport MarkovOnsetSixExceptionM1B\n'+header
 hl=f'(hl : {a}*(frame rest).mid.b<{b}*(frame rest).mid.a)'
 hu=f'(hu : {t}*(frame rest).mid.a<{s}*(frame rest).mid.b)'
 st+=f'''\ntheorem source_fourth_onset_six{ch}M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) {hl} {hu}
 (i : ℕ) (hs : i+(3*n+6)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+8)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+6)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+7)^2 := by
 have h0 := source_fourth_onset_coeff{ch}_6M1B n rest hn hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff{ch}_7M1B n rest hn hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff{ch}_8M1B n rest hn hc hl hu i (by omega)
'''
 if ch==5:
  st+=''' by_cases hc6 : 6≤(frame rest).mid.b
 · skip
 · have hc5 : (frame rest).mid.b=5 := by omega
   have hr4 : (frame rest).mid.a=4 := by omega
   have he := onset_six_exceptionM1B (n:ℤ) (by omega)
   rw [hc5,hr4] at h0 h1 h2
   norm_num only [Nat.cast_ofNat] at h0 h1 h2
   rw [←h0,←h1,←h2] at he
   nlinarith only [he]
'''
  # Focus the surviving first branch. The all_goals trick is avoided: the next lines are in its scope.
  st=st.replace(' · skip\n · have hc5',' · \n · have hc5')
  # Lean bullet needs a tactic; use swap: handle the exceptional branch first.
  st=st.replace(' by_cases hc6 : 6≤(frame rest).mid.b\n · \n · have hc5', ' by_cases hc6 : 6≤(frame rest).mid.b\n swap\n · have hc5')
 if ch==4:
  st+=' have hc6 : 6≤(frame rest).mid.b := by omega\n'
 st+=f''' let x : ℤ := {s}*((frame rest).mid.b:ℤ)-{t}*((frame rest).mid.a:ℤ)-1
 let y : ℤ := {b}*((frame rest).mid.a:ℤ)-{a}*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : {b+t}+{t}*y+{b}*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : {a+s}+{s}*y+{a}*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have hb := back_columns_lc{ch}M94 x y ((n:ℤ)-6) hx hy (by omega)
 simp only [zero_mul,zero_add,add_zero,one_mul] at hb hcc hrr
 rw [hcc,hrr] at hb
 rw [show (n:ℤ)-6-1=(n:ℤ)-7 by ring,show (n:ℤ)-6-2=(n:ℤ)-8 by ring] at hb
 have hd : onsetCorrection{ch}_6M1B n (frame rest).mid.b (frame rest).mid.a≤0 := by
'''
 if ch<4:
  st+=f'  simp [onsetCorrection{ch}_6M1B]\n'
 else:
  st+=f'''  have hu0 : 0≤3*((frame rest).mid.a:ℤ)-2*((frame rest).mid.b:ℤ) := by omega
  have hr3 : 3≤((frame rest).mid.a:ℤ) := by omega
  have hp := mul_nonpos_of_nonneg_of_nonpos (show (0:ℤ)≤n by omega)
    (show 6-((frame rest).mid.b:ℤ)≤0 by omega)
  have hz : 3-((frame rest).mid.a:ℤ)+(n:ℤ)*(6-((frame rest).mid.b:ℤ))≤0 := by omega
  have ht := mul_nonpos_of_nonneg_of_nonpos
    (mul_nonneg (show (0:ℤ)≤30240 by norm_num) hu0) hz
  convert ht using 1 <;> unfold onsetCorrection{ch}_6M1B <;> push_cast <;> ring
'''
 st+=f''' have hn2 := raw_coeff_nonneg18 (List.replicate n true++false::rest) i (3*n+8)
 have hprod := mul_nonpos_of_nonpos_of_nonneg hd hn2
 unfold onsetValue{ch}_6M1B at h0
 unfold onsetValue{ch}_7M1B onsetCorrection{ch}_7M1B at h1
 unfold onsetValue{ch}_8M1B onsetCorrection{ch}_8M1B at h2
 simp only [add_zero] at h1 h2
 rw [←h1,←h2] at hb
 have he : backShape{ch}M94 (frame rest).mid.b (frame rest).mid.a ((n:ℤ)-6)=
   7560*coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+6)-
     onsetCorrection{ch}_6M1B n (frame rest).mid.b (frame rest).mid.a := by linarith only [h0]
 rw [he] at hb
 nlinarith only [hb,hprod]
'''
 (R/f'MarkovOnsetSixSource{ch}M1B.lean').write_text(st+end)
print('Generated signed-correction offset-six proof and its c=5,r=4 exception.')
