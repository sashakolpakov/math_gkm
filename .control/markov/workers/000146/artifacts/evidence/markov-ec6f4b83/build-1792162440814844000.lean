import MarkovUpperRatiosMEC6
import MarkovUpperCoreM2B3
/-! Machine-authored ec6f4b83. Guarded upper-core cross inequalities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem upper_core_nonnegMEC6 (N i h : ℕ) : 0 ≤ upperCoreM2B3 N i h := by
 unfold upperCoreM2B3
 positivity

theorem upper_Hden_posMEC6 (i h : ℤ) (hi : 2 ≤ i) (hh : h ≤ i) :
 0 < upperHDenM2B3 i h := by
 unfold upperHDenM2B3
 exact mul_pos (mul_pos (by omega) (by omega)) (by omega)

theorem upper_Dden_posMEC6 (N i h : ℤ) (hi : 2 ≤ i) (hh : h ≤ i) (hN : i ≤ N+1) :
 0 < upperDDenM2B3 N i h := by
 unfold upperDDenM2B3
 exact mul_pos (mul_pos (by omega) (by omega)) (by omega)

theorem upper_core_HstepMEC6 (N i h : ℕ) (hi : 2 ≤ i) (hh : h ≤ i) (hN : i+1 ≤ N+2) :
 upperHDenM2B3 i h*upperCoreM2B3 N (i+1) h =
 upperHNumM2B3 N i h*upperCoreM2B3 N i h :=
 upper_core_stepM2B3 N i h hi hh hN

theorem upper_core_DstepMEC6 (N i h : ℕ) (hi : 2 ≤ i) (hh : h ≤ i) (hN : i+1 ≤ N+2) :
 upperDDenM2B3 N i h*upperCoreM2B3 N (i+1) (h+1) =
 upperDNumM2B3 N i h*upperCoreM2B3 N i h :=
 upper_core_diagonalM2B3 N i h hi hh hN

theorem upper_core_orderedMEC6 (N i h k : ℕ) (hi : 2 ≤ i)
 (hk : k ≤ h) (hh : h ≤ i) (hN : i ≤ N) :
 upperCoreM2B3 N i h*upperCoreM2B3 N (i+2) k ≤
 upperCoreM2B3 N (i+1) h*upperCoreM2B3 N (i+1) k := by
 have h1 := upper_core_HstepMEC6 N i h hi hh (by omega)
 have h2 := upper_core_HstepMEC6 N (i+1) k (by omega) (by omega) (by omega)
 have hg := upper_HgapMEC6 N i h k (by omega) (by omega) (by omega) (by omega) (by omega)
 unfold upperHGapM2B3 at hg
 have hd1 := upper_Hden_posMEC6 i h (by omega) (by omega)
 have hd2 := upper_Hden_posMEC6 (i+1) k (by omega) (by omega)
 push_cast at h2
 exact ratio_crossMEC6 _ _ _ _ _ _ _ _ (upper_core_nonnegMEC6 _ _ _)
   (upper_core_nonnegMEC6 _ _ _) hd1 hd2 h1 (by convert h2 using 1 <;> congr 2 <;> omega) (by omega)

theorem upper_core_localMEC6 (N i h : ℕ) (hi : 2 ≤ i)
 (hh : h ≤ i) (hN : i ≤ N) :
 upperCoreM2B3 N i h*upperCoreM2B3 N (i+2) (h+1) ≤
 upperCoreM2B3 N (i+1) h*upperCoreM2B3 N (i+1) (h+1) := by
 have h1 := upper_core_HstepMEC6 N i h hi hh (by omega)
 have h2 := upper_core_HstepMEC6 N (i+1) (h+1) (by omega) (by omega) (by omega)
 have hg := upper_LgapMEC6 N i h (by omega) (by omega) (by omega) (by omega)
 unfold upperLGapM2B3 at hg
 have hd1 := upper_Hden_posMEC6 i h (by omega) (by omega)
 have hd2 := upper_Hden_posMEC6 (i+1) (h+1) (by omega) (by omega)
 push_cast at h2
 exact ratio_crossMEC6 _ _ _ _ _ _ _ _ (upper_core_nonnegMEC6 _ _ _)
   (upper_core_nonnegMEC6 _ _ _) hd1 hd2 h1 (by convert h2 using 1 <;> congr 2 <;> omega) (by omega)

theorem upper_core_separatedMEC6 (N i h k : ℕ) (hi : 2 ≤ i)
 (hh : h ≤ i) (hk : h+2 ≤ k) (hki : k ≤ i+2) (hN : i ≤ N) :
 upperCoreM2B3 N i h*upperCoreM2B3 N (i+2) k ≤
 upperCoreM2B3 N (i+1) (h+1)*upperCoreM2B3 N (i+1) (k-1) := by
 have h1 := upper_core_DstepMEC6 N i h hi hh (by omega)
 have h2 := upper_core_DstepMEC6 N (i+1) (k-1) (by omega) (by omega) (by omega)
 have hg := upper_DgapMEC6 N i h (k-1) (by omega) (by omega) (by omega) (by omega) (by omega)
 unfold upperDGapM2B3 at hg
 have hd1 := upper_Dden_posMEC6 N i h (by omega) (by omega) (by omega)
 have hd2 := upper_Dden_posMEC6 N (i+1) (k-1) (by omega) (by omega) (by omega)
 rw [Nat.cast_sub (by omega : 1 ≤ k)] at h2
 push_cast at h2
 exact ratio_crossMEC6 _ _ _ _ _ _ _ _ (upper_core_nonnegMEC6 _ _ _)
   (upper_core_nonnegMEC6 _ _ _) hd1 hd2 h1 (by convert h2 using 1 <;> congr 2 <;> omega) (by omega)

end
end MathGKM.Markov
