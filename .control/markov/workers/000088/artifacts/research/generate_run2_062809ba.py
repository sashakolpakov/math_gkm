"""Machine-authored certificates; generated Lean identities require kernel checks."""
from pathlib import Path
import json,re
from fourth_probe_01f51d63 import P,deser,BOUNDS
ROOT=Path('/Users/sasha/math_gkm');OUT=ROOT/'evidence/markov-be5676f9'
data=next(r for r in json.loads((OUT/'experiments.json').read_text())['runs'] if r['n']==2)
def fmt(p,names=('c','r','X')):
 terms=[]
 for k,v in sorted(p.items()):
  assert v.denominator==1
  term=str(int(v))
  for e,n in zip(k,names):
   if e:term+='*'+n+('^'+str(e) if e>1 else '')
  terms.append(term)
 return ' + '.join(terms) or '0'
header='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
end='\nend\nend MathGKM.Markov\n'
s='import MarkovFourthRunMomentBE\nimport MarkovSmallPoly2FD\nimport MarkovFourthGauge2K062\n/-! Machine-authored be5676f9. Exact local fourth moment for run two. -/\n'+header
s+='def twoLocalFourK062 : Bool → Bool → Bool → Bool → ℤ[X]\n'
for row in data['local_table']:
 s+=' | '+', '.join('true' if x else 'false' for x in row['bits'])+' => '+fmt(deser(row['polynomial']))+'\n'
s+='''theorem runLocalFour_twoK062 (p q r s : Bool) :
 runLocalFourBE 2 p q r s=twoLocalFourK062 p q r s := by
 cases p <;> cases q <;> cases r <;> cases s <;>
   simp only [runLocalFourBE,localFour01F,gauge2_00K062,gauge2_01K062,
     gauge2_10K062,gauge2_11K062,U,Polynomial.coeff_add,
     Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,twoLocalFourK062] <;>
   norm_num <;> ring
'''+end
(ROOT/'research/MarkovFourthTwoLocalK062.lean').write_text(s)
chambers=[('0*r<1*c','4*r<1*c','0','0','0','0'),('1*c<4*r','3*r<1*c','0','0','0','4*r-c'),('1*c<3*r','2*r<1*c','0','3*r-c','0','c-2*r'),('1*c<2*r','3*r<2*c','2*r-c','c-r','0','2*r-c'),('2*c<3*r','4*r<3*c','2*r-c','c-r','3*r-2*c','c-r'),('3*c<4*r','1*r<1*c','2*r-c','c-r','3*r-2*c','c-r')]
for z,ch in enumerate(data['chambers']):
 p,q=BOUNDS[z];a,b=BOUNDS[z+1];f=deser(ch['fourth']);mo=deser(ch['moment']);deg=max(k[2] for k in f)
 seq=f'fourthTwoSeq{z}K062';moment=f'fourthTwoMoment{z}K062';pol=f'fourthTwoPoly{z}K062'
 s='import MarkovFourthTwoLocalK062\n/-! Machine-authored be5676f9. Exact fourth-slice chamber certificate. -/\n'+header
 s+=f'def {moment} (c r : ℤ) : ℤ[X] :=\n {fmt(mo,("(C c)","(C r)","X"))}\n'
 s+=f'def {seq} (c r : ℤ) : ℕ → ℤ\n'
 for j in range(deg+1):s+=f' | {j} => '+fmt(P({(a,b,0):v for (a,b,k),v in f.items() if k==j}))+'\n'
 s+=' | _ => 0\n'
 s+=f'def {pol} (c r : ℤ) : ℤ[X] :=\n '+'+\n '.join(f'C ({seq} c r {j})*X^{j}' for j in range(deg+1))+'\n'
 s+=f'''theorem fourth_two_coeff_{z}K062 (c r : ℤ) (j : ℕ) :
 ({pol} c r).coeff j={seq} c r j := by
 unfold {pol}
 by_cases hj : j<{deg+1}
 · interval_cases j <;> simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow] <;> norm_num [{seq}]
 · have hz : {seq} c r j=0 := by
     obtain ⟨k,hk⟩ : ∃ k,j=k+{deg+1} := ⟨j-{deg+1},by omega⟩
     rw [hk]; rfl
'''
 for j in range(deg+1):s+=f'   have h{j} : j≠{j} := by omega\n'
 s+='   simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow]\n   simp [hz,'+','.join(f'h{j}' for j in range(deg+1))+',eq_comm]\n'
 cc=f'({q}*(x+1)+{b}*(y+1))';rr=f'({p}*(x+1)+{a}*(y+1))'
 for j,g in enumerate(ch['gaps']):
  gap=deser(g);assert all(v>=0 for v in gap.values());exp=fmt(gap,('x','y','X'))
  aa=f'{seq} {cc} {rr} {j}';bb=f'{seq} {cc} {rr} {j+1}';dd=f'{seq} {cc} {rr} {j+2}'
  s+=f'''theorem fourth_two_gap_{z}_{j}K062 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 {aa}*{dd}≤({bb})^2 := by
 have he : ({bb})^2-{aa}*{dd}={exp} := by simp only [{seq}]; ring
 have hp : 0≤{exp} := by positivity
 linarith only [he,hp]
'''
 s+=f'''theorem fourth_two_lc_{z}K062 (x y : ℤ) (hx : 0≤x) (hy : 0≤y) (j : ℕ) :
 {seq} {cc} {rr} j*{seq} {cc} {rr} (j+2)≤({seq} {cc} {rr} (j+1))^2 := by
 by_cases hj : j<{deg-1}
 · interval_cases j
'''
 for j in range(deg-1):s+=f'   · exact fourth_two_gap_{z}_{j}K062 x y hx hy\n'
 s+=f''' · have hz : {seq} {cc} {rr} (j+2)=0 := by
     obtain ⟨k,hk⟩ : ∃ k,j+2=k+{deg+1} := ⟨j-({deg-1}),by omega⟩
     rw [hk]; rfl
   rw [hz,mul_zero]; exact sq_nonneg _
'''
 lo,hi,Q,T,UU,MM=chambers[z]
 s+=f'''theorem fourth_two_moment_{z}K062 (c r : ℕ) (hr : 0<r) (hrc : r<c)
 (hl : {lo}) (hu : {hi}) :
 fourMomentBE (runLocalFourBE 2) c r={moment} c r := by
'''
 ns=['2*r-c','min (c-r) (3*r-c)','3*r-2*c',('min (c-2*r) (4*r-c)' if z<3 else ('2*r-c' if z==3 else 'c-r'))]
 for name,nat,expr in zip(['q','t','u','m'],ns,[Q,T,UU,MM]):
  expr=re.sub(r'\b([rc])\b',r'(\1:ℤ)',expr)
  s+=f''' have h{name}i : (({nat}:ℕ):ℤ)={expr} := by omega
 have h{name} : (({nat}:ℕ):ℤ[X])=C ({expr}) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) h{name}i
'''
 if z==5:s+=''' have hvi : ((4*r-3*c:ℕ):ℤ)=4*(r:ℤ)-3*(c:ℤ) := by omega
 have hv : ((4*r-3*c:ℕ):ℤ[X])=C (4*(r:ℤ)-3*(c:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hvi
'''
 s+=' unfold fourMomentBE fourSourceMoment897\n'
 if z<3:s+=' rw [if_pos (by omega : 2*r≤c)]\n'
 elif z==3:s+=' rw [if_neg (by omega : ¬2*r≤c),if_pos (by omega : 3*r≤2*c)]\n'
 elif z==4:s+=' rw [if_neg (by omega : ¬2*r≤c),if_neg (by omega : ¬3*r≤2*c),if_pos (by omega : 4*r≤3*c)]\n'
 else:s+=' rw [if_neg (by omega : ¬2*r≤c),if_neg (by omega : ¬3*r≤2*c),if_neg (by omega : ¬4*r≤3*c)]\n'
 s+=' simp only [hq,ht,hu,hm'+(',hv' if z==5 else '')+']\n'
 s+=f' simp only [boolMomentADB2,boolJetADB2,fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE,runLocalFour_twoK062,twoLocalFourK062,{moment},map_add,map_sub,map_mul,map_ofNat,map_neg,map_zero,map_two,map_natCast,map_intCast]\n ring\n'
 s+=f'''theorem fourth_two_expand_{z}K062 (c r : ℕ) (hc : 5≤c) (hr : 0<r) (hrc : r<c)
 (hl : {lo}) (hu : {hi}) :
 fourthExplicitRunBE 2 c r={pol} c r := by
 have hc2 : c≠2 := by omega
 have hc3 : c≠3 := by omega
'''
 for name,nat,expr in zip(['q','t','u'],ns,[Q,T,UU]):
  expr=re.sub(r'\b([rc])\b',r'(\1:ℤ)',expr)
  s+=f' have h{name}i : (({nat}:ℕ):ℤ)={expr} := by omega\n'
 s+=f''' unfold fourthExplicitRunBE
 rw [fourth_two_moment_{z}K062 c r hr hrc hl hu]
 simp only [correctedThirdRun8BBB,if_neg hc2,if_neg hc3,add_zero]
 rw [small_poly2FD c r hc2]
 simp only [firstRunPolyADB2,lowerH487,smallPoly2FD,small2_0FD,small2_1FD,small2_2FD,small2_3FD,small2_4FD,small2_5FD,small2_6FD,small2_7FD,small2_8FD,small2_9FD,small2_10FD,small2_11FD,
   secondCompressed446,runK_scalarBF,runDTwoBF,runCOneBF,runB446,runD446,
   if_neg hc2,hqi,hti,hui,{moment},{pol},{seq}]
 norm_num [runSumA27,Finset.sum_range_succ,map_ofNat]
 push_cast
 ring
'''
 s+=end
 (ROOT/f'research/MarkovFourthTwo{z}K062.lean').write_text(s)
print('Generated run-two local table and six exact chamber certificates.')
