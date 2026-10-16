import MarkovThirdRun1BoundsM115
import MarkovPrefixLCM115
/-! Machine-authored 1152282d. Zeros and every integer index retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

def vR1seqM115 (a b c d e : ℝ) (k : ℤ) : ℝ :=
 if k=1 then vR1c1M115 a b c d e else if k=2 then vR1c2M115 a b c d e else if k=3 then vR1c3M115 a b c d e else if k=4 then vR1c4M115 a b c d e else if k=5 then vR1c5M115 a b c d e else if k=6 then vR1c6M115 a b c d e else if k=7 then vR1c7M115 a b c d e else if k=8 then vR1c8M115 a b c d e else if k=9 then vR1c9M115 a b c d e else 0

theorem vR1coeffM115 (a b c d e : ℝ) :
 CoeffSeq (vR1seedM115 a b c d e)=vR1seqM115 a b c d e := by
 funext k
 by_cases hk : k<0
 · simp [CoeffSeq,hk,vR1seqM115,show k≠1 by omega,show k≠2 by omega,show k≠3 by omega,show k≠4 by omega,show k≠5 by omega,show k≠6 by omega,show k≠7 by omega,show k≠8 by omega,show k≠9 by omega]
 · lift k to ℕ using (show 0≤k by omega)
   rw [coeffSeq_nat774]
   by_cases hl : k≤9
   · interval_cases k <;> norm_num [vR1seedM115,vR1seqM115,
       Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C,Polynomial.coeff_X]
   · simp [vR1seedM115,vR1seqM115,Polynomial.coeff_C_mul_X_pow,
       Polynomial.coeff_C,Polynomial.coeff_X,show k≠1 by omega,show (k:ℤ)≠1 by omega,show k≠2 by omega,show (k:ℤ)≠2 by omega,show k≠3 by omega,show (k:ℤ)≠3 by omega,show k≠4 by omega,show (k:ℤ)≠4 by omega,show k≠5 by omega,show (k:ℤ)≠5 by omega,show k≠6 by omega,show (k:ℤ)≠6 by omega,show k≠7 by omega,show (k:ℤ)≠7 by omega,show k≠8 by omega,show (k:ℤ)≠8 by omega,show k≠9 by omega,show (k:ℤ)≠9 by omega]

theorem vR1cross_of_boundsM115 (a b c d e : ℝ) (h : vR1BoundsM115 a b c d e) :
 CrossLC (CoeffSeq (vR1seedM115 a b c d e)) := by
 obtain ⟨h1,h2,h3,h4,h5,h6,h7,h8,h9,g2,g3,g4,g5,g6,g7,g8⟩ := h
 rw [vR1coeffM115]
 have hz (k : ℤ) (h : k<1 ∨ 9<k) : vR1seqM115 a b c d e k=0 := by
   unfold vR1seqM115
   split_ifs <;> first | omega | rfl
 apply crossLC_two_prefixM115 _ 9 (by norm_num) hz
 · intro k
   unfold vR1seqM115
   split_ifs <;> positivity
 · intro k hk hl
   interval_cases k <;> norm_num [vR1seqM115] <;> assumption
 · intro k
   by_cases hk : 1≤k ∧ k≤9
   · obtain ⟨hl,hu⟩ := hk
     interval_cases k <;> norm_num [vR1seqM115] <;> first | assumption | positivity
   · by_cases hl : k<1
     · rw [hz (k-1) (Or.inl (by omega)),zero_mul]; exact sq_nonneg _
     · rw [hz (k+1) (Or.inr (by omega)),mul_zero]; exact sq_nonneg _

theorem vThird_seed_run1M115 (rest : List Bool) (ha : 7≤(frame rest).mid.b) :
 CrossLC (CoeffSeq ((vThirdSeedMEA (X:ℤ[X]) 0 rest).map (Int.castRingHom ℝ))) := by
 rw [vR1seed_sourceM115]
 have hm (a b c d e : ℤ) :
   (vR1seedM115 a b c d e).map (Int.castRingHom ℝ)=
   vR1seedM115 (a:ℝ) b c d e := by
   simp only [vR1seedM115,vR1c1M115,vR1c2M115,vR1c3M115,vR1c4M115,vR1c5M115,vR1c6M115,vR1c7M115,vR1c8M115,vR1c9M115,Polynomial.map_add,Polynomial.map_mul,
     Polynomial.map_pow,Polynomial.map_X,Polynomial.map_C,map_add,map_sub,map_mul,
     map_pow,map_ofNat,map_neg,map_one,map_zero]
 rw [hm]
 simp only [Int.cast_natCast]
 apply vR1cross_of_boundsM115
 exact vR1boundsM115 _ _ (frame_reduced rest).1 ha (frame_reduced rest).2.1

theorem vertical_third_run1M115 (rest : List Bool) (ha : 7≤(frame rest).mid.b) (j : ℕ) :
 let path := List.replicate 0 false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 exact vertical_third_of_seedMEA 0 rest ha (vThird_seed_run1M115 rest ha) j
end
end MathGKM.Markov
