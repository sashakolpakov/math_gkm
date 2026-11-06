import MathGKM.Round36KernelA

/-! Machine-authored exact separator wrapper, round36. -/
namespace MidpointInterfaceR36
theorem separators :
(MathGKM.Markov.InPolygon 5 6 5 0 ∧ MathGKM.Markov.InPolygon 5 6 5 1 ∧ MathGKM.Markov.InPolygon 5 6 5 2 ∧
    (5+2)/2=3 ∧ (5+2+1)/2=4 ∧
    MidpointR36.W 5 5 0 5=1 ∧ MidpointR36.W 5 5 2 2=48 ∧ MidpointR36.W 5 5 1 3=4 ∧ MidpointR36.W 5 5 1 4=10 ∧
    MidpointR36.W 5 5 0 5 * MidpointR36.W 5 5 2 2 > MidpointR36.W 5 5 1 ((5+2)/2) * MidpointR36.W 5 5 1 ((5+2+1)/2) ∧
    (Finset.sum (Finset.range 6) (fun s => MidpointR36.W 5 5 0 s))=1 ∧
    (Finset.sum (Finset.range 6) (fun s => MidpointR36.W 5 5 1 s))=14 ∧
    (Finset.sum (Finset.range 6) (fun s => MidpointR36.W 5 5 2 s))=117 ∧
    (14:ℤ)^2-1*117=79) ∧ (MathGKM.Markov.InPolygon 8 9 9 0 ∧ MathGKM.Markov.InPolygon 8 9 9 1 ∧ MathGKM.Markov.InPolygon 8 9 9 2 ∧
    (7+4)/2=5 ∧ (7+4+1)/2=6 ∧
    MidpointR36.W 8 9 0 7=8 ∧ MidpointR36.W 8 9 2 4=630 ∧ MidpointR36.W 8 9 1 5=42 ∧ MidpointR36.W 8 9 1 6=112 ∧
    MidpointR36.W 8 9 0 7*MidpointR36.W 8 9 2 4 > MidpointR36.W 8 9 1 ((7+4)/2)*MidpointR36.W 8 9 1 ((7+4+1)/2) ∧
    (Finset.sum (Finset.range 9) (fun s => MidpointR36.W 8 9 0 s))=8 ∧
    (Finset.sum (Finset.range 9) (fun s => MidpointR36.W 8 9 1 s))=154 ∧
    (Finset.sum (Finset.range 9) (fun s => MidpointR36.W 8 9 2 s))=1590 ∧
    (154:ℤ)^2-8*1590=10996) := ⟨MidpointR36.separator,MidpointR36.noncorner_separator⟩
end MidpointInterfaceR36
#print axioms MidpointInterfaceR36.separators
