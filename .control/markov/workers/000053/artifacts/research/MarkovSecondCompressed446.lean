import MarkovRunCompression446
/-! Machine-authored 446bbcdc. Exact second-slice compressed polynomial. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

def secondCompressed446 (n c r : ℕ) : ℤ[X] :=
 let C : ℤ[X] := c
 let R : ℤ[X] := r
 let Q : ℤ[X] := (2*r-c:ℕ)
 let h₀ := lowerH487 n
 let h₁ := lowerH487 (n+1)
 let k₀ := runKBF (lowerMatrix487 n)
 let k₁ := runKBF (lowerMatrix487 (n+1))
 let b := runB446 n
 let d := runD446 n
 2*((C-R)*k₀+R*k₁)+((C-R)*h₀+R*h₁)^2-((C-R)*h₀^2+R*h₁^2)+
 2*((X-1)*(C*b+R*d)+X*(C*b^2+2*R*b*d+Q*d^2))-
 2*(1+X)*((C-R)*h₀+R*h₁-1-X)+
 if c=2 then 2*X^(2*n+3) else 0

theorem source_runs_trace446 (n : ℕ) (path : List Bool) :
 runTraceTwoBF (sourceRunsBF n path)=
 runScoreBF (sourceRunsBF n path)+runL446 n*runLastBF (sourceRunsBF n path)+
 if (frame path).mid.b=2 then X^(2*n+3) else 0 := by
 have hw := sourceWord_central28 path
 have hl := (source_word_counts28 path).2
 rw [hw] at hl
 cases hc : central28 path with
 | nil =>
   rw [hc] at hl
   have hb : (frame path).mid.b=2 := by simpa using hl.symm
   have hr : sourceRunsBF n path=[n,n+1] := by simp [sourceRunsBF,hw,hc]
   rw [hr,hb,if_pos rfl]
   simp only [runTraceTwoBF,runLastBF]
   have hd (k : ℕ) : runDeltaBF (lowerMatrix487 k)=X^(k+1) := by
     obtain ⟨_,_,h0,_,_,h1,_⟩ := lowerMatrix_jets487 k
     simp [runDeltaBF,h0,h1]
   have hL := (runBL_binary446 n false).2
   simp [runIndex446,bit446] at hL
   rw [hL,hd,hd,← pow_add]
   congr 2
   omega
 | cons r rs =>
   rw [hc] at hl
   have hb : (frame path).mid.b≠2 := by simp at hl; omega
   have hr : sourceRunsBF n path=n::runIndex446 n r::
     (rs++[true]).map (runIndex446 n) := by
     change (sourceWord28 path).map (runIndex446 n)=_
     simp [hw,hc,runIndex446]
   rw [hr,if_neg hb]
   have hL := (runBL_binary446 n false).2
   simp [runIndex446,bit446] at hL
   cases rs with
   | nil => simp [runTraceTwoBF,hL]
   | cons s ss => simp [runTraceTwoBF,hL]

theorem source_second_compressed446 (n : ℕ) (path : List Bool) :
 2*secondSliceBF (sourceRunsBF n path)=
 secondCompressed446 n (frame path).mid.b (frame path).mid.a := by
 have hc := runScore_source_counts446 n path
 have hh := binary_sum446 (runH446 n) (sourceWord28 path)
 have hsum : runHsumBF (sourceRunsBF n path)=
   ((sourceWord28 path).map (runH446 n)).sum := by
   unfold runHsumBF sourceRunsBF
   rw [List.map_map]
   rfl
 simp only [(source_word_counts28 path).1,(source_word_counts28 path).2,
   runH446,runIndex446,Bool.false_eq_true,if_false,if_true,Nat.add_zero] at hh
 unfold secondSliceBF secondCompressed446
 rw [source_runs_trace446,hsum,hh]
 dsimp only at hc
 split_ifs <;> linear_combination hc

/-- Literal raw coefficient identity; the factor two multiplies the whole
equality and does not renormalize coefficients by their indices. -/
theorem source_second_raw_compressed446 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+2) :
 2*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 (secondCompressed446 n (frame rest).mid.b (frame rest).mid.a).coeff j := by
 rw [source_cut_coeffA27 _ i j 2 hij,
   source_second_sliceBF _ _ (source_runs_exactBF n rest) (source_runs_lengthBF n rest)]
 have h := congrArg (fun p : ℤ[X] => p.coeff j) (source_second_compressed446 n rest)
 simpa using h

#print axioms source_second_compressed446
#print axioms source_second_raw_compressed446
end
end MathGKM.Markov
