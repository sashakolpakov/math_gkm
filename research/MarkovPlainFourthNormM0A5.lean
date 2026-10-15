import MarkovPlainFourthM0A5
import MarkovFirstNormM0A5
import MarkovSecondNormAllM0A5
import MarkovFourthBinomialBC
/-! Machine-authored 0a5fcabe. Common numerator for all predecessor cycle lengths. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
attribute [local irreducible] plainFourthM0A5 plainSecondM0A5 fourthNumeratorBC
  firstRunPolyADB2 secondCompressed446 fourMomentBE boolMomentADB2

def plainFourthClosedM0A5 (n c r : ℕ) : RunFieldBDEE :=
 let F := closedFirstBDEE n c r
 let S := closedSecondBDEE n c r-if c=2 then 2*runXBDEE^(2*n+3) else 0
 fourMomentBE (closedLocalFourN6604 n) c r+6*(1+runXBDEE)^4+
 4*F*boolMomentADB2 (closedLocalBDEE n) c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)-8*F*(1+runXBDEE)^3+3*S^2-2*F^4

theorem map_plain_secondM0A5 (n c r : ℕ) :
 runEmbedBDEE (plainSecondM0A5 n c r)=
 closedSecondBDEE n c r-if c=2 then 2*runXBDEE^(2*n+3) else 0 := by
 unfold plainSecondM0A5
 split_ifs <;> simp only [map_sub,map_mul,map_ofNat,map_pow,map_zero,map_secondBDEE,runXBDEE]

theorem map_plain_fourthM0A5 (n c r : ℕ) :
 runEmbedBDEE (plainFourthM0A5 n c r)=plainFourthClosedM0A5 n c r := by
 have hm : (fun a b d e => runEmbedBDEE (runLocalFourBE n a b d e))=
   closedLocalFourN6604 n := by funext a b d e; exact map_local_fourN6604 n a b d e
 unfold plainFourthM0A5 plainFourthClosedM0A5
 dsimp only
 simp only [map_add,map_sub,map_mul,map_pow,
   map_ofNat,map_one,map_firstBDEE,map_plain_secondM0A5,map_bool_momentBDEE,
   map_natCast,map_localBDEE,map_four_momentN6604,hm,runXBDEE]

theorem plain_fourth_normalizeM0A5 (n c r : ℕ) :
 (1-runXBDEE)^8*plainFourthClosedM0A5 n c r=
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
 have hf := first_normalizeM0A5 n c r
 have hs := second_normalize_allM0A5 n c r
 unfold plainFourthClosedM0A5
 dsimp only
 calc
  _ = (1-runXBDEE)^8*fourMomentBE (closedLocalFourN6604 n) c r+
    6*(1+runXBDEE)^4*(1-runXBDEE)^8+
    4*((1-runXBDEE)^2*closedFirstBDEE n c r)*
      ((1-runXBDEE)^6*boolMomentADB2 (closedLocalBDEE n) c r (2*r-c:ℕ)
        (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ))-
    8*((1-runXBDEE)^2*closedFirstBDEE n c r)*(1+runXBDEE)^3*(1-runXBDEE)^6+
    3*((1-runXBDEE)^4*(closedSecondBDEE n c r-if c=2 then 2*runXBDEE^(2*n+3) else 0))^2-
    2*((1-runXBDEE)^2*closedFirstBDEE n c r)^4 := by ring
  _ = _ := by rw [hm4,hm3,hf,hs]; unfold fourthNumeratorBC; rfl

theorem plain_fourth_clearedM0A5 (n c r : ℕ) :
 (1-X)^8*plainFourthM0A5 n c r=
 fourthNumeratorBC (n:ℤ[X]) (X^n) X c r := by
 apply run_embed_injectiveBDEE
 rw [map_mul,map_pow,map_sub,map_one,map_plain_fourthM0A5]
 simpa only [fourthNumerator_mapBC,map_natCast,map_pow,runXBDEE] using
   plain_fourth_normalizeM0A5 n c r
end
end MathGKM.Markov
