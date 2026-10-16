import MarkovSecondWord8934
/-! Machine-authored 263d8c71. Integral terminal-A row identity, no LC premise. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

def terminalWordM263 {R : Type*} [CommRing R] (x : R) (w : List Bool) : Polynomial R :=
 let p := w.foldl (hrowStep46 x) (X,1)
 p.1+C (x+1)*p.2

def terminalStatM263 (e : Bool) (w : List Bool) : ℕ :=
 (if e then 1 else 0)+2*adj8934 e w

def terminalExprM263 {R : Type*} [CommRing R] (x n m t r : R) : R :=
 4*t+(9*m^2+7*m+2-4*r)*x+(6*m^2+6*m*n+4*n)*x^2+
 (m+n)*(m+n+1)*x^3

theorem terminal_stat_boundM263 (e : Bool) (w : List Bool) :
 terminalStatM263 e w+(if last8934 e w then 1 else 0) ≤ 2*(e::w).count true := by
 have h := stat_bound8934 e w
 simpa [terminalStatM263,stat8934,add_comm,add_left_comm,add_assoc] using h

theorem terminal_scaledM263 {R : Type*} [CommRing R] (x : R) (e : Bool) (w : List Bool) :
 2*x*(x+1)^3*(terminalWordM263 x (e::w)).coeff 2 =
 x^((e::w).count true)*(x+1)^(e::w).length*
 terminalExprM263 x (e::w).length ((e::w).count true) (terminalStatM263 e w)
   (if last8934 e w then 1 else 0) := by
 have h := hjet_fold8934 x 1 (if e then 1 else 0) e 0 e _ (hjet_init8934 x e) w
 have hs := h.2.2
 rw [h.1.2.1] at hs
 cases e <;>
   simpa [terminalWordM263,terminalExprM263,terminalStatM263,jetExpr8934,
     Polynomial.coeff_add,Polynomial.coeff_C_mul,List.count_cons,
     add_comm,add_left_comm,add_assoc,mul_add,mul_assoc] using hs

theorem terminal_formulaM263 (e : Bool) (w : List Bool) (hn : 3 ≤ (e::w).length) :
 2*(X*(terminalWordM263 (X : ℤ[X]) (e::w)).coeff 2)=
 X^((e::w).count true)*(X+1)^((e::w).length-3)*
 terminalExprM263 X (e::w).length ((e::w).count true) (terminalStatM263 e w)
   (if last8934 e w then 1 else 0) := by
 have hz : (X+1 : ℤ[X])^3 ≠ 0 := pow_ne_zero _ (X_add_C_ne_zero (1:ℤ))
 apply mul_left_cancel₀ hz
 have he : (X+1 : ℤ[X])^(e::w).length=
     (X+1)^3*(X+1)^((e::w).length-3) := by
   rw [←pow_add]; congr 1; omega
 have h := terminal_scaledM263 (X : ℤ[X]) e w
 rw [he] at h
 linear_combination h

theorem terminal_rawM263 (w : List Bool) :
 Bivariate.swap (rawWord80 (false::(w++[false]))).b=terminalWordM263 (X : ℤ[X]) w := by
 have hr := hrow_fold_matrix46 w rawA18
 simp only [rawA18,V,Bivariate.swap_X,map_one] at hr
 rw [terminalWordM263,hr]
 simp only [rawWord80,if_false,rawWord_append80,mm_one_right774]
 rw [←mm_assoc16]
 simp [mm16,rawA18,S,U,V,map_add,map_mul,Bivariate.swap_X,Bivariate.swap_Y]
 ring

end
end MathGKM.Markov
