import MarkovTypeMatrixA3c5
import MarkovSupport725
/-! Machine-authored request 56112359. Nonuniform C-site weighting.
Only weight one is identified with an actual source numerator. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000

def weightedFG561 : List ℤ → BiPoly × BiPoly
 | [] => (U+V,U+V+1)
 | t::ts =>
   let z := weightedFG561 ts
   let h := V*z.1+U*z.2
   let q := V*(h+C (C t)*z.1)+U*h
   (q,q+h)

def weightedMat561 : List ℤ → Mat16 BiPoly
 | [] => typeA3
 | t::ts => mm16 (typeB3 t) (weightedMat561 ts)

def weightedP561 (ts : List ℤ) : BiPoly :=
 V*(weightedFG561 ts).1+U*(weightedFG561 ts).2

theorem weighted_fg_matrix561 (ts : List ℤ) :
 let m := weightedMat561 ts
 let z := weightedFG561 ts
 m.a+U*m.b=z.1 ∧ m.c+U*m.d=U*z.2 := by
 induction ts with
 | nil => simp [weightedMat561,weightedFG561,typeA3]; constructor <;> ring
 | cons t ts ih =>
   obtain ⟨h1,h2⟩ := ih
   simp only [weightedMat561,weightedFG561,typeB3,typeA3,typeC3,mm16]
   constructor
   · linear_combination (V*(V+C (C t))+U*V)*h1+(V+U)*h2
   · linear_combination (U*V*(V+C (C t))+(U+1)*(U*V))*h1+
       (U*V+(U+1)*U)*h2

theorem weighted_scalar561 (ts : List ℤ) :
 weightedP561 ts=typeScalar3 (weightedMat561 ts) := by
 obtain ⟨h1,h2⟩ := weighted_fg_matrix561 ts
 dsimp [weightedP561,typeScalar3]
 linear_combination -V*h1-h2

theorem weighted_uniform561 (t : ℤ) (n : ℕ) :
 weightedMat561 (List.replicate n t)=typeMat3 t n := by
 induction n with
 | zero => rfl
 | succ n ih => simp [List.replicate_succ,weightedMat561,typeMat3,ih]

theorem weighted_source561 :
 weightedP561 [1,1,1,1,1]=(frame (List.replicate 5 true)).mid.p := by
 rw [weighted_scalar561]
 change typeScalar3 (weightedMat561 (List.replicate 5 1))=_
 rw [weighted_uniform561,← source_type_matrix3]

theorem coeff_const_mul561 (t : ℤ) (p : BiPoly) (i j : ℕ) :
 coeff (C (C t)*p) i j=t*coeff p i j := by
 simp [coeff,Polynomial.coeff_C_mul]

theorem weighted_triple561 (t : ℤ) :
 coeff (weightedP561 [t,1,t,1,t]) 4 3=2*t^2+12*t+2 ∧
 coeff (weightedP561 [t,1,t,1,t]) 5 3=20*t^2+132*t+112 ∧
 coeff (weightedP561 [t,1,t,1,t]) 6 3=t^3+42*t^2+369*t+592 := by
 norm_num [weightedP561,weightedFG561,coeff_add,coeff_const_mul561,
   coeff_U_succ725,coeff_U_zero725,coeff_V_succ725,coeff_V_zero725,
   coeff,U,V,Polynomial.coeff_add,Polynomial.coeff_one,Polynomial.coeff_X,
   Polynomial.coeff_C,Polynomial.coeff_C_mul,Polynomial.coeff_X_mul] <;> ring

#print axioms weighted_source561
#print axioms weighted_triple561
end
end MathGKM.Markov
