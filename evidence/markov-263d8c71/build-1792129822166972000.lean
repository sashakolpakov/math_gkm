import MarkovTerminalRowM263
import MarkovTerminalSmallM263
import MarkovSecondWordMF52
/-! Machine-authored 263d8c71. Universal raw second rows for all A-starting words.
This enlarges the source family but does not close a new source residual region. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem terminal_expr_mapM263 (n m t : ℕ) (r : Bool) :
 (terminalExprM263 (X : ℤ[X]) n m t (if r then 1 else 0)).map (Int.castRingHom ℝ)=
 CubicPoly5a7 (4*t) (terminalBM263 m (if r then 1 else 0))
   (terminalCM263 n m) (terminalDM263 n m) := by
 cases r <;> simp [terminalExprM263,CubicPoly5a7,terminalBM263,terminalCM263,
   terminalDM263,Polynomial.map_add,Polynomial.map_sub,Polynomial.map_mul,
   Polynomial.map_pow,Polynomial.map_natCast,Polynomial.map_X] <;> ring

theorem terminal_second_allM263 (w : List Bool) (i : ℕ) :
 ((terminalWordM263 (X : ℤ[X]) w).coeff 2).coeff i*
 ((terminalWordM263 (X : ℤ[X]) w).coeff 2).coeff (i+2) ≤
 ((terminalWordM263 (X : ℤ[X]) w).coeff 2).coeff (i+1)^2 := by
 by_cases hn : 3 ≤ w.length
 · cases w with
   | nil => simp at hn
   | cons e w =>
     have he := terminal_formulaM263 e w hn
     have hm := congrArg (Polynomial.map (Int.castRingHom ℝ)) he
     simp only [Polynomial.map_mul,Polynomial.map_ofNat,Polynomial.map_pow,
       Polynomial.map_add,Polynomial.map_X,Polynomial.map_one,terminal_expr_mapM263] at hm
     let p := ((terminalWordM263 (X : ℤ[X]) (e::w)).coeff 2).map (Int.castRingHom ℝ)
     let r : ℕ := if last8934 e w then 1 else 0
     have hr : r ≤ 1 := by dsimp [r]; split <;> omega
     have he' : 2*(X*p)=X^((e::w).count true)*
         terminalRowM263 (e::w).length ((e::w).count true) (terminalStatM263 e w) r := by
       simpa [terminalRowM263,p,r,add_comm,mul_assoc] using hm
     have hh := shifted_adjacentMF52 _ _ _ he'
       (terminal_row_allM263 _ _ _ _ · hn (terminal_stat_boundM263 e w) hr) (i+1)
     have hh' : p.coeff i*p.coeff (i+2) ≤ p.coeff (i+1)^2 := by
       simpa [Polynomial.coeff_X_mul,show i+1+2-1=i+2 by omega,
         show i+1+1-1=i+1 by omega] using hh
     simp only [p,Polynomial.coeff_map,Int.coe_castRingHom] at hh'
     exact_mod_cast hh'
 · have h := crossLC_adjacent (terminal_small_crossM263 w (by omega)) (i+1)
   have h' :
     ((((terminalWordM263 (X:ℤ[X]) w).coeff 2).map (Int.castRingHom ℝ)).coeff i)*
     ((((terminalWordM263 (X:ℤ[X]) w).coeff 2).map (Int.castRingHom ℝ)).coeff (i+2)) ≤
     ((((terminalWordM263 (X:ℤ[X]) w).coeff 2).map (Int.castRingHom ℝ)).coeff (i+1))^2 := by
     simpa [CoeffSeq,show ¬(i:ℤ)<0 by omega,show ¬(i:ℤ)+1<0 by omega,
       show ¬(i:ℤ)+1+1<0 by omega,show ((i:ℤ)+1+1).toNat=i+2 by omega] using h
   simp only [Polynomial.coeff_map,Int.coe_castRingHom] at h'
   exact_mod_cast h'

theorem raw_terminal_secondM263 (w : List Bool) (i : ℕ) :
 coeff (rawWord80 (false::(w++[false]))).b i 2*
 coeff (rawWord80 (false::(w++[false]))).b (i+2) 2 ≤
 coeff (rawWord80 (false::(w++[false]))).b (i+1) 2^2 := by
 have h := terminal_second_allM263 w i
 rw [←terminal_rawM263] at h
 simpa only [swap_coeff46] using h

theorem raw_starting_secondM263 (w : List Bool) (i : ℕ) :
 coeff (rawWord80 (false::w)).b i 2*coeff (rawWord80 (false::w)).b (i+2) 2 ≤
 coeff (rawWord80 (false::w)).b (i+1) 2^2 := by
 induction w using List.reverseRecOn with
 | nil => simp [rawWord80,rawA18,mm_one_right774,coeff,Polynomial.coeff_one]
 | append_singleton w r _ =>
   cases r
   · exact raw_terminal_secondM263 w i
   · exact raw_word_second_allMF52 w i

end
end MathGKM.Markov
