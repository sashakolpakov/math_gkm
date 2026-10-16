import MarkovCentralBinomialM6E1
/-! Machine-authored 6e1369de. Raw candidate row values, with an exact
scaled-binomial identity. No normalization is used in the LC predicate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def centralValM6E1 (q k : ℕ) : ℤ :=
 ((2*k+2).choose k:ℤ)*
 (((q+k+3).choose (2*k+3):ℤ)+((q+k+2).choose (2*k+3):ℤ))

def centralAuxM6E1 (q k : ℕ) : ℤ :=
 ((q+k+2).choose k:ℤ)*((q+2).choose (k+2):ℤ)

theorem central_nonnegM6E1 (q k : ℕ) : 0 ≤ centralValM6E1 q k := by
 unfold centralValM6E1
 positivity

theorem central_zeroM6E1 (q k : ℕ) (hk : q<k) : centralValM6E1 q k=0 := by
 unfold centralValM6E1
 rw [Nat.choose_eq_zero_of_lt (by omega : q+k+3<2*k+3),
   Nat.choose_eq_zero_of_lt (by omega : q+k+2<2*k+3)]
 simp

theorem central_scaledM6E1 (q k : ℕ) (hk : k ≤ q) :
 (2*(k:ℤ)+3)*centralValM6E1 q k=(2*(q:ℤ)+3)*centralAuxM6E1 q k := by
 have h := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_succ_right_eq (q+k+2) (2*k+2))
 rw [show q+k+2-(2*k+2)=q-k by omega] at h
 push_cast at h
 rw [Nat.cast_sub hk] at h
 have hp := Nat.choose_succ_succ (q+k+2) (2*k+2)
 have hpz := congrArg (fun x : ℕ => (x:ℤ)) hp
 push_cast at hpz
 have hm := Nat.choose_mul (n:=q+k+2) (k:=2*k+2) (s:=k) (by omega)
 rw [show q+k+2-k=q+2 by omega,show 2*k+2-k=k+2 by omega] at hm
 have hmz := congrArg (fun x : ℕ => (x:ℤ)) hm
 push_cast at hmz
 unfold centralValM6E1 centralAuxM6E1
 have he : (2*(k:ℤ)+3)*(((q+k+3).choose (2*k+3):ℤ)+((q+k+2).choose (2*k+3):ℤ))=
     (2*(q:ℤ)+3)*((q+k+2).choose (2*k+2):ℤ) := by
   linear_combination (2*(k:ℤ)+3)*hpz+2*h
 calc
  _ = ((2*k+2).choose k:ℤ)*((2*(k:ℤ)+3)*
    (((q+k+3).choose (2*k+3):ℤ)+((q+k+2).choose (2*k+3):ℤ))) := by ring
  _ = _ := by rw [he]; linear_combination (2*(q:ℤ)+3)*hmz

theorem central_aux_stepM6E1 (q k : ℕ) (hk : k ≤ q) :
 ((k:ℤ)+1)*(k+3)*centralAuxM6E1 q (k+1)=
 ((q:ℤ)+k+3)*(q-k)*centralAuxM6E1 q k := by
 have h1 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.add_one_mul_choose_eq (q+k+2) k)
 have h2 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_succ_right_eq (q+2) (k+2))
 rw [show q+2-(k+2)=q-k by omega] at h2
 push_cast at h1 h2
 rw [Nat.cast_sub hk] at h2
 unfold centralAuxM6E1
 have h := congrArg₂ (fun x y : ℤ => x*y) h1.symm h2
 push_cast
 simp only [Nat.add_assoc] at h ⊢
 convert h using 1 <;> ring

theorem central_stepM6E1 (q k : ℕ) (hk : k+1 ≤ q) :
 (2*(k:ℤ)+5)*(k+1)*(k+3)*centralValM6E1 q (k+1)=
 ((q:ℤ)+k+3)*(q-k)*(2*k+3)*centralValM6E1 q k := by
 have h0 := central_scaledM6E1 q k (by omega)
 have h1 := central_scaledM6E1 q (k+1) hk
 have he := central_aux_stepM6E1 q k (by omega)
 push_cast at h1
 linear_combination ((k:ℤ)+1)*(k+3)*h1-
   ((q:ℤ)+k+3)*(q-k)*h0+(2*(q:ℤ)+3)*he

end
end MathGKM.Markov
