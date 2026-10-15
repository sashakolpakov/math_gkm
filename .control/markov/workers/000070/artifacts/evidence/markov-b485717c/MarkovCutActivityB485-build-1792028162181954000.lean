import MarkovPolarizationBridge340
/-! Machine-authored b485717c. Site activities multiply selected cuts only.+Uniform activity one recovers every original cut with its multiplicity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def activityCoeffB485 {R : Type*} [CommRing R] (y p q : R) :
    List (Bool × R) → ℕ → R
 | [], 0 => q
 | [], _+1 => 0
 | (r,t)::rs, 0 => activityCoeffB485 y (cutChargeA27 y p q r) q rs 0
 | (r,t)::rs, s+1 => activityCoeffB485 y (cutChargeA27 y p q r) q rs (s+1) +
     t*cutFactorA27 y r*(p+q)*activityCoeffB485 y y 1 rs s

theorem activity_uniformB485 {R : Type*} [CommRing R] (y p q : R)
 (w : List Bool) (s : ℕ) :
 activityCoeffB485 y p q (w.map (fun r => (r,1))) s=cutCoeffA27 y p q w s := by
 induction w generalizing p q s with
 | nil => cases s <;> rfl
 | cons r rs ih => cases s <;> simp [activityCoeffB485,cutCoeffA27,ih]

theorem activity_polynomialB485 {R : Type*} [CommRing R] (y p q : R)
 (w : List (Bool × R)) (s : ℕ) :
 (siteEval340 (C y) (C p) (C q)
   (w.map (fun rt => (rt.1,(X : R[X])*C rt.2)))).coeff s =
 activityCoeffB485 y p q w s := by
 induction w generalizing p q s with
 | nil => cases s <;> simp [siteEval340,activityCoeffB485]
 | cons rt rs ih =>
   rcases rt with ⟨r,t⟩
   have hc : cutChargeA27 (C y) (C p) (C q) r=C (cutChargeA27 y p q r) := by
     cases r <;> simp [cutChargeA27,map_mul,map_add,map_ofNat]
   have hf : cutFactorA27 (C y) r=C (cutFactorA27 y r) := by
     cases r <;> simp [cutFactorA27]
   have he : (X*C t)*cutFactorA27 (C y) r*(C p+C q)*
       siteEval340 (C y) (C y) 1 (rs.map (fun rt => (rt.1,(X:R[X])*C rt.2))) =
       X*(C (t*cutFactorA27 y r*(p+q))*
       siteEval340 (C y) (C y) (C 1) (rs.map (fun rt => (rt.1,X*C rt.2)))) := by
     rw [hf]; simp only [map_mul,map_add,map_one]; ring
   cases s with
   | zero => simp [List.map_cons,siteEval340,hc,he,ih,activityCoeffB485]
   | succ s =>
     simp only [List.map_cons,siteEval340,hc,he,Polynomial.coeff_add,
       Polynomial.coeff_X_mul,Polynomial.coeff_C_mul,ih,activityCoeffB485]

def activityWordB485 {R : Type*} [One R] (t : R) : List (Bool × R) :=
 [(false,1),(false,t),(false,t),(false,1),(false,t),(false,t),(true,1)]

theorem activity_word_uniformB485 {R : Type*} [One R] :
 activityWordB485 (1:R) =
 ([false,false,false,false,false,false,true].map (fun r => (r,(1:R)))) := rfl

theorem activity_word_sourceB485 :
 central28 (List.replicate 6 false)++[true]=
 [false,false,false,false,false,false,true] := by decide

#print axioms activity_uniformB485
#print axioms activity_polynomialB485
#print axioms activity_word_sourceB485
end
end MathGKM.Markov
