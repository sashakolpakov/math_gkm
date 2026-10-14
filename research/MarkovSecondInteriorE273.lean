import MarkovShapeBridgeE273
/-! Machine-authored e27336bc. Raw-source second-slice inequalities for
arbitrary run length, in both open polynomial-shape regions. -/
namespace MathGKM.Markov
noncomputable section

theorem source_second_lower_interiorE273 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+2)
 (hj : 3≤j) (hn : j+2≤n) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h0 := source_second_lower_shapeE273 n rest i (j+2) (by omega) (by omega) hn
 have h1 := source_second_lower_shapeE273 n rest (i+1) (j+1) (by omega) (by omega) (by omega)
 have h2 := source_second_lower_shapeE273 n rest (i+2) j (by omega) hj (by omega)
 obtain ⟨hr,hc,_⟩ := frame_reduced rest
 have hl := lowerShape_lc446 (n:ℤ) (frame rest).mid.b (frame rest).mid.a ((j:ℤ)+1)
   (by exact_mod_cast hr) (by exact_mod_cast hc) (by omega) (by exact_mod_cast hn)
 have he : (j:ℤ)+1+1=(j+2:ℕ) := by push_cast; ring
 simp only [add_sub_cancel_right,he] at hl
 have hcast : ((j+1:ℕ):ℤ)=(j:ℤ)+1 := by push_cast; rfl
 rw [← hcast,← h0,← h1,← h2] at hl
 nlinarith

theorem source_second_upper_interiorE273 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+2)
 (hj : n+3≤j) (hn : j+2≤2*n+2) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h0 := source_second_upper_shapeE273 n rest i (j+2) (by omega) (by omega) hn
 have h1 := source_second_upper_shapeE273 n rest (i+1) (j+1) (by omega) (by omega) (by omega)
 have h2 := source_second_upper_shapeE273 n rest (i+2) j (by omega) hj (by omega)
 obtain ⟨hr,hc,_⟩ := frame_reduced rest
 have hl := upperShape_lc446 (frame rest).mid.b (frame rest).mid.a (2*(n:ℤ)+2-(j+1))
   (by exact_mod_cast hr) (by exact_mod_cast hc) (by omega)
 have he0 : 2*(n:ℤ)+2-(j+1)-1=2*(n:ℤ)+2-(j+2:ℕ) := by push_cast; ring
 have he1 : 2*(n:ℤ)+2-(j+1)=2*(n:ℤ)+2-(j+1:ℕ) := by push_cast; rfl
 have he2 : 2*(n:ℤ)+2-(j+1)+1=2*(n:ℤ)+2-j := by ring
 rw [he0,he2,he1] at hl
 have hscaled := mul_le_mul_of_nonneg_left hl (show (0:ℤ)≤64 by norm_num)
 have hp0 := congrArg₂ (fun x y : ℤ => x*y) h0 h2
 have hp1 := congrArg (fun z : ℤ => z^2) h1
 nlinarith only [hscaled,hp0,hp1]

#print axioms source_second_lower_interiorE273
#print axioms source_second_upper_interiorE273
end
end MathGKM.Markov
