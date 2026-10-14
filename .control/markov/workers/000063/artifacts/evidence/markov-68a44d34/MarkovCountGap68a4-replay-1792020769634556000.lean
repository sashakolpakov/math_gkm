import MarkovCountDiagonal68a4
import MarkovSourceCount68a4
import MarkovPellLowerFormula26ca
/-! Machine-authored 68a44d34. An unbounded actual-source obstruction to
fixed-degree horizontal layer LC. This does not negate Conjecture63. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem choose_four_rat68 (n : ℕ) :
 (n.choose 4:ℚ)=(n:ℚ)*(n-1)*(n-2)*(n-3)/24 := by
 induction n with
 | zero => norm_num
 | succ n ih =>
   rw [Nat.choose_succ_succ]
   push_cast
   rw [ih,choose_three_rat26ca]
   push_cast
   ring

theorem choose_five_rat68 (n : ℕ) :
 (n.choose 5:ℚ)=(n:ℚ)*(n-1)*(n-2)*(n-3)*(n-4)/120 := by
 induction n with
 | zero => norm_num
 | succ n ih =>
   rw [Nat.choose_succ_succ]
   push_cast
   rw [ih,choose_four_rat68]
   push_cast
   ring

theorem count_gap_polynomial68 (x : ℚ) (hx : 33 ≤ x) :
 (x*(x+1)*(x-1)*(x-2)/6)^2 <
   (x^2*(x+1)/2)*((8*x-5)*(x-1)*(x-2)*(x-3)*(x-4)/120) := by
 have ht : 0 ≤ x-33 := by linarith
 have hc : 0 < 4*x^3-143*x^2+413*x-220 := by
   have he : 4*x^3-143*x^2+413*x-220=
       4*(x-33)^3+253*(x-33)^2+4043*(x-33)+1430 := by ring
   rw [he]
   positivity
 have hid : 720*((x^2*(x+1)/2)*((8*x-5)*(x-1)*(x-2)*(x-3)*(x-4)/120)-
     (x*(x+1)*(x-1)*(x-2)/6)^2)=
     x^2*(x+1)*(x-1)*(x-2)*(4*x^3-143*x^2+413*x-220) := by ring
 have hp : 0 < x^2*(x+1)*(x-1)*(x-2)*(4*x^3-143*x^2+413*x-220) := by
   have h1 : 0 < x-1 := by linarith
   have h2 : 0 < x-2 := by linarith
   positivity
 linarith

theorem source_count_gap_all68 (n : ℕ) (hn : 33 ≤ n) :
 (singleACount68 n (n+1) 5 (n+6))^2 <
   singleACount68 n (n+1) 4 (n+6)*singleACount68 n (n+1) 6 (n+6) := by
 obtain ⟨h0,h1,h2⟩ := source_count_456_formula68 n (by omega)
 rw [h0,h1,h2]
 have h : (((n:ℚ)+1)*(n.choose 3:ℚ))^2 <
     ((n:ℚ)*((n+1).choose 2:ℚ))*
       ((n:ℚ)*((n-1).choose 4:ℚ)+2*(n.choose 5:ℚ)+((n-1).choose 5:ℚ)) := by
   rw [choose_two_rat26ca,choose_three_rat26ca,choose_four_rat68,
     choose_five_rat68,choose_five_rat68]
   push_cast [Nat.cast_sub (show 1 ≤ n by omega)]
   convert count_gap_polynomial68 (n:ℚ) (by exact_mod_cast hn) using 1 <;> ring
 exact_mod_cast h

theorem source_fixed_degree_horizontal_failure_all68 (n : ℕ) (hn : 33 ≤ n) :
 let w := central28 (oneAPath68 n)++[true]
 (degreeLayer07a7 (Polynomial.X:Polynomial ℤ) w 5 (n+6)).coeff 0^2 <
   (degreeLayer07a7 (Polynomial.X:Polynomial ℤ) w 4 (n+6)).coeff 0*
   (degreeLayer07a7 (Polynomial.X:Polynomial ℤ) w 6 (n+6)).coeff 0 := by
 dsimp only
 simp only [oneA_layer_count68]
 exact source_count_gap_all68 n hn

#print axioms source_fixed_degree_horizontal_failure_all68

theorem source_full_raw_holds_all68 (n : ℕ) (hn : 33 ≤ n) :
 let m := (frame (oneAPath68 n)).mid
 InPolygon m.a m.b (m.a+4) 0 ∧ InPolygon m.a m.b (m.a+5) 0 ∧
 InPolygon m.a m.b (m.a+6) 0 ∧
 coeff m.p (m.a+4) 0*coeff m.p (m.a+6) 0 ≤ coeff m.p (m.a+5) 0^2 := by
 obtain ⟨ha,hb⟩ := oneA_labels68 n
 dsimp only
 have hp (k : ℕ) (hk : k ≤ 6) :
     InPolygon (frame (oneAPath68 n)).mid.a (frame (oneAPath68 n)).mid.b
       ((frame (oneAPath68 n)).mid.a+k) 0 := by
   rw [ha,hb]
   constructor
   · nlinarith
   · omega
 refine ⟨hp 4 (by omega),hp 5 (by omega),hp 6 (by omega),?_⟩
 simpa only [Nat.add_assoc] using boundary_raw_logConcave (oneAPath68 n)
   ((frame (oneAPath68 n)).mid.a+4)

#print axioms source_full_raw_holds_all68
end
end MathGKM.Markov
