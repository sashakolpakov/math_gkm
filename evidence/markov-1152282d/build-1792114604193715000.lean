import MarkovThirdRun2BoundsM115
import MarkovPrefixLCM115
/-! Machine-authored 1152282d. Zeros and every integer index retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

def vR2seqM115 (a b c d e : ℝ) (k : ℤ) : ℝ :=
 if k=1 then vR2c1M115 a b c d e else if k=2 then vR2c2M115 a b c d e else if k=3 then vR2c3M115 a b c d e else if k=4 then vR2c4M115 a b c d e else if k=5 then vR2c5M115 a b c d e else if k=6 then vR2c6M115 a b c d e else if k=7 then vR2c7M115 a b c d e else if k=8 then vR2c8M115 a b c d e else if k=9 then vR2c9M115 a b c d e else if k=10 then vR2c10M115 a b c d e else if k=11 then vR2c11M115 a b c d e else if k=12 then vR2c12M115 a b c d e else 0

theorem vR2coeffM115 (a b c d e : ℝ) :
 CoeffSeq (vR2seedM115 a b c d e)=vR2seqM115 a b c d e := by
 funext k
 by_cases hk : k<0
 · simp [CoeffSeq,hk,vR2seqM115,show k≠1 by omega,show k≠2 by omega,show k≠3 by omega,show k≠4 by omega,show k≠5 by omega,show k≠6 by omega,show k≠7 by omega,show k≠8 by omega,show k≠9 by omega,show k≠10 by omega,show k≠11 by omega,show k≠12 by omega]
 · lift k to ℕ using (show 0≤k by omega)
   rw [coeffSeq_nat774]
   by_cases hl : k≤12
   · interval_cases k <;> norm_num [vR2seedM115,vR2seqM115,
       Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C,Polynomial.coeff_X]
   · simp [vR2seedM115,vR2seqM115,Polynomial.coeff_C_mul_X_pow,
       Polynomial.coeff_C,Polynomial.coeff_X,show k≠1 by omega,show 1≠k by omega,show (k:ℤ)≠1 by omega,show k≠2 by omega,show 2≠k by omega,show (k:ℤ)≠2 by omega,show k≠3 by omega,show 3≠k by omega,show (k:ℤ)≠3 by omega,show k≠4 by omega,show 4≠k by omega,show (k:ℤ)≠4 by omega,show k≠5 by omega,show 5≠k by omega,show (k:ℤ)≠5 by omega,show k≠6 by omega,show 6≠k by omega,show (k:ℤ)≠6 by omega,show k≠7 by omega,show 7≠k by omega,show (k:ℤ)≠7 by omega,show k≠8 by omega,show 8≠k by omega,show (k:ℤ)≠8 by omega,show k≠9 by omega,show 9≠k by omega,show (k:ℤ)≠9 by omega,show k≠10 by omega,show 10≠k by omega,show (k:ℤ)≠10 by omega,show k≠11 by omega,show 11≠k by omega,show (k:ℤ)≠11 by omega,show k≠12 by omega,show 12≠k by omega,show (k:ℤ)≠12 by omega]

theorem vR2cross_of_boundsM115 (a b c d e : ℝ) (h : vR2BoundsM115 a b c d e) :
 CrossLC (CoeffSeq (vR2seedM115 a b c d e)) := by
 obtain ⟨h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11⟩ := h
 rw [vR2coeffM115]
 have hz (k : ℤ) (h : k<1 ∨ 12<k) : vR2seqM115 a b c d e k=0 := by
   unfold vR2seqM115
   split_ifs <;> first | omega | rfl
 apply crossLC_two_prefixM115 _ 12 (by norm_num) hz
 · intro k
   unfold vR2seqM115
   split_ifs <;> positivity
 · intro k hk hl
   interval_cases k <;> norm_num [vR2seqM115] <;> assumption
 · intro k
   by_cases hk : 1≤k ∧ k≤12
   · obtain ⟨hl,hu⟩ := hk
     interval_cases k <;> norm_num [vR2seqM115] <;> first | assumption | positivity
   · by_cases hl : k<1
     · rw [hz (k-1) (Or.inl (by omega)),zero_mul]; exact sq_nonneg _
     · rw [hz (k+1) (Or.inr (by omega)),mul_zero]; exact sq_nonneg _

theorem vThird_seed_run2M115 (rest : List Bool) (ha : 7≤(frame rest).mid.b) :
 CrossLC (CoeffSeq ((vThirdSeedMEA (X:ℤ[X]) 1 rest).map (Int.castRingHom ℝ))) := by
 rw [vR2seed_sourceM115]
 have hm (a b c d e : ℤ) :
   (vR2seedM115 a b c d e).map (Int.castRingHom ℝ)=
   vR2seedM115 (a:ℝ) b c d e := by
   simp only [vR2seedM115,Polynomial.map_add,Polynomial.map_mul,
     Polynomial.map_pow,Polynomial.map_X,Polynomial.map_C]
   simp only [vR2c1M115,vR2c2M115,vR2c3M115,vR2c4M115,vR2c5M115,vR2c6M115,vR2c7M115,vR2c8M115,vR2c9M115,vR2c10M115,vR2c11M115,vR2c12M115,Int.castRingHom_apply,Int.cast_add,Int.cast_sub,Int.cast_mul,
     Int.cast_pow,Int.cast_ofNat,Int.cast_neg]
 rw [hm]
 simp only [Int.cast_natCast]
 apply vR2cross_of_boundsM115
 exact vR2boundsM115 _ _ (frame_reduced rest).1 ha (frame_reduced rest).2.1

theorem vertical_third_run2M115 (rest : List Bool) (ha : 7≤(frame rest).mid.b) (j : ℕ) :
 let path := List.replicate 1 false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 exact vertical_third_of_seedMEA 1 rest ha (vThird_seed_run2M115 rest ha) j
end
end MathGKM.Markov
