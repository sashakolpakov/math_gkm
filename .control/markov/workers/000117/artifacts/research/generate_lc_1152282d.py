"""Machine-authored all-index fixed-run seed and source transports."""
from generate_fixed_1152282d import *
import sys
def main():
 for q in (list(map(int,sys.argv[1:])) if len(sys.argv)>1 else range(1,5)):
  N=3*q+6;nm=f'vR{q}'
  s=f'import MarkovThirdRun{q}BoundsM115\nimport MarkovPrefixLCM115\n/-! Machine-authored 1152282d. Zeros and every integer index retained. -/\n'+header
  defs=','.join(f'{nm}c{k}M115' for k in range(1,N+1))
  s+=f'\ndef {nm}seqM115 (a b c d e : ℝ) (k : ℤ) : ℝ :=\n '+' else '.join(f'if k={i} then {nm}c{i}M115 a b c d e' for i in range(1,N+1))+' else 0\n'
  s+=f'''
theorem {nm}coeffM115 (a b c d e : ℝ) :
 CoeffSeq ({nm}seedM115 a b c d e)={nm}seqM115 a b c d e := by
 funext k
 by_cases hk : k<0
 · simp [CoeffSeq,hk,{nm}seqM115,'''+','.join(f'show k≠{i} by omega' for i in range(1,N+1))+f''']
 · lift k to ℕ using (show 0≤k by omega)
   rw [coeffSeq_nat774]
   by_cases hl : k≤{N}
   · interval_cases k <;> norm_num [{nm}seedM115,{nm}seqM115,
       Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C,Polynomial.coeff_X]
   · simp [{nm}seedM115,{nm}seqM115,Polynomial.coeff_C_mul_X_pow,
       Polynomial.coeff_C,Polynomial.coeff_X,'''+','.join(f'show k≠{i} by omega,show {i}≠k by omega,show (k:ℤ)≠{i} by omega' for i in range(1,N+1))+''']
'''
  zero_rewrites=','.join(f'if_neg (show k≠{i} by omega)' for i in range(1,N+1))
  hs=[f'h{k}' for k in range(1,N+1)]+[f'g{k}' for k in range(2,N)]
  s+=f'''
theorem {nm}cross_of_boundsM115 (a b c d e : ℝ) (h : {nm}BoundsM115 a b c d e) :
 CrossLC (CoeffSeq ({nm}seedM115 a b c d e)) := by
 obtain ⟨{','.join(hs)}⟩ := h
 rw [{nm}coeffM115]
 have hz (k : ℤ) (h : k<1 ∨ {N}<k) : {nm}seqM115 a b c d e k=0 := by
   simp only [{nm}seqM115,{zero_rewrites}]
 apply crossLC_two_prefixM115 _ {N} (by norm_num) hz
 · intro k
   by_cases hk : 1 ≤ k ∧ k ≤ {N}
   · obtain ⟨hl,hu⟩ := hk
     interval_cases k <;> norm_num [{nm}seqM115] <;> positivity
   · rw [hz k (by omega)]
 · intro k hk hl
   interval_cases k <;> norm_num [{nm}seqM115] <;> assumption
 · intro k
   by_cases hk : 1≤k ∧ k≤{N}
   · obtain ⟨hl,hu⟩ := hk
     interval_cases k <;> norm_num [{nm}seqM115] <;> first | assumption | positivity
   · by_cases hl : k<1
     · rw [hz (k-1) (Or.inl (by omega)),zero_mul]; exact sq_nonneg _
     · rw [hz (k+1) (Or.inr (by omega)),mul_zero]; exact sq_nonneg _

theorem vThird_seed_run{q}M115 (rest : List Bool) (ha : 7≤(frame rest).mid.b) :
 CrossLC (CoeffSeq ((vThirdSeedMEA (X:ℤ[X]) {q-1} rest).map (Int.castRingHom ℝ))) := by
 rw [{nm}seed_sourceM115]
 have hm (a b c d e : ℤ) :
   ({nm}seedM115 a b c d e).map (Int.castRingHom ℝ)=
   {nm}seedM115 (a:ℝ) b c d e := by
   simp only [{nm}seedM115,Polynomial.map_add,Polynomial.map_mul,
     Polynomial.map_pow,Polynomial.map_X,Polynomial.map_C]
   simp only [{defs},Int.coe_castRingHom,Int.cast_add,Int.cast_sub,Int.cast_mul,
     Int.cast_pow,Int.cast_ofNat,Int.cast_neg]
 rw [hm]
 simp only [Int.cast_natCast]
 apply {nm}cross_of_boundsM115
 exact {nm}boundsM115 _ _ (frame_reduced rest).1 ha (frame_reduced rest).2.1

theorem vertical_third_run{q}M115 (rest : List Bool) (ha : 7≤(frame rest).mid.b) (j : ℕ) :
 let path := List.replicate {q-1} false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 exact vertical_third_of_seedMEA {q-1} rest ha (vThird_seed_run{q}M115 rest ha) j
end
end MathGKM.Markov
'''
  (R/f'research/MarkovThirdRun{q}LCM115.lean').write_text(s)
 print('Generated four LC source transports')
if __name__=='__main__':main()
