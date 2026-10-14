import MarkovQuarticJet4f8

/-! Machine-authored request e5822cfc. Exact quintic jet candidate. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxRecDepth 8000
set_option maxHeartbeats 2000000
set_option linter.unusedSimpArgs false

def quinticExprE582 {R : Type*} [CommRing R] (x n m s t h k e f : R) : R :=
 m*(m-1)*(m-2)*(m-3)*(m-4)+
 (-360+750*m-605*m^2+270*m^3-55*m^4+120*n-170*n*m+55*n*m^2-10*n*m^3+5*n*m^4+
 (-360+360*m-120*m^2)*s+(-240+240*m)*t+240*h+120*e)*x+
 (-1440+2040*m-1140*m^2+660*m^3+720*n-940*n*m-30*n*m^2-170*n*m^3+
 140*n^2*m+30*n^2*m^2+10*n^2*m^3+(-1080+1440*m-240*n*m)*s+
 (-1200+240*n)*t-240*k-120*e+240*f)*x^2+
 (-720+420*m-1500*m^2+1320*n+670*n*m+950*n*m^2-720*n^2-420*n^2*m-
 180*n^2*m^2+120*n^3+50*n^3*m+10*n^3*m^2+(-1440+840*n-120*n^2)*s)*x^3+
 (240*m-120*n-470*n*m+220*n^2+295*n^2*m-120*n^3-70*n^3*m+20*n^4+5*n^4*m)*x^4+
 (n+1)*n*(n-1)*(n-2)*(n-3)*x^5

def qthirdE582 {R : Type*} [CommRing R] (x n m s : R) (d e r : Bool) : R :=
 cubicExpr5a7 x (n-1) (m-if r then 1 else 0) (s-if e=r then 0 else 1)+
 (if r then 0 else 3)*qsecond4f8 x (n-1) (m-if r then 1 else 0) d e

def hitHE582 (d e r z : Bool) : Bool := (!e && !r && d==z)
def hitKE582 (d e r z : Bool) : Bool :=
 (d,e,r,z) ∈ [(false,false,false,false),(false,false,false,true),
 (false,false,true,true),(true,false,false,false),(true,false,false,true),
 (true,false,true,true),(true,true,false,false),(true,true,false,true)]
def hitFE582 (d e r : Bool) : Bool := !d && e && !r

theorem quintic_transitionE582 {R : Type*} [CommRing R]
 (x n m s t h k a b : R) (d e r z : Bool) :
 quinticExprE582 x (n+1) (m+if z then 1 else 0)
  (s+if r=z then 0 else 1) (t+if e=z ∧ r=false then 1 else 0)
  (h+if hitHE582 d e r z then 1 else 0)
  (k+if hitKE582 d e r z then 1 else 0)
  (a+if z then 0 else 1) (b+if hitFE582 e r z then 1 else 0) =
 quinticExprE582 x n m s t h k (a+if r then 0 else 1)
  (b+if hitFE582 d e r then 1 else 0)+
  (if z then 5*(x+1) else 5*x)*quarticExpr4f8 x n m s t+
  (if z then -20*x else 20*x)*qthirdE582 x n m s d e r := by
 cases d <;> cases e <;> cases r <;> cases z <;>
  simp [quinticExprE582,quarticExpr4f8,qthirdE582,cubicExpr5a7,qsecond4f8,
    hitHE582,hitKE582,hitFE582] <;> ring

end
end MathGKM.Markov
