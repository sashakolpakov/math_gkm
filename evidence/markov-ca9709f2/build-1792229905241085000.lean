import MarkovTopBetaTransportMCA9
import MarkovTopTailResidualMDCB
/-! Machine-authored ca9709f2. Explicit linear bounds for raw numerator-three
upper-sector rows, with exact source transport and polygon interpretation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

theorem top_mass_linear_allMCA9 (d T : ℕ) (hT : 2 ≤ T)
 (hd : 4*T ≤ d+4) (i : ℕ) :
 topMassM55C d T i*topMassM55C d T (i+2) ≤ topMassM55C d T (i+1)^2 := by
 by_cases hi0 : i=0
 · subst i
   exact (top_mass_first_strictMEB6 d T hT).le
 by_cases hi : i < T
 · have h := top_mass_linear_strictMCA9 d i (T-i) (by omega) (by omega)
   rw [show i+(T-i)=T by omega] at h
   exact h.le
 · rw [top_mass_zeroM55C d T (i+2) (by omega),mul_zero]
   exact sq_nonneg _

theorem top_template_linear_allMCA9 (n t : ℕ) (ht : 5 ≤ t)
 (hn : 2*t ≤ n) (hnt : 3*t ≤ n+5) (hd : 6*t ≤ n+16) (i : ℕ) :
 (topTemplateMB3E n t).coeff i*(topTemplateMB3E n t).coeff (i+2) ≤
 (topTemplateMB3E n t).coeff (i+1)^2 := by
 rcases i with _|_|_|i
 · rw [(top_edge_coeffsMB3E n t hn (by omega)).1,zero_mul]
   exact sq_nonneg _
 · exact (top_template_first_strictMB3E n t hn (by omega) hnt).le
 · exact (top_template_second_strictM55C n t hn ht hnt).le
 · have h := top_mass_linear_allMCA9 (n-2*t) (t-3) (by omega) (by omega) i
   rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,
     show 2*((t-3)+3)+(n-2*t)=n by omega,show t-3+3=t by omega] at h
   simpa only [Nat.add_assoc,Nat.reduceAdd] using h

theorem top_template_linear_columnMCA9 (n t c : ℕ)
 (hn : 2*t ≤ n) (hc : 3 ≤ c) (hct : c+1 ≤ t) (hd : 6*t ≤ n+3*c+4) :
 (topTemplateMB3E n t).coeff c*(topTemplateMB3E n t).coeff (c+2) <
 (topTemplateMB3E n t).coeff (c+1)^2 := by
 have h := top_mass_linear_strictMCA9 (n-2*t) (c-3) (t-c) (by omega) (by omega)
 rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,
   show 2*(c-3+(t-c)+3)+(n-2*t)=n by omega,
   show c-3+(t-c)+3=t by omega,
   show c-3+3=c by omega,show c-3+1+3=c+1 by omega,show c-3+2+3=c+2 by omega] at h
 exact h

theorem source_top_linear_allMCA9 (q t : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2)
 (hd : 6*t ≤ sourceNME9C q r+16) (i : ℕ) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t i r hq htq,source_top_coeffMB3E q t (i+2) r hq htq,
   source_top_coeffMB3E q t (i+1) r hq htq]
 apply top_template_linear_allMCA9 _ t ht _ _ hd i
 all_goals cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_linear_columnMCA9 (q t c : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2)
 (hc : 3 ≤ c) (hct : c+1 ≤ t) (hd : 6*t ≤ sourceNME9C q r+3*c+4) :
 threeRawM9E2 q r c (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-t) <
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t c r hq htq,source_top_coeffMB3E q t (c+2) r hq htq,
   source_top_coeffMB3E q t (c+1) r hq htq]
 apply top_template_linear_columnMCA9 _ t c _ hc hct hd
 cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_linear_polygonMCA9 (q t c : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2) (hc : 1 ≤ c) (hct : c+2 ≤ t) :
 InPolygon 3 (sourceNME9C q r) c (sourceNME9C q r+2-t) ∧
 InPolygon 3 (sourceNME9C q r) (c+1) (sourceNME9C q r+2-t) ∧
 InPolygon 3 (sourceNME9C q r) (c+2) (sourceNME9C q r+2-t) := by
 rw [source_top_polygon_iffMEB6 q t c r hq ht htq,
   source_top_polygon_iffMEB6 q t (c+1) r hq ht htq,
   source_top_polygon_iffMEB6 q t (c+2) r hq ht htq]
 omega

theorem source_top_path_linearMCA9 (path : List Bool) (t : ℕ)
 (ha : (frame path).mid.a=3) (ht : 5 ≤ t)
 (hb : 6*t ≤ (frame path).mid.b+16) (i : ℕ) :
 coeff (frame path).mid.p i ((frame path).mid.b+2-t)*
 coeff (frame path).mid.p (i+2) ((frame path).mid.b+2-t) ≤
 coeff (frame path).mid.p (i+1) ((frame path).mid.b+2-t)^2 := by
 obtain ⟨q,r,hq,he,hp⟩ := source_three_rawM9E2 path ha
 have he' : (frame path).mid.b=sourceNME9C q r := he
 have htq : t ≤ q+2 := by
   rw [he'] at hb
   cases r <;> simp [sourceNME9C] at hb <;> omega
 rw [he',hp,hp,hp]
 exact source_top_linear_allMCA9 q t r hq ht htq (by simpa [he'] using hb) i

end
end MathGKM.Markov
