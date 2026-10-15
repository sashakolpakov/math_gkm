import MarkovThreeBandsSource53D
/-! Machine-authored 53d5229e. Polygon bound for the two remaining terminal triples. -/
namespace MathGKM.Markov
theorem third_polygon_bound53D (n c r i j : ℕ) (hc : 0 < c) (hr : r < c)
 (hs : i+j+2=c*n+r+3)
 (hp : InPolygon (c*n+r) (c*(n+1)+r) i (j+2)) : j ≤ 3*n+3 := by
 have hp' := hp.1
 have hm := congrArg (fun t : ℕ => (c*(n+1)+r)*t) hs
 by_contra h
 have hj : 3*n+6 ≤ j+2 := by omega
 have hg := Nat.mul_le_mul_left c hj
 nlinarith

theorem source_third_remaining_terminal53D (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3)
 (hp : InPolygon (frame (List.replicate n true++false::rest)).mid.a
   (frame (List.replicate n true++false::rest)).mid.b i (j+2))
 (hj : 3*n+1 < j) : j=3*n+2 ∨ j=3*n+3 := by
 obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 rw [ha] at hs
 rw [ha,hb] at hp
 have hh := third_polygon_bound53D n (frame rest).mid.b (frame rest).mid.a i j
   (by omega) hrc hs hp
 omega
#print axioms source_third_remaining_terminal53D
end MathGKM.Markov
