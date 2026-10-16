import MarkovThreeSourceM9E2
import MarkovCubicRecurrenceM9E2
/-! Machine-authored 9e205206. Exact rational generating functions for both
numerator-three source families, with a factorization useful for positive kernels. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] U V S fib6

theorem three_poly_recM9E2 (q : ℕ) (r : Bool) :
 threePolyM9E2 (q+4) r=cubeTraceM9E2 S V*threePolyM9E2 (q+3) r-
 cubeSecondM9E2 S V*threePolyM9E2 (q+2) r+
 V^3*cubeTraceM9E2 S V*threePolyM9E2 (q+1) r-V^6*threePolyM9E2 q r := by
 cases r
 · simpa [threePolyM9E2,threeCubicM9E2,cubicOrbitM9E2] using
     cubic_orbit_recM9E2 fib6 S V S V 0 (V^2) fib_rec6 q
 · simpa [threePolyM9E2,threeCubicM9E2,cubicOrbitM9E2] using
     cubic_orbit_recM9E2 fib6 S V 1 0 V (S*V) fib_rec6 q

def threeSeriesM9E2 (r : Bool) : PowerSeries BiPoly := mk (fun q => threePolyM9E2 q r)

def threeDenomM9E2 : PowerSeries BiPoly :=
 1-C (cubeTraceM9E2 S V)*X+C (cubeSecondM9E2 S V)*X^2-
 C (V^3*cubeTraceM9E2 S V)*X^3+C (V^6)*X^4

def threeNumerM9E2 (r : Bool) : PowerSeries BiPoly :=
 C (threePolyM9E2 0 r)+
 C (threePolyM9E2 1 r-cubeTraceM9E2 S V*threePolyM9E2 0 r)*X+
 C (threePolyM9E2 2 r-cubeTraceM9E2 S V*threePolyM9E2 1 r+
    cubeSecondM9E2 S V*threePolyM9E2 0 r)*X^2+
 C (threePolyM9E2 3 r-cubeTraceM9E2 S V*threePolyM9E2 2 r+
    cubeSecondM9E2 S V*threePolyM9E2 1 r-
    V^3*cubeTraceM9E2 S V*threePolyM9E2 0 r)*X^3

theorem three_series_equationM9E2 (r : Bool) :
 threeDenomM9E2*threeSeriesM9E2 r=threeNumerM9E2 r := by
 apply PowerSeries.ext
 intro q
 simp only [threeDenomM9E2,threeNumerM9E2,add_mul,sub_mul,one_mul,mul_assoc,
   map_add (PowerSeries.coeff q),map_sub (PowerSeries.coeff q),coeff_C_mul]
 have hX (k : ℕ) : PowerSeries.coeff q (X^k*threeSeriesM9E2 r)=
   if k≤q then threePolyM9E2 (q-k) r else 0 := by
   simp only [coeff_X_pow_mul',threeSeriesM9E2,coeff_mk]
 have h1 : PowerSeries.coeff q (X*threeSeriesM9E2 r)=
   if 1≤q then threePolyM9E2 (q-1) r else 0 := by simpa using hX 1
 simp only [h1,hX,threeSeriesM9E2,coeff_mk,coeff_C,coeff_X,coeff_X_pow]
 rcases q with _ | (_ | (_ | (_ | q)))
 · norm_num
 · norm_num
 · norm_num
 · norm_num
 · have hr := three_poly_recM9E2 q r
   simp only [show q+1+1+1+1=q+4 by omega,
     if_pos (by omega : 1≤q+4),if_pos (by omega : 2≤q+4),
     if_pos (by omega : 3≤q+4),if_pos (by omega : 4≤q+4),
     if_neg (by omega : q+4≠0),if_neg (by omega : q+4≠1),
     if_neg (by omega : q+4≠2),if_neg (by omega : q+4≠3),
     show q+4-1=q+3 by omega,show q+4-2=q+2 by omega,
     show q+4-3=q+1 by omega,show q+4-4=q by omega,mul_zero,add_zero]
   linear_combination hr

theorem three_denominator_factorM9E2 : threeDenomM9E2=
 ((1-C V*X)*(1-C (V^2)*X)-C (U*V)*X)*
 ((1-X)*(1-C (V^3)*X)-C (U*(3*(V^2+V+1)+3*U*(V+1)+U^2))*X) := by
 unfold threeDenomM9E2 cubeTraceM9E2 cubeSecondM9E2 S
 simp only [map_add,map_sub,map_mul,map_pow,map_ofNat,map_one]
 ring

theorem source_three_seriesM9E2 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1≤q ∧ (frame path).mid.b=3*q+(if r then 1 else 2) ∧
   (frame path).mid.p=PowerSeries.coeff q (threeSeriesM9E2 r) := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_cubicM9E2 path ha
 exact ⟨q,r,hq,hb,by simpa [threeSeriesM9E2] using hp⟩

end
end MathGKM.Markov
