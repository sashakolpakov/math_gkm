import MarkovThirdJetsM115
import MarkovThirdSeedMEA
/-! Machine-authored 1152282d. Integral scalar description of the actual seed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option linter.unusedSimpArgs false

theorem vPolyRun_symM115 {R : Type*} [CommRing R] (x : R) (n : ℕ) :
 (vKwordM9E1 x (runBlock025 n)).c=C x*(vKwordM9E1 x (runBlock025 n)).b ∧
 C (x+1)*X*(vKwordM9E1 x (runBlock025 n)).a+
 C (1-x)*(1+C (x+1)*X)*(vKwordM9E1 x (runBlock025 n)).b-
 (2+C (x+1)*X)*(vKwordM9E1 x (runBlock025 n)).d=0 := by
 induction n with
 | zero =>
   constructor <;>
     simp [runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
       vKaM9E1,vKcM9E1,mm16,map_add,map_sub] <;> ring
 | succ n ih =>
   rw [vPolyRun_stepMDE6]
   simp only [mm16,vKaM9E1]
   simp only [map_add,map_sub,map_one] at ih ⊢
   constructor
   · linear_combination (1+(C x+1)*X)*ih.1+C x*ih.2
   · linear_combination ((C x+1)*X)*(2+(C x+1)*X)*ih.1+
       C x*(1+(C x+1)*X)*ih.2

theorem vPolyRun_d1M115 {R : Type*} [CommRing R] (x : R) (n : ℕ) :
 (vKwordM9E1 x (runBlock025 n)).d.coeff 1=1 := by
 induction n with
 | zero =>
   norm_num [runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
     vKaM9E1,vKcM9E1,mm16,coeff_mul_one46,Polynomial.mul_coeff_zero,
     Polynomial.coeff_one,Polynomial.coeff_X]
 | succ n ih =>
   rw [vPolyRun_stepMDE6]
   simp [mm16,vKaM9E1,coeff_mul_one46,Polynomial.mul_coeff_zero,
     Polynomial.coeff_one,Polynomial.coeff_X,ih,
     (vPolyRun_zeroMDE6 x n).2.1,(vPolyRun_zeroMDE6 x n).2.2.2]

def vThirdExprM115 {R : Type*} [CommRing R]
 (a b c d e x t A B C A' B' C' F G F' G' : R) : R :=
 let aa := fun p : Bool => if p then x*A else A'
 let bb := fun p : Bool => if p then x*B else B'
 let cc := fun p : Bool => if p then x*C else C'
 let ff := fun p : Bool => if p then x*F else F'
 let gg := fun p : Bool => if p then x*G else G'
 let hh := fun p : Bool => if p then x else 1
 let D := boolMomentADB2 (fun p _ _ => aa p) a b c d e
 let K := boolMomentADB2 (fun p q _ => 2*t*bb p-aa p^2+2*x*ff p*ff q) a b c d e
 let L := boolMomentADB2 (fun p q r =>
   2*aa p^3-6*t*aa p*bb p+6*t^2*cc p+
   6*t*x*(ff p*gg q+gg p*ff q)-6*x*ff p*ff q*(aa p+aa q)+
   6*x*ff p*hh q*ff r) a b c d e
 D^3+3*D*K+L-3*(x+1)*t*(D^2+K)+6*(x+1)^2*t^2*D-6*(x+1)^3*t^3

theorem vThirdSeed_exprM115 (n : ℕ) (rest : List Bool) :
 vThirdSeedMEA (X:ℤ[X]) n rest=
 vThirdExprM115 (R:=ℤ[X]) (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ)
   X (X^(n+2)) (vAJMDE6 n) (vBJMDE6 n) (vCJM115 n)
   (vAJMDE6 (n+1)) (vBJMDE6 (n+1)) (vCJM115 (n+1))
   (vFJMDE6 n) (vGJM115 n) (vFJMDE6 (n+1)) (vGJM115 (n+1)) := by
 have hc (k j : ℕ) : (vKwordM9E1 (X:ℤ[X]) (runBlock025 k)).c.coeff j=
   X*(vKwordM9E1 (X:ℤ[X]) (runBlock025 k)).b.coeff j := by
   rw [(vPolyRun_symM115 (X:ℤ[X]) k).1,Polynomial.coeff_C_mul]
 simp only [vThirdSeedMEA,vThirdExprM115,hsourceMomentM13D,boolMomentADB2,boolJetADB2,
   vLocalKScaledMEA,vLocalLScaledMEA,vBlockPolyMEA,hscaleM13D,vswapMDE6,
   Bool.false_eq_true,if_false,if_true,Polynomial.coeff_C_mul,hc,vPolyRun_d1M115,
   vAJMDE6,vBJMDE6,vCJM115,vFJMDE6,vGJM115]
 ring
end
end MathGKM.Markov
