"""Machine-authored Lean polynomial certificates for the exact seed shapes."""
from generate_values_7584c5d0 import header
from explore_seed_7584c5d0 import *
def sh(name,j='j',qv='q',av='a',rv='r',sv='s'):
 return f'v{name}M758 ({av}) ({rv}) ({sv}) ({qv}) ({j})'
def main():
 x,y,z,w=a,r,s,t
 specs=[]
 def add(name,left,right,qq,jj,qexpr,jexpr,genhyp,zval,wval):
  specs.append(dict(name=name,left=left,right=right,qq=qq,jj=jj,qexpr=qexpr,jexpr=jexpr,hyp=genhyp,zval=zval,wval=wval))
 # The left/right expressions are symbolic Lean statements with a,r,s,q,j.
 add('pos_low','0',sh('low'),0,z+2,'0','z+2','2 ≤ j','j-2','0')
 add('pos_mid','0',sh('mid'),z+w+2,2*z+w+5,'z+w+2','2*z+w+5','q+3 ≤ j ∧ j ≤ 2*q+1','j-q-3','2*q+1-j')
 for name in ['bridge','tail2','tail3','tail4']:
  add('pos_'+name,'0',sh(name),z+2,0,'z+2','0','2 ≤ q','q-2','0')
 add('gap_first',f'48*s*{sh("low","3")}',f'{sh("low","2")}^2',0,0,'0','0','True','0','0')
 add('gap_low',f'{sh("low","j-1")}*{sh("low","j+1")}',f'{sh("low")}^2',0,z+3,'0','z+3','3 ≤ j','j-3','0')
 add('gap_cross1',f'{sh("low","q")}*{sh("bridge")}',f'{sh("low","q+1")}^2',z+2,0,'z+2','0','2 ≤ q','q-2','0')
 add('gap_cross2',f'{sh("low","q+1")}*{sh("mid","q+3")}',f'{sh("bridge")}^2',z+2,0,'z+2','0','2 ≤ q','q-2','0')
 add('gap_cross3',f'{sh("bridge")}*{sh("mid","q+4")}',f'{sh("mid","q+3")}^2',z+3,0,'z+3','0','3 ≤ q','q-3','0')
 add('gap_mid',f'{sh("mid","j-1")}*{sh("mid","j+1")}',f'{sh("mid")}^2',z+w+4,2*z+w+8,'z+w+4','2*z+w+8','q+4 ≤ j ∧ j ≤ 2*q','j-q-4','2*q-j')
 add('gap_tail1',f'{sh("mid","2*q")}*{sh("tail2")}',f'{sh("mid","2*q+1")}^2',z+3,0,'z+3','0','3 ≤ q','q-3','0')
 add('gap_tail2',f'{sh("mid","2*q+1")}*{sh("tail3")}',f'{sh("tail2")}^2',z+2,0,'z+2','0','2 ≤ q','q-2','0')
 add('gap_tail3',f'{sh("tail2")}*{sh("tail4")}',f'{sh("tail3")}^2',z+2,0,'z+2','0','2 ≤ q','q-2','0')
 add('gap_two',f'{sh("bridge",qv="2")}*{sh("tail2",qv="2")}',f'{sh("mid","5",qv="2")}^2',0,0,'0','0','True','0','0')
 defs=','.join('v'+name+'M758' for name in coeff_exprs())
 src='import MarkovVerticalShapesM758\n/-! Machine-authored 7584c5d0. Exact nonnegative polynomial certificates. -/\n'+header
 import re
 def replace(st,vals):return re.sub(r'\b(a|r|s|q|j)\b',lambda m:'('+vals[m[0]]+')',st)
 for d in specs:
  for side in ['lo','hi']:
   vals=dict(a='2*(x+1)+y',r='x+1' if side=='lo' else 'x+1+y',s='0' if side=='lo' else 'y',q=d['qexpr'],j=d['jexpr'])
   left=replace(d['left'],vals);right=replace(d['right'],vals)
   op='<' if d['name'].startswith('pos_') else '≤'
   src+=f'\ntheorem v_{d["name"]}_{side}M758 (x y z w : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y)\n (hz : 0 ≤ z) (hw : 0 ≤ w) :\n {left} {op} {right} := by\n'
   if op=='≤':src+=' apply sub_nonneg.mp\n'
   src+=f' simp only [{defs}]\n ring_nf\n positivity\n'
 src+='\nend\nend MathGKM.Markov\n'
 (R/'research/MarkovVerticalCertificatesM758.lean').write_text(src)
 src='import MarkovVerticalCertificatesM758\n/-! Machine-authored 7584c5d0. Natural source-parameter bounds. -/\n'+header
 src+='''
theorem vChartM758 (P : ℤ → ℤ → ℤ → Prop)
 (lo : ∀ x y, 0 ≤ x → 0 ≤ y → P (2*(x+1)+y) (x+1) 0)
 (hi : ∀ x y, 0 ≤ x → 0 ≤ y → P (2*(x+1)+y) (x+1+y) y)
 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a) : P a r (2*r-a:ℕ) := by
 have hr' : (1:ℤ) ≤ r := by exact_mod_cast hr
 have ha' : (r:ℤ)+1 ≤ a := by exact_mod_cast hra
 by_cases hh : 2*r ≤ a
 · have hh' : 2*(r:ℤ) ≤ a := by exact_mod_cast hh
   have h := lo (r-1) (a-2*(r:ℤ)) (by omega) (by omega)
   have h1 : 2*((r:ℤ)-1+1)+(a-2*r)=a := by ring
   rw [h1,sub_add_cancel] at h
   simpa [Nat.sub_eq_zero_of_le hh] using h
 · have h := hi ((a:ℤ)-r-1) (2*(r:ℤ)-a) (by omega) (by omega)
   have h1 : 2*((a:ℤ)-r-1+1)+(2*r-a)=a := by ring
   have h2 : (a:ℤ)-r-1+1+(2*r-a)=r := by ring
   rw [h1,h2] at h
   rw [Nat.cast_sub (by omega : a ≤ 2*r),Nat.cast_mul,Nat.cast_ofNat]
   exact h
'''
 for d in specs:
  name=d['name'];op='<' if name.startswith('pos_') else '≤'
  statement=d['left']+' '+op+' '+d['right']
  target=replace(statement,dict(a='(a:ℤ)',r='(r:ℤ)',s='((2*r-a:ℕ):ℤ)',q='q',j='j'))
  src+=f'\ntheorem v_{name}M758 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a)\n (q j : ℤ) (h : {d["hyp"]}) :\n {target} := by\n'
  src+=f' apply vChartM758 (fun a r s => {statement}) ?_ ?_ a r hr hra\n'
  for side in ['lo','hi']:
   src+=f' · intro x y hx hy\n   have hh := v_{name}_{side}M758 x y ({d["zval"]}) ({d["wval"]}) hx hy (by omega) (by omega)\n   convert hh using 1 <;> simp only [{defs}] <;> ring\n'
 src+='\nend\nend MathGKM.Markov\n'
 (R/'research/MarkovVerticalBoundsM758.lean').write_text(src)
 print('Generated 32 exact polynomial certificates and natural parameter adapters.')
if __name__=='__main__':main()
