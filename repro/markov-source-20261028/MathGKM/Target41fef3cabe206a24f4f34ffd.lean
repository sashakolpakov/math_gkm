import MathGKM.Round9Conditional
import MathGKM.Markov
def MathGKM.Target41fef3cabe206a24f4f34ffd.Interface :=
  (
    True
  )
def MathGKM.Target41fef3cabe206a24f4f34ffd.Transport (StudyInterface : MathGKM.Target41fef3cabe206a24f4f34ffd.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target41fef3cabe206a24f4f34ffd.Goal (StudyInterface : MathGKM.Target41fef3cabe206a24f4f34ffd.Interface) : Prop :=
  (
    ∀ (f : MathGKM.Markov.Frame) (hsuma : f.mid.a=f.lo.a+f.hi.a) (hsumb : f.mid.b=f.lo.b+f.hi.b) (hdet : f.hi.a*f.lo.b=f.lo.a*f.hi.b+1) (hlb : 0<f.lo.b) (hhb : 0<f.hi.b) (hli : f.lo.a<f.lo.b) (hhi : f.hi.a≤f.hi.b) (hha : 0<f.hi.a) (hep : f.lo.a=0 → f.lo=⟨0,1,1⟩) (hsp : ∀ E ∈ [f.lo,f.mid,f.hi], ∀ i j, ¬MathGKM.Markov.InPolygon E.a E.b i j → MathGKM.Markov.coeff E.p i j=0) (hx : ∀ E ∈ [f.lo,f.mid,f.hi], MathGKM.Markov.coeff E.p E.a 0=1) (hy : ∀ E ∈ [f.lo,f.mid,f.hi], 0<E.a → MathGKM.Markov.coeff E.p 0 E.b=1), ∀ branch : Bool, let F := if branch then f.hi else f.lo; let O := if branch then f.lo else f.hi; let Q := (MathGKM.Markov.advance f branch).mid; let e := if branch then (f.mid.a,f.hi.b) else (f.lo.a,f.mid.b); Q.b*e.1+Q.a*e.2+1=Q.a*Q.b ∧ (∀ i j, Q.b*i+Q.a*j<Q.a*Q.b → MathGKM.Markov.coeff (MathGKM.Markov.S*F.p*f.mid.p) i j=(if i=e.1 ∧ j=e.2 then 1 else 0) ∧ MathGKM.Markov.coeff (MathGKM.Markov.U^F.a*MathGKM.Markov.V^F.b*O.p) i j=(if i=e.1 ∧ j=e.2 then 1 else 0) ∧ MathGKM.Markov.coeff Q.p i j=0)
  )
