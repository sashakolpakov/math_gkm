import MathGKM.Round126WeightsA
import MathGKM.Round125PairA

/- Machine-authored round126. Arbitrary intermediate valid objects and the
unchanged elementary edit relation. A restricted-transport obstruction only. -/
namespace UniformDistanceR126
open PacketsR120 PacketStructureR121 LocalRetilingR76 AugmentingR125
open AugmentingPairR125 (PairSteps)

theorem high_gain_lower (h k : ℕ) (hh : 1≤h) (y : Obj)
    (hs : Steps (20*h+6) k (high h) y) (hg : (high h).1.card<y.1.card) :
    2*h+1≤k := by
  obtain ⟨ys,hw,hy⟩ := steps_word hs (highWord h) (family_width h hh).1 rfl
  have he : ∀ e, e+1<20*h+6 →
      2*h+1≤weight h e+weight h (e+1)+(if e∈(high h).1 then 0 else 1) :=
    fun e _ => dual_edges h e
  have hb := weighted_word_bound (20*h+6) (2*h+1) (high h).1 (weight h) he ys 0 (by omega)
  have hc := steps_new_edges (20*h+6) k (high h) y hs
  have hd : dimers ys=y.1.card := by rw [← hy]; exact (decode_dimers ys 0).symm
  have hn : newCount (high h).1 0 ys=(y.1 \ (high h).1).card := by
    rw [newCount_eq]; rw [← hy]; rfl
  rw [hw,total_weight,hd,hn] at hb
  have hcard := (family_cards h hh).1
  nlinarith

theorem central_lower (h k : ℕ) (hh : 1≤h) (w : Pair)
    (hs : PairSteps (20*h+6) k (low h,high h) w)
    (hw : valid (20*h+6) w.1 ∧ valid (20*h+6) w.2)
    (hd : du 0 w.1=4*h-1 ∧ du 0 w.2=4*h-1 ∧
      dv (20*h+6) 0 w.1=6*h+6 ∧ dv (20*h+6) 0 w.2=6*h+6) :
    2*h+2≤k := by
  have hf := family_degrees h hh
  have hi : 4*h-2+2=4*h := by omega
  have hi' : 4*h-2+1=4*h-1 := by omega
  have hb := endpoint_matching_changes (20*h+6) 0 (4*h-2) (6*h+6)
    (low h,high h) w ⟨hf.1,hf.2.1⟩ hw
    ⟨hf.2.2.1,by simpa only [hi] using hf.2.2.2.1,
      by simpa only [hi'] using hd.1,by simpa only [hi'] using hd.2.1,
      hf.2.2.2.2.1,hf.2.2.2.2.2,hd.2.2.1,hd.2.2.2⟩
  obtain ⟨a,b,hab,ha,hb'⟩ := AugmentingPairR125.layers hs
  have hg : (high h).1.card<w.2.1.card := by
    have ht := hb.2
    change w.2.1.card=(high h).1.card+1 at ht
    omega
  have hhigh := high_gain_lower h b hh w.2 hb' hg
  have hlow : 1≤a := by
    by_contra hn
    have hz : a=0 := by omega
    subst a
    have he := AugmentingPairR125.zero_steps ha
    have hc := congrArg (fun o : Obj => o.1.card) he
    have ht := hb.1
    change w.1.1.card+1=(low h).1.card at ht
    change (low h).1.card=w.1.1.card at hc
    omega
  omega

theorem packet_steps (N : ℕ) (z w : Pair) (hp : packet N z w) :
    ∃ k≤3, PairSteps N k z w := by
  rcases hp with ⟨rfl,_,_⟩|he|⟨a,h1,h2⟩|⟨a,b,h1,h2,h3⟩
  · exact ⟨0,by omega,PairSteps.refl _⟩
  · exact ⟨1,by omega,PairSteps.tail (PairSteps.refl _) he⟩
  · exact ⟨2,by omega,PairSteps.tail (PairSteps.tail (PairSteps.refl _) h1) h2⟩
  · exact ⟨3,by omega,PairSteps.tail (PairSteps.tail (PairSteps.tail (PairSteps.refl _) h1) h2) h3⟩

theorem central_rank_lower (h k : ℕ) (hh : 1≤h) (w : Pair)
    (hw : w∈ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
      (2*(4*h-2)+2) (4*h-1))
    (hs : PairSteps (20*h+6) k (low h,high h) w) : 2*h+2≤k := by
  have hL : 2*(4*h-2)+2=(4*h-1)+(4*h-1) := by omega
  rw [hL] at hw
  have hf := PacketInterfaceR125.rank_facts _ _ _ _ _ w hw
  exact central_lower h k hh w hs ⟨hf.1,hf.2.1⟩ hf.2.2

theorem no_packet (h : ℕ) (hh : 1≤h) (w : Pair)
    (hw : w∈ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
      (2*(4*h-2)+2) (4*h-1)) : ¬ packet (20*h+6) (low h,high h) w := by
  intro hp
  obtain ⟨k,hk,hs⟩ := packet_steps _ _ _ hp
  have := central_rank_lower h k hh w hw hs
  omega

theorem no_packet_load (h : ℕ) (hh : 1≤h) :
    ¬ EqualMassR122.PacketLoad (20*h+6) 0 (4*h-2) (6*h+6) := by
  apply PacketInterfaceR125.empty_row_not_load _ _ _ _ (low h,high h)
    (family_member h hh)
  intro w hw
  have hi : 4*h-2+1=4*h-1 := by omega
  rw [hi] at hw
  exact no_packet h hh w hw

theorem fixed_budget (K : ℕ) :
    let h := K+1
    (low h,high h)∈ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
      (2*(4*h-2)+2) (4*h-2) ∧
    ∀ w∈ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
      (2*(4*h-2)+2) (4*h-1), ∀ k≤K,
        ¬ PairSteps (20*h+6) k (low h,high h) w := by
  dsimp only
  refine ⟨family_member (K+1) (by omega),?_⟩
  intro w hw k hk hs
  have := central_rank_lower (K+1) k (by omega) w hw hs
  omega

end UniformDistanceR126
#print axioms UniformDistanceR126.high_gain_lower
#print axioms UniformDistanceR126.central_lower
#print axioms UniformDistanceR126.fixed_budget
