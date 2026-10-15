import MarkovBooleanCyclicADB2
/-! Machine-authored 897eabb3. Four-letter scans with explicit cyclic boundary
states. This is generic word algebra, not a log-concavity assertion. -/
namespace MathGKM.Markov
noncomputable section
variable {R : Type*} [CommRing R]
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def fourScan897 (f : Bool → Bool → Bool → Bool → R) (p q r : Bool) : List Bool → R
 | [] => 0
 | s::ss => f p q r s+fourScan897 f q r s ss
def fourCyclic897 (f : Bool → Bool → Bool → Bool → R) (w : List Bool) : R :=
 fourScan897 f false (endPairADB2 false false w).1 (endPairADB2 false false w).2 w

theorem four_reset897 (f : Bool → Bool → Bool → Bool → R)
 (hf : ∀ p q r, f p q r false=0) (p p' q r : Bool) (n : ℕ) (w : List Bool) :
 fourScan897 f p q r (lowerSub487 n w)=fourScan897 f p' q r (lowerSub487 n w) := by
 cases w <;> simp [lowerSub487,lowerRun487,fourScan897,hf]

theorem four_replicate897 (f : Bool → Bool → Bool → Bool → R) (n : ℕ) (w : List Bool) :
 fourScan897 f true true true (List.replicate n true++w)=
 (n:R)*f true true true true+fourScan897 f true true true w := by
 induction n with
 | zero => simp
 | succ n ih => simp [List.replicate_succ,fourScan897,ih,Nat.cast_add]; ring

def lowerFourZero897 (f : Bool → Bool → Bool → Bool → R) (p q r : Bool) : R :=
 if r then f (if q then false else p) q false true else 0

theorem four_lower_zero897 (f : Bool → Bool → Bool → Bool → R)
 (hf : ∀ p q r, f p q r false=0) (p q : Bool) (w : List Bool) :
 fourScan897 f false (if q then false else p) q (lowerSub487 0 w)=
 tripleScanADB2 (lowerFourZero897 f) p q w := by
 induction w generalizing p q with
 | nil => simp [fourScan897,tripleScanADB2,lowerSub487]
 | cons r rs ih =>
   change fourScan897 f false (if q then false else p) q
     (lowerRun487 (0+if r then 1 else 0)++lowerSub487 0 rs)=_
   cases p <;> cases q <;> cases r <;>
     simp [lowerRun487,fourScan897,hf,tripleScanADB2,lowerFourZero897,
       four_reset897 f hf true false,ih] <;>
       first | exact ih false false | exact ih false true | exact ih true false | exact ih true true

def lowerFourOne897 (f : Bool → Bool → Bool → Bool → R) (_p q r : Bool) : R :=
 f q true false true+(if r then f true false true true else 0)

theorem four_lower_one897 (f : Bool → Bool → Bool → Bool → R)
 (hf : ∀ p q r, f p q r false=0) (p q : Bool) (w : List Bool) :
 fourScan897 f false q true (lowerSub487 1 w)=
 tripleScanADB2 (lowerFourOne897 f) p q w := by
 induction w generalizing p q with
 | nil => simp [fourScan897,tripleScanADB2,lowerSub487]
 | cons r rs ih =>
   change fourScan897 f false q true
     (lowerRun487 (1+if r then 1 else 0)++lowerSub487 1 rs)=_
   cases q <;> cases r <;>
     simp [lowerRun487,List.replicate_succ,fourScan897,hf,tripleScanADB2,
       lowerFourOne897,four_reset897 f hf true false,ih,add_assoc] <;>
       first | exact ih false false | exact ih false true | exact ih true false | exact ih true true

def lowerFourMany897 (f : Bool → Bool → Bool → Bool → R) (n : ℕ) (r : Bool) : R :=
 f true true false true+f true false true true+f false true true true+
 ((n:R)+if r then 1 else 0)*f true true true true

theorem four_lower_two897 (f : Bool → Bool → Bool → Bool → R)
 (hf : ∀ p q r, f p q r false=0) (w : List Bool) :
 fourScan897 f false true true (lowerSub487 2 w)=
 (w.length:R)*(f true true false true+f true false true true)+
 (w.count true:R)*f false true true true := by
 induction w with
 | nil => simp [lowerSub487,fourScan897]
 | cons r rs ih =>
   change fourScan897 f false true true
     (lowerRun487 (2+if r then 1 else 0)++lowerSub487 2 rs)=_
   cases r <;>
     simp [lowerRun487,List.replicate_succ,fourScan897,hf,
       four_reset897 f hf true false,ih,List.count_cons,Nat.cast_add] <;> ring

theorem four_lower_many897 (f : Bool → Bool → Bool → Bool → R)
 (hf : ∀ p q r, f p q r false=0) (n : ℕ) (w : List Bool) :
 fourScan897 f false true true (lowerSub487 (n+3) w)=
 (w.length:R)*(f true true false true+f true false true true+f false true true true+
   (n:R)*f true true true true)+(w.count true:R)*f true true true true := by
 induction w with
 | nil => simp [lowerSub487,fourScan897]
 | cons r rs ih =>
   change fourScan897 f false true true
     (lowerRun487 (n+3+if r then 1 else 0)++lowerSub487 (n+3) rs)=_
   have hn : n+3=3+n := by omega
   rw [hn] at ih
   cases r <;>
     simp [lowerRun487,hn,List.replicate_add,List.replicate_succ,
       fourScan897,hf,four_replicate897,four_reset897 f hf true false,ih,
       List.count_cons,Nat.cast_add] <;> ring

theorem endPair_concat897 (p q : Bool) (w v : List Bool) :
 endPairADB2 p q (w++v)=endPairADB2 (endPairADB2 p q w).1
   (endPairADB2 p q w).2 v := by
 induction w generalizing p q with
 | nil => rfl
 | cons r rs ih => exact ih q r

theorem endPair_true897 (p q : Bool) (n : ℕ) :
 endPairADB2 p q (List.replicate (n+2) true)=(true,true) := by
 induction n generalizing p q with
 | zero => rfl
 | succ n ih => simpa [List.replicate_succ,endPairADB2] using ih q true

theorem endPair_source_lower897 (n : ℕ) (path : List Bool) :
 endPairADB2 false false (lowerSub487 n (sourceWord28 path))=(decide (0<n),true) := by
 rw [sourceWord_central28]
 change endPairADB2 false false (lowerSub487 n ((false::central28 path)++[true]))=_
 simp only [lowerSub487,List.flatMap_append,List.flatMap_cons,List.flatMap_nil,
   List.append_nil,ite_true,Nat.add_zero]
 rw [endPair_concat897]
 cases n with
 | zero => rfl
 | succ n => simp [lowerRun487,endPairADB2,endPair_true897,show n+1+1=n+2 by omega]

theorem triple_append_zero897 (g : Bool → Bool → Bool → R)
 (hg : ∀ p q,g p q false=0) (p q : Bool) (w : List Bool) :
 tripleScanADB2 g p q (w++[false])=tripleScanADB2 g p q w := by
 induction w generalizing p q with
 | nil => simp [tripleScanADB2,hg]
 | cons r rs ih => simp [tripleScanADB2,ih]

theorem source_triple_zero897 (g : Bool → Bool → Bool → R)
 (hg : ∀ p q,g p q false=0) (path : List Bool) :
 tripleScanADB2 g false true (sourceWord28 path)=
 boolMomentADB2 g (frame path).mid.b (frame path).mid.a
   (2*(frame path).mid.a-(frame path).mid.b:ℕ)
   (min ((frame path).mid.b-(frame path).mid.a)
     (3*(frame path).mid.a-(frame path).mid.b):ℕ)
   (3*(frame path).mid.a-2*(frame path).mid.b:ℕ) := by
 rw [sourceWord_central28]
 simp only [tripleScanADB2,hg,zero_add]
 rw [←triple_append_zero897 g hg true false (central28 path++[true])]
 simpa [List.append_assoc] using source_tripleScanADB2 g path

end
end MathGKM.Markov
