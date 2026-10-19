import MathGKM.MarkovPathUniqueR0003
import MathGKM.Accepted8acfcca661d31b57110fe18a
import MathGKM.Accepted7faadd426b2fb604af5918ff

/-! Machine-authored 2026-10-19, round 3. Unique indexing of the generated
numerator family. Published Laurent-family identification remains open. -/
namespace MathGKM.Markov
noncomputable section

theorem reduced_pair_unique_path (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (hc : Nat.Coprime a b) :
    ∃! p : List Bool, (frame p).mid.a = a ∧ (frame p).mid.b = b := by
  rcases Accepted8acfcca661d31b57110fe18a.obligation a b ha hab.le hc with he | ⟨p,hp⟩
  · omega
  · refine ⟨p, hp, ?_⟩
    intro q hq
    apply frame_path_unique
    rw [hp.1, hp.2, hq.1, hq.2]

/-- The 1/1 endpoint uses u+v; interior labels use the separate recurrence.
The endpoint 0/1 is deliberately outside this positive-index relation. -/
def GeneratedNumerator (a b : ℕ) (T : TriPoly) : Prop :=
  (a = 1 ∧ b = 1 ∧ T = u+v) ∨
    ∃ p : List Bool, (frame p).mid.a = a ∧ (frame p).mid.b = b ∧
      T = (numeratorFrame p).mid.p

theorem generated_numerator_functional {a b : ℕ} {T R : TriPoly}
    (hT : GeneratedNumerator a b T) (hR : GeneratedNumerator a b R) : T = R := by
  rcases hT with ⟨ha,hb,hT⟩ | ⟨p,hpa,hpb,hT⟩
  · rcases hR with ⟨_,_,hR⟩ | ⟨q,hqa,hqb,_⟩
    · exact hT.trans hR.symm
    · have h := (frame_mid_strict q).2
      omega
  · rcases hR with ⟨ha,hb,_⟩ | ⟨q,hqa,hqb,hR⟩
    · have h := (frame_mid_strict p).2
      omega
    · have hpq : p = q := by
        apply frame_path_unique
        rw [hpa,hpb,hqa,hqb]
      subst q
      exact hT.trans hR.symm

theorem reduced_pair_unique_numerator (a b : ℕ) (ha : 0 < a) (hab : a ≤ b)
    (hc : Nat.Coprime a b) : ∃! T : TriPoly, GeneratedNumerator a b T := by
  rcases Accepted8acfcca661d31b57110fe18a.obligation a b ha hab hc with he | ⟨p,hp⟩
  · refine ⟨u+v, Or.inl ⟨he.1,he.2,rfl⟩, ?_⟩
    intro R hR
    exact generated_numerator_functional hR (Or.inl ⟨he.1,he.2,rfl⟩)
  · refine ⟨(numeratorFrame p).mid.p, Or.inr ⟨p,hp.1,hp.2,rfl⟩, ?_⟩
    intro R hR
    exact generated_numerator_functional hR (Or.inr ⟨p,hp.1,hp.2,rfl⟩)

theorem generated_numerator_lift {a b : ℕ} {T : TriPoly}
    (hT : GeneratedNumerator a b T) (p : List Bool)
    (hpa : (frame p).mid.a = a) (hpb : (frame p).mid.b = b) :
    T = liftHomogeneous (frame p).mid.p (a+b-1) := by
  have hi := Accepted7faadd426b2fb604af5918ff.obligation.2.2.2 p
  have hm := congrArg (fun f : NumeratorFrame => f.mid.p) hi
  change (numeratorFrame p).mid.p = H (frame p).mid at hm
  have hgen : GeneratedNumerator a b (H (frame p).mid) :=
    Or.inr ⟨p,hpa,hpb,hm.symm⟩
  have h := generated_numerator_functional hT hgen
  simpa only [H, hpa, hpb] using h

theorem reduced_pair_unique_numerator_lift (a b : ℕ) (ha : 0 < a) (hab : a ≤ b)
    (hc : Nat.Coprime a b) :
    ∃! T : TriPoly, GeneratedNumerator a b T ∧
      ∀ p : List Bool, (frame p).mid.a = a → (frame p).mid.b = b →
        T = liftHomogeneous (frame p).mid.p (a+b-1) := by
  obtain ⟨T,hT,huniq⟩ := reduced_pair_unique_numerator a b ha hab hc
  exact ⟨T, ⟨hT,fun p hpa hpb => generated_numerator_lift hT p hpa hpb⟩,
    fun R hR => huniq R hR.1⟩

#print axioms reduced_pair_unique_path
#print axioms reduced_pair_unique_numerator_lift
end
end MathGKM.Markov
