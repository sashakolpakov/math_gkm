"""Machine-authored zero-inclusive coefficient proof candidates."""
from pathlib import Path
def fall(x,n):return '*'.join(f'({x}-{j})' if j else f'({x})' for j in range(n)) or '1'
head='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 12000
'''
for d in [3,5,7]:
 cs=' '.join('c'+str(r) for r in range(d+1))
 poly='+'.join(f'C c{r}*X^{r}' for r in range(d+1))
 rhs='+'.join(f'c{r}*{fall("k",r)}*{fall("l",d-r)}' for r in range(d+1))
 src='import MarkovFallingM81F\n'+head
 src+=f'''theorem falling_seed{d}M81F (k l : ℕ) (hd : {d} ≤ k+l) ({cs} : ℝ) :
 {fall('(k:ℝ)+l',d)}*(((1+(X:ℝ[X]))^(k+l-{d})*({poly})).coeff k)=
 ((k+l).choose k:ℝ)*({rhs}) := by
'''
 for r in range(d+1):
  src+=f' have h{r} := falling_monomialM81F k l {d} {r} (by omega) hd\n'
 src+=' norm_num only [fallM81F,descPochhammer_succ_eval,descPochhammer_zero,Polynomial.eval_one,Nat.cast_ofNat,mul_one,one_mul,sub_zero] at '+ ' '.join(f'h{r}' for r in range(d+1))+'\n'
 src+=f' have he : (1+(X:ℝ[X]))^(k+l-{d})*({poly})=\n '+ '+'.join(f'C c{r}*((1+X)^(k+l-{d})*X^{r})' for r in range(d+1))+' := by ring\n'
 src+=' rw [he]\n simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul]\n linear_combination '+ '+'.join(f'c{r}*h{r}' for r in range(d+1))+'\nend\nend MathGKM.Markov\n'
 Path(f'research/MarkovFallingSeed{d}M81F.lean').write_text(src)
print('Generated degrees 3, 5, 7')
