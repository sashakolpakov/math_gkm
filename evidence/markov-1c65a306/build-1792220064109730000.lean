import MarkovUpperTailM1C6
/-! Machine-authored 1c65a306. Exact rising-product expression for all reversed
product coefficients, including the exceptional endpoint weights. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 8000000

def riseM1C6 (n : ℕ) (x : ℝ) : ℝ := ∏ i ∈ range n, (x+i+1)

theorem rise_natM1C6 (n x : ℕ) : riseM1C6 n (x:ℝ)=((x+1).ascFactorial n:ℝ) := by
 rw [Nat.ascFactorial_eq_prod_range]
 unfold riseM1C6
 push_cast
 apply prod_congr rfl
 intro i hi
 ring

theorem scaled_reverse_coeffM1C6 (j s r : ℕ) (hr : r ≤ j) :
 ((s+3).factorial:ℝ)*(qPolyM7E2 j s).coeff (j-r)=
 qWeightM7E2 r*riseM1C6 (s+3) ((j:ℝ)-r) := by
 rw [q_poly_coeffM7E2,qCoeffM7E2,qBinM7E2,
   show (j:ℤ)-(j-r:ℕ)=(r:ℤ) by omega]
 have he : ((s+3).factorial:ℝ)*((s+(j-r)+3).choose (j-r):ℝ)=
   riseM1C6 (s+3) ((j:ℝ)-r) := by
   rw [←Nat.cast_sub hr,rise_natM1C6,Nat.ascFactorial_eq_factorial_mul_choose]
   push_cast
   congr 1
   rw [show j-r+(s+3)=s+(j-r)+3 by omega]
   rw [←Nat.choose_symm (show s+3 ≤ s+(j-r)+3 by omega)]
   congr 1
   omega
 nlinarith only [congrArg (fun x : ℝ => qWeightM7E2 r*x) he]

def risingConvM1C6 (a b : ℕ) (j h : ℝ) : ℝ :=
 0 -- the finite-sum definition below carries its natural upper endpoint

theorem scaled_reverse_productM1C6 (j s t h : ℕ) (hh : h ≤ j) :
 ((s+3).factorial:ℝ)*((t+3).factorial:ℝ)*(qPolyM7E2 j s*qPolyM7E2 j t).coeff (2*j-h)=
 ∑ r ∈ range (h+1), qWeightM7E2 r*qWeightM7E2 (h-r)*
   riseM1C6 (s+3) ((j:ℝ)-r)*riseM1C6 (t+3) ((j:ℝ)-h+r) := by
 have he := congrArg (fun P : ℝ[X] => P.coeff h)
   (reflect_mul (qPolyM7E2 j s) (qPolyM7E2 j t)
     (q_poly_degreeM7E2 _ _) (q_poly_degreeM7E2 _ _))
 rw [coeff_reflect,revAt_le (by omega : h≤j+j)] at he
 conv_rhs at he => rw [Polynomial.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
 rw [show j+j-h=2*j-h by omega] at he
 rw [he,mul_sum]
 apply sum_congr rfl
 intro r hr
 have hr' : r ≤ h := by simpa using hr
 rw [coeff_reflect,coeff_reflect,revAt_le (by omega : r ≤ j),revAt_le (by omega : h-r ≤ j)]
 calc
  _ = (((s+3).factorial:ℝ)*(qPolyM7E2 j s).coeff (j-r))*
    (((t+3).factorial:ℝ)*(qPolyM7E2 j t).coeff (j-(h-r))) := by ring
  _ = _ := by
   rw [scaled_reverse_coeffM1C6 j s r (by omega),scaled_reverse_coeffM1C6 j t (h-r) (by omega)]
   push_cast [Nat.cast_sub hr']
   ring

theorem weight_product_splitM1C6 (h r : ℕ) (h0 : 1 ≤ h) (hr : r ≤ h) :
 qWeightM7E2 r*qWeightM7E2 (h-r)=
 16*(r:ℝ)*((h:ℝ)-r)+(if r=0 then 4*(h:ℝ) else 0)+(if r=h then 4*(h:ℝ) else 0) := by
 by_cases h1 : r=0
 · subst r; simp [qWeightM7E2,show h≠0 by omega,show (h:ℤ)≠0 by omega,show ¬(h:ℤ)<0 by omega]; ring
 by_cases h2 : r=h
 · subst r; simp [qWeightM7E2,show h≠0 by omega,show (h:ℤ)≠0 by omega,show ¬(h:ℤ)<0 by omega]; ring
 simp only [qWeightM7E2,if_neg (by omega : ¬(r:ℤ)<0),
   if_neg (by omega : (r:ℤ)≠0),if_neg (by omega : ¬(h-r:ℤ)<0),
   if_neg (by omega : (h-r:ℤ)≠0),h1,h2,ite_false,add_zero]
 push_cast [Nat.cast_sub hr]
 ring

theorem rising_weighted_sumM1C6 (a b j h : ℕ) (h0 : 1 ≤ h) :
 (∑ r ∈ range (h+1), qWeightM7E2 r*qWeightM7E2 (h-r)*
   riseM1C6 a ((j:ℝ)-r)*riseM1C6 b ((j:ℝ)-h+r))=
 (∑ r ∈ range (h+1), 16*(r:ℝ)*((h:ℝ)-r)*
   riseM1C6 a ((j:ℝ)-r)*riseM1C6 b ((j:ℝ)-h+r))+
 4*(h:ℝ)*(riseM1C6 a j*riseM1C6 b ((j:ℝ)-h)+
   riseM1C6 a ((j:ℝ)-h)*riseM1C6 b j) := by
 have he (r : ℕ) (hr : r ∈ range (h+1)) :
   qWeightM7E2 r*qWeightM7E2 (h-r)*riseM1C6 a ((j:ℝ)-r)*riseM1C6 b ((j:ℝ)-h+r)=
   16*(r:ℝ)*((h:ℝ)-r)*riseM1C6 a ((j:ℝ)-r)*riseM1C6 b ((j:ℝ)-h+r)+
   (if r=0 then 4*(h:ℝ)*riseM1C6 a j*riseM1C6 b ((j:ℝ)-h) else 0)+
   (if r=h then 4*(h:ℝ)*riseM1C6 a ((j:ℝ)-h)*riseM1C6 b j else 0) := by
   rw [weight_product_splitM1C6 h r h0 (by simpa using hr)]
   split_ifs with h1 h2 <;> simp_all <;> ring
 rw [sum_congr rfl he]
 simp only [sum_add_distrib,sum_ite_eq',mem_range,show 0<h+1 by omega,show h<h+1 by omega,ite_true]
 ring

end
end MathGKM.Markov
