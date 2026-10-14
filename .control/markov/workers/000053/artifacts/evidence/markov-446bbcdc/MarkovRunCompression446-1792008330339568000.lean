import MarkovBinaryEnergy446
/-! Machine-authored 446bbcdc. Compression of the inherited exact run score. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

def runIndex446 (n : ℕ) (r : Bool) := n+if r then 1 else 0
def runH446 (n : ℕ) (r : Bool) := lowerH487 (runIndex446 n r)
def runK446 (n : ℕ) (r : Bool) := runKBF (lowerMatrix487 (runIndex446 n r))
def runB446 (n : ℕ) : ℤ[X] := 2*runSumA27 X n
def runD446 (n : ℕ) : ℤ[X] := 2*X^(n+1)
def runL446 (n : ℕ) : ℤ[X] := X-1+X*runB446 n

theorem runBL_binary446 (n : ℕ) (r : Bool) :
 runBf (lowerMatrix487 (runIndex446 n r))=runB446 n+runD446 n*bit446 r ∧
 runLBF (lowerMatrix487 (runIndex446 n r))=runL446 n+X*runD446 n*bit446 r := by
 have hr : runSumA27 (X : ℤ[X]) (n+1)=runSumA27 X n+X^(n+1) := by
   simp [runSumA27,Finset.sum_range_succ]
 cases r <;>
   simp [runIndex446,runBf,(lowerMatrix_jets487 n).2.2.1,
     (lowerMatrix_jets487 (n+1)).2.2.1,lowerMatrix_second_relationBF,
     runB446,runD446,runL446,bit446,hr] <;> ring

theorem runScore_energy446 (n : ℕ) (r : Bool) (w : List Bool) :
 runScoreBF ((r::w).map (runIndex446 n))+
 runL446 n*runLastBF ((r::w).map (runIndex446 n))=
 ((r::w).map (runK446 n)).sum+pairEnergy446 (runH446 n) (r::w)+
 energyScan446 (runB446 n) (runD446 n) (runL446 n) X r w := by
 induction w generalizing r with
 | nil =>
   simp [runScoreBF,runLastBF,pairEnergy446,energyScan446,runK446,
     (runBL_binary446 n r).1]
   ring
 | cons s ss ih =>
   have ih' := ih s
   simp only [List.map_cons,runScoreBF,runLastBF,pairEnergy446,
     List.sum_cons,energyScan446]
   rw [(runBL_binary446 n r).1,(runBL_binary446 n s).2]
   have hh : runHsumBF ((s::ss).map (runIndex446 n))=
     ((s::ss).map (runH446 n)).sum := by
     simp [runHsumBF,List.map_map,Function.comp_def,runH446]
   rw [hh]
   change runK446 n r + _ + runH446 n r * _ + _ + _ = _
   simp only [List.map_cons,List.sum_cons] at ih'
   linear_combination ih'

theorem runScore_source_energy446 (n : ℕ) (path : List Bool) :
 runScoreBF (sourceRunsBF n path)+runL446 n*runLastBF (sourceRunsBF n path)=
 ((sourceWord28 path).map (runK446 n)).sum+
 pairEnergy446 (runH446 n) (sourceWord28 path)+
 cyclicEnergy446 (runB446 n) (runD446 n) (runL446 n) X (sourceWord28 path) := by
 have hw := sourceWord_central28 path
 have he := runScore_energy446 n false (central28 path++[true])
 simpa [sourceRunsBF,hw,runIndex446,cyclicEnergy446,energyScan446,bit446] using he

/-- Doubled count-compressed score; multiplying the equality by two avoids
division in the integer polynomial ring. It is not coefficient normalization. -/
theorem runScore_source_counts446 (n : ℕ) (path : List Bool) :
 let c : ℤ[X] := (frame path).mid.b
 let r : ℤ[X] := (frame path).mid.a
 let q : ℤ[X] := (2*(frame path).mid.a-(frame path).mid.b:ℕ)
 let h₀ := lowerH487 n
 let h₁ := lowerH487 (n+1)
 let k₀ := runKBF (lowerMatrix487 n)
 let k₁ := runKBF (lowerMatrix487 (n+1))
 let b := runB446 n
 let d := runD446 n
 2*(runScoreBF (sourceRunsBF n path)+runL446 n*runLastBF (sourceRunsBF n path))=
 2*((c-r)*k₀+r*k₁)+((c-r)*h₀+r*h₁)^2-((c-r)*h₀^2+r*h₁^2)+
 2*((X-1)*(c*b+r*d)+X*(c*b^2+2*r*b*d+q*d^2)) := by
 dsimp only
 rw [runScore_source_energy446]
 have hs := binary_sum446 (runK446 n) (sourceWord28 path)
 have hp := pairEnergy_counts446 (lowerH487 n) (lowerH487 (n+1)) (sourceWord28 path)
 have hf : runH446 n=(fun r => if r then lowerH487 (n+1) else lowerH487 n) := by
   funext r; cases r <;> simp [runH446,runIndex446]
 rw [← hf] at hp
 have he := source_cyclic_energy446 (runB446 n) (runD446 n) (X : ℤ[X]) path
 change cyclicEnergy446 _ _ (runL446 n) _ _=_ at he
 simp only [(source_word_counts28 path).1,(source_word_counts28 path).2,
   runK446,runIndex446,if_false,if_true,Nat.add_zero] at hs hp
 rw [hs,he]
 linear_combination hp

#print axioms runScore_source_counts446
end
end MathGKM.Markov
