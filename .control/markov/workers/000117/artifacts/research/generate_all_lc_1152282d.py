"""Machine-authored all-run coefficient gap certificates. Lean is the checker."""
from explore_allrun_refined_1152282d import *
from generate_jets_1152282d import lean
names=['x','y','u','v','e','X']
ss=lambda p:lean(sp.poly(p),names)
regions=['first1','first2','low','bridge12','bridge13','mid1','bridge23','bridge24','mid2','tail3','tail4','tail5','tail6','past']
def ge(p):return all(c>=0 for c in p.values())
def which(jj,qq):
 if ge(-jj):return 'zero'
 if not jj-1:return 'first1'
 if not jj-2:return 'first2'
 if ge(jj-3) and ge(qq+1-jj):return 'low'
 if not jj-qq-2:return 'bridge12'
 if not jj-qq-3:return 'bridge13'
 if ge(jj-qq-4) and ge(2*qq+2-jj):return 'mid1'
 if not jj-2*qq-3:return 'bridge23'
 if not jj-2*qq-4:return 'bridge24'
 if ge(jj-2*qq-5) and ge(3*qq+2-jj):return 'mid2'
 for k in range(3,7):
  if not jj-3*qq-k:return f'tail{k}'
 if ge(jj-3*qq-7):return 'past'
 raise ValueError((ss(jj),ss(qq)))
specs=[(f'first{k}',u+5,sp.poly(k),'q-5','0') for k in range(1,5)]
specs+=[('low',u+v+5,u+5,'j-5','q-j')]
specs += [(f'cross1_{k}',u+5,u+5+k,'q-5','0') for k in range(1,5)]
specs += [('mid1',u+v+4,2*u+v+9,'j-q-5','2*q+1-j')]
specs += [(f'cross2_{k}',u+5,2*(u+5)+k,'q-5','0') for k in range(2,6)]
specs += [('mid2',u+v+5,3*u+2*v+16,'j-2*q-6','3*q+1-j')]
specs += [(f'tail{k}',u+5,3*(u+5)+k,'q-5','0') for k in range(2,7)]
header='''namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false
'''
def main():
 (R/'research/MarkovThirdAllBoundsDefM115.lean').write_text('import MarkovThirdRegionsM115\n/-! Machine-authored 1152282d. Explicit all-run gap/support predicate. -/\n'+header+'''
def vAllBoundsM115 (a b c d e : ℤ) : Prop := ∀ q : ℤ, 5 ≤ q →
 (∀ j, vEM115 a b c d e q (j-1)*vEM115 a b c d e q (j+1) ≤ vEM115 a b c d e q j^2) ∧
 (∀ j, 3 ≤ j → j ≤ 3*q+6 → 0 < vEM115 a b c d e q j)
end
end MathGKM.Markov
''')
 mods=[]
 for name,i,k,vs in charts:
  tag=f'{name}_{i}_{k}';mod=f'MarkovThirdAll{tag}M115';mods.append(mod)
  args=' '.join(f'({ss(p)})' for p in vs)
  E=lambda qq,jj:f'vEM115 {args} ({qq}) ({jj})'
  s='import MarkovThirdAllBoundsDefM115\n/-! Machine-authored 1152282d. Exact all-run gap/support certificates. -/\n'+header
  for case,qq,jj,us,vs0 in specs:
   qs,js=ss(qq),ss(jj)
   s+=f'\ntheorem vAll_{tag}_{case}M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :\n {E(qs,js+"-1")}*{E(qs,js+"+1")} ≤ {E(qs,js)}^2 ∧\n 0 '+('≤' if case in ['first1','first2'] else '<')+f' {E(qs,js)} := by\n'
   for h in [-1,1,0]:
    reg=which(jj+h,qq);jstr=f'({js}){h:+}' if h else js
    s+=f' rw [vE_{reg}M115 _ _ _ _ _ ({qs}) ({jstr}) (by omega) (by omega)]\n'
   ds=','.join(f'v3{reg}M115' for reg in dict.fromkeys(which(jj+h,qq) for h in [-1,1,0]) if reg!='zero')
   s+=f' constructor\n · apply sub_nonneg.mp\n   simp only [{ds}]\n   ring_nf <;> positivity\n · simp only [{ds}]\n   ring_nf <;> positivity\n'
  s+=f'\ntheorem vAllchart_{tag}M115 (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :\n vAllBoundsM115 {args} := by\n intro q hq\n constructor\n'
  def invoke(case,kind):
   _,_,_,us,vs0=next(z for z in specs if z[0]==case)
   return f'convert (vAll_{tag}_{case}M115 x y ({us}) ({vs0}) hx hy (by omega) (by omega)).{kind} using 1 <;> congr 1 <;> congr 1 <;> omega\n'
  for kind in [1,2]:
   s+=' · intro j'+(' hj3 hjN' if kind==2 else '')+'\n'
   if kind==1:
    s+=f'''   by_cases h0 : j ≤ 1
   · rw [vE_zeroM115 _ _ _ _ _ q (j-1) (by omega) (by omega),zero_mul]; exact sq_nonneg _
   by_cases hN : 3*q+6 ≤ j
   · rw [vE_pastM115 _ _ _ _ _ q (j+1) (by omega) (by omega),v3pastM115,mul_zero]; exact sq_nonneg _
'''
   for z0 in ([2,3,4] if kind==1 else [3,4]):s+=f'   by_cases h{z0} : j={z0}\n   · '+invoke(f'first{z0}',kind)
   s+='   by_cases hl : j ≤ q\n   · '+invoke('low',kind)
   for z0 in range(1,5):s+=f'   by_cases hc{z0} : j=q+{z0}\n   · '+invoke(f'cross1_{z0}',kind)
   s+='   by_cases hm1 : j ≤ 2*q+1\n   · '+invoke('mid1',kind)
   for z0 in range(2,6):s+=f'   by_cases hd{z0} : j=2*q+{z0}\n   · '+invoke(f'cross2_{z0}',kind)
   s+='   by_cases hm2 : j ≤ 3*q+1\n   · '+invoke('mid2',kind)
   tails=list(range(2,6 if kind==1 else 7))
   s+='   have ht : '+' ∨ '.join(f'j=3*q+{k0}' for k0 in tails)+' := by omega\n'
   s+='   rcases ht with '+'|'.join('ht' for _ in tails)+'\n'
   for z0 in tails:s+='   · '+invoke(f'tail{z0}',kind)
  s+='end\nend MathGKM.Markov\n';(R/f'research/{mod}.lean').write_text(s)
 # Source chamber coverage has exactly the same natural domains as fixed runs.
 s=(R/'research/MarkovThirdRun1BoundsM115.lean').read_text()
 s=s.replace('import MarkovThirdRun1ChartsM115','\n'.join('import '+m for m in mods)).replace('vR1','vAll').replace('ℝ','ℤ')
 (R/'research/MarkovThirdAllSourceBoundsM115.lean').write_text(s)
 (O/'allrun-generated-modules.json').write_text(json.dumps(mods)+'\n')
 print('Generated',len(mods),'all-run chart modules')
if __name__=='__main__':main()
