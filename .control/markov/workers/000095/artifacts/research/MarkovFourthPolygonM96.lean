import MarkovRunRecurrenceBF
/-! Machine-authored 96dea62b. Exact lower-slice polygon arithmetic; no coefficient claim. -/
namespace MathGKM.Markov
noncomputable section
theorem lower_slice_polygon_iffM96 (a c d i j : ℕ)
 (hd : d+1≤a+c) (hs : i+j=a+d) :
 InPolygon a (a+c) i j ↔ c*j≤d*(a+c) := by
 have he : (a+c)*i+a*j+c*j=a*(a+c)+d*(a+c) := by
   nlinarith [congrArg (fun t : ℕ => (a+c)*t) hs]
 unfold InPolygon
 constructor
 · intro h
   omega
 · intro h
   constructor
   · omega
   · omega

theorem lower_slice_polygon_boundM96 (a c d i j : ℕ)
 (hs : i+j=a+d) (hp : InPolygon a (a+c) i j) :
 c*j≤d*(a+c) := by
 have he : (a+c)*i+a*j+c*j=a*(a+c)+d*(a+c) := by
   nlinarith [congrArg (fun t : ℕ => (a+c)*t) hs]
 have h := hp.1
 omega

theorem source_fourth_polygon_boundM96 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hp : InPolygon (frame (List.replicate n true++false::rest)).mid.a
   (frame (List.replicate n true++false::rest)).mid.b i (j+2)) :
 j≤4*n+5 := by
 obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
 rw [ha] at hs
 rw [ha,hb] at hp
 have hsum : i+(j+2)=(frame rest).mid.b*n+(frame rest).mid.a+4 := by omega
 have he : (frame rest).mid.b*(n+1)+(frame rest).mid.a=
   (frame rest).mid.b*n+(frame rest).mid.a+(frame rest).mid.b := by ring
 rw [he] at hp
 have h := lower_slice_polygon_boundM96 _ (frame rest).mid.b 4 i (j+2) hsum hp
 have hr := (frame_reduced rest).2.1
 have ht : (frame rest).mid.b*(j+2)<(frame rest).mid.b*(4*n+8) := by
   nlinarith
 have hj : j+2<4*n+8 := Nat.lt_of_mul_lt_mul_left ht
 omega
end
end MathGKM.Markov
