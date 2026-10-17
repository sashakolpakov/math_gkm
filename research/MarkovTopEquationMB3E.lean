import MarkovHalfPlaneM5BF
/-! Machine-authored b3eed364. Exact upper-row equation with no exponent
truncation. It uses the unchanged numerator-three source and raw coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def topDeltaMB3E (n j : ℕ) : Polynomial ℤ :=
 fibRowsMC3E (n+2) j-2*fibRowsMC3E (n+1) j+fibRowsMC3E n j

theorem fib_rows_aboveMB3E (n j : ℕ) (hj : n<j) : fibRowsMC3E n j=0 := by
 ext i
 rw [fibRowsMC3E,raw_row_coeffMC3E,fib_degree6 n i j (by omega)]
 simp

theorem fib_rows_topMB3E (n : ℕ) : fibRowsMC3E n n=1 := by
 ext i
 rw [fib_rows_coeffMC3E]
 cases i <;> simp [fibRawM9E2,coeff_one]

theorem top_delta_aboveMB3E (n j : ℕ) (hj : n+2<j) : topDeltaMB3E n j=0 := by
 simp [topDeltaMB3E,fib_rows_aboveMB3E _ _ hj,
   fib_rows_aboveMB3E (n+1) j (by omega),fib_rows_aboveMB3E n j (by omega)]

theorem top_delta_topMB3E (n : ℕ) : topDeltaMB3E n (n+2)=1 := by
 simp [topDeltaMB3E,fib_rows_topMB3E,
   fib_rows_aboveMB3E (n+1) (n+2) (by omega),fib_rows_aboveMB3E n (n+2) (by omega)]

theorem gain_rows_aboveMB3E (q j : ℕ) (r : Bool)
 (hj : q+(if r then 1 else 2)<j) : gainRowsMC3E q r j=0 := by
 have hn : 1 ≤ j := by cases r <;> simp at hj <;> omega
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true] at hj ⊢
 · simp [gainRowsMC3E,rowSMFFD,rowShiftMFFD,hn,
     fib_rows_aboveMB3E q (j-1) (by omega),
     fib_rows_aboveMB3E (q+1) j (by omega),
     fib_rows_aboveMB3E (q+1) (j-1) (by omega)]
 · simp [gainRowsMC3E,rowSMFFD,rowShiftMFFD,hn,
     fib_rows_aboveMB3E q j (by omega),
     fib_rows_aboveMB3E q (j-1) (by omega),
     fib_rows_aboveMB3E (q+1) j (by omega)]

theorem source_rows_equationMB3E (q j : ℕ) (r : Bool) :
 rowDiscMFFD (rawRowMC3E (threePolyM9E2 q r)) j=
 rowSMFFD (rowSMFFD (topDeltaMB3E (sourceNME9C q r))) j+
 4*rowShiftMFFD 1 (q+1) (gainRowsMC3E q r) j := by
 ext i
 simp only [coeff_add,coeff_ofNat_mul,row_shift_coeffMFFD,row_disc_coeffMFFD,
   row_S_twice_coeffMFFD]
 have hs : rowCoeffsMFFD (rawRowMC3E (threePolyM9E2 q r))=threeRawM9E2 q r :=
   funext fun a => funext fun b => (raw_row_coeffMC3E _ a b).trans (three_raw_formulaM9E2 q r a b)
 have hd : rowCoeffsMFFD (topDeltaMB3E (sourceNME9C q r))=
   fun a b => fibRawM9E2 (sourceNME9C q r+2) a b-
     2*fibRawM9E2 (sourceNME9C q r+1) a b+fibRawM9E2 (sourceNME9C q r) a b := by
   funext a b
   simp [rowCoeffsMFFD,topDeltaMB3E,fib_rows_coeffMC3E]
 have hg := funext (fun a => funext (fun b => gain_rows_coeffMC3E q a b r))
 change rowCoeffsMFFD (gainRowsMC3E q r)=_ at hg
 rw [hs,hd,hg,three_raw_equationM96A]
 rfl

theorem source_top_equationMB3E (q j : ℕ) (r : Bool)
 (hj : sourceNME9C q r ≤ j+q) :
 rawRowMC3E (threePolyM9E2 q r) j+
 2*(X-1)*rawRowMC3E (threePolyM9E2 q r) (j+1)+
 (X+1)^2*rawRowMC3E (threePolyM9E2 q r) (j+2)=
 topDeltaMB3E (sourceNME9C q r) j+
 2*(X+1)*topDeltaMB3E (sourceNME9C q r) (j+1)+
 (X+1)^2*topDeltaMB3E (sourceNME9C q r) (j+2) := by
 have he := source_rows_equationMB3E q (j+2) r
 rw [row_disc_succMFFD,row_S_twice_succMFFD] at he
 have hshift : rowShiftMFFD 1 (q+1) (gainRowsMC3E q r) (j+2)=0 := by
   unfold rowShiftMFFD
   split_ifs with h
   · rw [gain_rows_aboveMB3E q (j+2-(q+1)) r (by
       cases r <;> simp [sourceNME9C] at hj ⊢ <;> omega),mul_zero]
   · rfl
 rw [hshift,mul_zero,add_zero] at he
 linear_combination he

theorem source_rows_aboveMB3E (q j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : sourceNME9C q r+2<j) : rawRowMC3E (threePolyM9E2 q r) j=0 := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 ext i
 rw [raw_row_coeffMC3E,←three_path_polynomialM9E2]
 have hz := raw_outside_polygon18 (threePathM9E2 n r) i j
 rw [(three_path_labelsM9E2 n r).1,(three_path_labelsM9E2 n r).2] at hz
 have hn : ¬InPolygon 3 (3*(n+1)+(if r then 1 else 2)) i j := by
   simp only [InPolygon,sourceNME9C] at hj ⊢
   omega
 simpa using hz hn

end
end MathGKM.Markov
