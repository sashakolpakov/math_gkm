import MarkovSingleLayerInteger9c20
/-! Machine-authored 68a44d34. Exact constant-coefficient degree refinement.
The degree marker is auxiliary and is not a published coefficient direction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

def countPair68 {R : Type*} [CommRing R] (x z : R) : List Bool → R × R
 | [] => (1,0)
 | r::rs => let (a,b) := countPair68 x z rs
   if r then (a,x*z*a+(z+x*z^2)*b) else (a+b,x*(a+z*b))

theorem countPair_exact68 {R : Type*} [CommRing R] (x z : R)
    (w : List Bool) (d : ℕ) :
    degreeEval07a7 x 0 z 0 1 d w =
      (countPair68 x z w).1+(countPair68 x z w).2*z^d := by
 induction w generalizing d with
 | nil => simp [degreeEval07a7,countPair68]
 | cons r rs ih =>
   obtain ⟨a,b⟩ := countPair68 x z rs
   cases r <;> simp [degreeEval07a7,countPair68,cutChargeA27,cutFactorA27,ih,pow_succ] <;> ring

def geomCount68 {R : Type*} [CommRing R] (t : R) (n : ℕ) : R :=
 ∑ k ∈ range n,t^k

theorem geomCount_succ68 {R : Type*} [CommRing R] (t : R) (n : ℕ) :
 geomCount68 t (n+1)=geomCount68 t n+t^n := by
 simp [geomCount68,Finset.sum_range_succ]

theorem geomCount_step68 {R : Type*} [CommRing R] (t : R) (n : ℕ) :
 geomCount68 t (n+1)=1+t*geomCount68 t n := by
 rw [geomCount68,Finset.sum_range_succ']
 simp only [pow_zero,geomCount68,Finset.mul_sum]
 congr 1
 apply Finset.sum_congr rfl
 intro k hk
 ring

theorem countPair_run_prefix68 {R : Type*} [CommRing R] (x z : R)
    (n : ℕ) (w : List Bool) :
    countPair68 x z (List.replicate n true++w)=
    ((countPair68 x z w).1,
      (z+x*z^2)^n*(countPair68 x z w).2+
      x*z*(countPair68 x z w).1*geomCount68 (z+x*z^2) n) := by
 induction n with
 | zero => simp [countPair68,geomCount68]
 | succ n ih =>
   rw [List.replicate_succ,List.cons_append,countPair68,if_pos rfl,ih,
     geomCount_step68,pow_succ]
   simp only
   congr 1
   ring

theorem countPair_run68 {R : Type*} [CommRing R] (x z : R) (n : ℕ) :
 countPair68 x z (List.replicate n true)=
   (1,x*z*geomCount68 (z+x*z^2) n) := by
 simpa [countPair68] using countPair_run_prefix68 x z n []

theorem singleA_count_formula68 {R : Type*} [CommRing R] (x z : R) (p q : ℕ) :
 degreeEval07a7 x 0 z 0 1 1
   (List.replicate p true++false::List.replicate q true)=
 1+x*z*geomCount68 (z+x*z^2) q+x*z^2*geomCount68 (z+x*z^2) p+
   x*z*(z+x*z^2)^p+
   x^2*z^3*geomCount68 (z+x*z^2) (p+1)*geomCount68 (z+x*z^2) q := by
 rw [countPair_exact68,countPair_run_prefix68]
 simp only [countPair68,Bool.false_eq_true,if_false,countPair_run68,pow_one]
 rw [geomCount_succ68]
 ring

theorem degreeLayer_zero_coeff68 (w : List Bool) (s d : ℕ) :
 (degreeLayer07a7 (X:ℤ[X]) w s d).coeff 0=degreeLayer07a7 (0:ℤ) w s d := by
 have h := degreeLayer_map9c20 (Polynomial.evalRingHom (0:ℤ)) (X:ℤ[X]) w s d
 simpa using h

theorem marked_count_coeff68 (w : List Bool) (s d : ℕ) :
 ((degreeEval07a7 (X:(ℤ[X])[X]) 0 (C X) 0 1 1 w).coeff s).coeff d =
   (degreeLayer07a7 (X:ℤ[X]) w s d).coeff 0 := by
 rw [degreeLayer_zero_coeff68]
 have h := degreeEval_coeff07a7 (0:ℤ[X]) X 0 1 1 w s
 simp only [map_zero,map_one] at h
 rw [h]
 simpa using degreeCoeff_layer07a7 (0:ℤ) w s d

#print axioms singleA_count_formula68
#print axioms marked_count_coeff68
end
end MathGKM.Markov
