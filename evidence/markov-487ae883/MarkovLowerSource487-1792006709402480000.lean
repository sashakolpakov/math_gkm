import MarkovLowerFormula487
import MarkovLowerSequence487
import MarkovPellRawLC0618
/-! Machine-authored 487ae883. First lower source diagonal, raw coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

def lowerPoly487 (n c r : ℕ) : ℤ[X] :=
 C (c:ℤ)*lowerH487 n+C (r:ℤ)*(1+3*X+4*X*runSumA27 X n)-1-X

theorem lowerPoly_coeff487 (n c r : ℕ) (hr : r<c) (j : ℕ) :
 (lowerPoly487 n c r).coeff j=lowerSeq487 (c*n+r) c j := by
 obtain ⟨h0,h1,hj⟩ := lowerH_coeff487 n
 have he : 4*X*runSumA27 (X : ℤ[X]) n=X*(4*runSumA27 X n) := by ring
 cases j with
 | zero =>
   rw [lowerPoly487,he]
   simp [lowerSeq487,Polynomial.coeff_sub,Polynomial.coeff_add,Polynomial.coeff_one,
     Polynomial.coeff_C_mul,Polynomial.coeff_ofNat_mul,Polynomial.coeff_mul_X,
     Polynomial.coeff_X_mul,h0] <;> ring
 | succ j => cases j with
   | zero =>
     rw [lowerPoly487,he]
     simp [lowerSeq487,Polynomial.coeff_sub,Polynomial.coeff_add,Polynomial.coeff_one,
       Polynomial.coeff_C_mul,Polynomial.coeff_ofNat_mul,Polynomial.coeff_mul_X,
       Polynomial.coeff_X_mul,h1,runSumA27,Polynomial.finsetSum_coeff,
       Polynomial.coeff_X_pow] <;> ring
   | succ j =>
     change (lowerPoly487 n c r).coeff (j+2)=max (4*((c:ℤ)*n+r-c*(j+1))) 0
     simp only [lowerPoly487,he,Polynomial.coeff_sub,Polynomial.coeff_add,
       Polynomial.coeff_C_mul,Polynomial.coeff_X_mul,Polynomial.coeff_ofNat_mul]
     rw [hj,runSum_coeff487]
     simp only [Polynomial.coeff_one,Polynomial.coeff_X,
       show j+2≠0 by omega,show j+2≠1 by omega,if_false,mul_zero,add_zero,
       zero_add,sub_zero]
     by_cases h : j<n
     · rw [if_pos h]
       have hs : ((n-(j+1):ℕ):ℤ)=(n:ℤ)-(j+1) := by
         rw [Nat.cast_sub (by omega)]; push_cast; ring
       rw [hs,max_eq_left (by
         have hn : (j:ℤ)+1≤n := by exact_mod_cast (show j+1≤n by omega)
         have hc : (0:ℤ)≤c := by positivity
         have hh := mul_le_mul_of_nonneg_left hn hc
         nlinarith)]
       ring
     · rw [if_neg h,show n-(j+1)=0 by omega]
       have hn : (n:ℤ)≤j := by exact_mod_cast (show n≤j by omega)
       have hrz : (r:ℤ)<c := by exact_mod_cast hr
       have hc : (0:ℤ)≤c := by positivity
       have hh := mul_le_mul_of_nonneg_left hn hc
       rw [max_eq_right (by nlinarith)]
       ring

theorem source_first_lower_diagonal487 (path : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame path).mid.a+1)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 rcases source_lower_slice487 path with ⟨k,rfl⟩ |
   ⟨n,c,r,hc,hr0,hr,ha,hb,hp⟩
 · rw [(right_labels650 k).1,(right_labels650 k).2] at h0 h1 h2
   exact right_raw_diagonal0618 k i j h0 h1 h2
 · have hp' : cutCoeffA27 (X : ℤ[X]) X 1 (central28 path++[true]) 1=
       lowerPoly487 n c r := by simpa [lowerPoly487] using hp
   rw [source_cut_coeffA27 path i (j+2) 1 (by omega),
     source_cut_coeffA27 path (i+2) j 1 (by omega),
     source_cut_coeffA27 path (i+1) (j+1) 1 (by omega),hp',
     lowerPoly_coeff487 n c r hr,lowerPoly_coeff487 n c r hr,
     lowerPoly_coeff487 n c r hr]
   have hca : (1:ℤ)≤(c:ℤ)*n+r := by
     have hrz : (1:ℤ)≤r := by exact_mod_cast hr0
     have hpz : (0:ℤ)≤(c:ℤ)*n := by positivity
     omega
   have hcc : (1:ℤ)≤c := by exact_mod_cast (show 1≤c by omega)
   simpa [mul_comm] using lowerSeq_lc487 ((c:ℤ)*n+r) c hca hcc j

#print axioms lowerPoly_coeff487
#print axioms source_first_lower_diagonal487
end
end MathGKM.Markov
