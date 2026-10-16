"""Machine-authored f8ca2c8b. Generate corrected a=3 candidate proofs.
The immutable prior generator is adapted into a new file; all claims need Lean.
"""
from pathlib import Path
from math import comb
import json
from small_blocks_ae257c53 import blocks,divplus,lean
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f8ca2c8b'
def corrected(a,r):
 assert a==3
 bs=blocks(a,r)
 for k in range(7):bs[0][0,k+3-r]=bs[0].get((0,k+3-r),0)+6*(-1)**k*comb(6,k)
 return [{k:v for k,v in d.items() if v} for d in bs]
mods=[]
for r in (1,2):
 tag=f'3{r}';bs=corrected(3,r)
 for _ in range(4):bs=[divplus(d) for d in bs]
 mod=f'MarkovThirdSmallBridge{tag}MF8';mods.append(mod)
 s='import MarkovThirdThreeSourceMF8\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 8000000\n'
 for k,d in enumerate(bs):
  s+=f'def sThird{tag}J{k}MF8 {{R : Type*}} [CommRing R] (q x : R) : R := {lean(d)}\n'
  cor=f'+6*x^{3-r}*(1-x)^6' if k==0 else ''
  counts=[3,3-r,max(3-2*r,0),min(r,max(6-3*r,0)),max(3-3*r,0)]
  s+=f'theorem sThird{tag}block{k}MF8 {{R : Type*}} [CommRing R] (q x : R) :\n (1+x)^4*sThird{tag}J{k}MF8 q x=vJ{k}M115 {" ".join(map(str,counts))} q x{cor} := by\n simp only [sThird{tag}J{k}MF8,vJ{k}M115]\n ring\n'
 rr='true' if r==1 else 'false'
 s+=f'''
theorem sThird{tag}sourceMF8 (n : ℕ) (rest : List Bool)
 (ha : (frame rest).mid.a={3-r}) (hb : (frame rest).mid.b=3) :
 let path := List.replicate n false++true::rest
 (1-X)^6*(6*X^{3-r}*((frame path).mid.p).coeff 3)=
 sThird{tag}J0MF8 (n+1:ℤ[X]) X+X^(n+1)*sThird{tag}J1MF8 (n+1:ℤ[X]) X+
 X^(2*(n+1))*sThird{tag}J2MF8 (n+1:ℤ[X]) X+X^(3*(n+1))*sThird{tag}J3MF8 (n+1:ℤ[X]) X := by
 have hr : rest=[{rr}] := frame_path_injective_098 (ha.trans (by decide)) (hb.trans (by decide))
 subst rest
 dsimp only
 have hf := vertical_three_clearedMF8 n {rr}
 simp only [Bool.false_eq_true,if_false,if_true] at hf
 have hs := vThirdSeed_four_blocksM115 n [{rr}]
 norm_num only [frame,initial,advance,List.foldl_cons,List.foldl_nil,if_true,if_false,
   Bool.false_eq_true,Nat.reduceAdd,Nat.reduceSub,Nat.reduceMul,Nat.cast_ofNat,
   Nat.cast_one,Nat.cast_zero,vThirdNumeratorM115,Nat.min_self,Nat.min_eq_left (by decide : 1≤3)] at hs
 have h0 := sThird{tag}block0MF8 (n+1:ℤ[X]) X
 have h1 := sThird{tag}block1MF8 (n+1:ℤ[X]) X
 have h2 := sThird{tag}block2MF8 (n+1:ℤ[X]) X
 have h3 := sThird{tag}block3MF8 (n+1:ℤ[X]) X
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero 4 hn)
 linear_combination (1-X)^6*hf+hs-h0-X^(n+1)*h1-X^(2*(n+1))*h2-X^(3*(n+1))*h3
end
end MathGKM.Markov
'''
 (R/f'research/{mod}.lean').write_text(s)
# Preserve the original generator unchanged. This generated adaptation is a new artifact.
s=(R/'research/generate_small_762ebbae.py').read_text()
s=s.replace('from small_blocks_ae257c53 import blocks,divplus,lean as blocklean','from generate_three_f8ca2c8b import corrected as blocks\nfrom small_blocks_ae257c53 import divplus,lean as blocklean')
s=s.replace('762ebbae','f8ca2c8b').replace('M762','MF8').replace('MAE2','MF8')
s=s.replace('[(4,1),(4,3),(5,1),(5,2),(5,3),(5,4),(6,1),(6,5)]','[(3,1),(3,2)]')
s=s.replace('2≤q','1≤q').replace('(hn : 1≤n)','(hn : 0≤n)')
s=s.replace('let m := (frame path).mid.b-3*(n+2)','let m : ℕ := 0')
s=s.replace('((k:ℤ)-m)', '((k:ℤ)+{3-r})')
s=s.replace('({{', '({{')
start=s.index('   have h := {nm}coeffMF8 (6*')
end=s.index(' have h0 := hc j',start)
s=s[:start]+'''   have h := {nm}coeffMF8 (6*X^{3-r}*((frame path).mid.p).coeff 3) 0 (n+1) (k+{3-r})
     (by simpa only [pow_zero,one_mul,one_mul,Nat.cast_add,Nat.cast_one] using {nm}sourceMF8 n rest ha hb)
   simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Nat.cast_zero,sub_zero,mul_assoc] at h
   simp only [show (6:ℤ[X])=C (6:ℤ) from rfl,Polynomial.coeff_C_mul] at h
   rw [Polynomial.coeff_X_pow_mul] at h
   change 120*(6*coeff (frame path).mid.p 3 k)=_ at h
   linear_combination h
'''+s[end:]
s=s.replace('((j:ℤ)-m)','((j:ℤ)+{3-r})').replace('(j+2-m)','(j+2+{3-r})').replace('(j+1-m)','(j+1+{3-r})')
(R/'research/generate_three_lc_f8ca2c8b.py').write_text(s)
(O/'three-source-plan.json').write_text(json.dumps(mods,indent=2)+'\n')
print('Generated corrected source blocks and adapted LC generator')
