"""Machine-authored Lean certificates derived by exact polynomial arithmetic."""
from general_jets_probe_80fb7777 import *
data=json.loads((O/'general-jets.json').read_text())
jets={r:[P({tuple(z):F(v) for z,v in p}) for p in data[str(r)]] for r in [False,True]}
defs='''import MarkovCorrectionJetsM80F
/-! Machine-authored 80fb7777. Additional exact correction jets. -/
namespace MathGKM.Markov
noncomputable section
'''
for c in [5,6]:
 defs+=f'def correctionJet{c}M80F (q k : ℚ) (r : Bool) : ℚ :=\n if r then {rat_expr(jets[True][c])} else {rat_expr(jets[False][c])}\n\n'
defs+='end\nend MathGKM.Markov\n'
(R/'research/MarkovCorrectionHighDefsM80F.lean').write_text(defs)
src='''import MarkovCorrectionHighDefsM80F
/-! Machine-authored 80fb7777. Exact fifth and sixth correction coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 15000000
set_option maxRecDepth 50000
set_option linter.unusedSimpArgs false
theorem middle_correction_high_jetsM80F (q k : ℕ) (r : Bool) (hq : 1 ≤ q) (hk : k ≤ q) :
 ((middleCorrectionM99A q r k).coeff 5:ℚ)=correctionJet5M80F q k r ∧
 ((middleCorrectionM99A q r k).coeff 6:ℚ)=correctionJet6M80F q k r := by
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · simp only [middleCorrectionM99A,middle_gain_topM99A]
     cases r <;> norm_num [correctionJet5M80F,correctionJet6M80F,coeff_C_mul,coeff_X]
   · rw [middle_correction_oneM99A q r hq]
     cases r <;> simp only [Bool.false_eq_true,if_false,if_true,coeff_add,
       coeff_ofNat_mul,coeff_C_mul,coeff_X_pow,coeff_X]
       <;> norm_num [correctionJet5M80F,correctionJet6M80F] <;> push_cast <;> ring_nf <;> simp
   · obtain ⟨a0,b0⟩ := ih k (by omega) (by omega)
     obtain ⟨a1,b1⟩ := ih (k+1) (by omega) (by omega)
     obtain ⟨_,_,_,c0,d0⟩ := middle_correction_jetsM80F q k r hq (by omega)
     obtain ⟨_,_,_,c1,d1⟩ := middle_correction_jetsM80F q (k+1) r hq (by omega)
     have he : middleCorrectionM99A q r (k+2)=
       4*(X*middleGainM99A q (k+2) r)+2*middleCorrectionM99A q r (k+1)-
       2*(X*middleCorrectionM99A q r (k+1))-middleCorrectionM99A q r k-
       2*(X*middleCorrectionM99A q r k)-X*(X*middleCorrectionM99A q r k) := by
       rw [middleCorrectionM99A]; ring
     constructor
'''
for c in [5,6]:
 src+=f'''     · have h := congrArg (fun p : Polynomial ℤ => (p.coeff {c}:ℚ)) he
       have hg := middle_gain_coeffM80F q k {c-1} r hk
       simp only [coeff_sub,coeff_add,coeff_ofNat_mul,coeff_X_mul,coeff_X_mul_zero,
         Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_zero] at h
       rw [hg] at h
       simp only [a0,a1,b0,b1,c0,c1,d0,d1] at h
       push_cast at h ⊢
       cases r <;> simp only [correctionJet3M80F,correctionJet4M80F,correctionJet5M80F,
         correctionJet6M80F,gainJetM80F,fibJetM80F,Bool.false_eq_true,if_false,if_true] at h ⊢
         <;> norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3] at h ⊢
         <;> linear_combination h
'''
src+='end\nend MathGKM.Markov\n'
(R/'research/MarkovCorrectionHighJetsM80F.lean').write_text(src)
defs='''import MarkovMiddleGapM80F
import MarkovCorrectionHighDefsM80F
/-! Machine-authored 80fb7777. Full raw source jets via finite Vandermonde sums. -/
namespace MathGKM.Markov
noncomputable section
'''
for c in [5,6]:
 defs+=f'def sourceJet{c}M80F (q k : ℚ) (r : Bool) : ℚ :=\n topShortQMEB6 (q+(if r then 1 else 2)-6-2*k) (q+k) {c-3}+correctionJet{c}M80F q k r\n\n'
defs+='end\nend MathGKM.Markov\n'
(R/'research/MarkovMiddleHighDefsM80F.lean').write_text(defs)
for c in [3,4]:
 for r in [False,True]:
  raw={z:short(q,q+3*k+(5 if r else 4),z-3)+jets[r][z].ev([q+2*k+(5 if r else 4),k,P(),P()]) for z in range(c,c+3)}
  gap=raw[c+1]**2-raw[c]*raw[c+2]
  assert all(v>0 for v in gap.d.values())
  den=lcm(*(v.denominator for v in gap.d.values()));e=expr(gap*den,['x','k','z','w'])
  rv=str(r).lower();base=5 if r else 4
  src=f'''import MarkovMiddleHighDefsM80F
/-! Machine-authored 80fb7777. Total raw middle gap including every cross term. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 20000000
set_option maxRecDepth 60000
theorem source_gap_{c}_{rv}M80F (x k : ℚ) (hx : 0 ≤ x) (hk : 0 ≤ k) :
 sourceJet{c}M80F (x+2*k+{base}) k {rv}*sourceJet{c+2}M80F (x+2*k+{base}) k {rv}<
 sourceJet{c+1}M80F (x+2*k+{base}) k {rv}^2 := by
 have he : {den}*(sourceJet{c+1}M80F (x+2*k+{base}) k {rv}^2-
   sourceJet{c}M80F (x+2*k+{base}) k {rv}*sourceJet{c+2}M80F (x+2*k+{base}) k {rv})={e} := by
   unfold sourceJet{c}M80F sourceJet{c+1}M80F sourceJet{c+2}M80F
   unfold correctionJet{c}M80F correctionJet{c+1}M80F correctionJet{c+2}M80F
   simp only [topThirdQM55C,topFourthQM55C,weightedChooseQM55C,topShortQMEB6]
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ)<{e} := by positivity
 linarith only [he,hp]
end
end MathGKM.Markov
'''
  (R/f'research/MarkovMiddleGap{c}{"T" if r else "F"}M80F.lean').write_text(src)
print('Generated fifth/sixth coefficient bridge and four total-gap certificates.')
