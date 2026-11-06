import MathGKM.Round124ObstructionA
import MathGKM.Round122MassA

/- Machine-authored round125 repair, retaining the failed round124 source. Exact rank-fiber and original polygon scope of
the retained obstruction. This is not a refutation of a coefficient inequality. -/
set_option maxRecDepth 10000
set_option linter.constructorNameAsVariable false
namespace PacketInterfaceR125
open PacketsR120 PacketStructureR121 LocalRetilingR76 ColorForgettingR108
open PacketObstructionR124 MathGKM.Markov
attribute [local irreducible] ColorForgettingR108.rankFiber

theorem rank_facts (N sigma i j t : ℕ) (w : Pair)
    (hw : w ∈ rankFiber N sigma t (i+j) i) :
    valid N w.1 ∧ valid N w.2 ∧ du sigma w.1=i ∧ du sigma w.2=j ∧
      dv N sigma w.1=t ∧ dv N sigma w.2=t := by
  classical
  rw [rank_product N sigma i j t] at hw
  simp only [single,Finset.mem_product,Finset.mem_filter,PairConvolutionR78.mem_U] at hw
  exact ⟨hw.1.1,hw.2.1,hw.1.2.1,hw.2.2.1,hw.1.2.2,hw.2.2.2⟩

theorem empty_row_not_load (N sigma i t : ℕ) (z : Pair)
    (hz : z ∈ rankFiber N sigma t (2*i+2) i)
    (hempty : ∀ w ∈ rankFiber N sigma t (2*i+2) (i+1), ¬ packet N z w) :
    ¬ EqualMassR122.PacketLoad N sigma i t := by
  classical
  intro h
  have he : (rankFiber N sigma t (2*i+2) (i+1)).filter (packet N z)=∅ := by
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro w hw
    exact hempty w (Finset.mem_filter.mp hw).1 (Finset.mem_filter.mp hw).2
  have hn := h.1 z hz
  change 0 < ((rankFiber N sigma t (2*i+2) (i+1)).filter (packet N z)).card at hn
  rw [he,Finset.card_empty] at hn
  omega

theorem source_member : (low,high) ∈ rankFiber 26 0 12 6 2 := by
  classical
  rw [rank_product 26 0 2 4 12]
  simp only [single,Finset.mem_product,Finset.mem_filter,PairConvolutionR78.mem_U]
  have h := source_degrees
  exact ⟨⟨h.1,h.2.2.1,h.2.2.2.2.1⟩,h.2.1,h.2.2.2.1,h.2.2.2.2.2⟩

theorem no_packet_rank (w : Pair) (hw : w ∈ rankFiber 26 0 12 6 3) :
    ¬ packet 26 (low,high) w := by
  have hf := rank_facts 26 0 3 3 12 w
  norm_num only at hf
  have h := hf hw
  exact no_central_packet w ⟨h.1,h.2.1⟩ h.2.2

theorem no_packet_load : ¬ EqualMassR122.PacketLoad 26 0 2 12 := by
  have hf := empty_row_not_load 26 0 2 12 (low,high)
  norm_num only at hf
  exact hf source_member no_packet_rank

theorem original_scope :
    let E := (frame (List.replicate 12 true)).mid
    E.a=13 ∧ E.b=14 ∧ InPolygon E.a E.b 2 12 ∧
      InPolygon E.a E.b 3 12 ∧ InPolygon E.a E.b 4 12 := by
  dsimp only
  rw [(RightR30.right_labels 12).2.1,(RightR30.right_labels 12).2.2]
  norm_num [InPolygon]

theorem obstruction_in_original_scope :
    (low,high) ∈ rankFiber 26 0 12 6 2 ∧
    (∀ w ∈ rankFiber 26 0 12 6 3, ¬ packet 26 (low,high) w) ∧
    ¬ EqualMassR122.PacketLoad 26 0 2 12 ∧
    (let E := (frame (List.replicate 12 true)).mid;
      E.a=13 ∧ E.b=14 ∧ InPolygon E.a E.b 2 12 ∧
        InPolygon E.a E.b 3 12 ∧ InPolygon E.a E.b 4 12) :=
  ⟨source_member,no_packet_rank,no_packet_load,original_scope⟩

end PacketInterfaceR125
#print axioms PacketInterfaceR125.obstruction_in_original_scope
