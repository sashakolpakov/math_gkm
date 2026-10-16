import MarkovFallingM81F
/-! Machine-authored f25b03a1. Arbitrary-degree exact raw-gap criterion.
No sign or log-concavity assumption on the seed polynomial; zeros retained.
This is a coefficient identity and equivalence, not a source positivity proof. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

def fallingKernelMF25 (P : ℝ[X]) (d k l : ℕ) : ℝ :=
 ∑ r ∈ Finset.range (d+1), P.coeff r * fallM81F k r * fallM81F l (d-r)

theorem falling_polynomialMF25 (P : ℝ[X]) (d k l : ℕ)
 (hP : P.natDegree ≤ d) (hd : d ≤ k+l) :
 fallM81F (k+l) d * (((1+X)^(k+l-d)*P).coeff k) =
 ((k+l).choose k:ℝ)*fallingKernelMF25 P d k l := by
 conv_lhs => rw [P.as_sum_range_C_mul_X_pow' (show P.natDegree<d+1 by omega)]
 simp only [Finset.mul_sum,Polynomial.finset_sum_coeff]
 unfold fallingKernelMF25
 rw [Finset.mul_sum]
 apply Finset.sum_congr rfl
 intro r hr
 have he : (1+(X:ℝ[X]))^(k+l-d)*(C (P.coeff r)*X^r)=
   C (P.coeff r)*((1+X)^(k+l-d)*X^r) := by ring
 rw [he,Polynomial.coeff_C_mul]
 have h := falling_monomialM81F k l d r (by simpa using Finset.mem_range.mp hr) hd
 linear_combination P.coeff r*h

theorem falling_positiveMF25 (n d : ℕ) (hd : d ≤ n) : 0 < fallM81F n d := by
 rw [fallM81F,descPochhammer_eval_eq_descFactorial]
 exact_mod_cast Nat.descFactorial_pos.mpr hd

theorem falling_binomial_productMF25 (i j : ℕ) :
 (i+2:ℝ)*(j+2)*((i+j+2).choose i:ℝ)*((i+j+2).choose (i+2):ℝ)=
 (i+1:ℝ)*(j+1)*((i+j+2).choose (i+1):ℝ)^2 := by
 have h0 := Nat.add_one_mul_choose_eq (i+j+2) i
 have h1 := Nat.add_one_mul_choose_eq (i+j+2) (i+1)
 have e0 : (i+j+2+1).choose (i+1)=(i+j+2).choose (i+1)+(i+j+2).choose i := by
   rw [Nat.choose_succ_succ]; simp [Nat.succ_eq_add_one,add_comm]
 have e1 : (i+j+2+1).choose (i+1+1)=(i+j+2).choose (i+2)+(i+j+2).choose (i+1) := by
   rw [Nat.choose_succ_succ]
   simp only [Nat.succ_eq_add_one,show i+1+1=i+2 by omega]
   ring
 rw [e0] at h0
 rw [e1] at h1
 have c0 : (i+1:ℝ)*((i+j+2).choose (i+1):ℝ)=
   (j+2:ℝ)*((i+j+2).choose i:ℝ) := by exact_mod_cast (by nlinarith [h0] : (i+1)*(i+j+2).choose (i+1)=(j+2)*(i+j+2).choose i)
 have c1 : (i+2:ℝ)*((i+j+2).choose (i+2):ℝ)=
   (j+1:ℝ)*((i+j+2).choose (i+1):ℝ) := by exact_mod_cast (by nlinarith [h1] : (i+2)*(i+j+2).choose (i+2)=(j+1)*(i+j+2).choose (i+1))
 calc
  _ = ((j+2:ℝ)*((i+j+2).choose i:ℝ))*((i+2:ℝ)*((i+j+2).choose (i+2):ℝ)) := by ring
  _ = _ := by rw [←c0,c1]; ring

def fallingGapMF25 (P : ℝ[X]) (d i j : ℕ) : ℝ :=
 (i+2:ℝ)*(j+2)*(fallingKernelMF25 P d (i+1) (j+1))^2-
 (i+1:ℝ)*(j+1)*fallingKernelMF25 P d i (j+2)*fallingKernelMF25 P d (i+2) j

theorem falling_gap_identityMF25 (P : ℝ[X]) (d i j : ℕ)
 (hP : P.natDegree ≤ d) (hd : d ≤ i+j+2) :
 let Q := (1+X)^(i+j+2-d)*P
 (i+2:ℝ)*(j+2)*(fallM81F (i+j+2) d)^2*
   (Q.coeff (i+1)^2-Q.coeff i*Q.coeff (i+2)) =
 ((i+j+2).choose (i+1):ℝ)^2*fallingGapMF25 P d i j := by
 dsimp only
 have h0 := falling_polynomialMF25 P d i (j+2) hP (by omega)
 have h1 := falling_polynomialMF25 P d (i+1) (j+1) hP (by omega)
 have h2 := falling_polynomialMF25 P d (i+2) j hP (by omega)
 rw [show i+(j+2)=i+j+2 by omega] at h0
 rw [show i+1+(j+1)=i+j+2 by omega] at h1
 rw [show i+2+j=i+j+2 by omega] at h2
 have hp := congrArg₂ (fun x y : ℝ => x*y) h0 h2
 have hq := congrArg (fun x : ℝ => x^2) h1
 have hb := falling_binomial_productMF25 i j
 unfold fallingGapMF25
 linear_combination (i+2:ℝ)*(j+2)*hq-(i+2:ℝ)*(j+2)*hp-
   fallingKernelMF25 P d i (j+2)*fallingKernelMF25 P d (i+2) j*hb

theorem falling_gap_iffMF25 (P : ℝ[X]) (d i j : ℕ)
 (hP : P.natDegree ≤ d) (hd : d ≤ i+j+2) :
 let Q := (1+X)^(i+j+2-d)*P
 Q.coeff i*Q.coeff (i+2) ≤ Q.coeff (i+1)^2 ↔ 0 ≤ fallingGapMF25 P d i j := by
 have he := falling_gap_identityMF25 P d i j hP hd
 have hF := falling_positiveMF25 (i+j+2) d hd
 have hB : (0:ℝ)<((i+j+2).choose (i+1):ℝ) := by
   exact_mod_cast Nat.choose_pos (by omega : i+1 ≤ i+j+2)
 have hs : (0:ℝ)<(i+2)*(j+2)*(fallM81F (i+j+2) d)^2 := by positivity
 have ht : (0:ℝ)<((i+j+2).choose (i+1):ℝ)^2 := by positivity
 dsimp only at he ⊢
 rw [←sub_nonneg,←mul_nonneg_iff_of_pos_left hs,he,mul_nonneg_iff_of_pos_left ht]

theorem smoothed_degreeMF25 (P : ℝ[X]) (n d : ℕ)
 (hP : P.natDegree ≤ d) (hd : d ≤ n) :
 (((1+X)^(n-d)*P):ℝ[X]).natDegree ≤ n := by
 compute_degree
 omega

theorem smoothed_all_iffMF25 (P : ℝ[X]) (n d : ℕ)
 (hP : P.natDegree ≤ d) (hd : d ≤ n) :
 (∀ i, (((1+X)^(n-d)*P):ℝ[X]).coeff i *
        (((1+X)^(n-d)*P):ℝ[X]).coeff (i+2) ≤
        (((1+X)^(n-d)*P):ℝ[X]).coeff (i+1)^2) ↔
 (∀ i j, n=i+j+2 → 0 ≤ fallingGapMF25 P d i j) := by
 constructor
 · intro h i j he
   subst n
   exact (falling_gap_iffMF25 P d i j hP hd).mp (h i)
 · intro h i
   by_cases hi : i+2 ≤ n
   · have he : n=i+(n-(i+2))+2 := by omega
     have hh := (falling_gap_iffMF25 P d i (n-(i+2)) hP (by omega)).mpr (h i _ he)
     simpa only [←he] using hh
   · have hz : (((1+X)^(n-d)*P):ℝ[X]).coeff (i+2)=0 :=
       Polynomial.coeff_eq_zero_of_natDegree_lt
         (lt_of_le_of_lt (smoothed_degreeMF25 P n d hP hd) (by omega))
     rw [hz,mul_zero]
     exact sq_nonneg _
end
end MathGKM.Markov
