import MarkovSmallHorizontal2_3M9E1
import MarkovSmallHorizontal2_5M9E1
import MarkovSmallHorizontal3_4M9E1
import MarkovSmallHorizontal3_5M9E1
import MarkovSmallHorizontal4_5M9E1
import MarkovSmallHorizontal5_6M9E1
import MarkovUnique098
/-! Machine-authored ce882be3. All small source strip exceptions. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 15000

theorem small_strip_2_3MCE8 (i : ℕ) (hi : i ≤ 4) :
 coeff (frame [true]).mid.p i 1*coeff (frame [true]).mid.p i 3 ≤ coeff (frame [true]).mid.p i 2^2 := by
 simp only [←swap_coeff46,small_poly_2_3M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_strip_2_5MCE8 (i : ℕ) (hi : i ≤ 6) :
 coeff (frame [false,true]).mid.p i 1*coeff (frame [false,true]).mid.p i 3 ≤ coeff (frame [false,true]).mid.p i 2^2 := by
 simp only [←swap_coeff46,small_poly_2_5M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_strip_3_4MCE8 (i : ℕ) (hi : i ≤ 6) :
 coeff (frame [true,true]).mid.p i 1*coeff (frame [true,true]).mid.p i 3 ≤ coeff (frame [true,true]).mid.p i 2^2 := by
 simp only [←swap_coeff46,small_poly_3_4M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_strip_3_5MCE8 (i : ℕ) (hi : i ≤ 7) :
 coeff (frame [true,false]).mid.p i 1*coeff (frame [true,false]).mid.p i 3 ≤ coeff (frame [true,false]).mid.p i 2^2 := by
 simp only [←swap_coeff46,small_poly_3_5M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_strip_4_5MCE8 (i : ℕ) (hi : i ≤ 8) :
 coeff (frame [true,true,true]).mid.p i 1*coeff (frame [true,true,true]).mid.p i 3 ≤ coeff (frame [true,true,true]).mid.p i 2^2 := by
 simp only [←swap_coeff46,small_poly_4_5M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem small_strip_5_6MCE8 (i : ℕ) (hi : i ≤ 10) :
 coeff (frame [true,true,true,true]).mid.p i 1*coeff (frame [true,true,true,true]).mid.p i 3 ≤ coeff (frame [true,true,true,true]).mid.p i 2^2 := by
 simp only [←swap_coeff46,small_poly_5_6M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]

theorem source_strip_smallMCE8 (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : (frame path).mid.b ≤ 6) (i : ℕ) (hi : i ≤ (frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i 1*coeff (frame path).mid.p i 3 ≤ coeff (frame path).mid.p i 2^2 := by
 obtain ⟨ha0,hab,hc⟩ := frame_reduced path
 generalize hea : (frame path).mid.a=a at *
 generalize heb : (frame path).mid.b=b at *
 have ha6 : a ≤ 5 := by omega
 have hb0 : 3 ≤ b := by omega
 interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *
 · have hp : path=[true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact small_strip_2_3MCE8 i hi
 · have hp : path=[false,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact small_strip_2_5MCE8 i hi
 · have hp : path=[true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact small_strip_3_4MCE8 i hi
 · have hp : path=[true,false] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact small_strip_3_5MCE8 i hi
 · have hp : path=[true,true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact small_strip_4_5MCE8 i hi
 · have hp : path=[true,true,true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact small_strip_5_6MCE8 i hi
end
end MathGKM.Markov
