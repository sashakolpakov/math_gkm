import MarkovBoundary201MF8F
import MarkovBoundary202MF8F
import MarkovBoundary203MF8F
/-! Machine-authored f8f306c0: exact source-parameter bridge. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192
theorem absorbed_boundary_case20MF8F (v g k : ℕ) :
 let t:=v+4
 let d:=t+2+g
 let j:=d+2
 0 ≤ ((cutPolyMFEE t (absorbedLiftM418 d j 4 (t+1)))^2-
   cutPolyMFEE t (absorbedLiftM418 d j 4 t)*cutPolyMFEE t (absorbedLiftM418 d j 4 (t+2))).coeff k := by
 let t:=v+4
 let d:=t+2+g
 let j:=d+2
 let B : ℚ := ((t+j+3).choose j:ℚ)
 have hz : 0 ≤ B-(j:ℚ)-1 := by
   have hb : (j:ℚ)+1 ≤ B := by exact_mod_cast base_choose_lowerM418 j t
   linarith
 have e0 : d-t=g+2 := by dsimp [d,t]; omega
 have e1 : d-(t+1)=g+1 := by dsimp [d,t]; omega
 have e2 : d-(t+2)=g := by dsimp [d,t]; omega
 apply absorbed_boundary_of_modelM418 d j t k 4 (by dsimp [j]; omega)
 · have hh := absorbedBoundary201MF8F_nonnegMF8F (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary201MF8F,boundaryModel0M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
 · have hh := absorbedBoundary202MF8F_nonnegMF8F (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary202MF8F,boundaryModel1M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
 · have hh := absorbedBoundary203MF8F_nonnegMF8F (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary203MF8F,boundaryModel2M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring


end
end MathGKM.Markov
