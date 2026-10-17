import MarkovAbsorbedBoundaryBridgeM418
/-! Machine-authored 418bcc64. Exact rational model for all three boundary
coefficients. This supplies the source-kernel normalization used by the
separate polynomial certificates, without assuming their positivity. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

def cutLast0M418 (j t : ℚ) : ℚ :=
 (t+j+4)*(t+j+5)*liftWeightMAE9 j (t+2) 0/
 ((t+4)*(t+5)*liftDenMAE9 (t+2) 0)

theorem cut_last_zero_valueM418 (j t : ℕ) :
 (liftTermMAE9 j (t+2) 0:ℚ)=((t+j+3).choose j:ℚ)*cutLast0M418 j t := by
 have h := lift_normalizedMFEE j (t+2) 0 (by omega)
 rw [base_choose_twoMFEE] at h
 simp only [Nat.choose_zero_right,Nat.cast_one,mul_one,Nat.cast_add,Nat.cast_ofNat] at h
 rw [h]
 unfold cutLast0M418
 simp only [div_eq_mul_inv,mul_inv_rev]
 ring

def absorbedExtraQM418 (d t : ℕ) (c : ℤ) : ℚ := (c:ℚ)*((d-t:ℕ):ℚ)/(t+1)
def boundaryModel0M418 (j t B a0 : ℚ) : ℚ :=
 (B*cutNext1MFEE j t)^2-(B*cutBaseMFEE j t+a0)*(B*cutLast2MFEE j t)
def boundaryModel1M418 (j t B a0 a1 : ℚ) : ℚ :=
 2*(B*cutNext1MFEE j t)*(B*cutNext0MFEE j t+a1)-
 (B*cutBaseMFEE j t+a0)*(B*cutLast1MFEE j t)
def boundaryModel2M418 (j t B a0 a1 a2 : ℚ) : ℚ :=
 (B*cutNext0MFEE j t+a1)^2-(B*cutBaseMFEE j t+a0)*(B*cutLast0M418 j t+a2)

theorem absorbed_boundary_modelsM418 (d j t : ℕ) (c : ℤ) (hj : 2 ≤ j) :
 (boundaryModel0M418 j t ((t+j+3).choose j) (absorbedExtraQM418 d t c):ℝ)=
   absorbedBoundaryGap0M418 d j t c ∧
 (boundaryModel1M418 j t ((t+j+3).choose j) (absorbedExtraQM418 d t c)
   (absorbedExtraQM418 d (t+1) c):ℝ)=absorbedBoundaryGap1M418 d j t c ∧
 (boundaryModel2M418 j t ((t+j+3).choose j) (absorbedExtraQM418 d t c)
   (absorbedExtraQM418 d (t+1) c) (absorbedExtraQM418 d (t+2) c):ℝ)=
   absorbedBoundaryGap2M418 d j t c := by
 rcases cut_kernel_valuesMFEE j t hj with ⟨h0,h10,h11,h21,h22⟩
 have h20 := cut_last_zero_valueM418 j t
 simp only [boundaryModel0M418,boundaryModel1M418,boundaryModel2M418,
   ←h0,←h10,←h11,←h21,←h22,←h20]
 simp [absorbedExtraQM418,absorbedExtraM418,absorbedBoundaryGap0M418,
   absorbedBoundaryGap1M418,absorbedBoundaryGap2M418]

theorem absorbed_boundary_of_modelM418 (d j t k : ℕ) (c : ℤ) (hj : 2 ≤ j)
 (h0 : 0 ≤ boundaryModel0M418 j t ((t+j+3).choose j) (absorbedExtraQM418 d t c))
 (h1 : 0 ≤ boundaryModel1M418 j t ((t+j+3).choose j) (absorbedExtraQM418 d t c)
   (absorbedExtraQM418 d (t+1) c))
 (h2 : 0 ≤ boundaryModel2M418 j t ((t+j+3).choose j) (absorbedExtraQM418 d t c)
   (absorbedExtraQM418 d (t+1) c) (absorbedExtraQM418 d (t+2) c)) :
 0 ≤ ((cutPolyMFEE t (absorbedLiftM418 d j c (t+1)))^2-
   cutPolyMFEE t (absorbedLiftM418 d j c t)*cutPolyMFEE t (absorbedLiftM418 d j c (t+2))).coeff k := by
 rcases absorbed_boundary_modelsM418 d j t c hj with ⟨e0,e1,e2⟩
 apply absorbed_boundary_of_threeM418
 · rw [←e0]; exact_mod_cast h0
 · rw [←e1]; exact_mod_cast h1
 · rw [←e2]; exact_mod_cast h2

end
end MathGKM.Markov
