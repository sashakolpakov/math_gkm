import MarkovAmbientKernel5c90
/-! Machine-authored 5c90b506. Exact extracted horizontal kernel.
Every equality is denominator-cleared in ordinary formal power series. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

theorem ambient_pell_constant5c {R : Type*} [CommRing R] (y : R) (n : ℕ) :
 (ambientPell5c X (C y) n).coeff 0=1 := by
 induction n using Nat.twoStepInduction with
 | zero => simp [ambientPell5c]
 | one => simp [ambientPell5c]
 | more n h0 h1 =>
   simp only [ambientPell5c,Polynomial.coeff_sub,Polynomial.mul_coeff_zero,
     Polynomial.coeff_add,Polynomial.coeff_one,Polynomial.coeff_C,
     Polynomial.coeff_X,one_ne_zero,if_false,if_true,zero_mul,add_zero,h0,h1]
   ring

theorem ambient_pell_coeff_rec5c {R : Type*} [CommRing R] (y : R) (n s : ℕ) :
 (ambientPell5c X (C y) (n+2)).coeff (s+1)=
 (1+y)*(ambientPell5c X (C y) (n+1)).coeff (s+1)+
 (1+y)^2*(ambientPell5c X (C y) (n+1)).coeff s-
 y*(ambientPell5c X (C y) n).coeff (s+1) := by
 rw [ambientPell5c]
 have he : (1+C y+X*(1+C y)^2 : Polynomial R)=
     C (1+y)+X*C ((1+y)^2) := by simp
 rw [he,add_mul]
 simp only [Polynomial.coeff_add,Polynomial.coeff_sub,mul_assoc,
   Polynomial.coeff_X_mul,Polynomial.coeff_C_mul]

def ambientSliceSeries5c {R : Type*} [CommRing R] (y : R) (s : ℕ) : PowerSeries R :=
 PowerSeries.mk (fun n => (ambientPell5c X (C y) n).coeff s)

theorem ambient_slice_zero5c {R : Type*} [CommRing R] (y : R) :
 ambientSliceSeries5c y 0*(1-PowerSeries.X)=1 := by
 apply PowerSeries.ext
 intro n
 cases n with
 | zero => simp [ambientSliceSeries5c,ambient_pell_constant5c,sub_mul,mul_sub]
 | succ n =>
   simp [ambientSliceSeries5c,ambient_pell_constant5c,mul_sub,
     PowerSeries.coeff_succ_mul_X]

theorem ambient_slice_step5c {R : Type*} [CommRing R] (y : R) (s : ℕ) :
 (1-PowerSeries.X)*(1-PowerSeries.C y*PowerSeries.X)*ambientSliceSeries5c y (s+1)=
 PowerSeries.X*PowerSeries.C ((1+y)^2)*ambientSliceSeries5c y s := by
 have hd : (1-PowerSeries.X)*(1-PowerSeries.C y*PowerSeries.X)=
   (1-PowerSeries.C (1+y)*PowerSeries.X+PowerSeries.C y*PowerSeries.X^2 : PowerSeries R) := by
   simp only [map_add,map_one]; ring
 rw [hd]
 apply PowerSeries.ext
 intro n
 simp only [add_mul,sub_mul,one_mul,mul_assoc,map_add,map_sub,
   PowerSeries.coeff_C_mul]
 rcases n with _ | (_ | n)
 · simp [ambientSliceSeries5c,ambientPell5c,PowerSeries.coeff_X_pow_mul',
     Polynomial.coeff_one,Nat.succ_ne_zero]
 · have hc : (1+C y : Polynomial R)^2=C ((1+y)^2) := by simp
   simp [ambientSliceSeries5c,ambientPell5c,PowerSeries.coeff_X_pow_mul',
     PowerSeries.coeff_succ_X_mul,Polynomial.coeff_X_mul]
   rw [hc]
   cases s <;> simp only [Polynomial.coeff_C,Polynomial.coeff_one,
     Nat.succ_ne_zero,if_false,if_true,mul_zero,mul_one,sub_zero]
 · simp only [PowerSeries.coeff_succ_X_mul,PowerSeries.coeff_X_pow_mul',
     show 2 ≤ n+1+1 by omega,if_true,show n+1+1-2=n by omega,
     ambientSliceSeries5c,PowerSeries.coeff_mk,PowerSeries.coeff_C_mul]
   have h := ambient_pell_coeff_rec5c y n s
   linear_combination h

theorem ambient_slice_denominator5c {R : Type*} [CommRing R] (y : R) (s : ℕ) :
 ambientSliceSeries5c y s*(1-PowerSeries.X)^(s+1)*
   (1-PowerSeries.C y*PowerSeries.X)^s=
 PowerSeries.X^s*PowerSeries.C ((1+y)^(2*s)) := by
 induction s with
 | zero => simpa using ambient_slice_zero5c y
 | succ s ih =>
   calc
    _ = ((1-PowerSeries.X)*(1-PowerSeries.C y*PowerSeries.X)*
      ambientSliceSeries5c y (s+1))*(1-PowerSeries.X)^(s+1)*
      (1-PowerSeries.C y*PowerSeries.X)^s := by simp only [pow_succ]; ring
    _ = (PowerSeries.X*PowerSeries.C ((1+y)^2))*
      (ambientSliceSeries5c y s*(1-PowerSeries.X)^(s+1)*
        (1-PowerSeries.C y*PowerSeries.X)^s) := by rw [ambient_slice_step5c]; ring
    _ = _ := by
      rw [ih,show 2*(s+1)=2*s+2 by omega]
      simp only [pow_add,map_mul,pow_one]
      ring

#print axioms ambient_slice_step5c
#print axioms ambient_slice_denominator5c
end
end MathGKM.Markov
