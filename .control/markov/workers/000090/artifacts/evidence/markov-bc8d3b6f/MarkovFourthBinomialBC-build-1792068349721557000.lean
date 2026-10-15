import MarkovLocalStructuredBC
import MarkovFirstNormBC
import MarkovSecondNormBC
import MarkovMomentScaleBC
import MarkovBinomialExtractBC
/-! Machine-authored bc8d3b6f. Exact normalization candidates; validated separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fourthNumeratorBC {A : Type*} [CommRing A] (N Z x : A) (c r : ℕ) : A :=
 let F := firstNumBC N Z c r (2*r-c:ℕ) x
 let S := secondNumBC N Z c r (2*r-c:ℕ) x
 let T := boolMomentADB2 (localThirdNumBC N Z x) c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)
 fourMomentBE (localFourNumBC N Z x) c r+6*(1+x)^4*(1-x)^8+
 4*F*T-8*F*(1+x)^3*(1-x)^6+3*S^2-2*F^4

theorem fourth_normalizeBC (n c r : ℕ) (hc : 5≤c) :
 (1-runXBDEE)^8*closedFourthN6604 n c r=
 fourthNumeratorBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE c r := by
 have hm4 := fourMoment_scaleBC (closedLocalFourN6604 n) ((1-runXBDEE)^8) c r
 have he4 : (fun a b d e => (1-runXBDEE)^8*closedLocalFourN6604 n a b d e)=
     localFourNumBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
   funext a b d e; exact localFour_normalizeBC n a b d e
 rw [he4] at hm4
 have hm3 := boolMoment_scaleBC (closedLocalBDEE n) ((1-runXBDEE)^6)
   (c:RunFieldBDEE) r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)
 have he3 : (fun a b d => (1-runXBDEE)^6*closedLocalBDEE n a b d)=
     localThirdNumBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
   funext a b d; exact localThird_normalizeBC n a b d
 rw [he3] at hm3
 have hf := first_normalizeBC n c r hc
 have hs := second_normalizeBC n c r hc
 unfold closedFourthN6604 correctedClosedThirdBDEE closedThirdBDEE
 rw [if_neg (by omega : ¬c=2),if_neg (by omega : ¬c=3)]
 dsimp only
 calc
  _ = (1-runXBDEE)^8*fourMomentBE (closedLocalFourN6604 n) c r+
    6*(1+runXBDEE)^4*(1-runXBDEE)^8+
    4*((1-runXBDEE)^2*closedFirstBDEE n c r)*
      ((1-runXBDEE)^6*boolMomentADB2 (closedLocalBDEE n) c r (2*r-c:ℕ)
        (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ))-
    8*((1-runXBDEE)^2*closedFirstBDEE n c r)*(1+runXBDEE)^3*(1-runXBDEE)^6+
    3*((1-runXBDEE)^4*closedSecondBDEE n c r)^2-
    2*((1-runXBDEE)^2*closedFirstBDEE n c r)^4 := by ring
  _ = _ := by rw [hm4,hm3,hf,hs]; rfl

theorem fourthNumerator_mapBC {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (c r : ℕ) :
 g (fourthNumeratorBC N Z x c r)=fourthNumeratorBC (g N) (g Z) (g x) c r := by
 have h4 : (fun a b d e => g (localFourNumBC N Z x a b d e))=
     localFourNumBC (g N) (g Z) (g x) := by
   funext a b d e; exact localFourNum_mapBC g N Z x a b d e
 unfold fourthNumeratorBC
 simp only [map_add,map_sub,map_mul,map_pow,map_ofNat,map_one,
   fourMoment_mapBC,h4,boolMomentADB2,boolJetADB2,firstNumBC,secondNumBC]
 simp only [map_add,map_sub,map_mul,map_pow,map_ofNat,map_one,map_neg,map_natCast,
   localThirdNum_mapBC]

theorem source_fourth_clearedBC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 fourthNumeratorBC (n:ℤ[X]) (X^n) X (frame rest).mid.b (frame rest).mid.a := by
 apply run_embed_injectiveBDEE
 rw [map_mul,map_pow,map_sub,map_one,source_fourth_closedN6604 n rest hc]
 simpa only [fourthNumerator_mapBC,map_natCast,map_pow] using
   fourth_normalizeBC n (frame rest).mid.b (frame rest).mid.a hc

theorem source_fourth_binomialBC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 ∑ k ∈ Finset.range (j+1),
   (fourthNumeratorBC (n:ℤ[X]) (X^n) X (frame rest).mid.b (frame rest).mid.a).coeff k *
   ((7+(j-k)).choose 7 : ℤ) := by
 have h := coeff_of_one_sub_mul_rangeBC
   (24*cutCoeffA27 (X:ℤ[X]) X 1
     (central28 (List.replicate n true++false::rest)++[true]) 4)
   (fourthNumeratorBC (n:ℤ[X]) (X^n) X (frame rest).mid.b (frame rest).mid.a)
   7 j (source_fourth_clearedBC n rest hc)
 simpa only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs] using h

end
end MathGKM.Markov
