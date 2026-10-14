import MarkovCubicBounds446
/-! Machine-authored e27336bc. The full n=1 second lower slice, including
the exceptional two-run correction and every zero in the tail. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 1500000
set_option linter.unusedSimpArgs false
def quintic0E273 (c r : ℤ) := 2 + -3*r + 1*r^2 + -6*c + 4*c*r + 4*c^2
def quintic1E273 (c r : ℤ) := 4 + -16*r + 6*r^2 + -16*c + 18*c*r + 12*c^2
def quintic2E273 (c r : ℤ) := 2 + -45*r + 17*r^2 + -5*c + 34*c*r + 9*c^2
def quintic3E273 (c r : ℤ) := -40*r + 24*r^2 + 8*c + 24*c*r
def quintic4E273 (c r : ℤ) := 16*r^2

theorem quintic_gap0E273 (c r : ℤ) (hr : 1≤r) (hc : r+1≤c) :
 quintic0E273 c r*quintic2E273 c r≤quintic1E273 c r^2 := by
 let u := r-1
 let v := c-r-1
 have hu : 0≤u := by dsimp [u]; omega
 have hv : 0≤v := by dsimp [v]; omega
 have he : quintic1E273 c r^2-quintic0E273 c r*quintic2E273 c r=
   1300 + 2868*v + 2314*v^2 + 814*v^3 + 108*v^4 + 4652*u + 7551*u*v + 3983*u*v^2 + 692*u*v^3 + 6142*u^2 + 6507*u^2*v + 1683*u^2*v^2 + 3546*u^3 + 1836*u^3*v + 756*u^4 := by dsimp [quintic0E273,quintic1E273,quintic2E273,u,v]; ring
 have hp : 0≤1300 + 2868*v + 2314*v^2 + 814*v^3 + 108*v^4 + 4652*u + 7551*u*v + 3983*u*v^2 + 692*u*v^3 + 6142*u^2 + 6507*u^2*v + 1683*u^2*v^2 + 3546*u^3 + 1836*u^3*v + 756*u^4 := by positivity
 omega

theorem quintic_gap1E273 (c r : ℤ) (hr : 1≤r) (hc : r+1≤c) :
 quintic1E273 c r*quintic3E273 c r≤quintic2E273 c r^2 := by
 let u := r-1
 let v := c-r-1
 have hu : 0≤u := by dsimp [u]; omega
 have hv : 0≤v := by dsimp [v]; omega
 have he : quintic2E273 c r^2-quintic1E273 c r*quintic3E273 c r=
   2416 + 4968*v + 3273*v^2 + 786*v^3 + 81*v^4 + 8608*u + 12788*u*v + 5356*u*v^2 + 648*u*v^3 + 11892*u^2 + 11272*u^2*v + 2200*u^2*v^2 + 7536*u^3 + 3360*u^3*v + 1872*u^4 := by dsimp [quintic1E273,quintic2E273,quintic3E273,u,v]; ring
 have hp : 0≤2416 + 4968*v + 3273*v^2 + 786*v^3 + 81*v^4 + 8608*u + 12788*u*v + 5356*u*v^2 + 648*u*v^3 + 11892*u^2 + 11272*u^2*v + 2200*u^2*v^2 + 7536*u^3 + 3360*u^3*v + 1872*u^4 := by positivity
 omega

theorem quintic_gap2E273 (c r : ℤ) (hr : 1≤r) (hc : r+1≤c) :
 quintic2E273 c r*quintic4E273 c r≤quintic3E273 c r^2 := by
 let u := r-1
 let v := c-r-1
 have hu : 0≤u := by dsimp [u]; omega
 have hv : 0≤v := by dsimp [v]; omega
 have he : quintic3E273 c r^2-quintic2E273 c r*quintic4E273 c r=
   1216 + 2032*v + 880*v^2 + 4320*u + 5024*u*v + 1248*u*v^2 + 6400*u^2 + 4592*u^2*v + 432*u^2*v^2 + 4576*u^3 + 1472*u^3*v + 1344*u^4 := by dsimp [quintic2E273,quintic3E273,quintic4E273,u,v]; ring
 have hp : 0≤1216 + 2032*v + 880*v^2 + 4320*u + 5024*u*v + 1248*u*v^2 + 6400*u^2 + 4592*u^2*v + 432*u^2*v^2 + 4576*u^3 + 1472*u^3*v + 1344*u^4 := by positivity
 omega

theorem quintic_gap3E273 (c r : ℕ) (hr : 0<r) (hc : r<c) :
 quintic3E273 c r*cubicD446 c r≤quintic4E273 c r^2 := by
 by_cases h2 : c=2
 · have hr1 : r=1 := by omega
   subst c; subst r
   norm_num [quintic3E273,quintic4E273,cubicD446]
 · by_cases hq : 2*r≤c
   · have hz : 2*r-c=0 := by omega
     simp [cubicD446,h2,hz,sq_nonneg]
   · have hq' : c≤2*r := by omega
     have hcast : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-c := by
       rw [Nat.cast_sub hq']; push_cast; ring
     let u : ℤ := (c:ℤ)-r-1
     let v : ℤ := 2*(r:ℤ)-c-1
     have hcz : (r:ℤ)+1≤c := by exact_mod_cast hc
     have hqz : (c:ℤ)+1≤2*(r:ℤ) := by exact_mod_cast (show c+1≤2*r by omega)
     have hu : 0≤u := by dsimp [u]; omega
     have hv : 0≤v := by dsimp [v]; omega
     have he : quintic4E273 c r^2-quintic3E273 c r*cubicD446 c r=
       2624 + 5248*v + 4288*v^2 + 1664*v^3 + 256*v^4 + 6272*u + 9408*u*v + 5184*u*v^2 + 1024*u*v^3 + 5568*u^2 + 5568*u^2*v + 1536*u^2*v^2 + 2048*u^3 + 1024*u^3*v + 256*u^4 := by
       simp only [cubicD446,if_neg h2,hcast,add_zero]
       dsimp [quintic3E273,quintic4E273,u,v]
       ring
     have hp : 0≤2624 + 5248*v + 4288*v^2 + 1664*v^3 + 256*v^4 + 6272*u + 9408*u*v + 5184*u*v^2 + 1024*u*v^3 + 5568*u^2 + 5568*u^2*v + 1536*u^2*v^2 + 2048*u^3 + 1024*u^3*v + 256*u^4 := by positivity
     omega

def quinticSeqE273 (c r : ℕ) : ℕ → ℤ
 | 0 => quintic0E273 c r
 | 1 => quintic1E273 c r
 | 2 => quintic2E273 c r
 | 3 => quintic3E273 c r
 | 4 => quintic4E273 c r
 | 5 => cubicD446 c r
 | _+6 => 0

theorem quinticSeq_lcE273 (c r j : ℕ) (hr : 0<r) (hc : r<c) :
 quinticSeqE273 c r j*quinticSeqE273 c r (j+2)≤quinticSeqE273 c r (j+1)^2 := by
 rcases j with _ | _ | _ | _ | _ | j
 · exact quintic_gap0E273 c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · exact quintic_gap1E273 c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · exact quintic_gap2E273 c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · exact quintic_gap3E273 c r hr hc
 · simp [quinticSeqE273,sq_nonneg]
 · cases j <;> simp [quinticSeqE273]

def quinticPolyE273 (c r : ℕ) : ℤ[X] :=
 C (quintic0E273 c r)+C (quintic1E273 c r)*X+C (quintic2E273 c r)*X^2+
 C (quintic3E273 c r)*X^3+C (quintic4E273 c r)*X^4+C (cubicD446 c r)*X^5

theorem secondCompressed_oneE273 (c r : ℕ) :
 secondCompressed446 1 c r=quinticPolyE273 c r := by
 unfold secondCompressed446 quinticPolyE273
 simp only [runK_scalarBF]
 norm_num [lowerH487,runCOneBF,runDTwoBF,runB446,runD446,runSumA27,
   quintic0E273,quintic1E273,quintic2E273,quintic3E273,quintic4E273,cubicD446]
 push_cast
 split_ifs <;> push_cast <;> ring

theorem quinticPoly_coeffE273 (c r j : ℕ) :
 (quinticPolyE273 c r).coeff j=quinticSeqE273 c r j := by
 simp only [quinticPolyE273,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   Polynomial.coeff_C,Polynomial.coeff_X_pow,Polynomial.coeff_X]
 rcases j with _ | _ | _ | _ | _ | _ | j <;> simp [quinticSeqE273]

#print axioms quinticSeq_lcE273
#print axioms secondCompressed_oneE273
end
end MathGKM.Markov
