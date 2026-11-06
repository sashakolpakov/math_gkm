import MathGKM.Round53RowsA
import MathGKM.Accepted4758af360dbc864d40dbc7ac

/-! Machine-authored round53 auxiliary control, prospectively recorded.
No reachability assertion. It separates complete rowwise factor conditions
from multiplication followed by row extraction, even without subtraction. -/
namespace HorizontalR53
noncomputable section
open Polynomial MathGKM.Markov RealRowR52

def B : BiPoly := 2+V^2

theorem row_one (j : ℕ) : row (1 : BiPoly) j=if j=0 then 1 else 0 := by
  ext i
  simp only [row_coeff,MathGKM.Markov.coeff,Polynomial.coeff_one]
  split_ifs <;> simp_all [Polynomial.coeff_one]

theorem row_B (j : ℕ) : row B j=if j=0 then 2 else if j=2 then 1 else 0 := by
  have he : B=(1:BiPoly)+1+U^0*V^2*1 := by simp [B]; ring
  rw [he,row_add,row_add,row_shift]
  simp only [row_one,pow_zero,one_mul]
  by_cases h0 : j=0
  · subst j; norm_num
  by_cases h2 : j=2
  · subst j; norm_num
  have h20 : j-2≠0 ∨ ¬2≤j := by omega
  rcases h20 with h20 | h20 <;> simp [h0,h2,h20]

theorem realRow_A (j : ℕ) : realRow A j=
    if j=0 then X^2+X else if j=1 then 2*X+1 else if j=2 then 1 else 0 := by
  have h := row_A (1 : BiPoly) j
  simp only [mul_one] at h
  unfold realRow
  rw [h]
  simp only [row_one]
  by_cases h0 : j=0
  · subst j; norm_num
  by_cases h1 : j=1
  · subst j; norm_num
  by_cases h2 : j=2
  · subst j; norm_num
  have h10 : j-1≠0 := by omega
  have h20 : j-2≠0 := by omega
  simp [h0,h1,h2,h10,h20]

theorem realRow_B (j : ℕ) : realRow B j=
    if j=0 then 2 else if j=2 then 1 else 0 := by
  unfold realRow
  rw [row_B]
  split_ifs <;> simp

theorem fact_zero : Factorized (0 : Polynomial ℝ) := Or.inl rfl

theorem fact_const (c : ℝ) (hc : 0<c) : Factorized (C c) := by
  right
  refine ⟨c,0,[],[],hc,by simp,by simp,?_⟩
  simp

theorem inputs_factorized :
    (∀ j, Factorized (realRow A j)) ∧ (∀ j, Factorized (realRow B j)) := by
  constructor
  · intro j
    rw [realRow_A]
    split_ifs with h0 h1 h2
    · right
      refine ⟨1,1,[1],[],by norm_num,by simp,by simp,?_⟩
      simp; ring
    · right
      refine ⟨2,0,[(1/2 : ℝ)],[],by norm_num,by norm_num,by simp,?_⟩
      have hh : (C (2:ℝ) : Polynomial ℝ)*C (1/2:ℝ)=1 := by
        rw [← map_mul]; norm_num
      simp only [List.map_cons,List.map_nil,List.prod_cons,List.prod_nil,
        pow_zero,mul_one]
      rw [mul_add,hh]
      norm_num [Polynomial.C_ofNat]
    · simpa using fact_const 1 (by norm_num)
    · exact fact_zero
  · intro j
    rw [realRow_B]
    split_ifs
    · simpa only [Polynomial.C_ofNat] using fact_const 2 (by norm_num)
    · simpa using fact_const 1 (by norm_num)
    · exact fact_zero

theorem output_row : realRow (A*B) 2=X^2+X+2 := by
  unfold realRow
  rw [row_A]
  norm_num [row_B]

theorem extraction_control :
    (∀ j, Factorized (realRow A j)) ∧
    (∀ j, Factorized (realRow B j)) ∧
    realRow (A*B) 2=X^2+X+2 ∧
    (realRow (A*B) 2).coeff 0=2 ∧
    (realRow (A*B) 2).coeff 1=1 ∧
    (realRow (A*B) 2).coeff 2=1 ∧
    ¬Factorized (realRow (A*B) 2) := by
  refine ⟨inputs_factorized.1,inputs_factorized.2,output_row,?_,?_,?_,?_⟩
  · rw [output_row]; norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
  · rw [output_row]; norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
  · rw [output_row]; norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
  · intro hf
    have hc := Accepted4758af360dbc864d40dbc7ac.obligation _ hf
    have hh := RealPolynomialR52.raw_consequence _ hc 0
    rw [output_row] at hh
    norm_num [Polynomial.coeff_one,Polynomial.coeff_X] at hh

end
end HorizontalR53
#print axioms HorizontalR53.extraction_control
