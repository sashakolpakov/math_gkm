"""Machine-authored generation of ring-checkable auxiliary boundary certificates."""
from pathlib import Path
from fractions import Fraction as F
from column_five_4687d03f import Padd,Pmul,Pscale,Ppow,subst,lean
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fee405c8'
one={(0,0):F(1)};T={(1,0):F(1)};J={(0,1):F(1)}
def c(n):return Pscale(one,n)
def add(*p):return Padd(*p)
def mul(*p):
 z=one
 for a in p:z=Pmul(z,a)
 return z
def D(v,m):return mul(add(T,c(v+m+4)),add(T,c(v+m+5)))
def E(v,m):return add(D(v,m),Pscale(mul(add(J,c(-m)),add(T,J,c(v+4))),4))
a=add(T,J,c(4));b=add(T,J,c(5));u=add(T,c(4));v=add(T,c(5))
gaps=[
add(Pscale(mul(Ppow(J,2),Ppow(a,2),Ppow(E(1,1),2),D(0,0),D(2,2),v),2),Pscale(mul(J,add(J,c(-1)),a,b,u,E(0,0),E(2,2),Ppow(D(1,1),2)),-1)),
add(Pscale(mul(J,Ppow(a,2),E(1,1),E(1,0),D(0,0),D(2,1),v),2),Pscale(mul(J,a,b,u,E(0,0),E(2,1),D(1,1),D(1,0)),-1))]
lhs=[
'2*j^2*(t+j+4)^2*(liftWeightMAE9 j (t+1) 1)^2*liftDenMAE9 t 0*liftDenMAE9 (t+2) 2*(t+5)-j*(j-1)*(t+j+4)*(t+j+5)*(t+4)*liftWeightMAE9 j t 0*liftWeightMAE9 j (t+2) 2*(liftDenMAE9 (t+1) 1)^2',
'2*j*(t+j+4)^2*liftWeightMAE9 j (t+1) 1*liftWeightMAE9 j (t+1) 0*liftDenMAE9 t 0*liftDenMAE9 (t+2) 1*(t+5)-j*(t+j+4)*(t+j+5)*(t+4)*liftWeightMAE9 j t 0*liftWeightMAE9 j (t+2) 1*liftDenMAE9 (t+1) 1*liftDenMAE9 (t+1) 0']
mods=[]
for idx,g in enumerate(gaps):
 p=subst(g,T,add(J,c(2)));assert all(v>=0 for v in p.values())
 expr=lean(p,'t').replace('s','s')
 # inherited renderer names its second variable j
 expr=expr.replace('x','s')
 name=f'MarkovCutCertificate{idx}MFEE';mods.append(name)
 src='import MarkovLiftRatioMAE9\n/-! Machine-authored fee405c8. Exact positive polynomial certificate. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 12000000\nset_option maxRecDepth 8192\n'
 src+=f'def cutCertificate{idx}MFEE (t s : ℚ) : ℚ :=\n {expr}\n'
 src+=f'theorem cut_certificate_nonneg{idx}MFEE (t s : ℚ) (ht : 0 ≤ t) (hs : 0 ≤ s) :\n 0 ≤ cutCertificate{idx}MFEE t s := by\n unfold cutCertificate{idx}MFEE\n positivity\n'
 src+=f'theorem cut_certificate_identity{idx}MFEE (t s : ℚ) :\n (let j := s+2; {lhs[idx]})=cutCertificate{idx}MFEE t s := by\n unfold cutCertificate{idx}MFEE liftWeightMAE9 liftDenMAE9\n dsimp\n ring\nend\nend MathGKM.Markov\n'
 (R/'research'/f'{name}.lean').write_text(src)
(O/'boundary-certificate-generation.json').write_text(json.dumps({'modules':mods,'terms':[len(subst(g,T,add(J,c(2)))) for g in gaps],'status':'generated candidates; Lean compilation required'},indent=2)+'\n')
print(mods)
