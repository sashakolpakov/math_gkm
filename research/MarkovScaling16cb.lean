import MarkovQuotient16cb

/-! Machine-authored worker 16cb07ce. Exact scaling of the explicit quotient. -/
namespace MathGKM.Markov
noncomputable section

theorem q_advance_scaling16 {R : Type*} [CommRing R] (u v t : R)
    (f : Frame) (q : QTriple16 R) (r : Bool) :
    qAdvance16 u v t f q r = qAdvance16 (u*t) (v*t) 1 f q r := by
  cases r <;> simp only [qAdvance16,Bool.false_eq_true,if_false,if_true,
    one_pow,mul_one,mul_pow,pow_add]
  · congr 2 <;> ring
  · congr 2 <;> ring

theorem quotient_scaling16 {R : Type*} [CommRing R] (u v t : R)
    (path : List Bool) : qTree16 u v t path = qTree16 (u*t) (v*t) 1 path := by
  have he : qPairStep16 u v t = qPairStep16 (u*t) (v*t) 1 := by
    funext fq r
    exact congrArg (fun q => (advance fq.1 r,q)) (q_advance_scaling16 u v t fq.1 fq.2 r)
  unfold qTree16
  rw [he]
  simp

#print axioms quotient_scaling16
end
end MathGKM.Markov
