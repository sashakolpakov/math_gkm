"""Machine-authored chamber discharge and source composition."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
s=''.join(f'import MarkovCrossTail{name}53D\n' for name in ['LowLarge','LowOne','HighLarge','HighOne'])+'namespace MathGKM.Markov\nnoncomputable section\n'
for off in range(1,5):
 for ch in ['low','high']:
  q='0' if ch=='low' else '(2*r-c)';cond='2*r ≤ c' if ch=='low' else 'c ≤ 2*r'
  s+=f'''theorem cross_tail_{ch}{off}53D (n c r : ℤ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hch : {cond}) :
 crossTail{off}53D n c r {q}*crossTail{off+2}53D n c r {q} ≤
 (crossTail{off+1}53D n c r {q})^2 := by
'''
  if ch=='low':
   s+=f''' by_cases h : r=1
 · subst r
   have hh := cross_tail_gap_LowOne{off}53D (n-5) 0 (c-4) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := cross_tail_gap_LowLarge{off}53D (n-5) (r-2) (c-2*r) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
'''
  else:
   s+=f''' by_cases h : c-r=1
 · have hh := cross_tail_gap_HighOne{off}53D (n-5) (c-4) 0 (by omega) (by omega) (by omega)
   have he : r=c-1 := by omega
   rw [he]
   convert hh using 1 <;> congr 2 <;> ring
 · have hh := cross_tail_gap_HighLarge{off}53D (n-5) (2*r-c) (c-r-2) (by omega) (by omega) (by omega)
   convert hh using 1 <;> congr 2 <;> ring
'''
 s+=f'''theorem cross_tail_raw{off}53D (n c r : ℕ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) :
 (thirdRunPolyADB2 n c r).coeff (2*n+{off})*(thirdRunPolyADB2 n c r).coeff (2*n+{off+2}) ≤
 ((thirdRunPolyADB2 n c r).coeff (2*n+{off+1}))^2 := by
 have h : crossTail{off}53D n c r (2*r-c:ℕ)*crossTail{off+2}53D n c r (2*r-c:ℕ) ≤
   (crossTail{off+1}53D n c r (2*r-c:ℕ))^2 := by
  by_cases hch : 2*r ≤ c
  · have he : ((2*r-c:ℕ):ℤ)=0 := by omega
    rw [he]
    exact cross_tail_low{off}53D n c r (by exact_mod_cast hn) (by exact_mod_cast hc)
      (by exact_mod_cast hr) (by exact_mod_cast hrc) (by exact_mod_cast hch)
  · have he : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-c := by omega
    rw [he]
    exact cross_tail_high{off}53D n c r (by exact_mod_cast hn) (by exact_mod_cast hc)
      (by exact_mod_cast hr) (by exact_mod_cast hrc) (by omega)
 rw [cross_tail_coeff{off}53D n c r hn (by omega),cross_tail_coeff{off+1}53D n c r hn (by omega),
   cross_tail_coeff{off+2}53D n c r hn (by omega)] at h
 nlinarith only [h]
'''
s+='''theorem third_cross_tail_lc53D (n c r j : ℕ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hj : 2*n+1 ≤ j) (hj' : j ≤ 2*n+4) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 have he : j=2*n+1 ∨ j=2*n+2 ∨ j=2*n+3 ∨ j=2*n+4 := by omega
 rcases he with h | h | h | h <;> subst j
'''
for off in range(1,5):s+=f''' · have h := cross_tail_raw{off}53D n c r hn hc hr hrc
   convert h using 1 <;> congr 2 <;> omega
'''
s+='end\nend MathGKM.Markov\n';(R/'research/MarkovCrossTailLC53D.lean').write_text(s)
s='''import MarkovTailExtended53D
import MarkovCrossTailLC53D
import MarkovTwoBandsSource07F1
/-! Machine-authored 53d5229e. Three contiguous coefficient bands on the
third lower slice. This is not the full slice or the full conjecture. -/
namespace MathGKM.Markov
noncomputable section
theorem third_three_bands_lc53D (n c r j : ℕ) (hn : 5 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hj : j ≤ 3*n+1) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 by_cases h : j ≤ 2*n
 · exact third_two_bands_lc07F1 n c r j hr hrc (by omega) h
 · by_cases h' : j ≤ 2*n+4
   · exact third_cross_tail_lc53D n c r j hn hc hr hrc (by omega) h'
   · exact third_tail_lc53D n c r j hc hr hrc (by omega) hj

theorem source_third_three_bands53D (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : 5 ≤ n) (hc : 4 ≤ (frame rest).mid.b) (hj : j ≤ 3*n+1)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have h := third_three_bands_lc53D n (frame rest).mid.b (frame rest).mid.a j
   hn hc (by omega) (by omega) hj
 rw [←source_third_run_rawADB2 n rest hc i (j+2) (by omega),
   ←source_third_run_rawADB2 n rest hc (i+2) j (by omega),
   ←source_third_run_rawADB2 n rest hc (i+1) (j+1) (by omega)] at h
 nlinarith only [h]

#print axioms source_third_three_bands53D
end
end MathGKM.Markov
''';(R/'research/MarkovThreeBandsSource53D.lean').write_text(s)
print('Generated chamber and source composition.')
