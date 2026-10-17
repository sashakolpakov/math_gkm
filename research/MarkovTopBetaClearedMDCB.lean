import MarkovTopBetaMomentsMDCB
/-! Machine-authored dcb64029. Universal normalized beta-binomial moments,
including factorial orders exceeding the total degree. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

theorem beta_massMDCB (i m : ℕ) :
 betaMomentMDCB i m 0 0=((2*i+m+1).choose (2*i+1):ℤ) := by
 simpa using beta_moment_explicitMDCB i 0 0 m

theorem beta_mass_positiveMDCB (i m : ℕ) : 0 < betaMomentMDCB i m 0 0 := by
 rw [beta_massMDCB]
 exact_mod_cast Nat.choose_pos (show 2*i+1 ≤ 2*i+m+1 by omega)

theorem beta_moment_clearedMDCB (i m u v : ℕ) :
 ((2*i+1+(u+v)).descFactorial (u+v):ℤ)*betaMomentMDCB i m u v=
 ((i+u).descFactorial u:ℤ)*((i+v).descFactorial v:ℤ)*
 (m.descFactorial (u+v):ℤ)*betaMomentMDCB i m 0 0 := by
 by_cases hm : u+v ≤ m
 · obtain ⟨N,rfl⟩ := Nat.exists_eq_add_of_le hm
   rw [beta_moment_explicitMDCB,beta_massMDCB]
   have h := beta_choose_factorialMDCB (2*i+1) (u+v+N) (u+v)
   rw [show 2*i+1+(u+v+N)=2*i+u+v+N+1 by omega,
     show 2*i+1+(u+v)=2*i+u+v+1 by omega] at h
   rw [show 2*i+1+(u+v)=2*i+u+v+1 by omega,
     show 2*i+(u+v+N)+1=2*i+u+v+N+1 by omega]
   linear_combination -((i+u).descFactorial u:ℤ)*((i+v).descFactorial v:ℤ)*h
 · rw [beta_moment_zeroMDCB i m u v (by omega),
     Nat.descFactorial_eq_zero_iff_lt.mpr (show m<u+v by omega)]
   simp

theorem beta_moment_normalizedMDCB (i m u v : ℕ) :
 (betaMomentMDCB i m u v:ℝ)/(betaMomentMDCB i m 0 0:ℝ)=
 ((i+u).descFactorial u:ℝ)*((i+v).descFactorial v:ℝ)*
 (m.descFactorial (u+v):ℝ)/((2*i+1+(u+v)).descFactorial (u+v):ℝ) := by
 have hM : (0:ℝ)<betaMomentMDCB i m 0 0 := by exact_mod_cast beta_mass_positiveMDCB i m
 have hD : (0:ℝ)<(2*i+1+(u+v)).descFactorial (u+v) := by
   exact_mod_cast Nat.descFactorial_pos.mpr (show u+v ≤ 2*i+1+(u+v) by omega)
 apply (div_eq_div_iff (ne_of_gt hM) (ne_of_gt hD)).mpr
 have h := beta_moment_clearedMDCB i m u v
 have hh : ((2*i+1+(u+v)).descFactorial (u+v):ℝ)*(betaMomentMDCB i m u v:ℝ)=
   ((i+u).descFactorial u:ℝ)*((i+v).descFactorial v:ℝ)*
   (m.descFactorial (u+v):ℝ)*(betaMomentMDCB i m 0 0:ℝ) := by exact_mod_cast h
 nlinarith only [hh]

end
end MathGKM.Markov
