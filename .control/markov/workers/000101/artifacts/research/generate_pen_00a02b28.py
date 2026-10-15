"""Machine-authored 00a02b28. Exact reflected falling-factorial bridge."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
header='''/-! Machine-authored live request 00a02b28. Exact middle-slice extraction, not LC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
'''
end='end\nend MathGKM.Markov\n'
s='import MarkovPenultimateM1B\n'+header
s+='\ndef penFallingM00 (n c r q t u e : ℤ) : ℤ :=\n '+ ' + '.join(f'penPart{k}M1B n c r q t u*fallingSevenK0B (e+7-{k})' for k in range(11))+'\n'
s+='''
theorem pen_convolutionM00 (n c r q t u : ℤ) (j : ℕ) (hj : 3≤j) :
 5040*convSevenK0B (penPolyM1B n c r q t u) j=penFallingM00 n c r q t u j := by
 unfold penPolyM1B penFallingM00
 simp only [convSeven_addK0B,convSeven_monomialK0B]
'''
for k in range(11):s+=f' have h{k} := chooseShiftSeven_fallingK0B j {k} (by omega)\n norm_num only [Nat.cast_ofNat] at h{k}\n'
s+=' linear_combination '+ '+'.join(f'penPart{k}M1B n c r q t u*h{k}' for k in range(11))+'\n'
(R/'MarkovPenFallingM00.lean').write_text(s+end)
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
qs=['0','0','0','2*r-c','2*r-c','2*r-c']
ts=['0','0','3*r-c','c-r','c-r','c-r']
us=['0','0','0','0','3*r-2*c','3*r-2*c']
for ch in range(6):
 (a,b),(d,e)=bounds[ch:ch+2]
 s=f'import MarkovOnsetSource{ch}M1B\nimport MarkovPenFallingM00\n'+header
 s+='attribute [local irreducible] frame coeff penFallingM00\n'
 s+=f'''\ndef middleValue{ch}M00 (n c r j : ℤ) : ℤ :=
 16*backShape{ch}M94 c r (4*n-j)+penFallingM00 n c r ({qs[ch]}) ({ts[ch]}) ({us[ch]}) (3*n+6-j)

theorem source_fourth_middle_value{ch}M00 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : {a}*(frame rest).mid.b<{b}*(frame rest).mid.a)
 (hu : {e}*(frame rest).mid.a<{d}*(frame rest).mid.b)
 (i j : ℕ) (hj : 2*n+6≤j) (hju : j≤3*n+3)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 middleValue{ch}M00 n (frame rest).mid.b (frame rest).mid.a j := by
 have h := source_fourth_backward_twoM1B n rest hc i j hj (by omega) hs
 have hsplit := tail_top_source_split{ch}M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect{ch}M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution{ch}M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-j) (by omega)
 have he : ((4*n+7-j:ℕ):ℤ)-7=4*(n:ℤ)-j := by omega
 rw [he] at ht
 rw [if_pos (by omega : j≤3*n+6),pen_source{ch}M1B n _ _ hl hu] at h
 have hp := pen_convolutionM00 (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  ({qs[ch].replace('r','((frame rest).mid.a:ℤ)').replace('c','((frame rest).mid.b:ℤ)')})
  ({ts[ch].replace('r','((frame rest).mid.a:ℤ)').replace('c','((frame rest).mid.b:ℤ)')})
  ({us[ch].replace('r','((frame rest).mid.a:ℤ)').replace('c','((frame rest).mid.b:ℤ)')}) (3*n+6-j) (by omega)
 have he2 : ((3*n+6-j:ℕ):ℤ)=3*(n:ℤ)+6-j := by omega
 rw [he2] at hp
 unfold middleValue{ch}M00
 linear_combination 5040*h+16*ht+hp
'''
 (R/f'MarkovMiddleValue{ch}M00.lean').write_text(s+end)
print('Generated generic penultimate convolution bridge and six middle value source adapters.')
