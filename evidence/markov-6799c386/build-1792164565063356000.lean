import MarkovGeometricM679
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 100000
attribute [local irreducible] U V geoM679 twoSeriesMEC6
example : geoM679 (V^2)*(1-(PowerSeries.C V)^2*PowerSeries.X)=1 := by
 have h := geo_inverseM679 (V^2)
 rw [map_pow] at h
 exact h
end
end MathGKM.Markov
