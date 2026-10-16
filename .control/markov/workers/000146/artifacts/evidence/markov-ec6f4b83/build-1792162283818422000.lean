import MarkovUpperScalarM2B3
/-! Machine-authored ec6f4b83. Universal guarded scalar comparisons. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
theorem upper_horizontal_regionsMEC6 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t)
 (hi : 2 ≤ k+p+r) : 0 ≤ upperHGapM2B3 (k+p+r+t) (k+p+r) (k+p) k := by
 by_cases hk2 : 2 ≤ k
 · have hs := upper_horizontal0M2B3 (k-2) p r t (by omega) hp hr ht
   convert hs using 1 <;> congr 1 <;> ring
 · by_cases hk1 : k=1
   · subst k
     by_cases hp1 : 1 ≤ p
     · have hs := upper_horizontal1M2B3 0 (p-1) r t (by omega) (by omega) hr ht
       convert hs using 1 <;> congr 1 <;> ring
     · have hp0 : p=0 := by omega
       subst p
       have hs := upper_horizontal2M2B3 0 0 (r-1) t (by omega) (by omega) (by omega) ht
       convert hs using 1 <;> congr 1 <;> ring
   · have hk0 : k=0 := by omega
     subst k
     by_cases hp2 : 2 ≤ p
     · have hs := upper_horizontal3M2B3 0 (p-2) r t (by omega) (by omega) hr ht
       convert hs using 1 <;> congr 1 <;> ring
     · by_cases hp1 : p=1
       · subst p
         have hs := upper_horizontal4M2B3 0 0 (r-1) t (by omega) (by omega) (by omega) ht
         convert hs using 1 <;> congr 1 <;> ring
       · have hp0 : p=0 := by omega
         subst p
         have hs := upper_horizontal5M2B3 0 0 (r-2) t (by omega) (by omega) (by omega) ht
         convert hs using 1 <;> congr 1 <;> ring

theorem upper_diagonal_regionsMEC6 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t)
 (hi : 2 ≤ k+p+r) : 0 ≤ upperDGapM2B3 (k+p+r+t) (k+p+r) k (k+p+1) := by
 by_cases hk2 : 2 ≤ k
 · have hs := upper_diagonal0M2B3 (k-2) p r t (by omega) hp hr ht
   convert hs using 1 <;> congr 1 <;> ring
 · by_cases hk1 : k=1
   · subst k
     by_cases hp1 : 1 ≤ p
     · have hs := upper_diagonal1M2B3 0 (p-1) r t (by omega) (by omega) hr ht
       convert hs using 1 <;> congr 1 <;> ring
     · have hp0 : p=0 := by omega
       subst p
       have hs := upper_diagonal2M2B3 0 0 (r-1) t (by omega) (by omega) (by omega) ht
       convert hs using 1 <;> congr 1 <;> ring
   · have hk0 : k=0 := by omega
     subst k
     by_cases hp2 : 2 ≤ p
     · have hs := upper_diagonal3M2B3 0 (p-2) r t (by omega) (by omega) hr ht
       convert hs using 1 <;> congr 1 <;> ring
     · by_cases hp1 : p=1
       · subst p
         have hs := upper_diagonal4M2B3 0 0 (r-1) t (by omega) (by omega) (by omega) ht
         convert hs using 1 <;> congr 1 <;> ring
       · have hp0 : p=0 := by omega
         subst p
         have hs := upper_diagonal5M2B3 0 0 (r-2) t (by omega) (by omega) (by omega) ht
         convert hs using 1 <;> congr 1 <;> ring

theorem upper_HgapMEC6 (N i h k : ℤ) (hi : 2 ≤ i) (hk : 0 ≤ k)
 (hkh : k ≤ h) (hh : h ≤ i) (hN : i ≤ N) : 0 ≤ upperHGapM2B3 N i h k := by
 have hs := upper_horizontal_regionsMEC6 k (h-k) (i-h) (N-i)
   hk (by omega) (by omega) (by omega) (by omega)
 convert hs using 1 <;> congr 1 <;> ring

theorem upper_DgapMEC6 (N i h k : ℤ) (hi : 2 ≤ i) (hh : 0 ≤ h)
 (hhk : h+1 ≤ k) (hk : k ≤ i+1) (hN : i ≤ N) : 0 ≤ upperDGapM2B3 N i h k := by
 have hs := upper_diagonal_regionsMEC6 h (k-h-1) (i+1-k) (N-i)
   hh (by omega) (by omega) (by omega) (by omega)
 convert hs using 1 <;> congr 1 <;> ring

theorem upper_LgapMEC6 (N i h : ℤ) (hi : 2 ≤ i) (hh : 0 ≤ h)
 (hhi : h ≤ i) (hN : i ≤ N) : 0 ≤ upperLGapM2B3 N i h := by
 by_cases hh2 : 2 ≤ h
 · have hs := upper_local0M2B3 (h-2) 0 (i-h) (N-i)
     (by omega) (by omega) (by omega) (by omega)
   convert hs using 1 <;> congr 1 <;> ring
 · by_cases hh1 : h=1
   · subst h
     have hs := upper_local1M2B3 0 0 (i-2) (N-i)
       (by omega) (by omega) (by omega) (by omega)
     convert hs using 1 <;> congr 1 <;> ring
   · have hh0 : h=0 := by omega
     subst h
     have hs := upper_local2M2B3 0 0 (i-2) (N-i)
       (by omega) (by omega) (by omega) (by omega)
     convert hs using 1 <;> congr 1 <;> ring

theorem ratio_crossMEC6 (a b c d n₁ n₂ d₁ d₂ : ℤ)
 (ha : 0 ≤ a) (hc : 0 ≤ c) (hd₁ : 0 < d₁) (hd₂ : 0 < d₂)
 (h₁ : d₁*b=n₁*a) (h₂ : d₂*d=n₂*c) (hg : n₂*d₁ ≤ n₁*d₂) :
 a*d ≤ b*c := by
 apply (mul_le_mul_left (mul_pos hd₁ hd₂)).mp
 calc
  (d₁*d₂)*(a*d) = (n₂*d₁)*(a*c) := by linear_combination d₁*a*h₂
  _ ≤ (n₁*d₂)*(a*c) := mul_le_mul_of_nonneg_right hg (mul_nonneg ha hc)
  _ = (d₁*d₂)*(b*c) := by linear_combination -d₂*c*h₁

end
end MathGKM.Markov
