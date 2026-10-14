import MarkovPellSum9a72
/-! Machine-authored 654a72ea. Exact whole-family generating equation.
The positive lower-excess regrading is documented separately, not assumed here. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries

def pellFamily654a : ℕ → BiPoly
 | 0 => 1
 | n+1 => rightP650 n

theorem pell_rec654a (n : ℕ) :
 pellFamily654a (n+2)=S*(U+V)*pellFamily654a (n+1)-U*V*pellFamily654a n := by
 cases n with
 | zero =>
   norm_num [pellFamily654a,rightP650,frame,initial,advance]
 | succ n => exact right_rec650 n

def pellSeries654a : PowerSeries BiPoly := mk pellFamily654a
def pellDenom654a : PowerSeries BiPoly :=
 1-C (S*(U+V))*X+C (U*V)*X^2

theorem pell_generating654a :
 pellDenom654a*pellSeries654a=1-C V*X := by
 apply PowerSeries.ext
 intro n
 simp only [pellDenom654a,add_mul,sub_mul,one_mul,mul_assoc,
   map_add,map_sub,coeff_C_mul]
 rcases n with _ | (_ | n)
 · simp [pellSeries654a,pellFamily654a,coeff_X_pow_mul']
 · simp [pellSeries654a,pellFamily654a,rightP650,frame,initial,S,
     coeff_X_pow_mul']
   ring
 · simp only [coeff_succ_X_mul,coeff_X_pow_mul',
     show 2 ≤ n+1+1 by omega,if_true,show n+1+1-2=n by omega,
     pellSeries654a,coeff_mk,coeff_one,coeff_X,
     show n+1+1 ≠ 0 by omega,show n+1+1 ≠ 1 by omega,
     if_false,mul_zero,sub_zero]
   have h := pell_rec654a n
   linear_combination h

#print axioms pell_rec654a
#print axioms pell_generating654a
end
end MathGKM.Markov
