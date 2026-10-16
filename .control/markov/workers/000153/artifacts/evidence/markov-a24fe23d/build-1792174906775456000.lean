import MarkovPellHalfMA24
import MarkovPellReverseTwoMA24
/-! Machine-authored a24fe23d. A conditional bridge from the remaining midpoint
range and a finite discrete summation theorem. Neither premise is asserted. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

def FiniteMidpointSumMA24 : Prop := ∀ (N : ℕ) (f g h : ℕ → ℝ),
 (∀ q, 0 ≤ f q) → (∀ q, 0 ≤ g q) → (∀ q, 0 ≤ h q) →
 (∀ q r, q ≤ N → r ≤ N → f q*g r ≤ h ((q+r)/2)*h ((q+r+1)/2)) →
 (∑ q ∈ range (N+1), f q)*(∑ q ∈ range (N+1), g q) ≤ (∑ q ∈ range (N+1), h q)^2

def PellReverseMidpointMA24 : Prop := ∀ a j s q r : ℕ, r+3 ≤ q →
 pellTermMA24 a j s q*pellTermMA24 a j (s+2) r ≤
 pellTermMA24 a j (s+1) ((q+r)/2)*pellTermMA24 a j (s+1) ((q+r+1)/2)

theorem pell_midpoint_of_reverseMA24 (h : PellReverseMidpointMA24) (a j s q r : ℕ) :
 pellTermMA24 a j s q*pellTermMA24 a j (s+2) r ≤
 pellTermMA24 a j (s+1) ((q+r)/2)*pellTermMA24 a j (s+1) ((q+r+1)/2) := by
 by_cases hqr : q ≤ r
 · exact pell_half_midpointMA24 a j s q r hqr
 by_cases h1 : q=r+1
 · subst q
   simpa only [show (r+1+r)/2=r by omega,show (r+1+r+1)/2=r+1 by omega]
     using pell_reverse_oneMA24 a j s r
 by_cases h2 : q=r+2
 · subst q
   simpa only [show (r+2+r)/2=r+1 by omega,show (r+2+r+1)/2=r+1 by omega,pow_two]
     using pell_reverse_twoMA24 a j s r
 exact h a j s q r (by omega)

theorem pell_sum_lc_conditionalMA24 (hsum : FiniteMidpointSumMA24)
 (hrev : PellReverseMidpointMA24) (a j s N : ℕ) :
 (∑ q ∈ range (N+1),pellTermMA24 a j s q)*
 (∑ q ∈ range (N+1),pellTermMA24 a j (s+2) q) ≤
 (∑ q ∈ range (N+1),pellTermMA24 a j (s+1) q)^2 :=
 hsum N _ _ _ (pell_term_nonnegMA24 _ _ _) (pell_term_nonnegMA24 _ _ _)
   (pell_term_nonnegMA24 _ _ _) (fun q r _ _ => pell_midpoint_of_reverseMA24 hrev a j s q r)

theorem source_pell_horizontal_conditionalMA24 (hsum : FiniteMidpointSumMA24)
 (hrev : PellReverseMidpointMA24) (path : List Bool)
 (hb : (frame path).mid.b=(frame path).mid.a+1) (i j : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i j)
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨n,rfl⟩ := source_near_one_path650 path hb
 rw [(right_labels650 n).1,(right_labels650 n).2] at h0 h2
 by_cases hj : j=0
 · subst j; exact boundary_raw_logConcave _ i
 have hlo : n+2 ≤ i+j := by
   have h := h0.1
   by_contra hh
   have hm := Nat.mul_le_mul_left (n+2) (show i+j ≤ n+1 by omega)
   nlinarith
 have hhi : i+j+2 ≤ 2*n+2 := by have := h2.2; omega
 let s := i+j-(n+2)
 have hs : s+2 ≤ n := by dsimp [s]; omega
 have he : i+j=n+s+2 := by dsimp [s]; omega
 rw [right_horizontal_sum_fixed9a72 n i j s (by omega) he,
   right_horizontal_sum_fixed9a72 n (i+2) j (s+2) hs (by omega),
   right_horizontal_sum_fixed9a72 n (i+1) j (s+1) (by omega) (by omega)]
 have h := pell_sum_lc_conditionalMA24 hsum hrev (n+1) j s (n+1)
 unfold pellTermMA24 at h
 norm_cast at h
 exact h

end
end MathGKM.Markov
