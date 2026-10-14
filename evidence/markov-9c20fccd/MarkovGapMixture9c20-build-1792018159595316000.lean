import MarkovCutDegree07a7
/-! Machine-authored 9c20fccd. Fixed-degree one-gap mixtures.
This is a coefficient aggregation lemma, not full source log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

/-- Four possible weights of one cut, indexed by their degree.
The two pure-gap forms are restricted below to degrees where they exist. -/
def gapBasis9c20 (d : ℕ) (r pure : Bool) : ℝ[X] :=
 if r then (1+X)*(if pure then purePolyFe01 (d-2) else resetPolyFe01 (d-1))
 else if pure then purePolyFe01 (d-1) else resetPolyFe01 d

def gapMixture9c20 (d : ℕ) (a b c e : ℝ) : ℝ[X] :=
 C a*resetPolyFe01 d+C b*purePolyFe01 (d-1)+
 C c*((1+X)*resetPolyFe01 (d-1))+C e*((1+X)*purePolyFe01 (d-2))

theorem reset_coeff9c20 (n k : ℕ) :
 (resetPolyFe01 n).coeff k = if k=0 then 1 else if k≤n then 2 else 0 := by
 simp only [resetPolyFe01,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_one,runSum_coeffFe01]
 split_ifs <;> norm_num at * <;> omega

theorem pure_coeff9c20 (n k : ℕ) :
 (purePolyFe01 n).coeff k =
   if k=0 ∨ k=n+1 then 1 else if k≤n then 2 else 0 := by
 simp only [purePolyFe01,Polynomial.coeff_add,reset_coeff9c20,Polynomial.coeff_X_pow]
 split_ifs <;> norm_num at * <;> omega

theorem smooth_coeff9c20 (p : ℝ[X]) (k : ℕ) :
 ((1+X)*p).coeff k=p.coeff k+(if k=0 then 0 else p.coeff (k-1)) := by
 cases k <;> simp [add_mul]

theorem mixture_coeff9c20 (d k : ℕ) (hd : 3≤d) (a b c e : ℝ) :
 (gapMixture9c20 d a b c e).coeff k=
 if k=0 then a+b+c+e else
 if k=1 then 2*a+2*b+3*c+3*e else
 if k+1<d then 2*a+2*b+4*c+4*e else
 if k+1=d then 2*a+2*b+4*c+3*e else
 if k=d then 2*a+b+2*c+e else 0 := by
 simp only [gapMixture9c20,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   smooth_coeff9c20,reset_coeff9c20,pure_coeff9c20]
 split_ifs <;> (first | omega | ring)

theorem mixture_logConcave9c20 (d k : ℕ) (hd : 3≤d) (a b c e : ℝ)
 (ha : 0≤a) (hb : 0≤b) (hc : 0≤c) (he : 0≤e) :
 (gapMixture9c20 d a b c e).coeff k*
 (gapMixture9c20 d a b c e).coeff (k+2)≤
 ((gapMixture9c20 d a b c e).coeff (k+1))^2 := by
 simp only [mixture_coeff9c20 _ _ hd]
 split_ifs <;> (first | contradiction | omega | nlinarith [sq_nonneg a,sq_nonneg b,sq_nonneg c,sq_nonneg e,
   mul_nonneg ha hb,mul_nonneg ha hc,mul_nonneg ha he,
   mul_nonneg hb hc,mul_nonneg hb he,mul_nonneg hc he])

theorem mixture_logConcave_all9c20 (d k : ℕ) (hd : 2≤d) (a b c e : ℝ)
 (ha : 0≤a) (hb : 0≤b) (hc : 0≤c) (he : 0≤e) :
 (gapMixture9c20 d a b c e).coeff k*
 (gapMixture9c20 d a b c e).coeff (k+2)≤
 ((gapMixture9c20 d a b c e).coeff (k+1))^2 := by
 by_cases h3 : 3≤d
 · exact mixture_logConcave9c20 d k h3 a b c e ha hb hc he
 · have hd2 : d=2 := by omega
   subst d
   have hp : gapMixture9c20 2 a b c e=
       C (a+b+c+e)+C (2*a+2*b+3*c+2*e)*X+C (2*a+b+2*c+e)*X^2 := by
     simp [gapMixture9c20,resetPolyFe01,purePolyFe01,runSumA27,
       Finset.sum_range_succ,map_add,map_mul]
     ring
   rw [hp]
   by_cases hk : k=0
   · subst k
     simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X,
       Polynomial.coeff_X_pow,Polynomial.coeff_C]
     norm_num
     nlinarith [sq_nonneg a,sq_nonneg b,sq_nonneg c,sq_nonneg e,
       mul_nonneg ha hb,mul_nonneg ha hc,mul_nonneg ha he,
       mul_nonneg hb hc,mul_nonneg hb he,mul_nonneg hc he]
   · have hz : (C (a+b+c+e)+C (2*a+2*b+3*c+2*e)*X+
         C (2*a+b+2*c+e)*X^2).coeff (k+2)=0 := by
       simp [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow,
         show k+2≠0 by omega,show k+2≠1 by omega,show k+2≠2 by omega,
         show 2≠k+2 by omega]
     rw [hz,mul_zero]
     exact sq_nonneg _

#print axioms mixture_logConcave9c20
end
end MathGKM.Markov
