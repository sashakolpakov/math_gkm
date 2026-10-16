import MarkovUpperCertificateM2B3
/-! Machine-authored 2b34268b. Exact scaled upper core, without cancelling zeros. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def upperCoreM2B3 (N i h : ℕ) : ℤ :=
 ((2*i-2-h).choose (i-h):ℤ)*
 (((N+i-h+1).choose (2*i-1-h):ℤ)+((N+i-h).choose (2*i-1-h):ℤ))

def upperAuxM2B3 (N i h : ℕ) : ℤ :=
 ((N+i-h).choose (i-h):ℤ)*(N.choose (i-2):ℤ)

theorem upper_core_scaledM2B3 (N i h : ℕ) (hi : 2 ≤ i) (hh : h ≤ i) (hN : i ≤ N+2) :
 (2*(i:ℤ)-1-h)*upperCoreM2B3 N i h=(2*(N:ℤ)+3-h)*upperAuxM2B3 N i h := by
 let r := 2*i-2-h
 have hr : i-h ≤ r := by dsimp [r]; omega
 have hrn : r ≤ N+i-h := by dsimp [r]; omega
 have hre : r+1=2*i-1-h := by dsimp [r]; omega
 have hrz : (r:ℤ)=2*(i:ℤ)-2-h := by dsimp [r]; omega
 have hnz : ((N+i-h:ℕ):ℤ)=(N:ℤ)+i-h := by omega
 have hc := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_succ_right_eq (N+i-h) r)
 have hp := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_succ_succ (N+i-h) r)
 simp only [Nat.succ_eq_add_one] at hp
 push_cast at hc hp
 rw [Nat.cast_sub hrn] at hc
 have hm := Nat.choose_mul (n:=N+i-h) (k:=r) (s:=i-h) hr
 rw [show N+i-h-(i-h)=N by omega,show r-(i-h)=i-2 by dsimp [r]; omega] at hm
 have hmz := congrArg (fun x : ℕ => (x:ℤ)) hm
 push_cast at hmz
 have he : (2*(i:ℤ)-1-h)*
   (((N+i-h+1).choose (2*i-1-h):ℤ)+((N+i-h).choose (2*i-1-h):ℤ))=
   (2*(N:ℤ)+3-h)*((N+i-h).choose r:ℤ) := by
   rw [hre] at hc hp
   rw [hrz,hnz] at hc
   push_cast at hc
   linear_combination (2*(i:ℤ)-1-h)*hp+2*hc
 unfold upperCoreM2B3 upperAuxM2B3
 change (2*(i:ℤ)-1-h)*((r.choose (i-h):ℤ)*_)=_
 calc
  _ = (r.choose (i-h):ℤ)*((2*(i:ℤ)-1-h)*
    (((N+i-h+1).choose (2*i-1-h):ℤ)+((N+i-h).choose (2*i-1-h):ℤ))) := by ring
  _ = _ := by rw [he]; linear_combination (2*(N:ℤ)+3-h)*hmz

theorem upper_aux_stepM2B3 (N i h : ℕ) (hi : 2 ≤ i) (hh : h ≤ i) (hN : i ≤ N+2) :
 ((i:ℤ)-h+1)*(i-1)*upperAuxM2B3 N (i+1) h=
 ((N:ℤ)+i-h+1)*(N-i+2)*upperAuxM2B3 N i h := by
 have h1 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.add_one_mul_choose_eq (N+i-h) (i-h))
 have h2 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_succ_right_eq N (i-2))
 push_cast at h1 h2
 rw [Nat.cast_sub (by omega : i-2 ≤ N)] at h2
 have hz : ((i-2:ℕ):ℤ)=(i:ℤ)-2 := by omega
 have hzh : ((i-h:ℕ):ℤ)=(i:ℤ)-h := by omega
 have hzn : ((N+i-h:ℕ):ℤ)=(N:ℤ)+i-h := by omega
 rw [hz] at h2
 rw [hzh,hzn] at h1
 rw [show i-2+1=i+1-2 by omega] at h2
 rw [show N+i-h+1=N+(i+1)-h by omega,show i-h+1=i+1-h by omega] at h1
 unfold upperAuxM2B3
 have hp := congrArg₂ (fun x y : ℤ => x*y) h1.symm h2
 convert hp using 1 <;> ring

theorem upper_aux_diagonalM2B3 (N i h : ℕ) (hi : 2 ≤ i) (hh : h ≤ i) (hN : i ≤ N+2) :
 ((i:ℤ)-1)*upperAuxM2B3 N (i+1) (h+1)=
 ((N:ℤ)-i+2)*upperAuxM2B3 N i h := by
 have h2 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_succ_right_eq N (i-2))
 push_cast at h2
 rw [Nat.cast_sub (by omega : i-2 ≤ N)] at h2
 rw [show ((i-2:ℕ):ℤ)=(i:ℤ)-2 by omega,
   show i-2+1=i+1-2 by omega] at h2
 unfold upperAuxM2B3
 rw [show N+(i+1)-(h+1)=N+i-h by omega,show i+1-(h+1)=i-h by omega]
 linear_combination ((N+i-h).choose (i-h):ℤ)*h2

theorem upper_core_stepM2B3 (N i h : ℕ) (hi : 2 ≤ i) (hh : h ≤ i) (hN : i+1 ≤ N+2) :
 ((i:ℤ)-h+1)*(i-1)*(2*i+1-h)*upperCoreM2B3 N (i+1) h=
 ((N:ℤ)+i-h+1)*(N-i+2)*(2*i-1-h)*upperCoreM2B3 N i h := by
 have h0 := upper_core_scaledM2B3 N i h hi hh (by omega)
 have h1 := upper_core_scaledM2B3 N (i+1) h (by omega) (by omega) hN
 have ha := upper_aux_stepM2B3 N i h hi hh (by omega)
 push_cast at h1
 linear_combination ((i:ℤ)-h+1)*(i-1)*h1-
   ((N:ℤ)+i-h+1)*(N-i+2)*h0+(2*(N:ℤ)+3-h)*ha

theorem upper_core_diagonalM2B3 (N i h : ℕ) (hi : 2 ≤ i) (hh : h ≤ i) (hN : i+1 ≤ N+2) :
 ((i:ℤ)-1)*(2*i-h)*(2*N+3-h)*upperCoreM2B3 N (i+1) (h+1)=
 ((N:ℤ)-i+2)*(2*i-1-h)*(2*N+2-h)*upperCoreM2B3 N i h := by
 have h0 := upper_core_scaledM2B3 N i h hi hh (by omega)
 have h1 := upper_core_scaledM2B3 N (i+1) (h+1) (by omega) (by omega) hN
 have ha := upper_aux_diagonalM2B3 N i h hi hh (by omega)
 push_cast at h1
 linear_combination ((i:ℤ)-1)*(2*N+3-h)*h1-
   ((N:ℤ)-i+2)*(2*N+2-h)*h0+(2*(N:ℤ)+3-h)*(2*N+2-h)*ha

end
end MathGKM.Markov
