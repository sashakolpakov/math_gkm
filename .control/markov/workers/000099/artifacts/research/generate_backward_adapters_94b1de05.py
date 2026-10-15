"""Machine-authored actual-source third-block adapters and exact range assembly."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
head='''/-! Machine-authored 94b1de05. Actual-source backwards third-block inequality. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
end='end\nend MathGKM.Markov\n'
for ch,((p,q),(s,t)) in enumerate(zip(bounds,bounds[1:])):
 bs=f'backShape{ch}M94';bp=f'backPoly{ch}M94'
 lo=f'{p}*(frame rest).mid.b<{q}*(frame rest).mid.a'
 up=f'{t}*(frame rest).mid.a<{s}*(frame rest).mid.b'
 st=f'import MarkovBackwardColumnsGap{ch}M94\nimport MarkovBackwardSourceM94\n'+head
 st+=f'attribute [local irreducible] {bs} {bp} fullH4FA coeff frame\n'
 st+=f'''theorem source_fourth_backward_coeff{ch}M94 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : {lo}) (hu : {up})
 (i j : ℕ) (hj : 3*n+7≤j) (hju : j≤4*n+4)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 {bs} (frame rest).mid.b (frame rest).mid.a (4*(n:ℤ)-j) := by
 have h := source_fourth_backwardM94 n rest hc i j hj (by omega) hs
 have hsplit := tail_top_source_split{ch}M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect{ch}M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 change 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
  convSevenK0B ({bp} (frame rest).mid.b (frame rest).mid.a) (4*n+7-j) at h
 have ht := back_convolution{ch}M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-j) (by omega)
 have he : ((4*n+7-j:ℕ):ℤ)-7=4*(n:ℤ)-(j:ℤ) := by omega
 rw [he,←h] at ht
 nlinarith only [ht]

theorem source_fourth_third_chamber{ch}M94 (n k : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : {lo}) (hu : {up})
 (i : ℕ) (hk : 7≤k) (hkn : k≤n)
 (hs : i+(3*n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+k)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+k+1)^2 := by
 let x : ℤ := {s}*((frame rest).mid.b:ℤ)-{t}*((frame rest).mid.a:ℤ)-1
 let y : ℤ := {q}*((frame rest).mid.a:ℤ)-{p}*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : {q+t}+{t}*y+{q}*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : {p+s}+{s}*y+{p}*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := back_columns_lc{ch}M94 x y ((n:ℤ)-k) hx hy (by omega)
 try simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr
 rw [hcc,hrr] at h
 have h0 := source_fourth_backward_coeff{ch}M94 n rest hc hl hu (i+2) (3*n+k)
  (by omega) (by omega) (by omega)
 have h1 := source_fourth_backward_coeff{ch}M94 n rest hc hl hu (i+1) (3*n+k+1)
  (by omega) (by omega) (by omega)
 have h2 := source_fourth_backward_coeff{ch}M94 n rest hc hl hu i (3*n+k+2)
  (by omega) (by omega) (by omega)
 have he0 : 4*(n:ℤ)-(3*n+k:ℕ)=(n:ℤ)-k := by push_cast; ring
 have he1 : 4*(n:ℤ)-(3*n+k+1:ℕ)=(n:ℤ)-k-1 := by push_cast; ring
 have he2 : 4*(n:ℤ)-(3*n+k+2:ℕ)=(n:ℤ)-k-2 := by push_cast; ring
 rw [he0] at h0
 rw [he1] at h1
 rw [he2] at h2
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
'''
 (R/f'MarkovBackwardAdapter{ch}M94.lean').write_text(st+end)
s=(R/'MarkovTailAllM94.lean').read_text()
for ch in range(6):s=s.replace(f'MarkovTailSource{ch}M94',f'MarkovBackwardAdapter{ch}M94').replace(f'source_fourth_tail_chamber{ch}M94',f'source_fourth_third_chamber{ch}M94')
s=s.replace('source_fourth_tailM94','source_fourth_thirdM94').replace('(hn : 7≤n+k) ','').replace('(hk : k≤5)','(hk : 7≤k) (hkn : k≤n)').replace('4*n+k','3*n+k').replace('n k rest hn hc','n k rest hc').replace('i hk hs','i hk hkn hs')
(R/'MarkovBackwardAllM94.lean').write_text(s)
