import MarkovSecondCompressed446
/-! Machine-authored 446bbcdc. Cubic second-slice inequalities. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

def cubicA446 (c r : ℤ) := (c+r-1)*(c+r-2)
def cubicB446 (c r : ℤ) := 2*(3*r*(c+r)-8*r+2)
def cubicC446 (r : ℤ) := 9*r^2-5*r+2
def cubicD446 (c r : ℕ) : ℤ := 8*(2*r-c:ℕ)+if c=2 then 2 else 0

theorem cubic_first_gap446 (c r : ℤ) (hr : 1≤r) (hc : r+1≤c) :
 cubicA446 c r*cubicC446 r≤(cubicB446 c r)^2 := by
 let u := r-1
 let v := c-r-1
 have hu : 0≤u := by dsimp [u]; omega
 have hv : 0≤v := by dsimp [v]; omega
 have he : (cubicB446 c r)^2-cubicA446 c r*cubicC446 r=
   24+54*v+30*v^2+106*u+177*u*v+59*u*v^2+220*u^2+
   233*u^2*v+27*u^2*v^2+230*u^3+108*u^3*v+108*u^4 := by
   dsimp [cubicA446,cubicB446,cubicC446,u,v]
   ring
 have hp : 0≤24+54*v+30*v^2+106*u+177*u*v+59*u*v^2+220*u^2+
   233*u^2*v+27*u^2*v^2+230*u^3+108*u^3*v+108*u^4 := by positivity
 omega

theorem cubic_second_gap446 (c r : ℕ) (hr : 0<r) (hc : r<c) :
 cubicB446 c r*cubicD446 c r≤(cubicC446 r)^2 := by
 by_cases h2 : c=2
 · have hr1 : r=1 := by omega
   subst c; subst r
   norm_num [cubicB446,cubicC446,cubicD446]
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
     have he : (cubicC446 r)^2-cubicB446 c r*cubicD446 c r=
       528+1176*v+1065*v^2+462*v^3+81*v^4+1336*u+2290*u*v+
       1434*u*v^2+324*u*v^3+1321*u^2+1530*u^2*v+486*u^2*v^2+
       558*u^3+324*u^3*v+81*u^4 := by
       simp only [cubicD446,if_neg h2,hcast,add_zero]
       dsimp [cubicB446,cubicC446,u,v]
       ring
     have hp : 0≤528+1176*v+1065*v^2+462*v^3+81*v^4+1336*u+2290*u*v+
       1434*u*v^2+324*u*v^3+1321*u^2+1530*u^2*v+486*u^2*v^2+
       558*u^3+324*u^3*v+81*u^4 := by positivity
     omega

def cubicSeq446 (c r : ℕ) : ℕ → ℤ
 | 0 => cubicA446 c r
 | 1 => cubicB446 c r
 | 2 => cubicC446 r
 | 3 => cubicD446 c r
 | _+4 => 0

theorem cubicSeq_lc446 (c r j : ℕ) (hr : 0<r) (hc : r<c) :
 cubicSeq446 c r j*cubicSeq446 c r (j+2)≤cubicSeq446 c r (j+1)^2 := by
 rcases j with _ | _ | _ | j
 · exact cubic_first_gap446 c r (by exact_mod_cast hr) (by exact_mod_cast hc)
 · exact cubic_second_gap446 c r hr hc
 · simp [cubicSeq446,sq_nonneg]
 · cases j <;> simp [cubicSeq446]

def cubicPoly446 (c r : ℕ) : ℤ[X] :=
 C (cubicA446 c r)+C (cubicB446 c r)*X+C (cubicC446 r)*X^2+C (cubicD446 c r)*X^3

theorem secondCompressed_zero446 (c r : ℕ) :
 secondCompressed446 0 c r=cubicPoly446 c r := by
 unfold secondCompressed446 cubicPoly446
 simp only [runK_scalarBF]
 norm_num [lowerH487,runCOneBF,runDTwoBF,runB446,runD446,runSumA27,
   cubicA446,cubicB446,cubicC446,cubicD446]
 push_cast
 split_ifs <;> push_cast <;> ring

theorem cubicPoly_coeff446 (c r j : ℕ) :
 (cubicPoly446 c r).coeff j=cubicSeq446 c r j := by
 rcases j with _ | _ | _ | _ | j <;>
   simp [cubicPoly446,cubicSeq446,Polynomial.coeff_C_mul,
     Polynomial.coeff_X_pow,Polynomial.coeff_X,Polynomial.coeff_C]

#print axioms cubic_first_gap446
#print axioms cubic_second_gap446
#print axioms cubicSeq_lc446
#print axioms secondCompressed_zero446
end
end MathGKM.Markov
