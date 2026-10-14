import MarkovRawMatrix18
import MarkovWords774

/-! Machine-authored worker f80fb8bc. Rank-one plus diagonal model of the raw
source numerator. These identities do not assert coefficient log-concavity. -/
namespace MathGKM.Markov
noncomputable section

def gasH80 {R : Type*} [CommRing R] (u v : R) : Mat16 R := ⟨v,1,u*v,u⟩
def gasE80 {R : Type*} [CommRing R] (r : Bool) : Mat16 R :=
  if r then ⟨1,0,0,0⟩ else ⟨0,0,0,1⟩
def gasT80 {R : Type*} [CommRing R] (u v t : R) (r : Bool) : Mat16 R :=
  if r then ⟨v+t,1,u*v,u⟩ else ⟨v,1,u*v,u+t⟩
def gasWord80 {R : Type*} [CommRing R] (u v t : R) : List Bool → Mat16 R
  | [] => ⟨1,0,0,1⟩
  | r::rs => mm16 (gasT80 u v t r) (gasWord80 u v t rs)
def gasScalar80 {R : Type*} [CommRing R] (u v t : R) (w : List Bool) : R :=
  let m := gasWord80 u v t w
  v*m.a+u*v*m.b+m.c+u*m.d

theorem gasWord_append80 {R : Type*} [CommRing R] (u v t : R) (x y : List Bool) :
    gasWord80 u v t (x++y)=mm16 (gasWord80 u v t x) (gasWord80 u v t y) := by
  induction x with
  | nil => simp [gasWord80,mm_one_left774]
  | cons r rs ih => simp only [List.cons_append,gasWord80,ih,mm_assoc16]

theorem rawB_factor80 : rawB18=mm16 (gasT80 U V 1 false) (gasT80 U V 1 true) := by
  ext <;> simp [rawB18,gasT80,mm16,S] <;> ring

/-- Expand each original B to AC, preserving order. -/
def expand80 : List Bool → List Bool
  | [] => []
  | false::rs => false::expand80 rs
  | true::rs => false::true::expand80 rs

theorem expand_append80 (x y : List Bool) : expand80 (x++y)=expand80 x++expand80 y := by
  induction x with
  | nil => rfl
  | cons r rs ih => cases r <;> simp [expand80,ih]

def rawWord80 : List Bool → Mat16 BiPoly
  | [] => ⟨1,0,0,1⟩
  | r::rs => mm16 (if r then rawB18 else rawA18) (rawWord80 rs)

theorem rawWord_append80 (x y : List Bool) :
    rawWord80 (x++y)=mm16 (rawWord80 x) (rawWord80 y) := by
  induction x with
  | nil => simp [rawWord80,mm_one_left774]
  | cons r rs ih => simp only [List.cons_append,rawWord80,ih,mm_assoc16]

theorem rawWord_expand80 (w : List Bool) : rawWord80 w=gasWord80 U V 1 (expand80 w) := by
  induction w with
  | nil => rfl
  | cons r rs ih =>
    cases r
    · simpa [rawWord80,expand80,gasWord80,rawA18,gasT80] using
        congrArg (mm16 rawA18) ih
    · simp only [rawWord80,if_true,expand80,gasWord80,rawB_factor80,ih,mm_assoc16]

theorem rawWord_pairs80 (path : List Bool) (xy : List Bool × List Bool) :
    let ws := path.foldl wordPairStep774 xy
    (rawWord80 ws.1,rawWord80 ws.2)=
      path.foldl matPairStep16 (rawWord80 xy.1,rawWord80 xy.2) := by
  induction path generalizing xy with
  | nil => rfl
  | cons r rs ih =>
    rw [List.foldl_cons,List.foldl_cons]
    dsimp only at ih ⊢
    rw [ih]
    cases r <;> simp [wordPairStep774,matPairStep16,rawWord_append80]

theorem gas_boundary80 {R : Type*} [CommRing R] (u v t : R) (w : List Bool) :
    (gasWord80 u v t (false::(w++[true]))).b=gasScalar80 u v t w := by
  simp only [gasWord80,gasWord_append80]
  simp [gasWord80,gasScalar80,gasT80,mm16]
  ring

theorem expand_length80 (w : List Bool) :
    (expand80 w).length=w.length+w.count true := by
  induction w with
  | nil => rfl
  | cons r rs ih => cases r <;> simp [expand80,ih,List.count_cons] <;> omega

/-- Every actual source raw numerator is a scalar rank-one word partition
function, with an exact core length. No word balance is assumed. -/
theorem source_gas80 (path : List Bool) :
    ∃ w : List Bool, w.length+2=(frame path).mid.a+(frame path).mid.b ∧
      (frame path).mid.p=gasScalar80 U V 1 w := by
  let xy := path.foldl wordPairStep774 ([false],[true])
  have hv := wordPair_fold_valid774 path initial ([false],[true])
    indices_initial wordPair_initial774
  change WordPairValid774 (frame path) xy at hv
  obtain ⟨lb,hb,la,ha,⟨l,hl⟩,⟨z,hz⟩⟩ := hv
  refine ⟨expand80 (l++z)++[false],?_,?_⟩
  · have hm := (indices_frame path).1
    have hn := (indices_frame path).2.1
    simp [hl,hz] at lb hb la ha
    simp [expand_length80]
    omega
  · rw [raw_matrix18]
    have he := rawWord_pairs80 path ([false],[true])
    simp only [rawWord80,if_false,if_true,mm_one_right774] at he
    change (rawWord80 xy.1,rawWord80 xy.2)=_ at he
    rw [← he]
    change (mm16 (rawWord80 xy.1) (rawWord80 xy.2)).b=_
    rw [← rawWord_append80,rawWord_expand80,hl,hz]
    simpa [expand80,expand_append80,List.append_assoc] using
      gas_boundary80 U V (1 : BiPoly) (expand80 (l++z)++[false])

#print axioms source_gas80
end
end MathGKM.Markov
