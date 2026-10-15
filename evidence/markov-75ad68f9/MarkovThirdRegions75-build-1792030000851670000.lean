import MarkovThirdTransfer75
/-! Machine-authored 75ad68f9. Exact coverage of the four open rational
parameter regions. Boundary exclusions are explicit; no source bridge assumed. -/
namespace MathGKM.Markov
noncomputable section

theorem third_region_parameters75 (c r : ℤ) (hr : 1≤r) (hc : r<c)
 (h2 : c≠2*r) (h3 : c≠3*r) (h32 : 2*c≠3*r) :
 ThirdChamber75 c r (max (2*r-c) 0) (min (c-r) (max (3*r-c) 0))
   (max (3*r-2*c) 0) := by
 by_cases hlo : 3*r≤c
 · refine ⟨r-1,c-3*r,by omega,by omega,Or.inl ?_⟩
   have hq : max (2*r-c) 0=0 := max_eq_right (by omega)
   have ht : max (3*r-c) 0=0 := max_eq_right (by omega)
   have hu : max (3*r-2*c) 0=0 := max_eq_right (by omega)
   rw [hq,ht,hu,min_eq_right (by omega)]
   omega
 by_cases hmid : 2*r≤c
 · refine ⟨3*r-c-1,c-2*r-1,by omega,by omega,Or.inr (Or.inl ?_)⟩
   rw [max_eq_right (show 2*r-c≤0 by omega),
     max_eq_left (show 0≤3*r-c by omega),
     min_eq_right (show 3*r-c≤c-r by omega),
     max_eq_right (show 3*r-2*c≤0 by omega)]
   omega
 by_cases hhigh : 3*r≤2*c
 · refine ⟨2*r-c-1,2*c-3*r-1,by omega,by omega,Or.inr (Or.inr (Or.inl ?_))⟩
   rw [max_eq_left (show 0≤2*r-c by omega),
     max_eq_left (show 0≤3*r-c by omega),
     min_eq_left (show c-r≤3*r-c by omega),
     max_eq_right (show 3*r-2*c≤0 by omega)]
   omega
 · refine ⟨3*r-2*c-1,c-r-1,by omega,by omega,Or.inr (Or.inr (Or.inr ?_))⟩
   rw [max_eq_left (show 0≤2*r-c by omega),
     max_eq_left (show 0≤3*r-c by omega),
     min_eq_left (show c-r≤3*r-c by omega),
     max_eq_left (show 0≤3*r-2*c by omega)]
   omega

theorem third_mechanical_candidate_lc75 (c r : ℤ) (hr : 1≤r) (hc : r<c)
 (h2 : c≠2*r) (h3 : c≠3*r) (h32 : 2*c≠3*r) (j : ℕ) :
 let q := max (2*r-c) 0
 let t := min (c-r) (max (3*r-c) 0)
 let u := max (3*r-2*c) 0
 thirdSeq75 c r q t u j*thirdSeq75 c r q t u (j+2)≤thirdSeq75 c r q t u (j+1)^2 :=
 third_chamber_lc75 c r _ _ _ (third_region_parameters75 c r hr hc h2 h3 h32) j

#print axioms third_region_parameters75
#print axioms third_mechanical_candidate_lc75
end
end MathGKM.Markov
