import MarkovAbsorbedBoundaryCertificateM418
import MarkovAbsorbedBoundaryModelM418
/-! Machine-authored 418bcc64. Connect the rational boundary certificates
to the actual absorbed kernel, with its binomial normalization. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192

theorem absorbed_boundary_case20M418 (v g k : ℕ) :
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
 · have hh := absorbedBoundary201_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary201M418,boundaryModel0M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
 · have hh := absorbedBoundary202_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary202M418,boundaryModel1M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
 · have hh := absorbedBoundary203_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary203M418,boundaryModel2M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring

theorem absorbed_boundary_case21M418 (v g k : ℕ) :
 let t:=v+4
 let d:=t+1
 let j:=d+2
 0 ≤ ((cutPolyMFEE t (absorbedLiftM418 d j 4 (t+1)))^2-
   cutPolyMFEE t (absorbedLiftM418 d j 4 t)*cutPolyMFEE t (absorbedLiftM418 d j 4 (t+2))).coeff k := by
 let t:=v+4
 let d:=t+1
 let j:=d+2
 let B : ℚ := ((t+j+3).choose j:ℚ)
 have hz : 0 ≤ B-(j:ℚ)-1 := by
   have hb : (j:ℚ)+1 ≤ B := by exact_mod_cast base_choose_lowerM418 j t
   linarith
 have e0 : d-t=1 := by dsimp [d,t]; omega
 have e1 : d-(t+1)=0 := by dsimp [d,t]; omega
 have e2 : d-(t+2)=0 := by dsimp [d,t]; omega
 apply absorbed_boundary_of_modelM418 d j t k 4 (by dsimp [j]; omega)
 · have hh := absorbedBoundary211_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary211M418,boundaryModel0M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
 · have hh := absorbedBoundary212_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary212M418,boundaryModel1M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
 · have hh := absorbedBoundary213_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary213M418,boundaryModel2M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring

theorem absorbed_boundary_case30M418 (v g k : ℕ) :
 let t:=v+4
 let d:=t+2+g
 let j:=d+3
 0 ≤ ((cutPolyMFEE t (absorbedLiftM418 d j 8 (t+1)))^2-
   cutPolyMFEE t (absorbedLiftM418 d j 8 t)*cutPolyMFEE t (absorbedLiftM418 d j 8 (t+2))).coeff k := by
 let t:=v+4
 let d:=t+2+g
 let j:=d+3
 let B : ℚ := ((t+j+3).choose j:ℚ)
 have hz : 0 ≤ B-(j:ℚ)-1 := by
   have hb : (j:ℚ)+1 ≤ B := by exact_mod_cast base_choose_lowerM418 j t
   linarith
 have e0 : d-t=g+2 := by dsimp [d,t]; omega
 have e1 : d-(t+1)=g+1 := by dsimp [d,t]; omega
 have e2 : d-(t+2)=g := by dsimp [d,t]; omega
 apply absorbed_boundary_of_modelM418 d j t k 8 (by dsimp [j]; omega)
 · have hh := absorbedBoundary301_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary301M418,boundaryModel0M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
 · have hh := absorbedBoundary302_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary302M418,boundaryModel1M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
 · have hh := absorbedBoundary303_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary303M418,boundaryModel2M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring

theorem absorbed_boundary_case31M418 (v g k : ℕ) :
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
   have hb : (j:ℚ)+1 ≤ B := by exact_mod_cast base_choose_lowerM418 j t
   linarith
 have e0 : d-t=1 := by dsimp [d,t]; omega
 have e1 : d-(t+1)=0 := by dsimp [d,t]; omega
 have e2 : d-(t+2)=0 := by dsimp [d,t]; omega
 apply absorbed_boundary_of_modelM418 d j t k 8 (by dsimp [j]; omega)
 · have hh := absorbedBoundary311_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary311M418,boundaryModel0M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
 · have hh := absorbedBoundary312_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary312M418,boundaryModel1M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring
 · have hh := absorbedBoundary313_nonnegM418 (v:ℚ) (g:ℚ) (B-(j:ℚ)-1)
     (by positivity) (by positivity) hz
   simp only [absorbedExtraQM418,e0,e1,e2]
   convert hh using 1 <;>
     dsimp [absorbedBoundary313M418,boundaryModel2M418,cutBaseMFEE,cutNext0MFEE,cutNext1MFEE,
       cutLast0M418,cutLast1MFEE,cutLast2MFEE,liftWeightMAE9,liftDenMAE9,B,j,d,t] <;>
     push_cast <;> ring

end
end MathGKM.Markov
