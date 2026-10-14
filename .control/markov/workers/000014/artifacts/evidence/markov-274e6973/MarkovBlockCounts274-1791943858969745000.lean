import MarkovBlockAssembly274

/-! Machine-authored request 274e6973. Source block counts. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem block_counts274 (n : ℕ) (z : List Bool) :
    (blockSub025 n z).count true=z.length := by
  induction z with
  | nil => simp [blockSub025]
  | cons r rs ih =>
    simp only [blockSub025,List.flatMap_cons,List.count_append,List.length_cons] at *
    rw [ih]
    simp [runBlock025,List.count_replicate,add_comm]

theorem block_length274 (n : ℕ) (z : List Bool) :
    (blockSub025 n z).length=z.length*(n+1)+z.count true := by
  induction z with
  | nil => simp [blockSub025]
  | cons r rs ih =>
    simp only [blockSub025,List.flatMap_cons,List.length_append,List.length_cons] at *
    rw [ih]
    cases r <;> simp [runBlock025,List.count_cons] <;> ring

theorem source_block_counts274 (path : List Bool) :
    (∃ n, path=List.replicate n false) ∨
    ∃ (n : ℕ) (z : List Bool), true ∈ z ∧ false ∈ z ∧
      sourceMatrix025 path=rawWord80 (blockSub025 n z) ∧
      z.length=(frame path).mid.a ∧
      z.length*(n+1)+z.count true=(frame path).mid.b := by
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
    have hmat : sourceMatrix025 path=rawWord80 (blockSub025 n (xy.1++xy.2)) := by
      unfold sourceMatrix025
      rw [← hm]
      change mm16 (rawWord80 (blockSub025 n xy.1)) (rawWord80 (blockSub025 n xy.2))=_
      rw [← rawWord_append80,← blockSub_append025]
    refine ⟨hmat,?_,?_⟩
    all_goals
      have hv := wordPair_fold_valid774 path initial ([false],[true]) indices_initial wordPair_initial774
      rw [hw] at hv
      obtain ⟨lb,hb,la,ha,_,_⟩ := hv
      have hi := indices_frame path
      simp only [block_counts274] at la ha
      simp only [block_length274] at lb hb
      simp only [List.length_append,List.count_append]
      have hia := hi.1
      have hib := hi.2.1
      simp only [frame] at hia hib ⊢
      nlinarith



#print axioms source_block_counts274
end
end MathGKM.Markov
