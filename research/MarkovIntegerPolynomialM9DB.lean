import MarkovFixedDepthGeneralM9DB
/-! Machine-authored 9db2326d. Integer polynomial representations of
factorial-cleared binomial sums. All natural support zeros are retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 8000000

def fallingPolyM9DB (A n : ℕ) : Polynomial ℤ :=
 (descPochhammer ℤ n).comp (X+C (A:ℤ))

theorem falling_poly_evalM9DB (x A n : ℕ) :
 (fallingPolyM9DB A n).eval (x:ℤ)=((x+A).descFactorial n:ℤ) := by
 simp only [fallingPolyM9DB,eval_comp,eval_add,eval_X,eval_C,←Nat.cast_add]
 exact descPochhammer_eval_eq_descFactorial ℤ (x+A) n

def binomialPolyM9DB (N A n : ℕ) : Polynomial ℤ :=
 C ((N.factorial/n.factorial:ℕ):ℤ)*fallingPolyM9DB A n

theorem binomial_poly_evalM9DB (x N A n : ℕ) (hn : n ≤ N) :
 (binomialPolyM9DB N A n).eval (x:ℤ)=
 (N.factorial:ℤ)*((x+A).choose n:ℤ) := by
 rw [binomialPolyM9DB,eval_mul,eval_C,falling_poly_evalM9DB]
 have h : (N.factorial/n.factorial)*(x+A).descFactorial n=
     N.factorial*(x+A).choose n := by
   rw [Nat.descFactorial_eq_factorial_mul_choose,←Nat.mul_assoc,
     Nat.div_mul_cancel (Nat.factorial_dvd_factorial hn)]
 exact_mod_cast h

def binomialProductPolyM9DB (N A a B b : ℕ) : Polynomial ℤ :=
 C ((N.factorial/(a.factorial*b.factorial):ℕ):ℤ)*fallingPolyM9DB A a*fallingPolyM9DB B b

theorem binomial_product_poly_evalM9DB (x N A a B b : ℕ) (hn : a+b ≤ N) :
 (binomialProductPolyM9DB N A a B b).eval (x:ℤ)=
 (N.factorial:ℤ)*((x+A).choose a:ℤ)*((x+B).choose b:ℤ) := by
 simp only [binomialProductPolyM9DB,eval_mul,eval_C,falling_poly_evalM9DB]
 have hd : a.factorial*b.factorial ∣ N.factorial := by
   have h := Nat.factorial_mul_factorial_dvd_factorial (Nat.le_add_right a b)
   rw [Nat.add_sub_cancel_left] at h
   exact h.trans (Nat.factorial_dvd_factorial hn)
 have h : (N.factorial/(a.factorial*b.factorial))*(x+A).descFactorial a*
     (x+B).descFactorial b=N.factorial*(x+A).choose a*(x+B).choose b := by
   rw [Nat.descFactorial_eq_factorial_mul_choose,Nat.descFactorial_eq_factorial_mul_choose]
   calc
    _ = ((N.factorial/(a.factorial*b.factorial))*(a.factorial*b.factorial))*
      (x+A).choose a*(x+B).choose b := by ring
    _ = _ := by rw [Nat.div_mul_cancel hd]
 exact_mod_cast h

def topPolyM9DB (d T c : ℕ) : Polynomial ℤ :=
 ∑ l ∈ range (c+4), C ((c+l).choose c:ℤ)*
 (binomialProductPolyM9DB (2*c+5) (d+2*c+8) (c+3-l) T (c+l)+
   C 4*binomialProductPolyM9DB (2*c+5) (d+2*c+8) (c+3-l) (T+1) (c+l+2))

theorem top_poly_evalM9DB (x d T c : ℕ) :
 (topPolyM9DB d T c).eval (x:ℤ)=
 ((2*c+5).factorial:ℤ)*topShortSumMEB6 (x+d) (x+T) c := by
 simp only [topPolyM9DB,eval_finset_sum,eval_mul,eval_C,eval_add,topShortSumMEB6,mul_sum]
 apply sum_congr rfl
 intro l hl
 have hl' : l ≤ c+3 := by have := mem_range.mp hl; omega
 rw [binomial_product_poly_evalM9DB _ _ _ _ _ _ (by omega),
   binomial_product_poly_evalM9DB _ _ _ _ _ _ (by omega)]
 simp only [Nat.add_assoc]
 ring

def kernelPolyM9DB (N D k a b : ℕ) : Polynomial ℤ :=
 ∑ l ∈ range (b+1), C (((a+l).choose a:ℤ)*(k.choose (a+l+2):ℤ))*
   binomialPolyM9DB N (D+a) (b-l)

theorem kernel_poly_evalM9DB (x N D k a b : ℕ) (hb : b ≤ N) :
 (kernelPolyM9DB N D k a b).eval (x:ℤ)=
 (N.factorial:ℤ)*middleKernelMD02 (x+D) k a b := by
 simp only [kernelPolyM9DB,eval_finset_sum,eval_mul,eval_C,middleKernelMD02,mul_sum]
 apply sum_congr rfl
 intro l hl
 rw [binomial_poly_evalM9DB _ _ _ _ (by omega)]
 simp only [Nat.add_assoc]
 ring

end
end MathGKM.Markov
