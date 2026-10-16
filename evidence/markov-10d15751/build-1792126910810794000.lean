import MarkovAtomicSupportMEA423

/-! Machine-authored 10d15751. Integral, all-index conjugacy between raw
and residual positive atomic pairs. No cancellation of LC is licensed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

def rowScaleM10D : BiPoly →+* BiPoly :=
 eval₂RingHom C (U*(V+1)^2)

theorem rowScale_UM10D : rowScaleM10D U=U*(V+1)^2 := by
 simp [rowScaleM10D,U]

theorem rowScale_VM10D : rowScaleM10D V=V := by
 simp [rowScaleM10D,V]

def rawRowAM10D (z : BiPoly × BiPoly) : BiPoly × BiPoly :=
 (U*(z.1+V*z.2),z.1+(V+1)*z.2)
def rawRowCM10D (z : BiPoly × BiPoly) : BiPoly × BiPoly :=
 ((U+1)*z.1+V*U*z.2,z.1+V*z.2)

def PairScaleM10D (k : ℕ) (raw res : BiPoly × BiPoly) : Prop :=
 rowScaleM10D raw.1=(V+1)^(k+1)*res.1 ∧
 rowScaleM10D raw.2=(V+1)^k*res.2

theorem pairScale_initialM10D : PairScaleM10D 0 (U,1) (U*(V+1),1) := by
 simp [PairScaleM10D,rowScale_UM10D]
 ring

theorem pairScale_AM10D {k : ℕ} {p z : BiPoly × BiPoly}
 (hz : PairScaleM10D k p z) :
 PairScaleM10D (k+1) (rawRowAM10D p) (atomicAMEA423 z) := by
 obtain ⟨hf,hh⟩ := hz
 simp only [PairScaleM10D,rawRowAM10D,atomicAMEA423,hmixMEA423,
   map_add,map_mul,map_one,rowScale_UM10D,rowScale_VM10D,hf,hh,pow_succ]
 constructor <;> ring

theorem pairScale_CM10D {k : ℕ} {p z : BiPoly × BiPoly}
 (hz : PairScaleM10D k p z) :
 PairScaleM10D k (rawRowCM10D p) (atomicCMEA423 z) := by
 obtain ⟨hf,hh⟩ := hz
 simp only [PairScaleM10D,rawRowCM10D,atomicCMEA423,hmixMEA423,
   map_add,map_mul,map_one,rowScale_UM10D,rowScale_VM10D,hf,hh,pow_succ]
 constructor <;> ring

theorem rowScale_coeffM10D (p : BiPoly) (j : ℕ) :
 (rowScaleM10D p).coeff j=(X+1)^(2*j)*p.coeff j := by
 induction p using Polynomial.induction_on' with
 | add p q hp hq => simp [map_add,Polynomial.coeff_add,hp,hq,mul_add]
 | monomial n a =>
   simp only [rowScaleM10D,coe_eval₂RingHom,eval₂_monomial,U,V]
   have he : (X*(C X+1)^2:BiPoly)^n=C ((X+1)^(2*n))*X^n := by
     rw [show (C X+1:BiPoly)=C (X+1) by simp]
     simp only [mul_pow,←map_pow,←pow_mul]
     ring
   rw [he,←mul_assoc,←map_mul,Polynomial.coeff_C_mul_X_pow]
   simp only [Polynomial.coeff_monomial]
   split_ifs with hn
   · subst n; rfl
   · simp

theorem pairScale_coeffM10D {k : ℕ} {p z : BiPoly × BiPoly}
 (hz : PairScaleM10D k p z) (j : ℕ) :
 (X+1)^(2*j)*p.1.coeff j=(X+1)^(k+1)*z.1.coeff j ∧
 (X+1)^(2*j)*p.2.coeff j=(X+1)^k*z.2.coeff j := by
 obtain ⟨hf,hh⟩ := hz
 have h1 := congrArg (fun q : BiPoly => q.coeff j) hf
 have h2 := congrArg (fun q : BiPoly => q.coeff j) hh
 rw [rowScale_coeffM10D] at h1 h2
 simpa only [V,show (C X+1:BiPoly)=C (X+1) by simp,←map_pow,
   Polynomial.coeff_C_mul] using And.intro h1 h2

theorem pairScale_highM10D {k : ℕ} {p z : BiPoly × BiPoly}
 (hz : PairScaleM10D k p z) (j : ℕ) (hj : k≤2*j) :
 z.2.coeff j=(X+1)^(2*j-k)*p.2.coeff j := by
 have hh := (pairScale_coeffM10D hz j).2
 have he : (X+1:ℤ[X])^(2*j)=(X+1)^k*(X+1)^(2*j-k) := by
   rw [←pow_add,Nat.add_sub_of_le hj]
 rw [he,mul_assoc] at hh
 have hn : (X+1:ℤ[X])≠0 := X_add_C_ne_zero (1:ℤ)
 exact (mul_left_cancel₀ (pow_ne_zero _ hn) hh).symm

theorem pairScale_lowM10D {k : ℕ} {p z : BiPoly × BiPoly}
 (hz : PairScaleM10D k p z) (j : ℕ) (hj : 2*j≤k) :
 p.2.coeff j=(X+1)^(k-2*j)*z.2.coeff j := by
 have hh := (pairScale_coeffM10D hz j).2
 have he : (X+1:ℤ[X])^k=(X+1)^(2*j)*(X+1)^(k-2*j) := by
   rw [←pow_add,Nat.add_sub_of_le hj]
 rw [he,mul_assoc] at hh
 have hn : (X+1:ℤ[X])≠0 := X_add_C_ne_zero (1:ℤ)
 exact mul_left_cancel₀ (pow_ne_zero _ hn) hh

end
end MathGKM.Markov
