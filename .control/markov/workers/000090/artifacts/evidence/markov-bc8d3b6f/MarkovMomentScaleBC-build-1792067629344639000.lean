import MarkovFourthClosedN6604
/-! Machine-authored bc8d3b6f. Ring-linear moment transports. -/
namespace MathGKM.Markov
noncomputable section
variable {A B : Type*} [CommRing A] [CommRing B]

theorem boolMoment_scaleBC (f : Bool → Bool → Bool → A) (s c r q t u : A) :
 s*boolMomentADB2 f c r q t u =
 boolMomentADB2 (fun a b d => s*f a b d) c r q t u := by
 unfold boolMomentADB2 boolJetADB2
 ring

theorem fourMoment_scaleBC (f : Bool → Bool → Bool → Bool → A) (s : A) (c r : ℕ) :
 s*fourMomentBE f c r = fourMomentBE (fun a b d e => s*f a b d e) c r := by
 unfold fourMomentBE fourSourceMoment897
 split_ifs <;> unfold boolMomentADB2 boolJetADB2 fourTripleBE fourQuadBE
   fourCanonicalBE fourPotentialBE <;> ring

theorem fourMoment_mapBC (f : Bool → Bool → Bool → Bool → A) (g : A →+* B) (c r : ℕ) :
 g (fourMomentBE f c r) = fourMomentBE (fun a b d e => g (f a b d e)) c r := by
 unfold fourMomentBE fourSourceMoment897
 split_ifs <;> simp only [boolMomentADB2,boolJetADB2,fourTripleBE,fourQuadBE,
   fourCanonicalBE,fourPotentialBE,map_add,map_sub,map_mul,map_natCast]

end
end MathGKM.Markov
