import MarkovAtomicSupportMEA423
import MarkovVerticalBlockWordMDE6

/-! Machine-authored 10d15751. A source-prefix auxiliary obstruction.
This does not refute the raw source conjecture. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def hstateM10D (w : List Bool) : BiPoly × BiPoly :=
 hpairMEA423 (hKwordM511 (X:ℤ[X]) w)

theorem hstate_nilM10D : hstateM10D []=(1,0) := by
 simp [hstateM10D,hpairMEA423,hKwordM511,projProduct6905,hdiffM511]

theorem hstate_appendM10D (w : List Bool) (r : Bool) :
 hstateM10D (w++[r])=hstepMEA423 (hstateM10D w) r := by
 unfold hstateM10D
 rw [hKwordM511,List.map_append,projProduct_append6905]
 simp only [List.map_cons,List.map_nil,projProduct_single6905]
 exact hpair_mulMEA423 _ r

theorem hstate_run_lowM10D (n : ℕ) :
 let z := hstateM10D (List.replicate (n+2) false)
 z.1.coeff 0=0 ∧ z.2.coeff 0=1 ∧
 z.1.coeff 1=X ∧ z.2.coeff 1=1+(n+1:ℤ[X])*X := by
 induction n with
 | zero =>
   dsimp only
   rw [show List.replicate (0+2) false=[false]++[false] by rfl]
   rw [hstate_appendM10D]
   have h : hstateM10D [false]=hstepMEA423 (1,0) false := by
     simpa only [List.nil_append,hstate_nilM10D] using hstate_appendM10D [] false
   rw [h]
   norm_num [hstepMEA423,U,V,add_mul,Polynomial.coeff_add,Polynomial.coeff_C_mul,
     Polynomial.coeff_X_mul,Polynomial.coeff_one] <;> ring
 | succ n ih =>
   dsimp only at ih ⊢
   have he : List.replicate (n+1+2) false=List.replicate (n+2) false++[false] := by
     rw [show n+1+2=(n+2)+1 by omega,List.replicate_add]
     rfl
   rw [he,hstate_appendM10D]
   obtain ⟨h0,g0,h1,g1⟩ := ih
   simp only [hstepMEA423,Bool.false_eq_true,ite_false,U,V,map_add,map_one,add_mul,one_mul,
     Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_mul_zero,
     Polynomial.coeff_X_mul,h0,g0,h1,g1]
   simp only [zero_add,add_zero,mul_zero,mul_one,true_and]
   push_cast
   ring

theorem hstate_run_BA_rowM10D (n : ℕ) :
 ((hstateM10D (List.replicate (n+2) false++[true,false])).1).coeff 2=
 2*X+5*X^2+(n+4:ℤ[X])*X^3 := by
 have he : List.replicate (n+2) false++[true,false]=
   (List.replicate (n+2) false++[true])++[false] := by simp
 rw [he,hstate_appendM10D,hstate_appendM10D]
 have hex (z : BiPoly × BiPoly) :
   (hstepMEA423 (hstepMEA423 z true) false).1=
   X*(C (X^2)*(z.1+z.2))+
   X^2*(C ((X+1)^2*(2*X+1))*z.1+C (2*X*(X+1)^2)*z.2)+
   X^3*(C ((X+1)^4)*z.1+C (X*(X+1)^3)*z.2) := by
   simp only [hstepMEA423,Bool.false_eq_true,ite_false,ite_true,U,V,
     map_add,map_mul,map_pow,map_one,map_ofNat]
   ring
 rw [hex]
 obtain ⟨h0,g0,h1,g1⟩ := hstate_run_lowM10D n
 norm_num only [Polynomial.coeff_add,show (X:BiPoly)^2=X*X by ring,
   show (X:BiPoly)^3=X*(X*X) by ring,mul_assoc,
   Polynomial.coeff_X_mul,Polynomial.coeff_X_mul_zero,Polynomial.coeff_C_mul,
   h0,g0,h1,g1,mul_zero,mul_one,add_zero,zero_add]
 push_cast
 ring

theorem hstate_run_BA_tripleM10D (n : ℕ) :
 let f := (hstateM10D (List.replicate (n+2) false++[true,false])).1
 coeff f 2 1=2 ∧ coeff f 2 2=5 ∧ coeff f 2 3=(n:ℤ)+4 := by
 dsimp only
 change (((hstateM10D _).1).coeff 2).coeff 1=2 ∧ _
 rw [hstate_run_BA_rowM10D]
 change _ ∧ (((hstateM10D _).1).coeff 2).coeff 2=5 ∧ (((hstateM10D _).1).coeff 2).coeff 3=_
 rw [hstate_run_BA_rowM10D]
 simp only [add_mul,Polynomial.coeff_add,Polynomial.coeff_natCast_mul]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow,
   Polynomial.coeff_one,Polynomial.coeff_X]

theorem hstate_run_BA_failureM10D (n : ℕ) (hn : 9≤n) :
 let f := (hstateM10D (List.replicate (n+2) false++[true,false])).1
 coeff f 2 2^2 < coeff f 2 1*coeff f 2 3 := by
 dsimp only
 obtain ⟨h1,h2,h3⟩ := hstate_run_BA_tripleM10D n
 rw [h1,h2,h3]
 have hn' : (9:ℤ)≤n := by exact_mod_cast hn
 nlinarith

end
end MathGKM.Markov
