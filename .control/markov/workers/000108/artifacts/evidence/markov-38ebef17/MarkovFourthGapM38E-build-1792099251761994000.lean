import MarkovFourthAllM38E
import MarkovRightJetsF650
/-! Machine-authored request 38ebef17. Numeric fourth-slice scope and small-gap classification. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff

theorem source_fourth_gap_ge_fiveM38E (path : List Bool)
 (hb : (frame path).mid.a+5≤(frame path).mid.b) (i j : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j)
 (hs : i+j+2=(frame path).mid.a+4) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 rcases split_first_false487 path with ⟨n,hpath⟩ | ⟨n,rest,hpath⟩
 · subst path
   obtain ⟨ha,hb'⟩ := right_labels650 n
   omega
 · subst path
   obtain ⟨ha,hb'⟩ := source_run_indicesBF n rest
   have hc : 5≤(frame rest).mid.b := by
    rw [ha,hb',Nat.mul_add,Nat.mul_one] at hb
    omega
   exact run_fourth_allM38E n rest hc i j h0 h1 h2 hs

theorem fourth_small_gap_parametersM38E (path : List Bool)
 (hlo : (frame path).mid.a+2≤(frame path).mid.b)
 (hhi : (frame path).mid.b≤(frame path).mid.a+4)
 (hslope : 4*(frame path).mid.b<5*(frame path).mid.a) :
 ∃ n rest, path=List.replicate n true++false::rest ∧ 4≤n ∧
  (((frame rest).mid.b=2 ∧ (frame rest).mid.a=1) ∨
   ((frame rest).mid.b=3 ∧ (frame rest).mid.a=1) ∨
   ((frame rest).mid.b=3 ∧ (frame rest).mid.a=2) ∨
   ((frame rest).mid.b=4 ∧ (frame rest).mid.a=1) ∨
   ((frame rest).mid.b=4 ∧ (frame rest).mid.a=3)) := by
 rcases split_first_false487 path with ⟨n,hpath⟩ | ⟨n,rest,hpath⟩
 · subst path
   obtain ⟨ha,hb⟩ := right_labels650 n
   omega
 · subst path
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
   rw [ha,hb] at hlo hhi hslope
   simp only [Nat.mul_add,Nat.mul_one] at hlo hhi hslope
   have hc : 2≤(frame rest).mid.b ∧ (frame rest).mid.b≤4 := by omega
   have hn : 4≤n := by
    by_contra hh
    have hm := Nat.mul_le_mul_left (frame rest).mid.b (show n≤3 by omega)
    omega
   have hbad : ¬((frame rest).mid.a=2 ∧ (frame rest).mid.b=4) := by
    rintro ⟨h1,h2⟩
    rw [h1,h2] at hcop
    norm_num at hcop
   exact ⟨n,rest,rfl,hn,by omega⟩
end
end MathGKM.Markov
