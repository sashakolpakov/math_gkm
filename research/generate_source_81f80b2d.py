"""Machine-authored all-source coefficient bridges, without gap assumption."""
from pathlib import Path
head='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff
'''
old=Path('research/MarkovStripGeneralSourceMCE8.lean').read_text()
second=old[old.index('theorem strip_second_general_coeffMCE8'):old.index('theorem strip_third_general_coeffMCE8')]
second=second.replace('strip_second_general_coeffMCE8','high_second_coeffM81F').replace('((frame path).mid.a+k)','((frame path).mid.a-1+k)').replace('(k+1)','k').replace('k+1+','k+')
third=old[old.index('theorem strip_third_general_coeffMCE8'):old.rindex('\nend\n')]
third=third.replace('strip_third_general_coeffMCE8','high_third_coeffM81F').replace('((frame path).mid.a+k)','((frame path).mid.a-1+k)').replace('(k+2)','(k+1)').replace('k+2+','k+1+')
src='import MarkovStripGeneralSourceMCE8\nimport MarkovHorizontalFourthSourceM511\n'+head+second+third
src+='''
theorem high_fourth_coeffM81F (path : List Bool) (ha : 3 ≤ (frame path).mid.a)
 (hb : 9 ≤ (frame path).mid.b) (k : ℕ) :
 24*(coeff (frame path).mid.p ((frame path).mid.a-1+k) 4:ℝ)=
 ((1+(X:ℝ[X]))^((frame path).mid.b-9)*h4sourceSeedM511
 (frame path).mid.a (frame path).mid.b).coeff (k+2) := by
 have h := congrArg (Polynomial.map (Int.castRingHom ℝ)) (horizontal_fourth_formulaM511 path ha hb)
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_ofNat,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,h4source_seed_mapM511] at h
 have hc := congrArg (fun p : ℝ[X] => p.coeff (k+2+((frame path).mid.a-3))) h
 rw [mul_assoc,Polynomial.coeff_X_pow_mul,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_map,swap_coeff46] at hc
 simpa only [show k+2+((frame path).mid.a-3)=(frame path).mid.a-1+k by omega,Int.coe_castRingHom] using hc
end
end MathGKM.Markov
'''
Path('research/MarkovHighSourceM81F.lean').write_text(src)
def fall(x,n):return '*'.join(f'({x}-{j})' if j else f'({x})' for j in range(n)) or '1'
scalar='import MarkovHighDefsM81F\nimport MarkovFallingSeed3M81F\nimport MarkovFallingSeed5M81F\nimport MarkovFallingSeed7M81F\nimport MarkovStripGeneralSourceMCE8\nimport MarkovBinomialRatios6a40\n'+head
for d,row in [(3,2),(5,3),(7,4)]:
 shift=row-2
 params={2:'a q',3:'a q t u',4:'a q t u v w z'}[row]
 seed={2:'stripSecondSeedMCE8 a (k+l+2) q',3:'h3seedM13D a (k+l+2) q t u',4:'h4seedM511 a (k+l+2) q t u v w z'}[row]
 dest={2:'highJM81F a k l q',3:'highHM81F a k l q t u',4:'highIM81F a k l q t u v w z'}[row]
 cs={2:['8*q','9*a^2-5*a+2','6*a^2+6*a*(k+l+2)-16*a+4','(a+k+l+1)*(a+k+l)'],3:['h3c0M13D u','h3c1M13D a q t','h3c2M13D a (k+l+2) q']+[f'h3c{r}M13D a (k+l+2)' for r in range(3,6)],4:[f'h4c{r}M511 a (k+l+2) q t u v w z' for r in range(8)]}[row]
 scale=''.join(f'*(k+{s})' for s in range(1,shift+1))
 lc=''.join(f'*(l-{s})' if s else '*l' for s in range(shift))
 scalar+=f'''theorem high_seed{row}_scaledM81F (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) ({params} : ℝ) :
 {fall('(k:ℝ)+l',d)}{scale}*(((1+(X:ℝ[X]))^(k+l-{d})*{seed}).coeff (k+{shift}))=
 ((k+l).choose k:ℝ){lc}*{dest} := by
 have h := falling_seed{d}M81F (k+{shift}) (l-{shift}) (by omega) {' '.join('('+c+')' for c in cs)}
 rw [show k+{shift}+(l-{shift})=k+l by omega] at h
 push_cast [Nat.cast_sub (show {shift} ≤ l by omega)] at h
 have he : {seed}={'+'.join(f'C ({c})*X^{r}' for r,c in enumerate(cs))} := by
'''
 unfolds={2:'stripSecondSeedMCE8 stripQuadMB9D',3:'h3seedM13D',4:'h4seedM511'}[row]
 scalar+=f'  simp only [{unfolds.replace(" ",",")},map_add,map_sub,map_mul,map_pow,map_ofNat,map_one]\n  ring\n rw [←he] at h\n'
 if shift>=1:scalar+=' have hb0 := bc_lower6 (k+l) k\n unfold bc6 at hb0\n push_cast at hb0\n'
 if shift>=2:scalar+=' have hb1 := bc_lower6 (k+l) (k+1)\n unfold bc6 at hb1\n push_cast at hb1\n'
 scalar+=' unfold '+dest.split()[0]+' at ⊢\n'
 if shift==0:scalar+=' simpa only [Nat.add_zero] using h\n'
 elif shift==1:scalar+=' linear_combination ((k:ℝ)+1)*h+('+dest+')*hb0\n'
 else:scalar+=' linear_combination ((k:ℝ)+1)*(k+2)*h+('+dest+')*((l-1)*hb0+(k+1)*hb1)\n'
 # unfold destination in linear_combination as well, by adding at h? ring treats named dest opaque.
 scalar=scalar.replace('unfold '+dest.split()[0]+' at ⊢\n','unfold '+dest.split()[0]+' at ⊢\n')
scalar+='end\nend MathGKM.Markov\n'
Path('research/MarkovHighScalingM81F.lean').write_text(scalar)
print('Generated source and scaling bridges')
