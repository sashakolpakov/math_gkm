"""Generate exact rational approximate-root certificate; Lean checks the claims."""
import decimal,json,pathlib
from fractions import Fraction as F
decimal.getcontext().prec=140
D=decimal.Decimal
record=json.load(open('evidence/markov-f93ee68f/pell-sector.json'))['first_failure']
a=record['coefficients']
def add(z,w):return z[0]+w[0],z[1]+w[1]
def mul(z,w):return z[0]*w[0]-z[1]*w[1],z[0]*w[1]+z[1]*w[0]
def div(z,w):
 d=w[0]**2+w[1]**2
 return (z[0]*w[0]+z[1]*w[1])/d,(z[1]*w[0]-z[0]*w[1])/d
z=(D(str(record['root'][0])),D(str(record['root'][1])))
for _ in range(15):
 v=(D(a[-1]),D(0));der=(D(0),D(0))
 for c in reversed(a[:-1]):der=add(mul(der,z),v);v=add(mul(v,z),(D(c),D(0)))
 delta=div(v,der);z=(z[0]-delta[0],z[1]-delta[1])
den=10**100
x,y=F(int(z[0]*den),den),F(int(z[1]*den),den)
v=(F(0),F(0))
for c in reversed(a):v=add((F(c),F(0)),mul((x,y),v))
bound=F(1,10000)**20
assert abs(v[0])+abs(v[1])<bound
assert (abs(y)-F(1,10000))**2>3*(abs(x)+F(1,10000))**2
out=dict(status='exact rational arithmetic certificate, pending Lean verification',source=record,x=str(x),y=str(y),radius='1/10000',residual_l1=str(abs(v[0])+abs(v[1])),bound=str(bound))
pathlib.Path('evidence/markov-f93ee68f/sector-certificate.json').write_text(json.dumps(out,indent=2)+'\n')
def lean(q):return f'({q.numerator}/{q.denominator})'
text=f'''import MarkovRootCertificateF93e
import MarkovPellSum9a72
import MarkovHorizontalB46
/-! Machine-authored f93ee68f. A source horizontal root outside the
120-degree sector. This does NOT reverse any raw coefficient inequality. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 0
set_option maxRecDepth 10000

def sectorListF93e : List ℤ := {a}
def sectorXF93e : ℚ := {lean(x)}
def sectorYF93e : ℚ := {lean(y)}
def sectorPolyF93e := hornerPolyF93e ℂ sectorListF93e
def sectorCenterF93e : ℂ := (sectorXF93e:ℂ)+(sectorYF93e:ℂ)*Complex.I

theorem sector_residualF93e :
 ‖sectorPolyF93e.eval sectorCenterF93e‖ < (1/10000:ℝ)^20 := by
 have h : |(ratHornerF93e sectorXF93e sectorYF93e sectorListF93e).1|+
   |(ratHornerF93e sectorXF93e sectorYF93e sectorListF93e).2| < (1/10000:ℚ)^20 := by
   norm_num [ratHornerF93e,sectorXF93e,sectorYF93e,sectorListF93e]
 simpa [sectorPolyF93e,sectorCenterF93e] using
   horner_norm_boundF93e sectorListF93e sectorXF93e sectorYF93e ((1/10000)^20) h

#print axioms sector_residualF93e
end
end MathGKM.Markov
'''
pathlib.Path('research/MarkovSectorWitnessF93e.lean').write_text(text)
print(json.dumps(dict(center=[str(x),str(y)],residual_ratio_float=float((abs(v[0])+abs(v[1]))/bound))),flush=True)
