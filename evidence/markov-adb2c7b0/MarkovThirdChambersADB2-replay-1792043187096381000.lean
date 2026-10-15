import MarkovThirdTransfer75
import MathGKM.MarkovIndices
/-! Machine-authored request adb2c7b0. Exact coverage of the algebraic
third-slice chambers for reduced predecessor labels of denominator at least 4. -/
namespace MathGKM.Markov
noncomputable section

theorem third_chamber_of_reducedADB2 (c r : ℕ) (hc : 4≤c)
 (hr : 0<r) (hrc : r<c) (hcop : Nat.Coprime r c) :
 ThirdChamber75 c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) := by
 have htwo : 2*r≠c := by
   intro h
   have hd : c∣2 := hcop.symm.dvd_of_dvd_mul_right (by rw [h])
   have hh := Nat.le_of_dvd (by decide : 0<2) hd
   omega
 have hthree : 3*r≠2*c := by
   intro h
   have hd : c∣3 := hcop.symm.dvd_of_dvd_mul_right (by rw [h]; exact dvd_mul_left c 2)
   have hh := Nat.le_of_dvd (by decide : 0<3) hd
   omega
 unfold ThirdChamber75
 by_cases hlo : 3*r≤c
 · refine ⟨(r:ℤ)-1,(c:ℤ)-3*r,by omega,by omega,Or.inl ?_⟩
   exact ⟨by omega,by omega,by omega,by omega,by omega⟩
 by_cases hmid : 2*r<c
 · refine ⟨3*(r:ℤ)-c-1,(c:ℤ)-2*r-1,by omega,by omega,Or.inr (Or.inl ?_)⟩
   exact ⟨by omega,by omega,by omega,by omega,by omega⟩
 by_cases hhigh : 3*r<2*c
 · refine ⟨2*(r:ℤ)-c-1,2*(c:ℤ)-3*r-1,by omega,by omega,Or.inr (Or.inr (Or.inl ?_))⟩
   exact ⟨by omega,by omega,by omega,by omega,by omega⟩
 · refine ⟨3*(r:ℤ)-2*c-1,(c:ℤ)-r-1,by omega,by omega,Or.inr (Or.inr (Or.inr ?_))⟩
   exact ⟨by omega,by omega,by omega,by omega,by omega⟩

theorem source_third_chamberADB2 (rest : List Bool) (hc : 4≤(frame rest).mid.b) :
 ThirdChamber75 (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a)
     (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) := by
 obtain ⟨ha,hab,hcop⟩ := frame_reduced rest
 exact third_chamber_of_reducedADB2 _ _ hc ha hab hcop

#print axioms third_chamber_of_reducedADB2
#print axioms source_third_chamberADB2
end
end MathGKM.Markov
