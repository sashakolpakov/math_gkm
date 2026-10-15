import MarkovSmallSourceFD
import MarkovThirdTwoThirds8BBB
/-! Machine-authored fd72158c. Entire third lower diagonal for b-a ≥ 4. -/
namespace MathGKM.Markov
noncomputable section
theorem source_third_largeFD (path : List Bool) (i j : ℕ)
 (hc : (frame path).mid.a+4 ≤ (frame path).mid.b)
 (hs : i+j+2=(frame path).mid.a+3)
 (hp : InPolygon (frame path).mid.a (frame path).mid.b i (j+2)) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 rcases split_first_false487 path with ⟨n,hp⟩ | ⟨n,rest,hp⟩
 · subst path
   obtain ⟨ha,hb⟩ := source_word_counts28 (List.replicate n true)
   rw [source_pell_word446] at ha hb
   simp at ha hb
   omega
 · subst path
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   have hc' : 4 ≤ (frame rest).mid.b := by
    rw [ha,hb] at hc
    simp only [Nat.mul_add,Nat.mul_one] at hc
    omega
   by_cases hn : 2 ≤ n
   · exact source_third_ge_twoFD n rest i j hn hc' hs hp
   · interval_cases n
     · simpa using source_false_third_diagonalADB2 rest i j hs hp
     · exact source_third_one8BBB rest i j hs
#print axioms source_third_largeFD
end
end MathGKM.Markov
