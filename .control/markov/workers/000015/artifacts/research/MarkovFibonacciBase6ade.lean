import MarkovSmallVertical274
import MarkovTopLC1998

/-! Machine-authored request 6ade2697. Exact numerator-one source recurrence.
No assertion about other source fractions. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def fib6 : ℕ → BiPoly
  | 0 => 1
  | n+1 => (runMatrix025 n).b

theorem fib_zero6 : fib6 0=1 := rfl
theorem fib_one6 : fib6 1=U+V := by
  simp [fib6,runMatrix025,runBlock025,rawWord80,mm_one_right774,rawB18]
theorem fib_two6 : fib6 2=(U+V)^2+U := by
  simp [fib6,runMatrix025,runBlock025,rawWord80,mm_one_right774,rawB18,rawA18,mm16,S]
  ring

theorem fib_rec6 (n : ℕ) : fib6 (n+2)=S*fib6 (n+1)-V*fib6 n := by
  cases n with
  | zero => rw [fib_zero6,fib_one6,fib_two6]; unfold S; ring
  | succ n =>
    change (runMatrix025 (n+2)).b=S*(runMatrix025 (n+1)).b-V*(runMatrix025 n).b
    rw [show n+2=(n+1)+1 by omega,run_step025,run_step025,(ch_left16 _ _).1]
    simp only [tr16,det16,rawA18]
    unfold S
    ring

theorem spine_b6 (n : ℕ) : (frame (List.replicate n false)).mid.b=n+2 := by
  have hv := wordPair_fold_valid774 (List.replicate n false) initial
    ([false],runBlock025 0) indices_initial wordPair_initial774
  rw [false_fold025] at hv
  have hm := (indices_frame (List.replicate n false)).2.1
  obtain ⟨hl,hh,_,_,_,_⟩ := hv
  simp [runBlock025] at hl hh
  change 1=(frame (List.replicate n false)).lo.b at hl
  change n+1=(frame (List.replicate n false)).hi.b at hh
  omega

theorem source_fib6 (n : ℕ) : (frame (List.replicate n false)).mid.p=fib6 (n+2) := by
  rw [show (frame (List.replicate n false)).mid.p=
    (sourceMatrix025 (List.replicate n false)).b from raw_matrix18 _,source_spine_matrix274]
  rfl

theorem fib_degree6 (n : ℕ) : DegreeBound21a (fib6 n) n := by
  rcases n with _ | (_ | n)
  · exact degree_one_21a
  · rw [fib_one6]; exact degree_add_21a degree_U_21a degree_V_21a
  · rw [← source_fib6]
    have h := (degree_frame_21a (List.replicate n false)).2.1
    simpa [LabelDegree21a,left_spine_a274,spine_b6] using h

theorem fib_top6 (i j : ℕ) : coeff (fib6 (i+j)) i j=((i+j).choose i : ℤ) := by
  by_cases h : i+j<2
  · have hi : i≤1 := by omega
    have hj : j≤1 := by omega
    interval_cases i <;> interval_cases j <;>
      norm_num [fib_zero6,fib_one6,coeff,U,V] at *
  · obtain ⟨n,hn⟩ : ∃ n, i+j=n+2 := ⟨i+j-2,by omega⟩
    rw [hn,← source_fib6]
    have hh := top_raw_coeff1998 (List.replicate n false) i j
    simpa [left_spine_a274,spine_b6] using hh (by simp [left_spine_a274,spine_b6]; omega)

theorem fib_boundary6 (i k : ℕ) :
    coeff (fib6 (i+1+k)) (i+1) 0=((i+k).choose i : ℤ) := by
  by_cases h : i+k=0
  · have hi : i=0 := by omega
    have hk : k=0 := by omega
    subst i; subst k; simp [fib_one6,coeff,U,V]
  · obtain ⟨n,hn⟩ : ∃ n, i+1+k=n+2 := ⟨i+k-1,by omega⟩
    rw [hn,← source_fib6]
    have hh := congrArg (fun p : Polynomial ℝ => p.coeff (i+1))
      (boundary_formula (List.replicate n false))
    rw [edgeEval_coeff] at hh
    simp only [left_spine_a274,spine_b6,pow_one,Polynomial.coeff_X_mul] at hh
    rw [add_comm X 1,Polynomial.coeff_one_add_X_pow] at hh
    have he : n+2-1=i+k := by omega
    rw [he] at hh
    exact_mod_cast hh

theorem fib_axis6 (j k : ℕ) :
    coeff (fib6 (j+k)) 0 j=if k=0 then 1 else 0 := by
  by_cases hk : k=0
  · subst k; simpa using fib_top6 0 j
  · by_cases h : j+k<2
    · have hj : j=0 := by omega
      have he : k=1 := by omega
      subst j; subst k; simp [fib_one6,coeff,U,V]
    · obtain ⟨n,hn⟩ : ∃ n, j+k=n+2 := ⟨j+k-2,by omega⟩
      rw [hn,← source_fib6]
      unfold coeff
      rw [vertical_boundary_formula46]
      simp [left_spine_a274,spine_b6,hk,show j≠n+2 by omega]

theorem fib_coeff_rec6 (n i j : ℕ) :
    coeff (fib6 (n+2)) (i+1) (j+1)=
      coeff (fib6 (n+1)) i (j+1)+coeff (fib6 (n+1)) (i+1) j+
      coeff (fib6 (n+1)) (i+1) (j+1)-coeff (fib6 n) (i+1) j := by
  rw [fib_rec6]
  simp [S,add_mul,coeff,U,V,Polynomial.coeff_X_mul,Polynomial.coeff_C_mul]

#print axioms source_fib6
#print axioms fib_boundary6
#print axioms fib_axis6
end
end MathGKM.Markov
