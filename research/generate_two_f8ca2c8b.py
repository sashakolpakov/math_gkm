"""Machine-authored f8ca2c8b; corrected two-letter candidates, checked by Lean."""
from pathlib import Path
import json
from explore_two_f8ca2c8b import corrected
from small_blocks_ae257c53 import divplus,lean
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f8ca2c8b'
bs=corrected(2,1)
for _ in range(5):bs=[divplus(d) for d in bs]
mod='MarkovThirdSmallBridge21MF8'
s='import MarkovThirdTwoSourceMF8\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 12000000\nset_option linter.unusedSimpArgs false\n'
for k,d in enumerate(bs):s+=f'def sThird21J{k}MF8 {{R : Type*}} [CommRing R] (q x : R) : R := {lean(d)}\n'
s+='''
theorem sThird21blocksMF8 {R : Type*} [CommRing R] (q x t : R) :
 (1+x)^5*(sThird21J0MF8 q x+t*sThird21J1MF8 q x+t^2*sThird21J2MF8 q x+t^3*sThird21J3MF8 q x)=
 vJ0M115 2 1 0 0 0 q x+t*vJ1M115 2 1 0 0 0 q x+
 t^2*vJ2M115 2 1 0 0 0 q x+t^3*vJ3M115 2 1 0 0 0 q x+6*vTwoSparseMF8 q x t := by
 simp only [sThird21J0MF8,sThird21J1MF8,sThird21J2MF8,sThird21J3MF8,
   vJ0M115,vJ1M115,vJ2M115,vJ3M115,vTwoSparseMF8]
 ring

theorem sThird21sourceMF8 (n : ℕ) :
 let path := List.replicate n false++[true]
 (1-X)^6*(6*X^(n+3)*((frame path).mid.p).coeff 3)=
 sThird21J0MF8 (n+1:ℤ[X]) X+X^(n+1)*sThird21J1MF8 (n+1:ℤ[X]) X+
 X^(2*(n+1))*sThird21J2MF8 (n+1:ℤ[X]) X+X^(3*(n+1))*sThird21J3MF8 (n+1:ℤ[X]) X := by
 dsimp only
 have hf := vertical_two_third_clearedMF8 n
 dsimp only at hf
 have hs := vThirdSeed_four_blocksM115 n []
 norm_num [frame,initial,vThirdNumeratorM115] at hs
 have hc := vTwoCorrection_sparseMF8 n
 have hb := sThird21blocksMF8 (n+1:ℤ[X]) X (X^(n+1))
 rw [←pow_mul,←pow_mul] at hb
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero 5 hn)
 simp only [mul_comm (n+1) 2,mul_comm (n+1) 3] at hb
 linear_combination (1-X)^6*hf+hs+6*hc-hb
end
end MathGKM.Markov
'''
(R/f'research/{mod}.lean').write_text(s)
# Adapt the immutable original generator with the same generic coefficient adapter.
s=(R/'research/generate_small_762ebbae.py').read_text()
s=s.replace('from small_blocks_ae257c53 import blocks,divplus,lean as blocklean','from explore_two_f8ca2c8b import corrected as blocks\nfrom small_blocks_ae257c53 import divplus,lean as blocklean')
s=s.replace('762ebbae','f8ca2c8b').replace('M762','MF8').replace('MAE2','MF8')
s=s.replace('[(4,1),(4,3),(5,1),(5,2),(5,3),(5,4),(6,1),(6,5)]','[(2,1)]')
s=s.replace('2≤q','1≤q')
start=s.index('theorem {nm}rawMF8')
end=s.index('end\nend MathGKM.Markov',start)
s=s[:start]+'''theorem {nm}rawMF8 (n j : ℕ) :
 let path := List.replicate n false++[true]
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++[true]
 have hc (k : ℕ) : 720*coeff (frame path).mid.p 3 k={E} (n+1) ((k:ℤ)+(n+3)) := by
   have h := {nm}coeffMF8 (6*X^(n+3)*((frame path).mid.p).coeff 3) 0 (n+1) (k+(n+3))
     (by simpa only [pow_zero,one_mul,Nat.cast_add,Nat.cast_one] using {nm}sourceMF8 n)
   simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Nat.cast_zero,sub_zero,mul_assoc] at h
   simp only [show (6:ℤ[X])=C (6:ℤ) from rfl,Polynomial.coeff_C_mul] at h
   rw [Polynomial.coeff_X_pow_mul] at h
   change 120*(6*coeff (frame path).mid.p 3 k)=_ at h
   linear_combination h
 have h0 := hc j
 have h1 := hc (j+1)
 have h2 := hc (j+2)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 have hh : {E} (n+1) ((j:ℤ)+(n+3))*{E} (n+1) (j+2+(n+3)) ≤ {E} (n+1) (j+1+(n+3))^2 := by
   convert {nm}adjacentMF8 (n+1) (j+1+(n+3)) (by omega) using 1 <;> congr 1 <;> congr 1 <;> ring
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]
'''+s[end:]
s=s.replace("'small-plan.json'","'two-plan.json'")
(R/'research/generate_two_lc_f8ca2c8b.py').write_text(s)
print('Generated corrected two-letter bridge and LC generator')
