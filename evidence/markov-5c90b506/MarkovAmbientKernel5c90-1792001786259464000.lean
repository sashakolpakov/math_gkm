import MarkovShearedTransfer5c90
/-! Machine-authored 5c90b506. The Pell horizontal generating kernel and an
actual source obstruction to real-rootedness of the ambient polynomial. -/
namespace MathGKM.Markov
noncomputable section

def ambientPell5c {R : Type*} [CommRing R] (x y : R) : ℕ → R
 | 0 => 1
 | 1 => 1+x*(1+y)^2
 | n+2 => (1+y+x*(1+y)^2)*ambientPell5c x y (n+1)-y*ambientPell5c x y n

theorem ambient_scalar_rec5c {R : Type*} [CommRing R] (x y : R) (w : List Bool) :
 ambientScalar5c x y (true::true::w)=
 (1+y+x*(1+y)^2)*ambientScalar5c x y (true::w)-y*ambientScalar5c x y w := by
 simp only [ambientScalar5c,ambientWord5c,ambientT5c,if_true,mm16]
 ring

theorem ambient_replicate_pell5c {R : Type*} [CommRing R] (x y : R) (n : ℕ) :
 ambientScalar5c x y (List.replicate n true)=ambientPell5c x y (n+1) := by
 induction n using Nat.twoStepInduction with
 | zero => simp [ambientScalar5c,ambientWord5c,ambientPell5c]; ring
 | one => simp [ambientScalar5c,ambientWord5c,ambientT5c,ambientPell5c,mm16]; ring
 | more n h0 h1 =>
   simpa only [List.replicate_succ,ambientPell5c,h0,h1] using
     ambient_scalar_rec5c x y (List.replicate n true)

def ambientPellSeries5c {R : Type*} [CommRing R] (x y : R) : PowerSeries R :=
 PowerSeries.mk (ambientPell5c x y)

theorem ambient_pell_generating5c {R : Type*} [CommRing R] (x y : R) :
 ((1-PowerSeries.X)*(1-PowerSeries.C y*PowerSeries.X)-
   PowerSeries.C (x*(1+y)^2)*PowerSeries.X)*ambientPellSeries5c x y=
 1-PowerSeries.C y*PowerSeries.X := by
 have hd : (1-PowerSeries.X)*(1-PowerSeries.C y*PowerSeries.X)-
     PowerSeries.C (x*(1+y)^2)*PowerSeries.X =
   (1-PowerSeries.C (1+y+x*(1+y)^2)*PowerSeries.X+
     PowerSeries.C y*PowerSeries.X^2 : PowerSeries R) := by
   simp only [map_add,map_one]; ring
 rw [hd]
 apply PowerSeries.ext
 intro n
 simp only [add_mul,sub_mul,one_mul,mul_assoc,
   map_add,map_sub,PowerSeries.coeff_C_mul]
 rcases n with _ | (_ | n)
 · simp [ambientPellSeries5c,ambientPell5c,PowerSeries.coeff_X_pow_mul']
 · simp [ambientPellSeries5c,ambientPell5c,PowerSeries.coeff_X_pow_mul']
   ring
 · simp only [PowerSeries.coeff_succ_X_mul,PowerSeries.coeff_X_pow_mul',
     show 2 ≤ n+1+1 by omega,if_true,show n+1+1-2=n by omega,
     ambientPellSeries5c,PowerSeries.coeff_mk,PowerSeries.coeff_one,PowerSeries.coeff_X,
     show n+1+1 ≠ 0 by omega,show n+1+1 ≠ 1 by omega,
     if_false,mul_zero,sub_zero]
   rw [show n+1+1=n+2 by omega,ambientPell5c]
   ring

/-- Family-index log convexity is different from any pinned slice direction. -/
theorem ambient_pell_cassini5c {R : Type*} [CommRing R] (x y : R) (n : ℕ) :
 ambientPell5c x y n*ambientPell5c x y (n+2)-ambientPell5c x y (n+1)^2=
 x*y^(n+1)*(1+y)^2 := by
 induction n with
 | zero => simp [ambientPell5c]; ring
 | succ n ih =>
   have hrec := (show ambientPell5c x y (n+2)=
     (1+y+x*(1+y)^2)*ambientPell5c x y (n+1)-y*ambientPell5c x y n from rfl)
   rw [show n+1+2=(n+1)+2 by omega,ambientPell5c]
   rw [show n+1+1=n+2 by omega,pow_succ]
   calc
    _ = y*(ambientPell5c x y n*ambientPell5c x y (n+2)-
      ambientPell5c x y (n+1)^2) := by rw [hrec]; ring
    _ = _ := by rw [ih]; ring

theorem ambient_false_exact5c {R : Type*} [CommRing R] (x y : R) :
 ambientScalar5c x y [false]=1+2*x*(1+y)+x^2*(1+y)^3 := by
 simp [ambientScalar5c,ambientWord5c,ambientT5c,mm16]
 ring

theorem ambient_source_one_third5c :
 horizontalShear5c (frame [false]).mid.p=
 U*(1+2*U*(1+V)+U^2*(1+V)^3) := by
 rw [source_ambient_identity5c]
 norm_num [central28,centralStep28,frame,advance,initial]
 rw [ambient_false_exact5c]

theorem ambient_one_third_no_real_root5c (x : ℝ) :
 0<ambientScalar5c x 1 [false] := by
 rw [ambient_false_exact5c]
 nlinarith [sq_nonneg (2*x+1/2)]

#print axioms ambient_replicate_pell5c
#print axioms ambient_pell_generating5c
#print axioms ambient_pell_cassini5c
#print axioms ambient_source_one_third5c
#print axioms ambient_one_third_no_real_root5c
end
end MathGKM.Markov
