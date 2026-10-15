"""Machine-authored source generator. Every generated identity is checked by Lean ring."""
from fourth_probe_01f51d63 import *
data=json.loads((OUT/'fourth-low-probe.json').read_text())
def fmt(p,names=('c','r','X')):
 terms=[]
 for k,v in sorted(p.items()):
  assert v.denominator==1
  term=str(int(v))
  for e,n in zip(k,names):
   if e:term+='*'+n+('^'+str(e) if e>1 else '')
  terms.append(term)
 return ' + '.join(terms) or '0'
for z,ch in enumerate(data['chambers']):
 p,q=ch['left'];s,t=ch['right'];f=deser(ch['fourth']);mo=deser(ch['moment'])
 seq=f'fourthLowSeq{z}01F';moment=f'fourthLowMoment{z}01F'
 head=f'''import MarkovFourthMoment01F
/-! Machine-authored 01f51d63. Checked candidate-polynomial inequalities in
the strict predecessor-slope chamber {p}/{q} < r/c < {s}/{t}.
No universal source identification is asserted by this module. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
def {moment} (c r : ℤ) : ℤ[X] :=
 {fmt(mo,('(C c)','(C r)','X'))}
def {seq} (c r : ℤ) : ℕ → ℤ
'''
 for j in range(8):
  cp=P({(a,b,0):v for (a,b,k),v in f.items() if k==j})
  head+=f' | {j} => {fmt(cp)}\n'
 head+=' | _ => 0\n'
 c=f'({q}*(x+1)+{t}*(y+1))';r=f'({p}*(x+1)+{s}*(y+1))'
 for g in ch['gaps']:
  j=g['j'];gap=deser(g['poly']);assert all(v>=0 for v in gap.values())
  exp=fmt(gap,('x','y','X'))
  a=f'{seq} {c} {r} {j}';b=f'{seq} {c} {r} {j+1}';d=f'{seq} {c} {r} {j+2}'
  head+=f'''theorem fourth_low_gap_{z}_{j}01F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 {a}*{d}≤({b})^2 := by
 have he : ({b})^2-{a}*{d}={exp} := by simp only [{seq}]; ring
 have hp : 0≤{exp} := by positivity
 linarith only [he,hp]
'''
 head+=f'''theorem fourth_low_lc_{z}01F (x y : ℤ) (hx : 0≤x) (hy : 0≤y) (j : ℕ) :
 {seq} {c} {r} j*{seq} {c} {r} (j+2)≤({seq} {c} {r} (j+1))^2 := by
 by_cases hj : j<6
 · interval_cases j
'''
 for j in range(6):head+=f'   · exact fourth_low_gap_{z}_{j}01F x y hx hy\n'
 head+=f''' · have hz : {seq} {c} {r} (j+2)=0 := by
     obtain ⟨k,hk⟩ : ∃ k,j+2=k+8 := ⟨j-6,by omega⟩
     rw [hk]; rfl
   rw [hz,mul_zero]
   exact sq_nonneg _
'''
 # Rational chamber substitution for the existing triple-pattern counts.
 cc,rr=ch['samples'][0]
 Q='2*r-c' if 2*rr>cc else '0'
 T=('c-r' if cc-rr<3*rr-cc else '3*r-c') if 3*rr>cc else '0'
 U='3*r-2*c' if 3*rr>2*cc else '0'
 poly=f'fourthMomentPoly01F c r ({Q}) ({T}) ({U}) ({moment} c r)'
 expansion='+'.join(f'C ({seq} c r {j})*X^{j}' for j in range(8))
 head+=f'''theorem fourth_low_expand_{z}01F (c r : ℤ) :
 {poly}={expansion} := by
 simp only [fourthMomentPoly01F,momentD6905,momentK6905,momentL6905,
   {moment},{seq},map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_zero,map_one,map_intCast]
 ring
theorem fourth_low_coeff_{z}01F (c r : ℤ) (j : ℕ) :
 ({poly}).coeff j={seq} c r j := by
 rw [fourth_low_expand_{z}01F]
 by_cases hj : j<8
 · interval_cases j <;> simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow] <;> norm_num [{seq}]
 · have hseq : {seq} c r j=0 := by
     obtain ⟨k,hk⟩ : ∃ k,j=k+8 := ⟨j-8,by omega⟩
     rw [hk]; rfl
   have h0 : j≠0 := by omega
'''
 for j in range(1,8):head+=f'   have h{j} : j≠{j} := by omega\n'
 head+='   simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow]\n   simp [hseq,'+','.join(f'h{j}' for j in range(8))+',eq_comm]\n'
 head+='end\nend MathGKM.Markov\n'
 (ROOT/f'research/MarkovFourthLow{z}01F.lean').write_text(head)
print('Generated six candidate-polynomial modules, not source premises.')
