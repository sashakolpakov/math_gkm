import MathGKM.Round84ReciprocalA
import MathGKM.Accepted0beeba7c6244e2295e3e804c
import MathGKM.Accepted4b3e8f6038531f10e4cbc50a

/- Machine-authored round84. Actual applicability remains explicit. -/
namespace ReciprocalActualR84
noncomputable section
open Polynomial ReciprocalR84 FullFiberRankR80

def RankFactors (N sigma j L a b : ℕ) : Prop :=
  Factors ((rankPoly N sigma j L a b).map (Int.castRingHom ℝ)) L

theorem comparison (N sigma j L a b r : ℕ) (h : RankFactors N sigma j L a b)
    (hr : 2*r<L) :
    (PairConvolutionR78.P N sigma j L a b r).card ≤
      (PairConvolutionR78.P N sigma j L a b (r+1)).card := by
  have ht := (transport _ L h).2.2.2.2.1 r hr
  simp only [Polynomial.coeff_map,Int.coe_castRingHom] at ht
  rw [(Accepted0beeba7c6244e2295e3e804c.obligation.1 N sigma j L a b r).1,
    (Accepted0beeba7c6244e2295e3e804c.obligation.1 N sigma j L a b (r+1)).1] at ht
  exact_mod_cast ht

theorem conditional_weakLC (n : ℕ) (hn : 1≤n)
    (hF : ∀ sigma, sigma≤1 → ∀ j L a b, RankFactors (2*n) sigma j L a b) :
    let E := (MathGKM.Markov.frame (List.replicate (n-1) true)).mid
    MathGKM.Markov.WeakLC E.a E.b E.p := by
  apply Accepted4b3e8f6038531f10e4cbc50a.obligation n hn
  · intro i j hp0 hp1 hp2 a b
    exact comparison (2*n) 0 j (2*i+2) a b i (hF 0 (by omega) j (2*i+2) a b) (by omega)
  · intro i j hp0 hp1 hp2 a b
    exact comparison (2*n) 1 i (2*j+2) a b j (hF 1 (by omega) i (2*j+2) a b) (by omega)

end
end ReciprocalActualR84
#print axioms ReciprocalActualR84.conditional_weakLC
