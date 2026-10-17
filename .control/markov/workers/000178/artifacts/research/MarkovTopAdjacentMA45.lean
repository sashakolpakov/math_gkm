import MarkovLowAdjacentMA45
/-! Machine-authored a45def12. Exact last adjacent coefficient-ratio comparison. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem q_top_coeffMA45 (k s : ℕ) :
 (qPolyM7E2 (k+1) s).coeff (k+1)=((s+k+4).choose (k+1):ℝ) := by
 simp only [q_poly_coeffM7E2,qCoeffM7E2,qWeightM7E2,sub_self,lt_self_iff_false,
   if_false,ite_true,one_mul,qBinM7E2]
 rw [show s+(k+1)+3=s+k+4 by omega]

theorem q_pretop_coeffMA45 (k s : ℕ) :
 (qPolyM7E2 (k+1) s).coeff k=4*((s+k+3).choose k:ℝ) := by
 rw [q_interior_coeffMA45 (k+1) s k (by omega),negBin_coeffMA45]
 rw [show s+3+k=s+k+3 by omega]
 push_cast
 ring

theorem q_product_topMA45 (k s t : ℕ) :
 (qPolyM7E2 (k+1) s*qPolyM7E2 (k+1) t).coeff (2*k+2) =
 ((s+k+4).choose (k+1):ℝ)*((t+k+4).choose (k+1):ℝ) := by
 rw [show 2*k+2=(k+1)+(k+1) by omega,
   coeff_mul_add_eq_of_natDegree_le (q_poly_degreeM7E2 _ _) (q_poly_degreeM7E2 _ _),
   q_top_coeffMA45,q_top_coeffMA45]

theorem q_product_pretopMA45 (k s t : ℕ) :
 (qPolyM7E2 (k+1) s*qPolyM7E2 (k+1) t).coeff (2*k+1) =
 4*(((s+k+4).choose (k+1):ℝ)*((t+k+3).choose k:ℝ)+
   ((s+k+3).choose k:ℝ)*((t+k+4).choose (k+1):ℝ)) := by
 have h := congrArg (fun P : ℝ[X] => P.coeff 1)
   (reflect_mul (qPolyM7E2 (k+1) s) (qPolyM7E2 (k+1) t)
     (q_poly_degreeM7E2 _ _) (q_poly_degreeM7E2 _ _))
 rw [coeff_reflect,mul_coeff_one] at h
 simp only [coeff_reflect,revAt_le (by omega : 1≤(k+1)+(k+1)),
   revAt_le (by omega : 0≤k+1),revAt_le (by omega : 1≤k+1)] at h
 rw [show k+1+(k+1)-1=2*k+1 by omega,show k+1-0=k+1 by omega,
   show k+1-1=k by omega,q_top_coeffMA45,q_top_coeffMA45,
   q_pretop_coeffMA45,q_pretop_coeffMA45] at h
 nlinarith only [h]

theorem q_last_adjacentMA45 (k s : ℕ) :
 (qPolyM7E2 (k+1) (s+1)^2).coeff (2*k+1)*
   (qPolyM7E2 (k+1) s*qPolyM7E2 (k+1) (s+2)).coeff (2*k+2) ≤
 (qPolyM7E2 (k+1) (s+1)^2).coeff (2*k+2)*
   (qPolyM7E2 (k+1) s*qPolyM7E2 (k+1) (s+2)).coeff (2*k+1) := by
 let E (t : ℕ) : ℝ := ((t+k+4).choose (k+1):ℝ)
 let P (t : ℕ) : ℝ := ((t+k+3).choose k:ℝ)
 have h (t : ℕ) : (t+k+4:ℝ)*P t=(k+1:ℝ)*E t := by
   have hh := Nat.add_one_mul_choose_eq (t+k+3) k
   dsimp [P,E]
   exact_mod_cast (by simpa [Nat.add_assoc,Nat.mul_comm] using hh)
 have h0 := h s
 have h1 := h (s+1)
 have h2 := h (s+2)
 push_cast at h0 h1 h2
 let x : ℝ := s+k+4
 let D : ℝ := x*(x+1)*(x+2)
 have hd : 0 < D := by dsimp [D,x]; positivity
 rw [pow_two,q_product_pretopMA45,q_product_topMA45,q_product_topMA45,q_product_pretopMA45]
 change 4*(E (s+1)*P (s+1)+P (s+1)*E (s+1))*(E s*E (s+2)) ≤
   (E (s+1)*E (s+1))*(4*(E s*P (s+2)+P s*E (s+2)))
 apply (mul_le_mul_iff_of_pos_right hd).mp
 have he :
   ((E (s+1)*E (s+1))*(4*(E s*P (s+2)+P s*E (s+2)))-
     4*(E (s+1)*P (s+1)+P (s+1)*E (s+1))*(E s*E (s+2)))*D =
   8*(k+1:ℝ)*E s*E (s+1)^2*E (s+2) := by
   dsimp [D,x]
   linear_combination
     4*E (s+1)^2*E (s+2)*(s+k+5:ℝ)*(s+k+6)*h0 +
     4*E (s+1)^2*E s*(s+k+4:ℝ)*(s+k+5)*h2 -
     8*E (s+1)*E s*E (s+2)*(s+k+4:ℝ)*(s+k+6)*h1
 have hn (t : ℕ) : 0 ≤ E t := by dsimp [E]; positivity
 have hz : 0 ≤ 8*(k+1:ℝ)*E s*E (s+1)^2*E (s+2) := by positivity
 nlinarith only [he,hz]

end
end MathGKM.Markov
