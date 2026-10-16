import MarkovSecondRowMF52
import MarkovSecondSmall8934
/-! Machine-authored f52ba141. All A-core-B words, raw second horizontal row.
No source-balance hypothesis, denominator cutoff, or deleted zero is used. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

theorem shifted_adjacentMF52 (p q : ℝ[X]) (a : ℕ) (he : 2*p=X^a*q)
 (hq : ∀ i : ℕ, q.coeff i*q.coeff (i+2) ≤ q.coeff (i+1)^2) (i : ℕ) :
 p.coeff i*p.coeff (i+2) ≤ p.coeff (i+1)^2 := by
 have hc (k : ℕ) : 2*p.coeff k=if a ≤ k then q.coeff (k-a) else 0 := by
   have h := congrArg (fun f : ℝ[X] => f.coeff k) he
   simpa only [Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow_mul'] using h
 by_cases hi : a ≤ i
 · have h0 := hc i
   have h1 := hc (i+1)
   have h2 := hc (i+2)
   rw [if_pos hi] at h0
   rw [if_pos (by omega : a ≤ i+1)] at h1
   rw [if_pos (by omega : a ≤ i+2)] at h2
   have h := hq (i-a)
   rw [show i-a+1=i+1-a by omega,show i-a+2=i+2-a by omega,←h0,←h1,←h2] at h
   nlinarith only [h]
 · have h := hc i
   rw [if_neg hi] at h
   have hz : p.coeff i=0 := by linarith
   rw [hz,zero_mul]
   positivity

theorem hword_second_allMF52 (w : List Bool) (i : ℕ) :
 ((hword46 (X:ℤ[X]) w).coeff 2).coeff i*
 ((hword46 (X:ℤ[X]) w).coeff 2).coeff (i+2) ≤
 ((hword46 (X:ℤ[X]) w).coeff 2).coeff (i+1)^2 := by
 by_cases hn : 3 ≤ w.length
 · cases w with
   | nil => simp at hn
   | cons e w =>
     have he := word_second8934 e w hn
     have hm := congrArg (Polynomial.map (Int.castRingHom ℝ)) he
     simp only [Polynomial.map_mul,Polynomial.map_ofNat,Polynomial.map_pow,
       Polynomial.map_add,Polynomial.map_X,Polynomial.map_one,secondExpr_map8934] at hm
     have he' : 2*((hword46 (X:ℤ[X]) (e::w)).coeff 2).map (Int.castRingHom ℝ)=
       X^((e::w).count true)*secondRow340 (e::w).length ((e::w).count true) (stat8934 e w) := by
       simpa [secondRow340,add_comm,mul_assoc] using hm
     have h := shifted_adjacentMF52 _ _ _ he'
       (second_row_allMF52 _ _ _ · hn (stat_bound8934 e w)) i
     simp only [Polynomial.coeff_map] at h
     exact_mod_cast h
 · have h := crossLC_adjacent (second_small_crossLC8934 w (by omega)) (i+1)
   have h' :
     ((((hword46 (X:ℤ[X]) w).coeff 2).map (Int.castRingHom ℝ)).coeff i)*
     ((((hword46 (X:ℤ[X]) w).coeff 2).map (Int.castRingHom ℝ)).coeff (i+2)) ≤
     ((((hword46 (X:ℤ[X]) w).coeff 2).map (Int.castRingHom ℝ)).coeff (i+1))^2 := by
     simpa [CoeffSeq,show ¬(i:ℤ)<0 by omega,show ¬(i:ℤ)+1<0 by omega,
       show ¬(i:ℤ)+1+1<0 by omega,show ((i:ℤ)+1+1).toNat=i+2 by omega] using h
   simp only [Polynomial.coeff_map] at h'
   exact_mod_cast h'

theorem raw_word_second_allMF52 (w : List Bool) (i : ℕ) :
 let P := (rawWord80 (false::(w++[true]))).b
 coeff P i 2*coeff P (i+2) 2 ≤ coeff P (i+1) 2^2 := by
 have h := hword_second_allMF52 w i
 rw [←hword_raw46] at h
 simpa only [swap_coeff46] using h

theorem source_second_via_wordMF52 (path : List Bool) (i : ℕ) :
 coeff (frame path).mid.p i 2*coeff (frame path).mid.p (i+2) 2 ≤
 coeff (frame path).mid.p (i+1) 2^2 := by
 obtain ⟨w,_,_,he⟩ := source_hword46 path
 have h := hword_second_allMF52 w i
 rw [←he] at h
 simpa only [swap_coeff46] using h
end
end MathGKM.Markov
