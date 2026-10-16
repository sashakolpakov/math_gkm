import MarkovUpperGlobalMEC6
/-! Machine-authored ec6f4b83. Exact generating relation for numerator-two
sources, for future direction work. No log-concavity follows from this alone. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def twoPolyMEC6 (q : ℕ) : BiPoly := fib6 (q+1)^2+V*fib6 q^2

theorem fib_square_recMEC6 (q : ℕ) :
 fib6 (q+3)^2=(S^2-V)*fib6 (q+2)^2-V*(S^2-V)*fib6 (q+1)^2+V^3*fib6 q^2 := by
 rw [show q+3=(q+1)+2 by omega,fib_rec6 (q+1)]
 rw [show q+1+1=q+2 by omega,fib_rec6 q]
 ring

theorem two_poly_recMEC6 (q : ℕ) :
 twoPolyMEC6 (q+3)=(S^2-V)*twoPolyMEC6 (q+2)-
   V*(S^2-V)*twoPolyMEC6 (q+1)+V^3*twoPolyMEC6 q := by
 have h0 := fib_square_recMEC6 q
 have h1 := fib_square_recMEC6 (q+1)
 simp only [show q+1+3=q+3+1 by omega,show q+1+2=q+2+1 by omega] at h1
 unfold twoPolyMEC6
 linear_combination h1+V*h0

def twoSeriesMEC6 : PowerSeries BiPoly := PowerSeries.mk twoPolyMEC6

theorem two_series_coeffMEC6 (q : ℕ) :
 PowerSeries.coeff q twoSeriesMEC6=twoPolyMEC6 q := PowerSeries.coeff_mk _ _

theorem source_two_seriesMEC6 (path : List Bool) (ha : (frame path).mid.a=2) :
 ∃ q : ℕ, 1 ≤ q ∧ (frame path).mid.b=2*q+1 ∧
   (frame path).mid.p=PowerSeries.coeff q twoSeriesMEC6 := by
 obtain ⟨q,hq,hb,hp⟩ := source_two_squares3556 path ha
 exact ⟨q,hq,hb,by simpa only [two_series_coeffMEC6,twoPolyMEC6] using hp⟩

theorem two_poly_initialMEC6 :
 twoPolyMEC6 0=(U+V)^2+V ∧
 twoPolyMEC6 1-(S^2-V)*twoPolyMEC6 0= -V*(S^2+2*U) ∧
 twoPolyMEC6 2-(S^2-V)*twoPolyMEC6 1+V*(S^2-V)*twoPolyMEC6 0=V^2*(V+1) := by
 have h3 := fib_rec6 1
 norm_num at h3
 simp only [twoPolyMEC6]
 norm_num only
 rw [h3,fib_zero6,fib_one6,fib_two6]
 unfold S
 constructor
 · ring
 constructor <;> ring

theorem two_series_equationMEC6 :
 twoSeriesMEC6-
   PowerSeries.C (S^2-V)*(PowerSeries.X*twoSeriesMEC6)+
   PowerSeries.C (V*(S^2-V))*(PowerSeries.X^2*twoSeriesMEC6)-
   PowerSeries.C (V^3)*(PowerSeries.X^3*twoSeriesMEC6)=
 PowerSeries.C ((U+V)^2+V)-PowerSeries.C (V*(S^2+2*U))*PowerSeries.X+
   PowerSeries.C (V^2*(V+1))*PowerSeries.X^2 := by
 apply PowerSeries.ext
 intro q
 obtain ⟨h0,h1,h2⟩ := two_poly_initialMEC6
 rcases q with _ | (_ | (_ | q))
 · simpa [map_sub,map_add,PowerSeries.coeff_C_mul,PowerSeries.coeff_X_mul,
     PowerSeries.coeff_X_pow_mul,two_series_coeffMEC6] using h0
 · simpa [map_sub,map_add,PowerSeries.coeff_C_mul,PowerSeries.coeff_X_mul,
     PowerSeries.coeff_X_pow_mul,two_series_coeffMEC6] using h1
 · simpa [map_sub,map_add,PowerSeries.coeff_C_mul,PowerSeries.coeff_X_mul,
     PowerSeries.coeff_X_pow_mul,two_series_coeffMEC6] using h2
 · have hr := two_poly_recMEC6 q
   simp [map_sub,map_add,PowerSeries.coeff_C_mul,PowerSeries.coeff_X_mul,
     PowerSeries.coeff_X_pow_mul,two_series_coeffMEC6,show q+1+1+1≠0 by omega,
     show q+1+1+1≠1 by omega,show q+1+1+1≠2 by omega]
   linear_combination hr

theorem two_series_denominatorMEC6 :
 (1-PowerSeries.C V*PowerSeries.X)*
 ((1-PowerSeries.X)*(1-PowerSeries.C (V^2)*PowerSeries.X)-
   PowerSeries.C U*PowerSeries.X*PowerSeries.C (2*(V+1)+U))*twoSeriesMEC6 =
 PowerSeries.C ((U+V)^2+V)-PowerSeries.C (V*(S^2+2*U))*PowerSeries.X+
   PowerSeries.C (V^2*(V+1))*PowerSeries.X^2 := by
 rw [←two_series_equationMEC6]
 simp only [S,map_add,map_sub,map_mul,map_pow,map_ofNat,map_one]
 ring

theorem two_positive_split_identityMEC6 {R : Type*} [CommRing R] (u v t : R) :
 (1-v^2*t)*((u+v)^2+v-v*((u+v+1)^2+2*u)*t+v^2*(v+1)*t^2)-
   v*(v+1)*(1-v*t)*((1-t)*(1-v^2*t)-u*t*(2*(v+1)+u))=
 u*(1+v*t)*(2*v*(1-t)+u*(1-v*t)) := by ring

end
end MathGKM.Markov
