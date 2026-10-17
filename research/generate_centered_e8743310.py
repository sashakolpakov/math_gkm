"""Machine-authored exact scalar certificate; Lean ring checks this expansion."""
from pathlib import Path
from weak_margin_probe_6738b4ea import C,X,add,scale,mul,expr
i=add(X(0),C(10));r=add(X(1),C(3));H=add(r,scale(i,2),X(2),C(9))
I=add(i,C(3));J=add(i,C(4));D=add(H,scale(r,-1),C(1))
A=mul(add(i,C(1)),add(scale(J,8),C(1)));B=add(scale(i,15),C(47))
Q=add(H,r);R=mul(r,H)
S=add(mul(i,add(i,C(1))),scale(mul(r,add(i,C(1))),6),scale(mul(r,r),6))
P=add(mul(C(4),I,J,B,R,R),mul(C(4),I,J,A,D,R),scale(mul(I,J,A,D,D),-1),scale(mul(C(4),add(B,A),Q,Q,S),-1))
assert all(v>0 for v in P.values())
s='''import MarkovCenteredVarianceME87
/-! Machine-authored e8743310. Exact positive scalar certificate with the
squared mean term retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
theorem centered_scalar_shiftME87 (x y z : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < centeredScalarME87 (x+10) (y+3) ((y+3)+2*(x+10)+9+z) := by
 have he : centeredScalarME87 (x+10) (y+3) ((y+3)+2*(x+10)+9+z) = EXPR := by
   unfold centeredScalarME87 deficitSecondM41B
   ring
 rw [he]
 positivity
theorem centered_scalar_positiveME87 (i r H : ℝ) (hi : 10 ≤ i) (hr : 3 ≤ r)
 (hH : r+2*i+9 ≤ H) : 0 < centeredScalarME87 i r H := by
 have h := centered_scalar_shiftME87 (i-10) (r-3) (H-r-2*i-9)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring

theorem centered_controlME87 (i r H M E V G : ℝ)
 (hi : 10 ≤ i) (hr : 3 ≤ r) (hH : r+2*i+9 ≤ H)
 (hM : 0 ≤ M)
 (hsecond : (i+3)*(i+4)*G ≤ deficitSecondM41B i r*M)
 (hV : V+(r*H*M-E)^2 ≤ (H+r)^2*M*G) :
 0 ≤ (15*i+47)*E^2+(i+1)*(8*(i+4)+1)*(H-r+1)*M*E-(i+1)*(8*(i+4)+1)*V := by
 have hS := centered_scalar_positiveME87 i r H hi hr hH
 have hV' : (i+3)*(i+4)*(V+(r*H*M-E)^2) ≤
   (H+r)^2*deficitSecondM41B i r*M^2 := by
   have h0 := mul_le_mul_of_nonneg_left hV (by positivity : 0 ≤ (i+3)*(i+4))
   have h1 := mul_le_mul_of_nonneg_left hsecond (by positivity : 0 ≤ (H+r)^2*M)
   nlinarith only [h0,h1]
 exact centered_control_algebraME87 (i+3) (i+4) (deficitSecondM41B i r)
   (H+r) ((i+1)*(8*(i+4)+1)) (H-r+1) (15*i+47) (r*H) M E V
   (by linarith) (by linarith) (by positivity) (by positivity) hV'
   (by exact hS.le)
end
end MathGKM.Markov
'''.replace('EXPR',expr(P))
Path('research/MarkovCenteredScalarME87.lean').write_text(s)
print({'terms':len(P),'minimum':min(P.values())})
