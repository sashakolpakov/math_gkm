"""Machine-authored exact identities and ring certificates for Lean checking."""
from pathlib import Path
from fractions import Fraction
from uniform_shape_8bbb import Q,var,subst,horner
import json
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-53d5229e'
d=json.loads((O/'tail-probe.json').read_text()); data=json.loads((R/'evidence/markov-bdee9a64/rational-normalization.json').read_text())
tails={ch:Q({tuple(k):v for k,v in ts}) for ch,ts in d['tails'].items()}
cs=[Q() for _ in range(8)]
for k,v in data['numerator']:
 if k[1]==2:
  assert not any(k[5:7])
  cs[k[7]-3]=cs[k[7]-3]+Q({(k[0],k[2],k[3],k[4]):int(Fraction(v))})
head='namespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 6000000\nset_option maxRecDepth 16384\nset_option linter.unusedVariables false\n'
src='import MarkovSecondCoefficients07F1\n/-! Machine-authored 53d5229e. Exact reversed third-band shapes. -/\n'+head
for ch,p in tails.items():src+=f'def tail{ch.title()}53D (c r k : ℤ) : ℤ :=\n '+horner(p,['unused','c','r','k'])+'\n'
for l,p in enumerate(cs):src+=f'def thirdTailCoeff{l}53D (n c r q : ℤ) : ℤ :=\n '+horner(p,['n','c','r','q'])+'\n'
src+='def thirdTailPoly53D (n c r q : ℤ) : ℤ[X] :=\n '+ '+'.join(f'C (thirdTailCoeff{l}53D n c r q)*X^{l}' for l in range(8))+'\n'
defs=' '.join(f'thirdTailCoeff{l}53D' for l in range(8))
src+='''theorem third_tail_poly53D (n c r q t u : ℤ) :
 normalTail2FDDA (n:ℤ[X]) c r q t u X=thirdTailPoly53D n c r q := by
 unfold normalTail2FDDA thirdTailPoly53D '''+defs+'''
 have hn : (C n:ℤ[X])=n := Polynomial.C_eq_intCast n
 have hc : (C c:ℤ[X])=c := Polynomial.C_eq_intCast c
 have hr : (C r:ℤ[X])=r := Polynomial.C_eq_intCast r
 have hq : (C q:ℤ[X])=q := Polynomial.C_eq_intCast q
 simp only [map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_one,hn,hc,hr,hq]
 ring
'''
for ch,q in [('low','0'),('high','(2*r-c)')]:
 summ='+'.join(f'thirdTailCoeff{l}53D n c r {q}*fallingFiveBDEE (j-2*n+2-{l})' for l in range(8))
 src+=f'''theorem tail_{ch}_falling53D (n c r j : ℤ) :
 8*tail{ch.title()}53D c r (3*n+3-j)=8*secondShape07F1 n c r j+{summ} := by
 unfold tail{ch.title()}53D secondShape07F1 fallingFiveBDEE {defs}
 ring
'''
src+='end\nend MathGKM.Markov\n';(R/'research/MarkovTailShape53D.lean').write_text(src)
# Exact positive-coefficient certificates split by powers of the distance variable.
t,u,v,w=map(var,range(4)); inv=[]
for name,ch,cc,rr,shift in [('LowLarge','low',2*u+v+4,u+2,2),('LowOne','low',v+4,1,2),('HighLarge','high',u+2*v+4,u+v+2,0),('HighOne','high',u+4,u+3,0)]:
 p=tails[ch];vs=[0,cc,rr,t+shift]
 gap=subst(p,vs)**2-subst(p,[*vs[:3],t+shift-1])*subst(p,[*vs[:3],t+shift+1])
 assert all(x>=0 for x in gap.values())
 # Whole 3-variable certificate is compact enough; ring+positivity checked by Lean.
 expr=horner(gap,['t','u','v','unused']); ce=horner(cc,['t','u','v','unused']); re=horner(rr if isinstance(rr,Q) else Q({(0,0,0,0):rr}),['t','u','v','unused'])
 src='import MarkovTailShape53D\n'+head
 src+=f'''theorem tail_gap_{name}53D (t u v : ℤ) (ht : 0 ≤ t) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 tail{ch.title()}53D {ce} {re} (t+{shift}-1)*tail{ch.title()}53D {ce} {re} (t+{shift}+1) ≤
 (tail{ch.title()}53D {ce} {re} (t+{shift}))^2 := by
 have he : (tail{ch.title()}53D {ce} {re} (t+{shift}))^2-
  tail{ch.title()}53D {ce} {re} (t+{shift}-1)*tail{ch.title()}53D {ce} {re} (t+{shift}+1) =
  {expr} := by unfold tail{ch.title()}53D; ring
 have hp : 0 ≤ {expr} := by positivity
 omega
end
end MathGKM.Markov
'''
 m=f'MarkovTailGap{name}53D';(R/'research'/f'{m}.lean').write_text(src);inv.append(m)
(O/'generated-tail-inventory.json').write_text(json.dumps(dict(modules=['MarkovTailShape53D']+inv),indent=2)+'\n')
print('Generated exact tail identities and four positive-coefficient gap certificates.')
