import MarkovMomentSums6905
import MarkovCyclicPatterns6905
/-! Machine-authored live request adb2c7b0. Direct local-moment telescoping.
No trace or source coefficient identity is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
variable {R : Type*} [CommRing R]

def potentialLADB2 (y : R) (p q : Bool) : R :=
 bit6905 p*(12*y-12*y^2+4*y^3)+
 bit6905 q*(2+30*y-30*y^2-6*y^3)+
 bit6905 p*bit6905 q*(-120*y^3-96*y^4)

theorem localL_coboundaryADB2 (y : R) (p q r : Bool) :
 localL6905 y p q r = (2-12*y+6*y^2)+
 bit6905 r*(2+30*y-30*y^2+6*y^3)+
 bit6905 q*bit6905 r*(-144*y^3-96*y^4)+
 bit6905 p*(1-bit6905 q)*bit6905 r*(24*y^4)+
 bit6905 p*bit6905 q*bit6905 r*(24*y^5)+
 potentialLADB2 y p q-potentialLADB2 y q r := by
 rw [localL_expand6905]
 unfold potentialLADB2
 ring

def localLScanADB2 (y : R) (p q : Bool) : List Bool → R
 | [] => 0
 | r::rs => localL6905 y p q r+localLScanADB2 y q r rs
def endPairADB2 (p q : Bool) : List Bool → Bool × Bool
 | [] => (p,q)
 | r::rs => endPairADB2 q r rs

theorem localL_scanADB2 (y : R) (p q : Bool) (w : List Bool) :
 localLScanADB2 y p q w = (w.length:R)*(2-12*y+6*y^2)+
 (w.count true:R)*(2+30*y-30*y^2+6*y^3)+
 (bbScan446 q w:R)*(-144*y^3-96*y^4)+
 (separatedScan5 p q w:R)*(24*y^4)+
 (tripleOneScan5 p q w:R)*(24*y^5)+
 potentialLADB2 y p q-
 potentialLADB2 y (endPairADB2 p q w).1 (endPairADB2 p q w).2 := by
 induction w generalizing p q with
 | nil => simp [localLScanADB2,bbScan446,separatedScan5,tripleOneScan5,endPairADB2]
 | cons r rs ih =>
   simp only [localLScanADB2,localL_coboundaryADB2,ih,endPairADB2]
   cases p <;> cases q <;> cases r <;>
     simp [List.count_cons,bbScan446,separatedScan5,tripleOneScan5,bit6905,
       Nat.cast_add,Nat.cast_one] <;> ring

theorem endPair_appendADB2 (p q a b : Bool) (w : List Bool) :
 endPairADB2 p q (w++[a,b])=(a,b) := by
 induction w generalizing p q with
 | nil => rfl
 | cons r rs ih => exact ih q r

theorem triple_append_falseADB2 (p q : Bool) (w : List Bool) :
 tripleOneScan5 p q (w++[false])=tripleOneScan5 p q w := by
 induction w generalizing p q with
 | nil => simp [tripleOneScan5]
 | cons r rs ih => simp [tripleOneScan5,ih]

theorem separated_append_falseADB2 (p q : Bool) (w : List Bool) :
 separatedScan5 p q (w++[false])=separatedScan5 p q w := by
 induction w generalizing p q with
 | nil => simp [separatedScan5]
 | cons r rs ih => simp [separatedScan5,ih]

theorem bb_append_falseADB2 (q : Bool) (w : List Bool) :
 bbScan446 q (w++[false])=bbScan446 q w := by
 induction w generalizing q with
 | nil => simp [bbScan446]
 | cons r rs ih => simp [bbScan446,ih]

theorem source_localLADB2 (y : R) (path : List Bool) :
 localLScanADB2 y true false (central28 path++[true,false])=
 momentL6905 y ((frame path).mid.b:R) ((frame path).mid.a:R)
   ((2*(frame path).mid.a-(frame path).mid.b:ℕ):R)
   ((min ((frame path).mid.b-(frame path).mid.a)
     (3*(frame path).mid.a-(frame path).mid.b):ℕ):R)
   ((3*(frame path).mid.a-2*(frame path).mid.b:ℕ):R) := by
 have hc := source_word_counts28 path
 have hb := source_bb_count446 path
 have ht := source_separated5 path
 have hu := source_tripleOne5 path
 rw [sourceWord_central28] at hc hb ht hu
 have hlen : (central28 path++[true,false]).length=(frame path).mid.b := by
   simpa using hc.2
 have hcount : (central28 path++[true,false]).count true=(frame path).mid.a := by
   simpa using hc.1
 have hbb : bbScan446 false (central28 path++[true,false])=
     2*(frame path).mid.a-(frame path).mid.b := by
   rw [show central28 path++[true,false]=(central28 path++[true])++[false] by simp]
   simpa [bbCount446,bbScan446] using (bb_append_falseADB2 false
     (central28 path++[true])).trans (by simpa [bbCount446,bbScan446] using hb)
 have hsep : separatedScan5 true false (central28 path++[true,false])=
     min ((frame path).mid.b-(frame path).mid.a)
       (3*(frame path).mid.a-(frame path).mid.b) := by
   rw [show central28 path++[true,false]=(central28 path++[true])++[false] by simp,
     separated_append_falseADB2]
   simpa [separated5,separatedScan5] using ht
 have htri : tripleOneScan5 true false (central28 path++[true,false])=
     3*(frame path).mid.a-2*(frame path).mid.b := by
   rw [show central28 path++[true,false]=(central28 path++[true])++[false] by simp,
     triple_append_falseADB2,triple_false5]
   simpa [tripleOne5,tripleOneScan5] using hu
 rw [localL_scanADB2,endPair_appendADB2,hlen,hcount,hbb,hsep,htri]
 simp only [momentL6905]
 ring

#print axioms localL_scanADB2
#print axioms source_localLADB2
end
end MathGKM.Markov
