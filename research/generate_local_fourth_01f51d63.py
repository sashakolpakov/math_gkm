"""Machine-authored local coboundary certificate generation."""
from fourth_probe_01f51d63 import *
data=json.loads((OUT/'fourth-local-statistics.json').read_text())
def poly(p):
 terms=[]
 for (i,j,k),v in sorted(p.items()):
  assert i==j==0 and v.denominator==1
  terms.append(str(int(v))+('*y'+('^'+str(k) if k>1 else '') if k else ''))
 return ' + '.join(terms) or '0'
def expr(stats,names):
 return ' + '.join('('+poly(deser(x['coefficient']))+')'+''.join('*bit6905 '+names[i] for i in x['subset']) for x in stats)
s='''import MarkovFourthLocal01F
import MarkovBooleanJets6905
/-! Machine-authored 01f51d63. A checked Boolean coboundary certificate.
The source-specific cyclic counts are a separate obligation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
variable {R : Type*} [CommRing R]
def fourthLocalBoolean01F (y : R) (p q r s t : Bool) : R :=
 let r1 := (1:R)
 let r2 := localB26905 y r+localA6905 y r-localD6905 y q r
 let r3 := localA6905 y r*(localB26905 y s+localA6905 y s-localD6905 y r s)-
   y*localB26905 y r-(localB26905 y r+localA6905 y r)*localD6905 y q r+
   (localD6905 y q r)^2-localD26905 y q r-localC6905 y q r
 let d := localD6905 y p q
 let g2 := localD26905 y p q+localC6905 y p q*r1
 let g3 := localC6905 y p q*r2+localC26905 y p q*r1
 let g4 := localC6905 y p q*r3+localC26905 y p q*r2
 24*g4-24*d*g3-12*g2^2+24*d^2*g2-6*d^4
'''
# r3 above uses only r,s, not t, because every b1 is one. Thus f is already
# four-bit; the redundant t parameter is retained to match the derivation.
s+='def fourthPotential01F (y : R) (p q r s : Bool) : R :=\n '+expr(data['potential'],{0:'p',1:'q',2:'r',3:'s'})+'\n'
s+='def fourthCanonical01F (y : R) (q r s t : Bool) : R :=\n '+expr(data['canonical'],{1:'q',2:'r',3:'s',4:'t'})+'\n'
s+='''theorem fourth_boolean_coboundary01F (y : R) (p q r s t : Bool) :
 fourthLocalBoolean01F y p q r s t=fourthCanonical01F y q r s t+
 fourthPotential01F y p q r s-fourthPotential01F y q r s t := by
 cases p <;> cases q <;> cases r <;> cases s <;> cases t <;>
   simp only [fourthLocalBoolean01F,fourthCanonical01F,fourthPotential01F,
     localD6905,localA6905,localB26905,localD26905,localC6905,localC26905,
     bit6905,Bool.false_eq_true,if_false,if_true] <;> ring
end
end MathGKM.Markov
'''
(ROOT/'research/MarkovFourthBoolean01F.lean').write_text(s)
print('Generated Boolean local certificate.')
