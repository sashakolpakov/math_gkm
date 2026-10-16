import MarkovBinomialInteriorMF1E
/-! Machine-authored ac3d4ab9. An asymmetric sufficient criterion for arbitrary
nonnegative binomial mixtures, with no normalization of their coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

theorem mixed_factorMAC3 (a b t : ℝ) :
 mixedNumeratorMF1E a b t = (a+b+t+3)*
   (2*(a+2)*(b+2)-t*(t-1)*(a+b+t+4)) := by
 unfold mixedNumeratorMF1E
 ring

theorem mixed_tripleMAC3 (a b t L M R l m r : ℝ)
 (ha : 0 ≤ a) (hb : 0 ≤ b) (ht : 0 ≤ t)
 (hgap : t*(t-1)*(a+b+t+4) ≤ 2*(a+2)*(b+2))
 (hM : 0 ≤ M) (hm : 0 ≤ m)
 (hL : L*(b+2)=(a+t+1)*M)
 (hR : R*(a+t+2)=(b+1)*M)
 (hl : l*(b+t+2)=(a+1)*m)
 (hr : r*(a+2)=(b+t+1)*m) : L*r+l*R ≤ 2*M*m := by
 have hp : 0<(a+2)*(b+2)*(a+t+2)*(b+t+2) := by positivity
 have he1 := congrArg₂ (fun x y : ℝ => x*y) hL hr
 have he2 := congrArg₂ (fun x y : ℝ => x*y) hl hR
 have he : (a+2)*(b+2)*(a+t+2)*(b+t+2)*(2*M*m-(L*r+l*R))=
   mixedNumeratorMF1E a b t*M*m := by
   unfold mixedNumeratorMF1E
   linear_combination -(a+t+2)*(b+t+2)*he1-(a+2)*(b+2)*he2
 have hg : 0 ≤ mixedNumeratorMF1E a b t := by
   rw [mixed_factorMAC3]
   exact mul_nonneg (by positivity) (sub_nonneg.mpr hgap)
 have hn := mul_nonneg (mul_nonneg hg hM) hm
 rw [←he] at hn
 exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hp).mp hn)

theorem cast_pairMAC3 (t : ℕ) :
 ((t*(t-1):ℕ):ℝ)=(t:ℝ)*((t:ℝ)-1) := by
 rcases Nat.eq_zero_or_pos t with h | h
 · simp [h]
 · rw [Nat.cast_mul,Nat.cast_sub (by omega),Nat.cast_one]

theorem binomial_mixedMAC3 (a b t : ℕ)
 (hg : t*(t-1)*(a+b+t+4) ≤ 2*(a+2)*(b+2)) :
 let n := a+b+t+2
 (n.choose (a+t):ℝ)*(n.choose (a+2):ℝ)+
 (n.choose a:ℝ)*(n.choose (a+t+2):ℝ) ≤
 2*(n.choose (a+t+1):ℝ)*(n.choose (a+1):ℝ) := by
 dsimp only
 apply mixed_tripleMAC3 a b t
 · positivity
 · positivity
 · positivity
 · have hh : ((t*(t-1):ℕ):ℝ)*((a:ℝ)+b+t+4) ≤ 2*((a:ℝ)+2)*((b:ℝ)+2) := by exact_mod_cast hg
   simpa only [cast_pairMAC3] using hh
 · positivity
 · positivity
 · have h := choose_stepMF1E (a+b+t+2) (a+t)
   rw [show a+b+t+2-(a+t)=b+2 by omega] at h
   push_cast at h
   nlinarith only [h]
 · have h := choose_stepMF1E (a+b+t+2) (a+t+1)
   rw [show a+b+t+2-(a+t+1)=b+1 by omega] at h
   rw [show a+t+1+1=a+t+2 by omega] at h
   push_cast at h
   nlinarith only [h]
 · have h := choose_stepMF1E (a+b+t+2) a
   rw [show a+b+t+2-a=b+t+2 by omega] at h
   push_cast at h
   nlinarith only [h]
 · have h := choose_stepMF1E (a+b+t+2) (a+1)
   rw [show a+b+t+2-(a+1)=b+t+1 by omega] at h
   rw [show a+1+1=a+2 by omega] at h
   push_cast at h
   nlinarith only [h]

def MixtureRegionMAC3 (n k lo hi : ℕ) : Prop :=
 hi ≤ k ∧ k+2 ≤ n+lo ∧
 (hi-lo)*(hi-lo-1)*(n+2) ≤ 2*(k-hi+2)*(n+lo-k)

theorem binomial_mixed_interval_orderedMAC3 (n k lo hi r s : ℕ)
 (hr : lo ≤ r) (hrs : r ≤ s) (hs : s ≤ hi)
 (h : MixtureRegionMAC3 n k lo hi) :
 (n.choose (k-r):ℝ)*(n.choose (k+2-s):ℝ)+
 (n.choose (k-s):ℝ)*(n.choose (k+2-r):ℝ) ≤
 2*(n.choose (k+1-r):ℝ)*(n.choose (k+1-s):ℝ) := by
 obtain ⟨hk,hn,hg⟩ := h
 have hd : s-r ≤ hi-lo := by omega
 have ht := Nat.mul_le_mul hd (Nat.sub_le_sub_right hd 1)
 have hp := Nat.mul_le_mul_right (n+2) ht
 have hks : s ≤ k := by omega
 have hkr : k-r+2 ≤ n := by omega
 have en : k-s+(n-(k-r+2))+(s-r)+2=n := by omega
 have hab : 2*(k-hi+2)*(n+lo-k) ≤ 2*(k-s+2)*(n-(k-r+2)+2) := by
   apply Nat.mul_le_mul
   · omega
   · omega
 have h := binomial_mixedMAC3 (k-s) (n-(k-r+2)) (s-r)
   (by have he : k-s+(n-(k-r+2))+(s-r)+4=n+2 := by omega
       rw [he]
       exact le_trans hp (le_trans hg hab))
 dsimp only at h
 have e0 : k-s+(s-r)=k-r := by omega
 have e1 : k-s+(s-r)+1=k+1-r := by omega
 have e2 : k-s+(s-r)+2=k+2-r := by omega
 have f1 : k-s+1=k+1-s := by omega
 have f2 : k-s+2=k+2-s := by omega
 rw [en,e2,e1,e0,f1,f2] at h
 exact h

theorem binomial_mixed_intervalMAC3 (n k lo hi r s : ℕ)
 (hr : lo ≤ r) (hr' : r ≤ hi) (hs : lo ≤ s) (hs' : s ≤ hi)
 (h : MixtureRegionMAC3 n k lo hi) :
 (n.choose (k-r):ℝ)*(n.choose (k+2-s):ℝ)+
 (n.choose (k-s):ℝ)*(n.choose (k+2-r):ℝ) ≤
 2*(n.choose (k+1-r):ℝ)*(n.choose (k+1-s):ℝ) := by
 rcases le_total r s with hrs | hsr
 · exact binomial_mixed_interval_orderedMAC3 n k lo hi r s hr hrs hs' h
 · have hh := binomial_mixed_interval_orderedMAC3 n k lo hi s r hs hsr hr' h
   nlinarith only [hh]

theorem binomial_region_lcMAC3 (P : ℝ[X]) (n k lo hi : ℕ)
 (hP : P.natDegree ≤ hi) (hpos : ∀ r, 0 ≤ P.coeff r)
 (hlow : ∀ r<lo, P.coeff r=0) (h : MixtureRegionMAC3 n k lo hi) :
 (((1+X)^n*P):ℝ[X]).coeff k * (((1+X)^n*P):ℝ[X]).coeff (k+2) ≤
 (((1+X)^n*P):ℝ[X]).coeff (k+1)^2 := by
 rw [binomial_coeff_sumMF1E P n k hi hP h.1,
   binomial_coeff_sumMF1E P n (k+2) hi hP (by have := h.1; omega),
   binomial_coeff_sumMF1E P n (k+1) hi hP (by have := h.1; omega)]
 apply finite_mixture_lcMF1E
 intro r hr s hs
 by_cases hrl : r<lo
 · simp [hlow r hrl]
 by_cases hsl : s<lo
 · simp [hlow s hsl]
 have hr' : r ≤ hi := by simpa using Finset.mem_range.mp hr
 have hs' : s ≤ hi := by simpa using Finset.mem_range.mp hs
 have hh := binomial_mixed_intervalMAC3 n k lo hi r s (by omega) hr' (by omega) hs' h
 have hhh := mul_le_mul_of_nonneg_left hh (mul_nonneg (hpos r) (hpos s))
 nlinarith only [hhh]

theorem integer_binomial_region_lcMAC3 (P : ℤ[X]) (n k lo hi : ℕ)
 (hP : P.natDegree ≤ hi) (hpos : ∀ r, 0 ≤ P.coeff r)
 (hlow : ∀ r<lo, P.coeff r=0) (h : MixtureRegionMAC3 n k lo hi) :
 (((1+X)^n*P):ℤ[X]).coeff k * (((1+X)^n*P):ℤ[X]).coeff (k+2) ≤
 (((1+X)^n*P):ℤ[X]).coeff (k+1)^2 := by
 have hd : (P.map (Int.castRingHom ℝ)).natDegree ≤ hi :=
   le_trans Polynomial.natDegree_map_le hP
 have he : (1+(X:ℝ[X]))^n*P.map (Int.castRingHom ℝ)=
   (((1+X)^n*P):ℤ[X]).map (Int.castRingHom ℝ) := by simp
 have hh := binomial_region_lcMAC3 (P.map (Int.castRingHom ℝ)) n k lo hi hd
   (fun r => by simpa using hpos r) (fun r hr => by simp [hlow r hr]) h
 rw [he] at hh
 simp only [Polynomial.coeff_map] at hh
 change ((((1+X)^n*P):ℤ[X]).coeff k:ℝ) *
   ((((1+X)^n*P):ℤ[X]).coeff (k+2):ℝ) ≤
   ((((1+X)^n*P):ℤ[X]).coeff (k+1):ℝ)^2 at hh
 exact_mod_cast hh
end
end MathGKM.Markov
