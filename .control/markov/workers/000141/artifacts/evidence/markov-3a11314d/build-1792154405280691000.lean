import MarkovSourceCentralM3A1
import MarkovSourceLinearValueM553
/-! Machine-authored 3a11314d. Explicit source-dependent rational centers. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

def centralCenterM3A1 (z : ℝ) : ℝ := 1+10/(z^2+3*z+5)

theorem central_linear_identityM3A1 (z L M R : ℝ) (hz : 0≤z)
 (hm : 5*M=z*(z+3)*L) (hr : 56*R=z*(z-1)*(z+3)*(z+4)*L) :
 7*(z^2+3*z+5)^2*tripleLinearM553 2 L M R (centralCenterM3A1 z)=
 L*z*(z+3)*(31*z^2+93*z+100) := by
 have hd : z^2+3*z+5≠0 := by positivity
 have hm' : M=z*(z+3)*L/5 := by linarith
 have hr' : R=z*(z-1)*(z+3)*(z+4)*L/56 := by linarith
 rw [hm',hr']
 unfold centralCenterM3A1 tripleLinearM553
 field_simp
 <;> ring

theorem central_linear_nonnegM3A1 (z L M R : ℝ) (hz : 0≤z) (hL : 0≤L)
 (hm : 5*M=z*(z+3)*L) (hr : 56*R=z*(z-1)*(z+3)*(z+4)*L) :
 0≤tripleLinearM553 2 L M R (centralCenterM3A1 z) := by
 have h := central_linear_identityM3A1 z L M R hz hm hr
 have hd : 0<7*(z^2+3*z+5)^2 := by positivity
 have hp : 0≤L*z*(z+3)*(31*z^2+93*z+100) := by positivity
 have hh : 0≤7*(z^2+3*z+5)^2*tripleLinearM553 2 L M R (centralCenterM3A1 z) := by
   rw [h]; exact hp
 exact (mul_nonneg_iff_of_pos_left hd).mp hh

theorem central_two_linearM3A1 (q : ℕ) :
 let P := fib6 (q+2)^2+V*fib6 (q+1)^2
 0≤tripleLinearM553 2 (coeff P 2 (q+1)) (coeff P 3 (q+1))
   (coeff P 4 (q+1)) (centralCenterM3A1 (q+1)) := by
 dsimp only
 obtain ⟨hL,hM,hR⟩ := central_two_valuesM3A1 q
 have hL' : (6:ℝ)*(coeff (fib6 (q+2)^2+V*fib6 (q+1)^2) 2 (q+1):ℝ)=
   ((q:ℝ)+2)*(q+3)*(2*(q+1)+3) := by exact_mod_cast hL
 have hM' : (30:ℝ)*(coeff (fib6 (q+2)^2+V*fib6 (q+1)^2) 3 (q+1):ℝ)=
   ((q:ℝ)+1)*(q+2)*(q+3)*(q+4)*(2*(q+1)+3) := by exact_mod_cast hM
 have hR' : (336:ℝ)*(coeff (fib6 (q+2)^2+V*fib6 (q+1)^2) 4 (q+1):ℝ)=
   ((q:ℝ)+1)*q*(q+2)*(q+3)*(q+4)*(q+5)*(2*(q+1)+3) := by exact_mod_cast hR
 apply central_linear_nonnegM3A1 (q+1) _ _ _ (by positivity)
 · have hp : (0:ℝ)≤((q:ℝ)+2)*(q+3)*(2*(q+1)+3) := by positivity
   linarith
 · linear_combination (hM'-((q:ℝ)+1)*(q+4)*hL')/6
 · linear_combination (hR'-((q:ℝ)+1)*q*(q+4)*(q+5)*hL')/6

theorem source_two_central_linearM3A1 (path : List Bool) (j : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*j+1) :
 0≤linearMomentM553
   ((hresidualM511 (X:ℤ[X]) (sourceWord28 path) j).map (Int.castRingHom ℝ))
   0 2 (centralCenterM3A1 j) := by
 have h := source_horizontal_linear_valueM553 path 2 j (centralCenterM3A1 j)
   (by omega)
 have he : (frame path).mid.b-2*j-1=0 := by omega
 rw [he] at h
 norm_num only [Nat.zero_add,Nat.cast_ofNat,Nat.reduceAdd] at h
 rw [h]
 obtain ⟨q,hq,hb',hp⟩ := source_two_squares3556 path ha
 have heq : q=j := by omega
 subst q
 obtain ⟨k,hk⟩ : ∃ k, j=k+1 := ⟨j-1,by omega⟩
 subst j
 rw [hp]
 simpa only [Nat.add_assoc,Nat.cast_add,Nat.cast_one] using central_two_linearM3A1 k

end
end MathGKM.Markov
