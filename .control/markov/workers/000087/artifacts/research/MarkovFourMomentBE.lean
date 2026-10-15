import MarkovFourthMoment897
/-! Machine-authored be5676f9. Exact averaging of an arbitrary four-letter
observable. Canonicalization is a coboundary, not a fitted identity. -/
namespace MathGKM.Markov
noncomputable section
variable {R : Type*} [CommRing R]
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def fourPotentialBE (f : Bool → Bool → Bool → Bool → R) (p q r : Bool) : R :=
 f p q r false+f q r false false+f r false false false
def fourCanonicalBE (f : Bool → Bool → Bool → Bool → R) (p q r s : Bool) : R :=
 f p q r s-fourPotentialBE f p q r+fourPotentialBE f q r s
def fourTripleBE (f : Bool → Bool → Bool → Bool → R) (q r s : Bool) : R :=
 fourCanonicalBE f false q r s-f false false false false
def fourQuadBE (f : Bool → Bool → Bool → Bool → R) (p q r s : Bool) : R :=
 fourCanonicalBE f p q r s-fourCanonicalBE f false q r s

theorem four_canonical_lastBE (f : Bool → Bool → Bool → Bool → R) (p q r : Bool) :
 fourCanonicalBE f p q r false=f false false false false := by
 simp only [fourCanonicalBE,fourPotentialBE]; ring

theorem four_coboundary_scanBE (f : Bool → Bool → Bool → Bool → R)
 (p q r : Bool) (w : List Bool) :
 fourScan897 f p q r w=fourScan897 (fourCanonicalBE f) p q r w+
 fourPotentialBE f p q r-
 fourPotentialBE f (endTriple897 p q r w).1 (endTriple897 p q r w).2.1
   (endTriple897 p q r w).2.2 := by
 induction w generalizing p q r with
 | nil => simp [fourScan897,endTriple897]
 | cons s ss ih => simp only [fourScan897,endTriple897,ih,fourCanonicalBE]; ring

theorem four_canonical_splitBE (f : Bool → Bool → Bool → Bool → R) (p q r s : Bool) :
 fourCanonicalBE f p q r s=f false false false false+fourTripleBE f q r s+
 fourQuadBE f p q r s := by
 simp only [fourTripleBE,fourQuadBE]; ring

theorem four_canonical_scanBE (f : Bool → Bool → Bool → Bool → R)
 (p q r : Bool) (w : List Bool) :
 fourScan897 (fourCanonicalBE f) p q r w=
 (w.length:R)*f false false false false+tripleScanADB2 (fourTripleBE f) q r w+
 fourScan897 (fourQuadBE f) p q r w := by
 induction w generalizing p q r with
 | nil => simp [fourScan897,tripleScanADB2]
 | cons s ss ih =>
   simp only [fourScan897,ih,four_canonical_splitBE,tripleScanADB2,List.length_cons,
     Nat.cast_add,Nat.cast_one]
   ring

def fourMomentBE (f : Bool → Bool → Bool → Bool → R) (c r : ℕ) : R :=
 (c:R)*f false false false false+
 boolMomentADB2 (fourTripleBE f) c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)+fourSourceMoment897 (fourQuadBE f) c r

theorem source_four_canonical_momentBE (f : Bool → Bool → Bool → Bool → R)
 (path : List Bool) :
 fourCyclic897 (fourCanonicalBE f) (sourceWord28 path)=
 fourMomentBE f (frame path).mid.b (frame path).mid.a := by
 unfold fourCyclic897
 rw [four_canonical_scanBE,(source_word_counts28 path).2]
 have he : (endPairADB2 false false (sourceWord28 path)).2=true := by
   rw [sourceWord_central28]
   simpa only [List.cons_append] using endPair_last897 false false (false::central28 path)
 have hg : ∀ p q,fourTripleBE f p q false=0 := by
   intros; simp [fourTripleBE,four_canonical_lastBE]
 have ht : tripleScanADB2 (fourTripleBE f)
     (endPairADB2 false false (sourceWord28 path)).1
     (endPairADB2 false false (sourceWord28 path)).2 (sourceWord28 path)=
     tripleScanADB2 (fourTripleBE f) false true (sourceWord28 path) := by
   rw [he,sourceWord_central28]
   simp [tripleScanADB2,hg]
 rw [ht,source_triple_zero897 _ hg]
 have hq := source_four_moment897 (fourQuadBE f)
   (by intros; simp [fourQuadBE,four_canonical_lastBE])
   (by intros; simp [fourQuadBE]) path
 exact congrArg (fun z => ((frame path).mid.b:R)*f false false false false+
   boolMomentADB2 (fourTripleBE f) (frame path).mid.b (frame path).mid.a
     (2*(frame path).mid.a-(frame path).mid.b:ℕ)
     (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ)
     (3*(frame path).mid.a-2*(frame path).mid.b:ℕ)+z) hq

theorem source_four_rotatedBE (f : Bool → Bool → Bool → Bool → R)
 (r s t : Bool) (w : List Bool) (path : List Bool)
 (hw : sourceWord28 path=false::r::s::(w++[t,true])) :
 fourScan897 f false r s (w++[t,true,false,r,s])=
 fourMomentBE f (frame path).mid.b (frame path).mid.a := by
 rw [four_coboundary_scanBE]
 have he : endTriple897 false r s (w++[t,true,false,r,s])=(false,r,s) := by
   simpa only [List.append_assoc,List.cons_append,List.singleton_append,List.nil_append] using
     endTriple_append897 false r s false r s (w++[t,true])
 rw [he]
 simp only [add_sub_cancel_right]
 rw [four_rotate897 _ (f false false false false) (four_canonical_lastBE f),←hw]
 exact source_four_canonical_momentBE f path

end
end MathGKM.Markov
