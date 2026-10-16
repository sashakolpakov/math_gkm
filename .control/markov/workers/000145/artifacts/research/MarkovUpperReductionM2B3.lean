import MarkovUpperSupportM2B3
/-! Machine-authored 2b34268b. Exact numerator-two horizontal reduction.
The arithmetic sign statement is not asserted. Other source families/directions remain. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

def UpperBinomialLCM2B3 : Prop := ∀ N d i : ℕ, 1 ≤ N → 1 ≤ d →
 upperValM2B3 N d i*upperValM2B3 N d (i+2) ≤ upperValM2B3 N d (i+1)^2

def NumeratorTwoHorizontalM2B3 : Prop := ∀ path : List Bool,
 (frame path).mid.a=2 → ∀ i j,
 InPolygon (frame path).mid.a (frame path).mid.b i j →
 InPolygon (frame path).mid.a (frame path).mid.b (i+1) j →
 InPolygon (frame path).mid.a (frame path).mid.b (i+2) j →
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2

theorem source_two_zero_columnM2B3 (path : List Bool) (q j : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*q+1) (hj : j ≤ 2*q) :
 coeff (frame path).mid.p 0 j=0 := by
 obtain ⟨r,hr,hb',hp⟩ := source_two_squares3556 path ha
 have he : r=q := by omega
 subst r
 rw [hp]
 unfold coeff
 simp only [Polynomial.coeff_add,pow_two,Polynomial.mul_coeff_zero,
   fib_zero_jet3556,V,Polynomial.coeff_C_zero,←pow_add]
 rw [←pow_succ']
 simp [Polynomial.coeff_X_pow,show j≠q+1+(q+1) by omega,
   show j≠q+q+1 by omega]

theorem numerator_two_horizontal_iffM2B3 :
 NumeratorTwoHorizontalM2B3 ↔ UpperBinomialLCM2B3 := by
 constructor
 · intro hs N d i hN hd
   by_cases hi : i=0
   · rw [upper_val_zeroM2B3 N d i (Or.inl hi),zero_mul]
     exact sq_nonneg _
   by_cases hu : N+2 < i+2
   · rw [upper_val_zeroM2B3 N d (i+2) (Or.inr hu),mul_zero]
     exact sq_nonneg _
   obtain ⟨ha,hb⟩ := lower_path_labelsM58E N d (by omega)
   have hp (k : ℕ) (hk : 1 ≤ k) (hu : k ≤ N+2) :
     InPolygon (frame (lowerPathM58E N d)).mid.a
       (frame (lowerPathM58E N d)).mid.b k (N+2*d) := by
     rw [ha,hb,upper_polygonM2B3 N d k hN hd]
     exact ⟨hk,hu⟩
   have h := hs (lowerPathM58E N d) ha i (N+2*d)
     (hp i (by omega) (by omega)) (hp (i+1) (by omega) (by omega))
     (hp (i+2) (by omega) (by omega))
   simpa only [source_two_upper_formulaM2B3 _ N d _ hN hd ha hb] using h
 · intro hs path ha i j h0 h1 h2
   obtain ⟨q,hq,hb,hp⟩ := source_two_squares3556 path ha
   by_cases hj : j ≤ q
   · exact source_two_lower_halfMAF6 path j i ha (by omega)
   by_cases ht : 2*q ≤ j
   · have hu := h2.2
     rw [ha,hb] at hu
     have hi : i=0 := by omega
     have hj' : j ≤ 2*q := by omega
     rw [hi,source_two_zero_columnM2B3 path q j ha hb hj',zero_mul]
     exact sq_nonneg _
   · have hN : 1 ≤ 2*q-j := by omega
     have hd : 1 ≤ j-q := by omega
     have hb' : (frame path).mid.b=2*((2*q-j)+(j-q))+1 := by omega
     have he : (2*q-j)+2*(j-q)=j := by omega
     have h := hs (2*q-j) (j-q) i hN hd
     rw [←source_two_upper_formulaM2B3 path (2*q-j) (j-q) i hN hd ha hb',
       ←source_two_upper_formulaM2B3 path (2*q-j) (j-q) (i+2) hN hd ha hb',
       ←source_two_upper_formulaM2B3 path (2*q-j) (j-q) (i+1) hN hd ha hb',he] at h
     exact h

theorem root_implies_upperM2B3 (h : Conjecture63) : UpperBinomialLCM2B3 := by
 apply numerator_two_horizontal_iffM2B3.mp
 intro path _ i j h0 h1 h2
 exact (h.2.2 path).1 i j h0 h1 h2

end
end MathGKM.Markov
