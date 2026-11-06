import MathGKM.Round38SeparatorA
import MathGKM.Round38ControlA

/-! Machine-authored exact round38 wrapper. Independent admission pending. -/
namespace Round38SeparatorInterfaceA
theorem checked :
  (MathGKM.Markov.InPolygon 4 5 4 0 ∧ MathGKM.Markov.InPolygon 4 5 4 1 ∧ MathGKM.Markov.InPolygon 4 5 4 2 ∧
    MathGKM.Markov.coeff (RightR30.M 3) 4 0=1 ∧ MathGKM.Markov.coeff (RightR30.M 3) 4 1=11 ∧
    MathGKM.Markov.coeff (RightR30.M 3) 4 2=63 ∧
    MathGKM.Markov.coeff (RightR30.G 3) 4 0=0 ∧ MathGKM.Markov.coeff (RightR30.G 3) 4 1=3 ∧
    MathGKM.Markov.coeff (RightR30.G 3) 4 2=37 ∧
    MathGKM.Markov.coeff (RightR30.M 3) 4 0*MathGKM.Markov.coeff (RightR30.G 3) 4 2 >
      MathGKM.Markov.coeff (RightR30.M 3) 4 1*MathGKM.Markov.coeff (RightR30.G 3) 4 1 ∧
    MathGKM.Markov.coeff (RightR30.M 3) 4 1^2-MathGKM.Markov.coeff (RightR30.M 3) 4 0*MathGKM.Markov.coeff (RightR30.M 3) 4 2=58 ∧
    MathGKM.Markov.coeff (RightR30.G 3) 4 1^2-MathGKM.Markov.coeff (RightR30.G 3) 4 0*MathGKM.Markov.coeff (RightR30.G 3) 4 2=9) ∧
  ((MathGKM.Markov.frame (List.replicate 3 true)).mid.a=4 ∧
   (MathGKM.Markov.frame (List.replicate 3 true)).mid.b=5) ∧
  StateCrossR38.zcoeff (RightR30.M 3) 4 0*StateCrossR38.zcoeff (RightR30.G 3) 4 2 >
    StateCrossR38.zcoeff (RightR30.M 3) 4 1*StateCrossR38.zcoeff (RightR30.G 3) 4 1 :=
  by
  refine ⟨StateCrossR38.actual_separator, ?_, ?_⟩
  · simpa using (RightR30.right_labels 3).2
  · rcases StateCrossR38.actual_separator with
      ⟨hp0,hp1,hp2,hm0,hm1,hm2,hg0,hg1,hg2,hcross,hra,hrb⟩
    simpa [StateCrossR38.zcoeff] using hcross
end Round38SeparatorInterfaceA

#print axioms Round38SeparatorInterfaceA.checked
