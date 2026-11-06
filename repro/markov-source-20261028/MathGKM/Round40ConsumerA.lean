import MathGKM.Round40BridgeA
import MathGKM.Acceptedb6d2ec5febf447178088c884

/-! Machine-authored round40. Original coordinate consumer; grouped signs remain premises. -/
namespace GroupedR40
open MathGKM.Markov
open scoped BigOperators
noncomputable section

def group (n i j dx dy l : ℕ) : ℤ :=
  ∑ s ∈ Finset.range (n+1), ∑ t ∈ Finset.range (n+1),
    if s+t=l then
      MidpointR36.W n (i+dx) (j+dy) s*MidpointR36.W n (i+dx) (j+dy) t-
        MidpointR36.W n i j s*MidpointR36.W n (i+2*dx) (j+2*dy) t
    else 0

theorem original_raw_consumer (n : ℕ) (hn : 1≤n) (i j dx dy : ℕ)
    (h : ∀ l, l≤2*n → 0≤group n i j dx dy l) :
    coeff (frame (List.replicate (n-1) true)).mid.p i j*
      coeff (frame (List.replicate (n-1) true)).mid.p (i+2*dx) (j+2*dy) ≤
        coeff (frame (List.replicate (n-1) true)).mid.p (i+dx) (j+dy)^2 := by
  rw [Acceptedb6d2ec5febf447178088c884.obligation n hn i j,
    Acceptedb6d2ec5febf447178088c884.obligation n hn (i+2*dx) (j+2*dy),
    Acceptedb6d2ec5febf447178088c884.obligation n hn (i+dx) (j+dy)]
  exact grouped_finite_bridge n (MidpointR36.W n i j)
    (MidpointR36.W n (i+dx) (j+dy))
    (MidpointR36.W n (i+2*dx) (j+2*dy)) h

theorem original_coordinates (k : ℕ)
    (hH : ∀ i j,
      InPolygon (frame (List.replicate k true)).mid.a (frame (List.replicate k true)).mid.b i j →
      InPolygon (frame (List.replicate k true)).mid.a (frame (List.replicate k true)).mid.b (i+1) j →
      InPolygon (frame (List.replicate k true)).mid.a (frame (List.replicate k true)).mid.b (i+2) j →
      ∀ l, l≤2*(k+1) → 0≤group (k+1) i j 1 0 l)
    (hV : ∀ i j,
      InPolygon (frame (List.replicate k true)).mid.a (frame (List.replicate k true)).mid.b i j →
      InPolygon (frame (List.replicate k true)).mid.a (frame (List.replicate k true)).mid.b i (j+1) →
      InPolygon (frame (List.replicate k true)).mid.a (frame (List.replicate k true)).mid.b i (j+2) →
      ∀ l, l≤2*(k+1) → 0≤group (k+1) i j 0 1 l) :
    let E := (frame (List.replicate k true)).mid
    (∀ i j, InPolygon E.a E.b i j → InPolygon E.a E.b (i+1) j →
      InPolygon E.a E.b (i+2) j →
      coeff E.p i j*coeff E.p (i+2) j≤coeff E.p (i+1) j^2) ∧
    (∀ i j, InPolygon E.a E.b i j → InPolygon E.a E.b i (j+1) →
      InPolygon E.a E.b i (j+2) →
      coeff E.p i j*coeff E.p i (j+2)≤coeff E.p i (j+1)^2) := by
  constructor
  · intro i j h0 h1 h2
    simpa using original_raw_consumer (k+1) (by omega) i j 1 0 (hH i j h0 h1 h2)
  · intro i j h0 h1 h2
    simpa using original_raw_consumer (k+1) (by omega) i j 0 1 (hV i j h0 h1 h2)

end
end GroupedR40
#print axioms GroupedR40.original_coordinates
