import MarkovResidualM3A1
/-! Machine-authored 3a11314d. Unbounded witnesses in the previous residual. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
def centralPathM3A1 (n : ℕ) : List Bool := List.replicate (n+4) false++[true]

theorem central_path_labelsM3A1 (n : ℕ) :
 (frame (centralPathM3A1 n)).mid.a=2 ∧
 (frame (centralPathM3A1 n)).mid.b=2*(n+5)+1 := by
 rw [centralPathM3A1,frame_append18,spine_frame6]
 simp only [advance,if_true]
 constructor <;> omega

theorem central_previous_guardsM3A1 (n : ℕ) :
 let m := (frame (centralPathM3A1 n)).mid
 2 ≤ m.a ∧ InPolygon m.a m.b 2 (n+5) ∧ InPolygon m.a m.b 3 (n+5) ∧
 InPolygon m.a m.b 4 (n+5) ∧ 2+(n+5)+4 ≤ m.a+m.b-1 ∧ 5 ≤ n+5 ∧
 ¬HorizontalMiddleMF1E m.a m.b 2 (n+5) ∧
 ¬(HorizontalRegionMAC3 m.a m.b 2 (n+5) ∨
   HorizontalVarianceMAC3 m.a m.b 2 (n+5)) ∧
 ¬HorizontalSharpM37B m.a m.b 2 (n+5) := by
 dsimp only
 obtain ⟨ha,hb⟩ := central_path_labelsM3A1 n
 obtain ⟨h0,h1,h2⟩ := source_two_central_polygonM3A1 (centralPathM3A1 n) (n+5) ha hb (by omega)
 refine ⟨by omega,h0,h1,h2,by omega,by omega,?_,?_,?_⟩
 · rw [ha,hb]
   unfold HorizontalMiddleMF1E
   omega
 · rw [ha,hb]
   unfold HorizontalRegionMAC3 HorizontalVarianceMAC3 MixtureRegionMAC3 VarianceRegionMAC3
   omega
 · rw [ha,hb]
   unfold HorizontalSharpM37B SharpRegionM37B
   have hdiv : 2*(n+5)/(2*(n+5)+1)=0 := Nat.div_eq_of_lt (by omega)
   have he : 2*(n+5)+1-2*(n+5)-1=0 := by omega
   rw [hdiv,he]
   norm_num
   push_cast
   nlinarith [sq_nonneg (4-(2+((n:ℝ)+5))-2+3)]

theorem central_family_rawM3A1 (n : ℕ) :
 let p := (frame (centralPathM3A1 n)).mid.p
 coeff p 2 (n+5)*coeff p 4 (n+5)≤coeff p 3 (n+5)^2 := by
 obtain ⟨ha,hb⟩ := central_path_labelsM3A1 n
 exact source_two_centralM3A1 _ _ ha hb

end
end MathGKM.Markov
