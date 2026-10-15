import MarkovAlignedPrefix6d2c
import MarkovTrimLinear6d2c
/-! Machine-authored 6d2c5a67. Consecutive aligned interval aggregation,
with actual source multiplicities. Constant coefficients only. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

def alignedSlope6d (n e : ℕ) : ℕ := if e<n then e+1 else 2*n+2-e

theorem alignedPrefix_active6d (n e : ℕ) (hn : 1 ≤ n) (he : e ≤ 2*n+1) :
 alignedPrefix6d n e=(1+X)^e*(1+C (alignedSlope6d n e:ℤ)*X) := by
 by_cases h : e<n
 · simpa [alignedSlope6d,h] using alignedPrefix_below6d n e h
 · have hh := alignedPrefix_above6d n (e-n) hn (by omega)
   simpa [alignedSlope6d,h,show n+(e-n)=e by omega,
     show n+2-(e-n)=2*n+2-e by omega] using hh

theorem alignedSlope_gap6d (n l u : ℕ) (hl : 1 ≤ l) (hlu : l ≤ u)
 (hu : u ≤ 2*n+1) : alignedSlope6d n (l-1) ≤ (u-(l-1))+alignedSlope6d n u := by
 unfold alignedSlope6d
 split_ifs <;> omega

def alignedInterval6d (n l u : ℕ) : ℤ[X] :=
 ∑ e ∈ Ico l (u+1),singleAAligned6d n (n+1) e

theorem alignedInterval_difference6d (n l u : ℕ) (hl : 1 ≤ l) (hlu : l ≤ u) :
 alignedInterval6d n l u=alignedPrefix6d n u-alignedPrefix6d n (l-1) := by
 unfold alignedInterval6d alignedPrefix6d
 rw [Finset.sum_Ico_eq_sub _ (by omega),show l-1+1=l by omega]

theorem alignedInterval_real_cross6d (n l u : ℕ) (hn : 1 ≤ n)
 (hl : 1 ≤ l) (hlu : l ≤ u) (hu : u ≤ 2*n+1) :
 CrossLC (CoeffSeq ((alignedInterval6d n l u).map (Int.castRingHom ℝ))) := by
 have hd := alignedSlope_gap6d n l u hl hlu hu
 have hc := trimmed_binomial_cross6d (u-(l-1)) (alignedSlope6d n u)
   (alignedSlope6d n (l-1)) (by positivity) (by positivity) (by exact_mod_cast hd)
 have hs := crossLC_pascal hc (l-1)
 rw [←coeffSeq_binomial_mul] at hs
 have he : (alignedInterval6d n l u).map (Int.castRingHom ℝ)=
     (1+X)^(l-1)*((1+X)^(u-(l-1))*(1+C (alignedSlope6d n u:ℝ)*X)-
       1-C (alignedSlope6d n (l-1):ℝ)*X) := by
   rw [alignedInterval_difference6d n l u hl hlu,alignedPrefix_active6d n u hn hu,
     alignedPrefix_active6d n (l-1) hn (by omega)]
   simp only [Polynomial.map_sub,Polynomial.map_mul,Polynomial.map_pow,
     Polynomial.map_add,Polynomial.map_one,Polynomial.map_X,Polynomial.map_C,
     Int.coe_castRingHom,Int.cast_natCast]
   have hp : (1+(X:ℝ[X]))^u=(1+X)^(l-1)*(1+X)^(u-(l-1)) := by
     rw [←pow_add, Nat.add_sub_of_le (show l-1 ≤ u by omega)]
   rw [hp]
   ring
 rwa [he]

theorem alignedInterval_integer_lc6d (n l u s : ℕ) (hn : 1 ≤ n)
 (hl : 1 ≤ l) (hlu : l ≤ u) (hu : u ≤ 2*n+1) :
 (alignedInterval6d n l u).coeff s*(alignedInterval6d n l u).coeff (s+2) ≤
 (alignedInterval6d n l u).coeff (s+1)^2 := by
 have h := crossLC_adjacent (alignedInterval_real_cross6d n l u hn hl hlu hu) (s+1)
 have h0 : (s:ℤ)+1-1=s := by omega
 have h2 : (s:ℤ)+1+1=(s+2:ℕ) := by omega
 rw [h0,h2] at h
 have h1 : (s:ℤ)+1=((s+1:ℕ):ℤ) := by omega
 rw [h1] at h
 simp only [CoeffSeq,Int.natCast_nonneg,not_lt.mpr,if_false,Int.toNat_natCast,
   Polynomial.coeff_map,Int.coe_castRingHom] at h
 exact_mod_cast h

theorem source_aligned_interval_coeff6d (n l u s : ℕ) :
 (∑ e ∈ Ico l (u+1),
   (degreeLayer07a7 (X:ℤ[X]) (central28 (oneAPath68 n)++[true]) s (s+e)).coeff 0)=
 (alignedInterval6d n l u).coeff s := by
 simp only [alignedInterval6d,Polynomial.finsetSum_coeff,source_aligned_count6d]

theorem source_aligned_interval_lc6d (n l u s : ℕ) (hn : 1 ≤ n)
 (hl : 1 ≤ l) (hlu : l ≤ u) (hu : u ≤ 2*n+1) :
 let f := fun r => ∑ e ∈ Ico l (u+1),
   (degreeLayer07a7 (X:ℤ[X]) (central28 (oneAPath68 n)++[true]) r (r+e)).coeff 0
 f s*f (s+2) ≤ f (s+1)^2 := by
 dsimp only
 rw [source_aligned_interval_coeff6d,source_aligned_interval_coeff6d,
   source_aligned_interval_coeff6d]
 exact alignedInterval_integer_lc6d n l u s hn hl hlu hu

#print axioms alignedInterval_real_cross6d
#print axioms source_aligned_interval_lc6d
end
end MathGKM.Markov
