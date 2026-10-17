"""Machine-authored Lean certificate generation; identities checked by ordinary ring."""
from pathlib import Path
import json
from gf_identity_13e37040 import P,lean
R=Path('research');d=json.loads(Path('evidence/markov-13e37040/gf-identity.json').read_text())['results']
def p(key,r):return P({tuple(v[:3]):v[3] for v in d[str(r)][key]})
header='''import MathGKM.Markov
/-! Machine-authored 13e3704044384ce789e16ba0f49af882. Exact rational
generating-function algebra. Binomial coefficient extraction is a separate bridge. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 10000
'''
s=header
for name,key in [('gfSourceNum','source_numerator'),('gfDNum','D_numerator')]:
 s+=f'\ndef {name}M13E {{R : Type*}} [CommRing R] (u v t : R) (r : Bool) : R :=\n if r then {lean(p(key,True))}\n else {lean(p(key,False))}\n'
for i in range(3):
 s+=f'\ndef gfLow{i}M13E {{R : Type*}} [CommRing R] (v t : R) (r : Bool) : R :=\n'
 vals=[]
 for r in (True,False):
  pp=P({(0,j,k):c for (ii,j,k),c in p('compact_low',r).items() if ii==i})
  vals.append(lean(pp))
 s+=f' if r then {vals[0]}\n else {vals[1]}\n'
s+='''
def gfLowNumM13E {R : Type*} [CommRing R] (u v t : R) (r : Bool) : R :=
 gfLow0M13E v t r+u*gfLow1M13E v t r+u^2*gfLow2M13E v t r
def gfSmallM13E {R : Type*} [CommRing R] (u v t : R) : R :=
 (1-v*t)*(1-v^2*t)-u*v*t
def gfCubeM13E {R : Type*} [CommRing R] (u v t : R) : R :=
 1-((u+v+1)^3-3*v*(u+v+1))*t+v^3*t^2
def gfRampM13E {R : Type*} [CommRing R] (v t : R) : R := (1-v^3*t^2)^2
def gfUpperM13E {R : Type*} [CommRing R] (v t : R) : R := (1-v^3*t)^3
def gfLowerM13E {R : Type*} [CommRing R] (v t : R) : R := (1-v*t)*(1-v^2*t)^2
def gfENumM13E {R : Type*} [CommRing R] (u v t : R) (r : Bool) : R :=
 if r then 4*u^3*v^4*t^3*(2+v^3*t^2) else 4*u^3*v^3*t^2*(1+2*v^3*t^2)

theorem gf_algebraM13E {R : Type*} [CommRing R] (u v t : R) (r : Bool) :
 gfSourceNumM13E u v t r*gfRampM13E v t*gfUpperM13E v t*gfLowerM13E v t =
 gfDNumM13E u v t r*gfLowerM13E v t*gfSmallM13E u v t+
 gfENumM13E u v t r*gfUpperM13E v t*gfCubeM13E u v t+
 gfLowNumM13E u v t r*gfSmallM13E u v t*gfCubeM13E u v t*gfRampM13E v t := by
 cases r <;> simp only [gfSourceNumM13E,gfRampM13E,gfUpperM13E,gfLowerM13E,
   gfSmallM13E,gfCubeM13E,gfDNumM13E,gfENumM13E,gfLowNumM13E,
   gfLow0M13E,gfLow1M13E,gfLow2M13E,Bool.false_eq_true,if_false,if_true] <;> ring

end
end MathGKM.Markov
'''
(R/'MarkovGFAlgebraM13E.lean').write_text(s)
print('Generated exact symbolic certificate source.')
