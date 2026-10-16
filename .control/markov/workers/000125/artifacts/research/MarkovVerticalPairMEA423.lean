import MarkovAtomicSupportMEA423
import MarkovVerticalAllOrderM9E1

/-! Machine-authored ea4238fc. All-order vertical residual support via
the same expanded positive A,C recurrence. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

def vpairMEA423 (m : Mat16 BiPoly) : BiPoly × BiPoly :=
 (m.c+m.d,vdiffM9E1 m)

theorem vpair_mulMEA423 (m : Mat16 BiPoly) (r : Bool) :
 vpairMEA423 (mm16 (vKletterM9E1 (X:ℤ[X]) r) m)=
 if r then hstepMEA423 (vpairMEA423 m) true else atomicCMEA423 (vpairMEA423 m) := by
 cases r <;> apply Prod.ext <;>
 simp [vpairMEA423,vdiffM9E1,vKletterM9E1,vKaM9E1,vKcM9E1,mm16,
   hstepMEA423,atomicCMEA423,hmixMEA423,U,V,map_add,map_mul,map_one] <;> ring

theorem vpair_lastMEA423 :
 vpairMEA423 (vKwordM9E1 (X:ℤ[X]) [true])=atomicCMEA423 (U*(V+1),1) := by
 apply Prod.ext <;>
 simp [vKwordM9E1,projProduct6905,mm_one_right774,vpairMEA423,vdiffM9E1,
   vKletterM9E1,vKaM9E1,vKcM9E1,mm16,atomicCMEA423,hmixMEA423,U,V,
   map_add,map_mul,map_one] <;> ring

theorem vertical_pair_word_goodMEA423 (w : List Bool) :
 PairGoodMEA423 (w.length+w.count true+1) (w.length+1)
   (vpairMEA423 (vKwordM9E1 (X:ℤ[X]) (w++[true]))) := by
 induction w with
 | nil =>
   simp only [List.nil_append,List.length_nil,List.count_nil,zero_add]
   rw [vpair_lastMEA423]
   exact pair_step_CMEA423 pair_initialMEA423
 | cons r rs ih =>
   change PairGoodMEA423 _ _
     (vpairMEA423 (mm16 (vKletterM9E1 (X:ℤ[X]) r)
       (vKwordM9E1 (X:ℤ[X]) (rs++[true]))))
   rw [vpair_mulMEA423]
   cases r
   · simpa [List.length_cons,List.count_cons,Nat.add_assoc,Nat.add_comm,Nat.add_left_comm]
       using pair_step_CMEA423 ih
   · have hh := pair_step_CMEA423 (pair_step_AMEA423 ih)
     rw [atomic_BMEA423] at hh
     simpa [List.length_cons,List.count_cons,Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using hh

theorem vertical_residual_goodMEA423 (path : List Bool) :
 HGoodMEA423 (frame path).mid.b
   (vdiffM9E1 (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path))) := by
 have hs := sourceWord_central28 path
 have he : sourceWord28 path=(false::central28 path)++[true] := hs
 have hl := (source_word_counts28 path).2
 rw [he,List.length_append,List.length_singleton] at hl
 have hg := (vertical_pair_word_goodMEA423 (false::central28 path)).2.1
 rw [hl] at hg
 rw [he]
 exact hg

theorem vertical_residual_filledMEA423 (path : List Bool) (r i k : ℕ)
 (hi : 0<(vresidualM9E1 path r).coeff i) (hik : i≤k)
 (hkr : k≤r+(frame path).mid.b) : 0<(vresidualM9E1 path r).coeff k :=
 (vertical_residual_goodMEA423 path).2.1 r i hi k hik hkr

theorem vertical_residual_boundMEA423 (path : List Bool) (r i : ℕ)
 (hi : r+(frame path).mid.b < i) : (vresidualM9E1 path r).coeff i=0 :=
 (vertical_residual_goodMEA423 path).2.2 r i hi

end
end MathGKM.Markov
