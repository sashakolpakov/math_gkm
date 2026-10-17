import MarkovTopSteinGroupsM208
import MarkovTopLinearResidualMCA9
/-! Machine-authored 20825094. Raw source transport for the new column
wedge. Polygon-valid triples and the zero tail remain distinct. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 7000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

theorem top_template_wedge_columnM208 (n t c : ℕ)
 (hn : 2*t ≤ n) (hsector : 3*t ≤ n+5)
 (hc : 3 ≤ c) (hct : c+1 ≤ t) (hw : 4*t+2 ≤ 5*c) :
 (topTemplateMB3E n t).coeff c*(topTemplateMB3E n t).coeff (c+2) <
 (topTemplateMB3E n t).coeff (c+1)^2 := by
 have h := top_mass_wedge_strictM208 (n-2*t) (c-3) (t-c)
   (by omega) (by omega) (by omega)
 rw [←top_mass_coeffM55C,←top_mass_coeffM55C,←top_mass_coeffM55C,
   show 2*(c-3+(t-c)+3)+(n-2*t)=n by omega,
   show c-3+(t-c)+3=t by omega,
   show c-3+3=c by omega,show c-3+1+3=c+1 by omega,show c-3+2+3=c+2 by omega] at h
 exact h

theorem source_top_wedge_columnM208 (q t c : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2)
 (hc : 3 ≤ c) (hct : c+1 ≤ t) (hw : 4*t+2 ≤ 5*c) :
 threeRawM9E2 q r c (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-t) <
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t c r hq htq,source_top_coeffMB3E q t (c+2) r hq htq,
   source_top_coeffMB3E q t (c+1) r hq htq]
 apply top_template_wedge_columnM208 _ t c _ _ hc hct hw
 all_goals cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_wedge_polygonM208 (q t c : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2) (hc : 3 ≤ c)
 (hct : c+2 ≤ t) (hw : 4*t+2 ≤ 5*c) :
 InPolygon 3 (sourceNME9C q r) c (sourceNME9C q r+2-t) ∧
 InPolygon 3 (sourceNME9C q r) (c+1) (sourceNME9C q r+2-t) ∧
 InPolygon 3 (sourceNME9C q r) (c+2) (sourceNME9C q r+2-t) ∧
 threeRawM9E2 q r c (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-t) <
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-t)^2 := by
 obtain ⟨h0,h1,h2⟩ := source_top_linear_polygonMCA9 q t c r hq ht htq (by omega) hct
 exact ⟨h0,h1,h2,source_top_wedge_columnM208 q t c r hq ht htq hc (by omega) hw⟩

theorem source_top_path_wedgeM208 (path : List Bool) (t c : ℕ)
 (ha : (frame path).mid.a=3) (ht : 5 ≤ t)
 (hb : 3*t ≤ (frame path).mid.b+5) (hc : 3 ≤ c)
 (hct : c+1 ≤ t) (hw : 4*t+2 ≤ 5*c) :
 coeff (frame path).mid.p c ((frame path).mid.b+2-t)*
 coeff (frame path).mid.p (c+2) ((frame path).mid.b+2-t) <
 coeff (frame path).mid.p (c+1) ((frame path).mid.b+2-t)^2 := by
 obtain ⟨q,r,hq,he,hp⟩ := source_three_rawM9E2 path ha
 have he' : (frame path).mid.b=sourceNME9C q r := he
 have htq : t ≤ q+2 := by
   rw [he'] at hb
   cases r <;> simp [sourceNME9C] at hb <;> omega
 rw [he',hp,hp,hp]
 exact source_top_wedge_columnM208 q t c r hq ht htq hc hct hw

end
end MathGKM.Markov
