import MathGKM.Markov

/-! Machine-authored round52. Real-valued reconstruction of the retained round48
midpoint proof; indices remain integers, coefficient inequalities are over ℝ. -/
namespace RealConeR52

def Cone (a : ℤ → ℝ) : Prop :=
  (∀ x, 0 ≤ a x) ∧
  (∀ x, a x*a (x+2) ≤ a (x+1)^2) ∧
  (∀ x y z, x<y → y<z → 0<a x → 0<a z → 0<a y)

theorem inward (a : ℤ → ℝ) (ha : Cone a) (d : ℕ) (x : ℤ) :
    a x*a (x+d+2) ≤ a (x+1)*a (x+d+1) := by
  induction d generalizing x with
  | zero => simpa [pow_two] using ha.2.1 x
  | succ d ih =>
    by_cases h0 : a x=0
    · rw [h0,zero_mul]; exact mul_nonneg (ha.1 _) (ha.1 _)
    by_cases h1 : a (x+(d+1)+2)=0
    · simpa only [Nat.cast_add,Nat.cast_one,h1,mul_zero] using
        (mul_nonneg (ha.1 (x+1)) (ha.1 (x+(d+1)+1)))
    have hp0 : 0<a x := lt_of_le_of_ne (ha.1 _) (Ne.symm h0)
    have hp1 : 0<a (x+(d+1)+2) := lt_of_le_of_ne (ha.1 _) (Ne.symm h1)
    have hp2 : 0<a (x+d+1) := ha.2.2 x (x+d+1) (x+(d+1)+2)
      (by omega) (by omega) hp0 hp1
    have hp3 : 0<a (x+d+2) := ha.2.2 x (x+d+2) (x+(d+1)+2)
      (by omega) (by omega) hp0 hp1
    have hlocal := ha.2.1 (x+d+1)
    have hprev := ih x
    have hp := mul_le_mul hprev hlocal
      (mul_nonneg (ha.1 _) (ha.1 _)) (mul_nonneg (ha.1 _) (ha.1 _))
    have e1 : x+((d+1:ℕ):ℤ)+2=x+d+1+2 := by omega
    have e2 : x+((d+1:ℕ):ℤ)+1=x+d+2 := by omega
    rw [e1,e2]
    have e3 : x+d+1+1=x+d+2 := by omega
    rw [e3] at hp
    apply le_of_mul_le_mul_right _ (mul_pos hp2 hp3)
    nlinarith only [hp]

theorem midpoint_gap (a : ℤ → ℝ) (ha : Cone a) (d : ℕ) (x : ℤ) :
    a x*a (x+d) ≤ a ((x+(x+d))/2)*a ((x+(x+d)+1)/2) := by
  induction d using Nat.strong_induction_on generalizing x with
  | h d ih =>
    by_cases hd : d<2
    · have hd' : d=0 ∨ d=1 := by omega
      rcases hd' with rfl | rfl
      · have h : (x+(x+(0:ℤ)))/2=x := by omega
        have h' : (x+(x+(0:ℤ))+1)/2=x := by omega
        simp only [Nat.cast_zero, Nat.cast_one]
        rw [h,h'] <;> simp
      · have h : (x+(x+(1:ℤ)))/2=x := by omega
        have h' : (x+(x+(1:ℤ))+1)/2=x+1 := by omega
        simp only [Nat.cast_zero, Nat.cast_one]
        rw [h,h'] <;> simp
    · have hin := inward a ha (d-2) x
      have hir := ih (d-2) (by omega) (x+1)
      have e0 : x+(d-2:ℕ)+2=x+d := by omega
      have e1 : x+(d-2:ℕ)+1=(x+1)+(d-2:ℕ) := by omega
      have e2 : ((x+1)+((x+1)+(d-2:ℕ)))/2=(x+(x+d))/2 := by omega
      have e3 : ((x+1)+((x+1)+(d-2:ℕ))+1)/2=(x+(x+d)+1)/2 := by omega
      rw [e0,e1] at hin
      rw [e2,e3] at hir
      exact hin.trans hir

theorem cone_midpoint (a : ℤ → ℝ) (ha : Cone a) (s t : ℤ) :
    a s*a t ≤ a ((s+t)/2)*a ((s+t+1)/2) := by
  rcases le_total s t with h | h
  · have hd : s+((t-s).toNat:ℤ)=t := by omega
    simpa only [hd] using midpoint_gap a ha (t-s).toNat s
  · have hd : t+((s-t).toNat:ℤ)=s := by omega
    have hm := midpoint_gap a ha (s-t).toNat t
    rw [hd] at hm
    simpa [add_comm,mul_comm] using hm

theorem separable_diagonal (a b : ℤ → ℝ) (ha : Cone a) (hb : Cone b)
    (x s t : ℤ) :
    (a s*b (x-s))*(a t*b (x+2-t)) ≤
      (a ((s+t)/2)*b (x+1-(s+t)/2))*
      (a ((s+t+1)/2)*b (x+1-(s+t+1)/2)) := by
  have h1 := cone_midpoint a ha s t
  have h2 := cone_midpoint b hb (x-s) (x+2-t)
  have e1 : ((x-s)+(x+2-t))/2=x+1-(s+t+1)/2 := by omega
  have e2 : ((x-s)+(x+2-t)+1)/2=x+1-(s+t)/2 := by omega
  rw [e1,e2] at h2
  have hp := mul_le_mul h1 h2 (mul_nonneg (hb.1 _) (hb.1 _))
    (mul_nonneg (ha.1 _) (ha.1 _))
  nlinarith only [hp]

end RealConeR52
#print axioms RealConeR52.cone_midpoint
#print axioms RealConeR52.separable_diagonal
