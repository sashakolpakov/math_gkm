import MarkovVerticalEquivalenceM0D3
/-! Machine-authored request 29509309. An obstruction to fixed-shift
summand certificates, contrasted with its valid raw source triple. -/
namespace MathGKM.Markov
noncomputable section
open Finset

def lowerTermM295 (i j d h : ℕ) : ℤ :=
 ((2*d).choose h:ℤ)*((2*i-2-h).choose i:ℤ)*
 (((j+i+1).choose (2*i-1-h):ℤ)+((j+i).choose (2*i-1-h):ℤ))

theorem every_fixed_shift_failsM295 (s : ℕ) :
 ¬ (∀ i j d h k : ℕ,
 lowerTermM295 i j (d+2) h*lowerTermM295 i (j+2) d k ≤
 lowerTermM295 i (j+1) (d+1) (min (h+s) k)*
 lowerTermM295 i (j+1) (d+1) (max (h+s) k-s)) := by
 intro h
 have hh := h 3 0 0 1 0
 have he : max (1+s) 0-s=1 := by omega
 rw [he] at hh
 norm_num [lowerTermM295,Nat.choose] at hh

theorem obstruction_source_valuesM295 :
 let m := (frame (twoPath3af 1)).mid
 m.a=2 ∧ m.b=5 ∧ coeff m.p 3 0=4 ∧ coeff m.p 3 1=16 ∧ coeff m.p 3 2=28 := by
 dsimp only
 obtain ⟨ha,hb⟩ := two_path_labels3af 1
 have hb' : (frame (twoPath3af 1)).mid.b=5 := by simpa using hb
 refine ⟨ha,hb',?_,?_,?_⟩
 · rw [source_two_lower_formulaM58E _ 0 2 3 ha (by omega)]
   norm_num [lowerValM58E,sum_range_succ,Nat.choose]
 · rw [source_two_lower_formulaM58E _ 1 1 3 ha (by omega)]
   norm_num [lowerValM58E,sum_range_succ,Nat.choose]
 · rw [source_two_lower_formulaM58E _ 2 0 3 ha (by omega)]
   norm_num [lowerValM58E,sum_range_succ,Nat.choose]

theorem obstruction_source_validM295 :
 let m := (frame (twoPath3af 1)).mid
 InPolygon m.a m.b 3 0 ∧ InPolygon m.a m.b 3 1 ∧ InPolygon m.a m.b 3 2 ∧
 coeff m.p 3 0*coeff m.p 3 2 ≤ coeff m.p 3 1^2 := by
 dsimp only
 obtain ⟨ha,hb,h0,h1,h2⟩ := obstruction_source_valuesM295
 rw [ha,hb,h0,h1,h2]
 norm_num [InPolygon]

end
end MathGKM.Markov
