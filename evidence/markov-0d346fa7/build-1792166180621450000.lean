import MarkovVerticalPolyM0D3
/-! Machine-authored 0d346fa7. The region conditions are also necessary for
the complete source vertical column, so the split is an exact equivalence. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem source_two_existsM0D3 (q : ℕ) (hq : 1 ≤ q) :
 ∃ path : List Bool, (frame path).mid.a=2 ∧ (frame path).mid.b=2*q+1 := by
 refine ⟨twoPath3af (q-1),(two_path_labels3af _).1,?_⟩
 rw [(two_path_labels3af _).2]
 congr 2
 omega

theorem vertical_regions_of_sourceM0D3 (i : ℕ) (hi : 4 ≤ i)
 (h : ∀ path : List Bool, (frame path).mid.a=2 → ∀ j : ℕ,
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2) : VerticalRegionsM0D3 i := by
 refine ⟨?_,?_,?_,?_⟩
 · intro j d
   obtain ⟨path,ha,hb⟩ := source_two_existsM0D3 (j+d+2) (by omega)
   have hh := h path ha j
   have h0 := source_two_lower_formulaM58E path j (d+2) i ha (by convert hb using 2 <;> omega)
   have h1 := source_two_lower_formulaM58E path (j+1) (d+1) i ha (by convert hb using 2 <;> omega)
   have h2 := source_two_lower_formulaM58E path (j+2) d i ha (by convert hb using 2 <;> omega)
   simpa only [h0,h1,h2] using hh
 · intro N d hN
   obtain ⟨path,ha,hb⟩ := source_two_existsM0D3 (N+d+3) (by omega)
   have hh := h path ha (N+2+2*(d+1))
   have h0 := source_two_upper_formulaM2B3 path (N+2) (d+1) i (by omega) (by omega) ha
     (by convert hb using 2 <;> omega)
   have h1 := source_two_upper_formulaM2B3 path (N+1) (d+2) i (by omega) (by omega) ha
     (by convert hb using 2 <;> omega)
   have h2 := source_two_upper_formulaM2B3 path N (d+3) i (by omega) (by omega) ha
     (by convert hb using 2 <;> omega)
   rw [show N+2+2*(d+1)+1=N+1+2*(d+2) by omega,
     show N+2+2*(d+1)+2=N+2*(d+3) by omega,h0,h1,h2] at hh
   exact hh
 · intro q hq
   obtain ⟨path,ha,hb⟩ := source_two_existsM0D3 q (by omega)
   have hh := h path ha (q-1)
   have h0 := source_two_lower_formulaM58E path (q-1) 1 i ha (by convert hb using 2 <;> omega)
   have h1 := source_two_lower_formulaM58E path q 0 i ha (by convert hb using 2 <;> omega)
   have h2 := source_two_upper_formulaM2B3 path (q-1) 1 i (by omega) (by omega) ha
     (by convert hb using 2 <;> omega)
   rw [show q-1+1=q by omega,show q-1+2=q-1+2*1 by omega,h0,h1,h2] at hh
   exact hh
 · intro q hq
   obtain ⟨path,ha,hb⟩ := source_two_existsM0D3 q (by omega)
   have hh := h path ha q
   have h0 := source_two_lower_formulaM58E path q 0 i ha (by convert hb using 2 <;> omega)
   have h1 := source_two_upper_formulaM2B3 path (q-1) 1 i (by omega) (by omega) ha
     (by convert hb using 2 <;> omega)
   have h2 := source_two_upper_formulaM2B3 path (q-2) 2 i (by omega) (by omega) ha
     (by convert hb using 2 <;> omega)
   rw [show q+1=q-1+2*1 by omega,show q+2=q-2+2*2 by omega,h0,h1,h2] at hh
   exact hh

theorem vertical_regions_iff_sourceM0D3 (i : ℕ) (hi : 4 ≤ i) :
 VerticalRegionsM0D3 i ↔
 (∀ path : List Bool, (frame path).mid.a=2 → ∀ j : ℕ,
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2) :=
 ⟨fun h => source_two_vertical_regionsM0D3 i hi h,
   vertical_regions_of_sourceM0D3 i hi⟩

end
end MathGKM.Markov
