import MarkovVerticalCandidateBridgeMDE6
/-! Machine-authored de6168c6. Integral cleared seed for every second-column
run. A uniform leading zero is retained; no coefficient normalization. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option linter.unusedSimpArgs false

def vAJMDE6 (n : ℕ) : ℤ[X] :=
 (vKwordM9E1 (X:ℤ[X]) (runBlock025 n)).a.coeff 1
def vBJMDE6 (n : ℕ) : ℤ[X] :=
 (vKwordM9E1 (X:ℤ[X]) (runBlock025 n)).a.coeff 2
def vFJMDE6 (n : ℕ) : ℤ[X] :=
 (vKwordM9E1 (X:ℤ[X]) (runBlock025 n)).b.coeff 1

def vNexprMDE6 {R : Type*} [CommRing R] (x t a r s A B F A' B' : R) : R :=
 let D := (a-r)*x*A+r*A'
 D^2-(a-r)*x^2*A^2-r*A'^2+2*t*x*((a-r)*x*B+r*B')+
 2*x*(a*x^2*F^2+4*r*x*F+4*s)-2*(x+1)*t*x*D+2*(x+1)^2*t^2*x^2
def vNseedMDE6 (n a r s : ℕ) : ℤ[X] :=
 vNexprMDE6 X (X^(n+1)) a r s (vAJMDE6 n) (vBJMDE6 n)
   (vFJMDE6 n) (vAJMDE6 (n+1)) (vBJMDE6 (n+1))

theorem vNscalarMDE6 (x t a r s A B F A' B' : ℝ) (hx : x≠0) (ht : t≠0) :
 let D := (a-r)*(A/t)+r*(A'/(t*x))
 let K := (a-r)*(2*(B/t)-(A/t)^2)+r*(2*(B'/(t*x))-(A'/(t*x))^2)+
   2*x*(a*(F/t)^2+2*r*(F/t)*(2/(t*x))+s*(2/(t*x))^2)
 (t*x)^2*(D^2+K-2*(x+1)*D+2*(x+1)^2)=vNexprMDE6 x t a r s A B F A' B' := by
 dsimp [vNexprMDE6]
 field_simp
 <;> ring

theorem vRun_eval_aMDE6 (x : ℝ) (n i : ℕ) :
 eval₂ (Int.castRingHom ℝ) x ((vKwordM9E1 (X:ℤ[X]) (runBlock025 n)).a.coeff i)=
 (vRunMDE6 x n).a.coeff i := by
 have h := congrArg (fun m : Mat16 ℝ[X] => m.a.coeff i)
   (vEval_wordMDE6 x (runBlock025 n))
 simpa only [hmapM13D,vEval_coeffMDE6,vRunMDE6] using h
theorem vRun_eval_bMDE6 (x : ℝ) (n i : ℕ) :
 eval₂ (Int.castRingHom ℝ) x ((vKwordM9E1 (X:ℤ[X]) (runBlock025 n)).b.coeff i)=
 (vRunMDE6 x n).b.coeff i := by
 have h := congrArg (fun m : Mat16 ℝ[X] => m.b.coeff i)
   (vEval_wordMDE6 x (runBlock025 n))
 simpa only [hmapM13D,vEval_coeffMDE6,vRunMDE6] using h

theorem vNseed_evalMDE6 (x : ℝ) (hx : x≠0) (n a r s : ℕ) :
 x^(2*n+4)*vSecondMomentMDE6 x n a r s=
 eval₂ (Int.castRingHom ℝ) x (vNseedMDE6 n a r s) := by
 have h := vNscalarMDE6 x (x^(n+1)) a r s
   ((vRunMDE6 x n).a.coeff 1) ((vRunMDE6 x n).a.coeff 2)
   ((vRunMDE6 x n).b.coeff 1) ((vRunMDE6 x (n+1)).a.coeff 1)
   ((vRunMDE6 x (n+1)).a.coeff 2) hx (pow_ne_zero _ hx)
 have hp : x^(2*n+4)=(x^(n+1)*x)^2 := by
   rw [←pow_succ,←pow_mul]; congr 1; omega
 simp only [vNseedMDE6,vNexprMDE6,eval₂_add,eval₂_sub,eval₂_mul,eval₂_pow,
   eval₂_X,eval₂_natCast,eval₂_ofNat,eval₂_one,vAJMDE6,vBJMDE6,vFJMDE6,
   vRun_eval_aMDE6,vRun_eval_bMDE6]
 rw [hp]
 simpa only [vSecondMomentMDE6,vAlphaMDE6,vBetaMDE6,vFMDE6,
   show n+2=(n+1)+1 by omega,pow_succ,vNexprMDE6] using h

end
end MathGKM.Markov
