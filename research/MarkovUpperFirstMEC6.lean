import MarkovUpperWeightsMEC6
/-! Machine-authored ec6f4b83. The exceptional first-column comparisons. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem choose_rise_twoMEC6 (N : ℕ) :
 2*((N+2).choose 2:ℤ)=((N:ℤ)+2)*(N+1) := by
 have h := congrArg (fun x : ℕ => (x:ℤ)) (Nat.add_one_mul_choose_eq (N+1) 1)
 norm_num [Nat.choose_one_right] at h
 push_cast at h
 nlinarith

theorem choose_rise_threeMEC6 (N : ℕ) :
 6*((N+3).choose 3:ℤ)=((N:ℤ)+3)*(N+2)*(N+1) := by
 have h := congrArg (fun x : ℕ => (x:ℤ)) (Nat.add_one_mul_choose_eq (N+2) 2)
 norm_num at h
 push_cast at h
 have h2 := choose_rise_twoMEC6 N
 linear_combination -2*h+((N:ℤ)+3)*h2

theorem upper_core_twoMEC6 (N : ℕ) :
 6*upperCoreM2B3 N 2 0=(2*(N:ℤ)+3)*(N+2)*(N+1) ∧
 upperCoreM2B3 N 2 1=((N:ℤ)+1)^2 ∧
 upperCoreM2B3 N 2 2=2*(N:ℤ)+1 := by
 have h0 := upper_core_scaledM2B3 N 2 0 (by omega) (by omega) (by omega)
 have h1 := upper_core_scaledM2B3 N 2 1 (by omega) (by omega) (by omega)
 have h2 := upper_core_scaledM2B3 N 2 2 (by omega) (by omega) (by omega)
 norm_num [upperAuxM2B3,Nat.choose_one_right,Nat.add_sub_cancel] at h0 h1 h2
 have hc := choose_rise_twoMEC6 N
 refine ⟨?_,?_,?_⟩
 · linear_combination 2*h0+(2*(N:ℤ)+3)*hc
 · nlinarith [h1]
 · linarith [h2]

theorem upper_core_threeMEC6 (N : ℕ) (hN : 1 ≤ N) :
 30*upperCoreM2B3 N 3 0=(2*(N:ℤ)+3)*(N+3)*(N+2)*(N+1)*N ∧
 4*upperCoreM2B3 N 3 1=((N:ℤ)+1)^2*(N+2)*N ∧
 3*upperCoreM2B3 N 3 2=(2*(N:ℤ)+1)*(N+1)*N ∧
 upperCoreM2B3 N 3 3=(N:ℤ)^2 := by
 have h0 := upper_core_scaledM2B3 N 3 0 (by omega) (by omega) (by omega)
 have h1 := upper_core_scaledM2B3 N 3 1 (by omega) (by omega) (by omega)
 have h2 := upper_core_scaledM2B3 N 3 2 (by omega) (by omega) (by omega)
 have h3 := upper_core_scaledM2B3 N 3 3 (by omega) (by omega) (by omega)
 norm_num [upperAuxM2B3,Nat.choose_one_right,Nat.add_sub_cancel] at h0 h1 h2 h3
 have hc2 := choose_rise_twoMEC6 N
 have hc3 := choose_rise_threeMEC6 N
 refine ⟨?_,?_,?_,?_⟩
 · linear_combination 6*h0+(2*(N:ℤ)+3)*N*hc3
 · linear_combination h1+((N:ℤ)+1)*N*hc2
 · linear_combination h2
 · nlinarith [h3]

theorem upper_core_firstMEC6 (N k : ℕ) (hN : 1 ≤ N) (hk : k ≤ 3) :
 2*upperCoreM2B3 N 3 k ≤
 upperCoreM2B3 N 2 (min 2 k)*upperCoreM2B3 N 2 (max 2 k-1) := by
 obtain ⟨h20,h21,h22⟩ := upper_core_twoMEC6 N
 obtain ⟨h30,h31,h32,h33⟩ := upper_core_threeMEC6 N hN
 interval_cases k
 · norm_num
   rw [h21]
   have he : 30*(upperCoreM2B3 N 2 0*((N:ℤ)+1)^2-2*upperCoreM2B3 N 3 0)=
      (2*(N:ℤ)+3)*(N+2)*(N+1)*(3*N^2+4*N+5) := by
     linear_combination 5*((N:ℤ)+1)^2*h20-2*h30
   have hp : 0 ≤ (2*(N:ℤ)+3)*(N+2)*(N+1)*(3*N^2+4*N+5) := by positivity
   nlinarith
 · norm_num
   rw [h21]
   have he : 2*(((N:ℤ)+1)^2*((N:ℤ)+1)^2-2*upperCoreM2B3 N 3 1)=
      ((N:ℤ)+1)^2*(N^2+2*N+2) := by linear_combination -h31
   have hp : 0 ≤ ((N:ℤ)+1)^2*(N^2+2*N+2) := by positivity
   nlinarith
 · norm_num
   rw [h21,h22]
   have he : 3*((2*(N:ℤ)+1)*((N:ℤ)+1)^2-2*upperCoreM2B3 N 3 2)=
      (2*(N:ℤ)+1)*(N+1)*(N+3) := by linear_combination -2*h32
   have hp : 0 ≤ (2*(N:ℤ)+1)*(N+1)*(N+3) := by positivity
   nlinarith
 · norm_num
   rw [h22,h33]
   nlinarith [sq_nonneg (N:ℤ)]

end
end MathGKM.Markov
