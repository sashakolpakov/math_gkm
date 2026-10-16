import MarkovSourceOffsetM58E
/-! Machine-authored 58e57003. Exact scaled summand identity. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def lowerCoreM58E (j i h : ℕ) : ℤ :=
 ((2*i-2-h).choose i:ℤ)*
 (((j+i+1).choose (2*i-1-h):ℤ)+((j+i).choose (2*i-1-h):ℤ))

def lowerAuxM58E (j i h : ℕ) : ℤ :=
 ((j+i).choose i:ℤ)*(j.choose (i-2-h):ℤ)

theorem lower_core_nonnegM58E (j i h : ℕ) : 0 ≤ lowerCoreM58E j i h := by
 unfold lowerCoreM58E
 positivity

theorem lower_core_scaledM58E (j i h : ℕ) (hh : h+2 ≤ i) (hj : i ≤ j+h+2) :
 (2*(i:ℤ)-1-h)*lowerCoreM58E j i h=(2*(j:ℤ)+3+h)*lowerAuxM58E j i h := by
 let r := 2*i-2-h
 have hr : i ≤ r := by dsimp [r]; omega
 have hrn : r ≤ j+i := by dsimp [r]; omega
 have hre : r+1=2*i-1-h := by dsimp [r]; omega
 have hrz : (r:ℤ)=2*(i:ℤ)-2-h := by dsimp [r]; omega
 have h := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_succ_right_eq (j+i) r)
 have hp := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_succ_succ (j+i) r)
 push_cast at h hp
 rw [Nat.cast_sub hrn] at h
 have hm := Nat.choose_mul (n:=j+i) (k:=r) (s:=i) hr
 rw [show j+i-i=j by omega,show r-i=i-2-h by dsimp [r]; omega] at hm
 have hmz := congrArg (fun x : ℕ => (x:ℤ)) hm
 push_cast at hmz
 have he : (2*(i:ℤ)-1-h)*
   (((j+i+1).choose (2*i-1-h):ℤ)+((j+i).choose (2*i-1-h):ℤ))=
   (2*(j:ℤ)+3+h)*((j+i).choose r:ℤ) := by
   rw [hre] at h hp
   rw [hrz] at h
   linear_combination (2*(i:ℤ)-1-h)*hp+2*h
 unfold lowerCoreM58E lowerAuxM58E
 change (2*(i:ℤ)-1-h)*((r.choose i:ℤ)*_)=_
 calc
  _ = (r.choose i:ℤ)*((2*(i:ℤ)-1-h)*
       (((j+i+1).choose (2*i-1-h):ℤ)+((j+i).choose (2*i-1-h):ℤ))) := by ring
  _ = _ := by rw [he]; linear_combination (2*(j:ℤ)+3+h)*hmz

theorem lower_aux_diagonalM58E (j i h : ℕ) (hh : h+2 ≤ i) :
 ((i:ℤ)+1)*lowerAuxM58E j (i+1) (h+1)=
 ((j:ℤ)+i+1)*lowerAuxM58E j i h := by
 have hc := congrArg (fun x : ℕ => (x:ℤ)) (Nat.add_one_mul_choose_eq (j+i) i)
 push_cast at hc
 unfold lowerAuxM58E
 rw [show i+1-2-(h+1)=i-2-h by omega]
 simp only [Nat.add_assoc]
 linear_combination -(j.choose (i-2-h):ℤ)*hc

theorem lower_core_diagonalM58E (j i h : ℕ) (hh : h+2 ≤ i) (hj : i ≤ j+h+2) :
 ((i:ℤ)+1)*(2*i-h)*(2*j+3+h)*lowerCoreM58E j (i+1) (h+1)=
 ((j:ℤ)+i+1)*(2*i-1-h)*(2*j+4+h)*lowerCoreM58E j i h := by
 have h0 := lower_core_scaledM58E j i h hh hj
 have h1 := lower_core_scaledM58E j (i+1) (h+1) (by omega) (by omega)
 have ha := lower_aux_diagonalM58E j i h hh
 push_cast at h1
 linear_combination ((i:ℤ)+1)*(2*j+3+h)*h1-
   ((j:ℤ)+i+1)*(2*j+4+h)*h0+(2*(j:ℤ)+3+h)*(2*j+4+h)*ha

end
end MathGKM.Markov
