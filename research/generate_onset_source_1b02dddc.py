"""Machine-authored adapters from the actual source recurrence to onset algebra."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
header='''/-! Machine-authored 1b02dddc. Exact source onset transport. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff fullH3FA fullH4FA
'''
end='end\nend MathGKM.Markov\n'
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
pars=[('0','0','0'),('0','0','0'),('0','3*r-c','0'),('2*r-c','c-r','0'),('2*r-c','c-r','3*r-2*c'),('2*r-c','c-r','3*r-2*c')]
for ch,((a,b),(s,t)) in enumerate(zip(bounds,bounds[1:])):
 q,tt,u=pars[ch]
 nat=['(2*r-c:ℕ)','(min (c-r) (3*r-c):ℕ)','(3*r-2*c:ℕ)']
 # At integer type the natural inputs must be cast before subtraction.
 ip=lambda v:v.replace('r','(r:ℤ)').replace('c','(c:ℤ)')
 st=f'import MarkovOnsetValues{ch}M1B\nimport MarkovBackwardTwoSourceM1B\n'+header
 st+=f'''\ntheorem pen_source{ch}M1B (n c r : ℕ)
 (hl : {a}*c<{b}*r) (hu : {t}*r<{s}*c) :
 reflect 14 (fullH3FA (n:ℤ[X]) c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) X)=
 penPolyM1B n c r ({ip(q)}) ({ip(tt)}) ({ip(u)}) := by
 have hp := pen_reflectM1B (n:ℤ) (c:ℤ) (r:ℤ)
   ({nat[0]}:ℤ) ({nat[1]}:ℤ) ({nat[2]}:ℤ)
 simp only [Int.cast_natCast] at hp
'''
 for z,(v,target) in enumerate(zip(nat,[q,tt,u])):
  st+=f' have hi{z} : ({v}:ℤ)={ip(target)} := by omega\n'
 st+=' rw [hi0,hi1,hi2] at hp\n exact hp\n'
 hl=f'(hl : {a}*(frame rest).mid.b<{b}*(frame rest).mid.a)'
 hu=f'(hu : {t}*(frame rest).mid.a<{s}*(frame rest).mid.b)'
 for k in range(1,9):
  st+=f'''\ntheorem source_fourth_onset_coeff{ch}_{k}M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) {hl} {hu}
 (i : ℕ) (hs : i+(3*n+{k})=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+{k})=
 onsetValue{ch}_{k}M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+{k}) (by omega) (by omega) hs
 have hsplit := tail_top_source_split{ch}M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect{ch}M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution{ch}M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+{k})) (by omega)
 have he : ((4*n+7-(3*n+{k}):ℕ):ℤ)-7=(n:ℤ)-{k} := by omega
 rw [he] at ht
'''
  if k<=6:
   st+=f''' rw [if_pos (by omega : 3*n+{k}≤3*n+6),show 3*n+6-(3*n+{k})={6-k} by omega,
   pen_source{ch}M1B n _ _ hl hu] at h
 have hp := pen_conv{k}M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
'''
   rp=lambda v:v.replace('r','((frame rest).mid.a:ℤ)').replace('c','((frame rest).mid.b:ℤ)')
   st+=f'  ({rp(q)}) ({rp(tt)}) ({rp(u)})\n'
   st+=f' rw [onsetCorrection{ch}_{k}_eqM1B] at hp\n unfold onsetValue{ch}_{k}M1B\n linear_combination 315*h+ht+hp\n'
  else:
   st+=f''' rw [if_neg (by omega : ¬3*n+{k}≤3*n+6),add_zero] at h
 unfold onsetValue{ch}_{k}M1B onsetCorrection{ch}_{k}M1B
 linear_combination 315*h+ht
'''
 (R/f'MarkovOnsetSource{ch}M1B.lean').write_text(st+end)
 st=''.join(f'import MarkovOnsetColumns{ch}_{k}M1B\n' for k in range(1,7))+f'import MarkovOnsetSource{ch}M1B\n'+header
 for k in range(1,7):
  st+=f'''\ntheorem source_fourth_onset{ch}_{k}M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) {hl} {hu}
 (i : ℕ) (hs : i+(3*n+{k})+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+{k}+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+{k})≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+{k}+1)^2 := by
 let x : ℤ := {s}*((frame rest).mid.b:ℤ)-{t}*((frame rest).mid.a:ℤ)-1
 let y : ℤ := {b}*((frame rest).mid.a:ℤ)-{a}*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : {b+t}+{t}*y+{b}*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : {a+s}+{s}*y+{a}*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := onset_columns_lc{ch}_{k}M1B ((n:ℤ)-7) x y (by omega) hx hy
 simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr
 rw [hcc,hrr,show (n:ℤ)-7+7=n by ring] at h
 have h0 := source_fourth_onset_coeff{ch}_{k}M1B n rest hn hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff{ch}_{k+1}M1B n rest hn hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff{ch}_{k+2}M1B n rest hn hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 have he1 : 3*n+{k}+1=3*n+{k+1} := by omega
 have he2 : 3*n+{k}+2=3*n+{k+2} := by omega
 rw [he1,he2]
 nlinarith only [h]
'''
 (R/f'MarkovOnsetAdapter{ch}M1B.lean').write_text(st+end)
print('Generated six source and six inequality adapters; not yet checked.')
