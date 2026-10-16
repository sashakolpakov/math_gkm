import MarkovSourceVarianceMAC3
import MarkovInteriorWitnessMF1E
/-! Machine-authored ac3d4ab9. An unbounded actual-source family reached by
the variance criterion beyond both the old margin and new pair criterion. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
attribute [local irreducible] frame coeff

theorem witness_pair_gapMAC3 (s : ℝ) (hs : 5 ≤ s) :
 2*(2*s^2+2)*(14*s^2+2*s+7)<
 (2*s)*(2*s-1)*(16*s^2+4*s+9) := by
 let t := s-5
 have ht : 0 ≤ t := by dsimp [t]; linarith
 have he : (2*s)*(2*s-1)*(16*s^2+4*s+9)-
   2*(2*s^2+2)*(14*s^2+2*s+7)=
   8*t^4+136*t^3+784*t^2+1614*t+442 := by dsimp [t]; ring
 have hp : 0<8*t^4+136*t^3+784*t^2+1614*t+442 := by positivity
 linarith

theorem unbounded_variance_onlyMAC3 (s : ℕ) (hs : 5 ≤ s) :
 ∃ (path : List Bool) (i j : ℕ),
   let m := (frame path).mid
   2 ≤ m.a ∧ m.a+2 ≤ m.b ∧
   i+j+2+2*s=m.a+m.b-1 ∧ i+j+8 ≤ m.a+m.b-1 ∧ m.a+5 ≤ i+j+2 ∧
   InPolygon m.a m.b i (j+2) ∧ InPolygon m.a m.b (i+1) (j+1) ∧
   InPolygon m.a m.b (i+2) j ∧
   ¬DiagonalMiddleMF1E m.a m.b i j ∧ ¬DiagonalRegionMAC3 m.a m.b i j ∧
   DiagonalVarianceMAC3 m.a m.b i j ∧
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2 := by
 let n := 4*s^2+2*s+1
 let path := List.replicate n true++[false]
 let i := 2*s^2+2*s
 let j := 14*s^2+4*s+5
 obtain ⟨ha,hb⟩ := right_left_labelsMF1E n
 change (frame path).mid.a=2*n+1 at ha
 change (frame path).mid.b=2*n+3 at hb
 have ht : i+j+2+2*s=(frame path).mid.a+(frame path).mid.b-1 := by
   rw [ha,hb]; dsimp [n,i,j]; omega
 have hi : 2*s ≤ i := by dsimp [i]; omega
 have hj : 2*s ≤ j := by dsimp [j]; omega
 have hlo : (frame path).mid.b ≤ i+j+2 := by
   rw [hb]; dsimp [n,i,j]; nlinarith
 have hab : (frame path).mid.a ≤ (frame path).mid.b := by rw [ha,hb]; omega
 have hhigh : i+j+2 ≤ (frame path).mid.a+(frame path).mid.b-1 := by omega
 have eH : (frame path).mid.a+(frame path).mid.b-1-2*(2*s)+2=16*s^2+4*s+9 := by
   rw [ha,hb]; dsimp [n]; omega
 have eA : i-2*s+2=2*s^2+2 := by dsimp [i]; omega
 have eB : j-2*s+2=14*s^2+2*s+7 := by dsimp [j]; omega
 have hv : DiagonalVarianceMAC3 (frame path).mid.a (frame path).mid.b i j := by
   refine ⟨2*s,ht,hi,hj,?_⟩
   rw [eH,eA,eB]
   nlinarith [sq_nonneg (s:ℤ)]
 have hnotold : ¬DiagonalMiddleMF1E (frame path).mid.a (frame path).mid.b i j := by
   intro ⟨r,hr,hri,hrj⟩
   have er : r=2*s := by omega
   subst r
   dsimp [i] at hri
   nlinarith
 have hnotpair : ¬DiagonalRegionMAC3 (frame path).mid.a (frame path).mid.b i j := by
   intro ⟨r,hr,hri,hrj,hg⟩
   have er : r=2*s := by omega
   subst r
   rw [eH,eA,eB] at hg
   have hstrict := witness_pair_gapMAC3 s (by exact_mod_cast hs)
   have hc : (((2*s)*(2*s-1):ℕ):ℝ)=(2*(s:ℝ))*(2*(s:ℝ)-1) := by
     rw [cast_pairMAC3]
     push_cast
     ring
   have hgr : (((2*s)*(2*s-1):ℕ):ℝ)*(16*(s:ℝ)^2+4*s+9) ≤
       2*(2*(s:ℝ)^2+2)*(14*(s:ℝ)^2+2*s+7) := by exact_mod_cast hg
   rw [hc] at hgr
   linarith
 refine ⟨path,i,j,?_,?_,ht,?_,?_,?_,?_,?_,hnotold,hnotpair,hv,
   source_diagonal_varianceMAC3 path i j hv⟩
 · rw [ha]; dsimp [n]; omega
 · rw [ha,hb]
 · omega
 · rw [ha]; dsimp [n,i,j]; nlinarith
 · exact polygon_of_totalMF1E _ _ _ _ hab (by omega) (by omega)
 · exact polygon_of_totalMF1E _ _ _ _ hab (by omega) (by omega)
 · exact polygon_of_totalMF1E _ _ _ _ hab (by omega) (by omega)
end
end MathGKM.Markov
