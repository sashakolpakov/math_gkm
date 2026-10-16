import MarkovResidualMF1E
import MarkovRightJetsF650
/-! Machine-authored f1e4fe3b. The diagonal middle criterion reaches actual
sources at arbitrarily large depths within the previous residual guards. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000
attribute [local irreducible] frame coeff

theorem right_left_labelsMF1E (n : ℕ) :
 (frame (List.replicate n true++[false])).mid.a=2*n+1 ∧
 (frame (List.replicate n true++[false])).mid.b=2*n+3 := by
 have h := indices_frame (List.replicate n true)
 have ha := h.1
 have hb := h.2.1
 rw [right_hi650] at ha hb
 simp only [initial] at ha hb
 obtain ⟨hm,hn⟩ := right_labels650 n
 rw [frame_append18]
 simp only [advance,Bool.false_eq_true,ite_false]
 constructor <;> omega

theorem polygon_of_totalMF1E (a b i j : ℕ)
 (hab : a ≤ b) (hlo : b ≤ i+j) (hhi : i+j ≤ a+b-1) :
 InPolygon a b i j := by
 refine ⟨?_,hhi⟩
 have h0 := Nat.mul_le_mul_left a hlo
 have h1 := Nat.mul_le_mul_right i hab
 nlinarith

theorem unbounded_diagonal_regionMF1E (r : ℕ) (hr : 6 ≤ r) :
 ∃ (path : List Bool) (i j : ℕ),
   let m := (frame path).mid
   2 ≤ m.a ∧ m.a+2 ≤ m.b ∧
   i+j+2+r=m.a+m.b-1 ∧ i+j+8 ≤ m.a+m.b-1 ∧ m.a+5 ≤ i+j+2 ∧
   InPolygon m.a m.b i (j+2) ∧ InPolygon m.a m.b (i+1) (j+1) ∧
   InPolygon m.a m.b (i+2) j ∧ DiagonalMiddleMF1E m.a m.b i j ∧
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2 := by
 let n := r^2+r+1
 let path := List.replicate n true++[false]
 let i := r^2+r
 let j := 3*r^2+2*r+5
 obtain ⟨ha,hb⟩ := right_left_labelsMF1E n
 change (frame path).mid.a=2*n+1 at ha
 change (frame path).mid.b=2*n+3 at hb
 have ht : i+j+2+r=(frame path).mid.a+(frame path).mid.b-1 := by
   rw [ha,hb]; dsimp [n,i,j]; omega
 have hi : r+r^2 ≤ i := by dsimp [i]; omega
 have hj : r+r^2 ≤ j := by dsimp [j]; omega
 have hlo : (frame path).mid.b ≤ i+j+2 := by
   rw [hb]; dsimp [n,i,j]; nlinarith
 have hab : (frame path).mid.a ≤ (frame path).mid.b := by rw [ha,hb]; omega
 have hhigh : i+j+2 ≤ (frame path).mid.a+(frame path).mid.b-1 := by omega
 refine ⟨path,i,j,?_,?_,ht,?_,?_,?_,?_,?_,⟨r,ht,hi,hj⟩,
   source_diagonal_middleMF1E path r i j ht hi hj⟩
 · rw [ha]; dsimp [n]; omega
 · rw [ha,hb]; omega
 · omega
 · rw [ha]; dsimp [n,i,j]; nlinarith
 · exact polygon_of_totalMF1E _ _ _ _ hab (by omega) (by omega)
 · exact polygon_of_totalMF1E _ _ _ _ hab (by omega) (by omega)
 · exact polygon_of_totalMF1E _ _ _ _ hab (by omega) (by omega)
end
end MathGKM.Markov
