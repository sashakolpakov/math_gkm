import MarkovSecondRunBF
/-! Machine-authored bf38fa19. Universal second cyclic coefficient with adjacency. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def runMatrixBF (ns : List ℕ) : Mat16 BiPoly :=
 ambientWord5c U V (ns.flatMap lowerRun487)
def runHsumBF (ns : List ℕ) : ℤ[X] := (ns.map lowerH487).sum
def runLastBF : List ℕ → ℤ[X]
 | [] => 0
 | [n] => runBf (lowerMatrix487 n)
 | _::m::ns => runLastBF (m::ns)
def runScoreBF : List ℕ → ℤ[X]
 | [] => 0
 | [n] => runKBF (lowerMatrix487 n)
 | n::m::ns => runKBF (lowerMatrix487 n)+runScoreBF (m::ns)+
     lowerH487 n*runHsumBF (m::ns)+
     runBf (lowerMatrix487 n)*runLBF (lowerMatrix487 m)

theorem runH_oneBF (n : ℕ) : lowerJet487 (lowerMatrix487 n)=lowerH487 n := by
 obtain ⟨_,_,hc,_,_,_,hh⟩ := lowerMatrix_jets487 n
 simpa [lowerJet487,hc] using hh

theorem runMatrix_consBF (n : ℕ) (ns : List ℕ) :
 runMatrixBF (n::ns)=mm16 (lowerMatrix487 n) (runMatrixBF ns) := by
 simp [runMatrixBF,lowerMatrix487,ambient_word_appendB5]

theorem run_summaryBF (n : ℕ) (ns : List ℕ) :
 runKBF (runMatrixBF (n::ns))=runScoreBF (n::ns) ∧
 runLBF (runMatrixBF (n::ns))=runLBF (lowerMatrix487 n) ∧
 runBf (runMatrixBF (n::ns))=runLastBF (n::ns) ∧
 (ns≠[] → runDeltaBF (runMatrixBF (n::ns))=0) := by
 induction ns generalizing n with
 | nil => simp [runMatrixBF,lowerMatrix487,runScoreBF,runLastBF]
 | cons m ms ih =>
   obtain ⟨hk,hl,hb,hd⟩ := ih m
   have ht := lowerShape_word487 (m::ms) (by simp)
   change LowerShape487 (runMatrixBF (m::ms)) ∧
     lowerJet487 (runMatrixBF (m::ms))=runHsumBF (m::ms) at ht
   obtain ⟨hb',hd',he',hk',_⟩ := second_run_mulBF (lowerMatrix487 n)
     (runMatrixBF (m::ms)) (lowerShape_run487 n) ht.1
   rw [runMatrix_consBF]
   refine ⟨?_,?_,?_,?_⟩
   · rw [hk',hk,hl,ht.2,runH_oneBF]
     rfl
   · unfold runLBF
     rw [he',hd',add_zero]
     rfl
   · rw [hb',hb]; rfl
   · intro _; exact hd'

theorem run_trace_secondBF (n m k : ℕ) (ns : List ℕ) :
 (tr16 (runMatrixBF (n::m::k::ns))).coeff 2=
 runScoreBF (n::m::k::ns)+runLBF (lowerMatrix487 n)*runLastBF (n::m::k::ns) := by
 have hs := run_summaryBF n (m::k::ns)
 have ht := run_summaryBF m (k::ns)
 have htshape := (lowerShape_word487 (m::k::ns) (by simp)).1
 have h := second_run_mulBF (lowerMatrix487 n) (runMatrixBF (m::k::ns))
   (lowerShape_run487 n) htshape
 have he : (runMatrixBF (m::k::ns)).a.coeff 1=runBf (runMatrixBF (m::k::ns)) := by
   have hd := ht.2.2.2 (by simp)
   unfold runDeltaBF runBf at *
   linear_combination hd
 rw [runMatrix_consBF] at hs ⊢
 rw [h.2.2.2.2,hs.1,he,ht.2.2.1]
 change _=runScoreBF (n::m::k::ns)+runLBF (lowerMatrix487 n)*runLastBF (m::k::ns)
 unfold runLBF
 ring

theorem run_trace_two_blocksBF (n m : ℕ) :
 (tr16 (runMatrixBF [n,m])).coeff 2=
 runScoreBF [n,m]+runLBF (lowerMatrix487 n)*runBf (lowerMatrix487 m)+
 runDeltaBF (lowerMatrix487 n)*runDeltaBF (lowerMatrix487 m) := by
 have h := second_run_mulBF (lowerMatrix487 n) (lowerMatrix487 m)
   (lowerShape_run487 n) (lowerShape_run487 m)
 have he : runMatrixBF [n,m]=mm16 (lowerMatrix487 n) (lowerMatrix487 m) := by
   simp [runMatrixBF,lowerMatrix487,ambient_word_appendB5]
 have hs := (run_summaryBF n [m]).1
 rw [he] at hs ⊢
 rw [h.2.2.2.2,hs]
 simp only [runLBF,runDeltaBF,runBf]
 ring

theorem source_second_cut_traceBF (path : List Bool) :
 (tr16 (ambientWord5c U V (sourceWord28 path))).coeff 2=
 cutCoeffA27 (X : ℤ[X]) X 1 (central28 path++[true]) 2+
 (1+X)*cutCoeffA27 (X : ℤ[X]) X 1 (central28 path++[true]) 1 := by
 rw [source_ambient_trace487]
 have h1 := cutCoeff_polynomialA27 (X : ℤ[X]) X 1 (central28 path++[true]) 1
 have h2 := cutCoeff_polynomialA27 (X : ℤ[X]) X 1 (central28 path++[true]) 2
 simp only [map_one] at h1 h2
 rw [cutEval_scalarA27] at h1 h2
 change (ambientScalar5c U V (central28 path)).coeff 1=_ at h1
 change (ambientScalar5c U V (central28 path)).coeff 2=_ at h2
 have he : (1+U*(1+V))*ambientScalar5c U V (central28 path)=
   ambientScalar5c U V (central28 path)+
   U*(C (1+X)*ambientScalar5c U V (central28 path)) := by simp [V]; ring
 rw [he,Polynomial.coeff_add]
 simp only [U,Polynomial.coeff_X_mul,Polynomial.coeff_C_mul]
 simpa only [U] using congrArg₂ (fun p q : ℤ[X] => q+(1+X)*p) h1 h2

theorem source_second_lower_formulaBF (path : List Bool) (n m k : ℕ) (ns : List ℕ)
 (hw : sourceWord28 path=(n::m::k::ns).flatMap lowerRun487) :
 cutCoeffA27 (X : ℤ[X]) X 1 (central28 path++[true]) 2=
 runScoreBF (n::m::k::ns)+runLBF (lowerMatrix487 n)*runLastBF (n::m::k::ns)-
 (1+X)*(runHsumBF (n::m::k::ns)-1-X) := by
 have h1 := source_first_cut_trace487 path
 have h2 := source_second_cut_traceBF path
 rw [hw,lower_trace_sum487 _ (by simp)] at h1
 rw [hw] at h2
 change (tr16 (runMatrixBF (n::m::k::ns))).coeff 2=_ at h2
 rw [run_trace_secondBF] at h2
 change runHsumBF (n::m::k::ns)=_ at h1
 linear_combination (1+X)*h1-h2

#print axioms run_summaryBF
#print axioms run_trace_secondBF
#print axioms run_trace_two_blocksBF
#print axioms source_second_lower_formulaBF
end
end MathGKM.Markov
