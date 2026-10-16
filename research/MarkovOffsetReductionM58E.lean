import MarkovOffsetSupportM58E
/-! Machine-authored 58e57003. Exact lower-horizontal subproblem equivalence.
The arithmetic sign assertion remains unproved. This is not a root equivalence. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 1000000

def LowerSourceLCM58E : Prop := ∀ (path : List Bool) (j d i : ℕ),
 (frame path).mid.a=2 → (frame path).mid.b=2*(j+d)+1 →
 InPolygon (frame path).mid.a (frame path).mid.b i j →
 InPolygon (frame path).mid.a (frame path).mid.b (i+1) j →
 InPolygon (frame path).mid.a (frame path).mid.b (i+2) j →
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2

def LowerBinomialLCM58E : Prop := ∀ j d i : ℕ, 1 ≤ j+d →
 lowerValM58E j d i*lowerValM58E j d (i+2) ≤ lowerValM58E j d (i+1)^2

def lowerPathM58E (j d : ℕ) : List Bool := List.replicate (j+d-1) false++[true]

theorem lower_path_labelsM58E (j d : ℕ) (hq : 1 ≤ j+d) :
 (frame (lowerPathM58E j d)).mid.a=2 ∧
 (frame (lowerPathM58E j d)).mid.b=2*(j+d)+1 := by
 unfold lowerPathM58E
 rw [frame_append18,spine_frame6]
 simp [advance]
 omega

theorem lower_source_iffM58E : LowerSourceLCM58E ↔ LowerBinomialLCM58E := by
 constructor
 · intro hs j d i hq
   by_cases hi : i ≤ 1
   · rw [lower_lowM58E _ _ _ hi,zero_mul]
     exact sq_nonneg _
   by_cases hu : j+2*d+2 < i+2
   · rw [lower_highM58E _ _ _ hu,mul_zero]
     exact sq_nonneg _
   obtain ⟨ha,hb⟩ := lower_path_labelsM58E j d hq
   have hp (k : ℕ) (hk : 2 ≤ k) (hu : k ≤ j+2*d+2) :
     InPolygon (frame (lowerPathM58E j d)).mid.a
       (frame (lowerPathM58E j d)).mid.b k j := by
     rw [ha,hb,lower_polygonM58E]
     exact ⟨hk,hu⟩
   have h := hs (lowerPathM58E j d) j d i ha hb
     (hp i (by omega) (by omega)) (hp (i+1) (by omega) (by omega))
     (hp (i+2) (by omega) (by omega))
   simpa only [source_two_lower_formulaM58E _ j d _ ha hb] using h
 · intro hb path j d i ha hl _ _ _
   obtain ⟨q,hq,hq',_⟩ := source_two_squares3556 path ha
   have h : 1 ≤ j+d := by omega
   simpa only [source_two_lower_formulaM58E path j d _ ha hl] using hb j d i h

theorem root_implies_lowerM58E (h : Conjecture63) : LowerBinomialLCM58E := by
 apply lower_source_iffM58E.mp
 intro path j d i _ _ h0 h1 h2
 exact (h.2.2 path).1 i j h0 h1 h2

end
end MathGKM.Markov
