import MarkovVerticalJet025

/-! Machine-authored request 02592c7b. Unconditional source-to-jet bridge,
retaining the exact first vertical coefficient polynomial. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def sourceMatrix025 (path : List Bool) : Mat16 BiPoly :=
  mm16 (path.foldl matPairStep16 (rawA18,rawB18)).1
    (path.foldl matPairStep16 (rawA18,rawB18)).2

theorem raw_valid_fold025 (path : List Bool) (f : Frame)
    (xy : Mat16 BiPoly × Mat16 BiPoly) (hi : FrameIndices f)
    (hv : MatValid16 U V f xy.1 xy.2) :
    MatValid16 U V (path.foldl advance f)
      (path.foldl matPairStep16 xy).1 (path.foldl matPairStep16 xy).2 := by
  induction path generalizing f xy with
  | nil => exact hv
  | cons r rs ih => exact ih _ _ (indices_advance hi r) (mat_valid_step16 U V hi hv r)

theorem sourceMatrix_trace025 (path : List Bool) :
    tr16 (sourceMatrix025 path)=S*(sourceMatrix025 path).b := by
  have h := raw_valid_fold025 path initial (rawA18,rawB18)
    indices_initial raw_initial18.2
  simpa [sourceMatrix025,S,add_comm,add_left_comm,add_assoc] using h.2.2.2.2

theorem sourceMatrix_det025 (path : List Bool) :
    det16 (sourceMatrix025 path)=U^(frame path).mid.a*V^(frame path).mid.b := by
  have h := raw_valid_fold025 path initial (rawA18,rawB18)
    indices_initial raw_initial18.2
  have hi := indices_frame path
  change MatValid16 U V (frame path) _ _ at h
  rw [sourceMatrix025,det_mul16,h.1,h.2.1,hi.1,hi.2.1,pow_add,pow_add]
  ring

theorem sourceMatrix_word025 (path : List Bool) :
    ∃ w : List Bool, sourceMatrix025 path=rawWord80 (w++[true]) := by
  let xy := path.foldl wordPairStep774 ([false],[true])
  have hv := wordPair_fold_valid774 path initial ([false],[true])
    indices_initial wordPair_initial774
  change WordPairValid774 (frame path) xy at hv
  obtain ⟨lb,hb,la,ha,⟨l,hl⟩,⟨z,hz⟩⟩ := hv
  refine ⟨xy.1++z,?_⟩
  have he := rawWord_pairs80 path ([false],[true])
  simp only [rawWord80,Bool.false_eq_true,if_false,if_true,mm_one_right774] at he
  change (rawWord80 xy.1,rawWord80 xy.2)=_ at he
  unfold sourceMatrix025
  rw [← he]
  change mm16 (rawWord80 xy.1) (rawWord80 xy.2)=_
  rw [← rawWord_append80,hz,List.append_assoc]

theorem rawWord_last_shape025 (w : List Bool) :
    ZeroShape025 (rawWord80 (w++[true])) := by
  have hc := (rawWord_zero46 w).2
  rw [rawWord_append80]
  simp [ZeroShape025,rawWord80,mm_one_right774,mm16,rawB18,S,U,V,
    Polynomial.coeff_add,Polynomial.mul_coeff_zero,Polynomial.coeff_one,hc]
  ring

theorem sourceMatrix_shape025 (path : List Bool) :
    ZeroShape025 (sourceMatrix025 path) := by
  obtain ⟨w,he⟩ := sourceMatrix_word025 path
  rw [he]; exact rawWord_last_shape025 w

theorem source_vertical_jet025 (path : List Bool) (ha : 2≤(frame path).mid.a) :
    (X+1)^2*((frame path).mid.p).coeff 1=
      columnJet025 (sourceMatrix025 path)-(sourceMatrix025 path).a.coeff 0 := by
  have hb : (sourceMatrix025 path).b.coeff 0≠0 := by
    rw [show (sourceMatrix025 path).b=(frame path).mid.p from (raw_matrix18 path).symm,
      vertical_boundary_formula46]
    exact mul_ne_zero (pow_ne_zero _ X_ne_zero)
      (pow_ne_zero _ (by simpa using X_add_C_ne_zero (1:ℤ)))
  have hd : (det16 (sourceMatrix025 path)).coeff 1=0 := by
    rw [sourceMatrix_det025]
    simp [U,V,← map_pow,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,
      show (frame path).mid.a≠1 by omega]
  have hh := vertical_jet_of_trace025 (sourceMatrix025 path)
    (sourceMatrix_shape025 path) hb (sourceMatrix_trace025 path) hd
  rwa [show (sourceMatrix025 path).b=(frame path).mid.p from (raw_matrix18 path).symm] at hh

#print axioms sourceMatrix_trace025
#print axioms sourceMatrix_det025
#print axioms source_vertical_jet025
end
end MathGKM.Markov
