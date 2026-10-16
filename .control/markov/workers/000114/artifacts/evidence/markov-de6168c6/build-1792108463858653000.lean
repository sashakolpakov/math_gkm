import MarkovBlockCounts274
import MarkovSourceMomentsM13D
/-! Machine-authored request de6168c6. Exact A-run word substitution, retaining
the actual predecessor word rather than arbitrary binary block choices. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem wordPair_mapMDE6 (f : Bool → Bool) (path : List Bool)
 (xy : List Bool × List Bool) :
 let ws := path.foldl wordPairStep774 xy
 (ws.1.map f,ws.2.map f)=
 path.foldl wordPairStep774 (xy.1.map f,xy.2.map f) := by
 induction path generalizing xy with
 | nil => rfl
 | cons r rs ih =>
   rw [List.foldl_cons,List.foldl_cons]
   dsimp only at ih ⊢
   rw [ih]
   cases r <;> simp [wordPairStep774]

theorem source_vertical_blocksMDE6 (n : ℕ) (rest : List Bool) :
 sourceWord28 (List.replicate n false++true::rest)=
 blockSub025 n ((sourceWord28 rest).map Bool.not) := by
 let xy := rest.foldl wordPairStep774 ([true],[false])
 have hw : (List.replicate n false++true::rest).foldl wordPairStep774
     ([false],[true])=(blockSub025 n xy.1,blockSub025 n xy.2) := by
   rw [List.foldl_append]
   change rest.foldl wordPairStep774
     (wordPairStep774 ((List.replicate n false).foldl wordPairStep774
       ([false],runBlock025 0)) true)=_
   rw [false_fold025]
   simp only [Nat.add_zero,wordPairStep774,if_true]
   have he : [false]++runBlock025 n=runBlock025 (n+1) := by
     simp [runBlock025,List.replicate_succ]
   rw [he]
   simpa [blockSub025] using (blockSub_pair025 n rest ([true],[false])).symm
 have hm := wordPair_mapMDE6 Bool.not rest ([false],[true])
 change (_,_) = xy at hm
 have hz : xy.1++xy.2=(sourceWord28 rest).map Bool.not := by
   rw [←hm]
   simp [sourceWord28]
 unfold sourceWord28 at hw ⊢
 rw [hw,←blockSub_append025,hz]

theorem count_notMDE6 (w : List Bool) :
 (w.map Bool.not).count true+w.count true=w.length := by
 induction w with
 | nil => simp
 | cons r rs ih => cases r <;> simp [List.count_cons] at * <;> omega

theorem source_vertical_indicesMDE6 (n : ℕ) (rest : List Bool) :
 (frame (List.replicate n false++true::rest)).mid.a=(frame rest).mid.b ∧
 (frame (List.replicate n false++true::rest)).mid.b=
 (frame rest).mid.b*(n+1)+((frame rest).mid.b-(frame rest).mid.a) := by
 obtain ⟨ha,hb⟩ := source_word_counts28 (List.replicate n false++true::rest)
 rw [source_vertical_blocksMDE6,block_counts274,List.length_map,
   (source_word_counts28 rest).2] at ha
 rw [source_vertical_blocksMDE6,block_length274,List.length_map,
   (source_word_counts28 rest).2] at hb
 have hc := count_notMDE6 (sourceWord28 rest)
 rw [(source_word_counts28 rest).1,(source_word_counts28 rest).2] at hc
 exact ⟨ha.symm,by omega⟩

end
end MathGKM.Markov
