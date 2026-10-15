import MarkovLinearBlockCC
import MarkovShiftShapeCC
/-! Machine-authored cc599cf1. Raw coefficient shape inside the first shifted block. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
attribute [local irreducible] fourthNumeratorBC fourthShiftCC shiftPolyCC

theorem convSeven_shiftCC (P : ℤ[X]) (n j : ℕ) :
 convSevenK0B (X^n*P) (n+j)=convSevenK0B P j := by
 unfold convSevenK0B
 rw [show n+j+1=n+(j+1) by omega,Finset.sum_range_add]
 have hz : ∑ k ∈ Finset.range n, (X^n*P).coeff k*
     ((7+(n+j-k)).choose 7:ℤ)=0 := by
   apply Finset.sum_eq_zero
   intro k hk
   rw [coeff_X_pow_mul',if_neg (by have := Finset.mem_range.mp hk; omega),zero_mul]
 rw [hz,zero_add]
 apply Finset.sum_congr rfl
 intro k hk
 rw [show n+k=k+n by omega,coeff_X_pow_mul]
 rw [show n+j-(k+n)=j-k by omega]

theorem source_fourth_block_shapeCC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i k : ℕ)
 (hs : i+(n+k)=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hk : 5≤k) (hkn : k<n) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (n+k)=
 fourthShapeK0B (frame rest).mid.b ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) (n+k)+
 shiftShapeCC n (frame rest).mid.b (frame rest).mid.a k := by
 have he := source_fourth_blockCC n rest hc i (n+k) hs (by omega)
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
