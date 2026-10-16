import MarkovSourceLinearValueM553
import MarkovFibonacciLC6ade
/-! Machine-authored 55306a3b. Every fixed rational center grid fails on an
actual source family. This refutes only the restricted certificate strategy. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
attribute [local irreducible] frame coeff

def gridPathM553 (d : ℕ) : List Bool := List.replicate (16*d+3) false

theorem choose_two_scaledM553 (t : ℕ) :
 2*((t+2).choose 2:ℝ)=((t:ℝ)+1)*(t+2) := by
 have h := Nat.descFactorial_eq_factorial_mul_choose (t+2) 2
 norm_num [Nat.descFactorial_succ] at h
 exact_mod_cast h.symm

theorem choose_three_scaledM553 (t : ℕ) :
 6*((t+3).choose 3:ℝ)=((t:ℝ)+1)*(t+2)*(t+3) := by
 have h := Nat.descFactorial_eq_factorial_mul_choose (t+3) 3
 norm_num [Nat.descFactorial_succ] at h
 exact_mod_cast h.symm

theorem grid_source_tripleM553 (d : ℕ) :
 let p := (frame (gridPathM553 d)).mid.p
 let s := 8*d+2
 (coeff p 1 s:ℝ)=8*d+3 ∧
 2*(coeff p 2 s:ℝ)=(8*d+2)*(8*d+3)*(8*d+4) ∧
 12*(coeff p 3 s:ℝ)=(8*d+2)*(8*d+1)*(8*d+3)*(8*d+4)*(8*d+5) := by
 dsimp only
 have h0 := source_one_coeff6 (gridPathM553 d)
   (left_spine_a274 _) 0 (8*d+2) (8*d+2) (by rw [gridPathM553,spine_b6]; omega)
 have h1 := source_one_coeff6 (gridPathM553 d)
   (left_spine_a274 _) 1 (8*d+2) (8*d+1) (by rw [gridPathM553,spine_b6]; omega)
 have h2 := source_one_coeff6 (gridPathM553 d)
   (left_spine_a274 _) 2 (8*d+2) (8*d) (by rw [gridPathM553,spine_b6]; omega)
 rw [Nat.choose_symm_of_eq_add (n:=1+1+(8*d+2)) (a:=8*d+2) (b:=2) (by omega)] at h1
 rw [Nat.choose_symm_of_eq_add (n:=2+1+(8*d+2)) (a:=8*d+2) (b:=3) (by omega)] at h2
 have hc1 := choose_two_scaledM553 (8*d+2)
 have hc2 := choose_two_scaledM553 (8*d)
 have hc3 := choose_three_scaledM553 (8*d+2)
 norm_num [Nat.choose_succ_self_right,Nat.choose_one_right] at h0 h1 h2
 constructor
 · rw [h0]; push_cast; ring
 constructor
 · rw [h1]
   push_cast at hc1 ⊢
   convert congrArg (fun z:ℝ => (8*d+2)*z) hc1 using 1 <;> ring
 · rw [h2]
   push_cast at hc2 hc3 ⊢
   convert congrArg₂ (fun x y:ℝ => x*y) hc2 hc3 using 1 <;> ring

theorem grid_source_growthM553 (d : ℕ) :
 let p := (frame (gridPathM553 d)).mid.p
 let s := 8*d+2
 4*(d:ℝ)*((coeff p 1 s:ℝ)+coeff p 2 s) ≤ coeff p 3 s := by
 dsimp only
 obtain ⟨hL,hM,hR⟩ := grid_source_tripleM553 d
 have he : 12*((coeff (frame (gridPathM553 d)).mid.p 3 (8*d+2):ℝ)-
   4*d*((coeff (frame (gridPathM553 d)).mid.p 1 (8*d+2):ℝ)+
     coeff (frame (gridPathM553 d)).mid.p 2 (8*d+2)))=
   120+1472*(d:ℝ)+9024*(d:ℝ)^2+29696*(d:ℝ)^3+
     49152*(d:ℝ)^4+32768*(d:ℝ)^5 := by
   linear_combination hR-24*(d:ℝ)*hM-48*(d:ℝ)*hL
 have hn : (0:ℝ)≤120+1472*(d:ℝ)+9024*(d:ℝ)^2+29696*(d:ℝ)^3+
     49152*(d:ℝ)^4+32768*(d:ℝ)^5 := by positivity
 nlinarith only [he,hn]

theorem grid_source_polygonM553 (d i : ℕ) (hi : 1≤i) (hi' : i≤3) :
 InPolygon (frame (gridPathM553 d)).mid.a (frame (gridPathM553 d)).mid.b i (8*d+2) := by
 rw [gridPathM553,left_spine_a274,spine_b6]
 unfold InPolygon
 constructor
 · nlinarith
 · omega

theorem source_fixed_grid_failureM553 (d : ℕ) (hd : 0<d) (z : ℤ) :
 let p := (frame (gridPathM553 d)).mid.p
 let s := 8*d+2
 tripleLinearM553 2 (coeff p 1 s) (coeff p 2 s) (coeff p 3 s) ((z:ℝ)/d)<0 := by
 dsimp only
 apply integer_grid_negativeM553 _ _ _ d hd
 · rw [(grid_source_tripleM553 d).1]
   positivity
 · exact_mod_cast raw_coeff_nonneg18 (gridPathM553 d) 2 (8*d+2)
 · exact grid_source_growthM553 d

theorem source_fixed_grid_moment_failureM553 (d : ℕ) (hd : 0<d) (z : ℤ) :
 linearMomentM553
   ((hresidualM511 (X:ℤ[X]) (sourceWord28 (gridPathM553 d)) (8*d+2)).map
     (Int.castRingHom ℝ)) 0 1 ((z:ℝ)/d)<0 := by
 have hb : (frame (gridPathM553 d)).mid.b=16*d+5 := by
   rw [gridPathM553,spine_b6]; omega
 have h := source_horizontal_linear_valueM553 (gridPathM553 d) 1 (8*d+2) ((z:ℝ)/d)
   (by rw [hb]; omega)
 have hn : (frame (gridPathM553 d)).mid.b-2*(8*d+2)-1=0 := by rw [hb]; omega
 rw [hn] at h
 norm_num only [Nat.zero_add,Nat.cast_ofNat] at h
 rw [h]
 exact source_fixed_grid_failureM553 d hd z

theorem source_grid_scopeM553 (d : ℕ) :
 let m := (frame (gridPathM553 d)).mid
 m.a=1 ∧ m.b=16*d+5 ∧
 InPolygon m.a m.b 1 (8*d+2) ∧ InPolygon m.a m.b 2 (8*d+2) ∧
 InPolygon m.a m.b 3 (8*d+2) ∧
 coeff m.p 1 (8*d+2)*coeff m.p 3 (8*d+2)≤coeff m.p 2 (8*d+2)^2 := by
 dsimp only
 have ha : (frame (gridPathM553 d)).mid.a=1 := left_spine_a274 _
 have hb : (frame (gridPathM553 d)).mid.b=16*d+5 := by
   rw [gridPathM553,spine_b6]; omega
 refine ⟨ha,hb,grid_source_polygonM553 d 1 (by omega) (by omega),
   grid_source_polygonM553 d 2 (by omega) (by omega),
   grid_source_polygonM553 d 3 (by omega) (by omega),?_⟩
 exact (source_one_weakLC6 (gridPathM553 d) ha).1 1 (8*d+2)
   (grid_source_polygonM553 d 1 (by omega) (by omega))
   (grid_source_polygonM553 d 2 (by omega) (by omega))
   (grid_source_polygonM553 d 3 (by omega) (by omega))

end
end MathGKM.Markov
