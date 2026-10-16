import MarkovOffsetReductionM58E
import MarkovOffsetMixedM58E
/-! Machine-authored 58e57003. Summand-certificate obstructions, not root refutations. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 1000000

def lowerTermM58E (j d i h : ℕ) : ℤ :=
 if h < i-1 then ((2*d).choose h:ℤ)*lowerCoreM58E j i h else 0

theorem lower_term_nonnegM58E (j d i h : ℕ) : 0 ≤ lowerTermM58E j d i h := by
 unfold lowerTermM58E
 split_ifs
 · exact mul_nonneg (by positivity) (lower_core_nonnegM58E _ _ _)
 · omega

theorem lower_term_localM58E (j d i h : ℕ) (hj : 2 ≤ j) :
 lowerTermM58E j d i h*lowerTermM58E j d (i+2) (h+1) ≤
 lowerTermM58E j d (i+1) h*lowerTermM58E j d (i+1) (h+1) := by
 by_cases hh : h+2 ≤ i
 · by_cases hi : i ≤ j+h+1
   · have hm := lower_core_mixedM58E j i h hj hh hi
     simp only [lowerTermM58E,if_pos (by omega : h < i-1),
       if_pos (by omega : h+1 < i+2-1),if_pos (by omega : h < i+1-1),
       if_pos (by omega : h+1 < i+1-1)]
     have hc : 0 ≤ ((2*d).choose h:ℤ)*((2*d).choose (h+1):ℤ) := by positivity
     calc
      _ = (((2*d).choose h:ℤ)*((2*d).choose (h+1):ℤ))*
        (lowerCoreM58E j i h*lowerCoreM58E j (i+2) (h+1)) := by ring
      _ ≤ _ := mul_le_mul_of_nonneg_left hm hc
      _ = _ := by ring
   · have hz : lowerTermM58E j d (i+2) (h+1)=0 := by
       unfold lowerTermM58E
       split_ifs
       · unfold lowerCoreM58E
         rw [Nat.choose_eq_zero_of_lt (by omega : j+(i+2)+1 < 2*(i+2)-1-(h+1)),
           Nat.choose_eq_zero_of_lt (by omega : j+(i+2) < 2*(i+2)-1-(h+1))]
         simp
       · rfl
     rw [hz,mul_zero]
     exact mul_nonneg (lower_term_nonnegM58E _ _ _ _) (lower_term_nonnegM58E _ _ _ _)
 · rw [lowerTermM58E,if_neg (by omega : ¬h < i-1),zero_mul]
   exact mul_nonneg (lower_term_nonnegM58E _ _ _ _) (lower_term_nonnegM58E _ _ _ _)

theorem lower_term_midpoint_gapM58E (d : ℕ) :
 lowerTermM58E 1 d 2 0*lowerTermM58E 1 d 4 1-
 lowerTermM58E 1 d 3 0*lowerTermM58E 1 d 3 1=2*d := by
 norm_num [lowerTermM58E,lowerCoreM58E,Nat.choose_one_right]
 ring

theorem lower_term_midpoint_failsM58E (d : ℕ) (hd : 1 ≤ d) :
 lowerTermM58E 1 d 3 0*lowerTermM58E 1 d 3 1 <
 lowerTermM58E 1 d 2 0*lowerTermM58E 1 d 4 1 := by
 have hg := lower_term_midpoint_gapM58E d
 omega

theorem lower_term_mixed_failsM58E :
 2*lowerTermM58E 1 1 3 0*lowerTermM58E 1 1 3 2 <
 lowerTermM58E 1 1 2 0*lowerTermM58E 1 1 4 2+
 lowerTermM58E 1 1 2 2*lowerTermM58E 1 1 4 0 := by
 norm_num [lowerTermM58E,lowerCoreM58E]

theorem lower_obstruction_sourceM58E :
 let m := (frame (lowerPathM58E 1 1)).mid
 m.a=2 ∧ m.b=5 ∧ InPolygon m.a m.b 2 1 ∧
 InPolygon m.a m.b 3 1 ∧ InPolygon m.a m.b 4 1 ∧
 coeff m.p 2 1=5 ∧ coeff m.p 3 1=16 ∧ coeff m.p 4 1=17 ∧
 coeff m.p 2 1*coeff m.p 4 1 ≤ coeff m.p 3 1^2 := by
 dsimp only
 obtain ⟨ha,hb⟩ := lower_path_labelsM58E 1 1 (by omega)
 have hc (i : ℕ) := source_two_lower_formulaM58E (lowerPathM58E 1 1) 1 1 i ha hb
 rw [hc 2,hc 3,hc 4,ha,hb]
 norm_num [InPolygon,lowerValM58E,Finset.sum_range_succ]

end
end MathGKM.Markov
