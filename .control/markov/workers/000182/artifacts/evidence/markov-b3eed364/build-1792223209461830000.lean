import MarkovTopRegionMB3E
/-! Machine-authored b3eed364. Exact whole-row support and polygon validity
in the upper sector, including its exceptional coefficients and zero tails. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem top_template_supportMB3E (n t i : ℕ) (hn : 2*t ≤ n)
 (ht : 5 ≤ t) (hnt : 3*t ≤ n+5) :
 0 ≤ (topTemplateMB3E n t).coeff i ∧
 (0 < (topTemplateMB3E n t).coeff i ↔ 1 ≤ i ∧ i ≤ t) := by
 have he := top_edge_coeffsMB3E n t hn (by omega)
 rcases i with _|_|_|i
 · rw [he.1]; simp
 · rw [he.2.1]
   have h : (3:ℤ)*t ≤ n+5 := by exact_mod_cast hnt
   constructor
   · omega
   · constructor <;> intro hp <;> omega
 · rw [he.2.2]
   have hc : (0:ℤ)<(n-2*t+6).choose 2 := by
     exact_mod_cast Nat.choose_pos (by omega : 2 ≤ n-2*t+6)
   have ht' : (0:ℤ)<(t:ℤ)-2 := by omega
   have hp : (0:ℤ)<4*((t:ℤ)-2)*((n-2*t+6).choose 2:ℤ) := by positivity
   exact ⟨le_of_lt hp,by constructor <;> intro h <;> first | omega | exact hp⟩
 · rw [show i+1+1+1=i+3 by omega,top_positive_formulaMB3E n t i hn]
   exact ⟨top_positive_nonnegMB3E n t i,by
     rw [top_positive_supportMB3E n t i hn]
     omega⟩

theorem source_top_supportMB3E (q t i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht0 : 5 ≤ t) (ht : t ≤ q+2) :
 0 ≤ threeRawM9E2 q r i (sourceNME9C q r+2-t) ∧
 (0 < threeRawM9E2 q r i (sourceNME9C q r+2-t) ↔ 1 ≤ i ∧ i ≤ t) := by
 rw [source_top_coeffMB3E q t i r hq ht]
 apply top_template_supportMB3E
 · cases r <;> simp [sourceNME9C] <;> omega
 · exact ht0
 · cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_zero_tailMB3E (q t i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht0 : 5 ≤ t) (ht : t ≤ q+2) (hi : i=0 ∨ t<i) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)=0 := by
 have h := source_top_supportMB3E q t i r hq ht0 ht
 have hh : ¬0 < threeRawM9E2 q r i (sourceNME9C q r+2-t) := by
   rw [h.2]
   omega
 omega

theorem source_top_edge_polygonMB3E (q t : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht0 : 5 ≤ t) (ht : t ≤ q+2) :
 InPolygon 3 (sourceNME9C q r) 1 (sourceNME9C q r+2-t) ∧
 InPolygon 3 (sourceNME9C q r) 2 (sourceNME9C q r+2-t) ∧
 InPolygon 3 (sourceNME9C q r) 3 (sourceNME9C q r+2-t) := by
 cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true,InPolygon] <;> omega

end
end MathGKM.Markov
