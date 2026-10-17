import MarkovResidualFirstM657
/-! Machine-authored 6576ccc5. A stronger edge-ratio shortcut fails for an
actual auxiliary correction factor. This is not a source LC counterexample. -/
namespace MathGKM.Markov
noncomputable section

theorem ratio_witness_coefficientsM657 :
 (bandAtM139 0 8 false).coeff 0=1620 ∧ (bandAtM139 0 8 false).coeff 1=20592 := by
 have h0 := correction_zeroM657 0 8 false
 have h1 := correction_oneM657 0 8 false (by norm_num)
 norm_num [correctionZeroM657,correctionOneM657] at h0 h1
 exact ⟨by exact_mod_cast h0,by exact_mod_cast h1⟩

theorem ratio_edge_shortcut_failsM657 :
 6*(bandAtM139 0 8 false).coeff 1 < 77*(bandAtM139 0 8 false).coeff 0 := by
 obtain ⟨h0,h1⟩ := ratio_witness_coefficientsM657
 rw [h0,h1]
 norm_num

theorem ratio_witness_still_lcM657 :
 (bandAtM139 0 8 false).coeff 0*(bandAtM139 0 8 false).coeff 2 ≤
 (bandAtM139 0 8 false).coeff 1^2 := band_first_adjacentM657 0 8 false

end
end MathGKM.Markov
