import MarkovVerticalGeneralProjectionMDE6
/-! Machine-authored de6168c6. Symmetry and first jets of all vertical blocks. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false

theorem vRun_stepMDE6 (x : ℝ) (n : ℕ) :
 vRunMDE6 x (n+1)=mm16 (vKaM9E1 x) (vRunMDE6 x n) := by
 simp only [vRunMDE6,runBlock025,List.replicate_succ,List.cons_append,
   vKwordM9E1,List.map_cons,projProduct6905,vKletterM9E1,Bool.false_eq_true,if_false]

theorem vRun_symMDE6 (x : ℝ) (n : ℕ) :
 (vRunMDE6 x n).c=C x*(vRunMDE6 x n).b ∧
 C (x+1)*X*(vRunMDE6 x n).a+C (1-x)*(1+C (x+1)*X)*(vRunMDE6 x n).b-
 (2+C (x+1)*X)*(vRunMDE6 x n).d=0 := by
 induction n with
 | zero =>
   constructor <;>
     simp [vRunMDE6,runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
       vKaM9E1,vKcM9E1,mm16,map_add,map_sub] <;> ring
 | succ n ih =>
   rw [vRun_stepMDE6]
   simp only [mm16,vKaM9E1]
   simp only [map_add,map_sub,map_one] at ih ⊢
   constructor
   · linear_combination (1+(C x+1)*X)*ih.1+C x*ih.2
   · linear_combination ((C x+1)*X)*(2+(C x+1)*X)*ih.1+
       C x*(1+(C x+1)*X)*ih.2

theorem vRun_firstMDE6 (x : ℝ) (n : ℕ) :
 (vRunMDE6 x n).d.coeff 1=1 ∧
 (vRunMDE6 x (n+1)).b.coeff 1=x*(vRunMDE6 x n).b.coeff 1+2 := by
 have hd : ∀ n, (vRunMDE6 x n).d.coeff 1=1 := by
   intro n
   induction n with
   | zero =>
     norm_num [vRunMDE6,runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
       vKaM9E1,vKcM9E1,mm16,coeff_mul_one46,Polynomial.mul_coeff_zero,
       Polynomial.coeff_one,Polynomial.coeff_X]
   | succ n ih =>
     rw [vRun_stepMDE6]
     simp [mm16,vKaM9E1,coeff_mul_one46,Polynomial.mul_coeff_zero,
       Polynomial.coeff_one,Polynomial.coeff_X,ih,
       (vRun_zeroMDE6 x n).2.1,(vRun_zeroMDE6 x n).2.2.2]
 refine ⟨hd n,?_⟩
 rw [vRun_stepMDE6]
 simp [mm16,vKaM9E1,coeff_mul_one46,Polynomial.mul_coeff_zero,
   Polynomial.coeff_one,Polynomial.coeff_X,hd n,
   (vRun_zeroMDE6 x n).2.1,(vRun_zeroMDE6 x n).2.2.2]

def vAlphaMDE6 (x : ℝ) (n : ℕ) := (vRunMDE6 x n).a.coeff 1/x^(n+1)
def vBetaMDE6 (x : ℝ) (n : ℕ) := (vRunMDE6 x n).a.coeff 2/x^(n+1)
def vFMDE6 (x : ℝ) (n : ℕ) := (vRunMDE6 x n).b.coeff 1/x^(n+1)

theorem vF_stepMDE6 (x : ℝ) (hx : x≠0) (n : ℕ) :
 vFMDE6 x (n+1)-vFMDE6 x n=2/x^(n+2) := by
 unfold vFMDE6
 rw [(vRun_firstMDE6 x n).2]
 rw [show n+1+1=n+2 by omega,show n+2=(n+1)+1 by omega,pow_succ]
 field_simp
 <;> ring

theorem vGeneral_jetsMDE6 (x : ℝ) (n : ℕ) (r : Bool) :
 (vGeneralProjMDE6 x n r).d.coeff 1=(if r then vAlphaMDE6 x n else vAlphaMDE6 x (n+1)) ∧
 (vGeneralProjMDE6 x n r).d.coeff 2=(if r then vBetaMDE6 x n else vBetaMDE6 x (n+1)) ∧
 (vGeneralProjMDE6 x n r).c.coeff 1=(if r then vFMDE6 x n else vFMDE6 x (n+1)) ∧
 (vGeneralProjMDE6 x n r).b.coeff 1=x*(if r then vFMDE6 x n else vFMDE6 x (n+1)) := by
 have hc (n : ℕ) : (vRunMDE6 x n).c.coeff 1=x*(vRunMDE6 x n).b.coeff 1 := by
   rw [(vRun_symMDE6 x n).1,Polynomial.coeff_C_mul]
 cases r <;>
   simp [vGeneralProjMDE6,hscaleM13D,vswapMDE6,Polynomial.coeff_C_mul,
     vAlphaMDE6,vBetaMDE6,vFMDE6,hc,div_eq_mul_inv,mul_comm,mul_left_comm,mul_assoc]

end
end MathGKM.Markov
