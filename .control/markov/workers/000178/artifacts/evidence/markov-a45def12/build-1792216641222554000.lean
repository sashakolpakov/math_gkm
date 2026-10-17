import MarkovDoubleChooseMA45
/-! Machine-authored a45def12. Exact endpoint binomial identities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

theorem choose_second_differenceMA45 (N k : ℕ) :
 ((N+2).choose (k+2):ℝ)-2*((N+1).choose (k+2):ℝ)+(N.choose (k+2):ℝ) =
 (N.choose k:ℝ) := by
 rw [show N+2=(N+1)+1 by omega,show k+2=(k+1)+1 by omega,
   Nat.choose_succ_succ,Nat.choose_succ_succ,Nat.choose_succ_succ]
 push_cast
 ring

theorem endpoint_sum_scaledMA45 (s k : ℕ) :
 (k+2:ℝ)*(k+1)*(((s+k+5).choose (k+2):ℝ)+((s+k+7).choose (k+2):ℝ)) =
 ((s+k+5).choose k:ℝ)*((s+4:ℝ)*(s+5)+(s+k+6:ℝ)*(s+k+7)) := by
 have h0 := Nat.choose_succ_right_eq (s+k+5) k
 have h1 := Nat.choose_succ_right_eq (s+k+5) (k+1)
 rw [show s+k+5-k=s+5 by omega] at h0
 rw [show s+k+5-(k+1)=s+4 by omega] at h1
 have h0' : ((s+k+5).choose (k+1):ℝ)*(k+1)=((s+k+5).choose k:ℝ)*(s+5) := by exact_mod_cast h0
 have h1' : ((s+k+5).choose (k+2):ℝ)*(k+2)=((s+k+5).choose (k+1):ℝ)*(s+4) := by exact_mod_cast h1
 have h2 := Nat.add_one_mul_choose_eq (s+k+5) k
 have h3 := Nat.add_one_mul_choose_eq (s+k+6) (k+1)
 have h2' : ((s+k+6).choose (k+1):ℝ)*(k+1)=((s+k+5).choose k:ℝ)*(s+k+6) := by
   exact_mod_cast (by simpa [Nat.add_assoc,Nat.mul_comm] using h2.symm)
 have h3' : ((s+k+7).choose (k+2):ℝ)*(k+2)=((s+k+6).choose (k+1):ℝ)*(s+k+7) := by
   exact_mod_cast (by simpa [Nat.add_assoc,Nat.mul_comm] using h3.symm)
 linear_combination (s+4:ℝ)*h0'+(k+1:ℝ)*h1'+(s+k+7:ℝ)*h2'+(k+1:ℝ)*h3'

theorem cutoff_scalar_positiveMA45 (s k : ℝ) (hs : 0 ≤ s) (hk : 0 ≤ k) :
 0 ≤ (k+2)^2*((2*s+10)*(2*s+11))-
   ((s+4)*(s+5)+(s+k+6)*(s+k+7))-(s+4)*(s+6)*(k+2)*(k+1) := by
 have he : (k+2)^2*((2*s+10)*(2*s+11))-
   ((s+4)*(s+5)+(s+k+6)*(s+k+7))-(s+4)*(s+6)*(k+2)*(k+1) =
   (3*k^2+13*k+12)*s^2+(32*k^2+136*k+126)*s+85*k^2+355*k+330 := by ring
 rw [he]
 positivity

end
end MathGKM.Markov
