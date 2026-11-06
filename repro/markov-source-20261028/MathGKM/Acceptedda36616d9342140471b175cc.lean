import MathGKM.Target620c1a4edec04bcccc604a17
import MathGKM.Markov
import Lean
def Acceptedda36616d9342140471b175cc.interface : MathGKM.Target620c1a4edec04bcccc604a17.Interface :=
  (
    True.intro
  )
theorem Acceptedda36616d9342140471b175cc.transport : MathGKM.Target620c1a4edec04bcccc604a17.Transport Acceptedda36616d9342140471b175cc.interface :=
  (
    True.intro
  )
theorem Acceptedda36616d9342140471b175cc.obligation : MathGKM.Target620c1a4edec04bcccc604a17.Goal Acceptedda36616d9342140471b175cc.interface :=
  (
    by
      intro a b hab ha hb
      have step (path : List Bool) (branch : Bool) :
          MathGKM.Markov.frame (path ++ [branch]) = MathGKM.Markov.advance (MathGKM.Markov.frame path) branch := by
        simp [MathGKM.Markov.frame, List.foldl_append]
      have sums (path : List Bool) :
          (MathGKM.Markov.frame path).mid.a = (MathGKM.Markov.frame path).lo.a + (MathGKM.Markov.frame path).hi.a ∧
          (MathGKM.Markov.frame path).mid.b = (MathGKM.Markov.frame path).lo.b + (MathGKM.Markov.frame path).hi.b := by
        induction path using List.reverseRecOn with
        | nil => norm_num [MathGKM.Markov.frame, MathGKM.Markov.initial]
        | append_singleton path branch ih =>
          rw [step]
          cases branch <;> simp [MathGKM.Markov.advance]
      have descend : ∀ n : ℕ, ∀ (path : List Bool) (u v : ℕ),
          u+v = n → 0 < u → 0 < v →
          a = u*(MathGKM.Markov.frame path).lo.a + v*(MathGKM.Markov.frame path).hi.a →
          b = u*(MathGKM.Markov.frame path).lo.b + v*(MathGKM.Markov.frame path).hi.b →
          ∃ result : List Bool, (MathGKM.Markov.frame result).mid.a = a ∧ (MathGKM.Markov.frame result).mid.b = b := by
        intro n
        induction n using Nat.strong_induction_on with
        | h n ih =>
          intro path u v hn hu hv hau hbu
          by_cases heq : u = v
          · have hda : u ∣ a := ⟨(MathGKM.Markov.frame path).lo.a + (MathGKM.Markov.frame path).hi.a, by rw [hau, ← heq]; ring⟩
            have hdb : u ∣ b := ⟨(MathGKM.Markov.frame path).lo.b + (MathGKM.Markov.frame path).hi.b, by rw [hbu, ← heq]; ring⟩
            have hone : u = 1 := Nat.eq_one_of_dvd_coprimes hab hda hdb
            refine ⟨path,?_,?_⟩
            · rw [(sums path).1, hau, ← heq, hone]
              simp
            · rw [(sums path).2, hbu, ← heq, hone]
              simp
          · by_cases hlt : v < u
            · apply ih ((u-v)+v) (by omega) (path ++ [false]) (u-v) v rfl (by omega) hv
              · rw [step]
                change a = (u-v)*(MathGKM.Markov.frame path).lo.a + v*(MathGKM.Markov.frame path).mid.a
                rw [(sums path).1, hau]
                calc
                  u*(MathGKM.Markov.frame path).lo.a+v*(MathGKM.Markov.frame path).hi.a =
                    ((u-v)+v)*(MathGKM.Markov.frame path).lo.a+v*(MathGKM.Markov.frame path).hi.a := by rw [Nat.sub_add_cancel (by omega : v ≤ u)]
                  _ = _ := by ring
              · rw [step]
                change b = (u-v)*(MathGKM.Markov.frame path).lo.b + v*(MathGKM.Markov.frame path).mid.b
                rw [(sums path).2, hbu]
                calc
                  u*(MathGKM.Markov.frame path).lo.b+v*(MathGKM.Markov.frame path).hi.b =
                    ((u-v)+v)*(MathGKM.Markov.frame path).lo.b+v*(MathGKM.Markov.frame path).hi.b := by rw [Nat.sub_add_cancel (by omega : v ≤ u)]
                  _ = _ := by ring
            · apply ih (u+(v-u)) (by omega) (path ++ [true]) u (v-u) rfl hu (by omega)
              · rw [step]
                change a = u*(MathGKM.Markov.frame path).mid.a + (v-u)*(MathGKM.Markov.frame path).hi.a
                rw [(sums path).1, hau]
                calc
                  u*(MathGKM.Markov.frame path).lo.a+v*(MathGKM.Markov.frame path).hi.a =
                    u*(MathGKM.Markov.frame path).lo.a+(u+(v-u))*(MathGKM.Markov.frame path).hi.a := by rw [Nat.add_sub_of_le (by omega : u ≤ v)]
                  _ = _ := by ring
              · rw [step]
                change b = u*(MathGKM.Markov.frame path).mid.b + (v-u)*(MathGKM.Markov.frame path).hi.b
                rw [(sums path).2, hbu]
                calc
                  u*(MathGKM.Markov.frame path).lo.b+v*(MathGKM.Markov.frame path).hi.b =
                    u*(MathGKM.Markov.frame path).lo.b+(u+(v-u))*(MathGKM.Markov.frame path).hi.b := by rw [Nat.add_sub_of_le (by omega : u ≤ v)]
                  _ = _ := by ring
      apply descend ((b-a)+a) [] (b-a) a rfl (by omega) ha
      · simp [MathGKM.Markov.frame, MathGKM.Markov.initial]
      · simp only [MathGKM.Markov.frame, List.foldl_nil, MathGKM.Markov.initial, mul_one]
        omega
  )
