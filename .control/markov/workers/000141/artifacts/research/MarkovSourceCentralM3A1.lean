import MarkovCentralSquareM3A1
import MarkovSquares3556
/-! Machine-authored 3a11314d. A universal source-connected central triple.
This covers a proper subfamily of the exact root and retains raw coefficients. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
open Polynomial

theorem central_two_valuesM3A1 (q : ℕ) :
 let P := fib6 (q+2)^2+V*fib6 (q+1)^2
 let z : ℤ := q+1
 6*coeff P 2 (q+1)=(z+1)*(z+2)*(2*z+3) ∧
 30*coeff P 3 (q+1)=z*(z+1)*(z+2)*(z+3)*(2*z+3) ∧
 336*coeff P 4 (q+1)=z*(z-1)*(z+1)*(z+2)*(z+3)*(z+4)*(2*z+3) := by
 dsimp only
 have hc (i : ℕ) : coeff (fib6 (q+2)^2+V*fib6 (q+1)^2) i (q+1)=
   coeff (fib6 (q+2)^2) i (q+1)+coeff (fib6 (q+1)^2) i q := by
   simp [coeff,V,Polynomial.coeff_X_mul]
 simp only [hc]
 obtain ⟨h20,h30,h40⟩ := central_square_valuesM3A1 q
 obtain ⟨h21,h31,h41⟩ := central_square_valuesM3A1 (q+1)
 rw [show q+1+1=q+2 by omega] at h21 h31 h41
 push_cast at h21 h31 h41
 refine ⟨?_,?_,?_⟩
 · linear_combination h20+h21
 · linear_combination h30+h31
 · linear_combination h40+h41

theorem central_gap_identityM3A1 (z L M R : ℤ)
 (hL : 6*L=(z+1)*(z+2)*(2*z+3))
 (hM : 30*M=z*(z+1)*(z+2)*(z+3)*(2*z+3))
 (hR : 336*R=z*(z-1)*(z+1)*(z+2)*(z+3)*(z+4)*(2*z+3)) :
 1400*(M^2-L*R)=L^2*z*(z+3)*(31*z^2+93*z+100) := by
 have hm : 5*M=z*(z+3)*L := by
   have h : 6*(5*M-z*(z+3)*L)=0 := by
     linear_combination hM-z*(z+3)*hL
   omega
 have hr : 56*R=z*(z-1)*(z+3)*(z+4)*L := by
   have h : 6*(56*R-z*(z-1)*(z+3)*(z+4)*L)=0 := by
     linear_combination hR-z*(z-1)*(z+3)*(z+4)*hL
   omega
 have hs := congrArg (fun x : ℤ => x^2) hm
 linear_combination 56*hs-25*L*hr

theorem central_two_lcM3A1 (q : ℕ) :
 let P := fib6 (q+2)^2+V*fib6 (q+1)^2
 coeff P 2 (q+1)*coeff P 4 (q+1)≤coeff P 3 (q+1)^2 := by
 dsimp only
 obtain ⟨hL,hM,hR⟩ := central_two_valuesM3A1 q
 have h := central_gap_identityM3A1 (q+1) _ _ _ hL hM hR
 have hp : 0≤(coeff (fib6 (q+2)^2+V*fib6 (q+1)^2) 2 (q+1))^2*
   ((q:ℤ)+1)*(q+1+3)*(31*(q+1)^2+93*(q+1)+100) := by positivity
 nlinarith only [h,hp]

theorem source_two_centralM3A1 (path : List Bool) (j : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*j+1) :
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 4 j≤
   coeff (frame path).mid.p 3 j^2 := by
 obtain ⟨q,hq,hb',hp⟩ := source_two_squares3556 path ha
 have he : q=j := by omega
 subst q
 obtain ⟨k,hk⟩ : ∃ k, j=k+1 := ⟨j-1,by omega⟩
 subst j
 rw [hp]
 simpa only [Nat.add_assoc] using central_two_lcM3A1 k

theorem source_two_central_polygonM3A1 (path : List Bool) (j : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*j+1) (hj : 2≤j) :
 InPolygon (frame path).mid.a (frame path).mid.b 2 j ∧
 InPolygon (frame path).mid.a (frame path).mid.b 3 j ∧
 InPolygon (frame path).mid.a (frame path).mid.b 4 j := by
 rw [ha,hb]
 unfold InPolygon
 omega

end
end MathGKM.Markov
