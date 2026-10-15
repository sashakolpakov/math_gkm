"""Machine-authored final first-shift gap assembly."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
head='''/-! Machine-authored f2da221d. Uniform first-shift coefficient gap. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
'''
text=''.join(f'import MarkovShiftGapPart{k}F2\n' for k in range(9))+head
gap='fourthShapeK0B (R+C+5) ((N+5)*(R+C+5)+(R+4)) (N+6)^2-\n fourthShapeK0B (R+C+5) ((N+5)*(R+C+5)+(R+4)) (N+5)*\n (fourthShapeK0B (R+C+5) ((N+5)*(R+C+5)+(R+4)) (N+7)+315*shiftCorrectionF2 (N+5) (R+C+5) (R+4))'
rhs=' + '.join(f'shiftGapPart{k}F2 N C*R^{k}' for k in range(9))
text+=f'\ntheorem firstShift_factoredF2 (N C R : ℤ) :\n {gap}=\n {rhs} := by\n rw [shiftParts0F2,shiftParts1F2,shiftParts2F2]\n rw ['+','.join('←shiftGapPart_identity'+str(k)+'F2' for k in range(9))+']\n ring\n'
text+=f'\ntheorem firstShift_large_rF2 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :\n 0≤{gap} := by\n rw [firstShift_factoredF2]\n'
pos=[f'(mul_nonneg (shiftGapPart_nonneg{k}F2 N C hN hC) (pow_nonneg hR {k}))' for k in range(9)]
p=pos[0]
for q in pos[1:]:p=f'(add_nonneg {p} {q})'
text+=' exact '+p+'\nend\nend MathGKM.Markov\n';(R/'MarkovFirstShiftFactF2.lean').write_text(text)
text='import MarkovFirstShiftFactF2\n'+''.join(f'import MarkovFirstShiftGap{k}F2\n' for k in [1,2,3])+head
text+='''
theorem firstShift_logConcaveF2 (n c r : ℤ) (hn : 5≤n) (hc : 5≤c)
    (hr : 1≤r) (hrc : r<c) :
    fourthShapeK0B c (n*c+r) n*
      (fourthShapeK0B c (n*c+r) (n+2)+315*shiftCorrectionF2 n c r)≤
    fourthShapeK0B c (n*c+r) (n+1)^2 := by
  have en : n-5+5=n := by ring
  have en1 : n-5+6=n+1 := by ring
  have en2 : n-5+7=n+2 := by ring
  by_cases hh : 4≤r
  · have h := firstShift_large_rF2 (n-5) (c-r-1) (r-4) (by omega) (by omega) (by omega)
    have ec : r-4+(c-r-1)+5=c := by ring
    have er : r-4+4=r := by ring
    rw [en,en1,en2,ec,er] at h
    exact sub_nonneg.mp h
  · have hh : r=3 ∨ r=2 ∨ r=1 := by omega
    rcases hh with rfl|rfl|rfl
'''
for case in range(1,4):
 text+=f'''    · have he := firstShiftGap_identity{case}F2 (n-5) (c-5) 0
      have hp := firstShiftGap_nonneg{case}F2 (n-5) (c-5) 0 (by omega) (by omega) (by omega)
      have ec : c-5+5=c := by ring
      rw [en,en1,en2,ec] at he
      exact sub_nonneg.mp (he.symm ▸ hp)
'''
text+='end\nend MathGKM.Markov\n';(R/'MarkovFirstShiftLCF2.lean').write_text(text)
print('First-shift gap assembly candidates written.')
