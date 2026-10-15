import MarkovFibonacciGrading7d90
import MarkovAlignedLC6d2c
import MarkovFibonacciFormula6ade
/-! Machine-authored 7d905904. Actual degree-layer multiplicities and
adjacent-layer aggregation for every numerator-one source, all cut counts. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem central_left7d (n : ℕ) :
 central28 (List.replicate n false)=List.replicate n false := by
 have hs (k : ℕ) : subst28 false (List.replicate k false)=List.replicate k false := by
   induction k with
   | zero => rfl
   | succ k ih => simp [List.replicate_succ,subst28,ih]
 induction n with
 | zero => rfl
 | succ n ih => simp [List.replicate_succ,central28,ih,hs,←List.replicate_succ']

theorem fibonacci_layer_coeff7d (n s d j : ℕ) :
 (degreeLayer07a7 (X:ℤ[X]) (List.replicate n false++[true]) s d).coeff j=
 (fibonacciLayerCount7d n s d:ℤ)*(d.choose j:ℤ) := by
 rw [fibonacci_layer_power7d]
 rw [show (fibonacciLayerCount7d n s d:ℤ[X])=C (fibonacciLayerCount7d n s d:ℤ) by simp]
 rw [Polynomial.coeff_C_mul,Polynomial.coeff_one_add_X_pow]

theorem fibonacci_adjacent_layers_lc7d (n s d j : ℕ) (u v : ℤ)
 (hu : 0≤u) (hv : 0≤v) :
 let p := C u*degreeLayer07a7 (X:ℤ[X]) (List.replicate n false++[true]) s d+
   C v*degreeLayer07a7 X (List.replicate n false++[true]) s (d+1)
 p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 dsimp only
 rw [fibonacci_layer_power7d,fibonacci_layer_power7d]
 let A : ℤ := u*fibonacciLayerCount7d n s d
 let B : ℤ := v*fibonacciLayerCount7d n s (d+1)
 have hA : 0≤A := mul_nonneg hu (by positivity)
 have hB : 0≤B := mul_nonneg hv (by positivity)
 have hp : C u*((fibonacciLayerCount7d n s d:ℤ[X])*(1+X)^d)+
     C v*((fibonacciLayerCount7d n s (d+1):ℤ[X])*(1+X)^(d+1))=
     X^0*((1+X)^d*(C (A+B)+C B*X)) := by
   simp only [A,B,map_add,map_mul,map_natCast,pow_succ,pow_zero,one_mul]
   ring
 rw [hp]
 exact linear_binomial_integer_lc6d 0 d j (A+B) B (add_nonneg hA hB) hB

theorem source_one_adjacent_layers_lc7d (path : List Bool)
 (ha : (frame path).mid.a=1) (s d j : ℕ) (u v : ℤ)
 (hu : 0≤u) (hv : 0≤v) :
 let p := C u*degreeLayer07a7 (X:ℤ[X]) (central28 path++[true]) s d+
   C v*degreeLayer07a7 X (central28 path++[true]) s (d+1)
 p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 obtain ⟨n,rfl⟩ := source_one_spine274 path ha
 rw [central_left7d]
 exact fibonacci_adjacent_layers_lc7d n s d j u v hu hv

#print axioms central_left7d
#print axioms fibonacci_layer_coeff7d
#print axioms source_one_adjacent_layers_lc7d
end
end MathGKM.Markov
