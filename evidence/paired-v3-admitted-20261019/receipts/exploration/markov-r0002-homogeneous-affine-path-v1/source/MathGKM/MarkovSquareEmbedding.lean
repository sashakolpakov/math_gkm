import MathGKM.MarkovLaurentPaths

/-! Machine-authored 2026-10-19. A concrete faithful squared-variable
substitution, to discharge the abstract embedding interface. -/
namespace MathGKM.Markov
noncomputable section

def squareSub : BiPoly →+* BiPoly :=
  (Polynomial.expand (Polynomial ℤ) 2).toRingHom.comp
    (Polynomial.mapRingHom (Polynomial.expand ℤ 2).toRingHom)

theorem squareSub_injective : Function.Injective squareSub := by
  exact (Polynomial.expand_injective (R := Polynomial ℤ) (by decide : 0<2)).comp
    (Polynomial.map_injective (Polynomial.expand ℤ 2).toRingHom
      (Polynomial.expand_injective (by decide : 0<2)))

theorem squareSub_U : squareSub U = U^2 := by
  simp [squareSub, U]

theorem squareSub_V : squareSub V = V^2 := by
  simp [squareSub, V]

abbrev AffineFunctionField := FractionRing BiPoly

def affineX : AffineFunctionField := algebraMap BiPoly AffineFunctionField U
def affineY : AffineFunctionField := algebraMap BiPoly AffineFunctionField V
def squareEmbedding : BiPoly →+* AffineFunctionField :=
  (algebraMap BiPoly AffineFunctionField).comp squareSub

theorem squareEmbedding_injective : Function.Injective squareEmbedding := by
  exact (IsFractionRing.injective BiPoly AffineFunctionField).comp squareSub_injective

theorem affineX_ne_zero : affineX ≠ 0 := by
  apply (map_ne_zero_iff _ (IsFractionRing.injective BiPoly AffineFunctionField)).2
  exact Polynomial.X_ne_zero

theorem affineY_ne_zero : affineY ≠ 0 := by
  apply (map_ne_zero_iff _ (IsFractionRing.injective BiPoly AffineFunctionField)).2
  exact Polynomial.C_ne_zero.mpr Polynomial.X_ne_zero

theorem squareEmbedding_U : squareEmbedding U = affineX^2 := by
  simp [squareEmbedding, affineX, squareSub_U]

theorem squareEmbedding_V : squareEmbedding V = affineY^2 := by
  simp [squareEmbedding, affineY, squareSub_V]

theorem source_path_polynomiality (path : List Bool) :
    squareEmbedding (frame path).mid.p =
      affineDen affineX affineY (frame path).mid.a (frame path).mid.b *
        (affineLaurentFrame affineX affineY path).mid :=
  (affine_frame_presentation squareEmbedding affineX affineY
    affineX_ne_zero affineY_ne_zero squareEmbedding_U squareEmbedding_V path).2.1

end
end MathGKM.Markov
