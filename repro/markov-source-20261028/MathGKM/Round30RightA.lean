import MathGKM.Accepted52d15b7a1160719351f5abdb

/-! Machine-authored constant-right specialization, round30. Local candidates only. -/
namespace RightR30
open MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def T : BiPoly := U+V
def M (k : ℕ) : BiPoly := (frame (List.replicate k true)).mid.p
def G (k : ℕ) : BiPoly := M k-U*(frame (List.replicate k true)).lo.p

theorem frame_step (k : ℕ) : frame (List.replicate (k+1) true)=
    advance (frame (List.replicate k true)) true := by
  simp [frame,List.replicate_succ',List.foldl_append]

theorem right_labels (k : ℕ) :
    (frame (List.replicate k true)).hi=⟨1,1,T⟩ ∧
    (frame (List.replicate k true)).mid.a=k+1 ∧
    (frame (List.replicate k true)).mid.b=k+2 := by
  induction k with
  | zero => simp [frame,initial,T]
  | succ k ih =>
    rw [frame_step]
    simp only [advance,ite_true,ih.1]
    exact ⟨True.intro,by simpa [ih.2.1, Nat.add_assoc],by simpa [ih.2.2,Nat.add_assoc]⟩

theorem entry_H : S*T-U-V=T^2 := by dsimp [S,T]; ring
theorem entry_gap : (T^2+U)-U*1=T^2 := by ring

theorem right_state (k : ℕ) :
    (M k,G k)=RenewalR28.state (T^2) U V (T^2+U) (T^2) k := by
  induction k with
  | zero => simp [M,G,frame,initial,T,RenewalR28.state_zero]
  | succ k ih =>
    rw [RenewalR28.state_step,← ih]
    apply Prod.ext
    · dsimp only [M,G]
      rw [frame_step]
      simp only [advance,ite_true,(right_labels k).1,pow_one]
      dsimp [S,T]
      ring
    · dsimp only [M,G]
      rw [frame_step]
      simp only [advance,ite_true,(right_labels k).1,pow_one]
      dsimp [S,T]
      ring

theorem iterate_frame (k : ℕ) :
    (fun f : Frame => advance f true)^[k] initial=frame (List.replicate k true) := by
  induction k with
  | zero => rfl
  | succ k ih => rw [Function.iterate_succ_apply',ih,frame_step]

theorem right_series :
    (1-PowerSeries.C (T*(T+1))*PowerSeries.X+
      PowerSeries.C (U*V)*PowerSeries.X^2)*PowerSeries.mk M =
      PowerSeries.C (T^2+U)-PowerSeries.C (U*V)*PowerSeries.X := by
  have h := Accepted52d15b7a1160719351f5abdb.obligation.1 (T^2) U V (T^2+U) (T^2)
  have hs : RenewalR28.series (T^2) U V (T^2+U) (T^2)=PowerSeries.mk M := by
    apply PowerSeries.ext
    intro n
    have hn := congrArg Prod.fst (right_state n)
    simpa only [RenewalR28.series,PowerSeries.coeff_mk] using hn.symm
  rw [hs] at h
  have hc : T^2+U+V=T*(T+1) := by dsimp [T]; ring
  rw [hc] at h
  have he : (1-PowerSeries.C V*PowerSeries.X)*PowerSeries.C (T^2+U)+
      PowerSeries.C (V*T^2)*PowerSeries.X =
      PowerSeries.C (T^2+U)-PowerSeries.C (U*V)*PowerSeries.X := by
    simp only [map_add,map_mul,map_pow]
    ring
  exact h.trans he

theorem right_recurrence (k : ℕ) :
    M (k+2)=T*(T+1)*M (k+1)-U*V*M k := by
  have h := RenewalR28.state_recurrence (T^2) U V (T^2+U) (T^2) k
  have h0 := congrArg Prod.fst (right_state k)
  have h1 := congrArg Prod.fst (right_state (k+1))
  have h2 := congrArg Prod.fst (right_state (k+2))
  rw [← h0,← h1,← h2] at h
  dsimp only at h
  rw [h]
  dsimp [T]
  ring

end
end RightR30
