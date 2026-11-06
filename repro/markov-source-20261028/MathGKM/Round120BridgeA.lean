import MathGKM.Round108CountingA
import MathGKM.Round64ConsumerA

/- Machine-authored round120. Direct cardinality consumer. The injection is
an explicit unresolved premise; no packet construction or sign is assumed. -/
namespace PacketBridgeR120
open LocalRetilingR76 ColorForgettingR108 MatchingProjectionR64 MathGKM.Markov
noncomputable section

def Injection (N sigma i t : ℕ) : Prop :=
  Nonempty ({z : Pair // z ∈ rankFiber N sigma t (2*i+2) i} ↪
    {z : Pair // z ∈ rankFiber N sigma t (2*i+2) (i+1)})

theorem unit_inequality (N sigma i t : ℕ) (h : Injection N sigma i t) :
    unit (B N sigma i t)*unit (B N sigma (i+2) t) ≤
      unit (B N sigma (i+1) t)^2 := by
  classical
  obtain ⟨f⟩ := h
  have hc := Finset.card_le_card_of_injective f.injective
  have hz : ((rankFiber N sigma t (2*i+2) i).card : ℤ) ≤
      ((rankFiber N sigma t (2*i+2) (i+1)).card : ℤ) := by
    exact_mod_cast hc
  have hm : 0 ≤ unit (defect N sigma i t) := by
    rw [unit_margin]
    exact sub_nonneg.mpr hz
  simpa only [defect,map_sub,map_pow,map_mul,sub_nonneg] using hm

theorem original_horizontal_vertical (n : ℕ) (hn : 1≤n)
    (hH : ∀ i j,
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b i j →
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b (i+1) j →
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b (i+2) j →
      Injection (2*n) 0 i j)
    (hV : ∀ i j,
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b i j →
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b i (j+1) →
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b i (j+2) →
      Injection (2*n) 1 j i) :
    let E := (frame (List.replicate (n-1) true)).mid
    (∀ i j, InPolygon E.a E.b i j → InPolygon E.a E.b (i+1) j →
      InPolygon E.a E.b (i+2) j →
      coeff E.p i j*coeff E.p (i+2) j ≤ coeff E.p (i+1) j^2) ∧
    (∀ i j, InPolygon E.a E.b i j → InPolygon E.a E.b i (j+1) →
      InPolygon E.a E.b i (j+2) →
      coeff E.p i j*coeff E.p i (j+2) ≤ coeff E.p i (j+1)^2) := by
  dsimp only
  constructor
  · intro i j h0 h1 h2
    have h := unit_inequality (2*n) 0 i j (hH i j h0 h1 h2)
    simpa only [(MatchingConsumerR64.actual_coefficients n hn i j).1,
      (MatchingConsumerR64.actual_coefficients n hn (i+1) j).1,
      (MatchingConsumerR64.actual_coefficients n hn (i+2) j).1] using h
  · intro i j h0 h1 h2
    have h := unit_inequality (2*n) 1 j i (hV i j h0 h1 h2)
    simpa only [(MatchingConsumerR64.actual_coefficients n hn i j).2,
      (MatchingConsumerR64.actual_coefficients n hn i (j+1)).2,
      (MatchingConsumerR64.actual_coefficients n hn i (j+2)).2] using h
end
end PacketBridgeR120
#print axioms PacketBridgeR120.unit_inequality
#print axioms PacketBridgeR120.original_horizontal_vertical
