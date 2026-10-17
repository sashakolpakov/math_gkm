import MarkovTopSixthGroupsM97B
import MarkovTopSmall2GapM97B
import MarkovTopSmall3GapM97B
import MarkovTopSmall4GapM97B
import MarkovTopSmall5GapM97B
import MarkovTopQuadraticResidualM97B
/-! Machine-authored 97b019af. Closure of the full upper-template moment
condition and its exact raw-source transport. The full root remains separate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

theorem top_moment_closedM97B : TopMomentBoundM55C := by
 apply top_moment_iff_interiorM731.mpr
 intro d i r hi hr hd hb hw
 by_cases hi6 : 6 ≤ i
 · exact (sixth_tail_gap_positiveM97B d i r hi6 (by omega) hd).le
 · have hi5 : i ≤ 5 := by omega
   interval_cases i
   · exact ((tail_strict_iffMDCB d 2 r).mp (top_mass_small_2_strictM97B d (2+r) (by omega))).le
   · exact ((tail_strict_iffMDCB d 3 r).mp (top_mass_small_3_strictM97B d (3+r) (by omega))).le
   · exact ((tail_strict_iffMDCB d 4 r).mp (top_mass_small_4_strictM97B d (4+r) (by omega))).le
   · exact ((tail_strict_iffMDCB d 5 r).mp (top_mass_small_5_strictM97B d (5+r) (by omega))).le

theorem top_sector_closedM97B : TopSectorLCM55C :=
 top_sector_iff_momentM55C.mpr top_moment_closedM97B

theorem source_top_allM97B (q t i : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 :=
 source_top_sector_of_momentM55C top_moment_closedM97B q t i r hq ht htq

theorem source_top_path_allM97B (path : List Bool) (t i : ℕ)
 (ha : (frame path).mid.a=3) (ht : 5 ≤ t)
 (hb : 3*t ≤ (frame path).mid.b+5) :
 coeff (frame path).mid.p i ((frame path).mid.b+2-t)*
 coeff (frame path).mid.p (i+2) ((frame path).mid.b+2-t) ≤
 coeff (frame path).mid.p (i+1) ((frame path).mid.b+2-t)^2 := by
 obtain ⟨q,r,hq,he,hp⟩ := source_three_rawM9E2 path ha
 have he' : (frame path).mid.b=sourceNME9C q r := he
 have htq : t ≤ q+2 := by
   rw [he'] at hb
   cases r <;> simp [sourceNME9C] at hb <;> omega
 rw [he',hp,hp,hp]
 exact source_top_allM97B q t i r hq ht htq

theorem source_top_all_polygonM97B (q t i : ℕ) (r : Bool)
 (hq : 1 ≤ q) (ht : 5 ≤ t) (htq : t ≤ q+2) (hi : 1 ≤ i) (hit : i+2 ≤ t) :
 InPolygon 3 (sourceNME9C q r) i (sourceNME9C q r+2-t) ∧
 InPolygon 3 (sourceNME9C q r) (i+1) (sourceNME9C q r+2-t) ∧
 InPolygon 3 (sourceNME9C q r) (i+2) (sourceNME9C q r+2-t) ∧
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 := by
 rw [source_top_polygon_iffMEB6 q t i r hq ht htq,
   source_top_polygon_iffMEB6 q t (i+1) r hq ht htq,
   source_top_polygon_iffMEB6 q t (i+2) r hq ht htq]
 exact ⟨⟨hi,by omega⟩,⟨by omega,by omega⟩,⟨by omega,hit⟩,source_top_allM97B q t i r hq ht htq⟩

end
end MathGKM.Markov
