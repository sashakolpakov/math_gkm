import MarkovOffsetTermM58E
/-! Machine-authored af6200bf. Exact horizontal summand recurrences. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def horizontalNumMAF6 (j i h : ℤ) : ℤ := (j+i+1)*(j-i+h+2)*(2*i-1-h)
def horizontalDenMAF6 (i h : ℤ) : ℤ := (i+1)*(i-1-h)*(2*i+1-h)
def diagonalNumMAF6 (j i h : ℤ) : ℤ := (j+i+1)*(2*i-1-h)*(2*j+4+h)
def diagonalDenMAF6 (j i h : ℤ) : ℤ := (i+1)*(2*i-h)*(2*j+3+h)

theorem lower_aux_stepMAF6 (j i h : ℕ) (hh : h+2 ≤ i) (hi : i ≤ j+h+2) :
 ((i:ℤ)+1)*(i-1-h)*lowerAuxM58E j (i+1) h=
 ((j:ℤ)+i+1)*(j-i+h+2)*lowerAuxM58E j i h := by
 have h1 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.add_one_mul_choose_eq (j+i) i)
 have h2 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_succ_right_eq j (i-2-h))
 push_cast at h1 h2
 rw [Nat.cast_sub (by omega : i-2-h ≤ j)] at h2
 have hz : ((i-2-h:ℕ):ℤ)=(i:ℤ)-2-h := by omega
 rw [hz] at h2
 rw [show i-2-h+1=i+1-2-h by omega] at h2
 unfold lowerAuxM58E
 have hp := congrArg₂ (fun x y : ℤ => x*y) h1.symm h2
 simp only [Nat.add_assoc] at hp ⊢
 convert hp using 1 <;> ring

theorem lower_core_stepMAF6 (j i h : ℕ) (hh : h+2 ≤ i) (hi : i+1 ≤ j+h+2) :
 horizontalDenMAF6 i h*lowerCoreM58E j (i+1) h=
 horizontalNumMAF6 j i h*lowerCoreM58E j i h := by
 have h0 := lower_core_scaledM58E j i h hh (by omega)
 have h1 := lower_core_scaledM58E j (i+1) h (by omega) hi
 have ha := lower_aux_stepMAF6 j i h hh (by omega)
 push_cast at h1
 unfold horizontalDenMAF6 horizontalNumMAF6
 linear_combination ((i:ℤ)+1)*(i-1-h)*h1-
   ((j:ℤ)+i+1)*(j-i+h+2)*h0+(2*(j:ℤ)+3+h)*ha

theorem lower_core_diagonalMAF6 (j i h : ℕ) (hh : h+2 ≤ i) (hi : i ≤ j+h+2) :
 diagonalDenMAF6 j i h*lowerCoreM58E j (i+1) (h+1)=
 diagonalNumMAF6 j i h*lowerCoreM58E j i h := by
 exact lower_core_diagonalM58E j i h hh hi

theorem product_transferMAF6 (a b c d L M N R : ℤ)
 (h0 : a*M=b*L) (h1 : c*R=d*N) :
 a*c*(M*N-L*R)=(b*c-d*a)*L*N := by
 linear_combination c*N*h0-a*L*h1

end
end MathGKM.Markov
