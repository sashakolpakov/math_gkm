import MarkovVerticalSource025

/-! Machine-authored request 02592c7b. Exact source block decomposition.
Every non-left-spine source word uses two adjacent A-run lengths. -/
namespace MathGKM.Markov
noncomputable section

def runBlock025 (n : ℕ) : List Bool := List.replicate n false++[true]
def blockSub025 (n : ℕ) (w : List Bool) : List Bool :=
  w.flatMap fun r => runBlock025 (n+if r then 1 else 0)

theorem blockSub_append025 (n : ℕ) (w z : List Bool) :
    blockSub025 n (w++z)=blockSub025 n w++blockSub025 n z := by
  simp [blockSub025]

theorem blockSub_pair025 (n : ℕ) (path : List Bool)
    (xy : List Bool × List Bool) :
    let ws := path.foldl wordPairStep774 xy
    (blockSub025 n ws.1,blockSub025 n ws.2)=
      path.foldl wordPairStep774 (blockSub025 n xy.1,blockSub025 n xy.2) := by
  induction path generalizing xy with
  | nil => rfl
  | cons r rs ih =>
    rw [List.foldl_cons,List.foldl_cons]
    dsimp only at ih ⊢
    rw [ih]
    cases r <;> simp [wordPairStep774,blockSub_append025]

theorem false_fold025 (n k : ℕ) :
    (List.replicate n false).foldl wordPairStep774 ([false],runBlock025 k)=
      ([false],runBlock025 (n+k)) := by
  induction n generalizing k with
  | zero => simp
  | succ n ih =>
    simp only [List.replicate_succ,List.foldl_cons,wordPairStep774,if_false]
    have he : [false]++runBlock025 k=runBlock025 (k+1) := by
      simp [runBlock025,List.replicate_succ]
    rw [he,ih]
    congr 2
    omega

theorem split_first_true025 (path : List Bool) :
    (∃ n, path=List.replicate n false) ∨
      ∃ n rest, path=List.replicate n false++true::rest := by
  induction path with
  | nil => exact Or.inl ⟨0,rfl⟩
  | cons r rs ih =>
    cases r
    · rcases ih with ⟨n,hn⟩ | ⟨n,rest,hn⟩
      · exact Or.inl ⟨n+1,by simp [List.replicate_succ,hn]⟩
      · exact Or.inr ⟨n+1,rest,by simp [List.replicate_succ,hn]⟩
    · exact Or.inr ⟨0,rs,rfl⟩

theorem pair_members025 (path : List Bool) (xy : List Bool × List Bool)
    (hl : true ∈ xy.1) (hr : false ∈ xy.2) :
    true ∈ (path.foldl wordPairStep774 xy).1 ∧
      false ∈ (path.foldl wordPairStep774 xy).2 := by
  induction path generalizing xy with
  | nil => exact ⟨hl,hr⟩
  | cons r rs ih =>
    apply ih
    · cases r <;> simp [wordPairStep774,hl]
    · cases r <;> simp [wordPairStep774,hr]

theorem source_blocks025 (path : List Bool) :
    (∃ n, path=List.replicate n false) ∨
    ∃ (n : ℕ) (z : List Bool), true ∈ z ∧ false ∈ z ∧
      sourceMatrix025 path=rawWord80 (blockSub025 n z) := by
  rcases split_first_true025 path with h | ⟨n,rest,he⟩
  · exact Or.inl h
  · right
    let xy := rest.foldl wordPairStep774 ([true],[false])
    have hmem := pair_members025 rest ([true],[false]) (by simp) (by simp)
    change true ∈ xy.1 ∧ false ∈ xy.2 at hmem
    refine ⟨n,xy.1++xy.2,List.mem_append.mpr (Or.inl hmem.1),
      List.mem_append.mpr (Or.inr hmem.2),?_⟩
    have hw : path.foldl wordPairStep774 ([false],[true])=
        (blockSub025 n xy.1,blockSub025 n xy.2) := by
      rw [he,List.foldl_append]
      change rest.foldl wordPairStep774
        (wordPairStep774 ((List.replicate n false).foldl wordPairStep774
          ([false],runBlock025 0)) true)=_
      rw [false_fold025]
      simp only [Nat.add_zero,wordPairStep774,if_true]
      have he1 : [false]++runBlock025 n=runBlock025 (n+1) := by
        simp [runBlock025,List.replicate_succ]
      rw [he1]
      have hh := blockSub_pair025 n rest ([true],[false])
      simpa [blockSub025] using hh.symm
    have hm := rawWord_pairs80 path ([false],[true])
    simp only [rawWord80,Bool.false_eq_true,if_false,if_true,mm_one_right774] at hm
    rw [hw] at hm
    unfold sourceMatrix025
    rw [← hm]
    change mm16 (rawWord80 (blockSub025 n xy.1)) (rawWord80 (blockSub025 n xy.2))=_
    rw [← rawWord_append80,← blockSub_append025]

#print axioms source_blocks025
end
end MathGKM.Markov
