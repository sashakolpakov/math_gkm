import MarkovNewtonM295
import MarkovUniformVerticalM0D3
/-! Machine-authored request 29509309. The proposed uniform Newton sign
condition is a sufficient condition only, and remains unproved. All other
root clauses are retained in OtherVerticalCoreM0D3. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def lowerGapM295 (i x y : ℕ) : ℤ :=
 lowerValM58E (x+1) (y+1) i^2 - lowerValM58E x (y+2) i*lowerValM58E (x+2) y i

def upperGapM295 (i x y : ℕ) : ℤ :=
 upperValM2B3 (x+(i-2)+1) (y+2) i^2 -
 upperValM2B3 (x+(i-2)+2) (y+1) i*upperValM2B3 (x+(i-2)) (y+3) i

def crossOneGapM295 (i x _y : ℕ) : ℤ :=
 lowerValM58E (x+(i-1)) 0 i^2 -
 lowerValM58E (x+(i-2)) 1 i*upperValM2B3 (x+(i-2)) 1 i

def crossTwoGapM295 (i x _y : ℕ) : ℤ :=
 upperValM2B3 (x+(i-1)) 1 i^2 -
 lowerValM58E (x+i) 0 i*upperValM2B3 (x+(i-2)) 2 i

def NewtonVerticalM295 (i : ℕ) : Prop :=
 (∀ r s, 0 ≤ newtonCoeffM295 (lowerGapM295 i) r s) ∧
 (∀ r s, 0 ≤ newtonCoeffM295 (upperGapM295 i) r s) ∧
 (∀ r s, 0 ≤ newtonCoeffM295 (crossOneGapM295 i) r s) ∧
 (∀ r s, 0 ≤ newtonCoeffM295 (crossTwoGapM295 i) r s)

theorem regions_of_newtonM295 (i : ℕ) (hi : 4 ≤ i)
 (h : NewtonVerticalM295 i) : VerticalRegionsM0D3 i := by
 refine ⟨?_,?_,?_,?_⟩
 · intro j d
   exact sub_nonneg.mp (newton_nonnegM295 _ h.1 j d)
 · intro N d hN
   have hn : i-2 ≤ N := by omega
   obtain ⟨x,hx⟩ := Nat.exists_eq_add_of_le hn
   have ht := newton_nonnegM295 _ h.2.1 x d
   have he : x+(i-2)=N := by omega
   simpa only [upperGapM295,he] using sub_nonneg.mp ht
 · intro q hq
   obtain ⟨x,hx⟩ := Nat.exists_eq_add_of_le (show i-1 ≤ q by omega)
   have ht := newton_nonnegM295 _ h.2.2.1 x 0
   have h0 : x+(i-1)=q := by omega
   have h1 : x+(i-2)=q-1 := by omega
   simpa only [crossOneGapM295,h0,h1] using sub_nonneg.mp ht
 · intro q hq
   obtain ⟨x,hx⟩ := Nat.exists_eq_add_of_le hq
   have ht := newton_nonnegM295 _ h.2.2.2 x 0
   have h0 : x+i=q := by omega
   have h1 : x+(i-1)=q-1 := by omega
   have h2 : x+(i-2)=q-2 := by omega
   simpa only [crossTwoGapM295,h0,h1,h2] using sub_nonneg.mp ht

theorem root_of_uniform_newtonM295
 (hn : ∀ i : ℕ, 5 ≤ i → NewtonVerticalM295 i)
 (ho : OtherVerticalCoreM0D3) : Conjecture63 := by
 apply root_iff_uniform_verticalM0D3.mpr
 exact ⟨fun i hi => regions_of_newtonM295 i (by omega) (hn i hi),ho⟩

end
end MathGKM.Markov
