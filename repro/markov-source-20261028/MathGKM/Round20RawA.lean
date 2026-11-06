/- Machine-authored round-20 exact raw-layer selector candidate.
Copied from the retained extraction argument without changing its definition.
Uncompiled locally; independent checking is required. -/
import MathGKM.Markov
open MathGKM.Markov
noncomputable section
namespace ClearedLayersR20
def rawLayer (P : BiPoly) (d r : ℕ) : BiPoly :=
  P.support.sum (fun i => Polynomial.monomial i ((P.coeff i).support.sum
    (fun j => Polynomial.monomial j (if i+j+r=d then coeff P i j else 0))))

theorem rawLayer_coeff (P : BiPoly) (d r i j : ℕ) :
    coeff (rawLayer P d r) i j = if i+j+r=d then coeff P i j else 0 := by
  classical
  dsimp [rawLayer,coeff]
  simp only [Polynomial.finsetSum_coeff,Polynomial.coeff_monomial]
  rw [Finset.sum_eq_single i]
  · simp only [ite_true,Polynomial.finsetSum_coeff,Polynomial.coeff_monomial]
    rw [Finset.sum_eq_single j]
    · simp
    · intro k hk hkj
      simp [hkj]
    · intro hj
      have hz : (P.coeff i).coeff j=0 := by
        simpa only [Polynomial.mem_support_iff,not_not] using hj
      simp [hz]
  · intro k hk hki
    simp [hki]
  · intro hi
    have hz : P.coeff i=0 := by
      simpa only [Polynomial.mem_support_iff,not_not] using hi
    simp [hz]


theorem rawLayer_homogeneous (P : BiPoly) (d r i j : ℕ)
    (h : coeff (rawLayer P d r) i j≠0) : i+j+r=d := by
  rw [rawLayer_coeff] at h
  by_contra hn
  simp [hn] at h

end ClearedLayersR20
