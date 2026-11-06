import MathGKM.Round126DistanceA

/- Machine-authored round127. Symbolic propagation under the unchanged rules. -/
namespace PropagatingR127
open PacketsR120 PacketStructureR121 LocalRetilingR76 AugmentingR125
open UniformDistanceR126
open PacketsR120.Tile

theorem U_bounds (xs : List Tile) (v e : ℕ)
    (he : e ∈ (decodeFrom v xs).2) : v≤e ∧ e<v+width xs := by
  induction xs generalizing v with
  | nil => simpa [decodeFrom] using he
  | cons x xs ih =>
    cases x with
    | D => have := ih (v+2) he; simp only [width]; omega
    | V => have := ih (v+1) he; simp only [width]; omega
    | U =>
      simp only [decodeFrom,Finset.mem_insert] at he
      rcases he with rfl|he
      · simp only [width]; omega
      · have := ih (v+1) he; simp only [width]; omega

theorem U_disjoint (xs : List Tile) (v e : ℕ)
    (he : e ∈ (decodeFrom v xs).2) :
    e ∉ (decodeFrom v xs).1 ∧ ∀ d ∈ (decodeFrom v xs).1, d+1≠e := by
  induction xs generalizing v with
  | nil => simpa [decodeFrom] using he
  | cons x xs ih =>
    cases x with
    | V => exact ih (v+1) he
    | D =>
      have hl := (U_bounds xs (v+2) e he).1
      have ht := ih (v+2) he
      simp only [decodeFrom,Finset.mem_insert,not_or]
      refine ⟨⟨by omega,ht.1⟩,?_⟩
      intro d hd
      rcases hd with rfl|hd
      · omega
      · exact ht.2 d hd
    | U =>
      simp only [decodeFrom,Finset.mem_insert] at he
      rcases he with rfl|he
      · constructor
        · intro hm; have := decode_lower xs (e+1) e hm; omega
        · intro d hd; have := decode_lower xs (e+1) d hd; omega
      · exact ih (v+1) he

theorem valid_decode (xs : List Tile) : valid (width xs) (decode xs) := by
  refine ⟨by simpa [decode] using decode_match xs 0,?_⟩
  intro e he
  have hb := U_bounds xs 0 e he
  have hd := U_disjoint xs 0 e he
  simp only [decode,ColorFibersR66.uncovered,Finset.mem_sdiff,
    Finset.mem_range,Finset.mem_union,Finset.mem_image,not_or]
  refine ⟨by omega,hd.1,?_⟩
  rintro ⟨d,hm,heq⟩
  exact hd.2 d hm heq

inductive WordSteps : ℕ → List Tile → List Tile → Prop where
  | refl (xs) : WordSteps 0 xs xs
  | tail {k xs ys} (pre post a b) : WordSteps k xs ys →
      Rule a b → ys=pre++a++post → WordSteps (k+1) xs (pre++b++post)

theorem word_width {k : ℕ} {xs ys : List Tile} (h : WordSteps k xs ys) :
    width xs=width ys := by
  induction h with
  | refl => rfl
  | tail pre post a b hs hr he ih =>
    rw [ih,he]
    simp only [width_append,rule_width a b hr]

theorem word_trans {k l : ℕ} {xs ys zs : List Tile}
    (h : WordSteps k xs ys) (g : WordSteps l ys zs) : WordSteps (k+l) xs zs := by
  induction g with
  | refl => simpa using h
  | tail pre post a b hs hr he ih =>
    simpa [Nat.add_assoc] using WordSteps.tail pre post a b (ih h) hr he

theorem word_steps {k N : ℕ} {xs ys : List Tile} (h : WordSteps k xs ys)
    (hw : width xs=N) : Steps N k (decode xs) (decode ys) := by
  induction h with
  | refl => exact Steps.refl _
  | @tail k xs ys pre post a b hs hr he ih =>
    have hys : width ys=N := (word_width hs).symm.trans hw
    have hz : width (pre++b++post)=N := by
      rw [he] at hys
      simpa only [width_append,rule_width a b hr] using hys
    apply Steps.tail (ih hw)
    refine ⟨?_,?_,pre,post,a,b,hr,?_,hz,?_,rfl⟩
    · simpa only [hys] using valid_decode ys
    · simpa only [hz] using valid_decode (pre++b++post)
    · simpa only [← he] using hys
    · exact congrArg decode he.symm

theorem slide_many (k : ℕ) (pre post : List Tile) :
    WordSteps k (pre++[V]++List.replicate k D++post)
      (pre++List.replicate k D++[V]++post) := by
  induction k generalizing pre with
  | zero => simpa using WordSteps.refl (pre++[V]++post)
  | succ k ih =>
    have h1 : WordSteps 1 (pre++[V]++List.replicate (k+1) D++post)
        ((pre++[D])++[V]++List.replicate k D++post) := by
      convert WordSteps.tail pre (List.replicate k D++post) [V,D] [D,V]
        (WordSteps.refl (pre++[V,D]++(List.replicate k D++post)))
        (Rule.slideL V (Or.inr rfl)) rfl using 1 <;>
        simp [List.replicate_succ,List.append_assoc]
    have h2 := word_trans h1 (ih (pre++[D]))
    convert h2 using 1 <;>
      simp [List.replicate_succ,List.append_assoc,Nat.add_comm]

def lowEndWord (h : ℕ) : List Tile :=
  [V]++List.replicate (6*h+4) D++[V,U,U]++List.replicate (4*h-3) D
def highEndWord (h : ℕ) : List Tile :=
  List.replicate (2*h-1) D++[V]++List.replicate (4*h+2) D++[V]++
    List.replicate (2*h) D++[V]++List.replicate (2*h) D++[V]
def endpoint (h : ℕ) : Pair := (decode (lowEndWord h),decode (highEndWord h))

end PropagatingR127
#print axioms PropagatingR127.valid_decode
#print axioms PropagatingR127.slide_many
