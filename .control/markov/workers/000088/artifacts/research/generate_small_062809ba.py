"""Machine-authored exact small-cycle cut recursion; no trace correction omitted."""
from pathlib import Path
from experiment_8833 import backward,add,shift
R=Path('/Users/sasha/math_gkm')
def pol(p):
 return '+'.join(str(v)+(f'*X^{j}' if j else '') for j,v in sorted(p.items()) if v) or '0'
def word(w):return '['+','.join('true' if b else 'false' for b in w)+']'
head='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
for n in [2,3]:
 for c,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]:
  w=sum(([0]+[1]*(n+b) for b in [0]*(c-r)+[1]*r),[])[1:]
  tag=f'{n}{c}{r}';s='import MarkovFourthAllCyclesBE\n/-! Machine-authored 062809ba: exact short-cycle cut polynomial. -/\n'+head
  alpha=[{} for _ in range(5)];beta=[{0:1}]+[{} for _ in range(4)]
  for t in range(len(w)+1):
   ww=w[len(w)-t:]
   if t:
    bit=ww[0];aa=[];bb=[]
    for k in range(5):
     h=add(shift(alpha[k-1],1),beta[k-1]) if k else {}
     if bit:h=add(h,shift(h,1))
     aa.append(add(shift(alpha[k],1) if bit else {},h))
     bb.append(add(add(beta[k],shift(alpha[k],1,2) if bit else {}),h))
    alpha,beta=aa,bb
   for k in range(1,5):
    s+=f'''theorem cut{tag}_{t}_{k}K062 (p q : ℤ[X]) :
 cutCoeffA27 X p q {word(ww)} {k}=p*({pol(alpha[k])})+q*({pol(beta[k])}) := by
'''
    if not t:s+=' simp [cutCoeffA27]\n'
    else:
     prev=f'cut{tag}_{t-1}_{k}K062'
     prevlow='cutCoeff_zeroA27' if k==1 else f'cut{tag}_{t-1}_{k-1}K062'
     s+=f' rw [cutCoeffA27,{prev},{prevlow}]\n norm_num [cutChargeA27,cutFactorA27] <;> ring\n'
  f=backward(w,4);deg=max(f)
  s+=f'def shortFourth{tag}K062 : ℤ[X] := {pol(f)}\n'
  s+=f'''theorem shortFourth_poly{tag}K062 :
 cutCoeffA27 (X:ℤ[X]) X 1 {word(w)} 4=shortFourth{tag}K062 := by
 rw [cut{tag}_{len(w)}_4K062]
 unfold shortFourth{tag}K062
 ring
theorem shortFourth_lc{tag}K062 (j : ℕ) :
 (shortFourth{tag}K062).coeff j*(shortFourth{tag}K062).coeff (j+2)≤
 ((shortFourth{tag}K062).coeff (j+1))^2 := by
 by_cases hj : j<{deg-1}
 · interval_cases j <;> norm_num [shortFourth{tag}K062,Polynomial.coeff_add,
     Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,
     Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : (shortFourth{tag}K062).coeff (j+2)=0 := by
'''
  s+="     have hj0 : j≠0 := by omega\n"
  for j in range(deg+1):s+=f'     have h{j} : j+2≠{j} := by omega\n'
  s+=f'     simp [shortFourth{tag}K062,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,hj0,'+','.join(f'h{j}' for j in range(deg+1))+',eq_comm]\n'
  s+='   rw [hz,mul_zero]; exact sq_nonneg _\n'
  s+=f'''theorem shortFourth_tail{tag}K062 (rest : List Bool)
 (hc : (frame rest).mid.b={c}) (hr : (frame rest).mid.a={r}) :
 central28 (List.replicate {n} true++false::rest)++[true]={word(w)} := by
 have h := source_run_substitutionBF {n} rest
 rw [source_short_wordBE rest (by omega),hc,hr,sourceWord_central28] at h
 norm_num [shortSourceWordBE,lowerSub487,lowerRun487,List.replicate_succ] at h
 exact h
theorem source_fourth_short{tag}K062 (rest : List Bool)
 (hc : (frame rest).mid.b={c}) (hr : (frame rest).mid.a={r})
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate {n} true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate {n} true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate {n} true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate {n} true++false::rest)).mid.p (i+1) (j+1)^2 := by
 rw [source_cut_coeffA27 _ i (j+2) 4 (by omega),
   source_cut_coeffA27 _ (i+2) j 4 (by omega),
   source_cut_coeffA27 _ (i+1) (j+1) 4 (by omega),
   shortFourth_tail{tag}K062 rest hc hr,shortFourth_poly{tag}K062]
 nlinarith only [shortFourth_lc{tag}K062 j]
end
end MathGKM.Markov
'''
  (R/f'research/MarkovFourthShort{tag}K062.lean').write_text(s)
print('Generated ten exact short-cycle proofs, with cached cut recursions.')
