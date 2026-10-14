import MarkovCyclicSecondBF
/-! Machine-authored bf38fa19. Exact recursive source run representation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem source_run_substitutionBF (n : ℕ) (rest : List Bool) :
 sourceWord28 (List.replicate n true++false::rest)=
 lowerSub487 n (sourceWord28 rest) := by
 let xy := rest.foldl wordPairStep774 ([false],[true])
 have hw : (List.replicate n true++false::rest).foldl wordPairStep774 ([false],[true])=
     (lowerSub487 n xy.1,lowerSub487 n xy.2) := by
   rw [List.foldl_append]
   change rest.foldl wordPairStep774
     (wordPairStep774 ((List.replicate n true).foldl wordPairStep774
       (lowerRun487 0,[true])) false)=_
   rw [true_fold487]
   simp only [Nat.add_zero,wordPairStep774,Bool.false_eq_true,if_false]
   have he1 : lowerRun487 n++[true]=lowerRun487 (n+1) := by
     simp [lowerRun487,List.replicate_succ']
   rw [he1]
   simpa [lowerSub487] using (lowerSub_pair487 n rest ([false],[true])).symm
 unfold sourceWord28
 rw [hw,lowerSub_append487]

def sourceRunsBF (n : ℕ) (rest : List Bool) : List ℕ :=
 (sourceWord28 rest).map fun r => n+if r then 1 else 0

theorem source_runs_exactBF (n : ℕ) (rest : List Bool) :
 sourceWord28 (List.replicate n true++false::rest)=
 (sourceRunsBF n rest).flatMap lowerRun487 := by
 rw [source_run_substitutionBF]
 simp [sourceRunsBF,lowerSub487,List.flatMap_map]

theorem source_runs_lengthBF (n : ℕ) (rest : List Bool) :
 2≤(sourceRunsBF n rest).length := by
 have hl := (source_word_counts28 rest).2
 obtain ⟨ha,hab,_⟩ := frame_reduced rest
 simp only [sourceRunsBF,List.length_map]
 omega

def runTraceTwoBF : List ℕ → ℤ[X]
 | [] => 0
 | [n] => (tr16 (lowerMatrix487 n)).coeff 2
 | [n,m] => runScoreBF [n,m]+runLBF (lowerMatrix487 n)*runBf (lowerMatrix487 m)+
     runDeltaBF (lowerMatrix487 n)*runDeltaBF (lowerMatrix487 m)
 | n::m::k::ns => runScoreBF (n::m::k::ns)+
     runLBF (lowerMatrix487 n)*runLastBF (n::m::k::ns)
def secondSliceBF (ns : List ℕ) : ℤ[X] :=
 runTraceTwoBF ns-(1+X)*(runHsumBF ns-1-X)

theorem run_trace_formulaBF (ns : List ℕ) :
 (tr16 (runMatrixBF ns)).coeff 2=runTraceTwoBF ns := by
 cases ns with
 | nil => simp [runMatrixBF,ambientWord5c,tr16,runTraceTwoBF,Polynomial.coeff_one]
 | cons n ns => cases ns with
   | nil => simp [runMatrixBF,lowerMatrix487,runTraceTwoBF]
   | cons m ns => cases ns with
     | nil => exact run_trace_two_blocksBF n m
     | cons k ns => exact run_trace_secondBF n m k ns

theorem source_second_sliceBF (path : List Bool) (ns : List ℕ)
 (hw : sourceWord28 path=ns.flatMap lowerRun487) (hl : 2≤ns.length) :
 cutCoeffA27 (X : ℤ[X]) X 1 (central28 path++[true]) 2=secondSliceBF ns := by
 have h1 := source_first_cut_trace487 path
 have h2 := source_second_cut_traceBF path
 rw [hw,lower_trace_sum487 _ hl] at h1
 rw [hw] at h2
 change (tr16 (runMatrixBF ns)).coeff 2=_ at h2
 rw [run_trace_formulaBF] at h2
 change runHsumBF ns=_ at h1
 unfold secondSliceBF
 linear_combination (1+X)*h1-h2

theorem source_second_recursiveBF (path : List Bool) :
 (∃ k, path=List.replicate k true) ∨
 ∃ n rest, path=List.replicate n true++false::rest ∧
 ∀ i j : ℕ, i+j=(frame path).mid.a+2 →
 coeff (frame path).mid.p i j=(secondSliceBF (sourceRunsBF n rest)).coeff j := by
 rcases split_first_false487 path with h | ⟨n,rest,hp⟩
 · exact Or.inl h
 · right
   refine ⟨n,rest,hp,?_⟩
   intro i j hij
   rw [source_cut_coeffA27 path i j 2 hij]
   have hw : sourceWord28 path=(sourceRunsBF n rest).flatMap lowerRun487 := by
     rw [hp,source_runs_exactBF]
   rw [source_second_sliceBF path _ hw (source_runs_lengthBF n rest)]

#print axioms source_run_substitutionBF
#print axioms source_second_sliceBF
#print axioms source_second_recursiveBF
end
end MathGKM.Markov
