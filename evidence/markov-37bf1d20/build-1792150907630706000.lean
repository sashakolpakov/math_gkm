import MarkovSourceSharpM37B
import MarkovInteriorWitnessMF1E
/-! Machine-authored 37bf1d20. Unbounded actual-source witness for the
discriminant criterion beyond all three inherited support criteria. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
attribute [local irreducible] frame coeff

theorem right_left_left_labelsM37B (n : ℕ) :
 (frame (List.replicate n true++[false,false])).mid.a=3*n+1 ∧
 (frame (List.replicate n true++[false,false])).mid.b=3*n+4 := by
 have h := indices_frame (List.replicate n true)
 have ha := h.1
 have hb := h.2.1
 rw [right_hi650] at ha hb
 simp only [initial] at ha hb
 obtain ⟨hm,hn⟩ := right_labels650 n
 obtain ⟨hla,hlb⟩ := right_left_labelsMF1E n
 rw [show List.replicate n true++[false,false]=
   (List.replicate n true++[false])++[false] by simp,frame_append18]
 simp only [advance,Bool.false_eq_true,ite_false]
 rw [hla,hlb,frame_append18]
 simp only [advance,Bool.false_eq_true,ite_false]
 constructor <;> omega

theorem unbounded_sharp_onlyM37B (t : ℕ) (ht : 1  ≤  t) :
 ∃ (path : List Bool) (i j : ℕ),
   let m := (frame path).mid
   2  ≤  m.a ∧ m.a+2  ≤  m.b ∧
   i+j+2+6*t=m.a+m.b-1 ∧ i+j+8  ≤  m.a+m.b-1 ∧ m.a+5  ≤  i+j+2 ∧
   InPolygon m.a m.b i (j+2) ∧ InPolygon m.a m.b (i+1) (j+1) ∧
   InPolygon m.a m.b (i+2) j ∧
   ¬DiagonalMiddleMF1E m.a m.b i j ∧ ¬DiagonalRegionMAC3 m.a m.b i j ∧
   ¬DiagonalVarianceMAC3 m.a m.b i j ∧ DiagonalSharpM37B m.a m.b i j ∧
   coeff m.p i (j+2)*coeff m.p (i+2) j  ≤  coeff m.p (i+1) (j+1)^2 := by
 let n := 6*t^2+2*t-1
 let path := List.replicate n true++[false,false]
 let i := 18*t^2+3*t-2
 let j := i
 have htt : t  ≤  t^2 := by nlinarith
 have hn : n+1=6*t^2+2*t := by dsimp [n]; omega
 have hi : i+2=18*t^2+3*t := by dsimp [i]; omega
 obtain ⟨ha,hb⟩ := right_left_left_labelsM37B n
 change (frame path).mid.a=3*n+1 at ha
 change (frame path).mid.b=3*n+4 at hb
 have heq : i+j+2+6*t=(frame path).mid.a+(frame path).mid.b-1 := by
   rw [ha,hb]; dsimp [j]; omega
 have hr : 2*(6*t)  ≤  (frame path).mid.a+(frame path).mid.b-1 := by
   rw [ha,hb]; omega
 have eH : (frame path).mid.a+(frame path).mid.b-1-2*(6*t)+2=36*t^2 := by
   rw [ha,hb]; omega
 have eN : (frame path).mid.a+(frame path).mid.b-1-2*(6*t)+2=(6*t)^2 := by
   rw [eH]; ring
 have hri : 6*t ≤ i := by omega
 have eA : i-6*t+2+3*t=18*t^2 := by omega
 have hab : (frame path).mid.a ≤ (frame path).mid.b := by rw [ha,hb]; omega
 have hlo : (frame path).mid.b ≤ i+j+2 := by rw [hb]; dsimp [j]; omega
 have hhigh : i+j+2 ≤ (frame path).mid.a+(frame path).mid.b-1 := by omega
 have hs : DiagonalSharpM37B (frame path).mid.a (frame path).mid.b i j := by
   refine ⟨6*t,heq,hr,?_⟩
   have eni : (((frame path).mid.a+(frame path).mid.b-1-2*(6*t):ℕ):ℝ)=36*(t:ℝ)^2-2 := by
     have hh : (((frame path).mid.a+(frame path).mid.b-1-2*(6*t):ℕ):ℝ)+2=36*(t:ℝ)^2 := by exact_mod_cast eH
     linarith
   have eir : (i:ℝ)=18*(t:ℝ)^2+3*t-2 := by
     have hh : (i:ℝ)+2=18*(t:ℝ)^2+3*t := by exact_mod_cast hi
     linarith
   dsimp [SharpRegionM37B]
   push_cast
   rw [eni,eir]
   ring_nf
 have hold : ¬DiagonalMiddleMF1E (frame path).mid.a (frame path).mid.b i j := by
   intro ⟨r,he,h1,h2⟩
   have er : r=6*t := by omega
   subst r
   nlinarith
 have hv : ¬DiagonalVarianceMAC3 (frame path).mid.a (frame path).mid.b i j := by
   intro ⟨r,he,h1,h2,hg⟩
   have er : r=6*t := by omega
   subst r
   rw [eH] at hg
   change 36*t^2*(6*t)^2  ≤  4*(i-6*t+2)*(i-6*t+2) at hg
   nlinarith [sq_nonneg (i-6*t+2:ℤ)]
 have hp : ¬DiagonalRegionMAC3 (frame path).mid.a (frame path).mid.b i j := by
   intro ⟨r,he,h1,h2,hg⟩
   have er : r=6*t := by omega
   subst r
   rw [eH] at hg
   change (6*t)*(6*t-1)*(36*t^2)  ≤  2*(i-6*t+2)*(i-6*t+2) at hg
   have he : 6*t-1+1=6*t := by omega
   nlinarith [sq_nonneg (i-6*t+2:ℤ)]
 refine ⟨path,i,j,?_,?_,heq,?_,?_,?_,?_,?_,hold,hp,hv,hs,
   source_diagonal_sharpM37B path i j hs⟩
 · rw [ha]; omega
 · rw [ha,hb]; omega
 · omega
 · rw [ha]; dsimp [j]; omega
 · exact polygon_of_totalMF1E _ _ _ _ hab (by omega) (by omega)
 · exact polygon_of_totalMF1E _ _ _ _ hab (by omega) (by omega)
 · exact polygon_of_totalMF1E _ _ _ _ hab (by omega) (by omega)

end
end MathGKM.Markov
