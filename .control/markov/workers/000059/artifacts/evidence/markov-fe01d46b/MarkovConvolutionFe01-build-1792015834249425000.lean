import MathGKM.MarkovLogConcavity
/-! Machine-authored fe01d46b. Finite determinant proof of coefficient
log-concavity under multiplication, retaining all zero coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

theorem determinant_sumFe01 (a b c d : ℕ → ℝ) (n : ℕ) :
 (∑ k ∈ range n, a k*c k)*(∑ k ∈ range n, b k*d k)-
 (∑ k ∈ range n, a k*d k)*(∑ k ∈ range n, b k*c k)=
 ∑ j ∈ range n, ∑ i ∈ range j,
   (a i*b j-a j*b i)*(c i*d j-c j*d i) := by
 induction n with
 | zero => simp
 | succ n ih =>
   have hc : (∑ i ∈ range n, (a i*b n-a n*b i)*(c i*d n-c n*d i))=
     (∑ i ∈ range n,a i*c i)*(b n*d n)+
     (∑ i ∈ range n,b i*d i)*(a n*c n)-
     (∑ i ∈ range n,a i*d i)*(b n*c n)-
     (∑ i ∈ range n,b i*c i)*(a n*d n) := by
     calc
      _ = ∑ i ∈ range n, (a i*c i)*(b n*d n)+(b i*d i)*(a n*c n)-
          (a i*d i)*(b n*c n)-(b i*c i)*(a n*d n) := by
        apply sum_congr rfl; intro i hi; ring
      _ = _ := by simp only [sum_sub_distrib,sum_add_distrib,sum_mul]
   simp only [sum_range_succ]
   rw [hc,←ih]
   ring

theorem determinant_sum_nonnegFe01 (a b c d : ℕ → ℝ) (n : ℕ)
 (hab : ∀ i j, i<j → j<n → 0≤a i*b j-a j*b i)
 (hcd : ∀ i j, i<j → j<n → 0≤c i*d j-c j*d i) :
 0≤(∑ k ∈ range n,a k*c k)*(∑ k ∈ range n,b k*d k)-
   (∑ k ∈ range n,a k*d k)*(∑ k ∈ range n,b k*c k) := by
 rw [determinant_sumFe01]
 exact sum_nonneg (fun j hj => sum_nonneg (fun i hi =>
   mul_nonneg (hab i j (mem_range.mp hi) (mem_range.mp hj))
     (hcd i j (mem_range.mp hi) (mem_range.mp hj))))

def toeFe01 (p : ℝ[X]) (a b : ℕ) : ℝ :=
 if a≤b then p.coeff (b-a) else 0
def PolyPF2Fe01 (p : ℝ[X]) : Prop := ∀ a b c d : ℕ, a≤b → c≤d →
 0≤toeFe01 p a c*toeFe01 p b d-toeFe01 p a d*toeFe01 p b c

theorem toe_mulFe01 (p q : ℝ[X]) (a b n : ℕ) (hb : b<n) :
 (∑ k ∈ range n,toeFe01 p a k*toeFe01 q k b)=toeFe01 (p*q) a b := by
 by_cases hab : a≤b
 · have hsub : Ico a (b+1) ⊆ range n := by
     intro k hk; simp only [mem_Ico,mem_range] at *; omega
   have he : (∑ k ∈ range n,toeFe01 p a k*toeFe01 q k b)=
       ∑ k ∈ Ico a (b+1),toeFe01 p a k*toeFe01 q k b := by
     apply (sum_subset hsub ?_).symm
     intro k hk hn
     simp only [mem_Ico,not_and_or,not_le,not_lt] at hn
     rcases hn with h | h
     · simp [toeFe01,show ¬a≤k by omega]
     · simp [toeFe01,show ¬k≤b by omega]
   rw [he,sum_Ico_eq_sum_range]
   have hn : b+1-a=(b-a)+1 := by omega
   rw [hn]
   simp only [toeFe01,hab,if_true,Polynomial.coeff_mul,
     Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
   apply sum_congr rfl
   intro k hk
   have hk' : k≤b-a := by simp only [mem_range] at hk; omega
   simp [show a≤k+a by omega,show k+a≤b by omega,
     show b-(k+a)=b-a-k by omega]
 · rw [toeFe01,if_neg hab]
   apply sum_eq_zero
   intro k hk
   by_cases h : a≤k
   · simp [toeFe01,show ¬k≤b by omega]
   · simp [toeFe01,h]

theorem polyPF2_mulFe01 {p q : ℝ[X]} (hp : PolyPF2Fe01 p)
 (hq : PolyPF2Fe01 q) : PolyPF2Fe01 (p*q) := by
 intro a b c d hab hcd
 have h := determinant_sum_nonnegFe01
   (toeFe01 p a) (toeFe01 p b) (fun k => toeFe01 q k c)
   (fun k => toeFe01 q k d) (d+1)
   (fun i j hij _ => hp a b i j hab (Nat.le_of_lt hij))
   (fun i j hij _ => hq i j c d (Nat.le_of_lt hij) hcd)
 simpa only [toe_mulFe01 p q a c (d+1) (by omega),
   toe_mulFe01 p q b d (d+1) (by omega),
   toe_mulFe01 p q a d (d+1) (by omega),
   toe_mulFe01 p q b c (d+1) (by omega)] using h

theorem polyPF2_adjacentFe01 {p : ℝ[X]} (hp : PolyPF2Fe01 p) (k : ℕ) :
 p.coeff k*p.coeff (k+2)≤p.coeff (k+1)^2 := by
 have h := hp 0 1 (k+1) (k+2) (by omega) (by omega)
 simp [toeFe01] at h
 nlinarith only [h]

#print axioms determinant_sumFe01
#print axioms toe_mulFe01
#print axioms polyPF2_mulFe01
#print axioms polyPF2_adjacentFe01
end
end MathGKM.Markov
