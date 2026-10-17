import MarkovTopSectorClosedM97B
/-! Machine-authored e8743310. Explicit top five row polynomials. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000

theorem top_delta_threeME87 (n : ℕ) (hn : 1 ≤ n) :
 topDiagonalDeltaMB3E n 3=C ((n+2).choose 3:ℤ)*X^3 := by
 ext i
 rcases i with _|_|_|i
 · rw [top_delta_low_zeroMB3E n 3 0 (by omega) (by omega) (by omega)]
   simp
 · rw [top_delta_low_zeroMB3E n 3 1 (by omega) (by omega) (by omega)]
   simp
 · rw [top_delta_low_zeroMB3E n 3 2 (by omega) (by omega) (by omega)]
   simp
 · rw [show i+1+1+1=i+3 by omega,top_delta_highMB3E n 3 i (by omega)]
   cases i <;> simp [coeff_C_mul,show n+5-3=n+2 by omega]

theorem top_delta_fourME87 (n : ℕ) (hn : 2 ≤ n) :
 topDiagonalDeltaMB3E n 4=C ((n+1).choose 3:ℤ)*X^3+C ((n+2).choose 4:ℤ)*X^4 := by
 ext i
 rcases i with _|_|_|i
 · rw [top_delta_low_zeroMB3E n 4 0 (by omega) (by omega) (by omega)]
   simp
 · rw [top_delta_low_zeroMB3E n 4 1 (by omega) (by omega) (by omega)]
   simp
 · rw [top_delta_low_zeroMB3E n 4 2 (by omega) (by omega) (by omega)]
   simp
 · rw [show i+1+1+1=i+3 by omega,top_delta_highMB3E n 4 i (by omega)]
   rcases i with _|_|i
   · simp [coeff_C_mul,show n+5-4=n+1 by omega]
   · simp [coeff_C_mul,show (n+5-4)+1=n+2 by omega]
   · simp [coeff_C_mul,Nat.choose_eq_zero_of_lt (show (1 : ℕ) < i+2 by omega)]

theorem top_five_formulaME87 (n : ℕ) (hn : 2 ≤ n) :
 topTemplateMB3E n 0=1 ∧
 topTemplateMB3E n 1=2+C (n+2:ℤ)*X ∧
 topTemplateMB3E n 2=1+C (3*(n:ℤ)-1)*X+C ((n+2).choose 2:ℤ)*X^2 ∧
 topTemplateMB3E n 3=C (4*((n:ℤ)-3))*X+C (4*(n.choose 2:ℤ))*X^2+
   C ((n+2).choose 3:ℤ)*X^3 ∧
 topTemplateMB3E n 4=C (4*((n:ℤ)-6))*X+C (8*((n-2).choose 2:ℤ))*X^2+
   C (((n+1).choose 3:ℤ)+4*(n.choose 3:ℤ))*X^3+C ((n+2).choose 4:ℤ)*X^4 := by
 have h0 : topTemplateMB3E n 0=1 := rfl
 have h1 : topTemplateMB3E n 1=2+C (n+2:ℤ)*X := by
   rw [topTemplateMB3E,top_delta_oneMB3E]
   ring
 have h2 : topTemplateMB3E n 2=1+C (3*(n:ℤ)-1)*X+C ((n+2).choose 2:ℤ)*X^2 := by
   rw [topTemplateMB3E,h0,h1,top_delta_twoMB3E,top_delta_oneMB3E,top_delta_zeroMB3E]
   push_cast
   simp only [map_add,map_sub,map_mul,map_ofNat,map_one]
   ring
 refine ⟨h0,h1,h2,?_,?_⟩
 · rw [show 3=1+2 by rfl,topTemplateMB3E,h2,h1,
     top_delta_threeME87 n (by omega),top_delta_twoMB3E,top_delta_oneMB3E]
   have hc : ((n+2).choose 2:ℤ)=(n.choose 2:ℤ)+2*n+1 := by
     simp only [Nat.choose_succ_succ,Nat.choose_one_right,Nat.choose_zero_right,Nat.cast_add,Nat.cast_one]
     simp [Nat.choose_one_right]
     ring
   rw [hc]
   push_cast
   simp only [map_add,map_sub,map_mul,map_ofNat,map_one]
   ring
 · rw [show 4=2+2 by rfl,topTemplateMB3E,h2,
     top_delta_fourME87 n hn,top_delta_threeME87 n (by omega),top_delta_twoMB3E]
   rw [show topTemplateMB3E n (2+1)=C (4*((n:ℤ)-3))*X+C (4*(n.choose 2:ℤ))*X^2+
     C ((n+2).choose 3:ℤ)*X^3 by
       rw [show 2+1=1+2 by rfl,topTemplateMB3E,h2,h1,
         top_delta_threeME87 n (by omega),top_delta_twoMB3E,top_delta_oneMB3E]
       have hc : ((n+2).choose 2:ℤ)=(n.choose 2:ℤ)+2*n+1 := by
         simp only [Nat.choose_succ_succ,Nat.choose_one_right,Nat.choose_zero_right,Nat.cast_add,Nat.cast_one]
         simp [Nat.choose_one_right]; ring
       rw [hc]; push_cast; simp only [map_add,map_sub,map_mul,map_ofNat,map_one]; ring]
   have hc2' : ((n+2).choose 2:ℤ)=(n.choose 2:ℤ)+2*n+1 := by
     simp only [Nat.choose_succ_succ,Nat.choose_one_right,Nat.choose_zero_right,Nat.cast_add,Nat.cast_one]
     simp [Nat.choose_one_right]; ring
   have hc3 : ((n+2).choose 3:ℤ)=(n.choose 3:ℤ)+2*(n.choose 2:ℤ)+n := by
     simp only [Nat.choose_succ_succ,Nat.choose_one_right,Nat.choose_zero_right,Nat.cast_add,Nat.cast_one]
     ring
   have hcm : (n.choose 2:ℤ)=((n-2).choose 2:ℤ)+2*n-3 := by
     have he : n=n-2+2 := by omega
     conv_lhs => rw [he]
     simp only [Nat.choose_succ_succ,Nat.choose_one_right,Nat.choose_zero_right,Nat.cast_add,Nat.cast_one]
     simp [Nat.choose_one_right]
     omega
   rw [hc2',hc3,hcm]
   push_cast
   simp only [map_add,map_sub,map_mul,map_ofNat,map_one]
   ring
end
end MathGKM.Markov
