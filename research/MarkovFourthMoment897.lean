import MarkovFourSource897
import MarkovFourthCyclic897
/-! Machine-authored 897eabb3. Unconditional source fourth moment,
using exact source counts rather than fitted coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
variable {R : Type*} [CommRing R]
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def fourthConstant897 (y : R) : R := -6+72*y-108*y^2+24*y^3
def fourthTriple897 (y : R) (p q r : Bool) : R :=
 (-6-144*y+384*y^2-240*y^3+6*y^4)*bit6905 r+
 (2016*y^3+2304*y^4+768*y^5-192*y^6)*bit6905 q*bit6905 r+
 (-768*y^4-384*y^5)*bit6905 p*bit6905 r+
 (768*y^4-576*y^5-960*y^6)*bit6905 p*bit6905 q*bit6905 r
def fourthQuad897 (y : R) (p q r s : Bool) : R :=
 (96*y^5)*bit6905 p*bit6905 s+
 (-96*y^5+96*y^6)*bit6905 p*bit6905 q*bit6905 s+
 (-96*y^5+96*y^6)*bit6905 p*bit6905 r*bit6905 s+
 (96*y^5-192*y^6+96*y^7)*bit6905 p*bit6905 q*bit6905 r*bit6905 s

theorem fourthCanonical_split897 (y : R) (p q r s : Bool) :
 fourthCanonical01F y p q r s=fourthConstant897 y+
 fourthTriple897 y q r s+fourthQuad897 y p q r s := by
 unfold fourthCanonical01F fourthConstant897 fourthTriple897 fourthQuad897
 ring

theorem fourthCanonical_scan897 (y : R) (p q r : Bool) (w : List Bool) :
 fourScan897 (fourthCanonical01F y) p q r w=
 (w.length:R)*fourthConstant897 y+tripleScanADB2 (fourthTriple897 y) q r w+
 fourScan897 (fourthQuad897 y) p q r w := by
 induction w generalizing p q r with
 | nil => simp [fourScan897,tripleScanADB2]
 | cons s ss ih =>
   simp only [fourScan897,ih,fourthCanonical_split897,tripleScanADB2,List.length_cons,Nat.cast_add,Nat.cast_one]
   ring

theorem endPair_last897 (p q : Bool) (w : List Bool) :
 (endPairADB2 p q (w++[true])).2=true := by
 induction w generalizing p q with
 | nil => rfl
 | cons r rs ih => exact ih q r

def fullFourthMoment897 (y : R) (c r : ℕ) : R :=
 (c:R)*fourthConstant897 y+
 boolMomentADB2 (fourthTriple897 y) c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)+
 fourSourceMoment897 (fourthQuad897 y) c r

theorem source_canonical_moment897 (y : R) (path : List Bool) :
 fourCyclic897 (fourthCanonical01F y) (sourceWord28 path)=
 fullFourthMoment897 y (frame path).mid.b (frame path).mid.a := by
 unfold fourCyclic897
 rw [fourthCanonical_scan897,(source_word_counts28 path).2]
 have he : (endPairADB2 false false (sourceWord28 path)).2=true := by
   rw [sourceWord_central28]
   simpa only [List.cons_append] using endPair_last897 false false (false::central28 path)
 have hg : ∀ p q,fourthTriple897 y p q false=0 := by intros; simp [fourthTriple897,bit6905]
 have ht : tripleScanADB2 (fourthTriple897 y)
     (endPairADB2 false false (sourceWord28 path)).1
     (endPairADB2 false false (sourceWord28 path)).2 (sourceWord28 path)=
     tripleScanADB2 (fourthTriple897 y) false true (sourceWord28 path) := by
   rw [he,sourceWord_central28]
   simp [tripleScanADB2,hg]
 rw [ht,source_triple_zero897 _ hg]
 have hq := source_four_moment897 (fourthQuad897 y)
   (by intros; simp [fourthQuad897,bit6905]) (by intros; simp [fourthQuad897,bit6905]) path
 exact congrArg (fun z => ((frame path).mid.b:R)*fourthConstant897 y+
   boolMomentADB2 (fourthTriple897 y) (frame path).mid.b (frame path).mid.a
   (2*(frame path).mid.a-(frame path).mid.b:ℕ)
   (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ)
   (3*(frame path).mid.a-2*(frame path).mid.b:ℕ)+z) hq

theorem source_fourth_moment897 (rest : List Bool) (hc : 5≤(frame rest).mid.b) :
 logFour01F (tr16 (ambientWord5c U V (sourceWord28 (false::rest))))=
 fullFourthMoment897 X (frame rest).mid.b (frame rest).mid.a := by
 rw [source_fourth_cyclic897 rest hc,source_canonical_moment897]

end
end MathGKM.Markov
