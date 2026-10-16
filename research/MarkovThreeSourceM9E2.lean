import MarkovTwoCompleteM8F7
import MarkovThirdAllMF8
/-! Machine-authored 9e205206685d4a9cbba612509f4cc95e.
Exact positive cubic formulas for every numerator-three source. No LC assertion. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def threePathM9E2 (n : ℕ) (r : Bool) : List Bool :=
 List.replicate n false ++ [true,r]

theorem source_three_pathM9E2 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ n r, path=threePathM9E2 n r := by
 rcases split_first_true025 path with ⟨n,rfl⟩|⟨n,rest,rfl⟩
 · have h := (source_left_spine_indicesMDE6 n).1
   omega
 · have hi := (source_vertical_indicesMDE6 n rest).1
   have hb : (frame rest).mid.b=3 := by omega
   obtain ⟨ha0,hab,_⟩ := frame_reduced rest
   have hh : (frame rest).mid.a=1 ∨ (frame rest).mid.a=2 := by omega
   rcases hh with hh|hh
   · have he : rest=[false] := frame_path_injective_098
       (hh.trans (by norm_num [frame,initial,advance]))
       (hb.trans (by norm_num [frame,initial,advance]))
     subst rest
     exact ⟨n,false,rfl⟩
   · have he : rest=[true] := frame_path_injective_098
       (hh.trans (by norm_num [frame,initial,advance]))
       (hb.trans (by norm_num [frame,initial,advance]))
     subst rest
     exact ⟨n,true,rfl⟩

def threeCubicM9E2 {R : Type*} [CommRing R] (s v x y : R) (r : Bool) : R :=
 if r then x^3+v*x*y^2+s*v*y^3 else s*x^3+v*x^2*y+v^2*y^3

def threePolyM9E2 (q : ℕ) (r : Bool) : BiPoly :=
 threeCubicM9E2 S V (fib6 (q+1)) (fib6 q) r

theorem three_path_labelsM9E2 (n : ℕ) (r : Bool) :
 (frame (threePathM9E2 n r)).mid.a=3 ∧
 (frame (threePathM9E2 n r)).mid.b=3*(n+1)+(if r then 1 else 2) := by
 have he : threePathM9E2 n r=(List.replicate n false++[true])++[r] := by
   simp [threePathM9E2]
 rw [he,frame_append18,frame_append18,spine_frame6]
 cases r <;> simp [advance] <;> omega

theorem three_path_polynomialM9E2 (n : ℕ) (r : Bool) :
 (frame (threePathM9E2 n r)).mid.p=threePolyM9E2 (n+1) r := by
 have he : threePathM9E2 n r=(List.replicate n false++[true])++[r] := by
   simp [threePathM9E2]
 rw [he,frame_append18,frame_append18,spine_frame6]
 have hc := fib_square_product3556 (n+1)
 have hn : n+1+1=n+2 := by omega
 rw [hn] at hc
 cases r
 · simp only [advance,if_true,Bool.false_eq_true,if_false,pow_one,mul_one]
   unfold threePolyM9E2 threeCubicM9E2
   simp only [Bool.false_eq_true,if_false,hn]
   have hv : V^(n+2)=V*V^(n+1) := by rw [show n+2=(n+1)+1 by omega,pow_succ]; ring
   rw [hv]
   linear_combination (S*fib6 (n+2)+V*fib6 (n+1))*hc
 · simp only [advance,if_true,pow_one,mul_one]
   unfold threePolyM9E2 threeCubicM9E2
   simp only [if_true,hn]
   linear_combination (S*fib6 (n+1)+fib6 (n+2))*hc

theorem source_three_cubicM9E2 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1≤q ∧ (frame path).mid.b=3*q+(if r then 1 else 2) ∧
   (frame path).mid.p=threePolyM9E2 q r := by
 obtain ⟨n,r,rfl⟩ := source_three_pathM9E2 path ha
 exact ⟨n+1,r,by omega,(three_path_labelsM9E2 n r).2,three_path_polynomialM9E2 n r⟩

def ThreeGoalM9E2 : Prop := ∀ q : ℕ, 1≤q → ∀ r, GlobalLC18 (threePolyM9E2 q r)
def OtherFourM9E2 : Prop := ∀ path : List Bool, 4≤(frame path).mid.a →
 GlobalLC18 (frame path).mid.p

theorem root_iff_three_and_fourM9E2 : Conjecture63 ↔ ThreeGoalM9E2 ∧ OtherFourM9E2 := by
 rw [root_iff_other_sourcesM8F7]
 constructor
 · intro h
   constructor
   · intro q hq r
     obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
     rw [←three_path_polynomialM9E2]
     exact h _ (by rw [(three_path_labelsM9E2 n r).1])
   · intro path ha
     exact h path (by omega)
 · rintro ⟨h3,h4⟩ path ha
   by_cases h : (frame path).mid.a=3
   · obtain ⟨q,r,hq,_,hp⟩ := source_three_cubicM9E2 path h
     rw [hp]
     exact h3 q hq r
   · exact h4 path (by omega)

end
end MathGKM.Markov
