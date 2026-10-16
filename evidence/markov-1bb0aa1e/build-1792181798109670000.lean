import MarkovTailBinomialM1BB
/-! Machine-authored 1bb0aa1e. Exact complete first correction row of every
numerator-three source, retaining all zero coefficients and exceptional tail. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
attribute [local irreducible] lowerRawME9C threeRawM9E2 firstDiffM1BB

def firstCorrectionM1BB (q : ℕ) (r : Bool) (i : ℕ) : ℤ :=
 if 2 ≤ i then
   if r then
     if q=1 then 8*(-1:ℤ)^(i-2) else 8*((q-2).choose (i-2):ℤ)
   else 4*((q-1).choose (i-2):ℤ)
 else 0

theorem first_diff_formulaM1BB (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 firstDiffM1BB q r i=firstCorrectionM1BB q r i := by
 rcases i with _|_|i
 · simp [firstCorrectionM1BB,first_diff_zeroM1BB]
 · simp [firstCorrectionM1BB,first_diff_oneM1BB q r hq]
 · simp only [firstCorrectionM1BB,show 2 ≤ i+1+1 by omega,if_true,Nat.add_sub_cancel]
   cases r
   · obtain ⟨t,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
     simpa using first_diff_falseM1BB t i
   · by_cases h : q=1
     · subst q
       simpa using first_diff_exceptionalM1BB i
     · have he : q=(q-2)+2 := by omega
       simpa only [if_true,if_neg h] using (he ▸ first_diff_trueM1BB (q-2) i)

theorem first_row_sourceM1BB (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r i (q+1)=lowerRawME9C (sourceNME9C q r) i (q+1)+firstCorrectionM1BB q r i := by
 have h := first_diff_formulaM1BB q i r hq
 unfold firstDiffM1BB at h
 linarith

theorem source_first_rowM1BB (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
   ∀ i, coeff (frame path).mid.p i (q+1)=
     lowerRawME9C (sourceNME9C q r) i (q+1)+firstCorrectionM1BB q r i := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 exact ⟨q,r,hq,hb,fun i => (hp i (q+1)).trans (first_row_sourceM1BB q i r hq)⟩

theorem exceptional_correction_negativeM1BB : firstCorrectionM1BB 1 true 3= -8 := by
 norm_num [firstCorrectionM1BB]

theorem exceptional_source_not_refutedM1BB :
 InPolygon 3 4 3 0 ∧ InPolygon 3 4 3 1 ∧ InPolygon 3 4 3 2 ∧
 coeff (frame [true,true]).mid.p 3 0=1 ∧
 coeff (frame [true,true]).mid.p 3 1=8 ∧
 coeff (frame [true,true]).mid.p 3 2=26 ∧
 coeff (frame [true,true]).mid.p 3 0*coeff (frame [true,true]).mid.p 3 2 <
 coeff (frame [true,true]).mid.p 3 1^2 := by
 have hp : (frame [true,true]).mid.p=threePolyM9E2 1 true := three_path_polynomialM9E2 0 true
 rw [hp]
 simp only [three_raw_formulaM9E2,InPolygon]
 decide

end
end MathGKM.Markov
