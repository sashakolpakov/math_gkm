import MarkovGFSourceM13E
/-! Machine-authored 13e37040. The third rational summand is supported only
in columns 0,1,2. No zeros are removed from the source predicate. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 8000000

def gfInnerLDenomM13E : PowerSeries (Polynomial ℤ) :=
 gfUpperM13E (C Polynomial.X) X*gfLowerM13E (C Polynomial.X) X
def gfInnerLInvM13E : PowerSeries (Polynomial ℤ) := invOfUnit gfInnerLDenomM13E 1

theorem gf_inner_inverseM13E : gfInnerLDenomM13E*gfInnerLInvM13E=1 := by
 apply mul_invOfUnit
 simp [gfInnerLDenomM13E,gfUpperM13E,gfLowerM13E]

theorem gf_lift_inverseM13E :
 gfLDenomM13E*PowerSeries.map Polynomial.C gfInnerLInvM13E=1 := by
 have h := congrArg (PowerSeries.map (Polynomial.C : Polynomial ℤ →+* BiPoly)) gf_inner_inverseM13E
 simpa only [gfInnerLDenomM13E,gfLDenomM13E,gfUpperM13E,gfLowerM13E,
   map_mul,map_pow,map_sub,map_one,PowerSeries.map_C,PowerSeries.map_X,V] using h

theorem gf_lift_inverse_eqM13E :
 invOfUnit gfLDenomM13E 1=PowerSeries.map Polynomial.C gfInnerLInvM13E := by
 have h0 := mul_invOfUnit gfLDenomM13E 1 (by simpa using gf_l_constantM13E)
 calc
  _ = invOfUnit gfLDenomM13E 1*(gfLDenomM13E*PowerSeries.map Polynomial.C gfInnerLInvM13E) := by
    rw [gf_lift_inverseM13E,mul_one]
  _ = (gfLDenomM13E*invOfUnit gfLDenomM13E 1)*PowerSeries.map Polynomial.C gfInnerLInvM13E := by ring
  _ = _ := by rw [h0,one_mul]

theorem gf_low_liftM13E (r : Bool) : gfLSeriesM13E r=
 PowerSeries.map Polynomial.C (gfLow0M13E (C Polynomial.X) X r*gfInnerLInvM13E)+
 C U*PowerSeries.map Polynomial.C (gfLow1M13E (C Polynomial.X) X r*gfInnerLInvM13E)+
 C (U^2)*PowerSeries.map Polynomial.C (gfLow2M13E (C Polynomial.X) X r*gfInnerLInvM13E) := by
 rw [gfLSeriesM13E,gf_lift_inverse_eqM13E]
 simp only [gfLowNumM13E,gfLow0M13E,gfLow1M13E,gfLow2M13E]
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,
   map_add,map_sub,map_mul,map_pow,map_ofNat,map_one,PowerSeries.map_C,PowerSeries.map_X,V] <;> ring

theorem gf_low_high_zeroM13E (q i j : ℕ) (r : Bool) (hi : 3 ≤ i) :
 coeff (PowerSeries.coeff q (gfLSeriesM13E r)) i j=0 := by
 rw [gf_low_liftM13E]
 simp only [map_add,PowerSeries.coeff_C_mul,PowerSeries.coeff_map]
 have hi0 : i≠0 := by omega
 have hi1 : i-1≠0 := by omega
 have hi2 : i-2≠0 := by omega
 simp [coeff,U,Polynomial.coeff_add,Polynomial.coeff_X_mul',Polynomial.coeff_X_pow_mul',
   show 2 ≤ i by omega,hi0,hi1,hi2]

theorem gf_source_high_splitM13E (q i j : ℕ) (r : Bool) (hi : 3 ≤ i) :
 threeRawM9E2 q r i j=
 coeff (PowerSeries.coeff q (gfDSeriesM13E r)) i j+
 coeff (PowerSeries.coeff q (gfESeriesM13E r)) i j := by
 rw [←three_raw_formulaM9E2,gf_source_coeff_splitM13E]
 simp only [coeff_add0618,gf_low_high_zeroM13E q i j r hi,add_zero]

theorem gf_source_path_highM13E (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=3*q+(if r then 1 else 2) ∧
 ∀ i j, 3 ≤ i → coeff (frame path).mid.p i j=
   coeff (PowerSeries.coeff q (gfDSeriesM13E r)) i j+
   coeff (PowerSeries.coeff q (gfESeriesM13E r)) i j := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro i j hi
 rw [hp]
 exact gf_source_high_splitM13E q i j r hi

end
end MathGKM.Markov
