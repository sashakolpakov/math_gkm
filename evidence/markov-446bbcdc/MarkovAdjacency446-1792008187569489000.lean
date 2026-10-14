import MarkovRunRecurrenceBF
/-! Machine-authored 446bbcdc. Exact source adjacent-B statistic. -/
namespace MathGKM.Markov
noncomputable section

def bbScan446 : Bool → List Bool → ℕ
 | _, [] => 0
 | p, r::rs => (if p && r then 1 else 0)+bbScan446 r rs
def bbCount446 (w : List Bool) : ℕ := bbScan446 false w

theorem bbScan_replicate446 (n : ℕ) (w : List Bool) :
 bbScan446 true (List.replicate n true++w)=n+bbScan446 true w := by
 induction n with
 | zero => simp [bbScan446]
 | succ n ih => simp [List.replicate_succ,bbScan446,ih]; omega

theorem bbScan_reset446 (p : Bool) (n : ℕ) (w : List Bool) :
 bbScan446 p (lowerSub487 n w)=bbScan446 false (lowerSub487 n w) := by
 cases w with
 | nil => simp [lowerSub487,bbScan446]
 | cons r rs => simp [lowerSub487,lowerRun487,bbScan446]

theorem bbScan_lower_zero446 (w : List Bool) :
 bbCount446 (lowerSub487 0 w)=0 := by
 induction w with
 | nil => rfl
 | cons r rs ih =>
   cases r <;> simpa [bbCount446,lowerSub487,lowerRun487,bbScan446,
     ← lowerSub487,bbScan_reset446] using ih

theorem bbScan_lower_succ446 (n : ℕ) (w : List Bool) :
 bbCount446 (lowerSub487 (n+1) w)=w.length*n+w.count true := by
 induction w with
 | nil => simp [bbCount446,lowerSub487,bbScan446]
 | cons r rs ih =>
   have hr := bbScan_reset446 true (n+1) rs
   cases r <;>
     simp [bbCount446,lowerSub487,lowerRun487,List.replicate_succ,
       bbScan446,bbScan_replicate446,← lowerSub487,hr] at ih ⊢ <;> omega

theorem source_pell_word446 (n : ℕ) :
 sourceWord28 (List.replicate n true)=false::List.replicate (n+1) true := by
 unfold sourceWord28
 have h := true_fold487 n 0
 change (List.replicate n true).foldl wordPairStep774 ([false],[true])=_ at h
 rw [h]
 simp [lowerRun487,List.replicate_succ']

/-- Exact adjacent-B count for every source path, with natural subtraction.
The source word begins A and ends B, so its closing cyclic edge contributes zero. -/
theorem source_bb_count446 (path : List Bool) :
 bbCount446 (sourceWord28 path)=2*(frame path).mid.a-(frame path).mid.b := by
 rcases split_first_false487 path with ⟨n,hp⟩ | ⟨n,rest,hp⟩
 · subst path
   have hw := source_pell_word446 n
   obtain ⟨ha,hb⟩ := source_word_counts28 (List.replicate n true)
   rw [hw] at ha hb ⊢
   simp only [List.count_cons,List.count_replicate,List.length_cons,
     List.length_replicate] at ha hb
   simp [bbCount446,List.replicate_succ,bbScan446,
     show bbScan446 true (List.replicate n true)=n by
       simpa [bbScan446] using bbScan_replicate446 n []]
   omega
 · subst path
   rw [source_run_substitutionBF]
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hc,hl⟩ := source_word_counts28 rest
   obtain ⟨hpos,hab,_⟩ := frame_reduced rest
   cases n with
   | zero => rw [bbScan_lower_zero446]; simp at ha hb; omega
   | succ n =>
     rw [bbScan_lower_succ446,hl,hc]
     simp only [Nat.mul_add,Nat.mul_one] at ha hb
     omega

#print axioms source_bb_count446
end
end MathGKM.Markov
