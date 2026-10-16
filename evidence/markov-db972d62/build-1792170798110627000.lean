import MarkovWindowLC6d34
/-! Machine-authored db972d62. Finite sequence realization and diagonal convolution. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 3000000

def seqPolyMDB9 (f : ℤ → ℝ) (N : ℕ) : ℝ[X] :=
 ∑ k ∈ range (N+1), monomial k (f k)

theorem seqPoly_coeffMDB9 (f : ℤ → ℝ) (N k : ℕ) :
 (seqPolyMDB9 f N).coeff k=if k≤N then f k else 0 := by
 classical
 simp [seqPolyMDB9,Polynomial.coeff_monomial,Finset.sum_ite_eq',Nat.lt_succ_iff]

theorem seqPoly_seqMDB9 (f : ℤ → ℝ) (N : ℕ)
 (hz : ∀ k, k<0 → f k=0) (k : ℤ) :
 CoeffSeq (seqPolyMDB9 f N) k=if k≤N then f k else 0 := by
 by_cases hk : k<0
 · simp [CoeffSeq,hk,hz k hk,show k≤N by omega]
 · simp [CoeffSeq,hk,seqPoly_coeffMDB9,show (k.toNat:ℤ)=k by omega,
     show (k.toNat≤N) ↔ k≤(N:ℤ) by omega]

theorem crossLC_cutMDB9 {f : ℤ → ℝ} (hf : CrossLC f)
 (hn : ∀ k, 0≤f k) (N : ℤ) : CrossLC (fun k => if k≤N then f k else 0) := by
 intro i j hij
 dsimp only
 by_cases hj : j+1≤N
 · simp only [if_pos hj,if_pos (show j≤N by omega),
     if_pos (show i≤N by omega),if_pos (show i+1≤N by omega)]
   exact hf i j hij
 · rw [if_neg hj,mul_zero]
   apply mul_nonneg <;> split_ifs <;> first | exact hn _ | exact le_rfl

theorem seqPoly_crossMDB9 {f : ℤ → ℝ} (hf : CrossLC f)
 (hn : ∀ k, 0≤f k) (hz : ∀ k, k<0 → f k=0) (N : ℕ) :
 CrossLC (CoeffSeq (seqPolyMDB9 f N)) := by
 have he : CoeffSeq (seqPolyMDB9 f N)=fun k => if k≤(N:ℤ) then f k else 0 :=
   funext (seqPoly_seqMDB9 f N hz)
 rw [he]
 exact crossLC_cutMDB9 hf hn N

theorem seqPoly_nonnegMDB9 {f : ℤ → ℝ} (hn : ∀ k, 0≤f k) (N k : ℕ) :
 0≤(seqPolyMDB9 f N).coeff k := by
 rw [seqPoly_coeffMDB9]; split_ifs <;> first | exact hn _ | exact le_rfl

def diagSumMDB9 (f g w : ℤ → ℝ) (j m : ℕ) : ℝ :=
 ∑ k ∈ range (min j m+1), w k*f ((j:ℤ)-k)*g ((m:ℤ)-k)

theorem diagSum_extendMDB9 (f g w : ℤ → ℝ)
 (hfz : ∀ k, k<0 → f k=0) (hgz : ∀ k, k<0 → g k=0)
 (j m N : ℕ) (hN : min j m<N) :
 diagSumMDB9 f g w j m=∑ k ∈ range N,w k*f ((j:ℤ)-k)*g ((m:ℤ)-k) := by
 unfold diagSumMDB9
 apply sum_subset (by intro k hk; simp only [mem_range] at *; omega)
 intro k hk hn
 have hk' : min j m<k := by simp only [mem_range] at hn; omega
 by_cases hj : j<k
 · rw [hfz _ (by omega),mul_zero,zero_mul]
 · rw [hgz _ (by omega),mul_zero]

theorem diagSum_swapMDB9 (f g w : ℤ → ℝ) (j m : ℕ) :
 diagSumMDB9 f g w j m=diagSumMDB9 g f w m j := by
 unfold diagSumMDB9
 rw [min_comm]
 apply sum_congr rfl; intro k hk; ring

theorem diagSum_as_coeffMDB9 (f g w : ℤ → ℝ)
 (hfz : ∀ k, k<0 → f k=0) (hgz : ∀ k, k<0 → g k=0)
 (j m N : ℕ) (hj : j≤N) :
 diagSumMDB9 f g w j m=
 (seqPolyMDB9 (fun k => w k*g ((m:ℤ)-k)) m * seqPolyMDB9 f N).coeff j := by
 rw [Polynomial.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,
   diagSum_extendMDB9 f g w hfz hgz j m (j+1) (by omega)]
 apply sum_congr rfl
 intro k hk
 have hk' : k≤j := by simp only [mem_range] at hk; omega
 rw [seqPoly_coeffMDB9,seqPoly_coeffMDB9,if_pos (by omega : j-k≤N)]
 dsimp only at ⊢
 by_cases hm : k ≤ m
 · rw [if_pos hm]
   rw [show ((j-k:ℕ):ℤ)=(j:ℤ)-k by omega]
   ring
 · rw [if_neg hm,hgz _ (by omega)]
   ring

theorem diagSum_rowMDB9 (f g w : ℤ → ℝ)
 (hf : CrossLC f) (hg : CrossLC g) (hw : CrossLC w)
 (hfn : ∀ k, 0≤f k) (hgn : ∀ k, 0≤g k) (hwn : ∀ k, 0≤w k)
 (hfz : ∀ k, k<0 → f k=0) (hgz : ∀ k, k<0 → g k=0)
 (hwz : ∀ k, k<0 → w k=0) (j m : ℕ) :
 diagSumMDB9 f g w j m*diagSumMDB9 f g w (j+2) m≤diagSumMDB9 f g w (j+1) m^2 := by
 let r : ℤ → ℝ := fun k => w k*g ((m:ℤ)-k)
 have hr : CrossLC r := crossLC_product6d34 hw (crossLC_reverse6d34 hg m) hwn (fun k => hgn _)
 have hrn : ∀ k, 0≤r k := fun k => mul_nonneg (hwn _) (hgn _)
 have hrz : ∀ k, k<0 → r k=0 := by intro k hk; dsimp [r]; rw [hwz k hk,zero_mul]
 have hc := crossLC_poly_mul6d34 (seqPolyMDB9 r m) (seqPolyMDB9 f (j+2))
   (seqPoly_crossMDB9 hr hrn hrz m) (seqPoly_crossMDB9 hf hfn hfz (j+2))
   (seqPoly_nonnegMDB9 hrn m) (seqPoly_nonnegMDB9 hfn (j+2))
 have h := polyPF2_adjacentFe01 (crossLC_pf2_6d34 _ hc) j
 rw [diagSum_as_coeffMDB9 f g w hfz hgz j m (j+2) (by omega),
   diagSum_as_coeffMDB9 f g w hfz hgz (j+2) m (j+2) (by omega),
   diagSum_as_coeffMDB9 f g w hfz hgz (j+1) m (j+2) (by omega)]
 exact h

theorem diagSum_minorMDB9 (f g w : ℤ → ℝ)
 (hf : CrossLC f) (hg : CrossLC g) (hwn : ∀ k, 0≤w k)
 (hfz : ∀ k, k<0 → f k=0) (hgz : ∀ k, k<0 → g k=0) (j m : ℕ) :
 diagSumMDB9 f g w (j+1) m*diagSumMDB9 f g w j (m+1)≤
 diagSumMDB9 f g w j m*diagSumMDB9 f g w (j+1) (m+1) := by
 have h := determinant_sum_nonnegFe01
   (fun k => w k*f ((j:ℤ)-k)) (fun k => w k*f ((j:ℤ)+1-k))
   (fun k => g ((m:ℤ)-k)) (fun k => g ((m:ℤ)+1-k)) (j+m+3) ?_ ?_
 · rw [diagSum_extendMDB9 f g w hfz hgz (j+1) m (j+m+3) (by omega),
     diagSum_extendMDB9 f g w hfz hgz j (m+1) (j+m+3) (by omega),
     diagSum_extendMDB9 f g w hfz hgz j m (j+m+3) (by omega),
     diagSum_extendMDB9 f g w hfz hgz (j+1) (m+1) (j+m+3) (by omega)]
   push_cast
   nlinarith only [h]
 · intro a b hab hb
   have hx := hf ((j:ℤ)-b) ((j:ℤ)-a) (by omega)
   have hw := mul_nonneg (hwn a) (hwn b)
   have hx' : 0≤f ((j:ℤ)-a)*f ((j:ℤ)+1-b)-f ((j:ℤ)-b)*f ((j:ℤ)+1-a) := by
     rw [show (j:ℤ)-a+1=j+1-a by omega,show (j:ℤ)-b+1=j+1-b by omega] at hx
     nlinarith only [hx]
   nlinarith only [mul_nonneg hw hx']
 · intro a b hab hb
   have hx := hg ((m:ℤ)-b) ((m:ℤ)-a) (by omega)
   rw [show (m:ℤ)-a+1=m+1-a by omega,show (m:ℤ)-b+1=m+1-b by omega] at hx
   nlinarith only [hx]
end
end MathGKM.Markov
