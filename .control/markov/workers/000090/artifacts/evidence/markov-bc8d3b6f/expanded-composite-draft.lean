import MarkovFirstNormBC
import MarkovSecondNormBC
import MarkovMomentScaleBC
import MarkovBinomialExtractBC
import MarkovThirdNorm000BC
import MarkovThirdNorm001BC
import MarkovThirdNorm010BC
import MarkovThirdNorm011BC
import MarkovThirdNorm100BC
import MarkovThirdNorm101BC
import MarkovThirdNorm110BC
import MarkovThirdNorm111BC
import MarkovFourthNorm0000BC
import MarkovFourthNorm0001BC
import MarkovFourthNorm0010BC
import MarkovFourthNorm0011BC
import MarkovFourthNorm0100BC
import MarkovFourthNorm0101BC
import MarkovFourthNorm0110BC
import MarkovFourthNorm0111BC
import MarkovFourthNorm1000BC
import MarkovFourthNorm1001BC
import MarkovFourthNorm1010BC
import MarkovFourthNorm1011BC
import MarkovFourthNorm1100BC
import MarkovFourthNorm1101BC
import MarkovFourthNorm1110BC
import MarkovFourthNorm1111BC
/-! Machine-authored bc8d3b6f. Exact normalization candidates; validated separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def localThirdNumBC {A : Type*} [CommRing A] (N Z x : A) (p q r : Bool) : A :=
 match p,q,r with
 | false,false,false => localThirdNum000BC N Z x
 | false,false,true => localThirdNum001BC N Z x
 | false,true,false => localThirdNum010BC N Z x
 | false,true,true => localThirdNum011BC N Z x
 | true,false,false => localThirdNum100BC N Z x
 | true,false,true => localThirdNum101BC N Z x
 | true,true,false => localThirdNum110BC N Z x
 | true,true,true => localThirdNum111BC N Z x
theorem localThird_normalizeBC (n : ℕ) (p q r : Bool) :
 (1-runXBDEE)^6*closedLocalBDEE n p q r=
 localThirdNumBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q r := by
 cases p <;> cases q <;> cases r
 · exact localThird_normalize_000BC n
 · exact localThird_normalize_001BC n
 · exact localThird_normalize_010BC n
 · exact localThird_normalize_011BC n
 · exact localThird_normalize_100BC n
 · exact localThird_normalize_101BC n
 · exact localThird_normalize_110BC n
 · exact localThird_normalize_111BC n
theorem localThirdNum_mapBC {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q r : Bool) :
 g (localThirdNumBC N Z x p q r)=
 localThirdNumBC (g N) (g Z) (g x) p q r := by
 cases p <;> cases q <;> cases r <;>
 simp only [localThirdNumBC,localThirdNum000BC,localThirdNum001BC,localThirdNum010BC,localThirdNum011BC,localThirdNum100BC,localThirdNum101BC,localThirdNum110BC,localThirdNum111BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

def localFourNumBC {A : Type*} [CommRing A] (N Z x : A) (p q r s : Bool) : A :=
 match p,q,r,s with
 | false,false,false,false => localFourNum0000BC N Z x
 | false,false,false,true => localFourNum0001BC N Z x
 | false,false,true,false => localFourNum0010BC N Z x
 | false,false,true,true => localFourNum0011BC N Z x
 | false,true,false,false => localFourNum0100BC N Z x
 | false,true,false,true => localFourNum0101BC N Z x
 | false,true,true,false => localFourNum0110BC N Z x
 | false,true,true,true => localFourNum0111BC N Z x
 | true,false,false,false => localFourNum1000BC N Z x
 | true,false,false,true => localFourNum1001BC N Z x
 | true,false,true,false => localFourNum1010BC N Z x
 | true,false,true,true => localFourNum1011BC N Z x
 | true,true,false,false => localFourNum1100BC N Z x
 | true,true,false,true => localFourNum1101BC N Z x
 | true,true,true,false => localFourNum1110BC N Z x
 | true,true,true,true => localFourNum1111BC N Z x
theorem localFour_normalizeBC (n : ℕ) (p q r s : Bool) :
 (1-runXBDEE)^8*closedLocalFourN6604 n p q r s=
 localFourNumBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q r s := by
 cases p <;> cases q <;> cases r <;> cases s
 · exact localFour_normalize_0000BC n
 · exact localFour_normalize_0001BC n
 · exact localFour_normalize_0010BC n
 · exact localFour_normalize_0011BC n
 · exact localFour_normalize_0100BC n
 · exact localFour_normalize_0101BC n
 · exact localFour_normalize_0110BC n
 · exact localFour_normalize_0111BC n
 · exact localFour_normalize_1000BC n
 · exact localFour_normalize_1001BC n
 · exact localFour_normalize_1010BC n
 · exact localFour_normalize_1011BC n
 · exact localFour_normalize_1100BC n
 · exact localFour_normalize_1101BC n
 · exact localFour_normalize_1110BC n
 · exact localFour_normalize_1111BC n
theorem localFourNum_mapBC {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q r s : Bool) :
 g (localFourNumBC N Z x p q r s)=
 localFourNumBC (g N) (g Z) (g x) p q r s := by
 cases p <;> cases q <;> cases r <;> cases s <;>
 simp only [localFourNumBC,localFourNum0000BC,localFourNum0001BC,localFourNum0010BC,localFourNum0011BC,localFourNum0100BC,localFourNum0101BC,localFourNum0110BC,localFourNum0111BC,localFourNum1000BC,localFourNum1001BC,localFourNum1010BC,localFourNum1011BC,localFourNum1100BC,localFourNum1101BC,localFourNum1110BC,localFourNum1111BC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]

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
 simp only [map_mul,map_pow,map_sub,map_one,fourthNumerator_mapBC,map_natCast]
 rw [source_fourth_closedN6604 n rest hc]
 exact fourth_normalizeBC n (frame rest).mid.b (frame rest).mid.a hc

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
