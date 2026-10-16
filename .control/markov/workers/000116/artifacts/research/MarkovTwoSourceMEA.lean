import MarkovTwoMomentMEA
import MarkovSmallLC21MEA
/-! Machine-authored ead8a96f. Universal a=2 source correction and raw LC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame

theorem vertical_two_residualMEA (n : ℕ) :
 2*X*vresidualM9E1 (List.replicate n false++[true]) 2=
 vNseedMDE6 n 2 1 0+2*X := by
 apply Polynomial.map_injective (Int.castRingHom ℝ) (Int.cast_injective (α:=ℝ))
 apply Polynomial.eq_of_infinite_eval_eq
 apply (Set.Ioi_infinite (0:ℝ)).mono
 intro x hx
 have hv := vertical_two_candidateMEA n x (ne_of_gt hx)
 dsimp only at hv
 have hs := vNseed_evalMDE6 x (ne_of_gt hx) n 2 1 0
 have hp : x^(2*n+4)=x*x^(2*n+3) := by
   rw [←pow_succ']
 rw [hp] at hs
 simp only [Polynomial.eval_map,eval₂_add,eval₂_mul,eval₂_ofNat,eval₂_X]
 change 2*x*eval₂ (Int.castRingHom ℝ) x (vresidualM9E1 (List.replicate n false++[true]) 2)=
   eval₂ (Int.castRingHom ℝ) x (vNseedMDE6 n 2 1 0)+2*x
 linear_combination x*hv+hs

theorem vertical_two_clearedMEA (n : ℕ) :
 let path := List.replicate n false++[true]
 2*X*(1+X)^3*((frame path).mid.p).coeff 2=vNseedMDE6 n 2 1 0+2*X := by
 dsimp only
 let path := List.replicate n false++[true]
 have hi : (frame path).mid.a=2 := by
   have h := (source_vertical_indicesMDE6 n []).1
   simpa only [show (frame []).mid.b=2 by simp [frame,initial]] using h
 have hc := vertical_all_order_clearedM9E1 path 2
 rw [hi] at hc
 norm_num only at hc
 rw [add_comm X 1] at hc
 have hf := vertical_two_residualMEA n
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ hn
 linear_combination 2*X*hc+(1+X)*hf

theorem s21sourceMEA (n : ℕ) :
 let path := List.replicate n false++[true]
 (1-X)^4*(2*X*((frame path).mid.p).coeff 2)=
 s21J0MEA (n+1:ℤ[X]) X+X^(n+1)*s21J1MEA (n+1:ℤ[X]) X+
   X^(2*(n+1))*s21J2MEA (n+1:ℤ[X]) X := by
 dsimp only
 have hf := vertical_two_clearedMEA n
 dsimp only at hf
 have hs := vN_sparseM758 n 2 1 0
 norm_num only [Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero] at hs
 have h0 := s21block0MEA (n+1:ℤ[X]) X
 have h1 := s21block1MEA (n+1:ℤ[X]) X
 have h2 := s21block2MEA (n+1:ℤ[X]) X
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero 3 hn)
 linear_combination (1-X)^4*hf+hs-h0-X^(n+1)*h1-X^(2*(n+1))*h2

theorem s21rawMEA (n : ℕ) (hn : 1 ≤ n) (j : ℕ) :
 let path := List.replicate n false++[true]
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++[true]
 have hc (k : ℕ) : 12*coeff (frame path).mid.p 2 k=
   s21EMEA (n+1) ((k:ℤ)+1) := by
   have h := s21coeffMEA (2*X*((frame path).mid.p).coeff 2) 0 (n+1) (k+1)
     (by simpa using s21sourceMEA n)
   simp only [Nat.cast_add,Nat.cast_one,Nat.cast_zero,sub_zero,mul_assoc] at h
   simp only [show (2:ℤ[X])=C (2:ℤ) from rfl,Polynomial.coeff_C_mul] at h
   rw [Polynomial.coeff_X_mul] at h
   change 6*(2*coeff (frame path).mid.p 2 k)=_ at h
   linear_combination h
 have h0 := hc j
 have h1 := hc (j+1)
 have h2 := hc (j+2)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 have hh : s21EMEA (n+1) ((j:ℤ)+1)*s21EMEA (n+1) ((j+2)+1) ≤
   s21EMEA (n+1) ((j+1)+1)^2 := by
   convert s21adjacentMEA (n+1) ((j+1)+1) (by omega) using 1 <;> congr 1 <;> congr 1 <;> ring
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem vertical_second_twoMEA (path : List Bool)
 (ha : (frame path).mid.a=2) (j : ℕ) :
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩ | ⟨n,rest,rfl⟩
 · have h := (source_left_spine_indicesMDE6 n).1
   omega
 · have hi := (source_vertical_indicesMDE6 n rest).1
   have hb : (frame rest).mid.b=2 := by omega
   obtain ⟨ha0,hab,_⟩ := frame_reduced rest
   have hp : rest=[] := frame_path_injective_098
     ((show (frame rest).mid.a=1 by omega).trans (by simp [frame,initial]))
     (hb.trans (by simp [frame,initial]))
   subst rest
   by_cases hn : n=0
   · subst n
     simpa using vertical_second_right_allMDE6 [] j
   · exact s21rawMEA n (by omega) j
end
end MathGKM.Markov
