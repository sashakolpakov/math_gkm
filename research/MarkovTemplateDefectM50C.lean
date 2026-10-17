import MarkovTemplateBoundaryM50C
/-! Machine-authored 50c262c5. The first subleading template coefficient.
This is an exact identity, not a sign assertion for the full template. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
attribute [local irreducible] topTemplateMB3E topDiagonalDeltaMB3E

def topDefectM50C (n t : ℕ) : Polynomial ℤ :=
 topTemplateMB3E n t-topDiagonalDeltaMB3E n t

theorem top_defect_zeroM50C (n t i : ℕ) (ht : t ≤ n+2) (hi : t ≤ i) :
 (topDefectM50C n t).coeff i=0 := by
 unfold topDefectM50C
 rw [coeff_sub]
 rcases eq_or_lt_of_le hi with rfl|hi
 · rw [(top_template_boundaryM50C n t ht).2,(top_delta_boundaryM50C n t ht).2,sub_self]
 · rw [(top_template_boundaryM50C n t ht).1 i hi,(top_delta_boundaryM50C n t ht).1 i hi,sub_self]

theorem top_defect_recM50C (n t : ℕ) :
 topDefectM50C n (t+2)=4*topDiagonalDeltaMB3E n (t+1)-
 2*X*topDefectM50C n (t+1)+2*topDefectM50C n (t+1)-
 X^2*topDefectM50C n t-2*X*topDefectM50C n t-topDefectM50C n t := by
 unfold topDefectM50C
 rw [topTemplateMB3E]
 ring

theorem top_defect_leadingM50C (n t : ℕ) (ht : t+1 ≤ n+2) :
 (topDefectM50C n (t+1)).coeff t=4*(n.choose t:ℤ) := by
 induction t using Nat.twoStepInduction with
 | zero => simp [topDefectM50C,topTemplateMB3E]
 | one =>
   rw [show 1+1=0+2 by rfl,top_defect_recM50C]
   have h0 : topDefectM50C n 0=0 := by simp [topDefectM50C,topTemplateMB3E,top_delta_zeroMB3E]
   have h1 : topDefectM50C n 1=4 := by simp [topDefectM50C,topTemplateMB3E]
   rw [h0,h1,top_delta_oneMB3E]
   simp [coeff_sub,coeff_add,coeff_C_mul,mul_assoc]
   ring
 | more t h0 h1 =>
   have h0 := h0 (by omega)
   have h1 := h1 (by omega)
   rw [show t+2+1=(t+1)+2 by omega,top_defect_recM50C]
   simp only [coeff_sub,coeff_add,mul_assoc,coeff_ofNat_mul,coeff_X_mul,coeff_X_pow_mul']
   simp only [if_pos (by omega : 2 ≤ t+2)]
   simp only [show t+1+1=t+2 by omega,
     show t+2-1=t+1 by omega,show t+2-2=t by omega]
   rw [(top_delta_boundaryM50C n (t+2) (by omega)).2,h1,h0,
     top_defect_zeroM50C n (t+2) (t+2) (by omega) (by omega),
     top_defect_zeroM50C n (t+1) (t+1) (by omega) (by omega),
     top_defect_zeroM50C n (t+1) (t+2) (by omega) (by omega)]
   have hc : ((n+2).choose (t+2):ℤ)=(n.choose (t+2):ℤ)+
     2*(n.choose (t+1):ℤ)+(n.choose t:ℤ) := by
     simp only [Nat.choose_succ_succ,Nat.cast_add]
     ring
   rw [hc]
   ring

theorem top_template_penultimateM50C (n c : ℕ) (hn : c+2 ≤ n) :
 (topTemplateMB3E n (c+4)).coeff (c+3)=
 ((c:ℤ)+1)*((n+1).choose (c+3):ℤ)+4*(n.choose (c+3):ℤ) := by
 have h := top_defect_leadingM50C n (c+3) (by omega)
 simp only [topDefectM50C,coeff_sub,show c+3+1=c+4 by omega] at h
 rw [top_delta_highMB3E n (c+4) c (by omega)] at h
 simp only [if_pos (by omega : 3 ≤ c+4),show c+4-3=c+1 by omega,
   show n+5-(c+4)+c=n+1 by omega,Nat.choose_succ_self_right,Nat.cast_add,Nat.cast_one] at h
 linear_combination h

end
end MathGKM.Markov
