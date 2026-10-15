import MarkovFourthOneSmallBE
/-! Machine-authored be5676f9. Exact small-cycle polynomial and inequalities. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fourthOne34BE : ℤ[X] :=
 210+1596*X+5380*X^2+10579*X^3+13426*X^4+11496*X^5+
 6752*X^6+2720*X^7+744*X^8+136*X^9+16*X^10+X^11

theorem fourth_one_34_polyBE :
 cutCoeffA27 (X:ℤ[X]) X 1
 [true,false,true,true,false,true,true,false,true,true] 4=fourthOne34BE := by
 norm_num [cutCoeffA27,cutChargeA27,cutFactorA27,fourthOne34BE]
 ring

theorem fourth_one_34_lcBE (j : ℕ) :
 fourthOne34BE.coeff j*fourthOne34BE.coeff (j+2)≤(fourthOne34BE.coeff (j+1))^2 := by
 by_cases hj : j<10
 · interval_cases j <;> norm_num [fourthOne34BE,Polynomial.coeff_add,
     Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_X,
     Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : fourthOne34BE.coeff (j+2)=0 := by
     have hj0 : j≠0 := by omega
     have h0 : j+2≠0 := by omega
     have h1 : j+2≠1 := by omega
     have h2 : j+2≠2 := by omega
     have h3 : j+2≠3 := by omega
     have h4 : j+2≠4 := by omega
     have h5 : j+2≠5 := by omega
     have h6 : j+2≠6 := by omega
     have h7 : j+2≠7 := by omega
     have h8 : j+2≠8 := by omega
     have h9 : j+2≠9 := by omega
     have h10 : j+2≠10 := by omega
     have h11 : j+2≠11 := by omega
     simp [fourthOne34BE,Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
       Polynomial.coeff_X_pow,Polynomial.coeff_X,hj0,h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,eq_comm]
   rw [hz,mul_zero]; exact sq_nonneg _

theorem source_fourth_one_34BE (rest : List Bool)
 (ha : (frame rest).mid.a=3) (hb : (frame rest).mid.b=4)
 (i j : ℕ) (hs : i+j+2=(frame (true::false::rest)).mid.a+4) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*
 coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 rw [source_cut_coeffA27 _ i (j+2) 4 (by omega),
   source_cut_coeffA27 _ (i+2) j 4 (by omega),
   source_cut_coeffA27 _ (i+1) (j+1) 4 (by omega),
   source_one_34_tailBE rest ha hb,fourth_one_34_polyBE]
 nlinarith only [fourth_one_34_lcBE j]

end
end MathGKM.Markov
