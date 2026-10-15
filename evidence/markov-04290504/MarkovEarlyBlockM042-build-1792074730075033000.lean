import MarkovBlockSourceExtendedCC
/-! Machine-authored 04290504. Early shifted coefficients with exact truncated convolution. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
def earlyBlockValueM042 (n c r : ℤ) (k : ℕ) : ℤ :=
 fourthShapeK0B c (n*c+r) (n+k)+
 315*convSevenK0B (shiftPolyCC (C n) (C c) (C r) X) k

theorem source_fourth_early_shapeM042 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i k : ℕ)
 (hs : i+(n+k)=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hk : 5≤n+k) (hkn : k<n+3) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (n+k)=
 earlyBlockValueM042 n (frame rest).mid.b (frame rest).mid.a k := by
 have he := source_fourth_block_extendedCC n rest hc i (n+k) hs (by omega)
 rw [convSeven_addK0B,convSeven_shiftCC,fourthShift_polyCC] at he
 have hnC : (n:ℤ[X])=C (n:ℤ) := by simp
 have hcC : ((frame rest).mid.b:ℤ[X])=C ((frame rest).mid.b:ℤ) := by simp
 have hrC : ((frame rest).mid.a:ℤ[X])=C ((frame rest).mid.a:ℤ) := by simp
 rw [hnC,hcC,hrC] at he
 have h0 := fourthShape_convolutionK0B ((frame rest).mid.b:ℤ)
   ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) (n+k) hk
 push_cast at h0
 unfold earlyBlockValueM042
 linear_combination 315*he+h0

theorem earlyBlockValue_eqM042 (n c r : ℤ) (k : ℕ) (hk : 5≤k) :
 earlyBlockValueM042 n c r k=
 fourthShapeK0B c (n*c+r) (n+k)+shiftShapeCC n c r k := by
 unfold earlyBlockValueM042
 rw [shiftShape_convolutionCC n c r k hk]
end
end MathGKM.Markov
