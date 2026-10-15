"""Machine-authored split algebraic certificates for the second band."""
from pathlib import Path
import json
from uniform_shape_8bbb import Q,var,subst,horner
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-07f1d410'
p=Q({tuple(k):v for k,v in json.loads((O/'second-band-probe.json').read_text())['second_terms']})
t,s,u,v=map(var,range(4));nn=t+s+4;jj=2*t+s+9;parts={}
for w,d in [('L',-1),('C',0),('R',1)]:
 a=subst(p,[nn,u+v+3,u+2,jj+d])
 for k in range(6):parts[w,k]=Q({(a,0,c,d):val for (a,b,c,d),val in a.items() if b==k})
head='''namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
'''
src='import MarkovSecondShape07F1\n'+head
for (w,k),a in parts.items():src+=f'def second{w}{k}07F1 (t u v : ℤ) : ℤ :=\n '+horner(a,['t','s','u','v'])+'\n'
def part(w,k):return f'second{w}{k}07F1 t u v'
def sumexpr(w):return '+'.join(f'({part(w,k)})*s^{k}' for k in range(6))
gaps=[]
for k in range(11):
 pairs=[(i,k-i) for i in range(6) if 0<=k-i<6]
 g=Q();terms=[]
 for i,j in pairs:
  g=g+parts['C',i]*parts['C',j]-parts['L',i]*parts['R',j]
  terms.append(f'({part("C",i)})*({part("C",j)})-({part("L",i)})*({part("R",j)})')
 assert all(v>=0 for v in g.values())
 gaps.append(g)
 src+=f'def secondGap{k}07F1 (t u v : ℤ) : ℤ :=\n '+'+'.join('('+z+')' for z in terms)+'\n'
for w,d in [('L',8),('C',9),('R',10)]:
 src+=f'''theorem second_expand_{w}07F1 (t s u v : ℤ) :
 secondShape07F1 (t+s+4) (u+v+3) (u+2) (2*t+s+{d})={sumexpr(w)} := by
 unfold secondShape07F1 {' '.join(f'second{w}{k}07F1' for k in range(6))}
 ring
'''
src+='end\nend MathGKM.Markov\n'
(R/'research/MarkovSecondParts07F1.lean').write_text(src)
for k,g in enumerate(gaps):
 used=[f'second{w}{i}07F1' for w in 'LCR' for i in range(6) if 0<=k-i<6]
 expr=horner(g,['t','s','u','v'])
 src='import MarkovSecondParts07F1\n'+head+f'''theorem second_gap_{k}_nonneg07F1 (t u v : ℤ) (ht : 0 ≤ t) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 0 ≤ secondGap{k}07F1 t u v := by
 have he : secondGap{k}07F1 t u v={expr} := by
   unfold secondGap{k}07F1 {' '.join(used)}
   ring
 rw [he]
 positivity
end
end MathGKM.Markov
'''
 (R/f'research/MarkovSecondGap{k}07F1.lean').write_text(src)
src=''.join(f'import MarkovSecondGap{k}07F1\n' for k in range(11))+head
src+='''theorem second_shift_lc07F1 (t s u v : ℤ)
 (ht : 0 ≤ t) (hs : 0 ≤ s) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 secondShape07F1 (t+s+4) (u+v+3) (u+2) (2*t+s+8)*
 secondShape07F1 (t+s+4) (u+v+3) (u+2) (2*t+s+10) ≤
 (secondShape07F1 (t+s+4) (u+v+3) (u+2) (2*t+s+9))^2 := by
 rw [second_expand_L07F1,second_expand_R07F1,second_expand_C07F1]
'''
for k in range(11):src+=f' have h{k} := second_gap_{k}_nonneg07F1 t u v ht hu hv\n'
summ='+'.join(f'(secondGap{k}07F1 t u v)*s^{k}' for k in range(11))
src+=f''' have he : ({sumexpr('C')})^2-({sumexpr('L')})*({sumexpr('R')})={summ} := by
   unfold {' '.join(f'secondGap{k}07F1' for k in range(11))}
   ring
 have hp : 0 ≤ {summ} := by positivity
 omega
theorem second_high_lc07F1 (n c r j : ℤ) (hr : 2 ≤ r) (hc : r+1 ≤ c)
 (hj : n+5 ≤ j) (hn : j ≤ 2*n+1) :
 secondShape07F1 n c r (j-1)*secondShape07F1 n c r (j+1) ≤ (secondShape07F1 n c r j)^2 := by
 have h := second_shift_lc07F1 (j-n-5) (2*n+1-j) (r-2) (c-r-1)
   (by omega) (by omega) (by omega) (by omega)
 convert h using 1 <;> congr 1 <;> ring
#print axioms second_high_lc07F1
end
end MathGKM.Markov
'''
(R/'research/MarkovSecondHigh07F1.lean').write_text(src)
# The r=1 branch, including c=2, has much smaller certificates.
src='import MarkovSecondShape07F1\n'+head
for c,name,args,hyp in [(v+3,'One','(t s v : ℤ)','(ht : 0 ≤ t) (hs : 0 ≤ s) (hv : 0 ≤ v)'),(Q({(0,0,0,0):2}),'Two','(t s : ℤ)','(ht : 0 ≤ t) (hs : 0 ≤ s)')]:
 vals=[subst(p,[nn,c,Q({(0,0,0,0):1}),jj+d]) for d in [-1,0,1]]
 gap=vals[1]**2-vals[0]*vals[2];assert all(x>=0 for x in gap.values())
 expr=horner(gap,['t','s','u','v']);cc='(v+3)' if name=='One' else '2'
 src+=f'''theorem second_{name}_shift07F1 {args} {hyp} :
 secondShape07F1 (t+s+4) {cc} 1 (2*t+s+8)*secondShape07F1 (t+s+4) {cc} 1 (2*t+s+10) ≤
 (secondShape07F1 (t+s+4) {cc} 1 (2*t+s+9))^2 := by
 have he : (secondShape07F1 (t+s+4) {cc} 1 (2*t+s+9))^2-
  secondShape07F1 (t+s+4) {cc} 1 (2*t+s+8)*secondShape07F1 (t+s+4) {cc} 1 (2*t+s+10)={expr} := by
  unfold secondShape07F1
  ring
 have hp : 0 ≤ {expr} := by positivity
 omega
'''
src+='''theorem second_one_lc07F1 (n c j : ℤ) (hc : 2 ≤ c)
 (hj : n+5 ≤ j) (hn : j ≤ 2*n+1) :
 secondShape07F1 n c 1 (j-1)*secondShape07F1 n c 1 (j+1) ≤ (secondShape07F1 n c 1 j)^2 := by
 by_cases hh : c=2
 · subst c
   have h := second_Two_shift07F1 (j-n-5) (2*n+1-j) (by omega) (by omega)
   convert h using 1 <;> congr 1 <;> ring
 · have h := second_One_shift07F1 (j-n-5) (2*n+1-j) (c-3) (by omega) (by omega) (by omega)
   convert h using 1 <;> congr 1 <;> ring
#print axioms second_one_lc07F1
end
end MathGKM.Markov
'''
(R/'research/MarkovSecondSmall07F1.lean').write_text(src)
(O/'second-gap-generation.json').write_text(json.dumps(dict(terms_by_s=[len(g) for g in gaps],status='Exact polynomial certificates generated; Lean acceptance required.'),indent=2)+'\n')
print([len(g) for g in gaps])
