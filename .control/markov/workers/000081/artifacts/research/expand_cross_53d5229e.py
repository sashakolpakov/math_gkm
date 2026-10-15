"""Machine-authored split algebra to avoid repeatedly expanding cancelled terms."""
from pathlib import Path
from uniform_shape_8bbb import Q,horner
import json
R=Path('/Users/sasha/math_gkm');d=json.loads((R/'evidence/markov-53d5229e/cross-probe.json').read_text())
head='namespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 8000000\nset_option maxRecDepth 16384\n'
for ch in ['low','high']:
 s='import MarkovCrossTail53D\n'+head;q='0' if ch=='low' else '(2*r-c)'
 for off,terms in enumerate(d['shapes'][ch],1):
  p=Q({tuple(k):v for k,v in terms});s+=f'def cross{ch.title()}{off}53D (n c r : ℤ) : ℤ :=\n '+horner(p,['n','c','r','unused'])+'\n'
  s+=f'''theorem cross_{ch}_expand{off}53D (n c r : ℤ) :
 crossTail{off}53D n c r {q}=cross{ch.title()}{off}53D n c r := by
 unfold crossTail{off}53D cross{ch.title()}{off}53D secondShape07F1
 simp only [thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
 ring
'''
 s+='end\nend MathGKM.Markov\n';(R/'research'/f'MarkovCrossExpand{ch.title()}53D.lean').write_text(s)
 for name in (['LowLarge','LowOne'] if ch=='low' else ['HighLarge','HighOne']):
  p=R/'research'/f'MarkovCrossTail{name}53D.lean';s=p.read_text().replace('import MarkovCrossTail53D',f'import MarkovCrossExpand{ch.title()}53D')
  for off in range(1,5):
   old=f'''  unfold crossTail{off}53D crossTail{off+1}53D crossTail{off+2}53D secondShape07F1
  simp only [thirdTailCoeff053D,thirdTailCoeff153D,thirdTailCoeff253D,thirdTailCoeff353D]
  ring'''
   new=f'''  rw [cross_{ch}_expand{off}53D,cross_{ch}_expand{off+1}53D,cross_{ch}_expand{off+2}53D]
  unfold cross{ch.title()}{off}53D cross{ch.title()}{off+1}53D cross{ch.title()}{off+2}53D
  ring'''
   assert old in s;s=s.replace(old,new)
  p.write_text(s)
print('Split twelve crossing expansions from the gap checks.')
