import MathGKM.Round24ActualA
import MathGKM.Markov
def MathGKM.Target005692f06c3cc1375c4b0b0f.Interface :=
  (
    True
  )
def MathGKM.Target005692f06c3cc1375c4b0b0f.Transport (StudyInterface : MathGKM.Target005692f06c3cc1375c4b0b0f.Interface) : Prop :=
  (
    True
  )
def MathGKM.Target005692f06c3cc1375c4b0b0f.Goal (StudyInterface : MathGKM.Target005692f06c3cc1375c4b0b0f.Interface) : Prop :=
  (
    (∀ (path : List Bool) (branch : Bool) (r : ℕ),
    let f := MathGKM.Markov.frame path
        let F := if branch then f.hi else f.lo
        let O := if branch then f.lo else f.hi
        let Q := (MathGKM.Markov.advance f branch).mid
        RawDeficitR24.layer Q r=RawDeficitR24.T*RawDeficitR24.convolution F f.mid r+
          (if r=0 then 0 else RawDeficitR24.convolution F f.mid (r-1))-
          (if F.a+F.b≤r then MathGKM.Markov.U^F.a*MathGKM.Markov.V^F.b*RawDeficitR24.layer O (r-(F.a+F.b)) else 0)) ∧
    (∀ (path : List Bool) (branch : Bool),
    let f := MathGKM.Markov.frame path
        let F := if branch then f.hi else f.lo
        let O := if branch then f.lo else f.hi
        let Q := (MathGKM.Markov.advance f branch).mid
        RawDeficitR24.layer Q 0=RawDeficitR24.T*RawDeficitR24.layer F 0*RawDeficitR24.layer f.mid 0 ∧
        RawDeficitR24.layer Q 1=RawDeficitR24.T*(RawDeficitR24.layer F 1*RawDeficitR24.layer f.mid 0+RawDeficitR24.layer F 0*RawDeficitR24.layer f.mid 1)+
          RawDeficitR24.layer F 0*RawDeficitR24.layer f.mid 0-
          (if F.a+F.b=1 then MathGKM.Markov.U^F.a*MathGKM.Markov.V^F.b*RawDeficitR24.layer O 0 else 0) ∧
        RawDeficitR24.layer Q 2=RawDeficitR24.T*(RawDeficitR24.layer F 2*RawDeficitR24.layer f.mid 0+RawDeficitR24.layer F 1*RawDeficitR24.layer f.mid 1+
          RawDeficitR24.layer F 0*RawDeficitR24.layer f.mid 2)+RawDeficitR24.layer F 1*RawDeficitR24.layer f.mid 0+RawDeficitR24.layer F 0*RawDeficitR24.layer f.mid 1-
          (if F.a+F.b=1 then MathGKM.Markov.U^F.a*MathGKM.Markov.V^F.b*RawDeficitR24.layer O 1 else
            if F.a+F.b=2 then MathGKM.Markov.U^F.a*MathGKM.Markov.V^F.b*RawDeficitR24.layer O 0 else 0))
  )
