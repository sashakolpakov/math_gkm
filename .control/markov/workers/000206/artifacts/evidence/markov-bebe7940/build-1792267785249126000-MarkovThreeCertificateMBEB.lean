import MarkovThreeMassMBEB
import MarkovBaseCertificateMBEB
/-! Machine-authored bebe7940. Full signed source gaps for column three,
in two unbounded chambers. No mixed term is discarded. -/
namespace MathGKM.Markov
open Finset
set_option maxHeartbeats 8000000
local infixl:65 " +ₑ " => PolyExprM6C0.add
local infixl:70 " *ₑ " => PolyExprM6C0.mul

def affineExprMBEB (e a b : ℕ) (J H : PolyExprM6C0) : PolyExprM6C0 :=
 exprSumM6C0 (fun l => .c (Nat.fast_choose (a+l) a:ℚ) *ₑ chooseExprM6C0 H (b-l) *ₑ
   (.c e *ₑ chooseExprM6C0 (J +ₑ .c (a+1)) (a+l+1) +ₑ
     .c 3 *ₑ chooseExprM6C0 (J +ₑ .c (a+1)) (a+l+2))) (b+1)

theorem affine_expr_natMBEB (x y : ℚ) (e a b J H : ℕ) (u v : PolyExprM6C0)
 (hu : exprEvalM6C0 x y u=(J:ℚ)) (hv : exprEvalM6C0 x y v=(H:ℚ)) :
 exprEvalM6C0 x y (affineExprMBEB e a b u v)=(affineIntMBEB e a b J H:ℚ) := by
 simp only [affineExprMBEB,expr_sum_evalM6C0,exprEvalM6C0,choose_expr_evalM6C0,
   ←Nat.choose_eq_fast_choose,hu,hv,affineIntMBEB,Int.cast_sum,Int.cast_mul,Int.cast_add,
   Int.cast_natCast,Int.cast_ofNat,choose_poly_natM0D3,Nat.cast_add,Nat.cast_one]
 apply sum_congr rfl
 intro l hl
 congr 2 <;> congr 1 <;> congr 1 <;> ring

theorem lift_expr_natMBEB (x y : ℚ) (d j t : ℕ) (u v : PolyExprM6C0)
 (hu : exprEvalM6C0 x y u=(d:ℚ)) (hv : exprEvalM6C0 x y v=(j:ℚ)) :
 exprEvalM6C0 x y (liftExprMBEB u v t)=(liftOutputMAE9 d j t:ℚ) := by
 rw [lift_expr_evalMBEB,hu,hv,←lift_output_polynomialM657]

def lowExprMBEB (r : Bool) (t : ℕ) : PolyExprM6C0 :=
 let j := .c 3 *ₑ PolyExprM6C0.x +ₑ .k +ₑ .c (if r then 7 else 6)
 liftExprMBEB (.k +ₑ .c (2*t)) (j +ₑ .c (2-t)) t +ₑ
 .c 4 *ₑ affineExprMBEB (if r then 2 else 1) (t+2) (t+1)
   (.x +ₑ .c (2-t)) (.k +ₑ .c (2*t))

def shortExprGeneralMBEB (H T : PolyExprM6C0) (t : ℕ) : PolyExprM6C0 :=
 exprSumM6C0 (fun l => .c (Nat.fast_choose (t+l) t:ℚ) *ₑ
   chooseExprM6C0 H (t+3-l) *ₑ
   (chooseExprM6C0 T (t+l) +ₑ .c 4 *ₑ chooseExprM6C0 (T +ₑ .c 1) (t+l+2))) (t+4)

theorem short_general_natMBEB (x y : ℚ) (H T t : ℕ) (u v : PolyExprM6C0)
 (hu : exprEvalM6C0 x y u=(H:ℚ)) (hv : exprEvalM6C0 x y v=(T:ℚ)) :
 exprEvalM6C0 x y (shortExprGeneralMBEB u v t)=(shortValueMBEB H T t:ℚ) := by
 simp only [shortExprGeneralMBEB,expr_sum_evalM6C0,exprEvalM6C0,choose_expr_evalM6C0,
   ←Nat.choose_eq_fast_choose,hu,hv,shortValueMBEB,Int.cast_sum,Int.cast_mul,Int.cast_add,
   Int.cast_ofNat,Int.cast_natCast,choose_poly_natM0D3,Nat.cast_add,Nat.cast_one]

def upperExprMBEB (r : Bool) (t : ℕ) : PolyExprM6C0 :=
 let k := .c 3 *ₑ PolyExprM6C0.x +ₑ .k +ₑ .c (if r then 7 else 6)
 shortExprGeneralMBEB (PolyExprM6C0.k +ₑ .c 4) (k +ₑ .c t) t +ₑ
 .c 4 *ₑ affineExprMBEB (if r then 2 else 1) (t+1) (t+2) .x (.k +ₑ .c 4)

theorem low_expr_natMBEB (x h t : ℕ) (r : Bool) :
 exprEvalM6C0 x h (lowExprMBEB r t)=(lowMassMBEB x h t r:ℚ) := by
 unfold lowExprMBEB
 simp only [exprEvalM6C0]
 rw [lift_expr_natMBEB _ _ (h+2*t) (lowJMBEB x h r+(2-t)) t _ _
   (by simp [exprEvalM6C0]) (by cases r <;> simp [exprEvalM6C0,lowJMBEB]),
   affine_expr_natMBEB _ _ _ _ _ (x+(2-t)) (h+2*t) _ _
   (by simp [exprEvalM6C0]) (by simp [exprEvalM6C0])]
 simp only [lowMassMBEB,Int.cast_add,Int.cast_mul,Int.cast_ofNat]

theorem upper_expr_natMBEB (x h t : ℕ) (r : Bool) :
 exprEvalM6C0 x h (upperExprMBEB r t)=(upperMassMBEB x h t r:ℚ) := by
 unfold upperExprMBEB
 simp only [exprEvalM6C0]
 rw [short_general_natMBEB _ _ (h+4) (upperKMBEB x h r+t) t _ _
   (by simp [exprEvalM6C0]) (by cases r <;> simp [exprEvalM6C0,upperKMBEB]),
   affine_expr_natMBEB _ _ _ _ _ x (h+4) _ _
   (by simp [exprEvalM6C0]) (by simp [exprEvalM6C0])]
 simp only [upperMassMBEB,Int.cast_add,Int.cast_mul,Int.cast_ofNat]

def threeGapExprMBEB (upper r : Bool) : PolyExprM6C0 :=
 let f := if upper then upperExprMBEB r else lowExprMBEB r
 f 1 *ₑ f 1 +ₑ .c (-1) *ₑ (f 0 *ₑ f 2)

set_option maxHeartbeats 600000000 in
set_option maxRecDepth 1000000 in
set_option compiler.extract_closed false in
theorem three_gap_certificatesMBEB :
 denseNonnegM6C0 (exprDenseM6C0 (threeGapExprMBEB false false)) ∧
 denseNonnegM6C0 (exprDenseM6C0 (threeGapExprMBEB false true)) ∧
 denseNonnegM6C0 (exprDenseM6C0 (threeGapExprMBEB true false)) ∧
 denseNonnegM6C0 (exprDenseM6C0 (threeGapExprMBEB true true)) := by decide +kernel

theorem low_mass_lcMBEB (x h : ℕ) (r : Bool) :
 lowMassMBEB x h 0 r*lowMassMBEB x h 2 r ≤ lowMassMBEB x h 1 r^2 := by
 have hc : denseNonnegM6C0 (exprDenseM6C0 (threeGapExprMBEB false r)) := by
   cases r
   · exact three_gap_certificatesMBEB.1
   · exact three_gap_certificatesMBEB.2.1
 have he := expr_nonneg_certificateM6C0 _ hc (x:ℚ) (h:ℚ) (by positivity) (by positivity)
 simp only [threeGapExprMBEB,Bool.false_eq_true,if_false,exprEvalM6C0,low_expr_natMBEB] at he
 have hh : (lowMassMBEB x h 0 r:ℚ)*(lowMassMBEB x h 2 r:ℚ) ≤ (lowMassMBEB x h 1 r:ℚ)^2 := by
   nlinarith only [he]
 exact_mod_cast hh

theorem upper_mass_lcMBEB (x h : ℕ) (r : Bool) :
 upperMassMBEB x h 0 r*upperMassMBEB x h 2 r ≤ upperMassMBEB x h 1 r^2 := by
 have hc : denseNonnegM6C0 (exprDenseM6C0 (threeGapExprMBEB true r)) := by
   cases r
   · exact three_gap_certificatesMBEB.2.2.1
   · exact three_gap_certificatesMBEB.2.2.2
 have he := expr_nonneg_certificateM6C0 _ hc (x:ℚ) (h:ℚ) (by positivity) (by positivity)
 simp only [threeGapExprMBEB,if_true,exprEvalM6C0,upper_expr_natMBEB] at he
 have hh : (upperMassMBEB x h 0 r:ℚ)*(upperMassMBEB x h 2 r:ℚ) ≤ (upperMassMBEB x h 1 r:ℚ)^2 := by
   nlinarith only [he]
 exact_mod_cast hh

end MathGKM.Markov


