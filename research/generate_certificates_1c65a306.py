"""Machine-authored Lean candidate generation from exact integer expressions.
The generated identities require ordinary Lean ring proofs; data is not trusted.
"""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm')
rows=json.loads((R/'evidence/markov-beca0ad5/factored-reverse-certificates.json').read_text())
for h in [4,5]:
 row=next(x for x in rows if x['h']==h)
 terms=[]
 for (a,b),c in row['polynomial']:
  t=str(c)
  if a:t+='*u'+('^'+str(a) if a>1 else '')
  if b:t+='*v'+('^'+str(b) if b>1 else '')
  terms.append(t)
 core=' +\n  '.join(terms)
 fac='*'.join(f'(u+{("v+" if ds else "")}{c})' for c,ds in row['factors'])
 src=f'''import MarkovPolynomialCertificateMBEC
/-! Machine-authored 1c65a306. Universal parameter certificate at fixed deficiency {h}.
The symbolic identity is checked by ring; finite input data supplies no axiom. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 8000

def core{h}M1C6 {{R : Type*}} [CommRing R] (u v : R) : R :=
  {core}

def factored{h}M1C6 {{R : Type*}} [CommRing R] (u v : R) : R :=
  {fac}*core{h}M1C6 u v

theorem certificate_{h}_factorM1C6 :
 certificateGapMBEC {h} = factored{h}M1C6 U V := by
 unfold certificateGapMBEC certificateConvMBEC certificateKernelMBEC
 norm_num only [sum_range_succ,prod_range_succ,sum_range_zero,prod_range_zero,
   Nat.reduceAdd,Nat.reduceSub,integerWeightMBEC,ite_true,ite_false,Nat.cast_zero,
   Int.reduceMul,Int.cast_ofNat,Int.cast_one,Int.cast_zero,zero_mul,mul_zero,zero_add,
   mul_one,one_mul]
 norm_num only [show (1:ℕ)≠0 by omega,show (2:ℕ)≠0 by omega,
   show (3:ℕ)≠0 by omega,show (4:ℕ)≠0 by omega,show (5:ℕ)≠0 by omega,ite_false]
 unfold factored{h}M1C6 core{h}M1C6
 norm_num
 <;> ring

theorem certificate_{h}_evalM1C6 (k s : ℕ) :
 clearedGapMBEC ({h}+k) s {h}=factored{h}M1C6 (k:ℤ) (s:ℤ) := by
 rw [←certificate_gap_evalMBEC,certificate_{h}_factorM1C6]
 simp [factored{h}M1C6,core{h}M1C6,map_mul,map_add,map_pow,map_ofNat,
   certificate_eval_uMBEC,certificate_eval_vMBEC]

theorem certificate_{h}_positiveM1C6 (k s : ℕ) :
 0 < clearedGapMBEC ({h}+k) s {h} := by
 rw [certificate_{h}_evalM1C6]
 unfold factored{h}M1C6 core{h}M1C6
 positivity

theorem reverse_{h}M1C6 (j s : ℕ) (hj : {h} ≤ j) :
 reverseConvMBEC j (s+1) (s+1) {h}*reverseConvMBEC j s (s+2) {h-1} ≤
 reverseConvMBEC j (s+1) (s+1) {h-1}*reverseConvMBEC j s (s+2) {h} := by
 obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
 exact (cleared_gap_iffMBEC ({h}+k) s {h} (by omega)).mp
   (certificate_{h}_positiveM1C6 k s).le

end
end MathGKM.Markov
'''
 (R/'research'/f'MarkovCertificate{h}M1C6.lean').write_text(src)
 print(f'Wrote candidate MarkovCertificate{h}M1C6.lean')
