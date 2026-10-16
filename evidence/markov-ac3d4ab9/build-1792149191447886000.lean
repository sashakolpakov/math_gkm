import MarkovVarianceMAC3
/-! Machine-authored ac3d4ab9. Bounded-variance LC for raw binomial mixtures. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

def VarianceRegionMAC3 (n k lo hi : ℕ) : Prop :=
 lo ≤ hi ∧ hi ≤ k ∧ k+2 ≤ n+lo ∧
 (n+2)*(hi-lo)^2 ≤ 4*(k-hi+2)*(n+lo-k)

theorem binomial_coeff_IccMAC3 (P : ℝ[X]) (n k lo hi : ℕ)
 (hP : P.natDegree ≤ hi) (hlow : ∀ r<lo, P.coeff r=0) (hk : hi ≤ k) :
 (((1+X)^n*P):ℝ[X]).coeff k=
 ∑ r∈Finset.Icc lo hi, P.coeff r*(n.choose (k-r):ℝ) := by
 rw [binomial_coeff_sumMF1E P n k hi hP hk]
 symm
 apply Finset.sum_subset
 · intro r hr
   simp only [Finset.mem_Icc,Finset.mem_range] at *
   omega
 · intro r hr hn
   have hrl : r<lo := by
     simp only [Finset.mem_Icc,Finset.mem_range] at *
     omega
   simp [hlow r hrl]

theorem moment_reconstructMAC3 (c L M R x y : ℝ)
 (hx : 0<x) (hy : 0<y)
 (hL : L*y=(x-1)*M) (hR : R*x=(y-1)*M) :
 (c*M/(x*y))*x*(x-1)=c*L ∧
 (c*M/(x*y))*x*y=c*M ∧
 (c*M/(x*y))*y*(y-1)=c*R := by
 have hx0 := ne_of_gt hx
 have hy0 := ne_of_gt hy
 constructor
 · field_simp
   linear_combination -c*hL
 constructor
 · field_simp
 · field_simp
   linear_combination -c*hR

theorem binomial_variance_lcMAC3 (P : ℝ[X]) (n k lo hi : ℕ)
 (hP : P.natDegree ≤ hi) (hpos : ∀ r, 0 ≤ P.coeff r)
 (hlow : ∀ r<lo, P.coeff r=0) (h : VarianceRegionMAC3 n k lo hi) :
 (((1+X)^n*P):ℝ[X]).coeff k * (((1+X)^n*P):ℝ[X]).coeff (k+2) ≤
 (((1+X)^n*P):ℝ[X]).coeff (k+1)^2 := by
 obtain ⟨hlh,hk,hn,hg⟩ := h
 let H : ℝ := n+2
 let A : ℝ := ((k-hi+2:ℕ):ℝ)
 let B : ℝ := ((k-lo+2:ℕ):ℝ)
 let x : ℕ → ℝ := fun r => ((k-r+2:ℕ):ℝ)
 let q : ℕ → ℝ := fun r => P.coeff r*(n.choose (k+1-r):ℝ)/(x r*(H-x r))
 have hx : ∀ r∈Finset.Icc lo hi, A ≤ x r ∧ x r ≤ B := by
   intro r hr
   obtain ⟨hrl,hrh⟩ := Finset.mem_Icc.mp hr
   dsimp [A,B,x]
   constructor <;> exact_mod_cast (show _ by omega)
 have hA : 0<A := by dsimp [A]; positivity
 have hBH : B<H := by
   dsimp [B,H]
   exact_mod_cast (show k-lo+2<n+2 by omega)
 have hxy : ∀ r∈Finset.Icc lo hi, 0<x r ∧ 0<H-x r := by
   intro r hr
   obtain ⟨h1,h2⟩ := hx r hr
   constructor <;> linarith
 have hq : ∀ r∈Finset.Icc lo hi, 0 ≤ q r := by
   intro r hr
   exact div_nonneg (mul_nonneg (hpos r) (by positivity)) (le_of_lt (mul_pos (hxy r hr).1 (hxy r hr).2))
 have hgap : H*(B-A)^2 ≤ 4*A*(H-B) := by
   have hba : B-A=((hi-lo:ℕ):ℝ) := by
     have he : B=A+((hi-lo:ℕ):ℝ) := by
       dsimp [B,A]
       exact_mod_cast (show k-lo+2=(k-hi+2)+(hi-lo) by omega)
     linarith
   have hhb : H-B=((n+lo-k:ℕ):ℝ) := by
     have he : H=B+((n+lo-k:ℕ):ℝ) := by
       dsimp [H,B]
       exact_mod_cast (show n+2=(k-lo+2)+(n+lo-k) by omega)
     linarith
   rw [hba,hhb]
   dsimp [H,A]
   exact_mod_cast hg
 have hc : ∀ r∈Finset.Icc lo hi,
   q r*x r*(x r-1)=P.coeff r*(n.choose (k-r):ℝ) ∧
   q r*x r*(H-x r)=P.coeff r*(n.choose (k+1-r):ℝ) ∧
   q r*(H-x r)*(H-x r-1)=P.coeff r*(n.choose (k+2-r):ℝ) := by
   intro r hr
   obtain ⟨hrl,hrh⟩ := Finset.mem_Icc.mp hr
   have hrk : r ≤ k := by omega
   have hkn : k-r+2 ≤ n := by omega
   have hL := choose_stepMF1E n (k-r)
   have hR := choose_stepMF1E n (k-r+1)
   rw [show k-r+1=k+1-r by omega] at hL hR
   rw [show k+1-r+1=k+2-r by omega] at hR
   apply moment_reconstructMAC3 _ _ _ _ _ _ (hxy r hr).1 (hxy r hr).2
   · dsimp [H,x]
     rw [Nat.cast_sub (by omega : k-r ≤ n)] at hL
     push_cast
     nlinarith only [hL]
   · dsimp [H,x]
     have he1 : ((k+1-r:ℕ):ℝ)=((k-r:ℕ):ℝ)+1 := by exact_mod_cast (show k+1-r=k-r+1 by omega)
     rw [Nat.cast_sub (by omega : k+1-r ≤ n),he1] at hR
     push_cast
     nlinarith only [hR]
 have hh := moment_mixture_lcMAC3 (Finset.Icc lo hi) q x A B H
   (le_of_lt hA) (le_of_lt hBH) (by dsimp [H]; have := Nat.cast_nonneg (α := ℝ) n; linarith) hq hx hgap
 rw [binomial_coeff_IccMAC3 P n k lo hi hP hlow hk,
   binomial_coeff_IccMAC3 P n (k+2) lo hi hP hlow (by omega),
   binomial_coeff_IccMAC3 P n (k+1) lo hi hP hlow (by omega)]
 convert hh using 1 <;> congr 1 <;>
   apply Finset.sum_congr rfl <;> intro r hr
 · exact (hc r hr).1.symm
 · exact (hc r hr).2.2.symm
 · exact (hc r hr).2.1.symm

theorem integer_binomial_variance_lcMAC3 (P : ℤ[X]) (n k lo hi : ℕ)
 (hP : P.natDegree ≤ hi) (hpos : ∀ r, 0 ≤ P.coeff r)
 (hlow : ∀ r<lo, P.coeff r=0) (h : VarianceRegionMAC3 n k lo hi) :
 (((1+X)^n*P):ℤ[X]).coeff k * (((1+X)^n*P):ℤ[X]).coeff (k+2) ≤
 (((1+X)^n*P):ℤ[X]).coeff (k+1)^2 := by
 have hd : (P.map (Int.castRingHom ℝ)).natDegree ≤ hi :=
   le_trans Polynomial.natDegree_map_le hP
 have he : (1+(X:ℝ[X]))^n*P.map (Int.castRingHom ℝ)=
   (((1+X)^n*P):ℤ[X]).map (Int.castRingHom ℝ) := by simp
 have hh := binomial_variance_lcMAC3 (P.map (Int.castRingHom ℝ)) n k lo hi hd
   (fun r => by simpa using hpos r) (fun r hr => by simp [hlow r hr]) h
 rw [he] at hh
 simp only [Polynomial.coeff_map] at hh
 change ((((1+X)^n*P):ℤ[X]).coeff k:ℝ) *
   ((((1+X)^n*P):ℤ[X]).coeff (k+2):ℝ) ≤
   ((((1+X)^n*P):ℤ[X]).coeff (k+1):ℝ)^2 at hh
 exact_mod_cast hh
end
end MathGKM.Markov
