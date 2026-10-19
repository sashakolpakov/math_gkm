import MathGKM.MarkovHomogeneous
import MathGKM.Accepted3f4facbfb80089ba12c09144

/-! Machine-authored round-0002. Specialization is (u,v,w)=(x²,y²,1).
Published global source-family identification is not an assumption or conclusion. -/
namespace MathGKM.Markov
noncomputable section

def squaredAffineSpecialization (F : TriPoly) : AffineFunctionField :=
  squareEmbedding (dehomogenize F)

theorem squaredAffineSpecialization_eq_eval₂ (F : TriPoly) :
    squaredAffineSpecialization F = F.eval₂ squareEmbedding 1 := by
  exact (Polynomial.eval₂_at_one squareEmbedding).symm

theorem squaredAffineSpecialization_variables :
    squaredAffineSpecialization Polynomial.X = 1 ∧
    squaredAffineSpecialization (Polynomial.C U) = affineX^2 ∧
    squaredAffineSpecialization (Polynomial.C V) = affineY^2 := by
  simp [squaredAffineSpecialization, dehomogenize, squareEmbedding_U, squareEmbedding_V]

theorem homogeneous_source_path (path : List Bool) :
    let m := (frame path).mid
    squaredAffineSpecialization (homogeneousLift m.p (m.a+m.b-1)) =
      affineDen affineX affineY m.a m.b *
        (affineLaurentFrame affineX affineY path).mid := by
  dsimp only
  unfold squaredAffineSpecialization
  rw [dehomogenize_lift _ _ (frame_support_bound path).2.1]
  exact Accepted3f4facbfb80089ba12c09144.obligation path

theorem homogeneous_source_path_eval (path : List Bool) :
    let m := (frame path).mid
    (homogeneousLift m.p (m.a+m.b-1)).eval₂ squareEmbedding 1 =
      affineDen affineX affineY m.a m.b *
        (affineLaurentFrame affineX affineY path).mid := by
  dsimp only
  rw [← squaredAffineSpecialization_eq_eval₂]
  exact homogeneous_source_path path

end
end MathGKM.Markov
