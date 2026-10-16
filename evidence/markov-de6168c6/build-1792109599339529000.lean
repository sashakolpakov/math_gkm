import MarkovVerticalClearedSeedMDE6
/-! Machine-authored de6168c6. Integral scalar recurrences for the universal
second-column seed jets, derived from the actual transfer matrices. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option linter.unusedSimpArgs false

theorem vPolyRun_stepMDE6 {R : Type*} [CommRing R] (x : R) (n : ℕ) :
 vKwordM9E1 x (runBlock025 (n+1))=
 mm16 (vKaM9E1 x) (vKwordM9E1 x (runBlock025 n)) := by
 simp only [runBlock025,List.replicate_succ,List.cons_append,
   vKwordM9E1,List.map_cons,projProduct6905,vKletterM9E1,Bool.false_eq_true,if_false]

theorem vPolyRun_zeroMDE6 {R : Type*} [CommRing R] (x : R) (n : ℕ) :
 (vKwordM9E1 x (runBlock025 n)).a.coeff 0=x^(n+1) ∧
 (vKwordM9E1 x (runBlock025 n)).b.coeff 0=0 ∧
 (vKwordM9E1 x (runBlock025 n)).c.coeff 0=0 ∧
 (vKwordM9E1 x (runBlock025 n)).d.coeff 0=0 := by
 induction n with
 | zero =>
   simp [runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
     vKaM9E1,vKcM9E1,mm16,Polynomial.mul_coeff_zero,Polynomial.coeff_one]
 | succ n ih =>
   rw [vPolyRun_stepMDE6]
   simp [mm16,vKaM9E1,Polynomial.mul_coeff_zero,Polynomial.coeff_add,
     Polynomial.coeff_one,ih.1,ih.2.1,ih.2.2.1,ih.2.2.2,pow_succ,mul_comm]

theorem vKa_cayleyMDE6 {R : Type*} [CommRing R] (x : R) (m : Mat16 R[X]) :
 (mm16 (vKaM9E1 x) (mm16 (vKaM9E1 x) m)).a=
 (C (x+1)+C ((x+1)^2)*X)*(mm16 (vKaM9E1 x) m).a-C x*m.a ∧
 (mm16 (vKaM9E1 x) (mm16 (vKaM9E1 x) m)).b=
 (C (x+1)+C ((x+1)^2)*X)*(mm16 (vKaM9E1 x) m).b-C x*m.b := by
 constructor <;> simp [mm16,vKaM9E1,map_add,map_pow] <;> ring

theorem vJet_recurrencesMDE6 (n : ℕ) :
 vAJMDE6 (n+2)=(X+1)*vAJMDE6 (n+1)+(X+1)^2*X^(n+2)-X*vAJMDE6 n ∧
 vBJMDE6 (n+2)=(X+1)*vBJMDE6 (n+1)+(X+1)^2*vAJMDE6 (n+1)-X*vBJMDE6 n ∧
 vFJMDE6 (n+2)=(X+1)*vFJMDE6 (n+1)-X*vFJMDE6 n := by
 have h := vKa_cayleyMDE6 (X:ℤ[X]) (vKwordM9E1 X (runBlock025 n))
 rw [←vPolyRun_stepMDE6,←vPolyRun_stepMDE6] at h
 have h1 := congrArg (fun p : BiPoly => p.coeff 1) h.1
 have h2 := congrArg (fun p : BiPoly => p.coeff 2) h.1
 have hf := congrArg (fun p : BiPoly => p.coeff 1) h.2
 simp only [Polynomial.coeff_sub,add_mul,mul_assoc,Polynomial.coeff_add,
   Polynomial.coeff_C_mul,Polynomial.coeff_X_mul,
   (vPolyRun_zeroMDE6 (X:ℤ[X]) (n+1)).1,
   (vPolyRun_zeroMDE6 (X:ℤ[X]) (n+1)).2.1,mul_zero,add_zero] at h1 h2 hf
 exact ⟨h1,h2,hf⟩

theorem vJet_initialMDE6 :
 vAJMDE6 0=X*(3+2*X) ∧ vAJMDE6 1=X*(4+6*X+3*X^2) ∧
 vBJMDE6 0=X*(1+X)^2 ∧ vBJMDE6 1=X*(4+11*X+10*X^2+3*X^3) ∧
 vFJMDE6 0=2+X ∧ vFJMDE6 1=2+2*X+X^2 := by
 refine ⟨?_,?_,?_,?_,?_,?_⟩
 all_goals
   norm_num [vAJMDE6,vBJMDE6,vFJMDE6,runBlock025,vKwordM9E1,
     projProduct6905,vKletterM9E1,vKaM9E1,vKcM9E1,mm16,
     Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.mul_coeff_zero,
     coeff_mul_one46,coeff_mul_two8934,Polynomial.coeff_one,Polynomial.coeff_X]
   <;> ring

end
end MathGKM.Markov
