import MarkovCyclicTrace487
import MarkovVerticalBlocks025
/-! Machine-authored 487ae883. Exact adjacent B-run source decomposition. -/
namespace MathGKM.Markov
noncomputable section

def lowerRun487 (n : ℕ) : List Bool := false::List.replicate n true
def lowerSub487 (n : ℕ) (w : List Bool) : List Bool :=
 w.flatMap fun r => lowerRun487 (n+if r then 1 else 0)

theorem lowerSub_append487 (n : ℕ) (w z : List Bool) :
 lowerSub487 n (w++z)=lowerSub487 n w++lowerSub487 n z := by simp [lowerSub487]

theorem lowerSub_pair487 (n : ℕ) (path : List Bool) (xy : List Bool × List Bool) :
 let ws := path.foldl wordPairStep774 xy
 (lowerSub487 n ws.1,lowerSub487 n ws.2)=
 path.foldl wordPairStep774 (lowerSub487 n xy.1,lowerSub487 n xy.2) := by
 induction path generalizing xy with
 | nil => rfl
 | cons r rs ih =>
   rw [List.foldl_cons,List.foldl_cons]
   dsimp only at ih ⊢
   rw [ih]
   cases r <;> simp [wordPairStep774,lowerSub_append487]

theorem true_fold487 (n k : ℕ) :
 (List.replicate n true).foldl wordPairStep774 (lowerRun487 k,[true])=
 (lowerRun487 (n+k),[true]) := by
 induction n generalizing k with
 | zero => simp
 | succ n ih =>
   simp only [List.replicate_succ,List.foldl_cons,wordPairStep774,if_true]
   have he : lowerRun487 k++[true]=lowerRun487 (k+1) := by
     simp [lowerRun487,List.replicate_succ']
   rw [he,ih]
   congr 2
   omega

theorem split_first_false487 (path : List Bool) :
 (∃ n, path=List.replicate n true) ∨
 ∃ n rest, path=List.replicate n true++false::rest := by
 induction path with
 | nil => exact Or.inl ⟨0,rfl⟩
 | cons r rs ih =>
   cases r
   · exact Or.inr ⟨0,rs,rfl⟩
   · rcases ih with ⟨n,hn⟩ | ⟨n,rest,hn⟩
     · exact Or.inl ⟨n+1,by simp [List.replicate_succ,hn]⟩
     · exact Or.inr ⟨n+1,rest,by simp [List.replicate_succ,hn]⟩

theorem lower_counts487 (n : ℕ) (z : List Bool) :
 (lowerSub487 n z).count true=z.length*n+z.count true ∧
 (lowerSub487 n z).length=z.length*(n+1)+z.count true := by
 induction z with
 | nil => simp [lowerSub487]
 | cons r rs ih =>
   simp only [lowerSub487,List.flatMap_cons,List.count_append,List.length_append]
   change _ + (lowerSub487 n rs).count true = _ ∧
     _ + (lowerSub487 n rs).length = _
   rw [ih.1,ih.2]
   cases r <;> simp [lowerRun487,List.count_cons,List.count_replicate,add_mul,mul_add] <;>
     constructor <;> ring

theorem lower_pair_members487 (path : List Bool) (xy : List Bool × List Bool)
 (hl : false∈xy.1) (hr : true∈xy.2) :
 false∈(path.foldl wordPairStep774 xy).1 ∧ true∈(path.foldl wordPairStep774 xy).2 := by
 induction path generalizing xy with
 | nil => exact ⟨hl,hr⟩
 | cons r rs ih =>
   apply ih
   · cases r <;> simp [wordPairStep774,hl]
   · cases r <;> simp [wordPairStep774,hr]

theorem source_lower_blocks487 (path : List Bool) :
 (∃ n, path=List.replicate n true) ∨
 ∃ (n : ℕ) (z : List Bool), false∈z ∧ true∈z ∧
 sourceWord28 path=lowerSub487 n z ∧
 (frame path).mid.a=z.length*n+z.count true ∧
 (frame path).mid.b=z.length*(n+1)+z.count true := by
 rcases split_first_false487 path with h | ⟨n,rest,he⟩
 · exact Or.inl h
 · right
   let xy := rest.foldl wordPairStep774 ([false],[true])
   have hmem := lower_pair_members487 rest ([false],[true]) (by simp) (by simp)
   change false∈xy.1 ∧ true∈xy.2 at hmem
   refine ⟨n,xy.1++xy.2,List.mem_append.mpr (Or.inl hmem.1),
     List.mem_append.mpr (Or.inr hmem.2),?_⟩
   have hw : path.foldl wordPairStep774 ([false],[true])=
     (lowerSub487 n xy.1,lowerSub487 n xy.2) := by
     rw [he,List.foldl_append]
     change rest.foldl wordPairStep774
       (wordPairStep774 ((List.replicate n true).foldl wordPairStep774
         (lowerRun487 0,[true])) false)=_
     rw [true_fold487]
     simp only [Nat.add_zero,wordPairStep774,Bool.false_eq_true,if_false]
     have he1 : lowerRun487 n++[true]=lowerRun487 (n+1) := by
       simp [lowerRun487,List.replicate_succ']
     rw [he1]
     simpa [lowerSub487] using (lowerSub_pair487 n rest ([false],[true])).symm
   have hs : sourceWord28 path=lowerSub487 n (xy.1++xy.2) := by
     unfold sourceWord28
     rw [hw,lowerSub_append487]
   obtain ⟨ha,hb⟩ := source_word_counts28 path
   rw [hs,(lower_counts487 n (xy.1++xy.2)).1] at ha
   rw [hs,(lower_counts487 n (xy.1++xy.2)).2] at hb
   exact ⟨hs,ha.symm,hb.symm⟩

#print axioms source_lower_blocks487
end
end MathGKM.Markov
