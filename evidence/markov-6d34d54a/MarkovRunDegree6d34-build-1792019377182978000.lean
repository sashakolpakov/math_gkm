import MarkovDegreeBridge07a7
/-! Machine-authored 6d34. Exact last-cut degree and weighted snoc
enumeration. These are representation identities, not root inequalities. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

theorem maskDegree_skip_last6d34 (m : List (Bool × Bool)) (d : ℕ) (r : Bool) :
    maskDegree07a7 d (m++[(r,false)])=maskDegree07a7 d m := by
  induction m generalizing d with
  | nil => cases r <;> simp [maskDegree07a7]
  | cons rb rs ih =>
    obtain ⟨r,b⟩ := rb
    cases b <;> cases r <;> simp [maskDegree07a7,ih]

theorem maskWeight_skip_last6d34 {R : Type*} [CommRing R]
    (y p q : R) (m : List (Bool × Bool)) (r : Bool) :
    maskWeight340 y p q (m++[(r,false)])=maskWeight340 y p q m := by
  induction m generalizing p q with
  | nil => simp [maskWeight340]
  | cons rb rs ih =>
    obtain ⟨r,b⟩ := rb
    cases b <;> simp [maskWeight340,ih]

theorem maskDegree_last_B6d34 (m : List (Bool × Bool))
    (h : ∀ rb ∈ m, rb.1=true) (d : ℕ) :
    maskDegree07a7 d (m++[(true,true)])=
      d+m.length+(m.map Prod.snd).count true+1 := by
  induction m generalizing d with
  | nil => simp [maskDegree07a7]
  | cons rb rs ih =>
    obtain ⟨r,b⟩ := rb
    have hr : r=true := h (r,b) (by simp)
    subst r
    have ht : ∀ rb ∈ rs,rb.1=true := by intro rb hb; exact h rb (by simp [hb])
    cases b <;> simp [maskDegree07a7,ih ht,List.count_cons] <;> omega

theorem sourceMask_last_degree6d34 (n s : ℕ) (m : List (Bool × Bool))
    (hm : m ∈ cutMasksFe01 (List.replicate n true) s) :
    maskDegree07a7 1 (m++[(true,true)])=n+s+2 := by
  obtain ⟨hw,hs⟩ := cutMasks_specFe01 _ _ _ hm
  have hl : m.length=n := by simpa using congrArg List.length hw
  have hb : ∀ rb ∈ m,rb.1=true := by
    intro rb hr
    have hh : rb.1 ∈ m.map Prod.fst := List.mem_map_of_mem hr
    rw [hw] at hh
    exact (List.mem_replicate.mp hh).2
  rw [maskDegree_last_B6d34 m hb,hl,hs]
  omega

theorem maskSum_snoc6d34 {R : Type*} [CommRing R]
    (w : List Bool) (r : Bool) (s : ℕ) (f : List (Bool × Bool) → R) :
    ((cutMasksFe01 (w++[r]) s).map f).sum =
      ((cutMasksFe01 w s).map (fun m => f (m++[(r,false)]))).sum +
      if s=0 then 0 else
        ((cutMasksFe01 w (s-1)).map (fun m => f (m++[(r,true)]))).sum := by
  induction w generalizing s f with
  | nil => rcases s with _ | (_ | s) <;> simp [cutMasksFe01]
  | cons b w ih =>
    rcases s with _ | (_ | s)
    · simpa [cutMasksFe01,List.map_map,Function.comp_def] using
        ih 0 (fun m => f ((b,false)::m))
    · simp only [List.cons_append,cutMasksFe01,List.map_append,List.sum_append,
        List.map_map,Function.comp_def]
      rw [ih,ih]
      simp [cutMasksFe01,List.map_map,Function.comp_def]
      ring
    · simp only [List.cons_append,cutMasksFe01,List.map_append,List.sum_append,
        List.map_map,Function.comp_def]
      rw [ih,ih]
      simp [cutMasksFe01,List.map_map,Function.comp_def]
      ring

#print axioms sourceMask_last_degree6d34
#print axioms maskSum_snoc6d34
end
end MathGKM.Markov
