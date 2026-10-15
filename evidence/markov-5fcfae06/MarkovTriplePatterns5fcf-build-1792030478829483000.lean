import MarkovAdjacency446
/-! Machine-authored request 5fcfae06. Literal three-letter scans.
On a word starting A and ending B, these are the cyclic 111 and 101 counts.
No log-concavity or source coefficient formula is assumed. -/
namespace MathGKM.Markov
noncomputable section
set_option linter.unusedSimpArgs false

def tripleOneScan5 (p q : Bool) : List Bool → ℕ
 | [] => 0
 | r::rs => (if p && q && r then 1 else 0)+tripleOneScan5 q r rs
def tripleOne5 (w : List Bool) := tripleOneScan5 false false w
def separatedScan5 (p q : Bool) : List Bool → ℕ
 | [] => 0
 | r::rs => (if p && !q && r then 1 else 0)+separatedScan5 q r rs
def separated5 (w : List Bool) := separatedScan5 false true w

theorem triple_false5 (p : Bool) (w : List Bool) :
 tripleOneScan5 p false w=tripleOneScan5 false false w := by
 cases w <;> simp [tripleOneScan5]

theorem triple_reset5 (p q : Bool) (n : ℕ) (w : List Bool) :
 tripleOneScan5 p q (lowerSub487 n w)=tripleOneScan5 false false (lowerSub487 n w) := by
 cases w with
 | nil => rfl
 | cons r rs =>
   simp only [lowerSub487,List.flatMap_cons,lowerRun487,List.cons_append,tripleOneScan5]
   cases p <;> cases q <;> cases n <;> cases r <;>
     simp [List.replicate_succ,tripleOneScan5,triple_false5]

theorem triple_replicate5 (n : ℕ) (w : List Bool) :
 tripleOneScan5 true true (List.replicate n true++w)=n+tripleOneScan5 true true w := by
 induction n with
 | zero => simp
 | succ n ih => simp [List.replicate_succ,tripleOneScan5,ih]; omega

theorem triple_lower_small5 (n : ℕ) (hn : n≤1) (w : List Bool) :
 tripleOne5 (lowerSub487 n w)=0 := by
 induction w with
 | nil => rfl
 | cons r rs ih =>
   change tripleOneScan5 false false (lowerRun487 (n+if r then 1 else 0)++
     lowerSub487 n rs)=0
   change tripleOneScan5 false false (lowerSub487 n rs)=0 at ih
   interval_cases n <;> cases r <;>
     simpa [lowerRun487,List.replicate_succ,tripleOneScan5,triple_reset5] using ih

theorem triple_lower_large5 (n : ℕ) (w : List Bool) :
 tripleOne5 (lowerSub487 (n+2) w)=w.length*n+w.count true := by
 induction w with
 | nil => simp [tripleOne5,lowerSub487,tripleOneScan5]
 | cons r rs ih =>
   change tripleOneScan5 false false (lowerRun487 (n+2+if r then 1 else 0)++
     lowerSub487 (n+2) rs)=_
   change tripleOneScan5 false false (lowerSub487 (n+2) rs)=_ at ih
   cases r <;>
     simp [lowerRun487,List.replicate_succ,tripleOneScan5,triple_replicate5,
       triple_reset5,ih,Nat.add_mul] <;> omega

theorem separated_replicate5 (p : Bool) (n : ℕ) (w : List Bool) :
 separatedScan5 p true (List.replicate n true++w)=
 separatedScan5 (if n=0 then p else true) true w := by
 induction n generalizing p with
 | zero => simp
 | succ n ih => simp [List.replicate_succ,separatedScan5,ih]

theorem separated_reset5 (p : Bool) (n : ℕ) (w : List Bool) :
 separatedScan5 p true (lowerSub487 n w)=separatedScan5 false true (lowerSub487 n w) := by
 cases w with
 | nil => rfl
 | cons r rs => simp [lowerSub487,lowerRun487,separatedScan5]

theorem separated_lower_positive5 (n : ℕ) (w : List Bool) :
 separated5 (lowerSub487 (n+1) w)=w.length := by
 induction w with
 | nil => rfl
 | cons r rs ih =>
   change separatedScan5 false true (lowerRun487 (n+1+if r then 1 else 0)++
     lowerSub487 (n+1) rs)=_
   change separatedScan5 false true (lowerSub487 (n+1) rs)=_ at ih
   cases r <;>
     simp [lowerRun487,List.replicate_succ,separatedScan5,separated_replicate5,
       separated_reset5,ih] <;> omega

theorem separated_lower_zero5 (p q : Bool) (w : List Bool) :
 separatedScan5 p q (lowerSub487 0 w)=bbScan446 q w := by
 induction w generalizing p q with
 | nil => rfl
 | cons r rs ih =>
   simp only [lowerSub487] at ih
   cases p <;> cases q <;> cases r <;>
     simp [lowerSub487,lowerRun487,separatedScan5,bbScan446,ih]

theorem source_tripleOne5 (path : List Bool) :
 tripleOne5 (sourceWord28 path)=3*(frame path).mid.a-2*(frame path).mid.b := by
 rcases split_first_false487 path with ⟨n,hp⟩ | ⟨n,rest,hp⟩
 · subst path
   have hw := source_pell_word446 n
   obtain ⟨ha,hb⟩ := source_word_counts28 (List.replicate n true)
   rw [hw] at ha hb ⊢
   simp at ha hb
   rw [←ha,←hb]
   cases n with
   | zero => simp [tripleOne5,tripleOneScan5]
   | succ n =>
     simp [tripleOne5,List.replicate_succ,tripleOneScan5,
       show tripleOneScan5 true true (List.replicate n true)=n by
         simpa [tripleOneScan5] using triple_replicate5 n []]
     omega
 · subst path
   rw [source_run_substitutionBF]
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hc,hl⟩ := source_word_counts28 rest
   obtain ⟨hpos,hab,_⟩ := frame_reduced rest
   rcases n with _ | _ | n
   · rw [triple_lower_small5 0 (by omega)]
     simp at ha hb ⊢; omega
   · rw [triple_lower_small5 1 (by omega)]
     simp at ha hb ⊢; omega
   · rw [triple_lower_large5,hl,hc]
     simp only [Nat.mul_add,Nat.mul_one] at ha hb
     omega

theorem source_separated5 (path : List Bool) :
 separated5 (sourceWord28 path)=
 min ((frame path).mid.b-(frame path).mid.a)
   (3*(frame path).mid.a-(frame path).mid.b) := by
 rcases split_first_false487 path with ⟨n,hp⟩ | ⟨n,rest,hp⟩
 · subst path
   have hw := source_pell_word446 n
   obtain ⟨ha,hb⟩ := source_word_counts28 (List.replicate n true)
   rw [hw] at ha hb ⊢
   simp at ha hb
   simp [separated5,List.replicate_succ,separatedScan5,
     show separatedScan5 false true (List.replicate n true)=0 by
       simpa [separatedScan5] using separated_replicate5 false n []]
   omega
 · subst path
   rw [source_run_substitutionBF]
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hc,hl⟩ := source_word_counts28 rest
   obtain ⟨hpos,hab,_⟩ := frame_reduced rest
   cases n with
   | zero =>
     unfold separated5
     rw [separated_lower_zero5]
     have he : bbScan446 true (sourceWord28 rest)=bbCount446 (sourceWord28 rest) := by
       rw [sourceWord_central28]; simp [bbCount446,bbScan446]
     rw [he,source_bb_count446]
     simp at ha hb ⊢; omega
   | succ n =>
     rw [separated_lower_positive5,hl]
     simp only [Nat.mul_add,Nat.mul_one] at ha hb
     omega

#print axioms source_tripleOne5
#print axioms source_separated5
end
end MathGKM.Markov
