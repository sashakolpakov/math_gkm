import MarkovGFSectionAlgebraM13E
import MarkovGFLowSupportM13E
/-! Machine-authored 13e37040. Exact residue extraction from the master D series. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 10000000
set_option maxRecDepth 10000
attribute [local -instance] PowerSeries.algebraPolynomial PowerSeries.algebraPolynomial'

def gfMasterSeriesM13E : PowerSeries BiPoly :=
 gfMasterNumM13E (C U) (C V) X*invOfUnit (gfMasterDenM13E (C U) (C V) X) 1
def gfD0SeriesM13E : PowerSeries BiPoly :=
 gfD0NumM13E (C U) (C V) X*invOfUnit gfDDenomM13E 1
def gfExpandM13E : PowerSeries BiPoly →+* PowerSeries BiPoly :=
 (PowerSeries.expand 3 (by decide) (R:=BiPoly)).toRingHom

theorem gf_master_equationM13E :
 gfMasterDenM13E (C U) (C V) X*gfMasterSeriesM13E=gfMasterNumM13E (C U) (C V) X := by
 rw [gfMasterSeriesM13E,mul_left_comm]
 rw [mul_invOfUnit _ 1 (by simp [gfMasterDenM13E]),mul_one]

theorem gf_zero_section_equationM13E : gfDDenomM13E*gfD0SeriesM13E=gfD0NumM13E (C U) (C V) X := by
 rw [gfD0SeriesM13E,mul_left_comm]
 rw [mul_invOfUnit _ 1 (by simpa using gf_d_constantM13E),mul_one]

theorem gf_expand_denM13E : gfExpandM13E gfDDenomM13E=
 gfRampM13E (C V) (X^3)*gfUpperM13E (C V) (X^3)*gfCubeM13E (C U) (C V) (X^3) := by
 simp only [gfExpandM13E,gfDDenomM13E,gfRampM13E,gfUpperM13E,gfCubeM13E,
   map_mul,map_pow,map_sub,map_add,map_one,map_ofNat,expand_C,expand_X]

theorem gf_expand_numerM13E (r : Bool) :
 gfExpandM13E (gfDNumM13E (C U) (C V) X r)=gfDNumM13E (C U) (C V) (X^3) r := by
 cases r <;> simp only [gfExpandM13E,gfDNumM13E,Bool.false_eq_true,if_false,if_true,
   map_mul,map_pow,map_sub,map_add,map_one,map_ofNat,expand_C,expand_X]

theorem gf_expand_zero_numerM13E :
 gfExpandM13E (gfD0NumM13E (C U) (C V) X)=gfD0NumM13E (C U) (C V) (X^3) := by
 simp only [gfExpandM13E,gfD0NumM13E,
   map_mul,map_pow,map_sub,map_add,map_one,map_ofNat,expand_C,expand_X]

theorem gf_master_sectionsM13E : gfMasterSeriesM13E=
 gfExpandM13E gfD0SeriesM13E+X*gfExpandM13E (gfDSeriesM13E true)+
 X^2*gfExpandM13E (gfDSeriesM13E false) := by
 have h0 := congrArg gfExpandM13E gf_zero_section_equationM13E
 have h1 := congrArg gfExpandM13E (gf_d_equationM13E true)
 have h2 := congrArg gfExpandM13E (gf_d_equationM13E false)
 simp only [map_mul,gf_expand_numerM13E,gf_expand_zero_numerM13E] at h0 h1 h2
 have hm : gfExpandM13E gfDDenomM13E*gfMasterSeriesM13E=
     gfD0NumM13E (C U) (C V) (X^3)+X*gfDNumM13E (C U) (C V) (X^3) true+
     X^2*gfDNumM13E (C U) (C V) (X^3) false := by
   rw [gf_expand_denM13E,←gf_master_normM13E]
   calc
    _ = (gfMasterDenM13E (C U) (C V) X*gfMasterSeriesM13E)*gfConjugateM13E (C U) (C V) X := by ring
    _ = _ := by rw [gf_master_equationM13E,gf_master_numerM13E]
 have hn : gfExpandM13E gfDDenomM13E≠0 := by
   intro h
   have h := congrArg constantCoeff h
   simp only [gfExpandM13E,constantCoeff_expand,gf_d_constantM13E,map_zero] at h
   exact one_ne_zero h
 apply mul_left_cancel₀ hn
 linear_combination hm-h0-X*h1-X^2*h2

theorem gf_section_shift_coeffM13E (f : PowerSeries BiPoly) (q d e : ℕ)
 (hd : d<3) (he : e<3) :
 PowerSeries.coeff (3*q+d) (X^e*gfExpandM13E f)=if d=e then PowerSeries.coeff q f else 0 := by
 rw [coeff_X_pow_mul']
 by_cases hk : e ≤ 3*q+d
 · rw [if_pos hk]
   rw [gfExpandM13E,coeff_expand]
   by_cases hde : d=e
   · subst e
     simp only [show 3*q+d-d=3*q by omega,Nat.dvd_mul_right,
       if_true,Nat.mul_div_right]
   · have hdiv : ¬3 ∣ 3*q+d-e := by
       rintro ⟨k,hk'⟩
       omega
     simp only [if_neg hdiv,if_neg hde]
 · have hde : d≠e := by omega
   simp only [if_neg hk,if_neg hde]

theorem gf_d_section_coeffM13E (q : ℕ) (r : Bool) :
 PowerSeries.coeff q (gfDSeriesM13E r)=
 PowerSeries.coeff (3*q+(if r then 1 else 2)) gfMasterSeriesM13E := by
 rw [gf_master_sectionsM13E]
 have h0 (d : ℕ) (hd : d<3) :
     PowerSeries.coeff (3*q+d) (gfExpandM13E gfD0SeriesM13E)=
     if d=0 then PowerSeries.coeff q gfD0SeriesM13E else 0 := by
   simpa using gf_section_shift_coeffM13E gfD0SeriesM13E q d 0 hd (by omega)
 have h1 (d : ℕ) (hd : d<3) :
     PowerSeries.coeff (3*q+d) (X*gfExpandM13E (gfDSeriesM13E true))=
     if d=1 then PowerSeries.coeff q (gfDSeriesM13E true) else 0 := by
   simpa using gf_section_shift_coeffM13E (gfDSeriesM13E true) q d 1 hd (by omega)
 cases r
 · simp only [Bool.false_eq_true,if_false,map_add]
   rw [h0 2 (by omega),h1 2 (by omega),
     gf_section_shift_coeffM13E (gfDSeriesM13E false) q 2 2 (by omega) (by omega)]
   simp
 · simp only [if_true,map_add]
   rw [h0 1 (by omega),h1 1 (by omega),
     gf_section_shift_coeffM13E (gfDSeriesM13E false) q 1 2 (by omega) (by omega)]
   simp

theorem gf_source_masterM13E (q i j : ℕ) (r : Bool) (hi : 3 ≤ i) :
 threeRawM9E2 q r i j=
 coeff (PowerSeries.coeff (3*q+(if r then 1 else 2)) gfMasterSeriesM13E) i j+
 coeff (PowerSeries.coeff q (gfESeriesM13E r)) i j := by
 rw [gf_source_high_splitM13E q i j r hi,gf_d_section_coeffM13E]

end
end MathGKM.Markov
