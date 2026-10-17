import MarkovBoundary311MF8F
import MarkovBoundary312MF8F
import MarkovBoundary313MF8F
/-! Machine-authored f8f306c0: exact source-parameter bridge. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192
theorem absorbed_boundary_case31MF8F (v g k : ℕ) :
 let t:=v+4
 let d:=t+1
 let j:=d+3
 0 ≤ ((cutPolyMFEE t (absorbedLiftM418 d j 8 (t+1)))^2-
   cutPolyMFEE t (absorbedLiftM418 d j 8 t)*cutPolyMFEE t (absorbedLiftM418 d j 8 (t+2))).coeff k := by
 let t:=v+4
 let d:=t+1
 let j:=d+3
 let B : ℚ := ((t+j+3).choose j:ℚ)
 have hz : 0 ≤ B-(j:ℚ)-1 := by
   have hb : (j:ℚ)+1 ≤ B := by
     dsimp [B]
     exact_mod_cast base_choose_lowerM418 j t
   linarith
 have e0 : d-t=1 := by dsimp [d,t]; omega
 have e1 : d-(t+1)=0 := by dsimp [d,t]; omega
 have e2 : d-(t+2)=0 := by dsimp [d,t]; omega
 apply absorbed_boundary_of_modelM418 d j t k 8 (by dsimp [j]; omega)
 · have hh := absorbedBoundary311MF8F_nonnegMF8F (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary311MF8F,boundaryModel0M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
 · have hh := absorbedBoundary312MF8F_nonnegMF8F (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary312MF8F,boundaryModel1M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
 · have hh := absorbedBoundary313MF8F_nonnegMF8F (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary313MF8F,boundaryModel2M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring

end
end MathGKM.Markov
