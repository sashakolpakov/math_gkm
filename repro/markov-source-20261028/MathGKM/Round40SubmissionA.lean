import MathGKM.Round40ControlsA
import MathGKM.Round40ConsumerA

namespace GroupedSubmissionR40

theorem bridge :
(∀ A₀ A₁ A₂ : Polynomial ℤ,
  (∀ l : ℕ, 0≤(A₁^2-A₀*A₂).coeff l) →
  A₀.eval 1*A₂.eval 1≤(A₁.eval 1)^2) ∧
(∀ (n : ℕ) (a b c : ℕ → ℤ) (l : ℕ),
  (GroupedR40.Defect (GroupedR40.encode n a) (GroupedR40.encode n b) (GroupedR40.encode n c)).coeff l =
    Finset.sum (Finset.range (n+1)) (fun s => Finset.sum (Finset.range (n+1)) (fun t =>
      if s+t=l then b s*b t-a s*c t else 0))) ∧
(∀ (n : ℕ) (a b c : ℕ → ℤ),
  (∀ l : ℕ, l≤2*n → 0≤Finset.sum (Finset.range (n+1)) (fun s =>
    Finset.sum (Finset.range (n+1)) (fun t => if s+t=l then b s*b t-a s*c t else 0))) →
  Finset.sum (Finset.range (n+1)) a*Finset.sum (Finset.range (n+1)) c ≤
    (Finset.sum (Finset.range (n+1)) b)^2) :=
  ⟨GroupedR40.evaluation_bridge, GroupedR40.grouped_coeff, GroupedR40.grouped_finite_bridge⟩

theorem controls :
(GroupedR40.Defect (1 : Polynomial ℤ) (1+Polynomial.X) (2*Polynomial.X) = 1+Polynomial.X^2 ∧
    GroupedR40.Nonnegative (GroupedR40.Defect (1 : Polynomial ℤ) (1+Polynomial.X) (2*Polynomial.X)) ∧
    (1 : Polynomial ℤ).coeff 0*(2*Polynomial.X : Polynomial ℤ).coeff 1 >
      (1+Polynomial.X : Polynomial ℤ).coeff ((0+1)/2)*
        (1+Polynomial.X : Polynomial ℤ).coeff ((0+1+1)/2)) ∧ (GroupedR40.Defect (2 : Polynomial ℤ) (1+Polynomial.X) 1 = -1+2*Polynomial.X+Polynomial.X^2 ∧
    (GroupedR40.Defect (2 : Polynomial ℤ) (1+Polynomial.X) 1).coeff 0 = -1 ∧
    (GroupedR40.Defect (2 : Polynomial ℤ) (1+Polynomial.X) 1).eval 1 = 2 ∧
    ¬ GroupedR40.Nonnegative (GroupedR40.Defect (2 : Polynomial ℤ) (1+Polynomial.X) 1)) :=
  ⟨GroupedR40.pointwise_control, GroupedR40.evaluated_control⟩

theorem consumer :
∀ (k : ℕ)
    (hH : ∀ i j,
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate k true)).mid.a (MathGKM.Markov.frame (List.replicate k true)).mid.b i j →
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate k true)).mid.a (MathGKM.Markov.frame (List.replicate k true)).mid.b (i+1) j →
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate k true)).mid.a (MathGKM.Markov.frame (List.replicate k true)).mid.b (i+2) j →
      ∀ l, l≤2*(k+1) → 0≤GroupedR40.group (k+1) i j 1 0 l)
    (hV : ∀ i j,
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate k true)).mid.a (MathGKM.Markov.frame (List.replicate k true)).mid.b i j →
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate k true)).mid.a (MathGKM.Markov.frame (List.replicate k true)).mid.b i (j+1) →
      MathGKM.Markov.InPolygon (MathGKM.Markov.frame (List.replicate k true)).mid.a (MathGKM.Markov.frame (List.replicate k true)).mid.b i (j+2) →
      ∀ l, l≤2*(k+1) → 0≤GroupedR40.group (k+1) i j 0 1 l),
    let E := (MathGKM.Markov.frame (List.replicate k true)).mid
    (∀ i j, MathGKM.Markov.InPolygon E.a E.b i j → MathGKM.Markov.InPolygon E.a E.b (i+1) j →
      MathGKM.Markov.InPolygon E.a E.b (i+2) j →
      MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p (i+2) j≤MathGKM.Markov.coeff E.p (i+1) j^2) ∧
    (∀ i j, MathGKM.Markov.InPolygon E.a E.b i j → MathGKM.Markov.InPolygon E.a E.b i (j+1) →
      MathGKM.Markov.InPolygon E.a E.b i (j+2) →
      MathGKM.Markov.coeff E.p i j*MathGKM.Markov.coeff E.p i (j+2)≤MathGKM.Markov.coeff E.p i (j+1)^2) :=
  GroupedR40.original_coordinates

end GroupedSubmissionR40

#print axioms GroupedSubmissionR40.bridge

#print axioms GroupedSubmissionR40.controls

#print axioms GroupedSubmissionR40.consumer
