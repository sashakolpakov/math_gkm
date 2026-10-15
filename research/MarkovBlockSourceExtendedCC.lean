import MarkovBlockSourceCC
import MarkovBlockExtendedCC
/-! Machine-authored cc599cf1. Extended raw block shape. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
theorem source_fourth_block_shape_extendedCC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i k : ℕ)
 (hs : i+(n+k)=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hk : 5≤k) (hkn : k<n+3) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (n+k)=
 fourthShapeK0B (frame rest).mid.b ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) (n+k)+
 shiftShapeCC n (frame rest).mid.b (frame rest).mid.a k := by
 have he := source_fourth_block_extendedCC n rest hc i (n+k) hs (by omega)
 rw [convSeven_addK0B,convSeven_shiftCC,fourthShift_polyCC] at he
 have hnC : (n:ℤ[X])=C (n:ℤ) := by simp
 have hcC : ((frame rest).mid.b:ℤ[X])=C ((frame rest).mid.b:ℤ) := by simp
 have hrC : ((frame rest).mid.a:ℤ[X])=C ((frame rest).mid.a:ℤ) := by simp
 rw [hnC,hcC,hrC] at he
 have h0 := fourthShape_convolutionK0B ((frame rest).mid.b:ℤ)
   ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) (n+k) (by omega)
 have h1 := shiftShape_convolutionCC (n:ℤ) (frame rest).mid.b (frame rest).mid.a k hk
 push_cast at h0
 linear_combination 315*he+h0+h1
end
end MathGKM.Markov
