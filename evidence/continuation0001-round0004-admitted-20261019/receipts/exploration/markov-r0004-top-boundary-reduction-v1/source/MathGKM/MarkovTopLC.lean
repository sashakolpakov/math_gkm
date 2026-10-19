import MathGKM.MarkovTopBoundary

/-! Machine-authored round-0004. Raw diagonal boundary inequality, without division. -/
namespace MathGKM.Markov
noncomputable section

lemma choose_log_concave (d i : ℕ) (hi : i+2 ≤ d) :
    (Nat.choose d i : ℤ) * (Nat.choose d (i+2) : ℤ) ≤ (Nat.choose d (i+1) : ℤ)^2 := by
  have h1 := Nat.choose_succ_right_eq d i
  have h2 := Nat.choose_succ_right_eq d (i+1)
  have hd : i ≤ d := by omega
  have hd1 : i+1 ≤ d := by omega
  have h1' : (Nat.choose d (i+1) : ℤ) * ((i:ℤ)+1) =
      (Nat.choose d i : ℤ) * ((d:ℤ)-i) := by
    exact_mod_cast h1
  have h2' : (Nat.choose d (i+2) : ℤ) * ((i:ℤ)+2) =
      (Nat.choose d (i+1) : ℤ) * ((d:ℤ)-i-1) := by
    have h2c : (Nat.choose d (i+2) : ℤ) * ((i:ℤ)+2) =
        (Nat.choose d (i+1) : ℤ) * ((d-(i+1):ℕ):ℤ) := by
      exact_mod_cast h2
    rw [Nat.cast_sub hd1] at h2c
    push_cast at h2c
    convert h2c using 1 <;> ring
  have hB : (0:ℤ) ≤ Nat.choose d (i+1) := by positivity
  have hC : (0:ℤ) ≤ Nat.choose d (i+2) := by positivity
  have hA : (0:ℤ) ≤ Nat.choose d i := by positivity
  have ht : (0:ℤ) < (d:ℤ)-i-1 := by omega
  have he : (Nat.choose d i : ℤ) * (Nat.choose d (i+2) : ℤ) * ((d:ℤ)-i) +
      (Nat.choose d (i+1) : ℤ) * (Nat.choose d (i+2) : ℤ) =
      (Nat.choose d (i+1) : ℤ)^2 * ((d:ℤ)-i-1) := by
    linear_combination (Nat.choose d (i+1) : ℤ) * h2' - (Nat.choose d (i+2) : ℤ) * h1'
  by_contra hn
  have hp : 0 < ((Nat.choose d i : ℤ) * (Nat.choose d (i+2) : ℤ) -
      (Nat.choose d (i+1) : ℤ)^2) * ((d:ℤ)-i-1) :=
    mul_pos (by omega) ht
  nlinarith [mul_nonneg hA hC, mul_nonneg hB hC]

lemma TopForm.diagonal {P : BiPoly} {d : ℕ} (ht : TopForm P d)
    (i j : ℕ) (h : i+j+2=d) :
    coeff P i (j+2) * coeff P (i+2) j ≤ coeff P (i+1) (j+1)^2 := by
  rw [ht.coefficient i (j+2) (by omega), ht.coefficient (i+2) j (by omega),
    ht.coefficient (i+1) (j+1) (by omega)]
  exact choose_log_concave d i (by omega)

def LabelTopLC (l : Label) : Prop := ∀ i j,
  InPolygon l.a l.b i (j+2) → InPolygon l.a l.b (i+1) (j+1) →
  InPolygon l.a l.b (i+2) j → i+j+2=l.a+l.b-1 →
  coeff l.p i (j+2) * coeff l.p (i+2) j ≤ coeff l.p (i+1) (j+1)^2

theorem all_frame_top_diagonal (path : List Bool) :
    LabelTopLC (frame path).lo ∧ LabelTopLC (frame path).mid ∧ LabelTopLC (frame path).hi := by
  have ht := frame_top path
  refine ⟨?_, ?_, ?_⟩
  · intro i j h0 h1 h2 hd
    exact ht.1.diagonal i j hd
  · intro i j h0 h1 h2 hd
    exact ht.2.1.diagonal i j hd
  · intro i j h0 h1 h2 hd
    exact ht.2.2.diagonal i j hd

end
end MathGKM.Markov
