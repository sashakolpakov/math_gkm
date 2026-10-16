import MarkovPrefixObstructionM10D

/-! Machine-authored 10d15751. The F-state obstruction occurs on an
unbounded family of actual source prefixes; the final source is not refuted. -/
namespace MathGKM.Markov
noncomputable section

theorem source_two_wordM10D (n : ℕ) :
 sourceWord28 (List.replicate n false++[true])=
 runBlock025 (n+1)++runBlock025 n := by
 rw [source_vertical_blocksMDE6 n []]
 simp [sourceWord28,wordPairStep774,blockSub025]

theorem source_two_prefixM10D (n : ℕ) :
 sourceWord28 (List.replicate (n+1) false++[true])=
 (List.replicate (n+2) false++[true,false])++(List.replicate n false++[true]) := by
 rw [source_two_wordM10D]
 simp [runBlock025,List.replicate_succ,List.append_assoc]

theorem source_two_prefix_takeM10D (n : ℕ) :
 (sourceWord28 (List.replicate (n+1) false++[true])).take (n+4)=
 List.replicate (n+2) false++[true,false] := by
 rw [source_two_prefixM10D]
 have hl : (List.replicate (n+2) false++[true,false]).length=n+4 := by simp
 rw [←hl,List.take_left]

theorem actual_source_prefix_F_failureM10D (n : ℕ) (hn : 9≤n) :
 let path := List.replicate (n+1) false++[true]
 let f := (hstateM10D ((sourceWord28 path).take (n+4))).1
 (frame path).mid.a=2 ∧ (frame path).mid.b=2*n+5 ∧
 coeff f 2 2^2 < coeff f 2 1*coeff f 2 3 := by
 dsimp only
 rw [source_two_prefix_takeM10D]
 have hi := source_vertical_indicesMDE6 (n+1) []
 change (frame (List.replicate (n+1) false++[true])).mid.a=2 ∧
   (frame (List.replicate (n+1) false++[true])).mid.b=2*((n+1)+1)+(2-1) at hi
 exact ⟨hi.1,by omega,hstate_run_BA_failureM10D n hn⟩

end
end MathGKM.Markov
