import MathGKM.MarkovIndices
/-! Machine-authored 9fc35bc5. The boundary a=3*(b mod a) is impossible for a>=7. -/
namespace MathGKM.Markov

theorem third_remainder_neM9FC (a b : ℕ) (ha : 7 ≤ a) (hc : Nat.Coprime a b) :
 a ≠ 3*(b % a) := by
 intro h
 have hd : b%a ∣ a := ⟨3, by omega⟩
 have he : b%a ∣ b := by
   have hx : b%a ∣ a*(b/a)+b%a := dvd_add (dvd_mul_of_dvd_left hd _) (dvd_refl _)
   simpa only [Nat.div_add_mod] using hx
 have hone := Nat.eq_one_of_dvd_coprimes hc hd he
 omega

theorem third_remainder_strictM9FC (path : List Bool)
 (ha : 7 ≤ (frame path).mid.a)
 (hr : (frame path).mid.a ≤ 3*((frame path).mid.b % (frame path).mid.a)) :
 (frame path).mid.a < 3*((frame path).mid.b % (frame path).mid.a) := by
 have hn := third_remainder_neM9FC _ _ ha (frame_reduced path).2.2
 omega

end MathGKM.Markov
