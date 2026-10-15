import MarkovBlockGap0CC
import MarkovBlockGap1CC
import MarkovBlockGap2CC
import MarkovBlockGap3CC
import MarkovBlockGap4CC
import MarkovBlockGap5CC
import MarkovBlockGap6CC
import MarkovBlockGap7CC
import MarkovBlockGap8CC
import MarkovBlockSmall1CC
import MarkovBlockSmall2CC
import MarkovBlockSmall3CC
/-! Machine-authored cc599cf1. Whole shifted-block gap. -/
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
 blockGap0CC C J E*R^0 + blockGap1CC C J E*R^1 + blockGap2CC C J E*R^2 + blockGap3CC C J E*R^3 + blockGap4CC C J E*R^4 + blockGap5CC C J E*R^5 + blockGap6CC C J E*R^6 + blockGap7CC C J E*R^7 + blockGap8CC C J E*R^8 := by
   unfold blockValueCC
   rw [show J+E+5+(J+5)=2*J+E+10 by ring,
     show J+E+5+(J+6)=2*J+E+11 by ring,
     show J+E+5+(J+7)=2*J+E+12 by ring]
   rw [blockParts0CC,blockParts1CC,blockParts2CC]
   rw [←blockGap_identity0CC,←blockGap_identity1CC,←blockGap_identity2CC,←blockGap_identity3CC,←blockGap_identity4CC,←blockGap_identity5CC,←blockGap_identity6CC,←blockGap_identity7CC,←blockGap_identity8CC]
   ring
 rw [he]
 exact (add_nonneg (add_nonneg (add_nonneg (add_nonneg (add_nonneg (add_nonneg (add_nonneg (add_nonneg (mul_nonneg (blockGap_nonneg0CC C J E hC hJ hE) (pow_nonneg hR 0)) (mul_nonneg (blockGap_nonneg1CC C J E hC hJ hE) (pow_nonneg hR 1))) (mul_nonneg (blockGap_nonneg2CC C J E hC hJ hE) (pow_nonneg hR 2))) (mul_nonneg (blockGap_nonneg3CC C J E hC hJ hE) (pow_nonneg hR 3))) (mul_nonneg (blockGap_nonneg4CC C J E hC hJ hE) (pow_nonneg hR 4))) (mul_nonneg (blockGap_nonneg5CC C J E hC hJ hE) (pow_nonneg hR 5))) (mul_nonneg (blockGap_nonneg6CC C J E hC hJ hE) (pow_nonneg hR 6))) (mul_nonneg (blockGap_nonneg7CC C J E hC hJ hE) (pow_nonneg hR 7))) (mul_nonneg (blockGap_nonneg8CC C J E hC hJ hE) (pow_nonneg hR 8)))

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
   · have he := blockSmall_identity1CC (c-5) (k-5) (n-k)
     have hp := blockSmall_nonneg1CC (c-5) (k-5) (n-k) (by omega) (by omega) (by omega)
     have ec : c-5+5=c := by ring
     have e0 : 2*(k-5)+(n-k)+10=n+k := by ring
     have e1 : 2*(k-5)+(n-k)+11=n+(k+1) := by ring
     have e2 : 2*(k-5)+(n-k)+12=n+(k+2) := by ring
     rw [en,ec,ek,ek1,ek2,e0,e1,e2] at he
     unfold blockValueCC
     exact sub_nonneg.mp (he.symm ▸ hp)
end
end MathGKM.Markov
   · have he := blockSmall_identity2CC (c-5) (k-5) (n-k)
     have hp := blockSmall_nonneg2CC (c-5) (k-5) (n-k) (by omega) (by omega) (by omega)
     have ec : c-5+5=c := by ring
     have e0 : 2*(k-5)+(n-k)+10=n+k := by ring
     have e1 : 2*(k-5)+(n-k)+11=n+(k+1) := by ring
     have e2 : 2*(k-5)+(n-k)+12=n+(k+2) := by ring
     rw [en,ec,ek,ek1,ek2,e0,e1,e2] at he
     unfold blockValueCC
     exact sub_nonneg.mp (he.symm ▸ hp)
end
end MathGKM.Markov
   · have he := blockSmall_identity3CC (c-5) (k-5) (n-k)
     have hp := blockSmall_nonneg3CC (c-5) (k-5) (n-k) (by omega) (by omega) (by omega)
     have ec : c-5+5=c := by ring
     have e0 : 2*(k-5)+(n-k)+10=n+k := by ring
     have e1 : 2*(k-5)+(n-k)+11=n+(k+1) := by ring
     have e2 : 2*(k-5)+(n-k)+12=n+(k+2) := by ring
     rw [en,ec,ek,ek1,ek2,e0,e1,e2] at he
     unfold blockValueCC
     exact sub_nonneg.mp (he.symm ▸ hp)
end
end MathGKM.Markov
