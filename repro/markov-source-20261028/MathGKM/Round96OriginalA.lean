import MathGKM.Round96SeparatorA

/- Machine-authored r96. Original-coordinate applicability of the stopped
witness, separately from the auxiliary block separator. -/
namespace ComplementaryAllocationR96
open Polynomial MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000
set_option maxSynthPendingDepth 64

theorem original_polynomial : (frame [true]).mid.p =
    C (X^4+X^3) + C (4*X^3+4*X^2)*X +
    C (6*X^2+5*X+1)*X^2 + C (4*X+2)*X^3 + X^4 := by
  simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,if_true,MathGKM.Markov.S,U,V]
  simp only [map_add,map_mul,map_pow,map_ofNat,map_one]
  ring

theorem original_values :
    coeff (frame [true]).mid.p 2 0=1 ∧
    coeff (frame [true]).mid.p 3 0=2 ∧
    coeff (frame [true]).mid.p 4 0=1 := by
  simp only [original_polynomial,MathGKM.Markov.coeff,Polynomial.coeff_add,
    Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C_mul_X,
    Polynomial.coeff_X_pow,Polynomial.coeff_C]
  norm_num

theorem original_certificate :
    let E := (frame [true]).mid;
    E.a=2 ∧ E.b=3 ∧
    InPolygon E.a E.b 2 0 ∧ InPolygon E.a E.b 3 0 ∧ InPolygon E.a E.b 4 0 ∧
    coeff E.p 2 0=1 ∧ coeff E.p 3 0=2 ∧ coeff E.p 4 0=1 ∧
    coeff E.p 3 0^2-coeff E.p 2 0*coeff E.p 4 0=3 := by
  have hv := original_values
  refine ⟨by rfl,by rfl,?_,?_,?_,hv.1,hv.2.1,hv.2.2,?_⟩
  · norm_num [InPolygon,frame,advance,initial]
  · norm_num [InPolygon,frame,advance,initial]
  · norm_num [InPolygon,frame,advance,initial]
  · rw [hv.1,hv.2.1,hv.2.2]
    norm_num

theorem separator_bundle :
    (G 4 0 0 6 2 0 0 2=1 ∧ G 4 0 0 6 2 0 0 3=0 ∧
      G 4 0 0 6 2 0 1 2=0 ∧ G 4 0 0 6 2 0 1 3=4) ∧
    (G 4 0 0 6 2 0 0 3 < G 4 0 0 6 2 0 0 2 ∧
      (PairConvolutionR78.P 4 0 0 6 2 0 2).card=1 ∧
      (PairConvolutionR78.P 4 0 0 6 2 0 3).card=4 ∧
      ¬ (∀ n sigma j i a b c : ℕ, sigma≤1 → c≤a/2 →
        G (2*n) sigma j (2*i+2) a b c i ≤ G (2*n) sigma j (2*i+2) a b c (i+1))) ∧
    (let E := (frame [true]).mid;
      E.a=2 ∧ E.b=3 ∧
      InPolygon E.a E.b 2 0 ∧ InPolygon E.a E.b 3 0 ∧ InPolygon E.a E.b 4 0 ∧
      coeff E.p 2 0=1 ∧ coeff E.p 3 0=2 ∧ coeff E.p 4 0=1 ∧
      coeff E.p 3 0^2-coeff E.p 2 0*coeff E.p 4 0=3) :=
  ⟨separator_values,separator,original_certificate⟩

end
end ComplementaryAllocationR96
#print axioms ComplementaryAllocationR96.separator_bundle
