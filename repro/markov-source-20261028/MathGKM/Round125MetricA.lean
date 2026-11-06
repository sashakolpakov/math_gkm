import MathGKM.Round124ObstructionA

/- Machine-authored round125. Count matching edges absent from a fixed initial
matching. Every original elementary rule is retained, with arbitrary contexts. -/
namespace AugmentingR125
open PacketsR120 PacketStructureR121 LocalRetilingR76
open PacketsR120.Tile

def newCount (M : Finset ℕ) (v : ℕ) : List Tile → ℕ
  | [] => 0
  | D::xs => (if v ∈ M then 0 else 1)+newCount M (v+2) xs
  | _::xs => newCount M (v+1) xs

theorem newCount_append (M : Finset ℕ) (v : ℕ) (xs ys : List Tile) :
    newCount M v (xs++ys)=newCount M v xs+newCount M (v+width xs) ys := by
  induction xs generalizing v with
  | nil => simp [newCount,width]
  | cons x xs ih =>
    cases x <;> simp [newCount,width,ih,Nat.add_assoc,Nat.add_comm,Nat.add_left_comm]

theorem rule_width (a b : List Tile) (h : Rule a b) : width a=width b := by
  cases h with
  | uv => rfl
  | vu => rfl
  | split a b ha hb => rcases ha with rfl|rfl <;> rcases hb with rfl|rfl <;> rfl
  | join a b ha hb => rcases ha with rfl|rfl <;> rcases hb with rfl|rfl <;> rfl
  | slideR a ha => rcases ha with rfl|rfl <;> rfl
  | slideL a ha => rcases ha with rfl|rfl <;> rfl

theorem rule_newCount (M : Finset ℕ) (v : ℕ) (a b : List Tile)
    (h : Rule a b) : newCount M v b ≤ newCount M v a+1 := by
  cases h with
  | uv => simp [newCount]
  | vu => simp [newCount]
  | split a b ha hb =>
    rcases ha with rfl|rfl <;> rcases hb with rfl|rfl <;>
      simp [newCount] <;> split <;> omega
  | join a b ha hb =>
    rcases ha with rfl|rfl <;> rcases hb with rfl|rfl <;>
      simp [newCount] <;> split <;> omega
  | slideR a ha =>
    rcases ha with rfl|rfl <;> simp only [newCount,Nat.add_zero] <;>
      split <;> split <;> omega
  | slideL a ha =>
    rcases ha with rfl|rfl <;> simp only [newCount,Nat.add_zero] <;>
      split <;> split <;> omega

theorem contextual_newCount (M : Finset ℕ) (v : ℕ) (pre post a b : List Tile)
    (h : Rule a b) :
    newCount M v (pre++b++post) ≤ newCount M v (pre++a++post)+1 := by
  have hh := rule_newCount M (v+width pre) a b h
  simp only [newCount_append,width_append,rule_width a b h]
  omega

theorem newCount_eq (M : Finset ℕ) (v : ℕ) (xs : List Tile) :
    newCount M v xs=((decodeFrom v xs).1 \ M).card := by
  classical
  induction xs generalizing v with
  | nil => simp [newCount,decodeFrom]
  | cons x xs ih =>
    cases x with
    | D =>
      have hn : v ∉ (decodeFrom (v+2) xs).1 := by
        intro h; have := decode_lower xs (v+2) v h; omega
      by_cases hv : v ∈ M
      · simp [newCount,decodeFrom,hv,ih,Finset.insert_sdiff_of_mem]
      · have hd : v ∉ (decodeFrom (v+2) xs).1 \ M := fun h => hn (Finset.mem_sdiff.mp h).1
        simp [newCount,decodeFrom,hv,ih,Finset.insert_sdiff_of_notMem,
          Finset.card_insert_of_notMem hd,Nat.add_comm]
    | U => exact ih (v+1)
    | V => exact ih (v+1)

theorem edit_new_edges (N : ℕ) (M : Finset ℕ) (x y : Obj) (h : edit N x y) :
    (y.1 \ M).card ≤ (x.1 \ M).card+1 := by
  rcases h with ⟨_,_,pre,post,a,b,hr,_,_,hx,hy⟩
  rw [← hx,← hy]
  simpa only [decode,← newCount_eq] using contextual_newCount M 0 pre post a b hr

inductive Steps (N : ℕ) : ℕ → Obj → Obj → Prop where
  | refl (x) : Steps N 0 x x
  | tail {k x y z} : Steps N k x y → edit N y z → Steps N (k+1) x z

theorem steps_new_edges (N k : ℕ) (x y : Obj) (h : Steps N k x y) :
    (y.1 \ x.1).card ≤ k := by
  induction h with
  | refl x => simp
  | @tail k x y z hs he ih =>
    have hb := edit_new_edges N x.1 y z he
    omega

theorem steps_word {N k : ℕ} {x y : Obj} (h : Steps N k x y) :
    ∀ xs, width xs=N → decode xs=x → ∃ ys, width ys=N ∧ decode ys=y := by
  induction h with
  | refl x => intro xs hw hx; exact ⟨xs,hw,hx⟩
  | @tail k x y z hs he ih =>
    intro xs hw hx
    obtain ⟨ys,hy,hyx⟩ := ih xs hw hx
    rw [← hyx] at he
    obtain ⟨zs,_,hz,hzw⟩ := PacketObstructionR124.edit_mem N ys z hy he
    exact ⟨zs,hzw,hz⟩

def weightSum (W : ℕ → ℕ) (v : ℕ) : ℕ → ℕ
  | 0 => 0
  | n+1 => W v+weightSum W (v+1) n

theorem weighted_word_bound (N q : ℕ) (M : Finset ℕ) (W : ℕ → ℕ)
    (hedge : ∀ e, e+1<N → q≤W e+W (e+1)+(if e∈M then 0 else 1))
    (xs : List Tile) (v : ℕ) (hw : v+width xs≤N) :
    q*dimers xs ≤ weightSum W v (width xs)+newCount M v xs := by
  induction xs generalizing v with
  | nil => simp [dimers,width,weightSum,newCount]
  | cons x xs ih =>
    cases x with
    | D =>
      have ht := ih (v+2) (by simp only [width] at hw; omega)
      have he := hedge v (by simp only [width] at hw; omega)
      simp only [width,dimers,newCount]
      have hs : weightSum W v (2+width xs)=W v+W (v+1)+weightSum W (v+2) (width xs) := by
        rw [show 2+width xs=(width xs+1)+1 by omega]
        simp only [weightSum]
        simp [Nat.add_assoc]
      rw [hs,Nat.mul_add]
      simp only [Nat.mul_one]
      omega
    | U =>
      have ht := ih (v+1) (by simp only [width] at hw; omega)
      simp only [width,dimers,newCount]
      rw [show 1+width xs=width xs+1 by omega]
      simp only [weightSum]
      omega
    | V =>
      have ht := ih (v+1) (by simp only [width] at hw; omega)
      simp only [width,dimers,newCount]
      rw [show 1+width xs=width xs+1 by omega]
      simp only [weightSum]
      omega

end AugmentingR125
#print axioms AugmentingR125.edit_new_edges
#print axioms AugmentingR125.steps_new_edges
