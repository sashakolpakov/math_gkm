import MarkovSeries3556
import MarkovCubicLC3556

/-! Machine-authored request 3556cd95. Second vertical line for every
numerator-two source path; all natural indices and zero coefficients retained. -/
namespace MathGKM.Markov
noncomputable section

theorem second_low_cubic3556 (q j : ℕ) (hj : j≤q) :
    6*coeff (twoSquare3556 q) 2 j=cubic3556 j := by
  rw [second_column_low3556 q j (by omega),if_neg (by omega),sub_zero]
  rfl

theorem second_high_cubic3556 (q j : ℕ) (hj : q≤j+1) (ht : j≤2*q) :
    6*coeff (twoSquare3556 q) 2 j=highCubic3556 q j := by
  rw [second_column_low3556 q j ht]
  unfold highCubic3556 cubic3556
  by_cases h : q+1≤j
  · rw [if_pos h]
    have he : ((j-q-1:ℕ):ℤ)=(j:ℤ)-q-1 := by omega
    rw [he]
    ring
  · rw [if_neg h]
    have he : (j:ℤ)-q-1 = -1 ∨ (j:ℤ)-q-1 = -2 := by omega
    rcases he with he | he <;> rw [he] <;> ring

theorem second_column_inside_lc3556 (q j : ℕ) (hq : 1≤q) (hj : j+2≤2*q) :
    coeff (twoSquare3556 q) 2 j*coeff (twoSquare3556 q) 2 (j+2)≤
      coeff (twoSquare3556 q) 2 (j+1)^2 := by
  suffices hh : (6*coeff (twoSquare3556 q) 2 j)*(6*coeff (twoSquare3556 q) 2 (j+2))≤
      (6*coeff (twoSquare3556 q) 2 (j+1))^2 by nlinarith
  by_cases hl : j+2≤q
  · rw [second_low_cubic3556 q j (by omega),second_low_cubic3556 q (j+2) hl,
      second_low_cubic3556 q (j+1) (by omega)]
    push_cast
    exact cubic_lc3556 j (by omega)
  · rw [second_high_cubic3556 q j (by omega) (by omega),
      second_high_cubic3556 q (j+2) (by omega) hj,
      second_high_cubic3556 q (j+1) (by omega) (by omega)]
    have hh := high_cubic_lc3556 (q:ℤ) ((j:ℤ)+1) (by omega) (by omega) (by omega)
    simpa only [add_sub_cancel_right,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,
      show (j:ℤ)+1+1=j+2 by ring] using hh

theorem source_two_vertical_two3556 (path : List Bool) (ha : (frame path).mid.a=2)
    (j : ℕ) :
    coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2)≤
      coeff (frame path).mid.p 2 (j+1)^2 := by
  obtain ⟨q,hq,hb,hp⟩ := source_two_squares3556 path ha
  change (frame path).mid.p=twoSquare3556 q at hp
  by_cases hj : j+2≤2*q
  · rw [hp]; exact second_column_inside_lc3556 q j hq hj
  · have hz := raw_outside_polygon18 path 2 (j+2) (by
      rw [ha,hb]; unfold InPolygon; omega)
    rw [hz,mul_zero]
    exact sq_nonneg _

#print axioms source_two_vertical_two3556
end
end MathGKM.Markov
