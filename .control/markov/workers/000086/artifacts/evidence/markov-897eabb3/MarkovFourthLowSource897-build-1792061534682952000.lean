import MarkovFourthChambers897
import MarkovDiagonalCore8833
/-! Machine-authored 897eabb3. Unconditional fourth lower diagonal for
every low-slope source, with small cycles and polygon boundaries retained. -/
namespace MathGKM.Markov
noncomputable section

theorem reduced_chamber_boundary897 (c r k l : ℕ) (hc : 5≤c)
 (hk : 0<k) (hk4 : k≤4) (hcop : Nat.Coprime r c) : k*r≠l*c := by
 intro h
 have hd : c∣k := hcop.symm.dvd_of_dvd_mul_right (by rw [h]; exact dvd_mul_left c l)
 have hh := Nat.le_of_dvd hk hd
 omega

theorem source_false_fourth_large897 (rest : List Bool) (hc : 5≤(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_chamber_0897 rest hc (by omega) (by omega) i j hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_chamber_1897 rest hc (by omega) (by omega) i j hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_chamber_2897 rest hc (by omega) (by omega) i j hs
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · exact source_fourth_chamber_3897 rest hc (by omega) (by omega) i j hs
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · exact source_fourth_chamber_4897 rest hc (by omega) (by omega) i j hs
 · exact source_fourth_chamber_5897 rest hc (by omega) (by omega) i j hs

theorem source_false_fourth897 (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4)
 (h0 : InPolygon (frame (false::rest)).mid.a (frame (false::rest)).mid.b i (j+2)) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hc : 5≤(frame rest).mid.b
 · exact source_false_fourth_large897 rest hc i j hs
 have hi := source_run_indicesBF 0 rest
 simp only [List.replicate_zero,List.nil_append,Nat.mul_zero,Nat.zero_add,Nat.mul_one] at hi
 obtain ⟨ha,hb⟩ := hi
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have hp := h0.2
 exact first_six_raw05ef (false::rest)
   ((frame (false::rest)).mid.a+(frame (false::rest)).mid.b-1-(i+j+2))
   i j (by omega) (by omega)

theorem source_fourth_lower_low897 (path : List Bool) (i j : ℕ)
 (hratio : 2*(frame path).mid.a≤(frame path).mid.b)
 (hs : i+j+2=(frame path).mid.a+4)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 rcases split_first_false487 path with ⟨n,hp⟩ | ⟨n,rest,hp⟩
 · subst path
   rw [(right_labels650 n).1,(right_labels650 n).2] at h0 h1 h2
   exact right_raw_diagonal0618 n i j h0 h1 h2
 · subst path
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hr,hc,_⟩ := frame_reduced rest
   have hn : n=0 := by
     by_contra hn
     have hm := Nat.mul_le_mul_left (frame rest).mid.b (show 1≤n by omega)
     simp only [Nat.mul_add,Nat.mul_one] at ha hb hm
     omega
   subst n
   simpa using source_false_fourth897 rest i j hs h0

end
end MathGKM.Markov
