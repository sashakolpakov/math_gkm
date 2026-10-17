"""Machine-authored trisection algebra certificate generation."""
from pathlib import Path
from gf_identity_13e37040 import u,v,t,s,section,lean
conj=(1+v*t**2+v**2*t**4)**2*(1+v*t+v**2*t**2)**3*(1+s*t+(s**2-v)*t**2+s*v*t**3+v**2*t**4)
nd0=section(u**3*t*(1+v*t**2)**2*conj,0)
src='''import MarkovGFAlgebraM13E
/-! Machine-authored 13e37040. Polynomial trisection certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 20000000
set_option maxRecDepth 10000
def gfMasterDenM13E {R : Type*} [CommRing R] (u v t : R) : R :=
 (1-v*t^2)^2*(1-v*t)^3*((1-t)*(1-v*t)-u*t)
def gfMasterNumM13E {R : Type*} [CommRing R] (u v t : R) : R := u^3*t*(1+v*t^2)^2
def gfConjugateM13E {R : Type*} [CommRing R] (u v t : R) : R :=
 (1+v*t^2+v^2*t^4)^2*(1+v*t+v^2*t^2)^3*
 (1+(u+v+1)*t+((u+v+1)^2-v)*t^2+(u+v+1)*v*t^3+v^2*t^4)
def gfD0NumM13E {R : Type*} [CommRing R] (u v t : R) : R :=
 '''+lean(nd0)+'''

theorem gf_master_normM13E {R : Type*} [CommRing R] (u v t : R) :
 gfMasterDenM13E u v t*gfConjugateM13E u v t=
 gfRampM13E v (t^3)*gfUpperM13E v (t^3)*gfCubeM13E u v (t^3) := by
 simp only [gfMasterDenM13E,gfConjugateM13E,gfRampM13E,gfUpperM13E,gfCubeM13E]
 ring

theorem gf_master_numerM13E {R : Type*} [CommRing R] (u v t : R) :
 gfMasterNumM13E u v t*gfConjugateM13E u v t=
 gfD0NumM13E u v (t^3)+t*gfDNumM13E u v (t^3) true+t^2*gfDNumM13E u v (t^3) false := by
 simp only [gfMasterNumM13E,gfConjugateM13E,gfD0NumM13E,gfDNumM13E,
   Bool.false_eq_true,if_true,if_false]
 ring
end
end MathGKM.Markov
'''
Path('research/MarkovGFSectionAlgebraM13E.lean').write_text(src)
print('Generated trisection certificate source.')
