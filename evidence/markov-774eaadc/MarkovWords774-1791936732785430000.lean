import MarkovWordJet774
import MarkovScaling16cb

/-! Machine-authored worker 774eaadc. Source Farey words and exact letter counts. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def wordMat774 {R : Type*} [CommRing R] (u v : R) : List Bool → Mat16 R
  | [] => ⟨1,0,0,1⟩
  | r::rs => mm16 (if r then matB16 u v else matA16 u v) (wordMat774 u v rs)

theorem mm_one_left774 {R : Type*} [CommRing R] (m : Mat16 R) :
    mm16 ⟨1,0,0,1⟩ m=m := by ext <;> simp [mm16]
theorem mm_one_right774 {R : Type*} [CommRing R] (m : Mat16 R) :
    mm16 m ⟨1,0,0,1⟩=m := by ext <;> simp [mm16]

theorem wordMat_append774 {R : Type*} [CommRing R] (u v : R) (w z : List Bool) :
    wordMat774 u v (w++z)=mm16 (wordMat774 u v w) (wordMat774 u v z) := by
  induction w with
  | nil => simp [wordMat774,mm_one_left774]
  | cons r rs ih => simp only [List.cons_append,wordMat774,ih,mm_assoc16]

def wordPairStep774 (xy : List Bool × List Bool) (r : Bool) :=
  if r then (xy.1++xy.2,xy.2) else (xy.1,xy.1++xy.2)

def WordPairValid774 (f : Frame) (xy : List Bool × List Bool) : Prop :=
  xy.1.length=f.lo.b ∧ xy.2.length=f.hi.b ∧
  xy.1.count true=f.lo.a ∧ xy.2.count true=f.hi.a ∧
  (∃ l, xy.1=false::l) ∧ (∃ h, xy.2=h++[true])

theorem wordPair_initial774 : WordPairValid774 initial ([false],[true]) := by
  refine ⟨rfl,rfl,rfl,rfl,⟨[],rfl⟩,⟨[],rfl⟩⟩

theorem wordPair_step774 {f : Frame} {xy : List Bool × List Bool}
    (hi : FrameIndices f) (h : WordPairValid774 f xy) (r : Bool) :
    WordPairValid774 (advance f r) (wordPairStep774 xy r) := by
  obtain ⟨lb,hb,la,ha,⟨l,hl⟩,⟨z,hz⟩⟩ := h
  have lm : (xy.1++xy.2).length=f.mid.b := by simp [lb,hb,hi.2.1]
  have am : (xy.1++xy.2).count true=f.mid.a := by simp [la,ha,hi.1]
  cases r
  · refine ⟨lb,lm,la,am,⟨l,hl⟩,⟨xy.1++z,?_⟩⟩
    simp [wordPairStep774,hz,List.append_assoc]
  · refine ⟨lm,hb,am,ha,⟨l++xy.2,?_⟩,⟨z,hz⟩⟩
    simp [wordPairStep774,hl]

theorem wordPair_fold_valid774 (path : List Bool) (f : Frame)
    (xy : List Bool × List Bool) (hi : FrameIndices f) (h : WordPairValid774 f xy) :
    WordPairValid774 (path.foldl advance f) (path.foldl wordPairStep774 xy) := by
  induction path generalizing f xy with
  | nil => exact h
  | cons r rs ih => exact ih _ _ (indices_advance hi r) (wordPair_step774 hi h r)

theorem wordPair_matrices774 {R : Type*} [CommRing R] (u v : R)
    (path : List Bool) (xy : List Bool × List Bool) :
    let ws := path.foldl wordPairStep774 xy
    (wordMat774 u v ws.1,wordMat774 u v ws.2)=
      path.foldl matPairStep16 (wordMat774 u v xy.1,wordMat774 u v xy.2) := by
  induction path generalizing xy with
  | nil => rfl
  | cons r rs ih =>
    rw [List.foldl_cons,List.foldl_cons]
    dsimp only at ih ⊢
    rw [ih]
    cases r <;> simp [wordPairStep774,matPairStep16,wordMat_append774]

theorem row_fold_matrix774 {R : Type*} [CommRing R] (x : R) (w : List Bool)
    (M : Mat16 (Polynomial R)) :
    w.foldl (rowStep774 x) (M.a,M.b)=
      let N := mm16 M (wordMat774 (C x*X) X w)
      (N.a,N.b) := by
  induction w generalizing M with
  | nil => simp [wordMat774,mm_one_right774]
  | cons r rs ih =>
    simp only [List.foldl_cons,row_matrix_step774,wordMat774]
    rw [ih,mm_assoc16]

theorem word_matrix_quotient774 {R : Type*} [CommRing R] (x : R) (w : List Bool) :
    (wordMat774 (C x*X) X (false::(w++[true]))).b=wordQuotient774 x w := by
  have hr := row_fold_matrix774 x w (matA16 (C x*X) X)
  change w.foldl (rowStep774 x) (1,1) = _ at hr
  rw [wordQuotient774,hr]
  simp only [wordMat774,if_false,wordMat_append774,if_true,mm_one_right774]
  rw [← mm_assoc16]
  simp [mm16,matB16]
  ring

/-- Every source middle word is A w B, with the exact source letter counts. -/
theorem source_word774 {R : Type*} [CommRing R] (x : R) (path : List Bool) :
    ∃ w : List Bool, w.length+2=(frame path).mid.b ∧
      w.count true+1=(frame path).mid.a ∧
      (qTree16 (C x) (1 : Polynomial R) X path).2.1=wordQuotient774 x w := by
  let xy := path.foldl wordPairStep774 ([false],[true])
  have hv := wordPair_fold_valid774 path initial ([false],[true])
    indices_initial wordPair_initial774
  change WordPairValid774 (frame path) xy at hv
  obtain ⟨lb,hb,la,ha,⟨l,hl⟩,⟨z,hz⟩⟩ := hv
  refine ⟨l++z,?_,?_,?_⟩
  · have h := (indices_frame path).2.1
    simp [hl,hz] at lb hb
    simp only [List.length_append]
    omega
  · have h := (indices_frame path).1
    simp [hl,hz] at la ha
    simp only [List.count_append]
    omega
  · rw [quotient_scaling16]
    simp only [one_mul]
    rw [quotient_matrix16]
    have he := wordPair_matrices774 (C x*X) X path ([false],[true])
    simp only [wordMat774,Bool.false_eq_true,if_false,if_true,mm_one_right774] at he
    change (wordMat774 (C x*X) X xy.1,wordMat774 (C x*X) X xy.2)=_ at he
    rw [← he]
    change (mm16 (wordMat774 (C x*X) X xy.1) (wordMat774 (C x*X) X xy.2)).b=_
    rw [← wordMat_append774,hl,hz]
    simpa [List.append_assoc] using word_matrix_quotient774 x (l++z)

#print axioms source_word774
end
end MathGKM.Markov
