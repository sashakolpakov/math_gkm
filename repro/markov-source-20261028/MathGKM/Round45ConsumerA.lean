import MathGKM.Round45CapacityA
import MathGKM.Accepted891ddc18d707fd6b41ae27f6

/-! Machine-authored round45. Only the donor-index premise is discharged.
The substantive capacity comparison remains an explicit antecedent. -/
namespace DistanceTwoR45
open MathGKM.Markov
noncomputable section
theorem original_comparison_consumer (n : ℕ) (hn : 1≤n) (i j dx dy : ℕ)
    (hd : (dx=1 ∧ dy=0) ∨ (dx=0 ∧ dy=1))
    (h0 : InPolygon n (n+1) i j)
    (h1 : InPolygon n (n+1) (i+dx) (j+dy))
    (h2 : InPolygon n (n+1) (i+2*dx) (j+2*dy))
    (h : ∀ l, l≤2*n → GroupedR40.group n i j dx dy l<0 →
      -GroupedR40.group n i j dx dy l≤GroupedR40.group n i j dx dy (l+2)) :
    coeff (frame (List.replicate (n-1) true)).mid.p i j *
      coeff (frame (List.replicate (n-1) true)).mid.p (i+2*dx) (j+2*dy) ≤
        coeff (frame (List.replicate (n-1) true)).mid.p (i+dx) (j+dy)^2 := by
  apply Accepted891ddc18d707fd6b41ae27f6.obligation n hn i j dx dy hd h0 h1 h2
  intro l hl he
  exact ⟨negative_has_donor_index n i j dx dy l hn hd h0 he,h l hl he⟩
end
end DistanceTwoR45
#print axioms DistanceTwoR45.original_comparison_consumer
