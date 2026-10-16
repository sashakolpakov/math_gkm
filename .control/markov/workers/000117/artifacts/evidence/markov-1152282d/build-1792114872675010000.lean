import MarkovThirdRun3BoundsM115
import MarkovPrefixLCM115
/-! Machine-authored 1152282d. Zeros and every integer index retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

def vR3seqM115 (a b c d e : ℝ) (k : ℤ) : ℝ :=
 if k=1 then vR3c1M115 a b c d e else if k=2 then vR3c2M115 a b c d e else if k=3 then vR3c3M115 a b c d e else if k=4 then vR3c4M115 a b c d e else if k=5 then vR3c5M115 a b c d e else if k=6 then vR3c6M115 a b c d e else if k=7 then vR3c7M115 a b c d e else if k=8 then vR3c8M115 a b c d e else if k=9 then vR3c9M115 a b c d e else if k=10 then vR3c10M115 a b c d e else if k=11 then vR3c11M115 a b c d e else if k=12 then vR3c12M115 a b c d e else if k=13 then vR3c13M115 a b c d e else if k=14 then vR3c14M115 a b c d e else if k=15 then vR3c15M115 a b c d e else 0

theorem vR3coeffM115 (a b c d e : ℝ) :
 CoeffSeq (vR3seedM115 a b c d e)=vR3seqM115 a b c d e := by
 funext k
 by_cases hk : k<0
 · simp [CoeffSeq,hk,vR3seqM115,show k≠1 by omega,show k≠2 by omega,show k≠3 by omega,show k≠4 by omega,show k≠5 by omega,show k≠6 by omega,show k≠7 by omega,show k≠8 by omega,show k≠9 by omega,show k≠10 by omega,show k≠11 by omega,show k≠12 by omega,show k≠13 by omega,show k≠14 by omega,show k≠15 by omega]
 · lift k to ℕ using (show 0≤k by omega)
   rw [coeffSeq_nat774]
   by_cases hl : k≤15
   · interval_cases k <;> norm_num [vR3seedM115,vR3seqM115,
       Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C,Polynomial.coeff_X]
   · simp [vR3seedM115,vR3seqM115,Polynomial.coeff_C_mul_X_pow,
       Polynomial.coeff_C,Polynomial.coeff_X,show k≠1 by omega,show 1≠k by omega,show (k:ℤ)≠1 by omega,show k≠2 by omega,show 2≠k by omega,show (k:ℤ)≠2 by omega,show k≠3 by omega,show 3≠k by omega,show (k:ℤ)≠3 by omega,show k≠4 by omega,show 4≠k by omega,show (k:ℤ)≠4 by omega,show k≠5 by omega,show 5≠k by omega,show (k:ℤ)≠5 by omega,show k≠6 by omega,show 6≠k by omega,show (k:ℤ)≠6 by omega,show k≠7 by omega,show 7≠k by omega,show (k:ℤ)≠7 by omega,show k≠8 by omega,show 8≠k by omega,show (k:ℤ)≠8 by omega,show k≠9 by omega,show 9≠k by omega,show (k:ℤ)≠9 by omega,show k≠10 by omega,show 10≠k by omega,show (k:ℤ)≠10 by omega,show k≠11 by omega,show 11≠k by omega,show (k:ℤ)≠11 by omega,show k≠12 by omega,show 12≠k by omega,show (k:ℤ)≠12 by omega,show k≠13 by omega,show 13≠k by omega,show (k:ℤ)≠13 by omega,show k≠14 by omega,show 14≠k by omega,show (k:ℤ)≠14 by omega,show k≠15 by omega,show 15≠k by omega,show (k:ℤ)≠15 by omega]

theorem vR3cross_of_boundsM115 (a b c d e : ℝ) (h : vR3BoundsM115 a b c d e) :
 CrossLC (CoeffSeq (vR3seedM115 a b c d e)) := by
 obtain ⟨h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14⟩ := h
 rw [vR3coeffM115]
 have hz (k : ℤ) (h : k<1 ∨ 15<k) : vR3seqM115 a b c d e k=0 := by
   simp only [vR3seqM115,if_neg (show k≠1 by omega),if_neg (show k≠2 by omega),if_neg (show k≠3 by omega),if_neg (show k≠4 by omega),if_neg (show k≠5 by omega),if_neg (show k≠6 by omega),if_neg (show k≠7 by omega),if_neg (show k≠8 by omega),if_neg (show k≠9 by omega),if_neg (show k≠10 by omega),if_neg (show k≠11 by omega),if_neg (show k≠12 by omega),if_neg (show k≠13 by omega),if_neg (show k≠14 by omega),if_neg (show k≠15 by omega)]
 apply crossLC_two_prefixM115 _ 15 (by norm_num) hz
 · intro k
   by_cases hk : 1 ≤ k ∧ k ≤ 15
   · obtain ⟨hl,hu⟩ := hk
     interval_cases k <;> norm_num [vR3seqM115] <;> positivity
   · rw [hz k (by omega)]
 · intro k hk hl
   interval_cases k <;> norm_num [vR3seqM115] <;> assumption
 · intro k
   by_cases hk : 1≤k ∧ k≤15
   · obtain ⟨hl,hu⟩ := hk
     interval_cases k <;> norm_num [vR3seqM115] <;> first | assumption | positivity
   · by_cases hl : k<1
     · rw [hz (k-1) (Or.inl (by omega)),zero_mul]; exact sq_nonneg _
     · rw [hz (k+1) (Or.inr (by omega)),mul_zero]; exact sq_nonneg _

theorem vThird_seed_run3M115 (rest : List Bool) (ha : 7≤(frame rest).mid.b) :
 CrossLC (CoeffSeq ((vThirdSeedMEA (X:ℤ[X]) 2 rest).map (Int.castRingHom ℝ))) := by
 rw [vR3seed_sourceM115]
 have hm (a b c d e : ℤ) :
   (vR3seedM115 a b c d e).map (Int.castRingHom ℝ)=
   vR3seedM115 (a:ℝ) b c d e := by
   simp only [vR3seedM115,Polynomial.map_add,Polynomial.map_mul,
     Polynomial.map_pow,Polynomial.map_X,Polynomial.map_C]
   simp only [vR3c1M115,vR3c2M115,vR3c3M115,vR3c4M115,vR3c5M115,vR3c6M115,vR3c7M115,vR3c8M115,vR3c9M115,vR3c10M115,vR3c11M115,vR3c12M115,vR3c13M115,vR3c14M115,vR3c15M115,Int.coe_castRingHom,Int.cast_add,Int.cast_sub,Int.cast_mul,
     Int.cast_pow,Int.cast_ofNat,Int.cast_neg]
 rw [hm]
 simp only [Int.cast_natCast]
 apply vR3cross_of_boundsM115
 exact vR3boundsM115 _ _ (frame_reduced rest).1 ha (frame_reduced rest).2.1

theorem vertical_third_run3M115 (rest : List Bool) (ha : 7≤(frame rest).mid.b) (j : ℕ) :
 let path := List.replicate 2 false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 exact vertical_third_of_seedMEA 2 rest ha (vThird_seed_run3M115 rest ha) j
end
end MathGKM.Markov
