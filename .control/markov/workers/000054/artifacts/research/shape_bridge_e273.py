"""Machine-authored e27336bc: generate universal coefficient-shape bridges."""
from pathlib import Path
import json
groups=[tuple(map(int,k.strip('()').split(','))) for k in json.loads(Path('evidence/markov-e27336bc/sparse-kernel.json').read_text())['groups']]
s='''import MarkovSparseKernelE273
import MarkovChooseShapeE273
import MarkovLowerShape446
/-! Machine-authored e27336bc. Universal source coefficient bridges for the
lower and upper polynomial shapes. No experimental equalities are assumed. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem chooseShift_polynomialE273 (j k : ℕ) (hk : k≤j+3) :
 6*chooseShiftE273 j k=((j:ℤ)-k+1)*(j-k+2)*(j-k+3) := by
 by_cases h : k≤j
 · simp only [chooseShiftE273,if_pos h]
   have he := choose_three_productE273 (j-k)
   simpa [Nat.cast_sub h,Nat.add_comm] using he
 · have hz : chooseShiftE273 j k=0 := by simp [chooseShiftE273,h]
   rw [hz,mul_zero]
   have hh : k=j+1 ∨ k=j+2 ∨ k=j+3 := by omega
   rcases hh with rfl | rfl | rfl <;> push_cast <;> ring

theorem chooseShift_zeroE273 (j k : ℕ) (hk : j<k) : chooseShiftE273 j k=0 := by
 simp [chooseShiftE273,show ¬k≤j by omega]
'''
def shift(a,b):return str(b) if a==0 else f'(n+1+{b})' if a==1 else f'(2*(n+1)+{b})'
def coef(a,b):return f'sparse{a}{b}E273 n c r (2*r-c:ℕ)'
def poly(a,b):
 k=shift(a,b)
 return f'((j:ℤ)-({k}:ℕ)+1)*((j:ℤ)-({k}:ℕ)+2)*((j:ℤ)-({k}:ℕ)+3)'
for kind in ['lower','upper']:
 active=[(a,b) for a,b in groups if a<(1 if kind=='lower' else 2)]
 zeros=[(a,b) for a,b in groups if (a,b) not in active]
 expr=' +\n   '.join(f'({coef(a,b)})*({poly(a,b)})' for a,b in active)
 target='2*lowerShape446 n c r j' if kind=='lower' else '16*upperShape446 c r (2*(n:ℤ)+2-j)'
 goal='3*secondExplicitE273 n c r j=lowerShape446 n c r j' if kind=='lower' else '3*secondExplicitE273 n c r j=8*upperShape446 c r (2*(n:ℤ)+2-j)'
 cond='(hj : 3≤j) (hn : j≤n)' if kind=='lower' else '(hj : n+3≤j) (hn : j≤2*n+2)'
 s+=f'\ntheorem second_{kind}_shapeE273 (n c r j : ℕ) {cond} :\n {goal} := by\n'
 for a,b in active:
  s+=f' have h{a}{b} := chooseShift_polynomialE273 j {shift(a,b)} (by omega)\n'
 s+=f' have he : 6*secondExplicitE273 n c r j=\n   {expr} := by\n'
 s+='   unfold secondExplicitE273\n   simp only [zero_mul,zero_add,one_mul]\n'
 s+='   rw [if_neg (show ¬(c=2 ∧ j=2*n+3) by omega)'
 for a,b in zeros:s+=f',chooseShift_zeroE273 j {shift(a,b)} (by omega)'
 s+=']\n   simp only [mul_zero,add_zero]\n'
 s+='   linear_combination '+' + '.join(f'({coef(a,b)})*h{a}{b}' for a,b in active)+'\n'
 s+=f' have hp : {expr}=\n   {target} := by\n'
 s+='   dsimp ['+','.join(f'sparse{a}{b}E273' for a,b in active)+',lowerShape446,lowerKShape446,lowerHShape446,upperShape446]\n   push_cast\n   ring\n'
 s+=' rw [hp] at he\n omega\n'
s+='''

theorem source_second_lower_shapeE273 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+2)
 (hj : 3≤j) (hn : j≤n) :
 6*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 lowerShape446 n (frame rest).mid.b (frame rest).mid.a j := by
 have he := source_second_explicitE273 n rest i j hij
 have hs := second_lower_shapeE273 n (frame rest).mid.b (frame rest).mid.a j hj hn
 omega

theorem source_second_upper_shapeE273 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+2)
 (hj : n+3≤j) (hn : j≤2*n+2) :
 6*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 8*upperShape446 (frame rest).mid.b (frame rest).mid.a (2*(n:ℤ)+2-j) := by
 have he := source_second_explicitE273 n rest i j hij
 have hs := second_upper_shapeE273 n (frame rest).mid.b (frame rest).mid.a j hj hn
 omega

#print axioms second_lower_shapeE273
#print axioms second_upper_shapeE273
#print axioms source_second_lower_shapeE273
#print axioms source_second_upper_shapeE273
end
end MathGKM.Markov
'''
Path('research/MarkovShapeBridgeE273.lean').write_text(s)
