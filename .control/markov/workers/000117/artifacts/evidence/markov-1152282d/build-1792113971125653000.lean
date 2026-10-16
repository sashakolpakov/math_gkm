import MarkovThirdClearedM115
/-! Machine-authored 1152282d. Compact evaluated Boolean moment expressions. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000

def vThirdCompactM115 {R : Type*} [CommRing R]
 (a b c d e x t A B C A' B' C' F G F' G' : R) : R :=
 let h := 1-x
 let f := x*F-F'
 let g := x*G-G'
 let D := (a-b)*A'+b*x*A
 let K := t*((a-b)*B'+b*x*B)-(a-b)*A'^2-b*x^2*A^2+
   2*x*h^2*(a*F'^2+2*b*F'*f+c*f^2)
 let L := 2*((a-b)*A'^3+b*x^3*A^3)-3*t*((a-b)*A'*B'+b*x^2*A*B)+
   t^2*((a-b)*C'+b*x*C)+12*t*x*h^2*(a*F'*G'+b*(f*G'+F'*g)+c*f*g)-
   12*x*h^2*((a-2*b+c)*F'^2*A'+(b-c)*x*F*F'*(A'+x*A)+c*x^3*F^2*A)+
   6*x*h^4*(a*F'^2+b*(2*F'*f+(x-1)*F'^2)+2*c*(x-1)*F'*f+(d+x*e)*f^2)
 D^3+3*D*K+L-3*(x+1)*t*h^2*(D^2+K)+6*(x+1)^2*t^2*h^4*D-6*(x+1)^3*t^3*h^6

theorem vThirdCleared_compactM115 {R : Type*} [CommRing R]
 (a b c d e x t A B C A' B' C' F G F' G' : R) :
 vThirdClearedM115 a b c d e x t A B C A' B' C' F G F' G'=
 vThirdCompactM115 a b c d e x t A B C A' B' C' F G F' G' := by
 simp only [vThirdClearedM115,vThirdCompactM115,boolMomentADB2,boolJetADB2,
   Bool.false_eq_true,if_false,if_true]
 ring
end
end MathGKM.Markov
