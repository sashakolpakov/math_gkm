import MarkovSmallHorizontal2_3M9E1
import MarkovSmallHorizontal3_4M9E1
import MarkovSmallHorizontal3_5M9E1
import MarkovSmallHorizontal4_5M9E1
import MarkovSmallHorizontal4_7M9E1
import MarkovSmallHorizontal5_6M9E1
import MarkovSmallHorizontal5_7M9E1
import MarkovSmallHorizontal5_8M9E1
import MarkovSmallHorizontal6_7M9E1
import MarkovSmallHorizontal7_8M9E1
import MarkovUnique098
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 18000
set_option linter.unusedSimpArgs false
theorem high_small_2_3M81F (i : ℕ) (hi : i ≤ 4) :
 coeff (frame [true]).mid.p i 2*coeff (frame [true]).mid.p i 4 ≤ coeff (frame [true]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_2_3M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
theorem high_small_3_4M81F (i : ℕ) (hi : i ≤ 6) :
 coeff (frame [true,true]).mid.p i 2*coeff (frame [true,true]).mid.p i 4 ≤ coeff (frame [true,true]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_3_4M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
theorem high_small_3_5M81F (i : ℕ) (hi : i ≤ 7) :
 coeff (frame [true,false]).mid.p i 2*coeff (frame [true,false]).mid.p i 4 ≤ coeff (frame [true,false]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_3_5M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
theorem high_small_4_5M81F (i : ℕ) (hi : i ≤ 8) :
 coeff (frame [true,true,true]).mid.p i 2*coeff (frame [true,true,true]).mid.p i 4 ≤ coeff (frame [true,true,true]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_4_5M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
theorem high_small_4_7M81F (i : ℕ) (hi : i ≤ 10) :
 coeff (frame [true,false,false]).mid.p i 2*coeff (frame [true,false,false]).mid.p i 4 ≤ coeff (frame [true,false,false]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_4_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
theorem high_small_5_6M81F (i : ℕ) (hi : i ≤ 10) :
 coeff (frame [true,true,true,true]).mid.p i 2*coeff (frame [true,true,true,true]).mid.p i 4 ≤ coeff (frame [true,true,true,true]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_5_6M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
theorem high_small_5_7M81F (i : ℕ) (hi : i ≤ 11) :
 coeff (frame [true,true,false]).mid.p i 2*coeff (frame [true,true,false]).mid.p i 4 ≤ coeff (frame [true,true,false]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_5_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
theorem high_small_5_8M81F (i : ℕ) (hi : i ≤ 12) :
 coeff (frame [true,false,true]).mid.p i 2*coeff (frame [true,false,true]).mid.p i 4 ≤ coeff (frame [true,false,true]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_5_8M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
theorem high_small_6_7M81F (i : ℕ) (hi : i ≤ 12) :
 coeff (frame [true,true,true,true,true]).mid.p i 2*coeff (frame [true,true,true,true,true]).mid.p i 4 ≤ coeff (frame [true,true,true,true,true]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_6_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
theorem high_small_7_8M81F (i : ℕ) (hi : i ≤ 14) :
 coeff (frame [true,true,true,true,true,true]).mid.p i 2*coeff (frame [true,true,true,true,true,true]).mid.p i 4 ≤ coeff (frame [true,true,true,true,true,true]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_7_8M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
theorem source_high_smallM81F (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : (frame path).mid.b ≤ 8) (hs : (frame path).mid.b < 2*(frame path).mid.a)
 (i : ℕ) (hi : i ≤ (frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i 2*coeff (frame path).mid.p i 4 ≤ coeff (frame path).mid.p i 3^2 := by
 obtain ⟨ha0,hab,hc⟩ := frame_reduced path
 generalize hea : (frame path).mid.a=a at *
 generalize heb : (frame path).mid.b=b at *
 have ha7 : a ≤ 7 := by omega
 have hb0 : 3 ≤ b := by omega
 interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *
 · have hp : path=[true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact high_small_2_3M81F i hi
 · have hp : path=[true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact high_small_3_4M81F i hi
 · have hp : path=[true,false] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact high_small_3_5M81F i hi
 · have hp : path=[true,true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact high_small_4_5M81F i hi
 · have hp : path=[true,false,false] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact high_small_4_7M81F i hi
 · have hp : path=[true,true,true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact high_small_5_6M81F i hi
 · have hp : path=[true,true,false] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact high_small_5_7M81F i hi
 · have hp : path=[true,false,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact high_small_5_8M81F i hi
 · have hp : path=[true,true,true,true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact high_small_6_7M81F i hi
 · have hp : path=[true,true,true,true,true,true] := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact high_small_7_8M81F i hi
end
end MathGKM.Markov
