import MarkovThirdExprM115
/-! Machine-authored 1152282d. Universal cleared third-column seed identity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 15000000
set_option linter.unusedSimpArgs false

def vThirdClearedM115 {R : Type*} [CommRing R]
 (a b c d e x t A B C A' B' C' F G F' G' : R) : R :=
 let h := 1-x
 let aa := fun p : Bool => if p then x*A else A'
 let bb := fun p : Bool => if p then x*B else B'
 let cc := fun p : Bool => if p then x*C else C'
 let ff := fun p : Bool => if p then x*F else F'
 let gg := fun p : Bool => if p then x*G else G'
 let hh := fun p : Bool => if p then x else 1
 let D := boolMomentADB2 (fun p _ _ => aa p) a b c d e
 let K := boolMomentADB2 (fun p q _ => t*bb p-aa p^2+2*x*h^2*ff p*ff q) a b c d e
 let L := boolMomentADB2 (fun p q r =>
   2*aa p^3-3*t*aa p*bb p+t^2*cc p+
   6*t*x*h^2*(ff p*gg q+gg p*ff q)-6*x*h^2*ff p*ff q*(aa p+aa q)+
   6*x*h^4*ff p*hh q*ff r) a b c d e
 D^3+3*D*K+L-3*(x+1)*t*h^2*(D^2+K)+6*(x+1)^2*t^2*h^4*D-6*(x+1)^3*t^3*h^6

theorem vThird_clearM115 {R : Type*} [CommRing R]
 (a b c d e x t A B C A' B' C' F G F' G' : R) :
 vThirdClearedM115 a b c d e x t
   ((1-x)^2*A) (2*(1-x)^4*B) (6*(1-x)^6*C)
   ((1-x)^2*A') (2*(1-x)^4*B') (6*(1-x)^6*C')
   ((1-x)*F) ((1-x)^3*G) ((1-x)*F') ((1-x)^3*G')=
 (1-x)^6*vThirdExprM115 a b c d e x t A B C A' B' C' F G F' G' := by
 simp only [vThirdClearedM115,vThirdExprM115,boolMomentADB2,boolJetADB2,if_true,if_false,
   Bool.false_eq_true]
 ring

def vThirdSparseM115 (a b c d e q T : ℤ[X]) : ℤ[X] :=
 vThirdClearedM115 a b c d e X (T*X)
   (4*X+T*vAPMDE6 q) (vBLMDE6 q+T*vBPMDE6 q) (vCLM115 q+T*vCPM115 q)
   (4*X+T*X*vAPMDE6 (q+1)) (vBLMDE6 (q+1)+T*X*vBPMDE6 (q+1))
   (vCLM115 (q+1)+T*X*vCPM115 (q+1))
   (2-T-T*X) (vGLM115 q+T*vGPM115 q)
   (2-T*X-T*X^2) (vGLM115 (q+1)+T*X*vGPM115 (q+1))

theorem vThirdSparse_exprM115 (n : ℕ) (a b c d e : ℤ[X]) :
 (1-X)^6*vThirdExprM115 a b c d e X (X^(n+2))
   (vAJMDE6 n) (vBJMDE6 n) (vCJM115 n)
   (vAJMDE6 (n+1)) (vBJMDE6 (n+1)) (vCJM115 (n+1))
   (vFJMDE6 n) (vGJM115 n) (vFJMDE6 (n+1)) (vGJM115 (n+1))=
 vThirdSparseM115 a b c d e (n+1) (X^(n+1)) := by
 rw [←vThird_clearM115]
 obtain ⟨ha,hb,hf⟩ := vJet_closedMDE6 n
 obtain ⟨ha',hb',hf'⟩ := vJet_closedMDE6 (n+1)
 obtain ⟨hc,hg⟩ := vJet3_closedM115 n
 obtain ⟨hc',hg'⟩ := vJet3_closedM115 (n+1)
 rw [ha,hb,hf,ha',hb',hf',hc,hg,hc',hg']
 simp only [vThirdSparseM115,Nat.cast_add,Nat.cast_one,pow_succ,pow_add]
 congr 1 <;> ring

theorem vThirdSeed_sparseM115 (n : ℕ) (rest : List Bool) :
 (1-X)^6*vThirdSeedMEA (X:ℤ[X]) n rest=
 vThirdSparseM115 (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) (n+1) (X^(n+1)) := by
 rw [vThirdSeed_exprM115,vThirdSparse_exprM115]
end
end MathGKM.Markov
