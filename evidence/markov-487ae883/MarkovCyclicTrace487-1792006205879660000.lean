import MarkovCutPartitionA27
import MarkovVerticalSource025
/-! Machine-authored request 487ae883. Cyclic ambient trace and source
coefficient bridge. No log-concavity premise is silently assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem sourceMatrix_exact_word487 (path : List Bool) :
 sourceMatrix025 path=rawWord80 (sourceWord28 path) := by
 have h := rawWord_pairs80 path ([false],[true])
 simp only [rawWord80,Bool.false_eq_true,if_false,if_true,mm_one_right774] at h
 unfold sourceMatrix025
 rw [← h]
 exact (rawWord_append80 _ _).symm

theorem source_ambient_trace487 (path : List Bool) :
 tr16 (ambientWord5c U V (sourceWord28 path)) =
 (1+U*(1+V))*ambientScalar5c U V (central28 path) := by
 have hg := gauge_word5c (sourceWord28 path)
 obtain ⟨hc,hl⟩ := source_word_counts28 path
 rw [hc] at hg
 have ht := congrArg horizontalShear5c (sourceMatrix_trace025 path)
 rw [sourceMatrix_exact_word487] at ht
 have hp : (rawWord80 (sourceWord28 path)).b=(frame path).mid.p :=
   (source_word_exact3eda path).symm
 rw [hp,map_mul,source_ambient_identity5c] at ht
 have hs : horizontalShear5c S=1+U*(1+V) := by
   simp [S,map_add,horizontalShear_U5c,horizontalShear_V5c]; ring
 rw [hs] at ht
 change horizontalShear5c ((rawWord80 (sourceWord28 path)).a+
   (rawWord80 (sourceWord28 path)).d)=_ at ht
 rw [map_add,hg.1,hg.2.2.2] at ht
 have hz : (U^(frame path).mid.a : BiPoly)≠0 :=
   pow_ne_zero _ (show (U:BiPoly)≠0 from Polynomial.X_ne_zero)
 apply (mul_left_cancel₀ hz)
 change U^(frame path).mid.a*
   ((ambientWord5c U V (sourceWord28 path)).a+(ambientWord5c U V (sourceWord28 path)).d)=
   U^(frame path).mid.a*((1+U*(1+V))*ambientScalar5c U V (central28 path))
 linear_combination ht

theorem ambient_scalar_zero487 (w : List Bool) :
 (ambientScalar5c U V w).coeff 0=1 := by
 rw [← cutEval_scalarA27]
 have h := cutCoeff_polynomialA27 (X : ℤ[X]) X 1 (w++[true]) 0
 simpa [U,V,cutCoeff_zeroA27] using h

theorem source_first_cut_trace487 (path : List Bool) :
 (tr16 (ambientWord5c U V (sourceWord28 path))).coeff 1 =
 cutCoeffA27 (X : ℤ[X]) X 1 (central28 path++[true]) 1 + (1+X) := by
 rw [source_ambient_trace487]
 have h := cutCoeff_polynomialA27 (X : ℤ[X]) X 1 (central28 path++[true]) 1
 simp only [map_one] at h
 rw [cutEval_scalarA27] at h
 change (ambientScalar5c U V (central28 path)).coeff 1=_ at h
 have he : (1+U*(1+V))*ambientScalar5c U V (central28 path)=
   ambientScalar5c U V (central28 path)+
   U*(C (1+X)*ambientScalar5c U V (central28 path)) := by
   simp [V]; ring
 rw [he,Polynomial.coeff_add]
 change (ambientScalar5c U V (central28 path)).coeff 1+
   (1+X)*(ambientScalar5c U V (central28 path)).coeff 0=_
 rw [h,ambient_scalar_zero487,mul_one]

#print axioms source_ambient_trace487
#print axioms source_first_cut_trace487
end
end MathGKM.Markov
