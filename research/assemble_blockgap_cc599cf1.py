"""Machine-authored assembly of universal block certificates."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
s=''.join(f'import MarkovBlockGap{i}CC\n' for i in range(9))+''.join(f'import MarkovBlockSmall{i}CC\n' for i in range(1,4))
s+='''/-! Machine-authored cc599cf1. Whole shifted-block gap. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
def blockValueCC (n c r k : ℤ) : ℤ :=
 fourthShapeK0B c (n*c+r) (n+k)+shiftShapeCC n c r k

theorem blockGap_largeCC (C J E R : ℤ) (hC : 0≤C) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) :
 0≤blockValueCC (J+E+5) (R+C+5) (R+4) (J+6)^2-
 blockValueCC (J+E+5) (R+C+5) (R+4) (J+5)*
 blockValueCC (J+E+5) (R+C+5) (R+4) (J+7) := by
 have he : blockValueCC (J+E+5) (R+C+5) (R+4) (J+6)^2-
     blockValueCC (J+E+5) (R+C+5) (R+4) (J+5)*
     blockValueCC (J+E+5) (R+C+5) (R+4) (J+7)=
 '''+' + '.join(f'blockGap{i}CC C J E*R^{i}' for i in range(9))+''' := by
   unfold blockValueCC
   rw [show J+E+5+(J+5)=2*J+E+10 by ring,
     show J+E+5+(J+6)=2*J+E+11 by ring,
     show J+E+5+(J+7)=2*J+E+12 by ring]
   rw [blockParts0CC,blockParts1CC,blockParts2CC]
   rw ['''+','.join(f'←blockGap_identity{i}CC' for i in range(9))+''']
   ring
 rw [he]
'''
terms=[f'(mul_nonneg (blockGap_nonneg{i}CC C J E hC hJ hE) (pow_nonneg hR {i}))' for i in range(9)]
t=terms[0]
for v in terms[1:]:t=f'(add_nonneg {t} {v})'
s+=' exact '+t+'\n'
s+='''
theorem blockValue_logConcaveCC (n c r k : ℤ) (hc : 5≤c) (hr : 1≤r)
 (hrc : r<c) (hk : 5≤k) (hkn : k≤n) :
 blockValueCC n c r k*blockValueCC n c r (k+2)≤blockValueCC n c r (k+1)^2 := by
 have en : k-5+(n-k)+5=n := by ring
 have ek : k-5+5=k := by ring
 have ek1 : k-5+6=k+1 := by ring
 have ek2 : k-5+7=k+2 := by ring
 by_cases hh : 4≤r
 · have h := blockGap_largeCC (c-r-1) (k-5) (n-k) (r-4)
     (by omega) (by omega) (by omega) (by omega)
   have ec : r-4+(c-r-1)+5=c := by ring
   have er : r-4+4=r := by ring
   rw [en,ek,ek1,ek2,ec,er] at h
   exact sub_nonneg.mp h
 · have hh : r=3 ∨ r=2 ∨ r=1 := by omega
   rcases hh with rfl|rfl|rfl
'''
for a in range(1,4):
 s+=f'''   · have he := blockSmall_identity{a}CC (c-5) (k-5) (n-k)
     have hp := blockSmall_nonneg{a}CC (c-5) (k-5) (n-k) (by omega) (by omega) (by omega)
     have ec : c-5+5=c := by ring
     have e0 : 2*(k-5)+(n-k)+10=n+k := by ring
     have e1 : 2*(k-5)+(n-k)+11=n+(k+1) := by ring
     have e2 : 2*(k-5)+(n-k)+12=n+(k+2) := by ring
     rw [en,ec,ek,ek1,ek2,e0,e1,e2] at he
     unfold blockValueCC
     exact sub_nonneg.mp (he.symm ▸ hp)
end
end MathGKM.Markov
'''
(R/'MarkovBlockLCCC.lean').write_text(s)
