import MarkovShapeLCBDEE
import MarkovThirdCorrectionSupport8BBB
/-! Machine-authored request bdee9a64. Conditional bridge for the unproved
uniform interior coefficient formula. This premise is not an axiom or a theorem. -/
namespace MathGKM.Markov
noncomputable section

def ThirdInteriorFormulaBDEE (n c r : ℕ) : Prop :=
 ∀ j : ℕ, 4≤j → j≤n → thirdShapeBDEE n c r j=
   15*(thirdRunPolyADB2 n c r).coeff j

theorem source_third_interior_of_formulaBDEE (n : ℕ) (rest : List Bool)
 (hf : ThirdInteriorFormulaBDEE n (frame rest).mid.b (frame rest).mid.a)
 (i j : ℕ) (hj : 4≤j) (hn : j+2≤n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have h := thirdShape_lcBDEE n (frame rest).mid.b (frame rest).mid.a (j+1)
   (by exact_mod_cast hr) (by exact_mod_cast hrc) (by omega) (by omega)
 have h0 := hf j hj (by omega)
 have h1 := hf (j+1) (by omega) (by omega)
 have h2 := hf (j+2) (by omega) hn
 have hc : ∀ k≤n,k<(frame rest).mid.b*(n+1)+(frame rest).mid.a := by
   intro k hk
   have hm := Nat.mul_le_mul_right (n+1) (show 1≤(frame rest).mid.b by omega)
   simp only [Nat.one_mul] at hm
   omega
 rw [←correctedThird_coeff_below8BBB _ _ _ j (hc j (by omega)),
   ←source_third_all_cycles_raw8BBB n rest (i+2) j (by omega)] at h0
 rw [←correctedThird_coeff_below8BBB _ _ _ (j+1) (hc (j+1) (by omega)),
   ←source_third_all_cycles_raw8BBB n rest (i+1) (j+1) (by omega)] at h1
 rw [←correctedThird_coeff_below8BBB _ _ _ (j+2) (hc (j+2) hn),
   ←source_third_all_cycles_raw8BBB n rest i (j+2) (by omega)] at h2
 have he0 : (j+1:ℤ)-1=(j:ℕ) := by omega
 have he2 : (j+1:ℤ)+1=((j+2:ℕ):ℤ) := by omega
 rw [he0,he2] at h
 rw [h0,h1,h2] at h
 nlinarith only [h]

#print axioms source_third_interior_of_formulaBDEE
end
end MathGKM.Markov
