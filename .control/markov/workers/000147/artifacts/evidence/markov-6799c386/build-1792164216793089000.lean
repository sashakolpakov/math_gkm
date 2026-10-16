import MarkovGeometricM679
/-! Machine-authored 6799c386. Positive finite expansion of every numerator-two
source polynomial. This identity alone is not a log-concavity theorem. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem positive_resolvent_algebraM679 {R : Type*} [CommRing R]
 (u v t g k0 k1 k2 : R)
 (h0 : k0*(1-t)=1) (h1 : k1*(1-v*t)=1) (h2 : k2*(1-v^2*t)=1)
 (hg : (1-v*t)*((1-t)*(1-v^2*t)-u*t*(2*(v+1)+u))*g=
   (u+v)^2+v-v*((u+v+1)^2+2*u)*t+v^2*(v+1)*t^2) :
 (1-t*(u*(2*(v+1)+u)*k0*k2))*(g-v*(v+1)*k2)=
   2*u*v*(1+v*t)*k1*k2^2+u^2*(1+v*t)*k0*k2^2 := by
 let D := (1-v*t)*((1-t)*(1-v^2*t)-u*t*(2*(v+1)+u))
 have hs : D*((1-v^2*t)*g-v*(v+1))=
   u*(1+v*t)*(2*v*(1-t)+u*(1-v*t)) := by
   dsimp [D]
   linear_combination (1-v^2*t)*hg+two_positive_split_identityMEC6 u v t
 have hd : k0*k1*k2^2*D=k2*(1-t*(u*(2*(v+1)+u)*k0*k2)) := by
   calc
    _ = k0*k2^2*(k1*(1-v*t))*((1-t)*(1-v^2*t)-u*t*(2*(v+1)+u)) := by dsimp [D]; ring
    _ = k2*((k0*(1-t))*(k2*(1-v^2*t)))-k0*k2^2*u*t*(2*(v+1)+u) := by rw [h1]; ring
    _ = _ := by rw [h0,h2]; ring
 calc
  _ = (k0*k1*k2^2*D)*((1-v^2*t)*g-v*(v+1)) := by
    rw [hd]
    calc
     _ = (1-t*(u*(2*(v+1)+u)*k0*k2))*
       ((k2*(1-v^2*t))*g-v*(v+1)*k2) := by rw [h2]
     _ = _ := by ring
  _ = k0*k1*k2^2*(u*(1+v*t)*(2*v*(1-t)+u*(1-v*t))) := by rw [mul_assoc,hs]
  _ = 2*u*v*(1+v*t)*k1*k2^2*(k0*(1-t))+
       u^2*(1+v*t)*k0*k2^2*(k1*(1-v*t)) := by ring
  _ = _ := by rw [h0,h1]; ring

def twoStepM679 : PowerSeries BiPoly :=
 PowerSeries.C (U*(2*(V+1)+U))*geoM679 (1:BiPoly)*geoM679 (V^2)

def twoSeedM679 : PowerSeries BiPoly :=
 PowerSeries.C (2*U*V)*(1+PowerSeries.C V*PowerSeries.X)*geoM679 V*geoM679 (V^2)^2+
 PowerSeries.C (U^2)*(1+PowerSeries.C V*PowerSeries.X)*geoM679 (1:BiPoly)*geoM679 (V^2)^2

def twoTailM679 : PowerSeries BiPoly :=
 twoSeriesMEC6-PowerSeries.C (V*(V+1))*geoM679 (V^2)

theorem two_positive_resolventM679 :
 (1-PowerSeries.X*twoStepM679)*twoTailM679=twoSeedM679 := by
 have h0 := geo_inverseM679 (1:BiPoly)
 simp only [map_one,one_mul] at h0
 have hg := two_series_denominatorMEC6
 simp only [S,map_add,map_sub,map_mul,map_pow,map_one,map_ofNat] at hg
 have h := positive_resolvent_algebraM679 (PowerSeries.C U) (PowerSeries.C V)
   PowerSeries.X twoSeriesMEC6 (geoM679 (1:BiPoly)) (geoM679 V) (geoM679 (V^2))
   h0 (geo_inverseM679 V) (by simpa only [map_pow] using geo_inverseM679 (V^2)) hg
 simpa only [twoStepM679,twoTailM679,twoSeedM679,
   map_add,map_mul,map_pow,map_one,map_ofNat] using h

theorem two_positive_finiteM679 (q : ℕ) :
 twoPolyMEC6 q=V^(2*q+1)*(V+1)+
   ∑ r∈range (q+1), PowerSeries.coeff (q-r) (twoStepM679^r*twoSeedM679) := by
 have h := finite_series_coeffM679 twoStepM679 twoTailM679 twoSeedM679
   two_positive_resolventM679 q
 simp only [twoTailM679,map_sub,two_series_coeffMEC6,PowerSeries.coeff_C_mul,
   geoM679,PowerSeries.coeff_mk] at h
 calc
  _ = V*(V+1)*(V^2)^q+
    ∑ r∈range (q+1), PowerSeries.coeff (q-r) (twoStepM679^r*twoSeedM679) := by linear_combination h
  _ = _ := by rw [pow_mul,pow_succ]; ring

theorem source_two_positive_finiteM679 (path : List Bool) (ha : (frame path).mid.a=2) :
 ∃ q : ℕ, 1≤q ∧ (frame path).mid.b=2*q+1 ∧
 (frame path).mid.p=V^(2*q+1)*(V+1)+
   ∑ r∈range (q+1), PowerSeries.coeff (q-r) (twoStepM679^r*twoSeedM679) := by
 obtain ⟨q,hq,hb,hp⟩ := source_two_squares3556 path ha
 exact ⟨q,hq,hb,hp.trans (two_positive_finiteM679 q)⟩

end
end MathGKM.Markov
