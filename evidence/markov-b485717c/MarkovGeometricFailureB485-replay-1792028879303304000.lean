import MarkovGeometricSlice3B485
import MarkovGeometricSlice4B485
import MarkovGeometricSlice5B485
/-! Machine-authored b485717c. Entire geometric family t>=8 fails an auxiliary
horizontal inequality. Uniform t=1 remains the unchanged source polynomial. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
def geometricResidualB485 (t : ℤ) : ℤ := -14+1427*t+4577*t^2+6941*t^3+7530*t^4+9148*t^5+10646*t^6+11609*t^7+14378*t^8+17465*t^9+16371*t^10+13376*t^11+11532*t^12+10119*t^13+8361*t^14+7419*t^15+6191*t^16+3478*t^17+1034*t^18+109*t^19+-12*t^20+-5*t^21
theorem geometric_gap_identityB485 (t : ℤ) :
 (38*t^10+73*t^11+43*t^12+46*t^13+64*t^14+39*t^15+45*t^16+65*t^17+48*t^18+11*t^19)^2-(7*t^9+5*t^10)*(2*t^10+t^11+138*t^12+138*t^13+222*t^14+453*t^15+479*t^16+390*t^17+632*t^18+581*t^19+470*t^20+467*t^21+475*t^22+251*t^23+198*t^24+142*t^25+47*t^26+3*t^27+t^28+t^29+t^30) =
 t^19*geometricResidualB485 t := by unfold geometricResidualB485; ring
theorem geometric_gap_shiftB485 (n : ℤ) :
 geometricResidualB485 (n+8) = -(15737807882178560310+55734173907499251357*n+85494436936229811303*n^2+78614958122193174947*n^3+49547596240573777078*n^4+23002211506420759780*n^5+8218498802245565682*n^6+2325341091352540967*n^7+531086176482421262*n^8+99170141115441111*n^9+15263422301818893*n^10+1944708283504320*n^11+205310964680028*n^12+17919538541001*n^13+1285461469103*n^14+75027767173*n^15+3507439521*n^16+128231690*n^17+3533118*n^18+69011*n^19+852*n^20+5*n^21) := by
 unfold geometricResidualB485
 ring
theorem geometric_residual_negativeB485 (t : ℤ) (ht : 8≤t) :
 geometricResidualB485 t<0 := by
 let n := t-8
 have hn : 0≤n := by dsimp [n]; omega
 have h := geometric_gap_shiftB485 n
 have he : n+8=t := by dsimp [n]; ring
 rw [he] at h
 have hp : 0 < 15737807882178560310+55734173907499251357*n+85494436936229811303*n^2+78614958122193174947*n^3+49547596240573777078*n^4+23002211506420759780*n^5+8218498802245565682*n^6+2325341091352540967*n^7+531086176482421262*n^8+99170141115441111*n^9+15263422301818893*n^10+1944708283504320*n^11+205310964680028*n^12+17919538541001*n^13+1285461469103*n^14+75027767173*n^15+3507439521*n^16+128231690*n^17+3533118*n^18+69011*n^19+852*n^20+5*n^21 := by positivity
 omega
theorem geometric_horizontal_failureB485 (t : ℤ) (ht : 8≤t) :
 (activityCoeffB485 (X:ℤ[X]) X 1 (geometricWordB485 (C t)) 4).coeff 9^2 <
 (activityCoeffB485 (X:ℤ[X]) X 1 (geometricWordB485 (C t)) 3).coeff 9*
 (activityCoeffB485 (X:ℤ[X]) X 1 (geometricWordB485 (C t)) 5).coeff 9 := by
 rw [geometric_coeff3B485,geometric_coeff4B485,geometric_coeff5B485]
 have hp : 0<t^19 := pow_pos (by omega) _
 have hn := mul_neg_of_pos_of_neg hp (geometric_residual_negativeB485 t ht)
 rw [←geometric_gap_identityB485] at hn
 omega
#print axioms geometric_gap_identityB485
#print axioms geometric_gap_shiftB485
#print axioms geometric_residual_negativeB485
#print axioms geometric_horizontal_failureB485
end
end MathGKM.Markov
