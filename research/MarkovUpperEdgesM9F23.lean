import MarkovUpperThreeM9F23
/-! Machine-authored 9f234835. Two unbounded polynomial certificates for
the exceptional upper diagonal starts one and two. -/
namespace MathGKM.Markov
open Finset Polynomial
set_option maxHeartbeats 10000000
local infixl:65 " +ₑ " => PolyExprM6C0.add
local infixl:70 " *ₑ " => PolyExprM6C0.mul

def upperEdgeGapM9F23 (second : Bool) : PolyExprM6C0 :=
 let a := if second then .c 4 *ₑ (.k +ₑ .c 1) *ₑ chooseExprM6C0 (.k +ₑ .x +ₑ .c 10) 2
   else .c 4 *ₑ (.x +ₑ .c 7)
 let b := if second then topExprM9F23 (.k +ₑ .x +ₑ .c 6) (.k +ₑ .c 1) 0
   else .c 4 *ₑ (.k +ₑ .c 2) *ₑ chooseExprM6C0 (.k +ₑ .x +ₑ .c 8) 2
 let c := topExprM9F23 (.k +ₑ .x +ₑ .c 4) (.k +ₑ .c 2) (if second then 1 else 0)
 b *ₑ b +ₑ .c (-1) *ₑ (a *ₑ c)

set_option maxHeartbeats 400000000 in
set_option maxRecDepth 1000000 in
set_option compiler.extract_closed false in
theorem upper_edge_cert_oneM9F23 :
 denseNonnegM6C0 (exprDenseM6C0 (upperEdgeGapM9F23 false)) := by decide +kernel

set_option maxHeartbeats 400000000 in
set_option maxRecDepth 1000000 in
set_option compiler.extract_closed false in
theorem upper_edge_cert_twoM9F23 :
 denseNonnegM6C0 (exprDenseM6C0 (upperEdgeGapM9F23 true)) := by decide +kernel

theorem top_mass_castM9F23 (h T c : ℕ) :
 topShortQME10 (h:ℚ) (T:ℚ) c=(topMassME10 h T c:ℚ) := by
 rw [←top_short_castME10,←top_shift_shortME10]

theorem upper_edge_one_arithmeticM9F23 (e k : ℕ) :
 (4*((e:ℤ)+7))*topMassME10 (k+e+4) (k+2) 0 ≤
 (4*((k:ℤ)+2)*((k+e+8).choose 2:ℤ))^2 := by
 have h := expr_nonneg_certificateM6C0 _ upper_edge_cert_oneM9F23 (e:ℚ) (k:ℚ)
   (by positivity) (by positivity)
 simp only [upperEdgeGapM9F23,exprEvalM6C0,Bool.false_eq_true,if_false,
   choose_expr_evalM6C0,top_expr_evalM9F23] at h
 have hm := top_mass_castM9F23 (k+e+4) (k+2) 0
 have hc := choose_poly_natM0D3 (k+e+8) 2
 push_cast at hm hc
 rw [hm,←hc] at h
 have hh : (4*((e:ℚ)+7))*(topMassME10 (k+e+4) (k+2) 0:ℚ) ≤
   (4*((k:ℚ)+2)*((k+e+8).choose 2:ℚ))^2 := by nlinarith only [h]
 exact_mod_cast hh

theorem upper_edge_two_arithmeticM9F23 (e k : ℕ) :
 (4*((k:ℤ)+1)*((k+e+10).choose 2:ℤ))*topMassME10 (k+e+4) (k+2) 1 ≤
 topMassME10 (k+e+6) (k+1) 0^2 := by
 have h := expr_nonneg_certificateM6C0 _ upper_edge_cert_twoM9F23 (e:ℚ) (k:ℚ)
   (by positivity) (by positivity)
 simp only [upperEdgeGapM9F23,exprEvalM6C0,if_true,
   choose_expr_evalM6C0,top_expr_evalM9F23] at h
 have hm := top_mass_castM9F23 (k+e+4) (k+2) 1
 have hm1 := top_mass_castM9F23 (k+e+6) (k+1) 0
 have hc := choose_poly_natM0D3 (k+e+10) 2
 push_cast at hm hm1 hc
 rw [hm,hm1,←hc] at h
 have hh : (4*((k:ℚ)+1)*((k+e+10).choose 2:ℚ))*(topMassME10 (k+e+4) (k+2) 1:ℚ) ≤
   (topMassME10 (k+e+6) (k+1) 0:ℚ)^2 := by nlinarith only [h]
 exact_mod_cast hh

theorem upper_template_edge_oneM9F23 (e k : ℕ) :
 (topTemplateMB3E (3*k+e+10) (k+3)).coeff 1*
 (topTemplateMB3E (3*k+e+10) (k+5)).coeff 3 ≤
 (topTemplateMB3E (3*k+e+10) (k+4)).coeff 2^2 := by
 have h0 := (top_edge_coeffsMB3E (3*k+e+10) (k+3) (by omega) (by omega)).2.1
 have h1 := (top_edge_coeffsMB3E (3*k+e+10) (k+4) (by omega) (by omega)).2.2
 have h2 := top_shift_massME10 (k+e+4) (k+2) 0
 norm_num only [Nat.zero_add,show 2*(k+2)+(k+e+4)+2=3*k+e+10 by omega,
   show k+2+3=k+5 by omega] at h2
 rw [h0,h1,h2,show 3*k+e+10-2*(k+4)+6=k+e+8 by omega]
 convert upper_edge_one_arithmeticM9F23 e k using 1 <;> push_cast <;> ring

theorem upper_template_edge_twoM9F23 (e k : ℕ) :
 (topTemplateMB3E (3*k+e+10) (k+3)).coeff 2*
 (topTemplateMB3E (3*k+e+10) (k+5)).coeff 4 ≤
 (topTemplateMB3E (3*k+e+10) (k+4)).coeff 3^2 := by
 have h0 := (top_edge_coeffsMB3E (3*k+e+10) (k+3) (by omega) (by omega)).2.2
 have h1 := top_shift_massME10 (k+e+6) (k+1) 0
 have h2 := top_shift_massME10 (k+e+4) (k+2) 1
 norm_num only [Nat.zero_add,show 2*(k+1)+(k+e+6)+2=3*k+e+10 by omega,
   show k+1+3=k+4 by omega] at h1
 norm_num only [Nat.reduceAdd,show 2*(k+2)+(k+e+4)+2=3*k+e+10 by omega,
   show k+2+3=k+5 by omega] at h2
 rw [h0,h1,h2,show 3*k+e+10-2*(k+3)+6=k+e+10 by omega]
 convert upper_edge_two_arithmeticM9F23 e k using 1 <;> push_cast <;> ring

end MathGKM.Markov
