import MarkovThirdExprM115
import MarkovThirdSourceMEA
/-! Machine-authored f8ca2c8b. Direct two-block source correction, integral. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option linter.unusedSimpArgs false

def vDJMF8 (n : ℕ) : ℤ[X] := (vKwordM9E1 (X:ℤ[X]) (runBlock025 n)).d.coeff 2

theorem vDJstepMF8 (n : ℕ) :
 vDJMF8 (n+1)=vDJMF8 n+(X+1)*(X*vFJMDE6 n+1) := by
 unfold vDJMF8
 rw [vPolyRun_stepMDE6]
 simp only [mm16,vKaM9E1,add_mul,mul_assoc,Polynomial.coeff_add,
   Polynomial.coeff_C_mul,Polynomial.coeff_X_mul,one_mul,vPolyRun_d1M115]
 simp only [vFJMDE6]
 ring

theorem vDJclosedMF8 (n : ℕ) :
 (1-X)^2*vDJMF8 n=(1+X)^2*(((n:ℤ[X])+1)-((n:ℤ[X])+2)*X+X^(n+2)) := by
 induction n with
 | zero =>
   norm_num [vDJMF8,runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
     vKaM9E1,vKcM9E1,mm16,Polynomial.coeff_add,Polynomial.coeff_C_mul,
     Polynomial.mul_coeff_zero,coeff_mul_one46,coeff_mul_two8934,
     Polynomial.coeff_one,Polynomial.coeff_X]
   <;> ring
 | succ n ih =>
   have hs := vDJstepMF8 n
   have hf := (vJet_closedMDE6 n).2.2
   simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_add,pow_succ] at ih hf hs ⊢
   linear_combination (1-X)^2*hs+ih+(1-X)*X*(X+1)*hf

theorem vTwoWordMF8 (n : ℕ) :
 vKwordM9E1 (X:ℤ[X]) (sourceWord28 (List.replicate n false++[true]))=
 mm16 (vKwordM9E1 X (runBlock025 (n+1))) (vKwordM9E1 X (runBlock025 n)) := by
 rw [source_vertical_blocksMDE6 n [],vKword_blockMDE6]
 simp [sourceWord28,wordPairStep774,projProduct6905,mm16]

theorem vertical_two_third_residualMF8 (n : ℕ) :
 let path := List.replicate n false++[true]
 6*X^(n+3)*vresidualM9E1 path 3=vThirdSeedMEA (X:ℤ[X]) n []+
 6*(X^(n+3)*(vDJMF8 n+vDJMF8 (n+1)-X-1)-X^2*vFJMDE6 (n+1)^2-X^3*vFJMDE6 n^2) := by
 dsimp only
 let path := List.replicate n false++[true]
 let E := vdiffM9E1 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path))
 have ht := vsource_traceMDE6 path
 change _=(1+C (X+1)*X)*E at ht
 rw [vTwoWordMF8] at ht
 have e0 := congrArg (fun p : BiPoly => p.coeff 0) ht
 have e1 := congrArg (fun p : BiPoly => p.coeff 1) ht
 have e2 := congrArg (fun p : BiPoly => p.coeff 2) ht
 have e3 := congrArg (fun p : BiPoly => p.coeff 3) ht
 have hc (m k : ℕ) : (vKwordM9E1 (X:ℤ[X]) (runBlock025 m)).c.coeff k=
   X*(vKwordM9E1 (X:ℤ[X]) (runBlock025 m)).b.coeff k := by
   rw [(vPolyRun_symM115 (X:ℤ[X]) m).1,Polynomial.coeff_C_mul]
 simp only [tr16,mm16,Polynomial.coeff_add,Polynomial.mul_coeff_zero,
   coeff_mul_one46,coeff_mul_two8934,coeff_mul_three6905,
   (vPolyRun_zeroMDE6 (X:ℤ[X]) n).1,(vPolyRun_zeroMDE6 (X:ℤ[X]) n).2.1,
   (vPolyRun_zeroMDE6 (X:ℤ[X]) n).2.2.1,(vPolyRun_zeroMDE6 (X:ℤ[X]) n).2.2.2,
   (vPolyRun_zeroMDE6 (X:ℤ[X]) (n+1)).1,(vPolyRun_zeroMDE6 (X:ℤ[X]) (n+1)).2.1,
   (vPolyRun_zeroMDE6 (X:ℤ[X]) (n+1)).2.2.1,(vPolyRun_zeroMDE6 (X:ℤ[X]) (n+1)).2.2.2,
   hc,vPolyRun_d1M115,add_mul,one_mul,mul_assoc,Polynomial.coeff_C_mul,
   Polynomial.coeff_X_mul,Polynomial.coeff_X_mul_zero,mul_zero,zero_mul,add_zero,zero_add,
   Polynomial.coeff_one,Polynomial.coeff_X,Polynomial.coeff_C,ite_true,ite_false] at e0 e1 e2 e3
 norm_num only at e0 e1 e2 e3
 rw [vThirdSeed_exprM115]
 norm_num only [frame,initial,List.foldl_nil,Nat.reduceSub,Nat.reduceMul,Nat.min_eq_left (by decide : 1≤1)]
 simp only [vThirdExprM115,boolMomentADB2,boolJetADB2,Bool.false_eq_true,if_false,if_true,
   vAJMDE6,vBJMDE6,vCJM115,vFJMDE6,vGJM115,vDJMF8,Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one]
 change 6*X^(n+3)*E.coeff 3=_
 simp only [pow_add,pow_succ] at e0 e1 e2 e3 ⊢
 linear_combination -6*X^(n+3)*e3+6*X^(n+3)*(X+1)*e2-
   6*X^(n+3)*(X+1)^2*e1+6*X^(n+3)*(X+1)^3*e0
end
end MathGKM.Markov
