"""Machine-authored source-specific finite reduction; generated proofs are checked."""
from pathlib import Path
from math import gcd
p=Path('research/MarkovFiniteQuintic05ef.lean')
s=p.read_text(); s=s[:s.index('theorem finite_quintic05ef')]+'''theorem quinticGood_cast05ef (n m s t h k e f : ℕ)
 (H : quinticGood05ef n m s t h k e f) :
 qaE582 m*qcE582 n m s t k e f ≤ qbE582 n m s t h e^2 ∧
 qbE582 n m s t h e*qdE582 n m s ≤ qcE582 n m s t k e f^2 ∧
 qcE582 n m s t k e f*qeE582 n m ≤ qdE582 n m s^2 ∧
 qdE582 n m s*qfE582 n ≤ qeE582 n m^2 := by
 unfold quinticGood05ef qa05ef qb05ef qc05ef qd05ef qe05ef qf05ef at H
 unfold qaE582 qbE582 qcE582 qdE582 qeE582 qfE582
 exact_mod_cast H
end MathGKM.Markov
''';p.write_text(s)
s='''import MarkovFiniteQuintic05ef
import MarkovUnique098
namespace MathGKM.Markov
set_option maxHeartbeats 0
set_option maxRecDepth 10000
def sourceCore05ef (path : List Bool) : List Bool :=
 let xy := path.foldl wordPairStep774 ([false],[true])
 xy.1.tail ++ xy.2.dropLast

theorem source_core_good05ef (path : List Bool)
 (ha : 2 ≤ (frame path).mid.a) (ha9 : (frame path).mid.a ≤ 9)
 (hb : (frame path).mid.b ≤ 19) : quinticWordGood05ef (sourceCore05ef path) := by
 obtain ⟨ha0,hab,hc⟩ := frame_reduced path
 generalize hea : (frame path).mid.a = a at *
 generalize heb : (frame path).mid.b = b at *
 have hb0 : 3 ≤ b := by omega
 interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *
'''
def path(a,b):
 lo=(0,1);hi=(1,1);out=[]
 while True:
  m=tuple(x+y for x,y in zip(lo,hi))
  if m==(a,b):return out
  z=a*m[1]>b*m[0];out.append(z)
  if z:lo=m
  else:hi=m
for a in range(2,10):
 for b in range(3,20):
  if a<b and gcd(a,b)==1:
   ps='['+','.join('true' if z else 'false' for z in path(a,b))+']'
   s+=f''' · have hp : path = {ps} := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   decide +kernel
'''
s+='\n#print axioms source_core_good05ef\nend MathGKM.Markov\n'
Path('research/MarkovSourceFinite05ef.lean').write_text(s)
